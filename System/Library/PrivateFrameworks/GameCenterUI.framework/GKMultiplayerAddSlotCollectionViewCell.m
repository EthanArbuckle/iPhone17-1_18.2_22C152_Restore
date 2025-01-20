@interface GKMultiplayerAddSlotCollectionViewCell
+ (NSString)reuseIdentifier;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIButton)accessibilityAddSlotButton;
- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)addSlotActionHandler;
- (int64_t)maximumAdditionalPlayers;
- (void)layoutSubviews;
- (void)setAddSlotActionHandler:(id)a3;
- (void)setMaximumAdditionalPlayers:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKMultiplayerAddSlotCollectionViewCell

+ (NSString)reuseIdentifier
{
  static GKMultiplayerAddSlotCollectionViewCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AF7AE0A0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell *)sub_1AF6A27C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6A32CC();
}

- (id)addSlotActionHandler
{
  uint64_t v2 = GKMultiplayerAddSlotCollectionViewCell.addSlotActionHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF6A3480;
    v6[3] = &block_descriptor_83;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAddSlotActionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF36A5A0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  GKMultiplayerAddSlotCollectionViewCell.addSlotActionHandler.setter((uint64_t)v4, v5);
}

- (int64_t)maximumAdditionalPlayers
{
  return GKMultiplayerAddSlotCollectionViewCell.maximumAdditionalPlayers.getter();
}

- (void)setMaximumAdditionalPlayers:(int64_t)a3
{
  v4 = self;
  GKMultiplayerAddSlotCollectionViewCell.maximumAdditionalPlayers.setter(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1AF6A4ED0(a4, (uint64_t)v6);
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

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = GKMultiplayerAddSlotCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKMultiplayerAddSlotCollectionViewCell.layoutSubviews()();
}

- (UIButton)accessibilityAddSlotButton
{
  uint64_t v2 = sub_1AF6A4238();

  return (UIButton *)v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.value.super.Class isa = (Class)self;
  Class isa = v7.value.super.isa;
  GKMultiplayerAddSlotCollectionViewCell.traitCollectionDidChange(_:)(v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_vibrancyHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_focusGuide));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell_addSlotActionHandler);

  sub_1AF368930(v3);
}

@end