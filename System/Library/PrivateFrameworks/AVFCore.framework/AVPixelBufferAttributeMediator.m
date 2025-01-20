@interface AVPixelBufferAttributeMediator
- (AVPixelBufferAttributeMediator)init;
- (id)mediatedPixelBufferAttributes;
- (void)dealloc;
- (void)removeRequestedPixelBufferAttributesAttributesForKey:(id)a3;
- (void)setLayersAreSuppressed:(BOOL)a3;
- (void)setRequestedPixelBufferAttributes:(id)a3 forKey:(id)a4;
@end

@implementation AVPixelBufferAttributeMediator

- (AVPixelBufferAttributeMediator)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVPixelBufferAttributeMediator;
  v2 = [(AVPixelBufferAttributeMediator *)&v4 init];
  if (v2)
  {
    if (VTPixelBufferAttributesMediatorCreate())
    {

      return 0;
    }
    else
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
    }
  }
  return v2;
}

- (id)mediatedPixelBufferAttributes
{
  int v2 = VTPixelBufferAttributesMediatorCopyProperty();
  id result = 0;
  if (!v2) {
    return 0;
  }
  return result;
}

- (void)setRequestedPixelBufferAttributes:(id)a3 forKey:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (VTPixelBufferAttributesMediatorAddLayer(), !a3))
  {
    VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
  }
  else
  {
    VTPixelBufferAttributesMediatorSetRequestedPixelBufferAttributesForKey();
  }
}

- (void)setLayersAreSuppressed:(BOOL)a3
{
}

- (void)removeRequestedPixelBufferAttributesAttributesForKey:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    VTPixelBufferAttributesMediatorRemoveLayer();
  }
  VTPixelBufferAttributesMediatorRemoveRequestedPixelBufferAttributesForKey();
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  VTPixelBufferAttributesMediatorNotificationBarrier();
  mediator = self->_mediator;
  if (mediator) {
    CFRelease(mediator);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPixelBufferAttributeMediator;
  [(AVPixelBufferAttributeMediator *)&v4 dealloc];
}

@end