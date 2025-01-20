@interface NPHBSCellularFauxCardViewController
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NPHBSCellularFauxCardViewController)init;
- (NPHCellularBridgeBarcodeScannerView)scannerView;
- (UIButton)bypassFauxCardButton;
- (UIButton)enterFauxCardDataManuallyButton;
- (UILabel)activationCodeLabel;
- (UILabel)fauxDataLabel;
- (UIView)cutoutView;
- (UIView)fauxScanView;
- (id)_getFauxCardData;
- (id)codelessActivationBlock;
- (id)completion;
- (int64_t)userConsentResponse;
- (unint64_t)supportedInterfaceOrientations;
- (void)_setFauxCardData:(id)a3;
- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4;
- (void)bypassFauxCard:(id)a3;
- (void)cancelAction:(id)a3;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureSession:(id)a3 isRunning:(BOOL)a4;
- (void)cellularConfirmationCodeViewController:(id)a3 confirmedWithCode:(id)a4;
- (void)enterFauxCardDataManually:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentConfirmationCodeRequest;
- (void)setActivationCodeLabel:(id)a3;
- (void)setBypassFauxCardButton:(id)a3;
- (void)setCodelessActivationBlock:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCutoutView:(id)a3;
- (void)setEnterFauxCardDataManuallyButton:(id)a3;
- (void)setFauxDataLabel:(id)a3;
- (void)setFauxScanView:(id)a3;
- (void)setScannerView:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)setUserConsentResponse:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NPHBSCellularFauxCardViewController

- (NPHBSCellularFauxCardViewController)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6.receiver = self;
  v6.super_class = (Class)NPHBSCellularFauxCardViewController;
  v4 = [(NPHBSCellularFauxCardViewController *)&v6 initWithNibName:@"NPHBSCellularFauxCard" bundle:v3];

  v4->_userConsentResponse = 0;
  return v4;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)NPHBSCellularFauxCardViewController;
  [(NPHBSCellularFauxCardViewController *)&v30 viewDidLoad];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bypassFauxCardButton);
  v4 = BPSBridgeTintColor();
  [WeakRetained setTintColor:v4];

  id v5 = objc_loadWeakRetained((id *)&self->_enterFauxCardDataManuallyButton);
  objc_super v6 = BPSBridgeTintColor();
  [v5 setTintColor:v6];

  BOOL v7 = self->_codelessActivationBlock == 0;
  id v8 = objc_loadWeakRetained((id *)&self->_bypassFauxCardButton);
  [v8 setHidden:v7];

  if (!self->_scannerView)
  {
    v9 = [NPHCellularBridgeBarcodeScannerView alloc];
    v10 = -[NPHCellularBridgeBarcodeScannerView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    scannerView = self->_scannerView;
    self->_scannerView = v10;

    [(NPHCellularBridgeBarcodeScannerView *)self->_scannerView setDelegate:self];
    [(NPHCellularBridgeBarcodeScannerView *)self->_scannerView setupCameraSession];
    id v12 = objc_loadWeakRetained((id *)&self->_fauxScanView);
    [v12 addSubview:self->_scannerView];

    v13 = [MEMORY[0x263F15880] layer];
    fillWithHoleLayer = self->_fillWithHoleLayer;
    self->_fillWithHoleLayer = v13;

    [(CAShapeLayer *)self->_fillWithHoleLayer setFillRule:*MEMORY[0x263F15AC0]];
    v15 = [MEMORY[0x263F1C550] blackColor];
    id v16 = [v15 colorWithAlphaComponent:0.5];
    -[CAShapeLayer setFillColor:](self->_fillWithHoleLayer, "setFillColor:", [v16 CGColor]);

    uint64_t v17 = *MEMORY[0x263F15E00];
    [(CAShapeLayer *)self->_fillWithHoleLayer setContentsGravity:*MEMORY[0x263F15E00]];
    id v18 = objc_loadWeakRetained((id *)&self->_cutoutView);
    v19 = [v18 layer];
    [v19 addSublayer:self->_fillWithHoleLayer];

    v20 = [MEMORY[0x263F15880] layer];
    holeOutlineLayer = self->_holeOutlineLayer;
    self->_holeOutlineLayer = v20;

    id v22 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](self->_holeOutlineLayer, "setFillColor:", [v22 CGColor]);

    id v23 = [MEMORY[0x263F1C550] whiteColor];
    -[CAShapeLayer setStrokeColor:](self->_holeOutlineLayer, "setStrokeColor:", [v23 CGColor]);

    [(CAShapeLayer *)self->_holeOutlineLayer setContentsGravity:v17];
    id v24 = objc_loadWeakRetained((id *)&self->_cutoutView);
    v25 = [v24 layer];
    [v25 addSublayer:self->_holeOutlineLayer];

    id v26 = objc_loadWeakRetained((id *)&self->_cutoutView);
    [v26 setAlpha:0.0];
  }
  v27 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction_];
  v28 = [(NPHBSCellularFauxCardViewController *)self navigationItem];
  [v28 setLeftBarButtonItem:v27];

  v29 = [(NPHBSCellularFauxCardViewController *)self navigationController];
  [v29 setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPHBSCellularFauxCardViewController;
  [(NPHBSCellularFauxCardViewController *)&v4 viewWillAppear:a3];
  [(NPHCellularBridgeBarcodeScannerView *)self->_scannerView startRunning];
}

