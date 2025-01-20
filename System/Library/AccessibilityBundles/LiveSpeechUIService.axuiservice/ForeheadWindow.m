@interface ForeheadWindow
- (_TtC19LiveSpeechUIService14ForeheadWindow)init;
- (void)systemApertureLayoutDidChange:(id)a3;
@end

@implementation ForeheadWindow

- (_TtC19LiveSpeechUIService14ForeheadWindow)init
{
  return (_TtC19LiveSpeechUIService14ForeheadWindow *)sub_12C00();
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  sub_13928();
  unint64_t v4 = sub_A72B0();
  v5 = self;
  sub_12EF0(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_A35C((uint64_t)self + OBJC_IVAR____TtC19LiveSpeechUIService14ForeheadWindow__verticalSizeClass, &qword_D85C0);
  sub_A35C((uint64_t)self + OBJC_IVAR____TtC19LiveSpeechUIService14ForeheadWindow__horizontalSizeClass, &qword_D85C0);

  v3 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService14ForeheadWindow__foreheadRect;
  uint64_t v4 = sub_7AF4(&qword_D85E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19LiveSpeechUIService14ForeheadWindow__frames;
  uint64_t v6 = sub_7AF4(&qword_D85D8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end