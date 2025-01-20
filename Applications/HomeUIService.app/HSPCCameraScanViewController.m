@interface HSPCCameraScanViewController
- (BOOL)_isValidSetupPayloadURLString:(id)a3;
- (BOOL)cameraReader:(id)a3 shouldReturnQRCode:(id)a4;
- (BOOL)cameraReaderIsRunning;
- (BOOL)nfcManager:(id)a3 shouldReturnPayloadString:(id)a4;
- (CRCameraReader)cameraReader;
- (HSCameraInstructionsView)cameraInstructionsView;
- (HSNFCManager)nfcManager;
- (HSPCCameraScanViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NACancelable)delayedSetupCodeHandler;
- (NAFuture)nfcAvailableFuture;
- (UILabel)interruptionLabel;
- (UIView)cameraContainerView;
- (id)commitConfiguration;
- (unint64_t)mode;
- (void)_addInterruptionLabel;
- (void)_cameraWasInterrupted:(id)a3;
- (void)_handleOverrideSetupCodeIfNeeded;
- (void)_handleSetupCode:(id)a3;
- (void)_handleSetupURLString:(id)a3 afterDelay:(double)a4;
- (void)_loadCameraReader;
- (void)_moveToNextViewController;
- (void)_startReaders;
- (void)_stopReaders;
- (void)_unloadCameraReader;
- (void)_updatePairingErrorWithPayload:(id)a3;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidCancel:(id)a3;
- (void)cameraReaderDidEnd:(id)a3;
- (void)configureNextViewController:(id)a3;
- (void)nfcManager:(id)a3 didRecognizePayloadString:(id)a4;
- (void)setCameraContainerView:(id)a3;
- (void)setCameraInstructionsView:(id)a3;
- (void)setCameraReader:(id)a3;
- (void)setCameraReaderIsRunning:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelayedSetupCodeHandler:(id)a3;
- (void)setInterruptionLabel:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNfcAvailableFuture:(id)a3;
- (void)setNfcManager:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCCameraScanViewController

- (HSPCCameraScanViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HSPCCameraScanViewController;
  v9 = [(HSPCCameraScanViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a3);
    objc_storeStrong((id *)&v10->_config, a4);
  }

  return v10;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  if (a3 == 1)
  {
    v4 = HULocalizedString();
    [(HSPCCameraScanViewController *)self setTitle:v4];

    v5 = HULocalizedString();
    [(HSPCCameraScanViewController *)self setSubtitle:v5];

    v6 = [[HSNFCManager alloc] initWithDelegate:self];
    [(HSPCCameraScanViewController *)self setNfcManager:v6];

    id v7 = objc_alloc_init((Class)NAFuture);
    [(HSPCCameraScanViewController *)self setNfcAvailableFuture:v7];

    id v8 = [(HSPCCameraScanViewController *)self coordinator];
    unsigned int v9 = [v8 setupSpecificAccessory];

    if (v9)
    {
      v10 = [(HSPCCameraScanViewController *)self nfcAvailableFuture];
      v11 = +[NSError na_genericError];
      [v10 finishWithError:v11];
    }
    objc_super v12 = [(HSPCCameraScanViewController *)self nfcManager];
    id v19 = 0;
    unsigned int v13 = [v12 readerSupportedWithError:&v19];
    id v14 = v19;

    v15 = [(HSPCCameraScanViewController *)self nfcAvailableFuture];
    v16 = v15;
    if (v13) {
      [v15 finishWithNoResult];
    }
    else {
      [v15 finishWithError:v14];
    }

    [(HSPCCameraScanViewController *)self addMoreOptionsButtonWithTarget:self action:"_onMoreOptionsButton" userInfo:&__NSDictionary0__struct];
  }
  else
  {
    v17 = HULocalizedString();
    [(HSPCCameraScanViewController *)self setTitle:v17];

    HULocalizedString();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    [(HSPCCameraScanViewController *)self setSubtitle:v18];
  }
}

- (void)configureNextViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v6;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setPage:1];
}

