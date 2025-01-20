@interface AXRConnectedDeviceViewController
- (AXEventProcessor)eventProcessor;
- (AXRActionsCollectionView)actionsCollectionView;
- (AXRConnectedDeviceViewController)initWithRemoteDevice:(id)a3;
- (AXRemoteDevice)activeDevice;
- (BOOL)_canShowWhileLocked;
- (NSArray)remoteActionsToShow;
- (UICollectionViewFlowLayout)collectionViewFlowLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_dismissCurrentPresentedViewController;
- (void)_moreButtonPressed;
- (void)_performDeviceRemoteAction:(id)a3;
- (void)actionsViewController:(id)a3 selectedAction:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)remoteDeviceDidUnexpectedlyDisconnect:(id)a3;
- (void)setActionsCollectionView:(id)a3;
- (void)setActiveDevice:(id)a3;
- (void)setCollectionViewFlowLayout:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)voiceOverTouchPadView:(id)a3 didReceiveCommand:(id)a4;
@end

@implementation AXRConnectedDeviceViewController

- (AXRConnectedDeviceViewController)initWithRemoteDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXRConnectedDeviceViewController;
  v5 = [(AXRConnectedDeviceViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AXRConnectedDeviceViewController *)v5 setActiveDevice:v4];
    v7 = [(AXRConnectedDeviceViewController *)v6 activeDevice];
    [v7 setConnectionDelegate:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(AXRConnectedDeviceViewController *)self activeDevice];
  [v3 disconnect];

  [(AXRConnectedDeviceViewController *)self setActiveDevice:0];
  id v4 = [(AXRConnectedDeviceViewController *)self eventProcessor];
  [v4 endHandlingHIDEventsForReason:@"AXRemoteDeviceConnection"];

  v5 = [(AXRConnectedDeviceViewController *)self eventProcessor];
  [v5 cleanup];

  v6.receiver = self;
  v6.super_class = (Class)AXRConnectedDeviceViewController;
  [(AXRConnectedDeviceViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v97[3] = *MEMORY[0x263EF8340];
  v94.receiver = self;
  v94.super_class = (Class)AXRConnectedDeviceViewController;
  [(AXRConnectedDeviceViewController *)&v94 viewDidLoad];
  v3 = [(AXRConnectedDeviceViewController *)self activeDevice];
  id v4 = [v3 displayName];
  [(AXRConnectedDeviceViewController *)self setTitle:v4];

  v5 = [MEMORY[0x263F1C550] systemBackgroundColor];
  objc_super v6 = [(AXRConnectedDeviceViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F1C508]);
  [(AXRConnectedDeviceViewController *)self setCollectionViewFlowLayout:v7];

  v8 = [AXRActionsCollectionView alloc];
  objc_super v9 = [(AXRConnectedDeviceViewController *)self view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(AXRConnectedDeviceViewController *)self collectionViewFlowLayout];
  v19 = -[AXRActionsCollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v18, v11, v13, v15, v17);
  [(AXRConnectedDeviceViewController *)self setActionsCollectionView:v19];

  v20 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v20 setDelegate:self];

  v21 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v21 setDataSource:self];

  v22 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v22 setBounces:0];

  v23 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v23 setScrollEnabled:0];

  v24 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v25 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CellReuseIdentifier"];

  v26 = [(AXRConnectedDeviceViewController *)self view];
  v27 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  [v26 addSubview:v27];

  v73 = (void *)MEMORY[0x263F08938];
  v89 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  v85 = [v89 leadingAnchor];
  v87 = [(AXRConnectedDeviceViewController *)self view];
  v83 = [v87 leadingAnchor];
  v81 = [v85 constraintEqualToAnchor:v83];
  v97[0] = v81;
  v79 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  v75 = [v79 trailingAnchor];
  v77 = [(AXRConnectedDeviceViewController *)self view];
  v28 = [v77 trailingAnchor];
  v29 = [v75 constraintEqualToAnchor:v28];
  v97[1] = v29;
  v30 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  v31 = [v30 bottomAnchor];
  v32 = [(AXRConnectedDeviceViewController *)self view];
  v33 = [v32 safeAreaLayoutGuide];
  v34 = [v33 bottomAnchor];
  v35 = [v31 constraintEqualToAnchor:v34];
  v97[2] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:3];
  [v73 activateConstraints:v36];

  v37 = [(AXRConnectedDeviceViewController *)self activeDevice];
  if ([v37 contextType] == 1)
  {
    BOOL v38 = _AXSVoiceOverTouchEnabled() == 0;

    if (!v38)
    {
      v39 = [AXRVoiceOverTouchPadView alloc];
      v40 = [(AXRConnectedDeviceViewController *)self view];
      [v40 frame];
      v41 = -[AXRVoiceOverTouchPadView initWithFrame:](v39, "initWithFrame:");

      [(AXRVoiceOverTouchPadView *)v41 setDelegate:self];
      v42 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
      [(AXRVoiceOverTouchPadView *)v41 setBackgroundColor:v42];

      [(AXRVoiceOverTouchPadView *)v41 _setContinuousCornerRadius:42.0];
      [(AXRVoiceOverTouchPadView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(AXRVoiceOverTouchPadView *)v41 setAutoresizingMask:18];
      v43 = [(AXRConnectedDeviceViewController *)self view];
      v44 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
      [v43 insertSubview:v41 belowSubview:v44];

      v69 = (void *)MEMORY[0x263F08938];
      v86 = [(AXRVoiceOverTouchPadView *)v41 leadingAnchor];
      v90 = [(AXRConnectedDeviceViewController *)self view];
      v88 = [v90 safeAreaLayoutGuide];
      v45 = [v88 leadingAnchor];
      v46 = [v86 constraintEqualToAnchor:v45 constant:8.0];
      v96[0] = v46;
      v47 = [(AXRVoiceOverTouchPadView *)v41 trailingAnchor];
      v84 = [(AXRConnectedDeviceViewController *)self view];
      v82 = [v84 safeAreaLayoutGuide];
      v80 = [v82 trailingAnchor];
      v78 = [v47 constraintEqualToAnchor:v80 constant:-8.0];
      v96[1] = v78;
      v72 = [(AXRVoiceOverTouchPadView *)v41 topAnchor];
      v76 = [(AXRConnectedDeviceViewController *)self view];
      v74 = [v76 safeAreaLayoutGuide];
      v71 = [v74 topAnchor];
      v70 = [v72 constraintEqualToAnchor:v71 constant:12.0];
      v96[2] = v70;
      v48 = [(AXRVoiceOverTouchPadView *)v41 bottomAnchor];
      v49 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
      v50 = [v49 topAnchor];
      v51 = [v48 constraintEqualToAnchor:v50 constant:-12.0];
      v96[3] = v51;
      v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
      [v69 activateConstraints:v52];

      uint64_t v53 = 0;
      unint64_t v54 = 3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v55 = [(AXRConnectedDeviceViewController *)self activeDevice];
  uint64_t v53 = [v55 contextType];

  v56 = (void *)MEMORY[0x263F08938];
  v41 = [(AXRConnectedDeviceViewController *)self actionsCollectionView];
  v86 = [(AXRVoiceOverTouchPadView *)v41 topAnchor];
  v90 = [(AXRConnectedDeviceViewController *)self view];
  v88 = [v90 safeAreaLayoutGuide];
  v45 = [v88 topAnchor];
  v46 = [v86 constraintEqualToAnchor:v45 constant:16.0];
  v95 = v46;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v95 count:1];
  [v56 activateConstraints:v47];
  unint64_t v54 = 8;
LABEL_6:

  v57 = [(AXRConnectedDeviceViewController *)self activeDevice];
  v58 = [v57 remoteActionsForPreferredContextType:v53];

  if (v54 > [v58 count]) {
    unint64_t v54 = [v58 count];
  }
  objc_msgSend(v58, "subarrayWithRange:", 0, v54);
  v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
  remoteActionsToShow = self->_remoteActionsToShow;
  self->_remoteActionsToShow = v59;

  v61 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v62 = dispatch_queue_attr_make_with_qos_class(v61, QOS_CLASS_USER_INTERACTIVE, 0);

  v63 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AXRemoteUIServices.EventSenderQueue", v62);
  eventSenderQueue = self->_eventSenderQueue;
  self->_eventSenderQueue = v63;

  v65 = (void *)[objc_alloc(MEMORY[0x263F22898]) initWithHIDTapIdentifier:@"com.apple.AXRemoteUIServices.EventProcessor" HIDEventTapPriority:70 systemEventTapIdentifier:0 systemEventTapPriority:30];
  [(AXRConnectedDeviceViewController *)self setEventProcessor:v65];

  v66 = [(AXRConnectedDeviceViewController *)self eventProcessor];
  [v66 setHIDEventFilterMask:40];

  objc_initWeak(&location, self);
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke;
  v91[3] = &unk_264DA8CA8;
  objc_copyWeak(&v92, &location);
  v67 = [(AXRConnectedDeviceViewController *)self eventProcessor];
  [v67 setHIDEventHandler:v91];

  v68 = [(AXRConnectedDeviceViewController *)self eventProcessor];
  [v68 beginHandlingHIDEventsForReason:@"AXRemoteDeviceConnection"];

  objc_destroyWeak(&v92);
  objc_destroyWeak(&location);
}

uint64_t __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 senderID] != 0x8000000817319372)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_super v6 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_5;
    }
    id v7 = [WeakRetained presentedViewController];

    if (v7) {
      goto LABEL_5;
    }
    if ([v3 type] == 5000
      && ([v3 accessibilityData],
          objc_super v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 page],
          v9,
          v10 == 2))
    {
      double v11 = [v3 accessibilityData];
      uint64_t v12 = [v11 usage];

      if (v12 == 2)
      {
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3221225472;
        v27 = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_2;
        v28 = &unk_264DA8C30;
        v29 = v6;
        AXPerformBlockAsynchronouslyOnMainThread();
LABEL_14:
        uint64_t v4 = 1;
        goto LABEL_6;
      }
      double v14 = [v6 activeDevice];
      double v15 = [v14 customizedRemoteActionForHandGestureEventUsage:v12];

      if (v15 && ![v15 isEqualToString:*MEMORY[0x263F21FA0]])
      {
        double v16 = v6[122];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_3;
        v20[3] = &unk_264DA8C58;
        id v21 = v15;
        v22 = v6;
        uint64_t v24 = v12;
        id v23 = v3;
        id v17 = v15;
        dispatch_async(v16, v20);

        goto LABEL_14;
      }
    }
    else if ([v3 type] == 1100)
    {
      double v13 = v6[122];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_4;
      block[3] = &unk_264DA8C80;
      block[4] = v6;
      id v19 = v3;
      dispatch_async(v13, block);

      goto LABEL_14;
    }
