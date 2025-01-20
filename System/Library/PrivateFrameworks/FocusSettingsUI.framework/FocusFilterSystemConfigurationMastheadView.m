@interface FocusFilterSystemConfigurationMastheadView
- (NSString)subtitle;
- (NSString)symbolName;
- (NSString)title;
- (UIColor)color;
- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithCoder:(id)a3;
- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithFrame:(CGRect)a3;
- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithTitle:(id)a3 subtitle:(id)a4 symbolName:(id)a5 color:(id)a6;
@end

@implementation FocusFilterSystemConfigurationMastheadView

- (NSString)title
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_220F32728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)symbolName
{
  return (NSString *)sub_220D82B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_symbolName);
}

- (NSString)subtitle
{
  return (NSString *)sub_220D82B34((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_subtitle);
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_color));
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithTitle:(id)a3 subtitle:(id)a4 symbolName:(id)a5 color:(id)a6
{
  uint64_t v9 = sub_220F32768();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v15 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_220F32768();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  a5 = (id)sub_220F32768();
  uint64_t v15 = v14;
LABEL_6:
  id v16 = a6;
  FocusFilterSystemConfigurationMastheadView.init(title:subtitle:symbolName:color:)(v9, v11, (uint64_t)a4, v13, (uint64_t)a5, v15, a6);
  return result;
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_rootView) = 0;
  id v4 = a3;

  result = (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *)sub_220F32E28();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView)initWithFrame:(CGRect)a3
{
  result = (_TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_color));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15FocusSettingsUI42FocusFilterSystemConfigurationMastheadView_rootView);
}

@end