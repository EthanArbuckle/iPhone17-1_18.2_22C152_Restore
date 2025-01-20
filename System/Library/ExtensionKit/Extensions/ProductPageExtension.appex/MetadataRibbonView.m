@interface MetadataRibbonView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20ProductPageExtension18MetadataRibbonView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18MetadataRibbonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonView

- (_TtC20ProductPageExtension18MetadataRibbonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  v9 = self;
  _s20ProductPageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&v9->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((unsigned char *)&v9->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[MetadataRibbonView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  -[MetadataRibbonView setLayoutMargins:](v10, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v10;
}

- (_TtC20ProductPageExtension18MetadataRibbonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;
  _s20ProductPageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  result = (_TtC20ProductPageExtension18MetadataRibbonView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  MetadataRibbonView.layoutSubviews()();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  uint64_t v5 = sub_100774060();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_100774070();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  objc_super v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v13 = self;
  uint64_t v14 = swift_bridgeObjectRetain();
  sub_100525F3C(v14);
  swift_bridgeObjectRelease();
  v15 = (char *)v13 + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metrics;
  swift_beginAccess();
  (*(void (**)(unsigned char *, char *, uint64_t))(v6 + 16))(v8, v15, v5);
  sub_100774010();
  sub_100774020();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);
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

- (BOOL)hasContent
{
  swift_getObjectType();
  v3 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels);
  swift_beginAccess();
  unint64_t v4 = *v3;
  swift_bridgeObjectRetain();
  uint64_t v5 = self;
  char v6 = sub_1000E4BA8(0, v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metrics;
  uint64_t v4 = sub_100774060();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end