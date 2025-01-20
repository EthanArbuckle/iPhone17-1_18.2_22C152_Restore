@interface LockScreenMastheadView
- (NSString)symbolImageName;
- (UIColor)keyColor;
- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithCoder:(id)a3;
- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithFrame:(CGRect)a3;
- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithKeyColor:(id)a3 symbolImageName:(id)a4;
@end

@implementation LockScreenMastheadView

- (NSString)symbolImageName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_220F32728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_keyColor));
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithKeyColor:(id)a3 symbolImageName:(id)a4
{
  uint64_t v5 = sub_220F32768();
  uint64_t v7 = v6;
  id v8 = a3;
  LockScreenMastheadView.init(keyColor:symbolImageName:)(a3, v5, v7);
  return result;
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_rootView) = 0;
  id v4 = a3;

  result = (_TtC15FocusSettingsUI22LockScreenMastheadView *)sub_220F32E28();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI22LockScreenMastheadView)initWithFrame:(CGRect)a3
{
  result = (_TtC15FocusSettingsUI22LockScreenMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_keyColor));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15FocusSettingsUI22LockScreenMastheadView_rootView);
}

@end