@interface GPImagePickerViewController
+ (BOOL)available;
+ (BOOL)isAvailableOnCurrentDevice;
- (BOOL)isLoadingRecipe;
- (BOOL)isModalInPresentation;
- (GPImagePickerViewController)initWithCoder:(id)a3;
- (GPImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GPImagePickerViewController)initWithStyle:(int64_t)a3;
- (GPImagePickerViewControllerDelegate)delegate;
- (GPRecipe)recipe;
- (NSArray)selectedAssets;
- (NSString)localizedCreateButtonTitle;
- (int64_t)style;
- (void)setDelegate:(id)a3;
- (void)setIsLoadingRecipe:(BOOL)a3;
- (void)setLocalizedCreateButtonTitle:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setSelectedAssets:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation GPImagePickerViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

+ (BOOL)isAvailableOnCurrentDevice
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (int64_t)style
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_style);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSArray)selectedAssets
{
  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2443BA7A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setSelectedAssets:(id)a3
{
  type metadata accessor for GPExportablePhotoAsset(0);
  uint64_t v4 = sub_2443BA7C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_selectedAssets);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)localizedCreateButtonTitle
{
  v2 = (char *)self + OBJC_IVAR___GPImagePickerViewController_localizedCreateButtonTitle;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_2443BA4B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setLocalizedCreateButtonTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_2443BA4F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  if (qword_268E378D0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2443B6800();
  __swift_project_value_buffer(v9, (uint64_t)qword_268E39318);
  v10 = sub_2443B67E0();
  os_log_type_t v11 = sub_2443BAD10();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_243E89000, v10, v11, "Not implemented yet", v12, 2u);
    MEMORY[0x24568FCC0](v12, -1, -1);
  }
}

- (BOOL)isLoadingRecipe
{
  v2 = (BOOL *)self + OBJC_IVAR___GPImagePickerViewController_isLoadingRecipe;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  uint64_t v5 = (BOOL *)self + OBJC_IVAR___GPImagePickerViewController_isLoadingRecipe;
  swift_beginAccess();
  BOOL *v5 = a3;
  (*(unsigned char **)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_connectionManager))[OBJC_IVAR____TtC15ImagePlayground27GPHostSideConnectionManager_isLoadingRecipe] = a3;
  uint64_t v6 = self;
  sub_243FB13B4();
}

- (GPRecipe)recipe
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_recipe);
  swift_beginAccess();
  return (GPRecipe *)*v2;
}

- (void)setRecipe:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_recipe);
  swift_beginAccess();
  uint64_t v6 = *v5;
  BOOL *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_2442E5D58();
}

- (GPImagePickerViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___GPImagePickerViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24568FDF0](v2);

  return (GPImagePickerViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (GPImagePickerViewController)initWithStyle:(int64_t)a3
{
  return (GPImagePickerViewController *)GPImagePickerViewController.init(style:)(a3);
}

- (GPImagePickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo27GPImagePickerViewControllerC15ImagePlaygroundE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)GPImagePickerViewController;
  v2 = self;
  [(GPImagePickerViewController *)&v5 viewDidLoad];
  sub_243EA0958((uint64_t)v2 + OBJC_IVAR___GPImagePickerViewController__imagePickerViewController, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E45808);
  swift_dynamicCast();
  [(UIViewController *)v2 gp_addChildViewController:v3];
}

- (BOOL)isModalInPresentation
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_viewModel);
  swift_getKeyPath();
  sub_2442E9154(&qword_268E45818, (void (*)(uint64_t))type metadata accessor for GPImagePickerView.ViewModel);
  uint64_t v4 = self;
  swift_retain();
  sub_2443B55F0();
  swift_release();
  char v5 = *(unsigned char *)(v3 + 18);

  swift_release();
  return v5;
}

- (GPImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (GPImagePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_243EAE8F4((uint64_t)self + OBJC_IVAR___GPImagePickerViewController_delegate);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPImagePickerViewController__imagePickerView);
  uint64_t v3 = (char *)self + OBJC_IVAR___GPImagePickerViewController__imagePickerViewController;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end