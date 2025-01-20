@interface ActivityTextDetectionCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)didToggleFlashlightSwitch:(id)a3;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleTextDetectionSwitchChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActivityTextDetectionCustomizationViewController

- (void)loadView
{
  v2 = self;
  sub_23577C4B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23577C90C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController *)sub_23577CAF8(v5, v7, a4);
}

- (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController *)sub_23577CD08(a3);
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_delegate);
  sub_235689B14((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_activity, (uint64_t)v3);
  sub_235691A68(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = 1;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      return (*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_availableTextDetectionFeedbacks))[2];
    }
    else if (a4)
    {
      return 0;
    }
  }
  return result;
}

- (void)toggleTextDetectionSwitchChanged:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_delegate, a2))
  {
    if (a3)
    {
      id v5 = a3;
      uint64_t v6 = self;
      sub_23576CA34((uint64_t)objc_msgSend(v5, sel_isOn));

      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
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
  v16 = (void *)sub_23577D014(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23577D810(v4);
}

- (void)didToggleFlashlightSwitch:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityTextDetectionCustomizationViewController_delegate, a2))
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_23576D6D4((int)objc_msgSend(v5, sel_isOn));

    swift_unknownObjectRelease();
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_23577E7E8(a4);
  if (v4)
  {
    id v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ((unint64_t)a4 <= 2 && (sub_23577C354(a4), v4))
  {
    id v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_235947AB8();
  objc_msgSend(v14, sel_deselectRowAtIndexPath_animated_, v16, 1);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end