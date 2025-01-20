@interface HUGuestAccessTileCell
- (HUGuestAccessTileCell)initWithCoder:(id)a3;
- (HUGuestAccessTileCell)initWithFrame:(CGRect)a3;
- (id)tappableAreaForPoint:(CGPoint)a3;
@end

@implementation HUGuestAccessTileCell

- (id)tappableAreaForPoint:(CGPoint)a3
{
  return @"HUTileCellTappableAreaGeneralToggleArea";
}

- (HUGuestAccessTileCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GuestAccessTileCell();
  return -[HUTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUGuestAccessTileCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GuestAccessTileCell();
  return [(HUTileCell *)&v5 initWithCoder:a3];
}

@end