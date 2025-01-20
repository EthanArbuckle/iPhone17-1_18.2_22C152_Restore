@interface CarouselItemModuleHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider28CarouselItemModuleHeaderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28CarouselItemModuleHeaderView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
@end

@implementation CarouselItemModuleHeaderView

- (_TtC18ASMessagesProvider28CarouselItemModuleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider28CarouselItemModuleHeaderView *)sub_718268(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider28CarouselItemModuleHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_719C8C();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemModuleHeaderView *)&v5 layoutSubviews];
  sub_718DD4(v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CarouselItemModuleHeaderView *)v3 traitCollection];
  sub_718DD4(v11);
  sub_FB9C(v11, v11[3]);
  sub_77B980();
  double v6 = v5;
  double v8 = v7;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeadingLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28CarouselItemModuleHeaderView_badgeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider28CarouselItemModuleHeaderView_titleLabel));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider28CarouselItemModuleHeaderView_displayOptions;
  uint64_t v4 = sub_775140();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28CarouselItemModuleHeaderView_badgeLabel));
  double v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider28CarouselItemModuleHeaderView_titleLabel);
}

@end