- (void)_moveToNextViewController
{
  id v3 = [(HSPCCameraScanViewController *)self commitConfiguration];
  [(HSPCCameraScanViewController *)self handleButtonDirectiveFuture:v3];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0BB0];
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)HSPCCameraScanViewController;
  [(HSPCCameraScanViewController *)&v40 viewDidLoad];
  id v3 = [(HSPCCameraScanViewController *)self contentView];
  v4 = [v3 mainContentGuide];

  id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HSPCCameraScanViewController *)self setCameraContainerView:v5];
  id v6 = [v5 layer];
  [v6 setCornerRadius:14.0];

  id v7 = [(HSPCCameraScanViewController *)self contentView];
  [v7 addSubview:v5];

  v36 = [v5 topAnchor];
  v34 = [v4 topAnchor];
  v32 = [v36 constraintEqualToAnchor:v34];
  v43[0] = v32;
  id v8 = [v5 leadingAnchor];
  unsigned int v9 = [v4 leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v43[1] = v10;
  v11 = [v5 trailingAnchor];
  v39 = v4;
  objc_super v12 = [v4 trailingAnchor];
  unsigned int v13 = [v11 constraintEqualToAnchor:v12];
  v43[2] = v13;
  v38 = v5;
  id v14 = [v5 heightAnchor];
  v15 = [v14 constraintEqualToConstant:180.0];
  v43[3] = v15;
  v16 = +[NSArray arrayWithObjects:v43 count:4];
  +[NSLayoutConstraint activateConstraints:v16];

  if ((id)[(HSPCCameraScanViewController *)self mode] == (id)1)
  {
    v17 = [HSCameraInstructionsView alloc];
    id v18 = [(HSPCCameraScanViewController *)self nfcAvailableFuture];
    id v19 = [(HSCameraInstructionsView *)v17 initWithNFCStartFuture:v18];

    [(HSCameraInstructionsView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HSPCCameraScanViewController *)self setCameraInstructionsView:v19];
    v20 = [(HSPCCameraScanViewController *)self contentView];
    [v20 addSubview:v19];

    v33 = [(HSCameraInstructionsView *)v19 topAnchor];
    v21 = [v38 bottomAnchor];
    v22 = [v33 constraintEqualToAnchor:v21];
    v42[0] = v22;
    v37 = [(HSCameraInstructionsView *)v19 leadingAnchor];
    v35 = [v39 leadingAnchor];
    v31 = [v37 constraintEqualToAnchor:v35];
    v42[1] = v31;
    v23 = [(HSCameraInstructionsView *)v19 trailingAnchor];
    v24 = [v39 trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v42[2] = v25;
    v26 = [(HSCameraInstructionsView *)v19 bottomAnchor];
    v27 = [v39 bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v42[3] = v28;
    v29 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v29];

    v30 = v33;
  }
  else
  {
    id v19 = [v38 bottomAnchor];
    v30 = [v39 bottomAnchor];
    v21 = [(HSCameraInstructionsView *)v19 constraintEqualToAnchor:v30];
    v41 = v21;
    v22 = +[NSArray arrayWithObjects:&v41 count:1];
    +[NSLayoutConstraint activateConstraints:v22];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewController;
  [(HSPCCameraScanViewController *)&v4 viewWillAppear:a3];
  [(HSPCCameraScanViewController *)self _startReaders];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewController;
  [(HSPCCameraScanViewController *)&v4 viewDidAppear:a3];
  [(HSPCCameraScanViewController *)self _handleOverrideSetupCodeIfNeeded];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCCameraScanViewController;
  [(HSPCCameraScanViewController *)&v5 viewDidDisappear:a3];
  [(HSPCCameraScanViewController *)self _stopReaders];
  objc_super v4 = [(HSPCCameraScanViewController *)self delayedSetupCodeHandler];
  [v4 cancel];
}

- (void)_loadCameraReader
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading the CRCameraReader", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)CRCameraReader);
  [(HSPCCameraScanViewController *)self setCameraReader:v4];

  v50[0] = CROutputTypeHomeKitCode;
  v50[1] = CROutputTypeQRCode;
  objc_super v5 = +[NSArray arrayWithObjects:v50 count:2];
  id v6 = [(HSPCCameraScanViewController *)self cameraReader];
  [v6 setOutputObjectTypes:v5];

  id v7 = [(HSPCCameraScanViewController *)self cameraReader];
  [v7 setDelegate:self];

  id v8 = [(HSPCCameraScanViewController *)self cameraReader];
  [v8 willMoveToParentViewController:self];

  unsigned int v9 = [(HSPCCameraScanViewController *)self cameraReader];
  [(HSPCCameraScanViewController *)self addChildViewController:v9];

  v10 = [(HSPCCameraScanViewController *)self cameraContainerView];
  v11 = [(HSPCCameraScanViewController *)self cameraReader];
  objc_super v12 = [v11 view];
  [v10 addSubview:v12];

  unsigned int v13 = [(HSPCCameraScanViewController *)self cameraReader];
  [v13 didMoveToParentViewController:self];

  id v14 = +[UIDevice currentDevice];
  unint64_t v15 = (unint64_t)[v14 userInterfaceIdiom];

  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v16 = [(HSPCCameraScanViewController *)self cameraReader];
    [v16 toggleCamera];
  }
  v17 = [(HSPCCameraScanViewController *)self cameraReader];
  id v18 = [v17 view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v47 = [(HSPCCameraScanViewController *)self cameraReader];
  v46 = [v47 view];
  v44 = [v46 topAnchor];
  v45 = [(HSPCCameraScanViewController *)self cameraContainerView];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[0] = v42;
  v41 = [(HSPCCameraScanViewController *)self cameraReader];
  objc_super v40 = [v41 view];
  v38 = [v40 bottomAnchor];
  v39 = [(HSPCCameraScanViewController *)self cameraContainerView];
  v37 = [v39 bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v49[1] = v36;
  v35 = [(HSPCCameraScanViewController *)self cameraReader];
  v34 = [v35 view];
  v32 = [v34 leadingAnchor];
  v33 = [(HSPCCameraScanViewController *)self cameraContainerView];
  id v19 = [v33 leadingAnchor];
  v20 = [v32 constraintEqualToAnchor:v19];
  v49[2] = v20;
  v21 = [(HSPCCameraScanViewController *)self cameraReader];
  v22 = [v21 view];
  v23 = [v22 trailingAnchor];
  v24 = [(HSPCCameraScanViewController *)self cameraContainerView];
  v25 = [v24 trailingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v49[3] = v26;
  v27 = +[NSArray arrayWithObjects:v49 count:4];
  +[NSLayoutConstraint activateConstraints:v27];

  double v28 = PRXProminentButtonCornerRadius;
  v29 = [(HSPCCameraScanViewController *)self cameraReader];
  v30 = [v29 view];
  v31 = [v30 layer];
  [v31 setCornerRadius:v28];
}

- (void)_unloadCameraReader
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unloading the CRCameraReader", v13, 2u);
  }

  id v4 = [(HSPCCameraScanViewController *)self cameraReader];
  objc_super v5 = [v4 view];
  id v6 = [v5 constraints];
  +[NSLayoutConstraint deactivateConstraints:v6];

  id v7 = [(HSPCCameraScanViewController *)self cameraReader];
  [v7 setDelegate:0];

  id v8 = [(HSPCCameraScanViewController *)self cameraReader];
  [v8 willMoveToParentViewController:0];

  unsigned int v9 = [(HSPCCameraScanViewController *)self cameraReader];
  [v9 removeFromParentViewController];

  v10 = [(HSPCCameraScanViewController *)self cameraReader];
  v11 = [v10 view];
  [v11 removeFromSuperview];

  objc_super v12 = [(HSPCCameraScanViewController *)self cameraReader];
  [v12 didMoveToParentViewController:0];

  [(HSPCCameraScanViewController *)self setCameraReader:0];
  [(HSPCCameraScanViewController *)self setCameraReaderIsRunning:0];
}

- (void)_startReaders
{
  id v3 = [(HSPCCameraScanViewController *)self nfcManager];
  id v4 = [v3 start];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_cameraWasInterrupted:" name:AVCaptureSessionWasInterruptedNotification object:0];

  id v6 = [(HSPCCameraScanViewController *)self cameraReader];

  if (!v6) {
    [(HSPCCameraScanViewController *)self _loadCameraReader];
  }
  id v7 = [(HSPCCameraScanViewController *)self cameraReader];
  [v7 start];

  [(HSPCCameraScanViewController *)self setCameraReaderIsRunning:1];
}

- (void)_stopReaders
{
  id v3 = [(HSPCCameraScanViewController *)self nfcManager];
  [v3 stop];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AVCaptureSessionWasInterruptedNotification object:0];

  unsigned int v5 = [(HSPCCameraScanViewController *)self cameraReaderIsRunning];
  id v6 = HFLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The camera view disappeared, but the camera is still running. Cancelling the cameraReader", buf, 2u);
    }

    id v8 = [(HSPCCameraScanViewController *)self cameraReader];
    [v8 cancel];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)unsigned int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "The camera view disappeared and the camera is not running. Removing it from the view hierarchy so it can be recreated if it's needed again", v9, 2u);
    }

    [(HSPCCameraScanViewController *)self _unloadCameraReader];
  }
}

