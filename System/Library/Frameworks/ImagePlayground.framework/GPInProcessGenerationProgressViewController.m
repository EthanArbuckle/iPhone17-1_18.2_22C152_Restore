@interface GPInProcessGenerationProgressViewController
+ (BOOL)available;
- (BOOL)isAnimating;
- (BOOL)isShowingError;
- (GPInProcessGenerationProgressViewController)init;
- (GPInProcessGenerationProgressViewController)initWithCoder:(id)a3;
- (GPInProcessGenerationProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)transitionToImageDuration;
- (float)progress;
- (float)rampSize;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsShowingError:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setRampSize:(float)a3;
- (void)setTransitionToImageDuration:(double)a3;
- (void)transitionToFinalImage;
- (void)transitionToFinalImage:(id)a3;
- (void)transitionToGeneratingState;
- (void)viewDidLoad;
@end

@implementation GPInProcessGenerationProgressViewController

- (GPInProcessGenerationProgressViewController)init
{
  return (GPInProcessGenerationProgressViewController *)GPInProcessGenerationProgressViewController.init()();
}

- (GPInProcessGenerationProgressViewController)initWithCoder:(id)a3
{
  return (GPInProcessGenerationProgressViewController *)GPInProcessGenerationProgressViewController.init(coder:)(a3);
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (BOOL)isAnimating
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  swift_getKeyPath();
  sub_2442B2A4C((unint64_t *)&qword_268E44C70, (void (*)(uint64_t))type metadata accessor for AbstractEffectViewModel);
  v4 = self;
  sub_2443B55F0();
  swift_release();
  char v5 = *(unsigned char *)(v3 + 18);

  return (v5 & 1) == 0;
}

- (void)setIsAnimating:(BOOL)a3
{
  swift_getKeyPath();
  sub_2442B2A4C((unint64_t *)&qword_268E44C70, (void (*)(uint64_t))type metadata accessor for AbstractEffectViewModel);
  v4 = self;
  sub_2443B55E0();

  swift_release();
}

- (BOOL)isShowingError
{
  return (*(unsigned char **)((char *)&self->super.super.super.isa
                    + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel))[56];
}

- (void)setIsShowingError:(BOOL)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  *(unsigned char *)(v4 + 56) = a3;
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  v6 = self;
  sub_24426F538((void *)v4, v5);

  swift_release();
}

- (float)rampSize
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  swift_getKeyPath();
  sub_2442B2A4C(&qword_268E397A0, (void (*)(uint64_t))type metadata accessor for EffectViewModel);
  uint64_t v4 = self;
  sub_2443B55F0();
  swift_release();
  float v5 = *(float *)(v3 + OBJC_IVAR____TtC15ImagePlayground15EffectViewModel___rampSize);

  return v5;
}

- (void)setRampSize:(float)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  float v5 = self;
  sub_24426D110(v4, a3);
  swift_getKeyPath();
  sub_2442B2A4C(&qword_268E397A0, (void (*)(uint64_t))type metadata accessor for EffectViewModel);
  sub_2443B55E0();

  swift_release();
}

- (float)progress
{
  v2 = (float *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_progress);
  swift_beginAccess();
  return *v2;
}

- (void)setProgress:(float)a3
{
  float v5 = (float *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_progress);
  swift_beginAccess();
  *float v5 = a3;
  v6 = self;
  sub_243EE1DA0(a3);
}

- (double)transitionToImageDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_transitionToImageDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTransitionToImageDuration:(double)a3
{
  float v5 = (double *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_transitionToImageDuration);
  swift_beginAccess();
  *float v5 = a3;
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  v7 = self;
  sub_24426D418(v6, a3);
}

- (void)transitionToGeneratingState
{
  v2 = self;
  GPInProcessGenerationProgressViewController.transitionToGeneratingState()();
}

- (void)transitionToFinalImage
{
  v2 = self;
  GPInProcessGenerationProgressViewController.transitionToFinalImage()();
}

- (void)transitionToFinalImage:(id)a3
{
  id v4 = a3;
  float v5 = self;
  GPInProcessGenerationProgressViewController.transition(toFinalImage:)((UIImage)v4);
}

- (void)viewDidLoad
{
  v2 = self;
  GPInProcessGenerationProgressViewController.viewDidLoad()();
}

- (GPInProcessGenerationProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (GPInProcessGenerationProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessGenerationProgressViewController_generationViewController));

  swift_release();
}

@end