- (void)viewDidLayoutSubviews
{
  scannerView = self->_scannerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fauxScanView);
  [WeakRetained bounds];
  -[NPHCellularBridgeBarcodeScannerView setFrame:](scannerView, "setFrame:");

  id v5 = objc_loadWeakRetained((id *)&self->_cutoutView);
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CAShapeLayer setFrame:](self->_fillWithHoleLayer, "setFrame:", v7, v9, v11, v13);
  if (v11 * 0.7 >= v13 * 0.7) {
    double v14 = v13 * 0.7;
  }
  else {
    double v14 = v11 * 0.7;
  }
  double v15 = (v11 - v14) * 0.5;
  id v16 = (void *)MEMORY[0x263F1C478];
  id v17 = objc_loadWeakRetained((id *)&self->_cutoutView);
  [v17 bounds];
  id v18 = objc_msgSend(v16, "bezierPathWithRect:");

  v19 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v15, (v13 - v14) * 0.5, v14, v14);
  [v18 appendPath:v19];
  [v18 setUsesEvenOddFillRule:1];
  id v21 = v18;
  -[CAShapeLayer setPath:](self->_fillWithHoleLayer, "setPath:", [v21 CGPath]);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v15, (v13 - v14) * 0.5, v14, v14);
  id v20 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_holeOutlineLayer, "setPath:", [v20 CGPath]);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4 == self)
  {
    id v7 = [a3 navigationBar];
    [v7 setBarStyle:1];
    [v7 _setHidesShadow:1];
    double v6 = BPSBridgeTintColor();
    [v7 setTintColor:v6];
  }
  else
  {
    id v5 = [(NPHBSCellularFauxCardViewController *)self navigationController];
    id v7 = [v5 navigationBar];

    [v7 setBarStyle:0];
    [v7 _setHidesShadow:0];
    [v7 setTintColor:0];
  }
}

- (void)bypassFauxCard:(id)a3
{
  objc_super v4 = [(NPHBSCellularFauxCardViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id v5 = [(NPHBSCellularFauxCardViewController *)self codelessActivationBlock];
  v5[2]();
}

- (void)cancelAction:(id)a3
{
  objc_super v4 = [(NPHBSCellularFauxCardViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id v5 = [(NPHBSCellularFauxCardViewController *)self completion];

  if (v5)
  {
    double v6 = [(NPHBSCellularFauxCardViewController *)self completion];
    v6[2](v6, 0);
  }
}

- (void)enterFauxCardDataManually:(id)a3
{
  id v7 = objc_alloc_init(NPHBSCellularFauxCardInfoViewController);
  objc_super v4 = [(NPHBSCellularFauxCardViewController *)self completion];
  [(NPHBSCellularFauxCardInfoViewController *)v7 setCompletion:v4];

  id v5 = [(NPHBSCellularFauxCardViewController *)self subscriptionContext];
  [(NPHBSCellularFauxCardInfoViewController *)v7 setSubscriptionContext:v5];

  double v6 = [(NPHBSCellularFauxCardViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)captureSession:(id)a3 isRunning:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    double v8 = "-[NPHBSCellularFauxCardViewController captureSession:isRunning:]";
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_235444000, v6, OS_LOG_TYPE_DEFAULT, "%s captureSession: %@ isRunning: %d", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[NPHBSCellularFauxCardViewController captureOutput:didOutputMetadataObjects:fromConnection:]";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_235444000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (!self->_nextTimeToAcceptScan
    || ([MEMORY[0x263EFF910] date],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 compare:self->_nextTimeToAcceptScan],
        v10,
        v11 != -1))
  {
    BOOL v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
    nextTimeToAcceptScan = self->_nextTimeToAcceptScan;
    self->_nextTimeToAcceptScan = v12;

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke;
    block[3] = &unk_264C53868;
    id v15 = v8;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v17);

    objc_destroyWeak((id *)buf);
  }
}

void __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [a1[4] firstObject];
  v3 = [v2 stringValue];
  BOOL v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v14 = v3;
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "########### scannedCode %@", buf, 0xCu);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    double v6 = [WeakRetained bypassFauxCardButton];
    [v6 setEnabled:0];

    id v7 = objc_loadWeakRetained(a1 + 6);
    id v8 = [v7 enterFauxCardDataManuallyButton];
    [v8 setEnabled:0];

    [a1[5] _setFauxCardData:v3];
    __int16 v9 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_15;
    v11[3] = &unk_264C53840;
    objc_copyWeak(&v12, a1 + 6);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2;
    v10[3] = &unk_264C53650;
    v10[4] = a1[5];
    [v9 animateWithDuration:v11 animations:v10 completion:0.25];
    objc_destroyWeak(&v12);
  }
}

