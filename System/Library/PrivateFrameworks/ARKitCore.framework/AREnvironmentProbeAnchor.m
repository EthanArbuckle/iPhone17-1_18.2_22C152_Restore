@interface AREnvironmentProbeAnchor
+ (BOOL)supportsSecureCoding;
- (AREnvironmentProbeAnchor)initWithAnchor:(id)a3;
- (AREnvironmentProbeAnchor)initWithCoder:(id)a3;
- (AREnvironmentProbeAnchor)initWithIdentifier:(double)a3 transform:(double)a4;
- (AREnvironmentProbeAnchor)initWithIdentifier:(id)a3 onPlane:(ARTexturedPlane *)a4;
- (AREnvironmentProbeAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform extent:(simd_float3)extent;
- (AREnvironmentProbeAnchor)initWithName:(double)a3 transform:(double)a4;
- (AREnvironmentProbeAnchor)initWithTransform:(simd_float4x4)transform extent:(simd_float3)extent;
- (AREnvironmentProbeAnchor)initWithTransform:(void *)a1;
- (ARParametricLights)parametricLights;
- (NSData)colorHistogram;
- (NSSet)sourceKeyframeUUIDs;
- (NSUUID)trackedPlaneIdentifier;
- (__n128)initWithIdentifier:(double)a3 transform:(double)a4 extent:(double)a5;
- (float)averageIntensity;
- (float)clippingPointLux;
- (float)opaquePixelPercentage;
- (id)description;
- (id)environmentTexture;
- (simd_float3)extent;
- (void)encodeWithCoder:(id)a3;
- (void)setClippingPointLux:(float)a3;
- (void)setColorHistogram:(id)a3;
- (void)setEnvironmentTexture:(id)a3;
- (void)setOpaquePixelPercentage:(float)a3;
- (void)setParametricLights:(id)a3;
- (void)setSourceKeyframeUUIDs:(id)a3;
- (void)setTrackedPlaneIdentifier:(id)a3;
@end

@implementation AREnvironmentProbeAnchor

- (AREnvironmentProbeAnchor)initWithTransform:(void *)a1
{
  v6.receiver = a1;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  v1 = -[ARAnchor initWithTransform:](&v6, sel_initWithTransform_);
  v2 = v1;
  if (v1)
  {
    *(int32x4_t *)v1->_extent = vdupq_n_s32(0x7F800000u);
    uint64_t v3 = objc_opt_new();
    sourceKeyframeUUIDs = v2->_sourceKeyframeUUIDs;
    v2->_sourceKeyframeUUIDs = (NSSet *)v3;
  }
  return v2;
}

- (AREnvironmentProbeAnchor)initWithName:(double)a3 transform:(double)a4
{
  id v8 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)AREnvironmentProbeAnchor;
  v9 = -[ARAnchor initWithName:transform:](&v18, sel_initWithName_transform_, v8, a2, a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    *(int32x4_t *)v9->_extent = vdupq_n_s32(0x7F800000u);
    uint64_t v11 = objc_opt_new();
    sourceKeyframeUUIDs = v10->_sourceKeyframeUUIDs;
    v10->_sourceKeyframeUUIDs = (NSSet *)v11;
  }
  return v10;
}

- (AREnvironmentProbeAnchor)initWithIdentifier:(double)a3 transform:(double)a4
{
  id v8 = a7;
  v18.receiver = a1;
  v18.super_class = (Class)AREnvironmentProbeAnchor;
  v9 = -[ARAnchor initWithIdentifier:transform:](&v18, sel_initWithIdentifier_transform_, v8, a2, a3, a4, a5);
  v10 = v9;
  if (v9)
  {
    *(int32x4_t *)v9->_extent = vdupq_n_s32(0x7F800000u);
    uint64_t v11 = objc_opt_new();
    sourceKeyframeUUIDs = v10->_sourceKeyframeUUIDs;
    v10->_sourceKeyframeUUIDs = (NSSet *)v11;
  }
  return v10;
}

