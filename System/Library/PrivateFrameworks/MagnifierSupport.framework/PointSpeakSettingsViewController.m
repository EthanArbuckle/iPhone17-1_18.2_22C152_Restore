@interface PointSpeakSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)colorPickerViewControllerDidSelectColor:(id)a3;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)didToggleFlashlightSwitch:(id)a3;
- (void)didToggleOutlineSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PointSpeakSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2357AABA4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2357AB4BC(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport32PointSpeakSettingsViewController *)sub_2357AB684(v5, v7, a4);
}

- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport32PointSpeakSettingsViewController *)sub_2357AB95C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_tableView));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_colorPickerController);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = 2;
  switch(a4)
  {
    case 0:
      int64_t result = (*(void **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_availablePointSpeakFeedbacks))[2];
      break;
    case 1:
    case 3:
      return result;
    case 2:
      int64_t result = 1;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
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
  id v16 = sub_2357ABCCC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2357AE5E4(v4);
}

- (void)didToggleFlashlightSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2357AE9F0(v4, &OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__pointSpeakFlashlightEnabled);
}

- (void)didToggleOutlineSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2357AE9F0(v4, &OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__outlinePointSpeak);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_2357AD4BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_2357AA84C);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_2357AD4BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, void))sub_2357AA998);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  unint64_t v12 = sub_235947B28();
  unsigned int v13 = (v12 > 3) | (0xEu >> (v12 & 0xF));
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v13 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  unsigned int v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  uint64_t v15 = self;
  sub_2357AD600(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2357ADD38(v4);
}

@end