LABEL_5:
    uint64_t v4 = 0;
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

uint64_t __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  v29[3] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) activeDevice];
  [v2 deviceType];
  uint64_t v3 = AXRLocalizedStringForRemoteActionWithDeviceType();

  uint64_t v4 = AXLocalizedStringForHandGestureEventUsage();
  v5 = [MEMORY[0x263F22848] sharedInstance];
  id v21 = (void *)v3;
  [v5 presentBannerWithTitle:v3 message:v4 duration:1.0];

  id v19 = [*(id *)(a1 + 40) activeDevice];
  v28[0] = *MEMORY[0x263F21FB0];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v26 = *MEMORY[0x263F21F98];
  uint64_t v27 = v6;
  v20 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v29[0] = v20;
  v28[1] = *MEMORY[0x263F21F40];
  uint64_t v7 = *MEMORY[0x263F21F48];
  v24[0] = *MEMORY[0x263F21F50];
  v24[1] = v7;
  v25[0] = v3;
  v25[1] = v4;
  v24[2] = *MEMORY[0x263F21F38];
  v8 = [NSNumber numberWithDouble:1.0];
  v25[2] = v8;
  objc_super v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  v29[1] = v9;
  v28[2] = *MEMORY[0x263F22068];
  v22[0] = *MEMORY[0x263F22060];
  uint64_t v10 = [NSNumber numberWithLong:*(void *)(a1 + 56)];
  v23[0] = v10;
  v22[1] = *MEMORY[0x263F22078];
  double v11 = NSNumber;
  uint64_t v12 = [*(id *)(a1 + 48) accessibilityData];
  [v12 eventValue1];
  double v13 = objc_msgSend(v11, "numberWithFloat:");
  v23[1] = v13;
  v22[2] = *MEMORY[0x263F22070];
  double v14 = NSNumber;
  double v15 = [*(id *)(a1 + 48) accessibilityData];
  [v15 eventValue2];
  double v16 = objc_msgSend(v14, "numberWithFloat:");
  v23[2] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v29[2] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v19 sendPayload:v18 withEventID:*MEMORY[0x263F21F30]];
}

