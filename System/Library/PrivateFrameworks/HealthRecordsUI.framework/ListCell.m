@interface ListCell
- (_TtC15HealthRecordsUI8ListCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI8ListCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation ListCell

- (_TtC15HealthRecordsUI8ListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC15HealthRecordsUI8ListCell_textLabel;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (char *)v10 + OBJC_IVAR____TtC15HealthRecordsUI8ListCell_item;
  *((void *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for ListCell();
  v12 = -[ListCell initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v13 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v12->super.super.super.super.super.super.super.isa) + 0x60);
  v14 = v12;
  v13();

  return v14;
}

- (_TtC15HealthRecordsUI8ListCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC15HealthRecordsUI8ListCell_textLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  id v9 = (char *)v8 + OBJC_IVAR____TtC15HealthRecordsUI8ListCell_item;
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
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ListCell();
  v2 = v4.receiver;
  id v3 = [(ListCell *)&v4 awakeFromNib];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x60))(v3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI8ListCell_textLabel));
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI8ListCell_item;
  sub_1C2227100((uint64_t)v3);
}

@end