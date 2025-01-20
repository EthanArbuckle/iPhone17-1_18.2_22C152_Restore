@interface PushToTalkTalkButtonGestureRecognizer
- (_TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PushToTalkTalkButtonGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  v2 = self;
  PushToTalkTalkButtonGestureRecognizer.reset()();
}

- (_TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  PushToTalkTalkButtonGestureRecognizer.init(target:action:)();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer_interval;
  type metadata accessor for DispatchTimeInterval();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_unknownObjectRelease();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer_previous, (uint64_t *)&demangling cache variable for type metadata for (location: CGPoint, time: Date)?);
  swift_release();
}

@end