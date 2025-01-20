@interface ForeheadWindow
- (_TtC19LiveTranscriptionUI14ForeheadWindow)init;
- (void)systemApertureLayoutDidChange:(id)a3;
@end

@implementation ForeheadWindow

- (_TtC19LiveTranscriptionUI14ForeheadWindow)init
{
  return (_TtC19LiveTranscriptionUI14ForeheadWindow *)sub_100007704();
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  sub_100008534();
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000079F4(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1000067B8((uint64_t)self + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__verticalSizeClass, &qword_10006B060);
  sub_1000067B8((uint64_t)self + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__horizontalSizeClass, &qword_10006B060);

  v3 = (char *)self + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__foreheadRect;
  uint64_t v4 = sub_100006380(&qword_10006B080);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19LiveTranscriptionUI14ForeheadWindow__frames;
  uint64_t v6 = sub_100006380(&qword_10006B078);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end