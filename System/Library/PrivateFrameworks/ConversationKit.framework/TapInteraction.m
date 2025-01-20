@interface TapInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (UIView)view;
- (_TtC15ConversationKit14TapInteraction)init;
- (int64_t)numberOfTapsRequired;
- (void)didMoveToView:(id)a3;
- (void)handleRecognizer:(id)a3;
- (void)setNumberOfTapsRequired:(int64_t)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation TapInteraction

- (UIView)view
{
  v2 = (void *)TapInteraction.view.getter();
  return (UIView *)v2;
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  TapInteraction.view.setter(a3);
}

- (int64_t)numberOfTapsRequired
{
  v2 = self;
  id v3 = TapInteraction.numberOfTapsRequired.getter();

  return (int64_t)v3;
}

- (void)setNumberOfTapsRequired:(int64_t)a3
{
  v4 = self;
  TapInteraction.numberOfTapsRequired.setter(a3);
}

- (_TtC15ConversationKit14TapInteraction)init
{
  return (_TtC15ConversationKit14TapInteraction *)TapInteraction.init()();
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  TapInteraction.willMove(to:)((UIView_optional *)a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  TapInteraction.didMove(to:)((UIView_optional *)a3);
}

- (void)handleRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TapInteraction.handleRecognizer(_:)(v4);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ConversationKit14TapInteraction_tapGestureRecognizer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  Swift::Bool v9 = TapInteraction.gestureRecognizer(_:shouldRequireFailureOf:)(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = TapInteraction.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer *)v8, (UITouch)v7);

  return v9;
}

@end