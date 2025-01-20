@interface BadgeParagraphView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider18BadgeParagraphView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18BadgeParagraphView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityParagraphLabel;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BadgeParagraphView

- (_TtC18ASMessagesProvider18BadgeParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18BadgeParagraphView *)sub_643C38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18BadgeParagraphView)initWithCoder:(id)a3
{
  result = (_TtC18ASMessagesProvider18BadgeParagraphView *)sub_77EB20();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider18BadgeParagraphView_paragraphLabel);
  v6 = self;
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v8 = v7;
  id v9 = [(BadgeParagraphView *)v6 traitCollection];
  double v10 = sub_6450B4(v8, width);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6442D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_644588((uint64_t)a3);
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_6446D8();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityParagraphLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider18BadgeParagraphView_paragraphLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18BadgeParagraphView_paragraphLabel));
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider18BadgeParagraphView_metrics;

  sub_6452DC((uint64_t)v3);
}

@end