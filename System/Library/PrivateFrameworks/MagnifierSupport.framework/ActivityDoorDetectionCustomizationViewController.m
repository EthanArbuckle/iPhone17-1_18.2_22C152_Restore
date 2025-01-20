@interface ActivityDoorDetectionCustomizationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)colorPickerViewControllerDidSelectColor:(id)a3;
- (void)didToggleBackTapSwitch:(id)a3;
- (void)didToggleDecorationsSwitch:(id)a3;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleDoorDetectionSwitchChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation ActivityDoorDetectionCustomizationViewController

- (void)loadView
{
  v2 = self;
  sub_2358425B0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_235842A20();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *)sub_235842DE4(v5, v7, a4);
}

- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *)sub_235843140(a3);
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_delegate);
  sub_23566A348((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_activity, (uint64_t)v3, (uint64_t *)&unk_2688108E0);
  sub_235691A68(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_colorPickerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_doorAttributesController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_magnifierModelsManger));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return qword_26E8BF420;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_2358468D4(a4);

  return v8;
}

- (void)toggleDoorDetectionSwitchChanged:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_delegate, a2))
  {
    if (a3)
    {
      id v5 = a3;
      id v6 = self;
      sub_235768770((uint64_t)objc_msgSend(v5, sel_isOn));

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
  id v16 = sub_2358435FC(v14, (uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2358457CC(v4);
}

- (void)didToggleBackTapSwitch:(id)a3
{
}

- (void)didToggleDecorationsSwitch:(id)a3
{
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_235845C3C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_235841ED8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_235845C3C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_2358420FC);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  unint64_t v16 = sub_235947B28();
  LODWORD(a3) = sub_2358468AC(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return a3 != 3;
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
  sub_235845DB8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_235846648(v4);
}

@end