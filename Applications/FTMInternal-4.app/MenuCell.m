@interface MenuCell
- (BOOL)isSelected;
- (_TtC13FTMInternal_48MenuCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_48MenuCell)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation MenuCell

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell();
  return [(MenuCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MenuCell();
  id v4 = v5.receiver;
  [(MenuCell *)&v5 setSelected:v3];
  sub_1001C1E1C();
}

- (_TtC13FTMInternal_48MenuCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuCellSize) = (Class)0x403C000000000000;
  uint64_t v8 = OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1001C1C70();

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for MenuCell();
  v10 = -[MenuCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_1001C2040();

  return v10;
}

- (_TtC13FTMInternal_48MenuCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuCellSize) = (Class)0x403C000000000000;
  uint64_t v4 = OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1001C1C70();

  result = (_TtC13FTMInternal_48MenuCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_48MenuCell_menuIconImageView));
}

@end