void __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained cutoutView];
  [v1 setAlpha:1.0];
}

void __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    AudioServicesPlaySystemSound(0xFFFu);
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3;
    block[3] = &unk_264C53628;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
}

void __93__NPHBSCellularFauxCardViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _getFauxCardData];
  [v1 addNewRemotePlanWithCardData:v2 confirmationCode:0];
}

- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v6 = a4;
  id v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[NPHBSCellularFauxCardViewController addNewRemotePlanWithCardData:confirmationCode:]";
    _os_log_impl(&dword_235444000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v8 = [MEMORY[0x263F31978] sharedManager];
  uint64_t v9 = IsCurrentDevicePairing();
  id v10 = +[NPHCellularBridgeUIManager sharedInstance];
  uint64_t v11 = [v10 _currentDeviceCSN];
  subscriptionContext = self->_subscriptionContext;
  int64_t userConsentResponse = self->_userConsentResponse;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__NPHBSCellularFauxCardViewController_addNewRemotePlanWithCardData_confirmationCode___block_invoke;
  v15[3] = &unk_264C53890;
  objc_copyWeak(&v16, (id *)buf);
  v15[4] = self;
  [v8 addNewRemotePlanWithCardData:v14 confirmationCode:v6 isPairing:v9 withCSN:v11 withContext:subscriptionContext userConsent:userConsentResponse completion:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __85__NPHBSCellularFauxCardViewController_addNewRemotePlanWithCardData_confirmationCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[NPHBSCellularFauxCardViewController addNewRemotePlanWithCardData:confirmationCode:]_block_invoke";
    _os_log_impl(&dword_235444000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__NPHBSCellularFauxCardViewController_addNewRemotePlanWithCardData_confirmationCode___block_invoke_20;
  v6[3] = &unk_264C53868;
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v8 = *(void *)(a1 + 32);
  nph_ensure_on_main_queue(v6);
  objc_destroyWeak(&v9);
}

void __85__NPHBSCellularFauxCardViewController_addNewRemotePlanWithCardData_confirmationCode___block_invoke_20(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained subscriptionContext];
  id v7 = [v2 NPHCellularSanitizedError:v3 forSubscriptionContext:v6];

  uint64_t v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    id v21 = "-[NPHBSCellularFauxCardViewController addNewRemotePlanWithCardData:confirmationCode:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_235444000, v8, OS_LOG_TYPE_DEFAULT, "%s sanitizedError:%@", (uint8_t *)&v20, 0x16u);
  }

  if (!v7)
  {
    uint64_t v11 = [*(id *)(a1 + 40) navigationController];
    [v11 dismissViewControllerAnimated:1 completion:0];

    id v12 = objc_loadWeakRetained(v4);
    uint64_t v13 = [v12 completion];

    if (!v13) {
      goto LABEL_12;
    }
    id v14 = objc_loadWeakRetained(v4);
    uint64_t v15 = [v14 completion];
    v15[2](v15, 0);
LABEL_11:

    goto LABEL_12;
  }
  id v9 = [v7 domain];
  if (![v9 isEqualToString:*MEMORY[0x263F31920]])
  {

    goto LABEL_10;
  }
  uint64_t v10 = [v7 code];

  if (v10 != 19)
  {
LABEL_10:
    +[NPHCellularBridgeUIManager presentCellularError:v7 onViewController:*(void *)(a1 + 40)];
    id v16 = objc_loadWeakRetained(v4);
    id v17 = [v16 cutoutView];
    [v17 setAlpha:0.0];

    id v18 = objc_loadWeakRetained(v4);
    uint64_t v19 = [v18 bypassFauxCardButton];
    [v19 setEnabled:1];

    id v14 = objc_loadWeakRetained(v4);
    uint64_t v15 = [v14 enterFauxCardDataManuallyButton];
    [v15 setEnabled:1];
    goto LABEL_11;
  }
  [*(id *)(a1 + 40) presentConfirmationCodeRequest];
LABEL_12:
}

