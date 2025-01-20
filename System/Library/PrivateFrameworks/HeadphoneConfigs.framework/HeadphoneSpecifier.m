@interface HeadphoneSpecifier
- (_TtC16HeadphoneConfigs18HeadphoneSpecifier)init;
- (_TtC16HeadphoneConfigs18HeadphoneSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
- (id)specifierEnabled;
- (void)buttonTappedWithSender:(id)a3;
- (void)setSepcifierEnabledWithEnabled:(id)a3;
@end

@implementation HeadphoneSpecifier

- (void)buttonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E4CBF550();
  uint64_t v5 = swift_unknownObjectRelease();
  v6 = *(void (**)(uint64_t))((char *)&v4->super.super.isa
                                      + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);
  if (v6) {
    v6(v5);
  }

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (id)specifierEnabled
{
  v2 = *(uint64_t (**)(void))((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction);
  if (v2)
  {
    v3 = self;
    v4 = (void *)v2();
  }
  else
  {
    sub_1E4C88844();
    v4 = (void *)sub_1E4CBF460();
  }

  return v4;
}

- (void)setSepcifierEnabledWithEnabled:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    v3(v5);
  }
}

- (_TtC16HeadphoneConfigs18HeadphoneSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  if (a4)
  {
    swift_unknownObjectRetain();
    sub_1E4CBF550();
    swift_unknownObjectRelease();
  }
  result = (_TtC16HeadphoneConfigs18HeadphoneSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs18HeadphoneSpecifier)init
{
  result = (_TtC16HeadphoneConfigs18HeadphoneSpecifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E4C879AC(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction));
  sub_1E4C879AC(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);

  sub_1E4C879AC(v3);
}

@end