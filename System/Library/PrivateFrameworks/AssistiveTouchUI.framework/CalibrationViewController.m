@interface CalibrationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithCoder:(id)a3;
- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTapGuesture:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CalibrationViewController

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16AssistiveTouchUI25CalibrationViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2487C7B10();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTapGuesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2487C8BA4();
}

- (_TtC16AssistiveTouchUI25CalibrationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16AssistiveTouchUI25CalibrationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2487C8CFC((uint64_t)self + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView);
}

@end