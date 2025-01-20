@interface MetadataRibbonBarView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonBarView

- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21MetadataRibbonBarView *)sub_10017ACE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10017BE74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10017B124();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = sub_100775710();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100775720();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel);
  v28[4] = sub_10076EEF0();
  v28[5] = &protocol witness table for UILabel;
  v28[1] = v13;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_metrics, v5);
  swift_unknownObjectRetain();
  v14 = self;
  id v15 = v13;
  sub_1007756C0();
  sub_1007756D0();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_unknownObjectRelease();

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.var3 = v27;
  result.var2 = v26;
  result.var1 = v25;
  result.var0 = v24;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_metrics;
  uint64_t v4 = sub_100775710();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_id, &qword_10094C4B0);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_itemType, &qword_10094C4B8);
}

@end