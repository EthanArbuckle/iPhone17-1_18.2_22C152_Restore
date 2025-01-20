@interface NFCTagReaderScanViewController
- (NFCTagReaderMainController)mainController;
- (void)dismissEventually;
- (void)nfcTagScanned;
- (void)setMainController:(id)a3;
- (void)showFailureUI;
- (void)updateButtonText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NFCTagReaderScanViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainController);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);

  objc_storeStrong((id *)&self->_nfcAnimationView, 0);
}

- (void)setMainController:(id)a3
{
}

- (NFCTagReaderMainController)mainController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);

  return (NFCTagReaderMainController *)WeakRetained;
}

- (void)updateButtonText:(id)a3
{
  id v4 = a3;
  v5 = [(NFCTagReaderScanViewController *)self mainController];
  [(NFCTagReaderScanViewController *)self removeAction:self->_primaryAction];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010AD88;
  v9[3] = &unk_1001A1378;
  id v10 = v5;
  id v6 = v5;
  v7 = +[PRXAction actionWithTitle:v4 style:0 handler:v9];

  objc_storeStrong((id *)&self->_primaryAction, v7);
  id v8 = [(NFCTagReaderScanViewController *)self addAction:v7];
}

- (void)dismissEventually
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  [WeakRetained setDismissing:1];

  timer = self->_timer;
  if (timer)
  {
    v5 = timer;
    dispatch_source_cancel(v5);
    id v6 = self->_timer;
    self->_timer = 0;
  }
  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v8 = self->_timer;
  self->_timer = v7;

  v9 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10010AF3C;
  handler[3] = &unk_1001A1BD8;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  SFDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)nfcTagScanned
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = [WeakRetained dismissing];
    LogPrintF();
  }
  if ((objc_msgSend(WeakRetained, "dismissing", v8) & 1) == 0)
  {
    [WeakRetained uiOperationBegin];
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    inCompletionBlock[0] = _NSConcreteStackBlock;
    inCompletionBlock[1] = 3221225472;
    inCompletionBlock[2] = sub_10010B240;
    inCompletionBlock[3] = &unk_1001A1BD8;
    id v4 = WeakRetained;
    id v11 = v4;
    AudioServicesPlaySystemSoundWithCompletion(0x488u, inCompletionBlock);
    if (self->_mode == 20)
    {
      [(NFCTagReaderScanViewController *)self dismissEventually];
    }
    else if ([v4 tagCount] == (id)1 || (uint64_t)objc_msgSend(v4, "tagCount") >= 2)
    {
      v5 = +[NSBundle mainBundle];
      id v6 = [v5 localizedStringForKey:@"DONE" value:&stru_1001A1DC0 table:@"Localizable"];
      [(NFCTagReaderScanViewController *)self updateButtonText:v6];
    }
    [(PKGlyphView *)self->_nfcAnimationView setColorMode:2 animated:1];
    nfcAnimationView = self->_nfcAnimationView;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010B320;
    v9[3] = &unk_1001A1898;
    void v9[4] = self;
    [(PKGlyphView *)nfcAnimationView setState:11 animated:1 completionHandler:v9];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8.receiver = self;
  v8.super_class = (Class)NFCTagReaderScanViewController;
  [(NFCTagReaderScanViewController *)&v8 viewDidDisappear:v3];
  timer = self->_timer;
  if (timer)
  {
    id v6 = timer;
    dispatch_source_cancel(v6);
    v7 = self->_timer;
    self->_timer = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)NFCTagReaderScanViewController;
  [(NFCTagReaderScanViewController *)&v7 viewDidAppear:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  [WeakRetained setAppeared:1];
  id v6 = [WeakRetained purpose];
  [(NFCTagReaderScanViewController *)self setSubtitle:v6];

  if ((uint64_t)[WeakRetained tagCount] >= 1)
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NFCTagReaderScanViewController *)self nfcTagScanned];
    [WeakRetained uiOperationEnd];
  }
}

