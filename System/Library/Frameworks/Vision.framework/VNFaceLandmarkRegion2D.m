@interface VNFaceLandmarkRegion2D
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)precisionEstimatesPerPoint;
- (VNFaceLandmarkRegion2D)initWithCoder:(id)a3;
- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5;
- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointsClassification:(int64_t)a5 points:pointCount:precisionEstimatesPerPoint:;
- (VNPointsClassification)pointsClassification;
- (const)normalizedPoints;
- (const)normalizedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (const)pointsInImageOfSize:(CGSize)imageSize;
- (double)pointAtIndex:(unint64_t)a3;
- (uint64_t)points;
- (unint64_t)hash;
- (void)_initLocks;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceLandmarkRegion2D

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionEstimatesPerPoint, 0);

  objc_storeStrong((id *)&self->_sizedPointsCache, 0);
}

- (NSArray)precisionEstimatesPerPoint
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (uint64_t)points
{
  return *(void *)(a1 + 72);
}

- (VNPointsClassification)pointsClassification
{
  return self->_pointsClassification;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceLandmarkRegion2D *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VNFaceLandmarkRegion2D;
    if ([(VNFaceLandmarkRegion *)&v16 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        NSUInteger v6 = [(VNFaceLandmarkRegion *)self pointCount];
        if (v6 == [(VNFaceLandmarkRegion *)v5 pointCount])
        {
          v7 = self;
          v8 = [(VNFaceLandmarkRegion2D *)v7 normalizedPoints];
          v9 = v5;
          v10 = [(VNFaceLandmarkRegion2D *)v9 normalizedPoints];
          if (!v6)
          {
LABEL_8:
            v12 = [(VNFaceLandmarkRegion2D *)v7 precisionEstimatesPerPoint];
            v13 = [(VNFaceLandmarkRegion2D *)v9 precisionEstimatesPerPoint];
            char v14 = VisionCoreEqualOrNilObjects();

LABEL_12:
            goto LABEL_13;
          }
          while (1)
          {
            int32x2_t v11 = vmovn_s64(vceqq_f64(*v8, *v10));
            if ((v11.i32[0] & v11.i32[1] & 1) == 0) {
              break;
            }
            ++v10;
            ++v8;
            if (!--v6) {
              goto LABEL_8;
            }
          }
        }
        char v14 = 0;
        goto LABEL_12;
      }
    }
    char v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion2D;
  return [(NSArray *)self->_precisionEstimatesPerPoint hash] ^ __ROR8__([(VNFaceLandmarkRegion *)self pointCount] ^ __ROR8__([(VNFaceLandmarkRegion *)&v3 hash], 51), 51);
}

- (void)dealloc
{
  free(*(void **)&self->_points[4]);
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarkRegion2D;
  [(VNFaceLandmarkRegion2D *)&v3 dealloc];
}

- (void)_initLocks
{
  self->_pointsCalculatorLock._os_unfair_lock_opaque = 0;
}

- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointsClassification:(int64_t)a5 points:pointCount:precisionEstimatesPerPoint:
{
  v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = v8;
  if (v10)
  {
    v26.receiver = self;
    v26.super_class = (Class)VNFaceLandmarkRegion2D;
    v19 = -[VNFaceLandmarkRegion initWithOriginatingRequestSpecifier:faceBoundingBox:pointCount:](&v26, sel_initWithOriginatingRequestSpecifier_faceBoundingBox_pointCount_, v17, v9, x, y, width, height);
    v20 = v19;
    if (v19)
    {
      v19->_pointsClassification = a5;
      *(void *)&v19->_points[4] = v10;
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      sizedPointsCache = v20->_sizedPointsCache;
      v20->_sizedPointsCache = (NSMutableDictionary *)v21;

      uint64_t v23 = [v18 copy];
      precisionEstimatesPerPoint = v20->_precisionEstimatesPerPoint;
      v20->_precisionEstimatesPerPoint = (NSArray *)v23;

      [(VNFaceLandmarkRegion2D *)v20 _initLocks];
      self = v20;
      v20 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (const)pointsInImageOfSize:(CGSize)imageSize
{
  CGSize v23 = imageSize;
  v4 = [MEMORY[0x1E4F29238] value:&v23 withObjCType:"{CGSize=dd}"];
  os_unfair_lock_lock(&self->_pointsCalculatorLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_sizedPointsCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    NSUInteger v6 = [(VNFaceLandmarkRegion *)self pointCount];
    uint64_t v7 = 16 * v6;
    v8 = (float64x2_t *)malloc_type_malloc(16 * v6, 0xB66C930uLL);
    +[VNError VNAssert:v8 != 0 log:@"failed to allocate internal points array"];
    float64x2_t v22 = (float64x2_t)v23;
    [(VNFaceLandmarkRegion *)self faceBoundingBox];
    if (v6)
    {
      v13 = *(float32x2_t **)&self->_points[4];
      v9.f64[1] = v10;
      float64x2_t v14 = vcvtq_f64_u64(vcvtq_u64_f64(v22));
      float64x2_t v15 = vmulq_f64(v9, v14);
      v11.f64[1] = v12;
      float64x2_t v16 = vmulq_f64(v11, v14);
      id v17 = v8;
      do
      {
        float32x2_t v18 = *v13++;
        *v17++ = vmlaq_f64(v15, v16, vcvtq_f64_f32(v18));
        --v6;
      }
      while (v6);
    }
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v7 freeWhenDone:1];
    [(NSMutableDictionary *)self->_sizedPointsCache setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(&self->_pointsCalculatorLock);
  id v19 = v5;
  v20 = (const CGPoint *)[v19 bytes];

  return v20;
}

- (const)normalizedPoints
{
  p_pointsCalculatorLock = &self->_pointsCalculatorLock;
  os_unfair_lock_lock(&self->_pointsCalculatorLock);
  v4 = [(NSMutableDictionary *)self->_sizedPointsCache objectForKeyedSubscript:&unk_1EF7A7328];
  if (!v4)
  {
    NSUInteger v5 = [(VNFaceLandmarkRegion *)self pointCount];
    uint64_t v6 = 16 * v5;
    uint64_t v7 = (char *)malloc_type_malloc(16 * v5, 0x18CEF8C0uLL);
    +[VNError VNAssert:v7 != 0 log:@"failed to allocate internal points array"];
    if (v5)
    {
      v8 = (double *)(v7 + 8);
      float64x2_t v9 = (float *)(*(void *)&self->_points[4] + 4);
      do
      {
        *(v8 - 1) = COERCE_FLOAT(*(void *)(v9 - 1));
        float v10 = *v9;
        v9 += 2;
        double *v8 = v10;
        v8 += 2;
        --v5;
      }
      while (v5);
    }
    v4 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:v6 freeWhenDone:1];
    [(NSMutableDictionary *)self->_sizedPointsCache setObject:v4 forKeyedSubscript:&unk_1EF7A7328];
  }
  os_unfair_lock_unlock(p_pointsCalculatorLock);
  id v11 = v4;
  float64_t v12 = (const CGPoint *)[v11 bytes];

  return v12;
}

- (double)pointAtIndex:(unint64_t)a3
{
  unint64_t v5 = [a1 pointCount];
  double result = 0.0;
  if (v5 > a3) {
    return *(double *)(a1[9] + 8 * a3);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNFaceLandmarkRegion2D;
  [(VNFaceLandmarkRegion *)&v6 encodeWithCoder:v4];
  [v4 encodeInt32:0 forKey:@"VNFaceLandmarkRegion2D"];
  [v4 encodeInteger:self->_pointsClassification forKey:@"FLMReg2D_PtsClsf"];
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", -[VNFaceLandmarkRegion2D points](self, "points"), 8 * -[VNFaceLandmarkRegion pointCount](self, "pointCount"));
  [v4 encodeObject:v5 forKey:@"FLMReg2D_PtsData"];
  [v4 encodeObject:self->_precisionEstimatesPerPoint forKey:@"FLMs_PtsAE"];
}

- (VNFaceLandmarkRegion2D)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VNFaceLandmarkRegion2D;
  unint64_t v5 = [(VNFaceLandmarkRegion *)&v21 initWithCoder:v4];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = [v4 decodeInt32ForKey:@"VNFaceLandmarkRegion2D"];
  if (v6)
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarkRegion2D object due to coding version mismatch: Currently supported: %u; encoded: %u",
                   0,
                   v6);
    v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
    [v4 failWithError:v8];
LABEL_10:

    goto LABEL_11;
  }
  if ([v4 containsValueForKey:@"FLMReg2D_PtsClsf"]) {
    v5->_pointsClassification = [v4 decodeIntegerForKey:@"FLMReg2D_PtsClsf"];
  }
  size_t v9 = [(VNFaceLandmarkRegion *)v5 pointCount];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FLMReg2D_PtsData"];
  size_t v10 = [v7 length];
  if (v10 != 8 * v9)
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarkRegion2D object. Error: points buffer size mismatch (data size: %lu; expected: %lu)",
                   v10,
                   8 * v9);
    id v19 = +[VNError errorForInternalErrorWithLocalizedDescription:v8];
    [v4 failWithError:v19];

    goto LABEL_10;
  }
  id v11 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  *(void *)&v5->_points[4] = v11;
  if (!v11)
  {
LABEL_11:

LABEL_12:
    float32x2_t v18 = 0;
    goto LABEL_13;
  }
  id v12 = v7;
  memcpy(v11, (const void *)[v12 bytes], v10);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  float64x2_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"FLMs_PtsAE"];
  precisionEstimatesPerPoint = v5->_precisionEstimatesPerPoint;
  v5->_precisionEstimatesPerPoint = (NSArray *)v16;

  [(VNFaceLandmarkRegion2D *)v5 _initLocks];
  float32x2_t v18 = v5;
