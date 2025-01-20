@interface CVAPortraitRequest_StageLight
- (CVAMattingRequest)mattingRequest;
- (CVAPortraitGenericRequest)parentGenericRequestFrom;
- (CVAPortraitGenericRequest)parentGenericRequestTo;
- (CVAPortraitRequest_StageLight)initWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8;
- (NSData)cubeData;
- (NSData)proxyCubeData;
- (__CVBuffer)destinationColorPixelBuffer;
- (float)stageLightIntensity;
- (float)vignetteIntensity;
- (void)dealloc;
- (void)setParentGenericRequestFrom:(id)a3;
- (void)setParentGenericRequestTo:(id)a3;
@end

@implementation CVAPortraitRequest_StageLight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGenericRequestTo, 0);
  objc_storeStrong((id *)&self->_parentGenericRequestFrom, 0);
  objc_storeStrong((id *)&self->_cubeData, 0);
  objc_storeStrong((id *)&self->_proxyCubeData, 0);

  objc_storeStrong((id *)&self->_mattingRequest, 0);
}

- (void)setParentGenericRequestTo:(id)a3
{
}

- (CVAPortraitGenericRequest)parentGenericRequestTo
{
  return (CVAPortraitGenericRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)setParentGenericRequestFrom:(id)a3
{
}

- (CVAPortraitGenericRequest)parentGenericRequestFrom
{
  return (CVAPortraitGenericRequest *)objc_getProperty(self, a2, 48, 1);
}

- (float)stageLightIntensity
{
  return self->_stageLightIntensity;
}

- (float)vignetteIntensity
{
  return self->_vignetteIntensity;
}

- (NSData)cubeData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)proxyCubeData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (__CVBuffer)destinationColorPixelBuffer
{
  return self->_destinationColorPixelBuffer;
}

- (CVAMattingRequest)mattingRequest
{
  return (CVAMattingRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_destinationColorPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitRequest_StageLight;
  [(CVAPortraitRequest_StageLight *)&v3 dealloc];
}

- (CVAPortraitRequest_StageLight)initWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 proxyCubeData:(id)a5 cubeData:(id)a6 vignetteIntensity:(float)a7 stageLightIntensity:(float)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CVAPortraitRequest_StageLight;
  v18 = [(CVAPortraitRequest_StageLight *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mattingRequest, a3);
    v19->_destinationColorPixelBuffer = a4;
    CVPixelBufferRetain(a4);
    objc_storeStrong((id *)&v19->_proxyCubeData, a5);
    objc_storeStrong((id *)&v19->_cubeData, a6);
    v19->_vignetteIntensity = a7;
    v19->_stageLightIntensity = a8;
    v20 = v19;
  }

  return v19;
}

@end