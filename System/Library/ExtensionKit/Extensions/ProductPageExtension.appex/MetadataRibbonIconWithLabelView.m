@interface MetadataRibbonIconWithLabelView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel;
- (_TtC20ProductPageExtension31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonIconWithLabelView

- (_TtC20ProductPageExtension31MetadataRibbonIconWithLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31MetadataRibbonIconWithLabelView *)sub_1002B42E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31MetadataRibbonIconWithLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002B6AF0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002B4DC0();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_1002B50BC();
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

- (_TtC19AppStoreKitInternal11ArtworkView)accessibilityArtworkView
{
  return (_TtC19AppStoreKitInternal11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_artworkView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityUILabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_label));
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_metrics;
  uint64_t v4 = sub_100777180();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_artworkView));
  swift_release();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_id, &qword_10094C4B0);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_itemType, &qword_10094C4B8);
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31MetadataRibbonIconWithLabelView_configuration;

  sub_1002B7390((uint64_t)v5);
}

@end