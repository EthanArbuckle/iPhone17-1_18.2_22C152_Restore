@interface GPInProcessMagicPaperViewController
+ (BOOL)available;
- (BOOL)isAnimating;
- (CGRect)magicViewFullFrame;
- (GPAppleConnectTokenProvider)appleConnectTokenProvider;
- (GPInProcessMagicPaperViewController)initWithCoder:(id)a3;
- (GPInProcessMagicPaperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GPInProcessMagicPaperViewControllerDelegate)delegate;
- (GPRecipe)recipe;
- (double)magicViewFullHeightForKeyboardScrolling;
- (id)initForMagicWandDrawingInFrame:(CGRect)a3;
- (void)finishSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4;
- (void)setAppleConnectTokenProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setRecipe:(id)a3;
- (void)setState:(id)a3;
- (void)startSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4;
- (void)updateSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4;
- (void)upscaleIfPossible;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GPInProcessMagicPaperViewController

- (GPInProcessMagicPaperViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x24568FDF0]((char *)self + OBJC_IVAR___GPInProcessMagicPaperViewController_delegate, a2);

  return (GPInProcessMagicPaperViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (GPAppleConnectTokenProvider)appleConnectTokenProvider
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  if (*v5) {
    sub_243F157B4();
  }
}

- (id)initForMagicWandDrawingInFrame:(CGRect)a3
{
  sub_243F18874();
  return result;
}

- (GPInProcessMagicPaperViewController)initWithCoder:(id)a3
{
  return (GPInProcessMagicPaperViewController *)GPInProcessMagicPaperViewController.init(coder:)(a3);
}

- (BOOL)isAnimating
{
  v2 = self;
  char v3 = GPInProcessMagicPaperViewController.isAnimating.getter();

  return v3 & 1;
}

- (void)setIsAnimating:(BOOL)a3
{
  char v3 = self;
  GPInProcessMagicPaperViewController.isAnimating.setter();
}

- (void)setState:(id)a3
{
  v4 = (GPMagicPaperState *)a3;
  v5 = self;
  GPInProcessMagicPaperViewController.setState(_:)(v4);
}

- (void)startSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  v5 = a3;
  v6 = self;
  sub_243F16334(v5);
}

- (void)updateSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  v6 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  id v7 = *v6;
  if (*v6)
  {
    v8 = a3;
    v9 = self;
    id v10 = v7;
    sub_244174DB0(v8);
  }
}

- (void)finishSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  v5 = a3;
  v6 = self;
  sub_243F16884(v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GPInProcessMagicPaperViewController;
  v4 = self;
  [(GPInProcessMagicPaperViewController *)&v5 viewWillDisappear:v3];
  [(GPInProcessMagicPaperViewController *)v4 upscaleIfPossible];
}

- (GPRecipe)recipe
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  if (*v2) {
    id v3 = *(id *)(*v2 + qword_268E41A58);
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
  sub_243F16F5C(a3);
}

- (CGRect)magicViewFullFrame
{
  v2 = self;
  sub_243F17084();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)magicViewFullHeightForKeyboardScrolling
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  double result = 0.0;
  if (*v2)
  {
    uint64_t v4 = *(void *)(*v2 + qword_268E41A50);
    if (v4) {
      return *(double *)(v4 + OBJC_IVAR____TtC15ImagePlayground14MagicViewModel_magicViewFullHeightForKeyboardScrolling);
    }
  }
  return result;
}

- (void)upscaleIfPossible
{
  v2 = self;
  GPInProcessMagicPaperViewController.upscaleIfPossible()();
}

- (GPInProcessMagicPaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (GPInProcessMagicPaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243EAE8F4((uint64_t)self + OBJC_IVAR___GPInProcessMagicPaperViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider));
  swift_release();
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
}

@end