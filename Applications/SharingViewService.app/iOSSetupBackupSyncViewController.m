@interface iOSSetupBackupSyncViewController
- (BOOL)_canShowWhileLocked;
- (void)_handleTestTimerFired;
- (void)handleHideButton:(id)a3;
- (void)handleProgressEvent:(unsigned int)a3 info:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupBackupSyncViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lastProgressEvent + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressBar + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)_handleTestTimerFired
{
  int v3 = *(_DWORD *)((char *)&self->_progressLabel + 5);
  if (v3 <= 0xA)
  {
    if (v3) {
      double v4 = 500.0 - (double)v3 / 10.0 * 500.0;
    }
    else {
      double v4 = -1.0;
    }
    uint64_t v5 = 300;
LABEL_11:
    *(_DWORD *)((char *)&self->_progressLabel + 5) = v3 + 1;
    id mainController = self->super.super._mainController;
    v17[0] = @"progress";
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v17[1] = @"remainSecs";
    v18[0] = v7;
    v8 = +[NSNumber numberWithDouble:v4];
    v18[1] = v8;
    v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [mainController showBackupSyncUI:v5 info:v9];

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100107444;
    handler[3] = &unk_1001A1B88;
    dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v16 = self;
    v10 = v15;
    dispatch_source_set_event_handler(v10, handler);
    SFDispatchTimerSet();
    dispatch_resume(v10);

    return;
  }
  if ((v3 - 11) <= 0xA)
  {
    if (v3 == 11) {
      double v4 = -1.0;
    }
    else {
      double v4 = 2000.0 - (double)(v3 - 11) / 10.0 * 2000.0;
    }
    uint64_t v5 = 310;
    goto LABEL_11;
  }
  unsigned int v11 = [self->super.super._mainController testMode];
  id v12 = self->super.super._mainController;
  if (v11 == 1)
  {
    [v12 showDoneUI:0];
  }
  else
  {
    NSErrorWithOSStatusF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v12 showDoneUI:];
  }
}

- (void)handleProgressEvent:(unsigned int)a3 info:(id)a4
{
  id v50 = a4;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    v47 = sub_100101F84(a3);
    id v49 = v50;
    LogPrintF();
  }
  if (a3 == 310)
  {
    if (*(_DWORD *)((char *)&self->_progressLabel + 1) != 310)
    {
      v10 = sub_100138280(@"Localizable", @"IOS_SETUP_SYNC_TITLE");
      [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v10];

      unsigned int v11 = sub_100138280(@"Localizable", @"IOS_SETUP_SYNC_INFO");
      [*(id *)((char *)&self->_titleLabel + 1) setText:v11];

      *(_DWORD *)((char *)&self->_progressLabel + 1) = 310;
    }
  }
  else
  {
    if (a3 != 300) {
      goto LABEL_27;
    }
    if (*(_DWORD *)((char *)&self->_progressLabel + 1) != 300)
    {
      v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:@"IOS_SETUP_BACKUP_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
      [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v7];

      unsigned int v8 = SFDeviceClassCodeGet() - 1;
      if (v8 > 6) {
        CFStringRef v9 = @"_IPHONE";
      }
      else {
        CFStringRef v9 = off_1001A18E0[v8];
      }
      id v12 = [@"IOS_SETUP_BACKUP_INFO" stringByAppendingString:v9, v47, v49];
      unsigned int v13 = [self->super.super._mainController otherDeviceClassCode] - 1;
      if (v13 > 6) {
        CFStringRef v14 = @"_IPHONE";
      }
      else {
        CFStringRef v14 = off_1001A18E0[v13];
      }
      dispatch_source_t v15 = [v12 stringByAppendingString:v14];

      v23 = sub_100138494(v15, v16, v17, v18, v19, v20, v21, v22, v48);
      [*(id *)((char *)&self->_titleLabel + 1) setText:v23];

      *(_DWORD *)((char *)&self->_progressLabel + 1) = 300;
    }
  }
  CFDictionaryGetDouble();
  if (v24 > 1.0) {
    double v24 = 1.0;
  }
  if (v24 < 0.0) {
    double v24 = 0.0;
  }
  *(float *)&double v24 = v24;
  [*(id *)((char *)&self->_infoLabel + 1) setProgress:v24, v47];
  CFDictionaryGetDouble();
  if (v25 >= 0.0)
  {
    double v36 = v25;
    v37 = *(void **)((char *)&self->_lastProgressEvent + 1);
    if (!v37)
    {
      id v38 = objc_alloc_init((Class)NSDateComponentsFormatter);
      v39 = *(void **)((char *)&self->_lastProgressEvent + 1);
      *(void *)((char *)&self->_lastProgressEvent + 1) = v38;

      [*(id *)((char *)&self->_lastProgressEvent + 1) setUnitsStyle:3];
      [*(id *)((char *)&self->_lastProgressEvent + 1) setIncludesApproximationPhrase:1];
      [*(id *)((char *)&self->_lastProgressEvent + 1) setAllowedUnits:240];
      [*(id *)((char *)&self->_lastProgressEvent + 1) setMaximumUnitCount:1];
      v37 = *(void **)((char *)&self->_lastProgressEvent + 1);
    }
    v26 = [v37 stringFromTimeInterval:v36];
    v27 = sub_100138494(@"IOS_SETUP_REMAINING_SECONDS_FORMAT", v40, v41, v42, v43, v44, v45, v46, (uint64_t)v26);
    [*(id *)((char *)&self->_progressBar + 1) setText:v27];
  }
  else
  {
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"ESTIMATING" value:&stru_1001A1DC0 table:@"Localizable"];
    v35 = sub_100138494(@"IOS_SETUP_REMAINING_SECONDS_FORMAT", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
    [*(id *)((char *)&self->_progressBar + 1) setText:v35];
  }
  [*(id *)((char *)&self->_progressBar + 1) setHidden:0];
LABEL_27:
}

- (void)handleHideButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupBackupSyncViewController;
  [(iOSSetupBackupSyncViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v21.receiver = self;
  v21.super_class = (Class)iOSSetupBackupSyncViewController;
  [(SVSBaseViewController *)&v21 viewWillAppear:v3];
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"IOS_SETUP_BACKUP_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v6];

  unsigned int v7 = SFDeviceClassCodeGet() - 1;
  if (v7 > 6) {
    CFStringRef v8 = @"_IPHONE";
  }
  else {
    CFStringRef v8 = off_1001A18E0[v7];
  }
  CFStringRef v9 = [@"IOS_SETUP_BACKUP_INFO" stringByAppendingString:v8];
  unsigned int v10 = [self->super.super._mainController otherDeviceClassCode] - 1;
  if (v10 > 6) {
    CFStringRef v11 = @"_IPHONE";
  }
  else {
    CFStringRef v11 = off_1001A18E0[v10];
  }
  id v12 = [v9 stringByAppendingString:v11];

  uint64_t v20 = sub_100138494(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)v21.receiver);
  [*(id *)((char *)&self->_titleLabel + 1) setText:v20];

  if ([self->super.super._mainController testMode]) {
    [(iOSSetupBackupSyncViewController *)self _handleTestTimerFired];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end