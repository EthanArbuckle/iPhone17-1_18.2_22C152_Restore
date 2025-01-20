@interface HeadphoneSpecifier
- (_TtC13HearingModeUI18HeadphoneSpecifier)init;
- (_TtC13HearingModeUI18HeadphoneSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
- (id)specifierEnabled;
- (void)buttonTappedWithSender:(id)a3;
- (void)setSepcifierEnabledWithEnabled:(id)a3;
@end

@implementation HeadphoneSpecifier

- (void)buttonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_2512C4AB8();
  uint64_t v5 = swift_unknownObjectRelease();
  v6 = *(void (**)(uint64_t))((char *)&v4->super.super.isa
                                      + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_buttonTapAction);
  if (v6) {
    v6(v5);
  }

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (id)specifierEnabled
{
  v2 = *(uint64_t (**)(void))((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_getAction);
  if (v2)
  {
    v3 = self;
    v2 = (uint64_t (*)(void))v2();
  }
  return v2;
}

- (void)setSepcifierEnabledWithEnabled:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_setAction);
  if (v3)
  {
    swift_unknownObjectRetain();
    v6 = self;
    v3(a3);
    swift_unknownObjectRelease();
  }
}

- (_TtC13HearingModeUI18HeadphoneSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  if (a4)
  {
    swift_unknownObjectRetain();
    sub_2512C4AB8();
    swift_unknownObjectRelease();
  }
  result = (_TtC13HearingModeUI18HeadphoneSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingModeUI18HeadphoneSpecifier)init
{
  result = (_TtC13HearingModeUI18HeadphoneSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25129AED4(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_getAction));
  sub_25129AED4(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_setAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13HearingModeUI18HeadphoneSpecifier_buttonTapAction);
  sub_25129AED4(v3);
}

@end