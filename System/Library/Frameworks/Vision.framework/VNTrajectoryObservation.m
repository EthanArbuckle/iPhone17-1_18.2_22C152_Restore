@interface VNTrajectoryObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGFloat)movingAverageRadius;
- (NSArray)detectedPoints;
- (NSArray)projectedPoints;
- (VNTrajectoryObservation)initWithCoder:(id)a3;
- (id)_points:(_OWORD *)a3 transformedWith:;
- (id)detectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (id)initWithOriginatingRequestSpecifier:(void *)a3 requestUUID:(void *)a4 trajectoryUUID:(void *)a5 detectedPoints:(void *)a6 projectedPoints:(double)a7 movingAverageRadius:(__n128)a8 equationCoefficients:(float)a9 confidence:;
- (id)projectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (id)vn_cloneObject;
- (simd_float3)equationCoefficients;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNTrajectoryObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_projectedPoints, 0);

  objc_storeStrong((id *)&self->_detectedPoints, 0);
}

- (CGFloat)movingAverageRadius
{
  return self->_movingAverageRadius;
}

- (simd_float3)equationCoefficients
{
  return *(simd_float3 *)self->_equationCoefficients;
}

- (NSArray)projectedPoints
{
  return self->_projectedPoints;
}

- (NSArray)detectedPoints
{
  return self->_detectedPoints;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNTrajectoryObservation *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VNTrajectoryObservation;
    if ([(VNObservation *)&v17 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (v5) {
        requestUUID = v5->_requestUUID;
      }
      else {
        requestUUID = 0;
      }
      if (([(NSUUID *)self->_requestUUID isEqual:requestUUID] & 1) == 0) {
        goto LABEL_13;
      }
      [(VNTrajectoryObservation *)v5 equationCoefficients];
      uint32x4_t v8 = (uint32x4_t)vceqq_f32(v7, *(float32x4_t *)self->_equationCoefficients);
      v8.i32[3] = v8.i32[2];
      if ((vminvq_u32(v8) & 0x80000000) == 0) {
        goto LABEL_13;
      }
      v9 = [(VNTrajectoryObservation *)v5 detectedPoints];
      int v10 = VisionCoreEqualOrNilObjects();

      if (!v10) {
        goto LABEL_13;
      }
      v11 = [(VNTrajectoryObservation *)v5 projectedPoints];
      int v12 = VisionCoreEqualOrNilObjects();

      if (v12)
      {
        double movingAverageRadius = self->_movingAverageRadius;
        [(VNTrajectoryObservation *)v5 movingAverageRadius];
        BOOL v15 = movingAverageRadius == v14;
      }
      else
      {
LABEL_13:
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  v16.receiver = self;
  v16.super_class = (Class)VNTrajectoryObservation;
  uint64_t v3 = [(NSArray *)self->_detectedPoints hash] ^ __ROR8__([(NSUUID *)self->_requestUUID hash] ^ __ROR8__([(VNObservation *)&v16 hash], 51), 51);
  uint64_t v4 = [(NSArray *)self->_projectedPoints hash];
  float v5 = *(float *)self->_equationCoefficients;
  float v6 = *(float *)&self->_equationCoefficients[4];
  double v7 = v5;
  uint64_t v8 = v4 ^ __ROR8__(v3, 51);
  if (v5 == 0.0) {
    double v7 = 0.0;
  }
  uint64_t v9 = LODWORD(v6);
  if (v6 == 0.0) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 ^ __ROR8__(*(void *)&v7, 51);
  float v11 = *(float *)&self->_equationCoefficients[8];
  uint64_t v12 = LODWORD(v11);
  if (v11 == 0.0) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12 ^ __ROR8__(v10, 51) ^ __ROR8__(v8, 51);
  double movingAverageRadius = self->_movingAverageRadius;
  if (movingAverageRadius == 0.0) {
    double movingAverageRadius = 0.0;
  }
  return *(void *)&movingAverageRadius ^ __ROR8__(v13, 51);
}

- (id)vn_cloneObject
{
  v11.receiver = self;
  v11.super_class = (Class)VNTrajectoryObservation;
  uint64_t v3 = [(VNObservation *)&v11 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSUUID *)self->_requestUUID copy];
    float v5 = *(void **)(v3 + 120);
    *(void *)(v3 + 120) = v4;

    *(_OWORD *)(v3 + 128) = *(_OWORD *)self->_equationCoefficients;
    uint64_t v6 = [(NSArray *)self->_detectedPoints copy];
    double v7 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v6;

    uint64_t v8 = [(NSArray *)self->_projectedPoints copy];
    uint64_t v9 = *(void **)(v3 + 104);
    *(void *)(v3 + 104) = v8;

    *(double *)(v3 + 112) = self->_movingAverageRadius;
  }

  return (id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNTrajectoryObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_requestUUID forKey:@"requestUuid"];
  objc_msgSend(v4, "vn_encodeSimdFloat3:forKey:", @"eqCoeffs", *(double *)self->_equationCoefficients);
  [v4 encodeObject:self->_detectedPoints forKey:@"detPts"];
  [v4 encodeObject:self->_projectedPoints forKey:@"projPts"];
  [v4 encodeDouble:@"mvAvgRad" forKey:self->_movingAverageRadius];
}

- (VNTrajectoryObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNTrajectoryObservation;
  objc_super v5 = [(VNObservation *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUuid"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v7;

    objc_msgSend(v4, "vn_decodeSimdFloat3ForKey:", @"eqCoeffs");
    *(_OWORD *)v5->_equationCoefficients = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:v6 forKey:@"detPts"];
    detectedPoints = v5->_detectedPoints;
    v5->_detectedPoints = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:v6 forKey:@"projPts"];
    projectedPoints = v5->_projectedPoints;
    v5->_projectedPoints = (NSArray *)v12;

    if ([v4 containsValueForKey:@"mvAvgRad"])
    {
      [v4 decodeDoubleForKey:@"mvAvgRad"];
      v5->_double movingAverageRadius = v14;
    }
    BOOL v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initWithOriginatingRequestSpecifier:(void *)a3 requestUUID:(void *)a4 trajectoryUUID:(void *)a5 detectedPoints:(void *)a6 projectedPoints:(double)a7 movingAverageRadius:(__n128)a8 equationCoefficients:(float)a9 confidence:
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)VNTrajectoryObservation;
    id v21 = objc_msgSendSuper2(&v25, sel_initWithOriginatingRequestSpecifier_, v16);
    a1 = v21;
    if (v21)
    {
      [v21 setUUID:v18];
      *(float *)&double v22 = a9;
      [a1 setConfidence:v22];
      objc_storeStrong((id *)a1 + 15, a3);
      objc_storeStrong((id *)a1 + 12, a5);
      objc_storeStrong((id *)a1 + 13, a6);
      *((double *)a1 + 14) = a7;
      *((__n128 *)a1 + 8) = a8;
    }
  }

  return a1;
}

- (id)projectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  objc_super v5 = [(VNTrajectoryObservation *)self projectedPoints];
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  uint64_t v6 = -[VNTrajectoryObservation _points:transformedWith:](self, v5, v8);

  return v6;
}

- (id)_points:(_OWORD *)a3 transformedWith:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    if (v7)
    {
      a1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            long long v13 = a3[1];
            v16[0] = *a3;
            v16[1] = v13;
            v16[2] = a3[2];
            double v14 = [v12 transformedWith:v16];
            [a1 addObject:v14];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }
    }
    else
    {
      a1 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return a1;
}

- (id)detectedPointsInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  id v5 = [(VNTrajectoryObservation *)self detectedPoints];
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  uint64_t v6 = -[VNTrajectoryObservation _points:transformedWith:](self, v5, v8);

  return v6;
}

@end