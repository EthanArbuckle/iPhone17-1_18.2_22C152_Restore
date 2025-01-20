@interface UDCRecordsTableViewController
- (_TtC15HealthRecordsUI29UDCRecordsTableViewController)initWithCoder:(id)a3;
- (void)modePickerDidChange:(id)a3;
@end

@implementation UDCRecordsTableViewController

- (_TtC15HealthRecordsUI29UDCRecordsTableViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_preferredSegment) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_additionalPredicate) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController____lazy_storage___modePicker) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI29UDCRecordsTableViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)modePickerDidChange:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1C22A9058();

  sub_1C224E3A4((uint64_t)v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController_additionalPredicate));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI29UDCRecordsTableViewController____lazy_storage___modePicker);
}

@end