void __47__AXRConnectedDeviceViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) activeDevice];
  uint64_t v8 = *MEMORY[0x263F22088];
  uint64_t v6 = *MEMORY[0x263F22080];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "scrollAmount"));
  uint64_t v7 = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 sendPayload:v5 withEventID:*MEMORY[0x263F21F30]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXRConnectedDeviceViewController;
  [(AXRConnectedDeviceViewController *)&v11 viewWillAppear:a3];
  uint64_t v4 = [(AXRConnectedDeviceViewController *)self view];
  [v4 frame];
  double v6 = v5 + -80.0;

  uint64_t v7 = [(AXRConnectedDeviceViewController *)self collectionViewFlowLayout];
  objc_msgSend(v7, "setSectionInset:", 16.0, 16.0, 16.0, 16.0);

  uint64_t v8 = [(AXRConnectedDeviceViewController *)self collectionViewFlowLayout];
  [v8 setMinimumInteritemSpacing:16.0];

  objc_super v9 = [(AXRConnectedDeviceViewController *)self collectionViewFlowLayout];
  objc_msgSend(v9, "setItemSize:", v6 * 0.25, v6 * 0.25);

  uint64_t v10 = [(AXRConnectedDeviceViewController *)self collectionViewFlowLayout];
  [v10 invalidateLayout];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_moreButtonPressed
{
  uint64_t v3 = [AXRDeviceActionsViewController alloc];
  uint64_t v4 = [(AXRConnectedDeviceViewController *)self activeDevice];
  uint64_t v8 = [(AXRDeviceActionsViewController *)v3 initWithRemoteDevice:v4 delegate:self];

  double v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:24 target:self action:sel__dismissCurrentPresentedViewController];
  double v6 = [(AXRDeviceActionsViewController *)v8 navigationItem];
  [v6 setRightBarButtonItem:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v8];
  [(AXRConnectedDeviceViewController *)self presentViewController:v7 animated:1 completion:&__block_literal_global_0];
}

