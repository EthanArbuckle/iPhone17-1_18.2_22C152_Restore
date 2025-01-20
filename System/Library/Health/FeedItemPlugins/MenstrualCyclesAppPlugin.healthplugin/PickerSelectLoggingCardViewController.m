@interface PickerSelectLoggingCardViewController
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation PickerSelectLoggingCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241519464();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2415196A0(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_241519BF0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  objc_msgSend(v13, sel__setShouldHaveFullLengthBottomSeparator_, 1);
  uint64_t v15 = (char *)sub_2415193E8();
  id v16 = *(id *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_picker];

  if ((*((unsigned char *)&v14->super.super.super._responderFlags
        + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_pickedIndex) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_selectRow_inComponent_animated_, *(Class *)((char *)&v14->super.super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_pickedIndex), 0, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController____lazy_storage___cell);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t result = MEMORY[0x245621790]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource, a2, a3, a4);
  if (result)
  {
    id v7 = a3;
    uint64_t v8 = self;
    int64_t v9 = *(void *)(sub_241573860() + 16);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id result = (id)MEMORY[0x245621790]((char *)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource, a2, a3, a4, a5);
  if (result)
  {
    id v9 = a3;
    uint64_t v10 = self;
    sub_241573D48(a4);
    uint64_t v12 = v11;

    swift_unknownObjectRelease();
    if (v12)
    {
      id v13 = (void *)sub_241631CC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v13 = 0;
    }
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_24151A264(a4);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

@end