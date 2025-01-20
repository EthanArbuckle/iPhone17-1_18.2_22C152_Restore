@interface HUAccessoryTileCell
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsSizeChangeButton;
- (HUAccessoryTileCell)initWithCoder:(id)a3;
- (HUAccessoryTileCell)initWithFrame:(CGRect)a3;
- (HUAccessoryTileCellDelegate)delegate;
- (NSString)description;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setShowsSizeChangeButton:(BOOL)a3;
- (void)setShowsSizeChangeButton:(BOOL)a3 animated:(BOOL)a4;
- (void)tileSizeButtonTappedWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)updateSizeChangeButton;
@end

@implementation HUAccessoryTileCell

- (HUAccessoryTileCellDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUAccessoryTileCell_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUAccessoryTileCellDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsSizeChangeButton
{
  v2 = (BOOL *)self + OBJC_IVAR___HUAccessoryTileCell_showsSizeChangeButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowsSizeChangeButton:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUAccessoryTileCell_showsSizeChangeButton;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccessoryTileCell();
  id v2 = v3.receiver;
  [(HUAccessoryTileCell *)&v3 updateConstraints];
  sub_1BE44B2D8();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1BE44A0E0();
}

- (void)setShowsSizeChangeButton:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_1BE44AC0C(a3, a4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1BE44ADD8((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_1BE44AF40(v4, x, y);

  return v4 & 1;
}

- (void)updateSizeChangeButton
{
  id v2 = self;
  sub_1BE44B08C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BE44B594((uint64_t)a3);
}

- (void)tileSizeButtonTappedWithSender:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1BE9C5638();
  swift_unknownObjectRelease();
  sub_1BE44B780();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (NSString)description
{
  id v2 = self;
  sub_1BE44B958();

  objc_super v3 = (void *)sub_1BE9C49B8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (HUAccessoryTileCell)initWithFrame:(CGRect)a3
{
  return (HUAccessoryTileCell *)AccessoryTileCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUAccessoryTileCell)initWithCoder:(id)a3
{
  return (HUAccessoryTileCell *)AccessoryTileCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUAccessoryTileCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUAccessoryTileCell_sizeChangeButton));
  swift_release();

  swift_release();
}

@end