@interface MetadataRibbonBorderedLabelWithDescriptionView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityBorderedLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonBorderedLabelWithDescriptionView

- (_TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView *)sub_EBB7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_EDE64();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_EC17C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_EC44C();
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
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_borderedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_descriptionLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_metrics;
  uint64_t v4 = sub_779450();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_borderLabelViewPlacement;
  uint64_t v6 = sub_778A60();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_id, (uint64_t *)&unk_9563B0);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider46MetadataRibbonBorderedLabelWithDescriptionView_itemType, &qword_9505D0);
}

@end