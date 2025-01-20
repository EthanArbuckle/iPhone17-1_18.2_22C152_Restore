@interface GKMultiplayerPickerNearbyInstructionCell
+ (double)itemHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4;
- (BOOL)canBecomeFocused;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GKMultiplayerPickerNearbyInstructionCell

- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithFrame:(CGRect)a3
{
  sub_1AF76E114();
  return result;
}

- (_TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  GKMultiplayerPickerNearbyInstructionCell.layoutSubviews()();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  GKMultiplayerPickerNearbyInstructionCell.measurements(fitting:in:)();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

+ (double)itemHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  swift_getObjCClassMetadata();
  v4 = (void *)swift_unknownObjectRetain();
  static GKMultiplayerPickerNearbyInstructionCell.itemHeight(fitting:in:)(v4);
  double v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI40GKMultiplayerPickerNearbyInstructionCell_textField);
}

@end