@interface CCUIConnectivityAirplaneViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAirplaneModeEnabled;
- (BOOL)_isStateOverridden;
- (BOOL)_stateWithEffectiveOverrides;
- (BOOL)_toggleState;
- (CCUIConnectivityAirplaneViewController)init;
- (OS_dispatch_queue)queue;
- (RadiosPreferences)airplaneModeController;
- (id)_debugDescriptionForState:(BOOL)a3;
- (id)displayName;
- (id)identifier;
- (id)subtitleText;
- (void)_setAirplaneModeEnabled:(BOOL)a3;
- (void)_updateState;
- (void)_updateStateWithEnabled:(BOOL)a3;
- (void)airplaneModeChanged;
- (void)buttonTapped:(id)a3;
- (void)dealloc;
- (void)setAirplaneModeController:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObservingStateChanges;
- (void)stopObservingStateChanges;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUIConnectivityAirplaneViewController

- (void)startObservingStateChanges
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityButtonViewController *)&v5 startObservingStateChanges];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24062FCA8;
  block[3] = &unk_2650C9380;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityAirplaneViewController *)&v8 viewWillAppear:a3];
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (CCUIConnectivityAirplaneViewController)init
{
  v3 = (void *)MEMORY[0x263F1C6B0];
  v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  v9 = objc_msgSend_imageNamed_inBundle_(v3, v8, @"AirplaneGlyph", v7);
  v12 = objc_msgSend_imageFlippedForRightToLeftLayoutDirection(v9, v10, v11);

  v15 = objc_msgSend_systemOrangeColor(MEMORY[0x263F1C550], v13, v14);
  v24.receiver = self;
  v24.super_class = (Class)CCUIConnectivityAirplaneViewController;
  id v16 = [(CCUIConnectivityButtonViewController *)&v24 initWithGlyphImage:v12 highlightColor:v15];

  if (v16)
  {
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.ControlCenter.AirplaneViewController", 0);
    v18 = (void *)*((void *)v16 + 140);
    *((void *)v16 + 140) = v17;

    id v19 = objc_alloc(MEMORY[0x263F255D8]);
    uint64_t v21 = objc_msgSend_initWithQueue_(v19, v20, *((void *)v16 + 140));
    v22 = (void *)*((void *)v16 + 139);
    *((void *)v16 + 139) = v21;
  }
  return (CCUIConnectivityAirplaneViewController *)v16;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24062FA90;
  block[3] = &unk_2650C9380;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityAirplaneViewController *)&v4 dealloc];
}

- (void)buttonTapped:(id)a3
{
  id v4 = a3;
  objc_msgSend__toggleState(self, v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityButtonViewController *)&v7 buttonTapped:v4];
}

- (id)displayName
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_bundleForClass_(v2, v4, v3);
  objc_super v7 = objc_msgSend_localizedStringForKey_value_table_(v5, v6, @"CONTROL_CENTER_STATUS_AIRPLANE_MODE_NAME", &stru_26F4C07A8, 0);

  return v7;
}

- (id)identifier
{
  return @"com.apple.ControlCenter.Airplane";
}

- (id)subtitleText
{
  int isEnabled = objc_msgSend_isEnabled(self, a2, v2);
  id v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  objc_super v7 = objc_msgSend_bundleForClass_(v4, v6, v5);
  v9 = v7;
  if (isEnabled) {
    objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_AIRPLANE_MODE_ON", &stru_26F4C07A8, 0);
  }
  else {
  v10 = objc_msgSend_localizedStringForKey_value_table_(v7, v8, @"CONTROL_CENTER_STATUS_AIRPLANE_MODE_OFF", &stru_26F4C07A8, 0);
  }

  return v10;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityAirplaneViewController *)&v6 viewWillDisappear:a3];
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (void)stopObservingStateChanges
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityAirplaneViewController;
  [(CCUIConnectivityButtonViewController *)&v5 stopObservingStateChanges];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24062FD94;
  block[3] = &unk_2650C9380;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)airplaneModeChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24062E000, v3, OS_LOG_TYPE_DEFAULT, "Airplane Mode state changed", buf, 2u);
  }
  char v6 = objc_msgSend_airplaneMode(self->_airplaneModeController, v4, v5);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_24062FE9C;
  v7[3] = &unk_2650C93A8;
  v7[4] = self;
  char v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (void)_setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
  uint64_t v5 = objc_msgSend__stateWithEffectiveOverrides(self, a2, a3);

  objc_msgSend_setEnabled_(self, v4, v5);
}

- (void)_updateState
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_24062FFC4;
  v5[3] = &unk_2650C93D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  objc_msgSend__updateStateWithEnabled_(self, v4, *((unsigned __int8 *)v7 + 24));
  _Block_object_dispose(&v6, 8);
}

- (void)_updateStateWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_msgSend__setAirplaneModeEnabled_(self, v5, v3);
  uint64_t v8 = objc_msgSend_subtitleText(self, v6, v7);
  objc_msgSend_setSubtitle_(self, v9, (uint64_t)v8);

  v10 = (void *)*MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    v13 = objc_msgSend__debugDescriptionForState_(self, v12, v3);
    int v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_24062E000, v11, OS_LOG_TYPE_DEFAULT, "Airplane Mode state updated to %{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (BOOL)_toggleState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend__isAirplaneModeEnabled(self, a2, v2) ^ 1;
  uint64_t v5 = (void *)*MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v8 = objc_msgSend__debugDescriptionForState_(self, v7, v4);
    *(_DWORD *)buf = 138543362;
    int v14 = v8;
    _os_log_impl(&dword_24062E000, v6, OS_LOG_TYPE_DEFAULT, "Toggle AirPlane Mode state to %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_24063024C;
  v11[3] = &unk_2650C93A8;
  v11[4] = self;
  char v12 = v4;
  dispatch_sync(queue, v11);
  return 1;
}

- (BOOL)_stateWithEffectiveOverrides
{
  int airplaneModeEnabled = self->_airplaneModeEnabled;
  if (objc_msgSend__isStateOverridden(self, a2, v2)) {
    int airplaneModeEnabled = *(unsigned __int8 *)(objc_msgSend_getStatusBarOverrideData(MEMORY[0x263F1C9C8], v4, v5) + 67);
  }
  return airplaneModeEnabled != 0;
}

- (BOOL)_isStateOverridden
{
  BOOL v3 = objc_msgSend_standardDefaults(MEMORY[0x263F33C18], a2, v2);
  if (objc_msgSend_shouldExcludeControlCenterFromStatusBarOverrides(v3, v4, v5))
  {
  }
  else
  {
    char v6 = CCSIsInternalInstall();

    if (v6) {
      return *(unsigned char *)(objc_msgSend_getStatusBarOverrideData(MEMORY[0x263F1C9C8], v7, v8) + 3) != 0;
    }
  }
  return 0;
}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3) {
    return @"on";
  }
  else {
    return @"off";
  }
}

- (RadiosPreferences)airplaneModeController
{
  return self->_airplaneModeController;
}

- (void)setAirplaneModeController:(id)a3
{
}

- (BOOL)_isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_airplaneModeController, 0);
}

@end