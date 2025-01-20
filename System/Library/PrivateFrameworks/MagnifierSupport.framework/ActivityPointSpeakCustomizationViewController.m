@interface ActivityPointSpeakCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)colorPickerViewControllerDidSelectColor:(id)a3;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)didToggleFlashlightSwitch:(id)a3;
- (void)didToggleOutlineSwitch:(id)a3;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)togglePointSpeakSwitchChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActivityPointSpeakCustomizationViewController

- (void)loadView
{
  v2 = self;
  sub_23586F320();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23586F778();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *)sub_23586FA44(v5, v7, a4);
}

- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *)sub_23586FD48(a3);
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_delegate);
  sub_235689B14((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_activity, (uint64_t)v3);
  sub_235691A68(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_colorPickerController));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = 1;
  switch(a4)
  {
    case 0:
    case 3:
      return result;
    case 1:
      int64_t result = (*(void **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_availablePointSpeakFeedbacks))[2];
      break;
    case 2:
    case 4:
      int64_t result = 2;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (void)togglePointSpeakSwitchChanged:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_delegate, a2))
  {
    if (a3)
    {
      id v5 = a3;
      uint64_t v6 = self;
      sub_23576AE84((uint64_t)objc_msgSend(v5, sel_isOn));

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
  id v16 = sub_235870198(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_235871530(v4);
}

- (void)didToggleFlashlightSwitch:(id)a3
{
}

- (void)didToggleOutlineSwitch:(id)a3
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_23587196C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_23586EF98);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_23587196C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_23586F108);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  BOOL v12 = sub_235947B28() != 1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
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
  sub_235871AA0(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_235872018(v4);
}

@end