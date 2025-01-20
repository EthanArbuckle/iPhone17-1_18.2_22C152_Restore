@interface VNFaceLandmarks
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserFacingBBoxEquivalentToAlignedBBox;
- (CGRect)userFacingBBox;
- (NSData)pointsData;
- (VNConfidence)confidence;
- (VNFaceLandmarks)initWithCoder:(id)a3;
- (VNFaceLandmarks)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (_Geometry2D_rect2D_)alignedBBox;
- (id)description;
- (unint64_t)hash;
- (unint64_t)pointCount;
- (unint64_t)requestRevision;
- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceLandmarks

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);

  objc_storeStrong((id *)&self->_pointsData, 0);
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (CGRect)userFacingBBox
{
  objc_copyStruct(v6, &self->_userFacingBBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_Geometry2D_rect2D_)alignedBBox
{
  objc_copyStruct(v6, &self->_alignedBBox, 16, 1, 0);
  float v2 = *(float *)v6;
  float v3 = *(float *)&v6[1];
  float v4 = *(float *)&v6[2];
  float v5 = *(float *)&v6[3];
  result.size.width = v5;
  result.size.height = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSData)pointsData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (VNConfidence)confidence
{
  return self->_confidence;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)VNFaceLandmarks;
  float v4 = [(VNFaceLandmarks *)&v7 description];
  float v5 = (void *)[v3 initWithFormat:@"%@ pointCount=%lu requestRevision=%lu", v4, -[VNFaceLandmarks pointCount](self, "pointCount"), -[VNFaceLandmarks requestRevision](self, "requestRevision")];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  float v4 = (VNFaceLandmarks *)a3;
  if (self == v4)
  {
    char v33 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v5 = v4;
      [(VNFaceLandmarks *)self confidence];
      float v7 = v6;
      [(VNFaceLandmarks *)v5 confidence];
      if (v7 != v8) {
        goto LABEL_16;
      }
      [(VNFaceLandmarks *)self userFacingBBox];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(VNFaceLandmarks *)v5 userFacingBBox];
      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v19;
      v42.size.height = v20;
      v41.origin.x = v10;
      v41.origin.y = v12;
      v41.size.width = v14;
      v41.size.height = v16;
      if (!CGRectEqualToRect(v41, v42)) {
        goto LABEL_16;
      }
      [(VNFaceLandmarks *)self alignedBBox];
      float v22 = v21;
      float v24 = v23;
      float v26 = v25;
      float v28 = v27;
      [(VNFaceLandmarks *)v5 alignedBBox];
      char v33 = 0;
      if (v22 != v29) {
        goto LABEL_17;
      }
      if (v24 != v30) {
        goto LABEL_17;
      }
      char v33 = 0;
      if (v28 != v32 || v26 != v31) {
        goto LABEL_17;
      }
      unint64_t v34 = [(VNFaceLandmarks *)self pointCount];
      if (v34 != [(VNFaceLandmarks *)v5 pointCount]) {
        goto LABEL_16;
      }
      v35 = [(VNFaceLandmarks *)self pointsData];
      v36 = [(VNFaceLandmarks *)v5 pointsData];
      char v37 = VisionCoreEqualOrNilObjects();

      if (v37)
      {
        v38 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
        v39 = [(VNFaceLandmarks *)v5 originatingRequestSpecifier];
        char v33 = [v38 isEqual:v39];
      }
      else
      {
LABEL_16:
        char v33 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v33 = 0;
  }
LABEL_18:

  return v33;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_pointsData hash] ^ __ROR8__(self->_pointCount, 51);
  float confidence = self->_confidence;
  uint64_t v5 = LODWORD(confidence);
  if (confidence == 0.0) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 ^ __ROR8__(v3, 51);
  double x = self->_userFacingBBox.origin.x;
  if (x == 0.0) {
    double x = 0.0;
  }
  double y = self->_userFacingBBox.origin.y;
  if (y == 0.0) {
    double y = 0.0;
  }
  uint64_t v9 = *(void *)&y ^ __ROR8__(*(void *)&x, 51);
  double width = self->_userFacingBBox.size.width;
  if (width == 0.0) {
    double width = 0.0;
  }
  uint64_t v11 = *(void *)&width ^ __ROR8__(v9, 51);
  double height = self->_userFacingBBox.size.height;
  if (height == 0.0) {
    double height = 0.0;
  }
  uint64_t v13 = *(void *)&height ^ __ROR8__(v11, 51) ^ __ROR8__(v6, 51);
  float v14 = self->_alignedBBox.origin.y;
  float v15 = self->_alignedBBox.size.height;
  float v16 = self->_alignedBBox.size.width;
  unint64_t v17 = (unint64_t)LODWORD(self->_alignedBBox.origin.x) << 13;
  if (self->_alignedBBox.origin.x == 0.0) {
    unint64_t v17 = 0;
  }
  uint64_t v18 = LODWORD(v14);
  if (v14 == 0.0) {
    uint64_t v18 = 0;
  }
  unint64_t v19 = v17 ^ v18;
  uint64_t v20 = LODWORD(v16);
  if (v16 == 0.0) {
    uint64_t v20 = 0;
  }
  unint64_t v21 = v20 ^ (v19 << 13);
  uint64_t v22 = LODWORD(v15);
  if (v15 == 0.0) {
    uint64_t v22 = 0;
  }
  return [(VNRequestSpecifier *)self->_originatingRequestSpecifier hash] ^ __ROR8__(v22 ^ __ROR8__(v21, 51) ^ __ROR8__(v13, 51), 51);
}

