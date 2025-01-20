@interface CVAPortraitRequest
- (CVAMattingRequest)mattingRequest;
- (CVAPortraitGenericRequest)parentGenericRequestFrom;
- (CVAPortraitGenericRequest)parentGenericRequestTo;
- (CVAPortraitRequest)initWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 backgroundColorCube:(id)a5 foregroundColorCube:(id)a6 colorCubeIntensity:(float)a7 simulatedFocalRatio:(float)a8 sourceColorGain:(float)a9 sourceColorLux:(float)a10;
- (NSData)backgroundColorCube;
- (NSData)foregroundColorCube;
- (__CVBuffer)destinationColorPixelBuffer;
- (float)colorCubeIntensity;
- (float)simulatedFocalRatio;
- (float)sourceColorGain;
- (float)sourceColorLux;
- (int)relightingCondition;
- (void)dealloc;
- (void)setParentGenericRequestFrom:(id)a3;
- (void)setParentGenericRequestTo:(id)a3;
@end

@implementation CVAPortraitRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColorCube, 0);
  objc_storeStrong((id *)&self->_backgroundColorCube, 0);
  objc_storeStrong((id *)&self->_parentGenericRequestTo, 0);
  objc_storeStrong((id *)&self->_parentGenericRequestFrom, 0);

  objc_storeStrong((id *)&self->_mattingRequest, 0);
}

- (float)sourceColorLux
{
  return self->_sourceColorLux;
}

- (float)sourceColorGain
{
  return self->_sourceColorGain;
}

- (float)simulatedFocalRatio
{
  return self->_simulatedFocalRatio;
}

- (float)colorCubeIntensity
{
  return self->_colorCubeIntensity;
}

- (NSData)foregroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)backgroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (int)relightingCondition
{
  return self->_relightingCondition;
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

- (__CVBuffer)destinationColorPixelBuffer
{
  return self->_destinationColorPixelBuffer;
}

- (CVAMattingRequest)mattingRequest
{
  return (CVAMattingRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_destinationColorPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitRequest;
  [(CVAPortraitRequest *)&v3 dealloc];
}

- (CVAPortraitRequest)initWithMattingRequest:(id)a3 destinationColorPixelBuffer:(__CVBuffer *)a4 backgroundColorCube:(id)a5 foregroundColorCube:(id)a6 colorCubeIntensity:(float)a7 simulatedFocalRatio:(float)a8 sourceColorGain:(float)a9 sourceColorLux:(float)a10
{
  id v19 = a3;
  v20 = (NSData *)a5;
  v21 = (NSData *)a6;
  v27.receiver = self;
  v27.super_class = (Class)CVAPortraitRequest;
  v22 = [(CVAPortraitRequest *)&v27 init];
  objc_storeStrong((id *)&v22->_mattingRequest, a3);
  v22->_destinationColorPixelBuffer = a4;
  CVPixelBufferRetain(a4);
  backgroundColorCube = v22->_backgroundColorCube;
  v22->_backgroundColorCube = v20;
  v24 = v20;

  foregroundColorCube = v22->_foregroundColorCube;
  v22->_foregroundColorCube = v21;

  v22->_colorCubeIntensity = a7;
  v22->_simulatedFocalRatio = a8;
  v22->_sourceColorGain = a9;
  v22->_sourceColorLux = a10;

  return v22;
}

@end