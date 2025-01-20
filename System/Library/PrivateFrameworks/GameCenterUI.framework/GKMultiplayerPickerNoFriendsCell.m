@interface GKMultiplayerPickerNoFriendsCell
+ (NSString)reuseIdentifier;
+ (double)itemHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithFrame:(CGRect)a3;
- (id)addFriendsHandler;
- (void)layoutSubviews;
- (void)setAddFriendsHandler:(id)a3;
@end

@implementation GKMultiplayerPickerNoFriendsCell

+ (NSString)reuseIdentifier
{
  static GKMultiplayerPickerNoFriendsCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell *)sub_1AF443D2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell)initWithCoder:(id)a3
{
}

- (id)addFriendsHandler
{
  uint64_t v2 = GKMultiplayerPickerNoFriendsCell.addFriendsHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_35;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAddFriendsHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF388384;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  GKMultiplayerPickerNoFriendsCell.addFriendsHandler.setter((uint64_t)v4, v5);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  GKMultiplayerPickerNoFriendsCell.measurements(fitting:in:)();
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
  swift_unknownObjectRetain();
  double v5 = static GKMultiplayerPickerNoFriendsCell.itemHeight(fitting:in:)((uint64_t)a4);
  swift_unknownObjectRelease();
  return v5;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKMultiplayerPickerNoFriendsCell.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI32GKMultiplayerPickerNoFriendsCell_noFriendsView));
}

@end