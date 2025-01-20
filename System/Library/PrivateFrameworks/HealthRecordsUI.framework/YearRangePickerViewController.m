@interface YearRangePickerViewController
- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithStyle:(int64_t)a3;
- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithUsingInsetStyling:(BOOL)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation YearRangePickerViewController

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_defaultCellIdentifier);
  void *v5 = 1819043139;
  v5[1] = 0xE400000000000000;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v6 = a3;

  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C24008AC();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (*((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_selectedRow))
    return 3;
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  v12 = sub_1C2400B3C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  sub_1C2401160(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  id v10 = a3;
  v11 = self;
  unint64_t v12 = sub_1C254CD60();
  if (v12 > 1)
  {
    unint64_t v14 = v12;

    if (v14 == 2) {
      double v13 = 150.0;
    }
    else {
      double v13 = 0.0;
    }
  }
  else
  {
    double v13 = *MEMORY[0x1E4FB2F28];
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithUsingInsetStyling:(BOOL)a3
{
  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI29YearRangePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI29YearRangePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI29YearRangePickerViewController_delegate;
  sub_1C2201FD8((uint64_t)v3);
}

@end