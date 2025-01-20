@interface HUPlaceholderTileCell
- (HUPlaceholderTileCell)initWithCoder:(id)a3;
- (HUPlaceholderTileCell)initWithFrame:(CGRect)a3;
@end

@implementation HUPlaceholderTileCell

- (HUPlaceholderTileCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlaceholderTileCell();
  return -[HUTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUPlaceholderTileCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaceholderTileCell();
  return [(HUTileCell *)&v5 initWithCoder:a3];
}

@end