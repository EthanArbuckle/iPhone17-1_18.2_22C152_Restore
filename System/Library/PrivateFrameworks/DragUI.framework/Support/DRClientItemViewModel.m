@interface DRClientItemViewModel
- (BOOL)createImageRequest;
- (BOOL)imageDirty;
- (BOOL)invalidateImage;
- (CGPoint)anchorPoint;
- (DRClientItemViewModel)initWithClient:(id)a3;
- (DRClientModel)client;
- (_DUIImageComponent)imageComponent;
- (_DUIPreview)preview;
- (void)fulfillImageRequest;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setImageComponent:(id)a3;
- (void)setImageDirty:(BOOL)a3;
- (void)setPreview:(id)a3;
@end

@implementation DRClientItemViewModel

- (DRClientItemViewModel)initWithClient:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DRClientItemViewModel;
  v6 = [(DRClientItemViewModel *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    __asm { FMOV            V0.2D, #0.5 }
    v7->_anchorPoint = _Q0;
    v7->_imageDirty = [v5 isSource];
  }

  return v7;
}

- (BOOL)invalidateImage
{
  p_imageDirty = &self->_imageDirty;
  if (!self->_imageDirty) {
    goto LABEL_4;
  }
  if (self->_pendingRequestCount)
  {
    p_imageDirty = &self->_invalidatedDuringRequest;
LABEL_4:
    BOOL result = 1;
    BOOL *p_imageDirty = 1;
    return result;
  }
  return 0;
}

- (BOOL)createImageRequest
{
  if (!self->_imageDirty) {
    return 0;
  }
  unint64_t pendingRequestCount = self->_pendingRequestCount;
  if (pendingRequestCount)
  {
    if (!self->_invalidatedDuringRequest) {
      return 0;
    }
  }
  self->_unint64_t pendingRequestCount = pendingRequestCount + 1;
  self->_invalidatedDuringRequest = 0;
  return 1;
}

- (void)fulfillImageRequest
{
  unint64_t pendingRequestCount = self->_pendingRequestCount;
  if (pendingRequestCount)
  {
    unint64_t v3 = pendingRequestCount - 1;
    self->_unint64_t pendingRequestCount = v3;
    if (!v3) {
      self->_imageDirty = 0;
    }
  }
}

- (DRClientModel)client
{
  return self->_client;
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
}

- (BOOL)imageDirty
{
  return self->_imageDirty;
}

- (void)setImageDirty:(BOOL)a3
{
  self->_imageDirty = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end