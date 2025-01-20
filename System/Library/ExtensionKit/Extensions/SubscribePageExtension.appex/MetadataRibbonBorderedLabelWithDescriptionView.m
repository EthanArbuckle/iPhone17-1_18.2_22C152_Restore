@interface MetadataRibbonBorderedLabelWithDescriptionView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBorderedLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonBorderedLabelWithDescriptionView

- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView *)sub_100710B74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100712AF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100711174();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_100711444();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBorderedLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  uint64_t v4 = sub_1007633F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  uint64_t v6 = sub_100762990();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_id, (uint64_t *)&unk_100938A80);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension46MetadataRibbonBorderedLabelWithDescriptionView_itemType, &qword_100935F30);
}

@end