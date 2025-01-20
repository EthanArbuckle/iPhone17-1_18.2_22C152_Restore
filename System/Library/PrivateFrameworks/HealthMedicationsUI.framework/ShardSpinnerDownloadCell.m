@interface ShardSpinnerDownloadCell
- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithFrame:(CGRect)a3;
@end

@implementation ShardSpinnerDownloadCell

- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24ShardSpinnerDownloadCell_item;
  v9 = (objc_class *)type metadata accessor for ShardSpinnerDownloadCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v15.receiver = self;
  v15.super_class = v9;
  v10 = -[ShardSpinnerDownloadCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  [(ShardSpinnerDownloadCell *)v10 setUserInteractionEnabled:0];
  v11 = self;
  v12 = v10;
  id v13 = objc_msgSend(v11, sel_secondarySystemGroupedBackgroundColor);
  [(ShardSpinnerDownloadCell *)v12 setBackgroundColor:v13];

  sub_1C210DABC();
  return v12;
}

- (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI24ShardSpinnerDownloadCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI24ShardSpinnerDownloadCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end