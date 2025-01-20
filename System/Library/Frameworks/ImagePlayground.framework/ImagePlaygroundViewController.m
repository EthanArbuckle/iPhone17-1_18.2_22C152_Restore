@interface ImagePlaygroundViewController
+ (BOOL)available;
- (BOOL)isModalInPresentation;
- (BOOL)sourceImageIsSketch;
- (GPRecipe)recipe;
- (ImageGenerationViewControllerDelegate)delegate;
- (NSArray)resultingAssets;
- (NSString)localizedCreateButtonTitle;
- (UIImage)sourceImage;
- (_TtC15ImagePlayground29ImagePlaygroundViewController)init;
- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithCoder:(id)a3;
- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP15ImagePlayground44ImageGenerationViewControllerPrivateDelegate_)privateDelegate;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)style;
- (unint64_t)supportedInterfaceOrientations;
- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3;
- (void)editorDidGenerateAssets:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizedCreateButtonTitle:(id)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setResultingAssets:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setSourceImageIsSketch:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation ImagePlaygroundViewController

- (UIImage)sourceImage
{
  return (UIImage *)sub_243F43EB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImage);
}

- (void)setSourceImage:(id)a3
{
}

- (ImageGenerationViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24568FDF0](v2);

  return (ImageGenerationViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)style
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_style);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtP15ImagePlayground44ImageGenerationViewControllerPrivateDelegate_)privateDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP15ImagePlayground44ImageGenerationViewControllerPrivateDelegate_ *)v2;
}

- (void)setPrivateDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_privateDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSArray)resultingAssets
{
  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2443BA7A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setResultingAssets:(id)a3
{
  type metadata accessor for GPExportablePhotoAsset(0);
  uint64_t v4 = sub_2443BA7C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_resultingAssets);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)sourceImageIsSketch
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImageIsSketch;
  swift_beginAccess();
  return *v2;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImageIsSketch;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (NSString)localizedCreateButtonTitle
{
  v2 = (char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_localizedCreateButtonTitle;
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
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (GPRecipe)recipe
{
  return (GPRecipe *)sub_243F43EB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_recipe);
}

- (void)setRecipe:(id)a3
{
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)init
{
  return (_TtC15ImagePlayground29ImagePlaygroundViewController *)ImagePlaygroundViewController.init()();
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_243F4A7F8();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImagePlaygroundViewController(0);
  v2 = (char *)v3.receiver;
  [(ImagePlaygroundViewController *)&v3 viewDidLoad];
  objc_msgSend(v2, sel_gp_addChildViewController_, *(void *)&v2[OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionViewController], v3.receiver, v3.super_class);
}

- (BOOL)isModalInPresentation
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_viewModel);
  swift_getKeyPath();
  sub_243F489D4(&qword_268E395D0, (void (*)(uint64_t))type metadata accessor for GPImageEditionView.ViewModel);
  uint64_t v4 = self;
  swift_retain();
  sub_2443B55F0();
  swift_release();
  char v5 = *(unsigned char *)(v3 + 17);

  swift_release();
  return v5;
}

- (int64_t)_preferredModalPresentationStyle
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6)
  {
    v9.receiver = v4;
    v9.super_class = (Class)type metadata accessor for ImagePlaygroundViewController(0);
    id v7 = [(ImagePlaygroundViewController *)&v9 _preferredModalPresentationStyle];
  }
  else
  {

    return 0;
  }
  return (int64_t)v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6)
  {
    v9.receiver = v4;
    v9.super_class = (Class)type metadata accessor for ImagePlaygroundViewController(0);
    id v7 = [(ImagePlaygroundViewController *)&v9 supportedInterfaceOrientations];
  }
  else
  {

    return 2;
  }
  return (unint64_t)v7;
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15ImagePlayground29ImagePlaygroundViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImage));
  sub_243EAE8F4((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_delegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_recipe));
  swift_release();
  sub_243F4A588((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionView, type metadata accessor for GPImageEditionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionViewController));
  swift_release();

  swift_bridgeObjectRelease();
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (void)editorDidGenerateAssets:(id)a3
{
  type metadata accessor for GPExportablePhotoAsset(0);
  uint64_t v4 = sub_2443BA7C0();
  id v5 = self;
  ImagePlaygroundViewController.editorDidGenerateAssets(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3
{
  uint64_t v4 = self;
  ImagePlaygroundViewController.editorDidCancel(requiresShowingGrid:)(a3);
}

@end