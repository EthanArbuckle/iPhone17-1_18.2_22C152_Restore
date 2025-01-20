@interface BadgeParagraphView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityParagraphLabel;
- (_TtC20ProductPageExtension18BadgeParagraphView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18BadgeParagraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BadgeParagraphView

- (_TtC20ProductPageExtension18BadgeParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18BadgeParagraphView *)sub_100019CF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18BadgeParagraphView)initWithCoder:(id)a3
{
  result = (_TtC20ProductPageExtension18BadgeParagraphView *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension18BadgeParagraphView_paragraphLabel);
  v6 = self;
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v8 = v7;
  id v9 = [(BadgeParagraphView *)v6 traitCollection];
  double v10 = sub_10001B1A4(v8, width);
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
  sub_10001A388();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10001A640((uint64_t)a3);
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_10001A790();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityParagraphLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension18BadgeParagraphView_paragraphLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18BadgeParagraphView_paragraphLabel));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18BadgeParagraphView_metrics;

  sub_10001B3CC((uint64_t)v3);
}

@end