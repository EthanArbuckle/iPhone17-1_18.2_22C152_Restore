@interface HRTFSerializableCaptureData
+ (BOOL)supportsSecureCoding;
- (CGPoint)distortionCenter;
- (CGSize)referenceDimensions;
- (HRTFSerializableCaptureData)initWithCoder:(id)a3;
- (HRTFSerializableCaptureData)initWithColorPixelBuffer:(__n128)a3 depthPixelBuffer:(__n128)a4 colorIntrinsics:(__n128)a5 depthIntrinsics:(__n128)a6 distortionLookupTable:(__n128)a7 referenceDimensions:(CGFloat)a8 distortionCenter:(CGFloat)a9 timestamp:(uint64_t)a10;
- (IOSurface)colorSurface;
- (IOSurface)depthSurface;
- (NSData)distortionLookupTable;
- (__CVBuffer)colorPixelBuffer;
- (__CVBuffer)depthPixelBuffer;
- (__n128)colorIntrinsics;
- (__n128)depthIntrinsics;
- (double)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HRTFSerializableCaptureData

- (__CVBuffer)colorPixelBuffer
{
  return [(_SerializableCVPixelBuffer *)self->_serializableColorPixelBuffer pixelBuffer];
}

- (__CVBuffer)depthPixelBuffer
{
  return [(_SerializableCVPixelBuffer *)self->_serializableDepthPixelBuffer pixelBuffer];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HRTFSerializableCaptureData)initWithColorPixelBuffer:(__n128)a3 depthPixelBuffer:(__n128)a4 colorIntrinsics:(__n128)a5 depthIntrinsics:(__n128)a6 distortionLookupTable:(__n128)a7 referenceDimensions:(CGFloat)a8 distortionCenter:(CGFloat)a9 timestamp:(uint64_t)a10
{
  id v25 = a13;
  v42.receiver = a1;
  v42.super_class = (Class)HRTFSerializableCaptureData;
  v26 = [(HRTFSerializableCaptureData *)&v42 init];
  if (v26)
  {
    v27 = [[_SerializableCVPixelBuffer alloc] initWithCVPixelBufferRef:a11];
    serializableColorPixelBuffer = v26->_serializableColorPixelBuffer;
    v26->_serializableColorPixelBuffer = v27;

    v29 = [[_SerializableCVPixelBuffer alloc] initWithCVPixelBufferRef:a12];
    serializableDepthPixelBuffer = v26->_serializableDepthPixelBuffer;
    v26->_serializableDepthPixelBuffer = v29;

    uint64_t v31 = CVPixelBufferGetIOSurface(a11);
    colorSurface = v26->_colorSurface;
    v26->_colorSurface = (IOSurface *)v31;

    uint64_t v33 = CVPixelBufferGetIOSurface(a12);
    depthSurface = v26->_depthSurface;
    v26->_depthSurface = (IOSurface *)v33;

    *(__n128 *)v26->_anon_20 = a2;
    *(__n128 *)&v26->_anon_20[16] = a3;
    *(__n128 *)&v26->_anon_20[32] = a4;
    *(__n128 *)v26->_anon_50 = a5;
    *(__n128 *)&v26->_anon_50[16] = a6;
    *(__n128 *)&v26->_anon_50[32] = a7;
    objc_storeStrong((id *)&v26->_distortionLookupTable, a13);
    v26->_referenceDimensions.width = a8;
    v26->_referenceDimensions.height = a9;
    v26->_distortionCenter.x = a14;
    v26->_distortionCenter.y = a15;
    v26->_timestamp = a16;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  colorSurface = self->_colorSurface;
  id v5 = a3;
  [v5 encodeObject:colorSurface forKey:@"ColorSurface"];
  [v5 encodeObject:self->_depthSurface forKey:@"DepthSurface"];
  [v5 encodeObject:self->_serializableColorPixelBuffer forKey:@"ColorPixelBuffer"];
  [v5 encodeObject:self->_serializableDepthPixelBuffer forKey:@"DepthPixelBuffer"];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:self->_anon_20 length:48];
  [v5 encodeObject:v6 forKey:@"ColorIntrinsics"];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:self->_anon_50 length:48];

  [v5 encodeObject:v7 forKey:@"DepthIntrinsics"];
  [v5 encodeObject:self->_distortionLookupTable forKey:@"DistortionLUT"];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_referenceDimensions length:16];

  [v5 encodeObject:v8 forKey:@"RefDimensions"];
  id v10 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&self->_distortionCenter length:16];

  [v5 encodeObject:v10 forKey:@"DistortionCenter"];
  v9 = [NSNumber numberWithDouble:self->_timestamp];
  [v5 encodeObject:v9 forKey:@"Timestamp"];
}