- (AREnvironmentProbeAnchor)initWithTransform:(simd_float4x4)transform extent:(simd_float3)extent
{
  v6.receiver = self;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  result = -[ARAnchor initWithTransform:](&v6, sel_initWithTransform_, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
  if (result) {
    *(simd_float3 *)result->_extent = extent;
  }
  return result;
}

- (AREnvironmentProbeAnchor)initWithName:(NSString *)name transform:(simd_float4x4)transform extent:(simd_float3)extent
{
  v7.receiver = self;
  v7.super_class = (Class)AREnvironmentProbeAnchor;
  result = -[ARAnchor initWithName:transform:](&v7, sel_initWithName_transform_, name, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
  if (result) {
    *(simd_float3 *)result->_extent = extent;
  }
  return result;
}

- (__n128)initWithIdentifier:(double)a3 transform:(double)a4 extent:(double)a5
{
  v9.receiver = a1;
  v9.super_class = (Class)AREnvironmentProbeAnchor;
  objc_super v6 = -[ARAnchor initWithIdentifier:transform:](&v9, sel_initWithIdentifier_transform_);
  if (v6)
  {
    __n128 result = a6;
    *(__n128 *)v6->_extent = a6;
  }
  return result;
}

- (AREnvironmentProbeAnchor)initWithIdentifier:(id)a3 onPlane:(ARTexturedPlane *)a4
{
  id v6 = a3;
  long long v13 = 0u;
  float32x4_t v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  convert(a4, &v10);
  objc_super v7 = -[AREnvironmentProbeAnchor initWithIdentifier:transform:extent:](self, "initWithIdentifier:transform:extent:", v6, *(double *)&v10, *(double *)&v11, *(double *)&v12, *(double *)&v13, *(double *)vmulq_f32(v14, (float32x4_t)xmmword_1B8A2F3A0).i64);
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a4];
    [(AREnvironmentProbeAnchor *)v7 setTrackedPlaneIdentifier:v8];
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = [(ARAnchor *)self name];

  v4 = NSString;
  v5 = [(ARAnchor *)self identifier];
  if (v3)
  {
    id v6 = [(ARAnchor *)self name];
    [(ARAnchor *)self transform];
    long long v11 = ARMatrix4x4Description(0, v7, v8, v9, v10);
    long long v12 = [(AREnvironmentProbeAnchor *)self environmentTexture];
    [(AREnvironmentProbeAnchor *)self extent];
    float32x4_t v14 = ARVector3Description(v13);
    v15 = [v4 stringWithFormat:@"<%p id=\"%@\" n=\"%@\" T=%@ t=%p e=%@>", self, v5, v6, v11, v12, v14];
  }
  else
  {
    [(ARAnchor *)self transform];
    id v6 = ARMatrix4x4Description(0, v16, v17, v18, v19);
    long long v11 = [(AREnvironmentProbeAnchor *)self environmentTexture];
    [(AREnvironmentProbeAnchor *)self extent];
    long long v12 = ARVector3Description(v20);
    v15 = [v4 stringWithFormat:@"<%p id=\"%@\" T=%@ t=%p e=%@>", self, v5, v6, v11, v12];
  }

  return v15;
}

- (AREnvironmentProbeAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AREnvironmentProbeAnchor;
  v5 = [(ARAnchor *)&v20 initWithAnchor:v4];
  if (v5)
  {
    uint64_t v6 = [v4 environmentTexture];
    environmentTexture = v5->_environmentTexture;
    v5->_environmentTexture = (MTLTexture *)v6;

    [v4 clippingPointLux];
    v5->_clippingPointLux = v8;
    uint64_t v9 = [v4 parametricLights];
    parametricLights = v5->_parametricLights;
    v5->_parametricLights = (ARParametricLights *)v9;

    uint64_t v11 = [v4 sourceKeyframeUUIDs];
    sourceKeyframeUUIDs = v5->_sourceKeyframeUUIDs;
    v5->_sourceKeyframeUUIDs = (NSSet *)v11;

    [v4 extent];
    *(_OWORD *)v5->_extent = v13;
    uint64_t v14 = [v4 trackedPlaneIdentifier];
    trackedPlaneIdentifier = v5->_trackedPlaneIdentifier;
    v5->_trackedPlaneIdentifier = (NSUUID *)v14;

    uint64_t v16 = [v4 colorHistogram];
    colorHistogram = v5->_colorHistogram;
    v5->_colorHistogram = (NSData *)v16;

    [v4 opaquePixelPercentage];
    v5->_opaquePixelPercentage = v18;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AREnvironmentProbeAnchor;
  [(ARAnchor *)&v6 encodeWithCoder:v4];
  [(AREnvironmentProbeAnchor *)self extent];
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"extent");
  v5 = [(AREnvironmentProbeAnchor *)self trackedPlaneIdentifier];
  [v4 encodeObject:v5 forKey:@"trackedPlaneIdentifier"];
}

- (AREnvironmentProbeAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AREnvironmentProbeAnchor;
  v5 = [(ARAnchor *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"extent");
    *(_OWORD *)v5->_extent = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackedPlaneIdentifier"];
    trackedPlaneIdentifier = v5->_trackedPlaneIdentifier;
    v5->_trackedPlaneIdentifier = (NSUUID *)v7;
  }
  return v5;
}

- (void)setEnvironmentTexture:(id)a3
{
  v5 = (MTLTexture *)a3;
  if (self->_environmentTexture != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_environmentTexture, a3);
    v5 = v6;
    self->_averageIntensity = 0.0;
  }
}

- (float)averageIntensity
{
  float result = self->_averageIntensity;
  if (result == 0.0)
  {
    environmentTexture = self->_environmentTexture;
    if (environmentTexture)
    {
      float result = ARAverageCubemapIntensity(environmentTexture);
      self->_averageIntensity = result;
    }
  }
  return result;
}

- (id)environmentTexture
{
  return self->_environmentTexture;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (float)clippingPointLux
{
  return self->_clippingPointLux;
}

- (void)setClippingPointLux:(float)a3
{
  self->_clippingPointLux = a3;
}

- (ARParametricLights)parametricLights
{
  return self->_parametricLights;
}

- (void)setParametricLights:(id)a3
{
}

- (NSSet)sourceKeyframeUUIDs
{
  return self->_sourceKeyframeUUIDs;
}

- (void)setSourceKeyframeUUIDs:(id)a3
{
}

- (NSData)colorHistogram
{
  return self->_colorHistogram;
}

- (void)setColorHistogram:(id)a3
{
}

- (float)opaquePixelPercentage
{
  return self->_opaquePixelPercentage;
}

- (void)setOpaquePixelPercentage:(float)a3
{
  self->_opaquePixelPercentage = a3;
}

- (NSUUID)trackedPlaneIdentifier
{
  return self->_trackedPlaneIdentifier;
}

- (void)setTrackedPlaneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPlaneIdentifier, 0);
  objc_storeStrong((id *)&self->_colorHistogram, 0);
  objc_storeStrong((id *)&self->_sourceKeyframeUUIDs, 0);
  objc_storeStrong((id *)&self->_parametricLights, 0);
  objc_storeStrong((id *)&self->_environmentTexture, 0);
}

@end