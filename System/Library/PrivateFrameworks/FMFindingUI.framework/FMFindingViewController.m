@interface FMFindingViewController
- (BOOL)accessibilityFoundPlayerViewIsVisible;
- (BOOL)shouldAutorotate;
- (CGRect)accessibilityFoundPlayerViewAXFrame;
- (NSString)description;
- (UILabel)accessibilityInstructionsLabel;
- (UILabel)accessibilityNameLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC11FMFindingUI14FMAVPlayerView)foundPlayerView;
- (_TtC11FMFindingUI16FMBTDistanceView)accessibilityBTDistanceView;
- (_TtC11FMFindingUI16FMR1DistanceView)accessibilityR1DistanceView;
- (_TtC11FMFindingUI23FMFindingViewController)initWithCoder:(id)a3;
- (_TtC11FMFindingUI23FMFindingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)accessibilityModeRawValue;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)closeActionWithSender:(id)a3;
- (void)dealloc;
- (void)handlePartPickerWithSender:(id)a3;
- (void)openMessagesActionWithSender:(id)a3;
- (void)playSoundActionWithSender:(id)a3;
- (void)torchActionWithSender:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FMFindingViewController

- (void)closeActionWithSender:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v9[4] = sub_24D30A30C;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24D32194C;
  v9[3] = &unk_26FF87498;
  v6 = _Block_copy(v9);
  v7 = self;
  id v8 = a3;
  swift_release();
  [(FMFindingViewController *)v7 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);
}

- (void)handlePartPickerWithSender:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24D39D0C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_24D308AD8((uint64_t)v6);

  sub_24D2BBFB4((uint64_t)v6, &qword_269861850);
}

- (void)playSoundActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D309AF8();
}

- (void)openMessagesActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D309CCC();
}

- (void)torchActionWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24D309058(2, 1);
  sub_24D307D30();
}

- (_TtC11FMFindingUI14FMAVPlayerView)foundPlayerView
{
  return (_TtC11FMFindingUI14FMAVPlayerView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView));
}

- (_TtC11FMFindingUI23FMFindingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s11FMFindingUI0A14ViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  id v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  FMFindingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super._dimmingView + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._currentAction + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  uint64_t v9 = *(uint64_t *)((char *)&self->super._externalObjectsTableForViewLoading
                  + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  long long v4 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[4] = *(_OWORD *)((char *)&self->super._navigationItem + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[6] = *(_OWORD *)((char *)&self->super._nibBundle + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_style);
  v8[3] = v7;
  sub_24D3455A4((uint64_t)v8);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_snapshotContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_findingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pickerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pickerViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabelsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsTopLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_hapticsController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_torchButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_rightActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_r1DistanceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_btDistanceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_pulseTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_incorrectOrientationView));
  swift_bridgeObjectRelease();
  sub_24D34512C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_state, (uint64_t (*)(void))type metadata accessor for FMFindingViewState);
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_playSoundHandler));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_willAppearHandler));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_willDisappearHandler));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_dismissedHandler));
}

- (void)applicationDidEnterBackground
{
  v2 = self;
  sub_24D334E1C();
}

- (void)applicationWillEnterForeground
{
  v2 = self;
  sub_24D335234();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24D335320();
}

- (void)viewWillAppear:(BOOL)a3
{
  long long v4 = self;
  sub_24D335470(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMFindingViewController();
  long long v4 = (char *)v9.receiver;
  [(FMFindingViewController *)&v9 viewDidAppear:v3];
  long long v5 = *(char **)&v4[OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_findingView];
  long long v6 = *(void **)&v5[OBJC_IVAR____TtC11FMFindingUI8FMPFView_skScene];
  if (v6)
  {
    long long v7 = v5;
    id v8 = v6;
    sub_24D349A48(0, 1.0);

    long long v4 = v8;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  long long v4 = self;
  sub_24D335CC0(a3);
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = self;
  long long v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6) {
    return 2;
  }
  else {
    return 26;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_24D3360AC(a4, width, height);
  swift_unknownObjectRelease();
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (_TtC11FMFindingUI23FMFindingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11FMFindingUI23FMFindingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_titleLabel));
}

- (UILabel)accessibilityNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_nameLabel));
}

- (unsigned)accessibilityModeRawValue
{
  v2 = self;
  unsigned int v3 = sub_24D34BB2C();

  return v3;
}

- (UILabel)accessibilityInstructionsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_instructionsLabel));
}

- (_TtC11FMFindingUI16FMBTDistanceView)accessibilityBTDistanceView
{
  return (_TtC11FMFindingUI16FMBTDistanceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_btDistanceView));
}

- (_TtC11FMFindingUI16FMR1DistanceView)accessibilityR1DistanceView
{
  return (_TtC11FMFindingUI16FMR1DistanceView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_r1DistanceView));
}

- (BOOL)accessibilityFoundPlayerViewIsVisible
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView);
  if (v2) {
    return *(unsigned char *)(v2 + OBJC_IVAR____TtC11FMFindingUI14FMAVPlayerView_isShown);
  }
  else {
    return 0;
  }
}

- (CGRect)accessibilityFoundPlayerViewAXFrame
{
  uint64_t v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI23FMFindingViewController_foundPlayerView);
  if (v2)
  {
    objc_msgSend(v2, sel_accessibilityFrame);
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v3 = 0.0;
    double v4 = 0.0;
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end