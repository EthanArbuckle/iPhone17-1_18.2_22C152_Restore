@interface CCUIControlHostViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)controlHostViewShouldPerformPrimaryAction:(id)a3;
- (BOOL)isDevicePasscodeLocked:(id)a3;
- (BOOL)isResizing;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldPerformClickInteraction;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUIControlHostViewController)initWithCoder:(id)a3;
- (CCUIControlHostViewController)initWithIdentity:(id)a3 type:(unint64_t)a4 contentType:(unint64_t)a5 configurationIdentifier:(id)a6;
- (CCUIControlHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CCUIControlHostViewControllerDelegate)delegate;
- (CCUIModuleContentMetrics)contentMetrics;
- (CHSControlIdentity)identity;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (int64_t)gridSizeClass;
- (int64_t)userVisibilityStatus;
- (unint64_t)type;
- (void)controlHostView:(id)a3 enqueue:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setResizing:(BOOL)a3;
- (void)setUserVisibilityStatus:(int64_t)a3;
@end

@implementation CCUIControlHostViewController

- (CHSControlIdentity)identity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___CCUIControlHostViewController_identity));
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_type);
}

- (CCUIControlHostViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x1D9486180]((char *)self + OBJC_IVAR___CCUIControlHostViewController_delegate, a2);
  return (CCUIControlHostViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return (CCUIContentModuleContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext));
}

- (void)setContentModuleContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext) = (Class)a3;
  id v3 = a3;
}

- (CCUIControlHostViewController)initWithIdentity:(id)a3 type:(unint64_t)a4 contentType:(unint64_t)a5 configurationIdentifier:(id)a6
{
  return (CCUIControlHostViewController *)sub_1D837D4A8(a3, a4, a5);
}

- (CCUIControlHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo29CCUIControlHostViewControllerC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_controlInstance);
  id v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)CCUIControlHostViewController;
  [(CCUIControlHostViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_1D837C410((uint64_t)self + OBJC_IVAR___CCUIControlHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_controlInstance);
}

- (void)loadView
{
  v2 = self;
  CCUIControlHostViewController.loadView()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (int64_t)gridSizeClass
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_gridSizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setGridSizeClass:(int64_t)a3
{
  objc_super v4 = self;
  CCUIControlHostViewController.gridSizeClass.setter(a3);
}

- (int64_t)userVisibilityStatus
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setUserVisibilityStatus:(int64_t)a3
{
  BOOL v5 = a3 == 2;
  v6 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  int64_t *v6 = a3;
  if (a3 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * v5;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_controlInstance), sel_setVisibility_, v7);
}

- (double)compactContinuousCornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  objc_super v4 = self;
  CCUIControlHostViewController.compactContinuousCornerRadius.setter(a3);
}

- (CCUIModuleContentMetrics)contentMetrics
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentMetrics);
  swift_beginAccess();
  return (CCUIModuleContentMetrics *)*v2;
}

- (void)setContentMetrics:(id)a3
{
  id v6 = a3;
  BOOL v5 = self;
  sub_1D837E8EC(a3);
}

- (BOOL)isResizing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  objc_super v4 = self;
  CCUIControlHostViewController.isResizing.setter(a3);
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformClickInteraction
{
  v2 = self;
  id v3 = [(CCUIControlHostViewController *)v2 viewIfLoaded];
  if (v3)
  {
    objc_super v4 = v3;
    self;
    BOOL v5 = (void *)swift_dynamicCastObjCClass();
    if (!v5) {
  }
    }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = objc_msgSend(v5, sel_contextMenu);

  if (v6) {
  return v6 == 0;
  }
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 0;
}

- (BOOL)controlHostViewShouldPerformPrimaryAction:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  id v6 = [(CCUIControlHostViewController *)v5 delegate];
  if (v6)
  {
    unsigned __int8 v7 = [(CCUIControlHostViewControllerDelegate *)v6 controlHostViewControllerShouldPerformPrimaryAction:v5];

    swift_unknownObjectRelease();
    return v7;
  }
  else
  {

    return 1;
  }
}

- (void)controlHostView:(id)a3 enqueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = [(CCUIControlHostViewController *)v8 contentModuleContext];
  [(CCUIContentModuleContext *)v9 enqueueStatusUpdate:v7];
}

- (BOOL)isDevicePasscodeLocked:(id)a3
{
  id v4 = (CCUIControlHostViewController *)a3;
  BOOL v5 = self;
  id v6 = [(CCUIControlHostViewController *)v5 contentModuleContext];
  if (v6)
  {
    id v7 = (CCUIControlHostViewController *)v6;
    unsigned __int8 v8 = [(CCUIContentModuleContext *)v6 isDevicePasscodeLocked];

    id v4 = v5;
    BOOL v5 = v7;
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (CCUIControlHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CCUIControlHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end