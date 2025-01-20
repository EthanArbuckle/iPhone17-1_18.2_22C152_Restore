@interface TextDetectionSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC16MagnifierSupport35TextDetectionSettingsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport35TextDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didToggleFeedbackSwitch:(id)a3;
- (void)didToggleFlashlightSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TextDetectionSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_23566AA84();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_23566B1F8(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport35TextDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport35TextDetectionSettingsViewController *)sub_23566B3C0(v5, v7, a4);
}

- (_TtC16MagnifierSupport35TextDetectionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport35TextDetectionSettingsViewController *)sub_23566B5A4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35TextDetectionSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return a4;
  }
  if (!a4) {
    return (*(void **)((char *)&self->super.super.super.isa
  }
                       + OBJC_IVAR____TtC16MagnifierSupport35TextDetectionSettingsViewController_availableTextDetectionFeedbacks))[2];
  return 0;
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
  id v16 = sub_23566B7C8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23566C4EC(v4);
}

- (void)didToggleFlashlightSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23566C908(v4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_23566CAEC(a4);
  if (v4)
  {
    uint64_t v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1)
  {
    sub_23566A970();
    if (v6)
    {
LABEL_4:
      uint64_t v5 = (void *)sub_235949A88();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
  }
  else if (!a4)
  {
    sub_23566A970();
    if (v4) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = 0;
LABEL_7:
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_235947B38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6, v7, v8, v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  BOOL v12 = sub_235947B28() != 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235947B38();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235947AC8();
  id v14 = a3;
  v15 = self;
  id v16 = (void *)sub_235947AB8();
  objc_msgSend(v14, sel_deselectRowAtIndexPath_animated_, v16, 1);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end