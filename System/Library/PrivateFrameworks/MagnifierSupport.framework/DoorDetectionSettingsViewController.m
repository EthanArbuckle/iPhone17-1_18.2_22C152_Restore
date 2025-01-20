@interface DoorDetectionSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)colorPickerViewControllerDidSelectColor:(id)a3;
- (void)didToggleBackTapSwitch:(id)a3;
- (void)didToggleDecorationsSwitch:(id)a3;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DoorDetectionSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2356786A4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_235679090(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport35DoorDetectionSettingsViewController *)sub_235679258(v5, v7, a4);
}

- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport35DoorDetectionSettingsViewController *)sub_235679554(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_colorPickerController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_doorAttributesController);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return qword_26E8BD5A8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_23567D6C0(a4);

  return v8;
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
  v16 = sub_2356798E4(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23567E438(v4);
}

- (void)didToggleBackTapSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23567E844(v4);
}

- (void)didToggleDecorationsSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23567EA28(v4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_23567BC94((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_235677FD4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_23567BC94((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_2356781F4);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  BOOL v12 = sub_23567F044();
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
  sub_23567BDC8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23567C998(v4);
}

@end