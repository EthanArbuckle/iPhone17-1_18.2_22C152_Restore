@interface ScanResultGroupCell
- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithCoder:(id)a3;
- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithFrame:(CGRect)a3;
@end

@implementation ScanResultGroupCell

- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  v9 = (objc_class *)type metadata accessor for ScanResultGroupCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v13.receiver = self;
  v13.super_class = v9;
  v10 = -[ScanResultGroupCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_2287FA368();
  id v11 = (id)*MEMORY[0x263F15A20];
  sub_2287FB0E8();

  return v10;
}

- (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC25HealthMedicationsVisionUI19ScanResultGroupCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC25HealthMedicationsVisionUI19ScanResultGroupCell *)sub_2287FB408();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end