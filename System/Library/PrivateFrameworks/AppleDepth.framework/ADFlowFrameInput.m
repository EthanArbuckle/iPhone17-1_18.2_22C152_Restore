@interface ADFlowFrameInput
- (NSArray)pointClouds;
- (__CVBuffer)color;
- (__CVBuffer)pearl;
- (__CVBuffer)secondaryColor;
- (void)dealloc;
- (void)setColor:(__CVBuffer *)a3;
- (void)setPearl:(__CVBuffer *)a3;
- (void)setPointClouds:(id)a3;
- (void)setSecondaryColor:(__CVBuffer *)a3;
@end

@implementation ADFlowFrameInput

- (void).cxx_destruct
{
}

- (NSArray)pointClouds
{
  return self->_pointClouds;
}

- (__CVBuffer)pearl
{
  return self->_pearl;
}

- (__CVBuffer)secondaryColor
{
  return self->_secondaryColor;
}

- (__CVBuffer)color
{
  return self->_color;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_color);
  CVPixelBufferRelease(self->_secondaryColor);
  CVPixelBufferRelease(self->_pearl);
  v3.receiver = self;
  v3.super_class = (Class)ADFlowFrameInput;
  [(ADFlowFrameInput *)&v3 dealloc];
}

- (void)setPointClouds:(id)a3
{
}

- (void)setPearl:(__CVBuffer *)a3
{
  self->_pearl = CVPixelBufferRetain(a3);
}

- (void)setSecondaryColor:(__CVBuffer *)a3
{
  self->_secondaryColor = CVPixelBufferRetain(a3);
}

- (void)setColor:(__CVBuffer *)a3
{
  self->_color = CVPixelBufferRetain(a3);
}

@end