- (void)showFailureUI
{
  [(PKGlyphView *)self->_nfcAnimationView setColorMode:3 animated:0];
  [(PKGlyphView *)self->_nfcAnimationView setState:10 animated:0 completionHandler:0];
  BOOL v3 = +[UIImage systemImageNamed:@"exclamationmark"];
  id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:70.0];
  v5 = [v3 imageByApplyingSymbolConfiguration:v4];
  id v6 = [(PKGlyphView *)self->_nfcAnimationView primaryColor];
  objc_super v7 = [v5 _flatImageWithColor:v6];

  nfcAnimationView = self->_nfcAnimationView;
  id v10 = v7;
  id v9 = [v10 CGImage];
  [v10 alignmentRectInsets];
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](nfcAnimationView, "setCustomImage:withAlignmentEdgeInsets:", v9);
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  AudioServicesPlaySystemSoundWithCompletion(0x576u, &stru_1001A0FD8);
  [(NFCTagReaderScanViewController *)self dismissEventually];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v66.receiver = self;
  v66.super_class = (Class)NFCTagReaderScanViewController;
  [(NFCTagReaderScanViewController *)&v66 viewWillAppear:v3];
  [(NFCTagReaderScanViewController *)self setDismissalType:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  id v6 = [WeakRetained userInfo];
  self->_int64_t mode = (int)CFDictionaryGetInt64Ranged();

  int64_t mode = self->_mode;
  if (mode == 10 || mode == 0) {
    self->_int64_t mode = 30;
  }
  id v9 = [WeakRetained userInfo];
  int Int64Ranged = CFDictionaryGetInt64Ranged();

  id v11 = +[NSBundle mainBundle];
  v12 = v11;
  if (Int64Ranged) {
    CFStringRef v13 = @"HOLD_NEAR_READER";
  }
  else {
    CFStringRef v13 = @"READY_TO_SCAN";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_1001A1DC0 table:@"Localizable"];
  [(NFCTagReaderScanViewController *)self setTitle:v14];

  v15 = [WeakRetained purpose];
  [(NFCTagReaderScanViewController *)self setSubtitle:v15];

  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1001A1DC0 table:@"Localizable"];

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10010C014;
  v64[3] = &unk_1001A1378;
  id v18 = WeakRetained;
  id v65 = v18;
  v19 = +[PRXAction actionWithTitle:v17 style:0 handler:v64];
  objc_storeStrong((id *)&self->_primaryAction, v19);
  id v20 = [(NFCTagReaderScanViewController *)self addAction:v19];
  if (!self->_nfcAnimationView)
  {
    v21 = (PKGlyphView *)[objc_alloc((Class)PKGlyphView) initWithStyle:0];
    nfcAnimationView = self->_nfcAnimationView;
    self->_nfcAnimationView = v21;

    [(PKGlyphView *)self->_nfcAnimationView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKGlyphView *)self->_nfcAnimationView setState:9 animated:0 completionHandler:0];
    v61 = v19;
    v23 = self->_nfcAnimationView;
    +[UIScreen mainScreen];
    v24 = id v62 = v18;
    [v24 scale];
    -[PKGlyphView updateRasterizationScale:](v23, "updateRasterizationScale:");

    v25 = [(NFCTagReaderScanViewController *)self contentView];
    [v25 addSubview:self->_nfcAnimationView];

    v60 = [(PKGlyphView *)self->_nfcAnimationView heightAnchor];
    v59 = [v60 constraintEqualToConstant:116.0];
    v67[0] = v59;
    v58 = [(PKGlyphView *)self->_nfcAnimationView widthAnchor];
    v57 = [v58 constraintEqualToConstant:116.0];
    v67[1] = v57;
    v55 = [(PKGlyphView *)self->_nfcAnimationView centerXAnchor];
    v56 = [(NFCTagReaderScanViewController *)self contentView];
    v54 = [v56 mainContentGuide];
    v53 = [v54 centerXAnchor];
    v52 = [v55 constraintEqualToAnchor:v53];
    v67[2] = v52;
    v50 = [(PKGlyphView *)self->_nfcAnimationView centerYAnchor];
    v51 = [(NFCTagReaderScanViewController *)self contentView];
    v49 = [v51 mainContentGuide];
    v48 = [v49 centerYAnchor];
    v47 = [v50 constraintEqualToAnchor:v48];
    v67[3] = v47;
    v45 = [(PKGlyphView *)self->_nfcAnimationView leadingAnchor];
    v46 = [(NFCTagReaderScanViewController *)self contentView];
    v44 = [v46 mainContentGuide];
    v43 = [v44 leadingAnchor];
    v42 = [v45 constraintGreaterThanOrEqualToAnchor:v43];
    v67[4] = v42;
    v40 = [(PKGlyphView *)self->_nfcAnimationView trailingAnchor];
    v41 = [(NFCTagReaderScanViewController *)self contentView];
    v39 = [v41 mainContentGuide];
    v38 = [v39 trailingAnchor];
    v37 = [v40 constraintLessThanOrEqualToAnchor:v38];
    v67[5] = v37;
    v36 = [(PKGlyphView *)self->_nfcAnimationView topAnchor];
    [(NFCTagReaderScanViewController *)self contentView];
    v26 = v63 = v17;
    v27 = [v26 mainContentGuide];
    v28 = [v27 topAnchor];
    v29 = [v36 constraintGreaterThanOrEqualToAnchor:v28];
    v67[6] = v29;
    v30 = [(PKGlyphView *)self->_nfcAnimationView bottomAnchor];
    v31 = [(NFCTagReaderScanViewController *)self contentView];
    v32 = [v31 mainContentGuide];
    v33 = [v32 bottomAnchor];
    v34 = [v30 constraintLessThanOrEqualToAnchor:v33];
    v67[7] = v34;
    v35 = +[NSArray arrayWithObjects:v67 count:8];
    +[NSLayoutConstraint activateConstraints:v35];

    v19 = v61;
    id v18 = v62;

    v17 = v63;
  }
}

@end