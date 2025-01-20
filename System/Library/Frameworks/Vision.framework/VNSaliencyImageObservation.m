@interface VNSaliencyImageObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (CGRect)narrowedBoundingBox;
- (NSArray)salientObjects;
- (VNSaliencyImageObservation)initWithCoder:(id)a3;
- (VNSaliencyImageObservation)initWithOriginatingRequestSpecifier:(id)a3 rawSaliencyImage:(__CVBuffer *)a4 originalImageSize:(CGSize)a5 salientObjectBoundingBoxes:(id)a6;
- (__CVBuffer)createSaliencyImageAndReturnError:(id *)a3;
- (id)salientObjectsAndReturnError:(id *)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)_computeBoundingBoxes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNSaliencyImageObservation

- (void).cxx_destruct
{
}

- (CGRect)narrowedBoundingBox
{
  p_mComputeBoundingBoxesLock = &self->_mComputeBoundingBoxesLock;
  os_unfair_lock_lock(&self->_mComputeBoundingBoxesLock);
  if (CGRectIsNull(self->_mHighlySalientRegion)) {
    [(VNSaliencyImageObservation *)self _computeBoundingBoxes];
  }
  os_unfair_lock_unlock(p_mComputeBoundingBoxesLock);
  double x = self->_mHighlySalientRegion.origin.x;
  double y = self->_mHighlySalientRegion.origin.y;
  double width = self->_mHighlySalientRegion.size.width;
  double height = self->_mHighlySalientRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)boundingBox
{
  p_mComputeBoundingBoxesLock = &self->_mComputeBoundingBoxesLock;
  os_unfair_lock_lock(&self->_mComputeBoundingBoxesLock);
  if (CGRectIsNull(self->_mSalientRegion)) {
    [(VNSaliencyImageObservation *)self _computeBoundingBoxes];
  }
  os_unfair_lock_unlock(p_mComputeBoundingBoxesLock);
  double x = self->_mSalientRegion.origin.x;
  double y = self->_mSalientRegion.origin.y;
  double width = self->_mSalientRegion.size.width;
  double height = self->_mSalientRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)salientObjects
{
  return self->_mSalientObjects;
}

- (void)_computeBoundingBoxes
{
  v3 = [(VNPixelBufferObservation *)self pixelBuffer];
  LODWORD(v4) = 1022739087;
  LODWORD(v5) = 4.0;
  LODWORD(v6) = 1022739087;
  +[VNHeatMapUtilities boundingBoxesFromFloat32PixelBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:](VNHeatMapUtilities, "boundingBoxesFromFloat32PixelBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:", v3, &unk_1EF7A7CE8, 1, 1, 0, self->_mOriginalImageSize.width, self->_mOriginalImageSize.height, v4, v6, v5);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if ([v12 count] == 2)
  {
    v7 = [v12 objectAtIndexedSubscript:0];
    [v7 getValue:&self->_mSalientRegion size:32];

    v8 = [v12 objectAtIndexedSubscript:1];
    [v8 getValue:&self->_mHighlySalientRegion size:32];
  }
  else
  {
    uint64_t v9 = MEMORY[0x1E4F1DB20];
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_mSalientRegion.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_mSalientRegion.size = v10;
    CGSize v11 = *(CGSize *)(v9 + 16);
    self->_mHighlySalientRegion.origin = *(CGPoint *)v9;
    self->_mHighlySalientRegion.size = v11;
  }
}

- (id)salientObjectsAndReturnError:(id *)a3
{
  return self->_mSalientObjects;
}

- (__CVBuffer)createSaliencyImageAndReturnError:(id *)a3
{
  v3 = [(VNPixelBufferObservation *)self pixelBuffer];

  return CVPixelBufferRetain(v3);
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNSaliencyImageObservation;
  id v3 = [(VNPixelBufferObservation *)&v7 hash];
  double width = self->_mOriginalImageSize.width;
  if (width == 0.0) {
    double width = 0.0;
  }
  double height = self->_mOriginalImageSize.height;
  if (height == 0.0) {
    double height = 0.0;
  }
  return *(void *)&height ^ __ROR8__(*(void *)&width, 51) ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)VNSaliencyImageObservation;
  BOOL v5 = [(VNPixelBufferObservation *)&v7 isEqual:v4]
    && self->_mOriginalImageSize.height == v4[19]
    && self->_mOriginalImageSize.width == v4[18];

  return v5;
}

