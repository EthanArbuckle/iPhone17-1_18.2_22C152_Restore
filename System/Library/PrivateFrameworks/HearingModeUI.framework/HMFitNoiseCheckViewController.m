@interface HMFitNoiseCheckViewController
+ (void)prepareFitTest;
- (FitNoiseCheckDelegate)fitNoiseCheckDelegate;
- (HMFitNoiseCheckViewController)initWithDeviceAddress:(id)a3;
- (_TtC13HearingModeUI19HMNoiseCheckService)noiseCheckService;
- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)fitNoiseCheckTopView;
- (void)continueButtonTapped;
- (void)setFitNoiseCheckDelegate:(id)a3;
- (void)setFitNoiseCheckTopView:(id)a3;
- (void)setNoiseCheckService:(id)a3;
- (void)setupPlayer;
- (void)startListeningForNoiseLevelChange;
- (void)stopListeningForNoiseLevelChange;
- (void)updateButtonTray;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMFitNoiseCheckViewController

- (HMFitNoiseCheckViewController)initWithDeviceAddress:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Find a quiet place where you can focus and take the test." value:&stru_27021F2D8 table:0];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Too much background noise can cause inaccurate results in your test." value:&stru_27021F2D8 table:0];

  v17.receiver = self;
  v17.super_class = (Class)HMFitNoiseCheckViewController;
  v10 = [(HMFitNoiseCheckViewController *)&v17 initWithTitle:v7 detailText:v9 icon:0 contentLayout:1];
  if (v10)
  {
    NSLog(&cfstr_FitNoiseCheckI.isa, v5);
    objc_storeStrong((id *)&v10->_deviceAddress, a3);
    id v11 = (id)[MEMORY[0x263F2B998] sharedInstance];
    v12 = objc_alloc_init(_TtC13HearingModeUI19HMNoiseCheckService);
    noiseCheckService = v10->_noiseCheckService;
    v10->_noiseCheckService = v12;

    v14 = [[_TtC13HearingModeUI22HMFitNoiseCheckTopView alloc] initWithService:v10->_noiseCheckService];
    fitNoiseCheckTopView = v10->_fitNoiseCheckTopView;
    v10->_fitNoiseCheckTopView = v14;
  }
  return v10;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)HMFitNoiseCheckViewController;
  [(HMHearingTitle2BaseWelcomeController *)&v25 viewDidLoad];
  v3 = [(HMFitNoiseCheckViewController *)self contentView];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckDelegate];
  [(OBWelcomeController *)self fitNoiseSetupCancelButtonWithFitDelegate:v5];

  v6 = [(HMFitNoiseCheckViewController *)self contentView];
  v7 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckTopView];
  [v6 addSubview:v7];

  v8 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckTopView];
  v9 = [(HMFitNoiseCheckViewController *)self contentView];
  [v8 pinToOther:v9];

  v10 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckTopView];
  [v10 transitionToNoiseNudging];

  id v11 = [MEMORY[0x263F825C8] clearColor];
  v12 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckTopView];
  [v12 setBackgroundColor:v11];

  v13 = [MEMORY[0x263F5B8B8] accessoryButton];
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"Show Suggestions To Reduce Noise" value:&stru_27021F2D8 table:0];
  [v13 setTitle:v15 forState:0];

  objc_initWeak(&location, self);
  v16 = (void *)MEMORY[0x263F823D0];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __44__HMFitNoiseCheckViewController_viewDidLoad__block_invoke;
  v22 = &unk_2653660F0;
  objc_copyWeak(&v23, &location);
  objc_super v17 = [v16 actionWithHandler:&v19];
  objc_msgSend(v13, "addAction:forControlEvents:", v17, 64, v19, v20, v21, v22);

  v18 = [(HMFitNoiseCheckViewController *)self headerView];
  [v18 addAccessoryButton:v13];

  [(HMFitNoiseCheckViewController *)self updateButtonTray];
  [(HMFitNoiseCheckViewController *)self setupPlayer];
  [(HMFitNoiseCheckViewController *)self startListeningForNoiseLevelChange];
  [(HMFitNoiseCheckViewController *)self setModalInPresentation:1];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __44__HMFitNoiseCheckViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showAirpodsNoiseReductionController];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMFitNoiseCheckViewController_viewDidDisappear___block_invoke;
  block[3] = &unk_265366118;
  block[4] = self;
  dispatch_async(v4, block);
}

void *__50__HMFitNoiseCheckViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 1192);
  if (result) {
    return (void *)[result stop];
  }
  return result;
}

