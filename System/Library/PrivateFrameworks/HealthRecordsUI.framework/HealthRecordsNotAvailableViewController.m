@interface HealthRecordsNotAvailableViewController
- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation HealthRecordsNotAvailableViewController

- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1C254F470();
    id v6 = a4;
    v7 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HealthRecordsNotAvailableViewController();
  v9 = [(HealthRecordsNotAvailableViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC15HealthRecordsUI39HealthRecordsNotAvailableViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthRecordsNotAvailableViewController();
  return [(HealthRecordsNotAvailableViewController *)&v5 initWithCoder:a3];
}

@end