- (void)_cameraWasInterrupted:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  if (v5)
  {
    id v6 = [v4 userInfo];
    BOOL v7 = [v6 objectForKeyedSubscript:AVCaptureSessionInterruptionReasonKey];
  }
  else
  {
    BOOL v7 = 0;
  }

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Notified that the camera was interrupted with reason: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v7 && [v7 intValue] == 4) {
    [(HSPCCameraScanViewController *)self _addInterruptionLabel];
  }
}

- (void)_addInterruptionLabel
{
  id v3 = [(HSPCCameraScanViewController *)self interruptionLabel];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)UILabel);
    [(HSPCCameraScanViewController *)self setInterruptionLabel:v4];

    unsigned int v5 = sub_100007B38();
    id v6 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v6 setFont:v5];

    BOOL v7 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v7 setNumberOfLines:0];

    id v8 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v8 setLineBreakMode:0];

    int v9 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v9 setTextAlignment:1];

    v10 = +[UIColor systemWhiteColor];
    v11 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v11 setTextColor:v10];

    objc_super v12 = sub_100060C64(@"HSSetupCodeInterruptionLabel");
    unsigned int v13 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v13 setText:v12];

    id v14 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v14 sizeToFit];

    unint64_t v15 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(HSPCCameraScanViewController *)self view];
    v17 = [(HSPCCameraScanViewController *)self interruptionLabel];
    [v16 addSubview:v17];

    id v18 = [(HSPCCameraScanViewController *)self cameraContainerView];
    id v19 = [v18 readableContentGuide];

    v34 = [(HSPCCameraScanViewController *)self interruptionLabel];
    v33 = [v34 leadingAnchor];
    v31 = v19;
    v32 = [v19 leadingAnchor];
    v30 = [v33 constraintEqualToAnchor:v32];
    v35[0] = v30;
    v20 = [(HSPCCameraScanViewController *)self interruptionLabel];
    v21 = [v20 trailingAnchor];
    v22 = [v19 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v35[1] = v23;
    v24 = [(HSPCCameraScanViewController *)self interruptionLabel];
    v25 = [v24 centerYAnchor];
    v26 = [(HSPCCameraScanViewController *)self cameraContainerView];
    v27 = [v26 centerYAnchor];
    double v28 = [v25 constraintEqualToAnchor:v27];
    v35[2] = v28;
    v29 = +[NSArray arrayWithObjects:v35 count:3];
    +[NSLayoutConstraint activateConstraints:v29];
  }
}

