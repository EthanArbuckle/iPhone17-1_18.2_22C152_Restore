@interface MediaView
- (UIColor)backgroundColor;
- (_TtC22SubscribePageExtension9MediaView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension9MediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation MediaView

- (UIColor)backgroundColor
{
  id v2 = [*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension9MediaView_contentContainer)+ OBJC_IVAR____TtC22SubscribePageExtensionP33_3BFA609B93F5C4376389C1E6266A901920UberContentContainer_contents) backgroundColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1005964D4(a3);
}

- (_TtC22SubscribePageExtension9MediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100597CF0();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_100596BFC();
}

- (_TtC22SubscribePageExtension9MediaView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension9MediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9MediaView_contentContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension9MediaView_reflectionView);
}

@end