- (VNFaceLandmarks)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8
{
  float width = a7.size.width;
  float height = a7.size.height;
  float y = a7.origin.y;
  float x = a7.origin.x;
  CGFloat v12 = a6.size.height;
  CGFloat v13 = a6.size.width;
  CGFloat v14 = a6.origin.y;
  CGFloat v15 = a6.origin.x;
  id v20 = a3;
  id v21 = a4;
  if (v21
    && (v27.receiver = self,
        v27.super_class = (Class)VNFaceLandmarks,
        (self = [(VNFaceLandmarks *)&v27 init]) != 0)
    && (uint64_t v22 = [v21 length], v22 == objc_msgSend((id)objc_opt_class(), "landmarkPointSizeInBytes") * a5))
  {
    self->_pointCount = a5;
    float v23 = (NSData *)[v21 copy];
    pointsData = self->_pointsData;
    self->_pointsData = v23;

    self->_userFacingBBox.origin.float x = v15;
    self->_userFacingBBox.origin.float y = v14;
    self->_userFacingBBox.size.float width = v13;
    self->_userFacingBBox.size.float height = v12;
    self->_alignedBBox.origin.float x = x;
    self->_alignedBBox.origin.float y = y;
    self->_alignedBBox.size.float height = height;
    self->_alignedBBox.size.float width = width;
    self->_float confidence = a8;
    objc_storeStrong((id *)&self->_originatingRequestSpecifier, a3);
    self = self;
    float v25 = self;
  }
  else
  {
    float v25 = 0;
  }

  return v25;
}

- (BOOL)isUserFacingBBoxEquivalentToAlignedBBox
{
  [(VNFaceLandmarks *)self userFacingBBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VNFaceLandmarks *)self alignedBBox];
  return vabdd_f64(v14, v4) < 0.0000999999975
      && vabdd_f64(v11, v6) < 0.0000999999975
      && vabdd_f64(v13, v8) < 0.0000999999975
      && vabdd_f64(v12, v10) < 0.0000999999975;
}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt32:0 forKey:@"VNFaceLandmarks"];
  *(float *)&double v4 = self->_confidence;
  [v5 encodeFloat:@"FLMs_Conf" forKey:v4];
  [v5 encodeInteger:self->_pointCount forKey:@"FLMs_PtsCnt"];
  [v5 encodeObject:self->_pointsData forKey:@"FLMs_PtsData"];
  [v5 encodeDouble:@"FLMs_AlgnBBoxX" forKey:self->_alignedBBox.origin.x];
  [v5 encodeDouble:@"FLMs_AlgnBBoxY" forKey:self->_alignedBBox.origin.y];
  [v5 encodeDouble:@"FLMs_AlgnBBoxW" forKey:self->_alignedBBox.size.width];
  [v5 encodeDouble:@"FLMs_AlgnBBoxH" forKey:self->_alignedBBox.size.height];
  [v5 encodeDouble:@"FLMs_UsrFacingBBoxX" forKey:self->_userFacingBBox.origin.x];
  [v5 encodeDouble:@"FLMs_UsrFacingBBoxY" forKey:self->_userFacingBBox.origin.y];
  [v5 encodeDouble:@"FLMs_UsrFacingBBoxW" forKey:self->_userFacingBBox.size.width];
  [v5 encodeDouble:@"FLMs_UsrFacingBBoxH" forKey:self->_userFacingBBox.size.height];
  [v5 encodeObject:self->_originatingRequestSpecifier forKey:@"FLMs_OReq"];
}

