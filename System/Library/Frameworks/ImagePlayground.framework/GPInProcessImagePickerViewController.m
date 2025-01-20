@interface GPInProcessImagePickerViewController
+ (BOOL)available;
+ (BOOL)isAvailableOnCurrentDevice;
- (BOOL)isLoadingRecipe;
- (GPAppleConnectTokenProvider)appleConnectTokenProvider;
- (GPImagePickerViewControllerDelegate)delegate;
- (GPInProcessImagePickerViewController)initWithCoder:(id)a3;
- (GPInProcessImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GPInProcessImagePickerViewController)initWithStyle:(int64_t)a3;
- (GPRecipe)recipe;
- (NSArray)selectedAssets;
- (NSString)localizedCreateButtonTitle;
- (int64_t)style;
- (void)closeComposingViewIfNeeded;
- (void)delegate:(id)a3 didStageAssetWithIdentifier:(id)a4;
- (void)delegate:(id)a3 didUnstageAssetWithIdentifier:(id)a4;
- (void)setAppleConnectTokenProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsLoadingRecipe:(BOOL)a3;
- (void)setLocalizedCreateButtonTitle:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setSelectedAssets:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation GPInProcessImagePickerViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

+ (BOOL)isAvailableOnCurrentDevice
{
  return objc_msgSend(a1, sel_isAvailable);
}

- (int64_t)style
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_style);
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_selectedAssets);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (GPImagePickerViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24568FDF0](v2);

  return (GPImagePickerViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (GPAppleConnectTokenProvider)appleConnectTokenProvider
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider);
  swift_beginAccess();
  v6 = *v5;
  uint64_t *v5 = a3;
  id v7 = a3;
  v8 = self;

  if (*v5) {
    sub_243EAB7F4();
  }
}

- (BOOL)isLoadingRecipe
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController);
  if (v2) {
    return *(unsigned char *)(v2 + qword_268E409B0);
  }
  else {
    return 0;
  }
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  uint64_t v4 = self;
  GPInProcessImagePickerViewController.isLoadingRecipe.setter(a3);
}

- (GPRecipe)recipe
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController);
  if (v2) {
    id v3 = *(id *)(v2 + qword_268E409B8);
  }
  else {
    id v3 = 0;
  }

  return (GPRecipe *)v3;
}

- (void)setRecipe:(id)a3
{
  id v5 = a3;
  v6 = self;
  GPInProcessImagePickerViewController.recipe.setter(a3);
}

- (GPInProcessImagePickerViewController)initWithStyle:(int64_t)a3
{
  return (GPInProcessImagePickerViewController *)GPInProcessImagePickerViewController.init(style:)(a3);
}

- (GPInProcessImagePickerViewController)initWithCoder:(id)a3
{
  return (GPInProcessImagePickerViewController *)GPInProcessImagePickerViewController.init(coder:)(a3);
}

- (void)closeComposingViewIfNeeded
{
  uint64_t v2 = self;
  GPInProcessImagePickerViewController.closeComposingViewIfNeeded()();
}

- (void)delegate:(id)a3 didStageAssetWithIdentifier:(id)a4
{
}

- (void)delegate:(id)a3 didUnstageAssetWithIdentifier:(id)a4
{
}

- (NSString)localizedCreateButtonTitle
{
  if (*(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___GPInProcessImagePickerViewController_localizedCreateButtonTitle))
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = (void *)sub_2443BA4B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setLocalizedCreateButtonTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_2443BA4F0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_localizedCreateButtonTitle);
  uint64_t *v6 = v4;
  v6[1] = v5;
  id v7 = self;
  swift_bridgeObjectRelease();
  if (qword_268E37878 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2443B6800();
  __swift_project_value_buffer(v8, (uint64_t)qword_268E39210);
  oslog = sub_2443B67E0();
  os_log_type_t v9 = sub_2443BAD10();
  if (os_log_type_enabled(oslog, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_243E89000, oslog, v9, "Not implemented yet", v10, 2u);
    MEMORY[0x24568FCC0](v10, -1, -1);
  }
}

- (GPInProcessImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (GPInProcessImagePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_243EAE8F4((uint64_t)self + OBJC_IVAR___GPInProcessImagePickerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController));

  swift_bridgeObjectRelease();
}

@end