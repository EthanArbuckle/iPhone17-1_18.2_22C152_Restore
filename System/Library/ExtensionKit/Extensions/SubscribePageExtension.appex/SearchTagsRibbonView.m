@interface SearchTagsRibbonView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SearchTagsRibbonView

- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20SearchTagsRibbonView *)sub_10008AD48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20SearchTagsRibbonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008DEA8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008B04C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_10008B394();
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

- (BOOL)hasContent
{
  swift_getObjectType();
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metadataRibbonItemModels);
  swift_bridgeObjectRetain();
  v4 = self;
  char v5 = sub_100100044(v3, 0);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_metrics;
  uint64_t v4 = sub_100760B40();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension20SearchTagsRibbonView_impressionsUpdateBlock);

  sub_10001A4D0(v5);
}

@end