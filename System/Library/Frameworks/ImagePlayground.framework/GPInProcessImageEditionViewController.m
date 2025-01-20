@interface GPInProcessImageEditionViewController
+ (BOOL)available;
- (BOOL)isLoadingRecipe;
- (BOOL)sourceImageIsSketch;
- (GPAppleConnectTokenProvider)appleConnectTokenProvider;
- (GPImageEditionViewControllerDelegate)delegate;
- (GPInProcessImageEditionViewController)init;
- (GPInProcessImageEditionViewController)initWithCoder:(id)a3;
- (GPInProcessImageEditionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GPInProcessImageEditionViewController)initWithStyle:(int64_t)a3;
- (GPRecipe)recipe;
- (NSArray)generatedAssets;
- (NSString)localizedCreateButtonTitle;
- (UIImage)sourceImage;
- (int64_t)style;
- (void)setAppleConnectTokenProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGeneratedAssets:(id)a3;
- (void)setIsLoadingRecipe:(BOOL)a3;
- (void)setLocalizedCreateButtonTitle:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setSourceImageIsSketch:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation GPInProcessImageEditionViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (int64_t)style
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_style);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSArray)generatedAssets
{
  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2443BA7A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setGeneratedAssets:(id)a3
{
  type metadata accessor for GPExportablePhotoAsset(0);
  uint64_t v4 = sub_2443BA7C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_generatedAssets);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (UIImage)sourceImage
{
  return (UIImage *)sub_243F76644((uint64_t)self, (uint64_t)a2, &qword_268E45E38);
}

- (void)setSourceImage:(id)a3
{
  id v5 = a3;
  v6 = self;
  GPInProcessImageEditionViewController.sourceImage.setter(a3);
}

- (BOOL)isLoadingRecipe
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImageEditionViewController_imageEditionViewController);
  if (v2) {
    return *(unsigned char *)(v2 + qword_268E45E28);
  }
  else {
    return 0;
  }
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  uint64_t v4 = self;
  GPInProcessImageEditionViewController.isLoadingRecipe.setter(a3);
}

- (GPRecipe)recipe
{
  return (GPRecipe *)sub_243F76644((uint64_t)self, (uint64_t)a2, &qword_268E45E30);
}

- (void)setRecipe:(id)a3
{
  id v5 = a3;
  v6 = self;
  GPInProcessImageEditionViewController.recipe.setter(a3);
}

- (BOOL)sourceImageIsSketch
{
  uint64_t v2 = (BOOL *)self + OBJC_IVAR___GPInProcessImageEditionViewController_sourceImageIsSketch;
  swift_beginAccess();
  return *v2;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___GPInProcessImageEditionViewController_sourceImageIsSketch;
  swift_beginAccess();
  BOOL *v4 = a3;
  if (qword_268E37878 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2443B6800();
  __swift_project_value_buffer(v5, (uint64_t)qword_268E39210);
  v6 = sub_2443B67E0();
  os_log_type_t v7 = sub_2443BAD10();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_243E89000, v6, v7, "Not implemented yet", v8, 2u);
    MEMORY[0x24568FCC0](v8, -1, -1);
  }
}

- (NSString)localizedCreateButtonTitle
{
  uint64_t v2 = (char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_localizedCreateButtonTitle;
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
  os_log_type_t v7 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  *os_log_type_t v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  if (qword_268E37878 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2443B6800();
  __swift_project_value_buffer(v9, (uint64_t)qword_268E39210);
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

- (GPImageEditionViewControllerDelegate)delegate
{
  uint64_t v2 = (char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24568FDF0](v2);

  return (GPImageEditionViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (GPAppleConnectTokenProvider)appleConnectTokenProvider
{
  uint64_t v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a3;
  id v7 = a3;
  v8 = self;

  if (*v5) {
    sub_243F77244();
  }
}

- (GPInProcessImageEditionViewController)init
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init()();
}

- (GPInProcessImageEditionViewController)initWithStyle:(int64_t)a3
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init(style:)(a3);
}

- (GPInProcessImageEditionViewController)initWithCoder:(id)a3
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init(coder:)(a3);
}

- (GPInProcessImageEditionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (GPInProcessImageEditionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_243EAE8F4((uint64_t)self + OBJC_IVAR___GPInProcessImageEditionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___GPInProcessImageEditionViewController_imageEditionViewController);
}

@end