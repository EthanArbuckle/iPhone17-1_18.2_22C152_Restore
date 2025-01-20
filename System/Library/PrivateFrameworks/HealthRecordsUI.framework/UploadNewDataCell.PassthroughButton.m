@interface UploadNewDataCell.PassthroughButton
- (_TtCC15HealthRecordsUI17UploadNewDataCellP33_6F80709EAB63D26AFFB2023EBC32517B17PassthroughButton)initWithCoder:(id)a3;
- (_TtCC15HealthRecordsUI17UploadNewDataCellP33_6F80709EAB63D26AFFB2023EBC32517B17PassthroughButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UploadNewDataCell.PassthroughButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UploadNewDataCell.PassthroughButton();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[UploadNewDataCell.PassthroughButton hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_1C2456988();
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_1C254FF70();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }
  return v7;
}

- (_TtCC15HealthRecordsUI17UploadNewDataCellP33_6F80709EAB63D26AFFB2023EBC32517B17PassthroughButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UploadNewDataCell.PassthroughButton();
  return -[UploadNewDataCell.PassthroughButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC15HealthRecordsUI17UploadNewDataCellP33_6F80709EAB63D26AFFB2023EBC32517B17PassthroughButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UploadNewDataCell.PassthroughButton();
  return [(UploadNewDataCell.PassthroughButton *)&v5 initWithCoder:a3];
}

@end