LABEL_13:

  return v18;
}

- (VNFaceLandmarkRegion2D)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"[VNFaceLandmarkRegion2D -initWithRequestRevision:faceBoundingBox:] is not available, use class designated initializers", 0 reason userInfo];
  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectFaceLandmarksRequest";
}

- (const)normalizedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  BOOL v5 = a3;
  if (a4 - 2 < 7 || a3)
  {
    size_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d_%d", *(void *)&a4, a3);
    size_t v10 = self;
    objc_sync_enter(v10);
    objc_getAssociatedObject(v10, (const void *)-[VNFaceLandmarkRegion2D(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_setAssociatedObject(v10, (const void *)-[VNFaceLandmarkRegion2D(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey, v11, (void *)1);
    }
    id v12 = [v11 objectForKey:v9];
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1A6257080]();
      uint64_t v14 = [(VNFaceLandmarkRegion *)v10 pointCount];
      id v15 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:16 * v14];
      uint64_t v16 = (float64x2_t *)[v15 mutableBytes];
      float64x2_t v25 = 0u;
      float64x2_t v26 = 0u;
      float64x2_t v24 = 0u;
      VNAffineTransformForVisionToTopLeftOriginOrientation(v5, a4, (uint64_t)&v24);
      uint64_t v17 = [(VNFaceLandmarkRegion2D *)v10 normalizedPoints];
      if (v14)
      {
        float64x2_t v18 = v24;
        float64x2_t v19 = v25;
        v20 = (double *)(v17 + 8);
        float64x2_t v21 = v26;
        do
        {
          *v16++ = vaddq_f64(v21, vmlaq_n_f64(vmulq_n_f64(v19, *v20), v18, *(v20 - 1)));
          v20 += 2;
          --v14;
        }
        while (v14);
      }
      id v12 = (void *)[v15 copy];
      [v11 setObject:v12 forKey:v9];
    }
    id v22 = v12;
    CGSize v23 = (const CGPoint *)[v22 bytes];

    objc_sync_exit(v10);
    return v23;
  }
  else
  {
    uint64_t v7 = self;
    return [(VNFaceLandmarkRegion2D *)v7 normalizedPoints];
  }
}

@end