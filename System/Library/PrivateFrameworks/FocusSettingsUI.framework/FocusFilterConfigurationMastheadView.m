@interface FocusFilterConfigurationMastheadView
- (NSString)bundleIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithBundleIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5;
- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithCoder:(id)a3;
- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithFrame:(CGRect)a3;
@end

@implementation FocusFilterConfigurationMastheadView

- (NSString)bundleIdentifier
{
  return (NSString *)sub_220E8449C();
}

- (NSString)title
{
  return (NSString *)sub_220E8449C();
}

- (NSString)subtitle
{
  if (*(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_subtitle))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_220F32728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithBundleIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  uint64_t v6 = sub_220F32768();
  uint64_t v8 = v7;
  uint64_t v9 = sub_220F32768();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_220F32768();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  FocusFilterConfigurationMastheadView.init(bundleIdentifier:title:subtitle:)(v6, v8, v9, v11, v12, v14);
  return result;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_rootView) = 0;
  id v4 = a3;

  result = (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *)sub_220F32E28();
  __break(1u);
  return result;
}

- (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView)initWithFrame:(CGRect)a3
{
  result = (_TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15FocusSettingsUI36FocusFilterConfigurationMastheadView_rootView);
}

@end