@interface OverlappingPlayersView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI22OverlappingPlayersView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI22OverlappingPlayersView)initWithFrame:(CGRect)a3;
- (double)overlapPercentage;
- (void)applyWithPlayerAvatars:(id)a3 playerSize:(CGSize)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setOverlapPercentage:(double)a3;
@end

@implementation OverlappingPlayersView

- (double)overlapPercentage
{
  return sub_1AF469274();
}

- (void)setOverlapPercentage:(double)a3
{
}

- (_TtC12GameCenterUI22OverlappingPlayersView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22OverlappingPlayersView *)OverlappingPlayersView.init(frame:)();
}

- (_TtC12GameCenterUI22OverlappingPlayersView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4694C0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v5 = self;
  double v6 = sub_1AF4697E4();
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

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF46997C();
}

- (void)applyWithPlayerAvatars:(id)a3 playerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC47A0);
  unint64_t v7 = sub_1AF7AE2B0();
  double v8 = self;
  sub_1AF469C18(v7, width, height);

  swift_bridgeObjectRelease();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF469EA0();
}

- (void).cxx_destruct
{
}

@end