- (void)_handleSetupCode:(id)a3
{
  id v4 = a3;
  unsigned int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received setup code %@", buf, 0xCu);
  }

  id v6 = [(HSPCCameraScanViewController *)self delayedSetupCodeHandler];
  [v6 cancel];

  objc_initWeak((id *)buf, self);
  BOOL v7 = +[NAScheduler mainThreadScheduler];
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  objc_super v12 = sub_100063630;
  unsigned int v13 = &unk_1000AB0C8;
  objc_copyWeak(&v15, (id *)buf);
  id v8 = v4;
  id v14 = v8;
  int v9 = [v7 afterDelay:&v10 performBlock:0.5];
  -[HSPCCameraScanViewController setDelayedSetupCodeHandler:](self, "setDelayedSetupCodeHandler:", v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_updatePairingErrorWithPayload:(id)a3
{
  id v4 = a3;
  unsigned int v5 = HULocalizedString();
  id v6 = HULocalizedString();
  BOOL v7 = +[NSError hf_errorWithCode:62 title:v5 description:v6];

  if (v4)
  {
    id v8 = [v4 setupCode];
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 setupPayloadURL];
      int v28 = 138412546;
      v29 = v8;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "handleSetupAccessoryPayload:, code %@ url %@", (uint8_t *)&v28, 0x16u);
    }
    uint64_t v11 = [v4 setupPayloadURL];

    if (v11)
    {
      objc_super v12 = [(HSPCCameraScanViewController *)self coordinator];
      unsigned int v13 = [v12 discoveredAccessory];

      id v14 = [(HSPCCameraScanViewController *)self coordinator];
      id v15 = v14;
      if (v13) {
        id v16 = [v14 didReceiveSetupCode:v8 fromViewController:self];
      }
      else {
        [v14 updateSetupAccessoryDescriptionWithPayload:v4];
      }
LABEL_22:

      goto LABEL_23;
    }
    id v15 = [objc_alloc((Class)HFSetupAccessoryResult) initWithPayload:v4];
    uint64_t v18 = [v15 error];
    if (v18)
    {
      id v19 = (void *)v18;
      v20 = [v15 error];
      v21 = [v20 domain];
      if ([v21 isEqualToString:HFErrorDomain])
      {
        v22 = [v15 error];
        id v23 = [v22 code];

        if (v23 == (id)22)
        {
          v24 = [v15 error];
          int v25 = 1;
LABEL_17:
          v26 = [(HSPCCameraScanViewController *)self config];
          [v26 setPairingError:v24];

          if (v25) {
          v27 = HFLogForCategory();
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100069298(v15, v27);
          }

          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    int v25 = 0;
    v24 = v7;
    goto LABEL_17;
  }
  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handleSetupAccessoryPayload: got nil payload.", (uint8_t *)&v28, 2u);
  }

  id v8 = [(HSPCCameraScanViewController *)self config];
  [v8 setPairingError:v7];
LABEL_23:
}

