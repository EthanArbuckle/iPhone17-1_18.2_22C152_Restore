@interface RSFrame
- (RSCamera)sceneCamera;
- (__CVBuffer)colorBuffer;
- (__CVBuffer)depthBuffer;
- (__CVBuffer)depthConfidenceBuffer;
- (__CVBuffer)sceneColorBuffer;
- (__CVBuffer)semanticConfidenceBuffer;
- (__CVBuffer)semanticLabelBuffer;
- (__n128)referenceOriginTransform;
- (__n128)setReferenceOriginTransform:(__n128)a3;
- (int64_t)deviceOrientation;
- (int64_t)vioTrackingState;
- (uint64_t)setCamera:(uint64_t)a3;
- (uint64_t)setRawFeaturePoints:(uint64_t)a3;
- (void)setColorBuffer:(__CVBuffer *)a3;
- (void)setDepthBuffer:(__CVBuffer *)a3;
- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setSceneCamera:(id)a3;
- (void)setSceneColorBuffer:(__CVBuffer *)a3;
- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticLabelBuffer:(__CVBuffer *)a3;
- (void)setVioTrackingState:(int64_t)a3;
@end

@implementation RSFrame

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

- (__CVBuffer)depthBuffer
{
  return (__CVBuffer *)*(id *)self->depthBuffer;
}

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->depthBuffer;
  *(void *)self->depthBuffer = a3;
  v3 = a3;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->depthConfidenceBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  id v4 = *(id *)self->depthConfidenceBuffer;
  *(void *)self->depthConfidenceBuffer = a3;
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

- (int64_t)vioTrackingState
{
  return *(void *)self->vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  *(void *)self->vioTrackingState = a3;
}

- (__n128)referenceOriginTransform
{
  return a1[6];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  result[9] = a5;
  return result;
}

- (RSCamera)sceneCamera
{
  v2 = (void *)swift_unknownObjectRetain();

  return (RSCamera *)v2;
}

- (void)setSceneCamera:(id)a3
{
  *(void *)self->sceneCamera = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
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

- (int64_t)deviceOrientation
{
  return *(void *)self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  *(void *)self->deviceOrientation = a3;
}

- (uint64_t)setRawFeaturePoints:(uint64_t)a3
{
  *(void *)(a1 + 16) = a3;
  swift_unknownObjectRetain();

  return swift_unknownObjectRelease();
}

- (uint64_t)setCamera:(uint64_t)a3
{
  *(void *)(a1 + 24) = a3;
  swift_unknownObjectRetain();

  return swift_unknownObjectRelease();
}

@end