- (HRTFSerializableCaptureData)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"ColorSurface"]
    && [v4 containsValueForKey:@"DepthSurface"]
    && [v4 containsValueForKey:@"ColorPixelBuffer"]
    && [v4 containsValueForKey:@"DepthPixelBuffer"]
    && [v4 containsValueForKey:@"ColorIntrinsics"]
    && [v4 containsValueForKey:@"DepthIntrinsics"]
    && [v4 containsValueForKey:@"DistortionLUT"]
    && [v4 containsValueForKey:@"RefDimensions"]
    && [v4 containsValueForKey:@"DistortionCenter"]
    && [v4 containsValueForKey:@"Timestamp"])
  {
    v34.receiver = self;
    v34.super_class = (Class)HRTFSerializableCaptureData;
    id v5 = [(HRTFSerializableCaptureData *)&v34 init];
    if (v5)
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ColorSurface"];
      v7 = (void *)*((void *)v5 + 22);
      *((void *)v5 + 22) = v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DepthSurface"];
      v9 = (void *)*((void *)v5 + 23);
      *((void *)v5 + 23) = v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ColorPixelBuffer"];
      v11 = (void *)*((void *)v5 + 1);
      *((void *)v5 + 1) = v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DepthPixelBuffer"];
      v13 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v12;

      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ColorIntrinsics"];
      if ([v14 length] != 48) {
        -[HRTFSerializableCaptureData initWithCoder:].cold.4();
      }
      id v15 = v14;
      v16 = (_OWORD *)[v15 bytes];
      long long v18 = v16[1];
      long long v17 = v16[2];
      *((_OWORD *)v5 + 2) = *v16;
      *((_OWORD *)v5 + 3) = v18;
      *((_OWORD *)v5 + 4) = v17;
      v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DepthIntrinsics"];

      if ([v19 length] != 48) {
        -[HRTFSerializableCaptureData initWithCoder:]();
      }
      id v20 = v19;
      v21 = (_OWORD *)[v20 bytes];
      long long v23 = v21[1];
      long long v22 = v21[2];
      *((_OWORD *)v5 + 5) = *v21;
      *((_OWORD *)v5 + 6) = v23;
      *((_OWORD *)v5 + 7) = v22;
      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DistortionLUT"];
      id v25 = (void *)*((void *)v5 + 16);
      *((void *)v5 + 16) = v24;

      v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RefDimensions"];

      if ([v26 length] != 16) {
        -[HRTFSerializableCaptureData initWithCoder:]();
      }
      id v27 = v26;
      *(_OWORD *)(v5 + 136) = *(_OWORD *)[v27 bytes];
      v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DistortionCenter"];

      if ([v28 length] != 16) {
        -[HRTFSerializableCaptureData initWithCoder:]();
      }
      id v29 = v28;
      *(_OWORD *)(v5 + 152) = *(_OWORD *)[v29 bytes];
      v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Timestamp"];
      [v30 doubleValue];
      *((void *)v5 + 21) = v31;
    }
    self = v5;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (IOSurface)colorSurface
{
  return self->_colorSurface;
}

- (IOSurface)depthSurface
{
  return self->_depthSurface;
}

- (__n128)colorIntrinsics
{
  return a1[2];
}

- (__n128)depthIntrinsics
{
  return a1[5];
}

- (NSData)distortionLookupTable
{
  return self->_distortionLookupTable;
}

- (CGSize)referenceDimensions
{
  double width = self->_referenceDimensions.width;
  double height = self->_referenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)distortionCenter
{
  double x = self->_distortionCenter.x;
  double y = self->_distortionCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthSurface, 0);
  objc_storeStrong((id *)&self->_colorSurface, 0);
  objc_storeStrong((id *)&self->_distortionLookupTable, 0);
  objc_storeStrong((id *)&self->_serializableDepthPixelBuffer, 0);
  objc_storeStrong((id *)&self->_serializableColorPixelBuffer, 0);
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 323, "data.length == sizeof(CGPoint)");
}

- (void)initWithCoder:.cold.2()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 319, "data.length == sizeof(CGSize)");
}

- (void)initWithCoder:.cold.3()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 313, "data.length == sizeof(simd_float3x3)");
}

- (void)initWithCoder:.cold.4()
{
  __assert_rtn("-[HRTFSerializableCaptureData initWithCoder:]", "HRTFSerializableCaptureData.m", 309, "data.length == sizeof(simd_float3x3)");
}

@end