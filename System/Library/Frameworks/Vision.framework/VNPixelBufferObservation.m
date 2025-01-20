@interface VNPixelBufferObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)croppedBoundingBox;
- (CVPixelBufferRef)pixelBuffer;
- (NSString)featureName;
- (VNPixelBufferObservation)initWithCoder:(id)a3;
- (VNPixelBufferObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 CVPixelBuffer:(__CVBuffer *)a5;
- (__CVBuffer)createPixelBufferInOrientation:(unsigned int)a3 error:(id *)a4;
- (id)debugQuickLookObject;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPixelBufferObservation

- (void).cxx_destruct
{
}

- (CGRect)croppedBoundingBox
{
  double x = self->_croppedBoundingBox.origin.x;
  double y = self->_croppedBoundingBox.origin.y;
  double width = self->_croppedBoundingBox.size.width;
  double height = self->_croppedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (CVPixelBufferRef)pixelBuffer
{
  return self->_pixelBuffer;
}

- (id)debugQuickLookObject
{
  v14[1] = *MEMORY[0x1E4F143B8];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  if (PixelFormatType - 1278226488 > 0x30
    || ((1 << (PixelFormatType - 56)) & 0x1400000000001) == 0)
  {
    v11 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:self->_pixelBuffer];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1E050] imageWithCVImageBuffer:self->_pixelBuffer];
    v6 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    v13 = @"inputBVector";
    v14[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v8 = [v5 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v7];

    v9 = [MEMORY[0x1E4F1E018] context];
    [v8 extent];
    v10 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:", v8);
    v11 = VNDebugImageFromCGImage((uint64_t)v10);
    CGImageRelease(v10);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNPixelBufferObservation;
  BOOL v5 = [(VNObservation *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[VNCVPixelBufferConversionHelpers isCVPixelBuffer:self->_pixelBuffer equalToCVPixelBuffer:v4[12]];

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferObservation;
  return +[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:self->_pixelBuffer] ^ __ROR8__([(VNObservation *)&v3 hash], 51);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)VNPixelBufferObservation;
  v4 = [(VNObservation *)&v9 description];
  [v3 appendString:v4];

  uint64_t v5 = [(VNPixelBufferObservation *)self featureName];
  v6 = (void *)v5;
  if (v5) {
    [v3 appendFormat:@" \"%@\"", v5];
  }
  objc_super v7 = (__CFString *)CFCopyDescription(self->_pixelBuffer);
  [v3 appendFormat:@" %@", v7];

  return v3;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNPixelBufferObservation;
  id v3 = [(VNObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    v3[12] = CVPixelBufferRetain(self->_pixelBuffer);
    uint64_t v4 = [(NSString *)self->_featureName copy];
    uint64_t v5 = (void *)v3[13];
    v3[13] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNPixelBufferObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodePixelBuffer:forKey:", self->_pixelBuffer, @"vnpbo_pbdict");
  [v4 encodeObject:self->_featureName forKey:@"featureName"];
}

- (VNPixelBufferObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNPixelBufferObservation;
  objc_super v5 = [(VNObservation *)&v12 initWithCoder:v4];
  if (v5
    && (uint64_t v6 = objc_msgSend(v4, "vn_decodePixelBufferForKey:", @"vnpbo_pbdict"),
        (v5->_pixelBuffer = (__CVBuffer *)v6) != 0))
  {
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureName"];
    uint64_t v8 = [v7 copy];
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v8;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)VNPixelBufferObservation;
  [(VNPixelBufferObservation *)&v3 dealloc];
}

- (VNPixelBufferObservation)initWithOriginatingRequestSpecifier:(id)a3 featureName:(id)a4 CVPixelBuffer:(__CVBuffer *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNPixelBufferObservation;
  v10 = [(VNObservation *)&v14 initWithOriginatingRequestSpecifier:v8];
  if (v10)
  {
    v10->_pixelBuffer = CVPixelBufferRetain(a5);
    uint64_t v11 = [v9 copy];
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCoreMLRequest";
}

- (__CVBuffer)createPixelBufferInOrientation:(unsigned int)a3 error:(id *)a4
{
  uint64_t v6 = [(VNPixelBufferObservation *)self pixelBuffer];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:v6];
  id v8 = objc_msgSend(v7, "imageByApplyingTransform:", v18, VNAffineTransformForVisionToTopLeftOriginOrientation(0, a3, (uint64_t)v18));

  [v8 extent];
  double v10 = v9;
  double v12 = v11;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
  objc_super v14 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v10, (unint64_t)v12, PixelFormatType, a4);
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E018]);
    v16 = (void *)[v15 initWithOptions:MEMORY[0x1E4F1CC08]];
    [v16 render:v8 toCVPixelBuffer:v14];
  }
  return v14;
}

@end