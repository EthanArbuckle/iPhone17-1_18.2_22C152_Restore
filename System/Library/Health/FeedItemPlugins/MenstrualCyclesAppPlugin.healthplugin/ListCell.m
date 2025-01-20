@interface ListCell
- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation ListCell

- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (char *)v10 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  *((void *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for ListCell();
  v12 = -[ListCell initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v13 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v12->super.super.super.super.super.super.super.isa) + 0x60);
  v14 = v12;
  v13();

  return v14;
}

- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  id v9 = (char *)v8 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  *((void *)v9 + 4) = 0;
  *(_OWORD *)id v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for ListCell();
  v10 = [(ListCell *)&v12 initWithCoder:v7];

  return v10;
}

- (void)awakeFromNib
{
  v2 = self;
  sub_2413B2900();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;

  sub_241299DB8((uint64_t)v3);
}

@end