@interface OverlappingPlayersPhotoView
+ (double)knockoutAvatarSpace;
- (BOOL)enableKnockoutSpace;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSArray)playerViews;
- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithFrame:(CGRect)a3;
- (double)overlapPercentage;
- (void)applyWithPlayerAvatars:(id)a3;
- (void)layoutSubviews;
- (void)setEnableKnockoutSpace:(BOOL)a3;
- (void)setOverlapPercentage:(double)a3;
- (void)setPlayerViews:(id)a3;
@end

@implementation OverlappingPlayersPhotoView

- (double)overlapPercentage
{
  return sub_1AF57B480();
}

- (void)setOverlapPercentage:(double)a3
{
}

- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI27OverlappingPlayersPhotoView *)OverlappingPlayersPhotoView.init(frame:)();
}

- (_TtC12GameCenterUI27OverlappingPlayersPhotoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF57B7E0();
}

- (NSArray)playerViews
{
  sub_1AF57B918();
  sub_1AF36A648(0, &qword_1E9AC6AA0);
  v2 = (void *)sub_1AF7AE2A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setPlayerViews:(id)a3
{
  sub_1AF36A648(0, &qword_1E9AC6AA0);
  uint64_t v4 = sub_1AF7AE2B0();
  v5 = self;
  sub_1AF57B9A8(v4);
}

+ (double)knockoutAvatarSpace
{
  return 2.0;
}

- (BOOL)enableKnockoutSpace
{
  return sub_1AF57BD48() & 1;
}

- (void)setEnableKnockoutSpace:(BOOL)a3
{
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
  double v6 = sub_1AF57BE84();
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
  sub_1AF57C008();
}

- (void)applyWithPlayerAvatars:(id)a3
{
  sub_1AF36A648(0, (unint64_t *)&qword_1E9AC38A0);
  sub_1AF7AE2B0();
  double v4 = self;
  sub_1AF57C21C();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end