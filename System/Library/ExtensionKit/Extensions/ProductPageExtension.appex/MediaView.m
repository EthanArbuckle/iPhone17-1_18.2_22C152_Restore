@interface MediaView
- (UIColor)backgroundColor;
- (_TtC20ProductPageExtension9MediaView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension9MediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation MediaView

- (UIColor)backgroundColor
{
  id v2 = [*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension9MediaView_contentContainer)+ OBJC_IVAR____TtC20ProductPageExtensionP33_FB55F4AFA9572A544272989A93E5CCC820UberContentContainer_contents) backgroundColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10045360C(a3);
}

- (_TtC20ProductPageExtension9MediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100454EB0();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_100453D34();
}

- (_TtC20ProductPageExtension9MediaView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension9MediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9MediaView_contentContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9MediaView_reflectionView);
}

@end