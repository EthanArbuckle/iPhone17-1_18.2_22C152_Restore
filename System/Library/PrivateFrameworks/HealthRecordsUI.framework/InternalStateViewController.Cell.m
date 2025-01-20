@interface InternalStateViewController.Cell
- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithCoder:(id)a3;
- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation InternalStateViewController.Cell

- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1C254F470();
    v5 = (void *)sub_1C254F430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for InternalStateViewController.Cell();
  v6 = [(InternalStateViewController.Cell *)&v8 initWithStyle:3 reuseIdentifier:v5];

  return v6;
}

- (_TtCC15HealthRecordsUI27InternalStateViewController4Cell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InternalStateViewController.Cell();
  return [(InternalStateViewController.Cell *)&v5 initWithCoder:a3];
}

@end