@interface HMFaultCheckViewController
- (FaultCheckDelegate)faultCheckDelegate;
- (HMFaultCheckViewController)initWithDeviceAddress:(id)a3;
- (HMFaultCheckViewController)initWithDeviceAddress:(id)a3 withResult:(unint64_t)a4;
- (void)buttonTapped;
- (void)dismissFaultCheck;
- (void)retrieveFaultCheckResult;
- (void)setFaultCheckDelegate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)triggerManualFaultCheck;
- (void)updateButtonTray;
- (void)updateContentView;
- (void)updateHeaderView;
- (void)viewDidLoad;
@end

@implementation HMFaultCheckViewController

- (HMFaultCheckViewController)initWithDeviceAddress:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMFaultCheckViewController;
  v6 = [(HMFaultCheckViewController *)&v12 initWithTitle:@"AirPods Check" detailText:0 icon:0 contentLayout:1];
  if (v6)
  {
    NSLog(&cfstr_FaultCheckInit.isa, v5);
    objc_storeStrong((id *)&v6->_addressOrUUID, a3);
    uint64_t v7 = +[HearingAidUtils getBluetoothDeviceFromAddressOrUUID:v6->_addressOrUUID];
    device = v6->_device;
    v6->_device = (BluetoothDevice *)v7;

    v9 = objc_alloc_init(_TtC13HearingModeUI19HMFaultCheckService);
    faultCheckService = v6->_faultCheckService;
    v6->_faultCheckService = v9;

    v6->_result = 2;
  }

  return v6;
}

- (HMFaultCheckViewController)initWithDeviceAddress:(id)a3 withResult:(unint64_t)a4
{
  if (a4) {
    id v5 = "Unknown";
  }
  else {
    id v5 = "Failed";
  }
  id v6 = a3;
  NSLog(&cfstr_FaultCheckInit_0.isa, v6, v5);
  uint64_t v7 = [(HMFaultCheckViewController *)self initWithDeviceAddress:v6];

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HMFaultCheckViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(HMFaultCheckViewController *)self retrieveFaultCheckResult];
  [(HMFaultCheckViewController *)self updateHeaderView];
  [(HMFaultCheckViewController *)self updateContentView];
  [(HMFaultCheckViewController *)self updateButtonTray];
}

- (void)retrieveFaultCheckResult
{
  sleep(2u);
  int64_t v3 = [(HMFaultCheckService *)self->_faultCheckService faultCheckResult];
  self->_result = v3;
  v4 = "Unknown";
  if (v3 == 1) {
    v4 = "Failed";
  }
  if (!v3) {
    v4 = "Passed";
  }
  NSLog(&cfstr_FaultCheckResu.isa, v4);
  if (self->_result == 2)
  {
    [(HMFaultCheckViewController *)self triggerManualFaultCheck];
  }
}

- (void)triggerManualFaultCheck
{
  NSLog(&cfstr_FaultCheckTrig.isa, a2);
  int64_t v3 = (HMServiceClient *)objc_alloc_init(MEMORY[0x263F472F8]);
  hearingModeClient = self->_hearingModeClient;
  self->_hearingModeClient = v3;

  objc_initWeak(&location, self);
  id v5 = self->_hearingModeClient;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMFaultCheckViewController_triggerManualFaultCheck__block_invoke;
  v6[3] = &unk_265366280;
  objc_copyWeak(&v7, &location);
  [(HMServiceClient *)v5 activateWithCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__HMFaultCheckViewController_triggerManualFaultCheck__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    NSLog(&cfstr_FaultCheckFail.isa, v3);
    [WeakRetained[150] invalidate];
    id v5 = WeakRetained[150];
    WeakRetained[150] = 0;
  }
  else
  {
    NSLog(&cfstr_FaultCheckOkTo.isa);
    id v6 = WeakRetained[150];
    id v7 = WeakRetained[148];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__HMFaultCheckViewController_triggerManualFaultCheck__block_invoke_2;
    v8[3] = &unk_2653660A0;
    v8[4] = WeakRetained;
    [v6 triggerOnDemandDiagnosticCheckForDeviceIdentifier:v7 completion:v8];
  }
}

uint64_t __53__HMFaultCheckViewController_triggerManualFaultCheck__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = "Failed";
  if (!a2) {
    id v3 = "Succeeded";
  }
  NSLog(&cfstr_FaultCheckTrig_0.isa, v3);
  v4 = *(void **)(*(void *)(a1 + 32) + 1200);

  return [v4 invalidate];
}