- (id)vn_cloneObject
{
  v10.receiver = self;
  v10.super_class = (Class)VNSaliencyImageObservation;
  uint64_t v3 = [(VNPixelBufferObservation *)&v10 vn_cloneObject];
  double v4 = (void *)v3;
  if (v3)
  {
    CGSize size = self->_mSalientRegion.size;
    *(CGPoint *)(v3 + 160) = self->_mSalientRegion.origin;
    *(CGSize *)(v3 + 176) = size;
    CGSize v6 = self->_mHighlySalientRegion.size;
    *(CGPoint *)(v3 + 192) = self->_mHighlySalientRegion.origin;
    *(CGSize *)(v3 + 208) = v6;
    *(CGSize *)(v3 + 144) = self->_mOriginalImageSize;
    uint64_t v7 = [(NSArray *)self->_mSalientObjects copy];
    v8 = (void *)v4[29];
    v4[29] = v7;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1A6257080]();
  v6.receiver = self;
  v6.super_class = (Class)VNSaliencyImageObservation;
  [(VNPixelBufferObservation *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:&unk_1EF7A7070 forKey:@"VNSaliencyImageObservation"];
  [v4 encodeDouble:@"OISW" forKey:self->_mOriginalImageSize.width];
  [v4 encodeDouble:@"OISH" forKey:self->_mOriginalImageSize.height];
  [v4 encodeObject:self->_mSalientObjects forKey:@"SOBJ"];
  [v4 encodeDouble:@"BBOX" forKey:self->_mSalientRegion.origin.x];
  [v4 encodeDouble:@"BBOY" forKey:self->_mSalientRegion.origin.y];
  [v4 encodeDouble:@"BBSW" forKey:self->_mSalientRegion.size.width];
  [v4 encodeDouble:@"BBSH" forKey:self->_mSalientRegion.size.height];
  self = (VNSaliencyImageObservation *)((char *)self + 192);
  [v4 encodeDouble:@"NBBOX" forKey:*(double *)&self->super.super.super.isa];
  [v4 encodeDouble:@"NBBOY" forKey:*(double *)&self->super.super._originatingRequestSpecifier];
  [v4 encodeDouble:@"NBBSW" forKey:*(double *)&self->super.super._confidence];
  [v4 encodeDouble:@"NBBSH" forKey:*(double *)&self->super.super._uuid];
}

- (VNSaliencyImageObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNSaliencyImageObservation;
  BOOL v5 = [(VNPixelBufferObservation *)&v25 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNSaliencyImageObservation"];
    if ([v6 intValue] != 1)
    {

      v23 = 0;
      goto LABEL_6;
    }
    [v4 decodeDoubleForKey:@"OISW"];
    CGFloat v8 = v7;
    [v4 decodeDoubleForKey:@"OISH"];
    v5->_mOriginalImageSize.double width = v8;
    v5->_mOriginalImageSize.double height = v9;
    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"SOBJ"];
    mSalientObjects = v5->_mSalientObjects;
    v5->_mSalientObjects = (NSArray *)v13;

    [v4 decodeDoubleForKey:@"BBOX"];
    v5->_mSalientRegion.origin.double x = v15;
    [v4 decodeDoubleForKey:@"BBOY"];
    v5->_mSalientRegion.origin.double y = v16;
    [v4 decodeDoubleForKey:@"BBSW"];
    v5->_mSalientRegion.size.double width = v17;
    [v4 decodeDoubleForKey:@"BBSH"];
    v5->_mSalientRegion.size.double height = v18;
    [v4 decodeDoubleForKey:@"NBBOX"];
    v5->_mHighlySalientRegion.origin.double x = v19;
    [v4 decodeDoubleForKey:@"NBBOY"];
    v5->_mHighlySalientRegion.origin.double y = v20;
    [v4 decodeDoubleForKey:@"NBBSW"];
    v5->_mHighlySalientRegion.size.double width = v21;
    [v4 decodeDoubleForKey:@"NBBSH"];
    v5->_mHighlySalientRegion.size.double height = v22;
  }
  v23 = v5;
LABEL_6:

  return v23;
}

- (VNSaliencyImageObservation)initWithOriginatingRequestSpecifier:(id)a3 rawSaliencyImage:(__CVBuffer *)a4 originalImageSize:(CGSize)a5 salientObjectBoundingBoxes:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VNSaliencyImageObservation;
  uint64_t v13 = [(VNPixelBufferObservation *)&v21 initWithOriginatingRequestSpecifier:v11 featureName:0 CVPixelBuffer:a4];
  v14 = v13;
  if (v13)
  {
    v13->_mOriginalImageSize.CGFloat width = width;
    v13->_mOriginalImageSize.CGFloat height = height;
    CGFloat v15 = (CGPoint *)MEMORY[0x1E4F1DB20];
    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v13->_mSalientRegion.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v13->_mSalientRegion.CGSize size = v16;
    CGSize v17 = (CGSize)v15[1];
    v13->_mHighlySalientRegion.origin = *v15;
    v13->_mHighlySalientRegion.CGSize size = v17;
    uint64_t v18 = [v12 copy];
    mSalientObjects = v14->_mSalientObjects;
    v14->_mSalientObjects = (NSArray *)v18;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end