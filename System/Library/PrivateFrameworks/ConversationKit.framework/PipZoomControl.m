@interface PipZoomControl
+ (BOOL)isZoomSupported;
- (_TtC15ConversationKit14PipZoomControl)init;
- (void)handlePinchWithSender:(id)a3;
- (void)zoomControl:(id)a3 didChangeZoomFactor:(double)a4 interactionType:(int64_t)a5;
@end

@implementation PipZoomControl

- (_TtC15ConversationKit14PipZoomControl)init
{
  return (_TtC15ConversationKit14PipZoomControl *)PipZoomControl.init()();
}

- (void)handlePinchWithSender:(id)a3
{
  v4 = (UIPinchGestureRecognizer *)a3;
  v5 = self;
  PipZoomControl.handlePinch(sender:)(v4);
}

+ (BOOL)isZoomSupported
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PipZoomControl_pinchGestureRecognizer));
  swift_bridgeObjectRelease();
}

- (void)zoomControl:(id)a3 didChangeZoomFactor:(double)a4 interactionType:(int64_t)a5
{
  id v7 = a3;
  v8 = self;
  PipZoomControl.zoomControl(_:didChangeZoomFactor:interactionType:)(a4);
}

@end