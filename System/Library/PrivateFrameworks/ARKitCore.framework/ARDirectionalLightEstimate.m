@interface ARDirectionalLightEstimate
+ (BOOL)supportsSecureCoding;
- (ARDirectionalLightEstimate)initWithCoder:(id)a3;
- (ARDirectionalLightEstimate)initWithDirectionalLightEstimate:(id)a3;
- (ARDirectionalLightEstimate)initWithSphericalHarmonics:(id *)a3 ambientIntensity:(double)a4 temperature:(double)a5;
- (ARDirectionalLightEstimate)lightEstimateByApplyingRotation:(uint64_t)a1;
- (CGFloat)primaryLightIntensity;
- (NSData)sphericalHarmonicsCoefficients;
- (double)confidenceRating;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (simd_float3)primaryLightDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceRating:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARDirectionalLightEstimate

- (ARDirectionalLightEstimate)initWithSphericalHarmonics:(id *)a3 ambientIntensity:(double)a4 temperature:(double)a5
{
  float32x4_t v21 = 0u;
  long long v22 = 0u;
  ARPrimaryLightFromSphericalHarmonics((uint64_t)a3, &v21, 1000.0, *(float32x4_t *)&a5);
  v20.receiver = self;
  v20.super_class = (Class)ARDirectionalLightEstimate;
  v9 = [(ARLightEstimate *)&v20 initWithAmbientIntensity:a4 temperature:a5];
  v10 = (float32x4_t *)v9;
  if (v9)
  {
    float v11 = a3->var0[8];
    long long v12 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)(v9 + 24) = *(_OWORD *)a3->var0;
    *(_OWORD *)(v9 + 40) = v12;
    *((float *)v9 + 14) = v11;
    int v19 = 0;
    memset(v18, 0, sizeof(v18));
    ARSphericalHarmonicsByFlippingZAxis((long long *)a3, (uint64_t)v18);
    float32x4_t v13 = vnegq_f32(v21);
    v10[6] = v13;
    *(double *)v13.i64 = *(float *)&v22;
    *(double *)&v10[4].i64[1] = *(float *)&v22;
    v13.f32[0] = a5;
    uint64_t v15 = ARSphericalHarmonicsDataWithCoefficients((uint64_t)v18, v13, v14);
    v16 = (void *)v10[4].i64[0];
    v10[4].i64[0] = v15;
  }
  return (ARDirectionalLightEstimate *)v10;
}

- (ARDirectionalLightEstimate)initWithDirectionalLightEstimate:(id)a3
{
  v4 = (char *)a3;
  [v4 ambientIntensity];
  double v6 = v5;
  [v4 ambientColorTemperature];
  v13.receiver = self;
  v13.super_class = (Class)ARDirectionalLightEstimate;
  v8 = [(ARLightEstimate *)&v13 initWithAmbientIntensity:v6 temperature:v7];
  v9 = (ARDirectionalLightEstimate *)v8;
  if (v8)
  {
    int v10 = *((_DWORD *)v4 + 14);
    long long v11 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v8 + 40) = v11;
    *((_DWORD *)v8 + 14) = v10;
    *((_OWORD *)v8 + 6) = *((_OWORD *)v4 + 6);
    *((void *)v8 + 9) = *((void *)v4 + 9);
    objc_storeStrong((id *)v8 + 8, *((id *)v4 + 8));
    v9->_timestamp = *((double *)v4 + 10);
    v9->_confidenceRating = *((double *)v4 + 11);
  }

  return v9;
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonicsCoefficients;
}

- (ARDirectionalLightEstimate)lightEstimateByApplyingRotation:(uint64_t)a1
{
  int v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  ARSphericalHarmonicsByApplyingRotation((long long *)(a1 + 24), (uint64_t)&v11, a2);
  v3 = [ARDirectionalLightEstimate alloc];
  [(id)a1 ambientIntensity];
  double v5 = v4;
  [(id)a1 ambientColorTemperature];
  v9[0] = v11;
  v9[1] = v12;
  int v10 = v13;
  double v7 = [(ARDirectionalLightEstimate *)v3 initWithSphericalHarmonics:v9 ambientIntensity:v5 temperature:v6];
  [(id)a1 timestamp];
  -[ARDirectionalLightEstimate setTimestamp:](v7, "setTimestamp:");
  [(id)a1 confidenceRating];
  -[ARDirectionalLightEstimate setConfidenceRating:](v7, "setConfidenceRating:");
  return v7;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARLightEstimate *)self ambientIntensity];
  [v6 appendFormat:@" ambientIntensity=%.2f", v7];
  [(ARLightEstimate *)self ambientColorTemperature];
  [v6 appendFormat:@" ambientColorTemperature=%.2f", v8];
  objc_msgSend(v6, "appendString:", @" coefficients(");
  [(NSData *)self->_sphericalHarmonicsCoefficients getBytes:v14 length:108];
  for (uint64_t i = 0; i != 27; ++i)
  {
    if (i)
    {
      if (i == 18)
      {
        int v10 = @", blue:";
      }
      else
      {
        if (i != 9) {
          goto LABEL_9;
        }
        int v10 = @", green:";
      }
    }
    else
    {
      int v10 = @"red:";
    }
    [v6 appendString:v10];
LABEL_9:
    float v11 = v14[i];
    if (v11 == 0.0) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 6;
    }
    objc_msgSend(v6, "appendFormat:", @" %.*f", v12, v11);
  }
  [v6 appendString:@""]);
  [v6 appendString:@">"];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithDirectionalLightEstimate:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARDirectionalLightEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARDirectionalLightEstimate;
  double v5 = [(ARLightEstimate *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sphericalHarmonicsCoefficients"];
    sphericalHarmonicsCoefficients = v5->_sphericalHarmonicsCoefficients;
    v5->_sphericalHarmonicsCoefficients = (NSData *)v6;

    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"primaryLightDirection");
    *(_OWORD *)v5->_primaryLightDirection = v8;
    [v4 decodeDoubleForKey:@"primaryLightIntensity"];
    v5->_primaryLightIntensity = v9;
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v10;
    [v4 decodeDoubleForKey:@"confidenceRating"];
    v5->_confidenceRating = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARDirectionalLightEstimate;
  id v4 = a3;
  [(ARLightEstimate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sphericalHarmonicsCoefficients, @"sphericalHarmonicsCoefficients", v5.receiver, v5.super_class);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"primaryLightDirection", *(double *)self->_primaryLightDirection);
  [v4 encodeDouble:@"primaryLightIntensity" forKey:self->_primaryLightIntensity];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeDouble:@"confidenceRating" forKey:self->_confidenceRating];
}

- (simd_float3)primaryLightDirection
{
  return *(simd_float3 *)self->_primaryLightDirection;
}

- (CGFloat)primaryLightIntensity
{
  return self->_primaryLightIntensity;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)confidenceRating
{
  return self->_confidenceRating;
}

- (void)setConfidenceRating:(double)a3
{
  self->_confidenceRating = a3;
}

- (void).cxx_destruct
{
}

@end