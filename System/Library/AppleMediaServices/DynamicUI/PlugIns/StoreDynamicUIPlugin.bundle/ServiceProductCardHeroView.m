@interface ServiceProductCardHeroView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)init;
- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)offerButtonActionWithSender:(id)a3;
- (void)tintColorDidChange;
@end

@implementation ServiceProductCardHeroView

- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView *)sub_D4584(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D4820();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_D4A60();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_D4CB0();
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

- (void)tintColorDidChange
{
  v2 = self;
  sub_D4E6C();
}

- (void)offerButtonActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10B110();
  swift_unknownObjectRelease();
  sub_D516C((uint64_t)v5);

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)v5);
}

- (_TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin26ServiceProductCardHeroView_offerAction];

  sub_10950(v3);
}

@end