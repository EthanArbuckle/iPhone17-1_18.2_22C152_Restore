@interface MetadataRibbonView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension18MetadataRibbonView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18MetadataRibbonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonView

- (_TtC22SubscribePageExtension18MetadataRibbonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  v9 = self;
  _s22SubscribePageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&v9->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((unsigned char *)&v9->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[MetadataRibbonView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  -[MetadataRibbonView setLayoutMargins:](v10, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v10;
}

- (_TtC22SubscribePageExtension18MetadataRibbonView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;
  _s22SubscribePageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  result = (_TtC22SubscribePageExtension18MetadataRibbonView *)sub_100768A40();
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
  uint64_t v5 = sub_10075FAA0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_10075FAB0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = &v30[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v15 = self;
  uint64_t v16 = swift_bridgeObjectRetain();
  sub_10027939C(v16);
  swift_bridgeObjectRelease();
  v17 = (char *)v15 + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metrics;
  swift_beginAccess();
  (*(void (**)(unsigned char *, char *, uint64_t))(v6 + 16))(v9, v17, v5);
  sub_10075FA50();
  sub_10075FA60();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v14, v10);
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

- (BOOL)hasContent
{
  swift_getObjectType();
  v3 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metadataRibbonItemModels);
  swift_beginAccess();
  unint64_t v4 = *v3;
  swift_bridgeObjectRetain();
  uint64_t v5 = self;
  char v6 = sub_100100044(0, v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18MetadataRibbonView_metrics;
  uint64_t v4 = sub_10075FAA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end