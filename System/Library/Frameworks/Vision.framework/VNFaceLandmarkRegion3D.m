@interface VNFaceLandmarkRegion3D
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (VNFaceLandmarkRegion3D)initWithCoder:(id)a3;
- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(VNFaceLandmarkRegion3D *)self faceBoundingBox:(SEL)a2 points:(id)a3 pointCount:(CGRect)a4;
- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4;
- (__n128)pointAtIndex:(unint64_t)a3;
- (uint64_t)points;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPoints:(VNFaceLandmarkRegion3D *)self;
@end

@implementation VNFaceLandmarkRegion3D

- (void)setPoints:(VNFaceLandmarkRegion3D *)self
{
  *(void *)self->_points = v2;
}

- (uint64_t)points
{
  return *(void *)(a1 + 56);
}

- (void)dealloc
{
  free(*(void **)self->_points);
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion3D;
  [(VNFaceLandmarkRegion3D *)&v3 dealloc];
}

- (__n128)pointAtIndex:(unint64_t)a3
{
  unint64_t v5 = [a1 pointCount];
  result.n128_u64[0] = 0;
  if (v5 <= a3) {
    return *(__n128 *)(a1[7] + 16 * a3);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceLandmarkRegion3D;
  [(VNFaceLandmarkRegion *)&v6 encodeWithCoder:v4];
  [v4 encodeInt32:0 forKey:@"VNFaceLandmarkRegion3D"];
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytesNoCopy:length:freeWhenDone:", -[VNFaceLandmarkRegion3D points](self, "points"), 16 * -[VNFaceLandmarkRegion pointCount](self, "pointCount"), 0);
  [v4 encodeObject:v5 forKey:@"FLMReg3D_PtsData"];
}

- (VNFaceLandmarkRegion3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNFaceLandmarkRegion3D;
  unint64_t v5 = [(VNFaceLandmarkRegion *)&v16 initWithCoder:v4];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 decodeInt32ForKey:@"VNFaceLandmarkRegion3D"];
  if (v6)
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarkRegion3D object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   0,
                   v6);
    v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v8];
LABEL_7:

LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  size_t v9 = [(VNFaceLandmarkRegion *)v5 pointCount];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FLMReg3D_PtsData"];
  size_t v10 = [v7 length];
  if (v10 != 16 * v9)
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarkRegion3D object. Error: points buffer size mismatch (data size: %lu; expected: %lu)",
                   v10,
                   16 * v9);
    v14 = +[VNError errorForInternalErrorWithLocalizedDescription:v8];
    [v4 failWithError:v14];

    goto LABEL_7;
  }
  v11 = malloc_type_calloc(v9, 0x10uLL, 0x1000040451B5BE8uLL);
  *(void *)v5->_points = v11;
  id v12 = v7;
  memcpy(v11, (const void *)[v12 bytes], v10);

  v13 = v5;
LABEL_9:

  return v13;
}

- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(VNFaceLandmarkRegion3D *)self faceBoundingBox:(SEL)a2 points:(id)a3 pointCount:(CGRect)a4
{
  uint64_t v6 = v4;
  v11.receiver = self;
  v11.super_class = (Class)VNFaceLandmarkRegion3D;
  v7 = -[VNFaceLandmarkRegion initWithOriginatingRequestSpecifier:faceBoundingBox:pointCount:](&v11, sel_initWithOriginatingRequestSpecifier_faceBoundingBox_pointCount_, a3, v5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  if (v7)
  {
    *(void *)v7->_points = v6;
    size_t v9 = v7;
  }

  return v8;
}

- (VNFaceLandmarkRegion3D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"[VNFaceLandmarkRegion3D -initWithRequestRevision:faceBoundingBox:] is not available, use class designated initializers", 0 reason userInfo];
  objc_exception_throw(v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectFace3DLandmarksRequest";
}

@end