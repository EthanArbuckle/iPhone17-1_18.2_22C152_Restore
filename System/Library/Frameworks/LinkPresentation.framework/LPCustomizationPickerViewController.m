@interface LPCustomizationPickerViewController
- (LPCustomizationPickerViewController)initWithCoder:(id)a3;
- (LPCustomizationPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (LPCustomizationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (LPCustomizationPickerViewController)initWithRootViewController:(id)a3;
- (LPCustomizationPickerViewController)initWithSource:(id)a3;
- (LPCustomizationPickerViewControllerDelegate)customizationDelegate;
- (UIImage)mask;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)handleTapGestureForLinkView:(id)a3;
- (void)handleTapGestureForScrollView:(id)a3;
- (void)setCustomizationDelegate:(id)a3;
- (void)setMask:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation LPCustomizationPickerViewController

- (UIImage)mask
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  id v5 = *v4;
  swift_release();

  swift_release();

  return (UIImage *)v5;
}

- (void)setMask:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = (void **)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  v8 = *v7;
  *v7 = v5;
  swift_release();

  swift_release();
}

- (LPCustomizationPickerViewControllerDelegate)customizationDelegate
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (char *)v3 + OBJC_IVAR___LPCustomizationPickerViewController_customizationDelegate;
  swift_beginAccess();
  id v5 = (void *)MEMORY[0x1A624C280](v4);
  swift_release();

  swift_release();

  return (LPCustomizationPickerViewControllerDelegate *)v5;
}

- (void)setCustomizationDelegate:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_unknownObjectRetain();
  v4 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
}

- (LPCustomizationPickerViewController)initWithSource:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (LPCustomizationPickerViewController *)sub_1A36CFDB8((uint64_t)a3);
  swift_release();
  return v4;
}

- (LPCustomizationPickerViewController)initWithCoder:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
}

- (void)viewDidLayoutSubviews
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = self;
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = v5;
  v7.super_class = (Class)LPCustomizationPickerViewController;
  [(LPCustomizationPickerViewController *)&v7 viewDidDisappear:v3];
  v6 = (id *)((char *)&v5->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  objc_msgSend(*v6, sel_setAlpha_, 1.0);
  swift_release();

  swift_release();
}

- (void)handleTapGestureForLinkView:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_1A36D1E90(v5);
  swift_release();
}

- (void)handleTapGestureForScrollView:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_1A36D3664();
  swift_release();
}

- (LPCustomizationPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (LPCustomizationPickerViewController)initWithRootViewController:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (LPCustomizationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController_source));

  sub_1A36D30CC((uint64_t)self + OBJC_IVAR___LPCustomizationPickerViewController_customizationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  id v13 = _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE09animationD012forPresented10presenting6sourceSo06UIViewD21AnimatedTransitioning_pSgSo0lD0C_A2KtF_0(v9);
  swift_release();

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  sub_1A36D6F88();
  sub_1A36D6F78();
  sub_1A36D6F48();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  id v7 = LPCustomizationPickerViewController.animationController(forDismissed:)(v5);
  swift_release();

  return v7;
}

@end