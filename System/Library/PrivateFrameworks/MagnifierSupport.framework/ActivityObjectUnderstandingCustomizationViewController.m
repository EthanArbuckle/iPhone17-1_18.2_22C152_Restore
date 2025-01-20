@interface ActivityObjectUnderstandingCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleFeedbackSwitch:(id)a3;
- (void)toggleObjectUnderstandingSwitch:(id)a3;
- (void)toggleSeatOccupancySwitch:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActivityObjectUnderstandingCustomizationViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_23568F710();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23568F8BC();
}

- (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_235949AC8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController *)sub_23568FB00(v5, v7, a4);
}

- (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController *)sub_23568FDDC(a3);
}

- (void).cxx_destruct
{
  sub_235689B14((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController_activity, (uint64_t)v3);
  sub_235691A68(v3);
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = sub_2356900EC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = 1;
  switch(a4)
  {
    case 0:
    case 2:
      return result;
    case 1:
      int64_t result = 2;
      break;
    case 3:
      int64_t result = (*(void **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport54ActivityObjectUnderstandingCustomizationViewController_availableDetectionFeedbacks))[2];
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  BOOL v12 = sub_235947B28() != 3;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_235690FA4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_23568EFEC);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_235690FA4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_23568F294);
}

- (void)toggleFeedbackSwitch:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_235691000(a3);
}

- (void)toggleObjectUnderstandingSwitch:(id)a3
{
}

- (void)toggleSeatOccupancySwitch:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  sub_23569142C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end