- (void)_handleSetupURLString:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  BOOL v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received setup URL string: %@", buf, 0xCu);
  }

  id v8 = [(HSPCCameraScanViewController *)self delayedSetupCodeHandler];
  [v8 cancel];

  int v9 = [(HSPCCameraScanViewController *)self coordinator];
  v10 = [v9 discoveredAccessory];
  [v10 setRawSetupPayloadString:v6];

  objc_initWeak((id *)buf, self);
  uint64_t v11 = +[NAScheduler mainThreadScheduler];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100063D30;
  id v17 = &unk_1000AB7A0;
  id v12 = v6;
  id v18 = v12;
  objc_copyWeak(&v19, (id *)buf);
  unsigned int v13 = [v11 afterDelay:&v14 performBlock:a4];
  -[HSPCCameraScanViewController setDelayedSetupCodeHandler:](self, "setDelayedSetupCodeHandler:", v13, v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)_handleOverrideSetupCodeIfNeeded
{
  id v3 = HFForceCameraQRCodeURLString();

  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = HFForceCameraQRCodeURLString();
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HFForceCameraQRCodeURLString is set to: %@", (uint8_t *)&v18, 0xCu);
    }
    id v6 = [(HSPCCameraScanViewController *)self cameraReader];
    BOOL v7 = HFForceCameraQRCodeURLString();
    unsigned int v8 = [(HSPCCameraScanViewController *)self cameraReader:v6 shouldReturnQRCode:v7];

    int v9 = HFLogForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (v10)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "The HFForceCameraQRCodeURLString was determined to not be a valid HomeKit QR code, so doing nothing", (uint8_t *)&v18, 2u);
      }
      goto LABEL_19;
    }
    if (v10)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "The HFForceCameraQRCodeURLString was validated, so proceeding as if we had just scanned this a QR code with this payload.", (uint8_t *)&v18, 2u);
    }

    int v9 = HFForceCameraQRCodeURLString();
    double v11 = 0.5;
  }
  else
  {
    id v12 = HFForceCameraLegacyCodeURLString();

    if (v12)
    {
      unsigned int v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = HFForceCameraQRCodeURLString();
        int v18 = 138412290;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "HFForceCameraLegacyCodeURLString is set to: %@, so proceeding as if we had just scanned this legacy code.", (uint8_t *)&v18, 0xCu);
      }
      int v9 = HFForceCameraLegacyCodeURLString();
      [(HSPCCameraScanViewController *)self _handleSetupCode:v9];
      goto LABEL_19;
    }
    uint64_t v15 = HFForceNFCURLString();

    if (!v15) {
      return;
    }
    id v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HFForceCameraQRCodeURLString();
      int v18 = 138412290;
      id v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "HFForceNFCURLString is set to: %@, so proceeding as if we had just scanned an NFC tag with this payload.", (uint8_t *)&v18, 0xCu);
    }
    int v9 = HFForceNFCURLString();
    double v11 = 0.0;
  }
  [(HSPCCameraScanViewController *)self _handleSetupURLString:v9 afterDelay:v11];
