@interface STKCategoryViewController
- (BOOL)_canShowWhileLocked;
- (STKCategoryViewController)initWithCoder:(id)a3;
- (STKCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)transitionerForConnectingHostingController:(id)a3;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STKCategoryViewController

- (void)viewDidLoad
{
  v2 = self;
  CategoryViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  _s10StickerKit22CategoryViewControllerC13viewDidAppearyySbF_0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  v5[4] = sub_2452ADC58;
  v5[5] = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_245311E20;
  v5[3] = &block_descriptor_36;
  v3 = _Block_copy(v5);
  swift_release();

  return v3;
}

- (void)dealloc
{
  v2 = self;
  CategoryViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___STKCategoryViewController__sceneHostingController;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3D70);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_unknownObjectRelease();
}

- (STKCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_2453FFB38();
    a3 = v8;
  }
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  v9 = self;
  id v10 = a4;
  sub_245400188();
  *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR___STKCategoryViewController_keyboardSuppression) = 0;

  if (a3)
  {
    v11 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v9;
  v14.super_class = ObjectType;
  v12 = [(STKCategoryViewController *)&v14 initWithNibName:v11 bundle:v10];

  return v12;
}

- (STKCategoryViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_245203D98(0, (unint64_t *)&unk_268ED3CE0);
  id v6 = a3;
  v7 = self;
  sub_245400188();
  *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___STKCategoryViewController_keyboardSuppression) = 0;

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = [(STKCategoryViewController *)&v10 initWithCoder:v6];

  return v8;
}

@end