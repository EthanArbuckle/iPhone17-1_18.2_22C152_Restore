@interface OUFrame
- (OUCamera)camera;
- (OUCamera)sceneCamera;
- (__CVBuffer)colorBuffer;
- (__CVBuffer)sceneColorBuffer;
- (__CVBuffer)sceneDepthBuffer;
- (__CVBuffer)sceneDepthConfidenceBuffer;
- (__CVBuffer)semanticConfidenceBuffer;
- (__CVBuffer)semanticLabelBuffer;
- (__n128)referenceOriginTransform;
- (__n128)setReferenceOriginTransform:(__n128)a3;
- (double)timestamp;
- (int64_t)deviceOrientation;
- (void)setColorBuffer:(__CVBuffer *)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setSceneColorBuffer:(__CVBuffer *)a3;
- (void)setSceneDepthBuffer:(__CVBuffer *)a3;
- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticLabelBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation OUFrame

- (OUCamera)camera
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OUCamera *)v2;
}

- (OUCamera)sceneCamera
{
  v2 = (void *)swift_unknownObjectRetain();

  return (OUCamera *)v2;
}

- (double)timestamp
{
  return *(double *)self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(double *)self->timestamp = a3;
}

- (__n128)referenceOriginTransform
{
  return a1[3];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (__CVBuffer)colorBuffer
{
  return (__CVBuffer *)*(id *)self->colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->colorBuffer;
  *(void *)self->colorBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)sceneColorBuffer
{
  return (__CVBuffer *)*(id *)self->sceneColorBuffer;
}

- (void)setSceneColorBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->sceneColorBuffer;
  *(void *)self->sceneColorBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)sceneDepthBuffer
{
  return (__CVBuffer *)*(id *)self->sceneDepthBuffer;
}

- (void)setSceneDepthBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->sceneDepthBuffer;
  *(void *)self->sceneDepthBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)sceneDepthConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->sceneDepthConfidenceBuffer;
}

- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->sceneDepthConfidenceBuffer;
  *(void *)self->sceneDepthConfidenceBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)semanticLabelBuffer
{
  return (__CVBuffer *)*(id *)self->semanticLabelBuffer;
}

- (void)setSemanticLabelBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->semanticLabelBuffer;
  *(void *)self->semanticLabelBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)semanticConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->semanticConfidenceBuffer;
}

- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->semanticConfidenceBuffer;
  *(void *)self->semanticConfidenceBuffer = a3;
  v3 = a3;
}

- (int64_t)deviceOrientation
{
  return *(void *)self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  *(void *)self->deviceOrientation = a3;
}

@end