@interface ControlCenterAccessoryTileCell
- (BOOL)toggleable;
- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithCoder:(id)a3;
- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithFrame:(CGRect)a3;
- (id)tappableAreaForPoint:(CGPoint)a3;
- (void)setToggleable:(BOOL)a3;
@end

@implementation ControlCenterAccessoryTileCell

- (BOOL)toggleable
{
  v2 = self;
  char v3 = sub_1BE5A6944();

  return v3 & 1;
}

- (void)setToggleable:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable);
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = a3;
  if (v3 != a3) {
    [(ControlCenterAccessoryTileCell *)self setNeedsUpdateConfiguration];
  }
}

- (id)tappableAreaForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  v6 = sub_1BE5A6B8C(x, y);

  return v6;
}

- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return -[HUAccessoryTileCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC6HomeUI30ControlCenterAccessoryTileCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC6HomeUI30ControlCenterAccessoryTileCell__toggleable) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlCenterAccessoryTileCell();
  return [(HUAccessoryTileCell *)&v5 initWithCoder:a3];
}

@end