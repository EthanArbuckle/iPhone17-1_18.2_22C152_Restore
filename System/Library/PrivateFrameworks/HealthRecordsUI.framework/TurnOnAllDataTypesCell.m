@interface TurnOnAllDataTypesCell
- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithFrame:(CGRect)a3;
@end

@implementation TurnOnAllDataTypesCell

- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_allSwitchesOn) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_item;
  v9 = (objc_class *)type metadata accessor for TurnOnAllDataTypesCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[TurnOnAllDataTypesCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C22C42A8();

  return v10;
}

- (_TtC15HealthRecordsUI22TurnOnAllDataTypesCell)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_allSwitchesOn) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI22TurnOnAllDataTypesCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TurnOnAllDataTypesCell();
  id v5 = a3;
  v6 = [(TurnOnAllDataTypesCell *)&v10 initWithCoder:v5];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_1C22C42A8();
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end