- (void)_dismissCurrentPresentedViewController
{
  id v2 = [(AXRConnectedDeviceViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_performDeviceRemoteAction:(id)a3
{
  id v4 = a3;
  double v5 = [(AXRConnectedDeviceViewController *)self activeDevice];
  eventSenderQueue = self->_eventSenderQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __63__AXRConnectedDeviceViewController__performDeviceRemoteAction___block_invoke;
  v9[3] = &unk_264DA8C80;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(eventSenderQueue, v9);
}

void __63__AXRConnectedDeviceViewController__performDeviceRemoteAction___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F21FB0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *MEMORY[0x263F21F98];
  uint64_t v6 = v1;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 sendPayload:v4 withEventID:*MEMORY[0x263F21F30]];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [v10 item];
  uint64_t v6 = [(AXRConnectedDeviceViewController *)self remoteActionsToShow];
  uint64_t v7 = [v6 count];

  if (v5 == v7)
  {
    [(AXRConnectedDeviceViewController *)self _moreButtonPressed];
  }
  else
  {
    id v8 = [(AXRConnectedDeviceViewController *)self remoteActionsToShow];
    objc_super v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v10, "item"));

    [(AXRConnectedDeviceViewController *)self _performDeviceRemoteAction:v9];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(AXRConnectedDeviceViewController *)self remoteActionsToShow];
  int64_t v5 = [v4 count] + 1;

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"CellReuseIdentifier" forIndexPath:v6];
  uint64_t v8 = [v6 item];
  objc_super v9 = [(AXRConnectedDeviceViewController *)self remoteActionsToShow];
  uint64_t v10 = [v9 count];

  if (v8 == v10)
  {
    id v11 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ellipsis.circle"];
    uint64_t v12 = AXRLocalizedStringForKey();
    [v7 setImage:v11 title:v12];
  }
  else
  {
    double v13 = [(AXRConnectedDeviceViewController *)self remoteActionsToShow];
    id v11 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "item"));

    double v14 = [(AXRConnectedDeviceViewController *)self activeDevice];
    uint64_t v12 = AXRUIImageForRemoteActionWithDeviceType(v11, [v14 deviceType]);

    double v15 = [(AXRConnectedDeviceViewController *)self activeDevice];
    [v15 deviceType];
    double v16 = AXRLocalizedStringForRemoteActionWithDeviceType();
    [v7 setImage:v12 title:v16];
  }
  return v7;
}

