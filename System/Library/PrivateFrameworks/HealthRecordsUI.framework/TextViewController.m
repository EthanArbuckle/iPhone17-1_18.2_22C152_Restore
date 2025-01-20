@interface TextViewController
- (_TtC15HealthRecordsUI18TextViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI18TextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TextViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2467FE0();
}

- (_TtC15HealthRecordsUI18TextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1C254F470();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
    id v6 = a4;
    v7 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TextViewController();
  v9 = [(TextViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC15HealthRecordsUI18TextViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TextViewController();
  return [(TextViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI18TextViewController____lazy_storage___textView));
}

@end