- (void)updateHeaderView
{
  int64_t result = self->_result;
  switch(result)
  {
    case 2:
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v8 localizedStringForKey:@"Your AirPods Pro Need to Run a Self Check" value:&stru_27021F2D8 table:0];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = v5;
      id v7 = @"Before taking a hearing test, your AirPods Pro need to make sure everything is working properly. Please put them back in your case and try again later.\n\nLearn more…";
      goto LABEL_7;
    case 1:
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v9 localizedStringForKey:@"AirPods Pro Cannot be Used to Test Your Hearing" value:&stru_27021F2D8 table:0];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = v5;
      id v7 = @"There is an issue that could affect your test results.\n\nLearn more…";
      goto LABEL_7;
    case 0:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v4 localizedStringForKey:@"Your AirPods Pro is Good To Go" value:&stru_27021F2D8 table:0];

      id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = v5;
      id v7 = &stru_27021F2D8;
LABEL_7:
      v10 = [v5 localizedStringForKey:v7 value:&stru_27021F2D8 table:0];

      goto LABEL_9;
  }
  id v13 = 0;
  v10 = 0;
LABEL_9:
  v11 = [(HMFaultCheckViewController *)self headerView];
  [v11 setTitle:v13];

  objc_super v12 = [(HMFaultCheckViewController *)self headerView];
  [v12 setDetailText:v10];
}

- (void)updateContentView
{
  v27[3] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(HMFaultCheckViewController *)self contentView];
  [v4 setBackgroundColor:v3];

  int64_t result = self->_result;
  id v6 = @"FaultCheckFailed";
  if (result == 2) {
    id v6 = @"FaultCheckUnknown";
  }
  if (result) {
    id v7 = v6;
  }
  else {
    id v7 = &stru_27021F2D8;
  }
  v8 = (void *)MEMORY[0x263F827E8];
  v9 = (void *)MEMORY[0x263F086E0];
  v10 = v7;
  v11 = [v9 bundleForClass:objc_opt_class()];
  v26 = [v8 imageNamed:v10 inBundle:v11 withConfiguration:0];

  objc_super v12 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v26];
  [v12 setContentMode:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [(HMFaultCheckViewController *)self contentView];
  [v13 addSubview:v12];

  v23 = (void *)MEMORY[0x263F08938];
  v24 = [v12 centerXAnchor];
  v25 = [(HMFaultCheckViewController *)self contentView];
  v14 = [v25 centerXAnchor];
  v15 = [v24 constraintEqualToAnchor:v14];
  v27[0] = v15;
  v16 = [v12 topAnchor];
  v17 = [(HMFaultCheckViewController *)self contentView];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v27[1] = v19;
  v20 = [v12 heightAnchor];
  v21 = [v20 constraintEqualToConstant:300.0];
  v27[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  [v23 activateConstraints:v22];
}

- (void)updateButtonTray
{
  id v6 = [MEMORY[0x263F5B898] boldButton];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"Done" value:&stru_27021F2D8 table:0];

  [v6 setTitle:v4 forState:0];
  [v6 addTarget:self action:sel_buttonTapped forControlEvents:64];
  id v5 = [(HMFaultCheckViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)buttonTapped
{
}

- (void)setStatus:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = "Passed";
    goto LABEL_10;
  }
  if (!a3)
  {
    id v5 = "Failed";
LABEL_10:
    NSLog(&cfstr_FaultCheckSetS.isa, a2, v5);
    v10 = [(HMFaultCheckViewController *)self faultCheckDelegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      BOOL v12 = a3 == 1;
      v9 = [(HMFaultCheckViewController *)self faultCheckDelegate];
      [v9 faultCheckCompleted:self status:v12];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v6 = "Interrupted";
  if (a3 == 2) {
    id v6 = "Cancelled";
  }
  NSLog(&cfstr_FaultCheckSetS.isa, a2, v6);
  if (a3 == 2)
  {
    id v7 = [(HMFaultCheckViewController *)self faultCheckDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(HMFaultCheckViewController *)self faultCheckDelegate];
      [v9 faultCheckCancelled:self];
LABEL_12:
      id v13 = @"Fault Check: Delegate Tiggered";
LABEL_14:

      NSLog(&v13->isa);
      return;
    }
LABEL_13:
    v9 = [(HMFaultCheckViewController *)self navigationController];
    id v14 = (id)[v9 popViewControllerAnimated:1];
    id v13 = @"Fault Check: Delegate Missing, Self Dismissed";
    goto LABEL_14;
  }
}

- (void)dismissFaultCheck
{
}

- (FaultCheckDelegate)faultCheckDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faultCheckDelegate);

  return (FaultCheckDelegate *)WeakRetained;
}

- (void)setFaultCheckDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faultCheckDelegate);
  objc_storeStrong((id *)&self->_faultCheckService, 0);
  objc_storeStrong((id *)&self->_hearingModeClient, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_addressOrUUID, 0);
}

@end