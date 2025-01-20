@interface HeaderView
- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithReuseIdentifier:(id)a3;
- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)init;
- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeaderView

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)init
{
  return (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView *)sub_10014D934();
}

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10014F998();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004DD484();
}

- (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView_mediaView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_8767515069BB09BCE0E30A883EC3EF0710HeaderView_gradientBlurView);
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    sub_1007675F0();
    NSString v4 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_s22SubscribePageExtension10HeaderViewCMa_0();
  v5 = [(HeaderView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC22SubscribePageExtensionP33_59D788B89EC47DDFEEBB94FF9EFA27D710HeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s22SubscribePageExtension10HeaderViewCMa_0();
  return [(HeaderView *)&v5 initWithCoder:a3];
}

@end