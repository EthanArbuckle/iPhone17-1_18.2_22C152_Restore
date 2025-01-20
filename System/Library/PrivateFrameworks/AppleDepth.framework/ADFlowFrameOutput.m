@interface ADFlowFrameOutput
- (NSDictionary)figuresOfMerit;
- (__CVBuffer)confidence;
- (__CVBuffer)confidenceLevels;
- (__CVBuffer)depth;
- (__CVBuffer)depthMask;
- (__CVBuffer)normals;
- (__CVBuffer)uncertainty;
- (void)dealloc;
- (void)setConfidence:(__CVBuffer *)a3;
- (void)setConfidenceLevels:(__CVBuffer *)a3;
- (void)setDepth:(__CVBuffer *)a3;
- (void)setDepthMask:(__CVBuffer *)a3;
- (void)setFiguresOfMerit:(id)a3;
- (void)setNormals:(__CVBuffer *)a3;
- (void)setUncertainty:(__CVBuffer *)a3;
@end

@implementation ADFlowFrameOutput

- (void).cxx_destruct
{
}

- (NSDictionary)figuresOfMerit
{
  return self->_figuresOfMerit;
}

- (__CVBuffer)normals
{
  return self->_normals;
}

- (__CVBuffer)depthMask
{
  return self->_depthMask;
}

- (__CVBuffer)uncertainty
{
  return self->_uncertainty;
}

- (__CVBuffer)confidenceLevels
{
  return self->_confidenceLevels;
}

- (__CVBuffer)confidence
{
  return self->_confidence;
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_depth);
  CVPixelBufferRelease(self->_confidence);
  CVPixelBufferRelease(self->_uncertainty);
  CVPixelBufferRelease(self->_depthMask);
  CVPixelBufferRelease(self->_normals);
  CVPixelBufferRelease(self->_confidenceLevels);
  v3.receiver = self;
  v3.super_class = (Class)ADFlowFrameOutput;
  [(ADFlowFrameOutput *)&v3 dealloc];
}

- (void)setFiguresOfMerit:(id)a3
{
}

- (void)setNormals:(__CVBuffer *)a3
{
  self->_normals = CVPixelBufferRetain(a3);
}

- (void)setDepthMask:(__CVBuffer *)a3
{
  self->_depthMask = CVPixelBufferRetain(a3);
}

- (void)setUncertainty:(__CVBuffer *)a3
{
  self->_uncertainty = CVPixelBufferRetain(a3);
}

- (void)setConfidenceLevels:(__CVBuffer *)a3
{
  self->_confidenceLevels = CVPixelBufferRetain(a3);
}

- (void)setConfidence:(__CVBuffer *)a3
{
  self->_confidence = CVPixelBufferRetain(a3);
}

- (void)setDepth:(__CVBuffer *)a3
{
  self->_depth = CVPixelBufferRetain(a3);
}

@end