- (void)remoteDeviceDidUnexpectedlyDisconnect:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__AXRConnectedDeviceViewController_remoteDeviceDidUnexpectedlyDisconnect___block_invoke;
  v6[3] = &unk_264DA8C30;
  id v7 = v4;
  id v5 = v4;
  [(AXRConnectedDeviceViewController *)self dismissViewControllerAnimated:1 completion:v6];
}

void __74__AXRConnectedDeviceViewController_remoteDeviceDidUnexpectedlyDisconnect___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x263F22848] sharedInstance];
  id v2 = [*(id *)(a1 + 32) displayName];
  uint64_t v3 = AXRLocalizedStringForKey();
  [v4 presentBannerWithTitle:v2 message:v3 duration:3.0];
}

- (void)actionsViewController:(id)a3 selectedAction:(id)a4
{
}

- (void)voiceOverTouchPadView:(id)a3 didReceiveCommand:(id)a4
{
  id v5 = a4;
  eventSenderQueue = self->_eventSenderQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __76__AXRConnectedDeviceViewController_voiceOverTouchPadView_didReceiveCommand___block_invoke;
  v8[3] = &unk_264DA8C80;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(eventSenderQueue, v8);
}

void __76__AXRConnectedDeviceViewController_voiceOverTouchPadView_didReceiveCommand___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) activeDevice];
  uint64_t v8 = *MEMORY[0x263F22098];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x263F22090];
  uint64_t v7 = v3;
  id v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 sendPayload:v5 withEventID:*MEMORY[0x263F21F30]];
}

- (AXRemoteDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (AXRActionsCollectionView)actionsCollectionView
{
  return self->_actionsCollectionView;
}

- (void)setActionsCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionViewFlowLayout
{
  return self->_collectionViewFlowLayout;
}

- (void)setCollectionViewFlowLayout:(id)a3
{
}

- (NSArray)remoteActionsToShow
{
  return self->_remoteActionsToShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteActionsToShow, 0);
  objc_storeStrong((id *)&self->_collectionViewFlowLayout, 0);
  objc_storeStrong((id *)&self->_actionsCollectionView, 0);
  objc_storeStrong((id *)&self->_eventProcessor, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_eventSenderQueue, 0);
}

@end