LABEL_19:
}

- (BOOL)_isValidSetupPayloadURLString:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      BOOL v10 = "Read nil string";
      double v11 = v9;
      uint32_t v12 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (+[HMAccessorySetupCoordinator isSetupPayloadURLString:v4])
  {
    unsigned int v5 = [(HSPCCameraScanViewController *)self config];
    unsigned int v6 = [v5 isSetupInitiatedByOtherMatterEcosystem];

    if (v6)
    {
      BOOL v7 = +[HMAccessorySetupCoordinator communicationProtocolForSetupPayloadURLString:v4];
      id v8 = [v7 integerValue];

      if (v8 == (id)2)
      {
        int v9 = HFLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v4;
          id v14 = "Read CHIP/Matter setup URL string in PEA setup: %@";
          goto LABEL_19;
        }
LABEL_20:
        BOOL v13 = 1;
        goto LABEL_21;
      }
      if (v8 == (id)1)
      {
        int v9 = HFLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v4;
          BOOL v10 = "Read HAP setup URL string in PEA setup, ignoring %@";
LABEL_12:
          double v11 = v9;
          uint32_t v12 = 12;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    int v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v4;
      id v14 = "Read setup URL string: %@";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    BOOL v10 = "Read string that is not setup URL: %@";
    goto LABEL_12;
  }
LABEL_14:
  BOOL v13 = 0;
LABEL_21:

  return v13;
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cameraReader:%@ didFailWithError:%@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064720;
  block[3] = &unk_1000A90B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cameraReaderDidCancel:(id)a3
{
  id v4 = a3;
  unsigned int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cameraReaderDidCancel:%@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064918;
  block[3] = &unk_1000A90B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cameraReaderDidEnd:(id)a3
{
  id v4 = a3;
  unsigned int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cameraReaderDidEnd:%@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064A6C;
  block[3] = &unk_1000A90B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cameraReader:%@ didRecognizeObjects:%@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100064BC0;
  v10[3] = &unk_1000A8F20;
  id v11 = v7;
  __int16 v12 = self;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

- (BOOL)cameraReader:(id)a3 shouldReturnQRCode:(id)a4
{
  return [(HSPCCameraScanViewController *)self _isValidSetupPayloadURLString:a4];
}

- (BOOL)nfcManager:(id)a3 shouldReturnPayloadString:(id)a4
{
  return [(HSPCCameraScanViewController *)self _isValidSetupPayloadURLString:a4];
}

- (void)nfcManager:(id)a3 didRecognizePayloadString:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064E3C;
  block[3] = &unk_1000A9560;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfig:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIView)cameraContainerView
{
  return self->_cameraContainerView;
}

- (void)setCameraContainerView:(id)a3
{
}

- (HSNFCManager)nfcManager
{
  return self->_nfcManager;
}

- (void)setNfcManager:(id)a3
{
}

- (NAFuture)nfcAvailableFuture
{
  return self->_nfcAvailableFuture;
}

- (void)setNfcAvailableFuture:(id)a3
{
}

- (UILabel)interruptionLabel
{
  return self->_interruptionLabel;
}

- (void)setInterruptionLabel:(id)a3
{
}

- (NACancelable)delayedSetupCodeHandler
{
  return self->_delayedSetupCodeHandler;
}

- (void)setDelayedSetupCodeHandler:(id)a3
{
}

- (HSCameraInstructionsView)cameraInstructionsView
{
  return self->_cameraInstructionsView;
}

- (void)setCameraInstructionsView:(id)a3
{
}

- (CRCameraReader)cameraReader
{
  return self->_cameraReader;
}

- (void)setCameraReader:(id)a3
{
}

- (BOOL)cameraReaderIsRunning
{
  return self->_cameraReaderIsRunning;
}

- (void)setCameraReaderIsRunning:(BOOL)a3
{
  self->_cameraReaderIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraReader, 0);
  objc_storeStrong((id *)&self->_cameraInstructionsView, 0);
  objc_storeStrong((id *)&self->_delayedSetupCodeHandler, 0);
  objc_storeStrong((id *)&self->_interruptionLabel, 0);
  objc_storeStrong((id *)&self->_nfcAvailableFuture, 0);
  objc_storeStrong((id *)&self->_nfcManager, 0);
  objc_storeStrong((id *)&self->_cameraContainerView, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end