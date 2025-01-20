@interface ASUIAppHeaderView
- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithCoder:(id)a3;
- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation ASUIAppHeaderView

- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100021350();
}

- (_TtC16AccessorySetupUI17ASUIAppHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC16AccessorySetupUI17ASUIAppHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appIcon));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_nameLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16AccessorySetupUI17ASUIAppHeaderView_appUsageLabel);
}

@end