@interface CVAPortraitGenericRequestCubeImpl
- (CVAPortraitVideoPipeline)portraitVideoPipeline;
- (NSData)cubeData;
- (__CVBuffer)sourceColorPixelBuffer;
- (void)dealloc;
- (void)setCubeData:(id)a3;
- (void)setPortraitVideoPipeline:(id)a3;
- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3;
@end

@implementation CVAPortraitGenericRequestCubeImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubeData, 0);

  objc_storeStrong((id *)&self->_portraitVideoPipeline, 0);
}

- (void)setCubeData:(id)a3
{
}

- (NSData)cubeData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3
{
  self->_sourceColorPixelBuffer = a3;
}

- (__CVBuffer)sourceColorPixelBuffer
{
  return self->_sourceColorPixelBuffer;
}

- (void)setPortraitVideoPipeline:(id)a3
{
}

- (CVAPortraitVideoPipeline)portraitVideoPipeline
{
  return (CVAPortraitVideoPipeline *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_sourceColorPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CVAPortraitGenericRequestCubeImpl;
  [(CVAPortraitGenericRequestCubeImpl *)&v3 dealloc];
}

@end