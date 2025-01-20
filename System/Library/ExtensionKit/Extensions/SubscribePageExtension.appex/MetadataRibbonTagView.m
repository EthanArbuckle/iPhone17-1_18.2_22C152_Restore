@interface MetadataRibbonTagView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC22SubscribePageExtension21MetadataRibbonTagView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21MetadataRibbonTagView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonTagView

- (_TtC22SubscribePageExtension21MetadataRibbonTagView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21MetadataRibbonTagView *)sub_10038BED0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21MetadataRibbonTagView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10038D5D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10038C2FC();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = sub_100761180();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100761190();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_tagLabel);
  v30[4] = sub_10075AA00();
  v30[5] = &protocol witness table for UILabel;
  v30[1] = v15;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_metrics, v5);
  swift_unknownObjectRetain();
  v16 = self;
  id v17 = v15;
  sub_100761130();
  sub_100761140();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  swift_unknownObjectRelease();

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.var3 = v29;
  result.var2 = v28;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_tagLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_tagLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_metrics;
  uint64_t v4 = sub_100761180();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_id, (uint64_t *)&unk_100938A80);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonTagView_itemType, &qword_100935F30);
}

@end