- (void)setupPlayer
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 pathForResource:@"E+D-US_ML" ofType:@"wav"];

  id v5 = [NSURL fileURLWithPath:v4];
  v6 = [MEMORY[0x263EF93E0] sharedInstance];
  id v20 = 0;
  [v6 setActive:1 error:&v20];
  id v7 = v20;

  if (v7)
  {
    NSLog(&cfstr_NoisePreCheckS.isa, v7);
  }
  else
  {
    v8 = [MEMORY[0x263EF93E0] sharedInstance];
    uint64_t v9 = *MEMORY[0x263EF9060];
    id v19 = 0;
    [v8 setCategory:v9 error:&v19];
    id v7 = v19;

    if (v7)
    {
      NSLog(&cfstr_NoisePreCheckS_0.isa, v7);
    }
    else
    {
      v10 = [MEMORY[0x263EF93E0] sharedInstance];
      uint64_t v11 = *MEMORY[0x263EF9138];
      id v18 = 0;
      [v10 setMode:v11 error:&v18];
      id v12 = v18;

      if (v12) {
        NSLog(&cfstr_NoisePreCheckS_1.isa, v12);
      }
      id v17 = v12;
      v13 = (AVAudioPlayer *)[objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v5 error:&v17];
      id v7 = v17;

      player = self->_player;
      self->_player = v13;

      [(AVAudioPlayer *)self->_player setNumberOfLoops:-1];
      [(AVAudioPlayer *)self->_player prepareToPlay];
      NSLog(&cfstr_NoisePreCheckS_2.isa);
      v15 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__HMFitNoiseCheckViewController_setupPlayer__block_invoke;
      block[3] = &unk_265366118;
      block[4] = self;
      dispatch_async(v15, block);
    }
  }
}

void *__44__HMFitNoiseCheckViewController_setupPlayer__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 1192);
  if (result)
  {
    [result setVolume:0.0];
    [*(id *)(*(void *)(a1 + 32) + 1192) setCurrentTime:0.0];
    v3 = *(void **)(*(void *)(a1 + 32) + 1192);
    return (void *)[v3 play];
  }
  return result;
}

- (void)updateButtonTray
{
  id v6 = [MEMORY[0x263F5B898] boldButton];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Next" value:&stru_27021F2D8 table:0];

  [v6 setTitle:v4 forState:0];
  [v6 addTarget:self action:sel_continueButtonTapped forControlEvents:64];
  [v6 setEnabled:0];
  id v5 = [(HMFitNoiseCheckViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)continueButtonTapped
{
  NSLog(&cfstr_FitNoiseCheckC.isa, a2);
  v3 = [_TtC13HearingModeUI38FitNoiseAirpodPlacementVideoController alloc];
  v4 = [(HMFitNoiseCheckViewController *)self fitNoiseCheckDelegate];
  id v7 = [(FitNoiseAirpodPlacementVideoController *)v3 initWithNoiseDelegate:v4 btAddress:self->_deviceAddress];

  id v5 = [(HMFitNoiseCheckViewController *)self navigationController];
  NSLog(&cfstr_FitNoiseCheckP.isa, v7, v5);

  id v6 = [(HMFitNoiseCheckViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (FitNoiseCheckDelegate)fitNoiseCheckDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fitNoiseCheckDelegate);
  return (FitNoiseCheckDelegate *)WeakRetained;
}

- (void)setFitNoiseCheckDelegate:(id)a3
{
}

- (_TtC13HearingModeUI22HMFitNoiseCheckTopView)fitNoiseCheckTopView
{
  return self->_fitNoiseCheckTopView;
}

- (void)setFitNoiseCheckTopView:(id)a3
{
}

- (_TtC13HearingModeUI19HMNoiseCheckService)noiseCheckService
{
  return self->_noiseCheckService;
}

- (void)setNoiseCheckService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseCheckService, 0);
  objc_storeStrong((id *)&self->_fitNoiseCheckTopView, 0);
  objc_destroyWeak((id *)&self->_fitNoiseCheckDelegate);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

+ (void)prepareFitTest
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B2DE80);
  MEMORY[0x270FA5388](v2 - 8);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2512C4928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_2512C4908();
  uint64_t v6 = sub_2512C48F8();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v8;
  sub_2512B2EE8((uint64_t)v4, (uint64_t)&unk_269B2E048, v7);
  swift_release();
}

- (void)startListeningForNoiseLevelChange
{
  uint64_t v2 = self;
  HMFitNoiseCheckViewController.startListeningForNoiseLevelChange()();
}

- (void)stopListeningForNoiseLevelChange
{
  sub_2512C4348();
  sub_2512B3C08();
  uint64_t v3 = self;
  v4 = (void *)sub_2512C4958();
  swift_beginAccess();
  objc_setAssociatedObject(v3, &byte_269B31448, v4, (void *)1);
  swift_endAccess();

  uint64_t v5 = [(HMFitNoiseCheckViewController *)v3 fitNoiseCheckTopView];
  uint64_t v6 = *(uint64_t *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC13HearingModeUI22HMFitNoiseCheckTopView_provider);
  swift_retain();

  (*(void (**)(void))(*(void *)v6 + 296))();
  swift_release();
}

@end