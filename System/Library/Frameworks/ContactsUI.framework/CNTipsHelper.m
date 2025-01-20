@interface CNTipsHelper
+ (_TtC10ContactsUI12CNTipsHelper)shared;
- (UIView)currentTipView;
- (_TtC10ContactsUI12CNTipsHelper)init;
- (void)setCurrentTipView:(id)a3;
- (void)tipKitSetSiriTipContext:(id)a3;
- (void)tipKitStartObservation:(id)a3;
- (void)tipKitStopObservation;
@end

@implementation CNTipsHelper

+ (_TtC10ContactsUI12CNTipsHelper)shared
{
  if (qword_1E913B570 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E913B588;

  return (_TtC10ContactsUI12CNTipsHelper *)v2;
}

- (UIView)currentTipView
{
  return (UIView *)sub_18B737228((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
}

- (void)setCurrentTipView:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)tipKitStartObservation:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_18B736560((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)tipKitStopObservation
{
  v3 = self;
  sub_18B736908((uint64_t)v3, v2);
}

- (void)tipKitSetSiriTipContext:(id)a3
{
  qword_1E913B560 = sub_18B985E68();
  qword_1E913B568 = v3;

  swift_bridgeObjectRelease();
}

- (_TtC10ContactsUI12CNTipsHelper)init
{
  return (_TtC10ContactsUI12CNTipsHelper *)CNTipsHelper.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI12CNTipsHelper_currentTipView);
}

@end