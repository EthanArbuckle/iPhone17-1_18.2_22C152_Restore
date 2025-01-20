@interface MediaView
- (UIColor)backgroundColor;
- (_TtC18ASMessagesProvider9MediaView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider9MediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation MediaView

- (UIColor)backgroundColor
{
  id v2 = [*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer)+ OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents) backgroundColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ED4A8(a3);
}

- (_TtC18ASMessagesProvider9MediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1EEDD8();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1EDC5C();
}

- (_TtC18ASMessagesProvider9MediaView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProvider9MediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_contentContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9MediaView_reflectionView);
}

@end