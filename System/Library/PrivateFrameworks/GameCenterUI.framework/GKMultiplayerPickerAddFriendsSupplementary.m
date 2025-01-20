@interface GKMultiplayerPickerAddFriendsSupplementary
+ (NSString)reuseIdentifier;
+ (double)preferredHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4;
- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithCoder:(id)a3;
- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithFrame:(CGRect)a3;
- (id)addFriendsHandler;
- (void)layoutSubviews;
- (void)setAddFriendsHandler:(id)a3;
@end

@implementation GKMultiplayerPickerAddFriendsSupplementary

+ (NSString)reuseIdentifier
{
  static GKMultiplayerPickerAddFriendsSupplementary.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary *)GKMultiplayerPickerAddFriendsSupplementary.init(frame:)();
}

- (_TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary)initWithCoder:(id)a3
{
}

- (id)addFriendsHandler
{
  uint64_t v2 = GKMultiplayerPickerAddFriendsSupplementary.addFriendsHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_20;
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
  GKMultiplayerPickerAddFriendsSupplementary.addFriendsHandler.setter((uint64_t)v4, v5);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKMultiplayerPickerAddFriendsSupplementary.layoutSubviews()();
}

+ (double)preferredHeightFitting:(CGSize)a3 inTraitEnvironment:(id)a4
{
  swift_unknownObjectRetain();
  static GKMultiplayerPickerAddFriendsSupplementary.preferredHeight(fitting:in:)(a4);
  double v6 = v5;
  swift_unknownObjectRelease();
  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerPickerAddFriendsSupplementary_lockupView));
}

@end