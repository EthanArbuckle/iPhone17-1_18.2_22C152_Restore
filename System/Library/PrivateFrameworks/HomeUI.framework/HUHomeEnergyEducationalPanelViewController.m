@interface HUHomeEnergyEducationalPanelViewController
- (HUHomeEnergyEducationalPanelViewController)initWithCoder:(id)a3;
- (HUHomeEnergyEducationalPanelViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissDoneButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUHomeEnergyEducationalPanelViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  id v2 = v3.receiver;
  [(HUHomeEnergyEducationalPanelViewController *)&v3 viewDidLoad];
  sub_1BE467BF8();
  sub_1BE4677A8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA113010);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for HomeEnergyEducationalPanelViewController();
  v13.receiver = self;
  v13.super_class = v8;
  v9 = self;
  [(HUHomeEnergyEducationalPanelViewController *)&v13 viewDidAppear:v3];
  sub_1BE9C10D8();
  uint64_t v10 = sub_1BE9C10E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
  swift_beginAccess();
  sub_1BE467DDC((uint64_t)v7, v11);
  swift_endAccess();
  objc_msgSend(self, sel_saveViewVisitEvent_, 49);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1BE4673BC(a3);
}

- (void)dismissDoneButton
{
}

- (HUHomeEnergyEducationalPanelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1BE9C49F8();
    uint64_t v6 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
    uint64_t v7 = sub_1BE9C10E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    id v8 = a4;
    v9 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
    uint64_t v11 = sub_1BE9C10E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
    id v12 = a4;
    v9 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  objc_super v13 = [(HUHomeEnergyEducationalPanelViewController *)&v15 initWithNibName:v9 bundle:a4];

  return v13;
}

- (HUHomeEnergyEducationalPanelViewController)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR___HUHomeEnergyEducationalPanelViewController_modelInformationSheetStartTime;
  uint64_t v6 = sub_1BE9C10E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HomeEnergyEducationalPanelViewController();
  return [(HUHomeEnergyEducationalPanelViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end