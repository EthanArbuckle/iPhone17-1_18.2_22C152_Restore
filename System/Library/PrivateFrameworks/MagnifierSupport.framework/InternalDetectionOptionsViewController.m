@interface InternalDetectionOptionsViewController
- (BOOL)_canShowWhileLocked;
- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapPhotoSelector:(id)a3;
- (void)didToggleAutomationSwitch:(id)a3;
- (void)didToggleFreezeFrameSwitch:(id)a3;
- (void)didToggleRecordingSwitch:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation InternalDetectionOptionsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2358DA68C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(InternalDetectionOptionsViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationItem, v7.receiver, v7.super_class);
  v6 = (void *)sub_235949A88();
  objc_msgSend(v5, sel_setTitle_, v6);
}

- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport38InternalDetectionOptionsViewController *)sub_2358DA8F8(v5, v7, a4);
}

- (_TtC16MagnifierSupport38InternalDetectionOptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2358DF378();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_tableView);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_availableInternalDetectionSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_2358DF518(a4);

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
  id v16 = sub_2358DACDC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleRecordingSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358DF68C(v4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (*(void *)(*(void *)((char *)self
                             + OBJC_IVAR____TtC16MagnifierSupport38InternalDetectionOptionsViewController_availableInternalDetectionSections)
                 + 16) <= a4)
  {
    id v4 = 0;
  }
  else
  {
    if (a4 < 0)
    {
      __break(1u);
      return self;
    }
    sub_2358DA18C();
    id v4 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  return v4;
}

- (void)didToggleAutomationSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358DCCF8(v4, (uint64_t)&unk_26E8CC870, (uint64_t)sub_2358E0020, (uint64_t)&block_descriptor_39_0);
}

- (void)didTapPhotoSelector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358DC880(v4);
}

- (void)didToggleFreezeFrameSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2358DCCF8(v4, (uint64_t)&unk_26E8CC820, (uint64_t)sub_2358DFFD0, (uint64_t)&block_descriptor_32_3);
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
  sub_2358DD2AC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end