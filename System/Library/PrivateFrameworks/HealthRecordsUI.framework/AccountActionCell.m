@interface AccountActionCell
- (_TtC15HealthRecordsUI17AccountActionCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI17AccountActionCell)initWithFrame:(CGRect)a3;
@end

@implementation AccountActionCell

- (_TtC15HealthRecordsUI17AccountActionCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountActionCell_item;
  v9 = (objc_class *)type metadata accessor for AccountActionCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[AccountActionCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI17AccountActionCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI17AccountActionCell_item;
  v6 = (objc_class *)type metadata accessor for AccountActionCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(AccountActionCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end