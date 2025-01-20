@interface SRTypeToSiriKeyboardReadinessObserver
- (SRTypeToSiriKeyboardReadinessObserver)init;
- (SRTypeToSiriKeyboardReadinessObserver)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)keyboardCanRespondToUserInputWithNotification:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SRTypeToSiriKeyboardReadinessObserver

- (SRTypeToSiriKeyboardReadinessObserver)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v3 = (SRTypeToSiriKeyboardReadinessObserver *)sub_10007E56C();
  swift_unknownObjectRelease();
  return v3;
}

- (void)dealloc
{
  v2 = self;
  sub_10007DDF8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___SRTypeToSiriKeyboardReadinessObserver_delegate;

  sub_10007E630((uint64_t)v3);
}

- (void)start
{
  v2 = self;
  sub_10007DF5C();
}

- (void)stop
{
  v2 = self;
  sub_10007E1C0();
}

- (void)keyboardCanRespondToUserInputWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10007E2D8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (SRTypeToSiriKeyboardReadinessObserver)init
{
  result = (SRTypeToSiriKeyboardReadinessObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end