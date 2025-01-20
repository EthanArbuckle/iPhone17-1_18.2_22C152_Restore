@interface CCUISControlsGalleryViewController
- (CCUISConfiguredControl)selectedControl;
- (CCUISControlsGalleryViewController)initWithCoder:(id)a3;
- (CCUISControlsGalleryViewController)initWithConfiguration:(id)a3;
- (CCUISControlsGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUISControlsGalleryViewControllerCustomItemsDelegate)customItemsDelegate;
- (CCUISControlsGalleryViewControllerDelegate)delegate;
- (void)setCustomItemsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedControl:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CCUISControlsGalleryViewController

- (CCUISControlsGalleryViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  return (CCUISControlsGalleryViewController *)sub_24A7CB484(a3);
}

- (CCUISControlsGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo34CCUISControlsGalleryViewControllerC23ControlCenterUIServicesE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CCUISControlsGalleryViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C5D11D0]((char *)self + OBJC_IVAR___CCUISControlsGalleryViewController_delegate, a2);
  return (CCUISControlsGalleryViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (CCUISConfiguredControl)selectedControl
{
  return (CCUISConfiguredControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl));
}

- (void)setSelectedControl:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl) = (Class)a3;
  id v6 = a3;
  v5 = self;

  [(CCUISControlsGalleryViewController *)v5 isViewLoaded];
}

- (void)viewDidLoad
{
  v2 = self;
  CCUISControlsGalleryViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CCUISControlsGalleryViewController;
  id v4 = self;
  [(CCUISControlsGalleryViewController *)&v8 viewIsAppearing:v3];
  id v5 = objc_allocWithZone(MEMORY[0x263F31E28]);
  id v6 = objc_msgSend(v5, sel_init, v8.receiver, v8.super_class);
  v7 = (void *)sub_24A7DCA10();
  objc_msgSend(v6, sel_userEnteredAddGalleryForHost_, v7);
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  CCUISControlsGalleryViewController.viewWillLayoutSubviews()();
}

- (CCUISControlsGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CCUISControlsGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24A7CC544((uint64_t)self + OBJC_IVAR___CCUISControlsGalleryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager));
  BOOL v3 = (char *)self + OBJC_IVAR___CCUISControlsGalleryViewController__customItemsDelegate;
  sub_24A7CC544((uint64_t)v3);
}

- (CCUISControlsGalleryViewControllerCustomItemsDelegate)customItemsDelegate
{
  v2 = (void *)MEMORY[0x24C5D11D0]((char *)self + OBJC_IVAR___CCUISControlsGalleryViewController__customItemsDelegate, a2);
  return (CCUISControlsGalleryViewControllerCustomItemsDelegate *)v2;
}

- (void)setCustomItemsDelegate:(id)a3
{
}

@end