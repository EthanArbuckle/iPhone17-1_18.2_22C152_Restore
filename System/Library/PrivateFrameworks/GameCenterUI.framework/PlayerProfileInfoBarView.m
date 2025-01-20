@interface PlayerProfileInfoBarView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSArray)accessibilityInfoItemPairs;
- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlayerProfileInfoBarView

- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24PlayerProfileInfoBarView *)sub_1AF56BCCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF56BEB0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF56C384(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain();
  double v7 = self;
  double v8 = sub_1AF56DE70(width, (uint64_t)a4, v7);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF56C93C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF56D350(a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF56D4F8(v4);
}

- (NSArray)accessibilityInfoItemPairs
{
  v2 = self;
  uint64_t v3 = sub_1AF56DA94();

  if (v3)
  {
    id v4 = (void *)sub_1AF7AE2A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24PlayerProfileInfoBarView_scrollView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI24PlayerProfileInfoBarView_gradient);
}

@end