- (void)presentConfirmationCodeRequest
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[NPHBSCellularFauxCardViewController presentConfirmationCodeRequest]";
    _os_log_impl(&dword_235444000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  BOOL v4 = objc_alloc_init(NPHBSCellularConfirmationCodeViewController);
  [(NPHBSCellularConfirmationCodeViewController *)v4 setDelegate:self];
  id v5 = [(NPHBSCellularFauxCardViewController *)self navigationController];
  [v5 pushViewController:v4 animated:0];
}

- (void)cellularConfirmationCodeViewController:(id)a3 confirmedWithCode:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[NPHBSCellularFauxCardViewController cellularConfirmationCodeViewController:confirmedWithCode:]";
    _os_log_impl(&dword_235444000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(NPHBSCellularFauxCardViewController *)self _getFauxCardData];
  [(NPHBSCellularFauxCardViewController *)self addNewRemotePlanWithCardData:v7 confirmationCode:v5];
}

- (id)_getFauxCardData
{
  return self->_fauxCardData;
}

- (void)_setFauxCardData:(id)a3
{
  self->_fauxCardData = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)codelessActivationBlock
{
  return self->_codelessActivationBlock;
}

- (void)setCodelessActivationBlock:(id)a3
{
}

- (int64_t)userConsentResponse
{
  return self->_userConsentResponse;
}

- (void)setUserConsentResponse:(int64_t)a3
{
  self->_int64_t userConsentResponse = a3;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  self->_subscriptionContext = (CTXPCServiceSubscriptionContext *)a3;
}

- (UIView)fauxScanView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fauxScanView);
  return (UIView *)WeakRetained;
}

- (void)setFauxScanView:(id)a3
{
}

- (UIView)cutoutView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cutoutView);
  return (UIView *)WeakRetained;
}

- (void)setCutoutView:(id)a3
{
}

- (UIButton)bypassFauxCardButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bypassFauxCardButton);
  return (UIButton *)WeakRetained;
}

- (void)setBypassFauxCardButton:(id)a3
{
}

- (UIButton)enterFauxCardDataManuallyButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterFauxCardDataManuallyButton);
  return (UIButton *)WeakRetained;
}

- (void)setEnterFauxCardDataManuallyButton:(id)a3
{
}

- (UILabel)fauxDataLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fauxDataLabel);
  return (UILabel *)WeakRetained;
}

- (void)setFauxDataLabel:(id)a3
{
}

- (UILabel)activationCodeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activationCodeLabel);
  return (UILabel *)WeakRetained;
}

- (void)setActivationCodeLabel:(id)a3
{
}

- (NPHCellularBridgeBarcodeScannerView)scannerView
{
  return self->_scannerView;
}

- (void)setScannerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_destroyWeak((id *)&self->_activationCodeLabel);
  objc_destroyWeak((id *)&self->_fauxDataLabel);
  objc_destroyWeak((id *)&self->_enterFauxCardDataManuallyButton);
  objc_destroyWeak((id *)&self->_bypassFauxCardButton);
  objc_destroyWeak((id *)&self->_cutoutView);
  objc_destroyWeak((id *)&self->_fauxScanView);
  objc_storeStrong(&self->_codelessActivationBlock, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_holeOutlineLayer, 0);
  objc_storeStrong((id *)&self->_fillWithHoleLayer, 0);
  objc_storeStrong((id *)&self->_nextTimeToAcceptScan, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end