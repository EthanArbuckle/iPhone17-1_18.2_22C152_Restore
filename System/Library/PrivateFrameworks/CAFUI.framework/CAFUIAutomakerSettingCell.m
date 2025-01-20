@interface CAFUIAutomakerSettingCell
- (_TtC5CAFUI25CAFUIAutomakerSettingCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation CAFUIAutomakerSettingCell

- (void)prepareForReuse
{
  v2 = self;
  CAFUIAutomakerSettingCell.prepareForReuse()();
}

- (_TtC5CAFUI25CAFUIAutomakerSettingCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI25CAFUIAutomakerSettingCell_representable);
  v9 = (objc_class *)type metadata accessor for CAFUIAutomakerSettingCell(0);
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CAFUITileBaseCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void).cxx_destruct
{
}

@end