- (VNFaceLandmarks)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"VNFaceLandmarks"];
  if (v5)
  {
    double v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarks object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   0,
                   v5);
    double v7 = +[VNError errorForInternalErrorWithLocalizedDescription:v6];
    [v4 failWithError:v7];
LABEL_8:

LABEL_9:
    char v33 = 0;
    goto LABEL_10;
  }
  [v4 decodeFloatForKey:@"FLMs_Conf"];
  int v9 = v8;
  uint64_t v10 = [v4 decodeIntegerForKey:@"FLMs_PtsCnt"];
  double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FLMs_PtsData"];
  float v11 = objc_opt_class();
  uint64_t v12 = [v6 length];
  if (v12 != [v11 landmarkPointSizeInBytes] * v10)
  {
    double v7 = (void *)[[NSString alloc] initWithFormat:@"Data integrity check failed when unarchiving an object of type: %@", v11];
    unint64_t v34 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v34];
    goto LABEL_7;
  }
  [v4 decodeDoubleForKey:@"FLMs_AlgnBBoxX"];
  double v44 = v13;
  [v4 decodeDoubleForKey:@"FLMs_AlgnBBoxY"];
  double v15 = v14;
  [v4 decodeDoubleForKey:@"FLMs_AlgnBBoxW"];
  double v17 = v16;
  [v4 decodeDoubleForKey:@"FLMs_AlgnBBoxH"];
  double v19 = v18;
  [v4 decodeDoubleForKey:@"FLMs_UsrFacingBBoxX"];
  double v21 = v20;
  [v4 decodeDoubleForKey:@"FLMs_UsrFacingBBoxY"];
  double v23 = v22;
  [v4 decodeDoubleForKey:@"FLMs_UsrFacingBBoxW"];
  double v25 = v24;
  [v4 decodeDoubleForKey:@"FLMs_UsrFacingBBoxH"];
  double v27 = v26;
  float v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FLMs_OReq"];
  if (!v28)
  {
    if (([v4 containsValueForKey:@"FLMs_Rev"] & 1) == 0)
    {
      double v7 = +[VNError errorWithCode:6 message:@"could not decode originating request"];
      [v4 failWithError:v7];
      goto LABEL_8;
    }
    uint64_t v36 = [v4 decodeIntegerForKey:@"FLMs_Rev"];
    double v7 = [(id)objc_opt_class() defaultOriginatingRequestClassNameForRequestRevision:v36];
    if (!v7)
    {
      v38 = NSString;
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      CGRect v41 = [v38 stringWithFormat:@"%@ does not provide a default originating request class", v40];

      CGRect v42 = +[VNError errorForInternalErrorWithLocalizedDescription:v41];
      [v4 failWithError:v42];

      goto LABEL_9;
    }
    id v45 = 0;
    float v28 = +[VNRequestSpecifier specifierForRequestClassName:v7 revision:v36 error:&v45];
    id v37 = v45;
    unint64_t v34 = v37;
    if (v28)
    {

      goto LABEL_5;
    }
    [v4 failWithError:v37];
LABEL_7:

    goto LABEL_8;
  }
LABEL_5:
  *(float *)&double v29 = v44;
  *(float *)&double v30 = v15;
  *(float *)&double v32 = v17;
  *(float *)&double v31 = v19;
  LODWORD(v43) = v9;
  self = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](self, "initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:", v28, v6, v10, v21, v23, v25, v27, v29, v30, v31, v32, v43);

  char v33 = self;
LABEL_10:

  return v33;
}

- (unint64_t)requestRevision
{
  float v2 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestRevision];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

@end