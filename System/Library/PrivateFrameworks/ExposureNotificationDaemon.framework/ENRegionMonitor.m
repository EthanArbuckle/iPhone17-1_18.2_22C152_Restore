@interface ENRegionMonitor
+ (id)locationAuthorizationStatusToString:(int)a3;
+ (id)regionMonitorAuthorizationStateToString:(unint64_t)a3;
+ (id)regionMonitorMonitoringModeToString:(unint64_t)a3;
+ (unint64_t)regionMonitorStateFromAuthorizationStatus:(int)a3;
- (BOOL)_purgeAllRegionHistoryWithError:(id *)a3;
- (BOOL)_purgeRegionsOlderThanDate:(id)a3 error:(id *)a4;
- (BOOL)monitoringEnabled;
- (BOOL)purgeAllRegionHistoryWithError:(id *)a3;
- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4;
- (CLLocationManager)exposureNotificationLocationManager;
- (CLLocationManager)significantLocationsLocationManager;
- (ENRegionHistoryManager)regionHistoryManager;
- (ENRegionMonitor)init;
- (ENRegionMonitorCoreLocationDataSource)coreLocationDataSource;
- (ENRegionMonitorDelegate)delegate;
- (ENRegionMonitorTelephonyDataSource)telephonyDataSource;
- (ENRegionTestDataSource)testRegionDataSource;
- (ENRegionVisit)currentRegionVisit;
- (OS_dispatch_queue)regionMonitorQueue;
- (id)_getAllRegionVisitsWithError:(id *)a3;
- (id)_getAllRegionsWithError:(id *)a3;
- (id)_getCurrentRegionVisitWithError:(id *)a3;
- (id)getAllRegionVisitsWithError:(id *)a3;
- (id)getAllRegionsWithError:(id *)a3;
- (id)getCurrentRegionVisit;
- (id)getCurrentRegionVisitWithError:(id *)a3;
- (unint64_t)authorizationState;
- (unint64_t)exposureNotificationAuthorizationState;
- (unint64_t)getAuthorizationState;
- (unint64_t)getMonitoringMode;
- (unint64_t)monitoringMode;
- (unint64_t)significantLocationsAuthorizationState;
- (void)_createCountryDataSource;
- (void)_createLocationManager;
- (void)_createSubdivisionDataSource;
- (void)_createTestDataSource;
- (void)_notifyDelegateOfCurrentRegion;
- (void)_regionDataSource:(id)a3 updatedWithVisit:(id)a4;
- (void)_resetRegionMonitor;
- (void)_setup;
- (void)_stopAllDataSources;
- (void)_updateRegionHistoryFileStatus;
- (void)currentRegionVisitDidChange:(id)a3;
- (void)disableRegionMonitor;
- (void)enableRegionMonitor;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)regionDataSource:(id)a3 updatedWithVisit:(id)a4;
- (void)resetRegionMonitor;
- (void)setAuthorizationState:(unint64_t)a3;
- (void)setCoreLocationDataSource:(id)a3;
- (void)setCurrentRegionVisit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExposureNotificationAuthorizationState:(unint64_t)a3;
- (void)setExposureNotificationLocationManager:(id)a3;
- (void)setMonitoringEnabled:(BOOL)a3;
- (void)setMonitoringMode:(unint64_t)a3;
- (void)setRegionHistoryManager:(id)a3;
- (void)setRegionMonitorQueue:(id)a3;
- (void)setSignificantLocationsAuthorizationState:(unint64_t)a3;
- (void)setSignificantLocationsLocationManager:(id)a3;
- (void)setTelephonyDataSource:(id)a3;
- (void)setTestRegionDataSource:(id)a3;
- (void)setup;
- (void)updateAuthorizationState;
- (void)updateRegionHistoryFileStatus;
- (void)updateRegionMonitorMonitoringMode:(unint64_t)a3;
@end

@implementation ENRegionMonitor

uint64_t __53__ENRegionMonitor_regionDataSource_updatedWithVisit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _regionDataSource:*(void *)(a1 + 40) updatedWithVisit:*(void *)(a1 + 48)];
}

uint64_t __48__ENRegionMonitor_updateRegionHistoryFileStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRegionHistoryFileStatus];
}

uint64_t __38__ENRegionMonitor_enableRegionMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringEnabled:1];
}

- (void)updateRegionHistoryFileStatus
{
  v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ENRegionMonitor_updateRegionHistoryFileStatus__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)enableRegionMonitor
{
  v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ENRegionMonitor_enableRegionMonitor__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_regionDataSource:(id)a3 updatedWithVisit:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_regionMonitorQueue);
  v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v8 = [v7 isSensitiveLoggingAllowed];

  if (v8
    && gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    v9 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v9);
    LogPrintF_safe();
  }
  if (v6
    && ([v6 region],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 countryCode],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    [(ENRegionMonitor *)self setCurrentRegionVisit:v6];
  }
  else if (gLogCategory_ENRegionMonitor <= 90 {
         && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)setCurrentRegionVisit:(id)a3
{
  id v5 = a3;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  v7 = [(ENRegionVisit *)self->_currentRegionVisit date];
  id v29 = v5;
  int v8 = [v29 date];
  v9 = [(ENRegionVisit *)self->_currentRegionVisit region];
  v10 = [v29 region];
  char v11 = [v9 isCountryCodeEqualToRegion:v10];

  if ((v11 & 1) == 0)
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
LABEL_22:
    LogPrintF_safe();
LABEL_30:
    v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v22 = [v21 isSensitiveLoggingAllowed];

    if (v22
      && gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      v23 = NSStringFromSelector(a2);
      currentRegionVisit = self->_currentRegionVisit;
      id v28 = v29;
      v26 = v23;
      LogPrintF_safe();
    }
    v24 = (ENRegionVisit *)objc_msgSend(v29, "copy", v26, currentRegionVisit, v28);
    v25 = self->_currentRegionVisit;
    self->_currentRegionVisit = v24;

    if (v29)
    {
      [(ENRegionHistoryManager *)self->_regionHistoryManager addRegionVisit:v29];
      [(ENRegionMonitor *)self _notifyDelegateOfCurrentRegion];
    }
    goto LABEL_37;
  }
  v12 = [v29 region];
  if ([v12 validSubdivisionCode])
  {
    id v13 = [(ENRegionVisit *)self->_currentRegionVisit region];
    if (([v13 validSubdivisionCode] & 1) == 0)
    {

LABEL_20:
      if (gLogCategory_ENRegionMonitor > 30
        || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_30;
      }
      goto LABEL_22;
    }
    v14 = [(ENRegionVisit *)self->_currentRegionVisit region];
    v15 = [v29 region];
    char v16 = [v14 isSubdivisionCodeEqualToRegion:v15];

    if ((v16 & 1) == 0) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v17 = [(ENRegionVisit *)self->_currentRegionVisit region];
  v18 = [v29 region];
  if ([v17 isEqual:v18])
  {
    [v8 timeIntervalSinceDate:v7];
    double v20 = v19;

    if (v20 > 43200.0)
    {
      if (gLogCategory_ENRegionMonitor > 30
        || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_30;
      }
      goto LABEL_22;
    }
  }
  else
  {
  }
  if (gLogCategory_ENRegionMonitor <= 10
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_37:
}

- (OS_dispatch_queue)regionMonitorQueue
{
  return self->_regionMonitorQueue;
}

- (void)regionDataSource:(id)a3 updatedWithVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ENRegionMonitor_regionDataSource_updatedWithVisit___block_invoke;
  block[3] = &unk_1E69ACD00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)getAllRegionsWithError:(id *)a3
{
  id v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = __Block_byref_object_copy__4;
  double v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ENRegionMonitor_getAllRegionsWithError___block_invoke;
  block[3] = &unk_1E69ADE58;
  block[4] = self;
  void block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3) {
    *a3 = (id) v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __42__ENRegionMonitor_getAllRegionsWithError___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _getAllRegionsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_getAllRegionsWithError:(id *)a3
{
  uint64_t v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v5);

  if ([(ENRegionMonitor *)self authorizationState] == 2)
  {
    id v6 = [(ENRegionHistoryManager *)self->_regionHistoryManager getAllRegions];
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory__ENRegionMonitor <= 90
      && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)authorizationState
{
  return self->_authorizationState;
}

- (void)_updateRegionHistoryFileStatus
{
  uint64_t v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ENRegionMonitor *)self regionHistoryManager];
  [v4 updateFileStatus];
}

- (ENRegionHistoryManager)regionHistoryManager
{
  return self->_regionHistoryManager;
}

- (void)setMonitoringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_monitoringEnabled != v3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      int v8 = (void *)v7;
      id v9 = "yes";
      if (self->_monitoringEnabled) {
        uint64_t v10 = "yes";
      }
      else {
        uint64_t v10 = "no";
      }
      if (!v3) {
        id v9 = "no";
      }
      id v13 = v10;
      v14 = v9;
      uint64_t v12 = v7;
      LogPrintF_safe();
    }
    self->_monitoringEnabled = v3;
    if (v3) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    -[ENRegionMonitor setMonitoringMode:](self, "setMonitoringMode:", v11, v12, v13, v14);
    [(ENRegionMonitor *)self _resetRegionMonitor];
  }
}

+ (unint64_t)regionMonitorStateFromAuthorizationStatus:(int)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 3);
  }
}

+ (id)regionMonitorAuthorizationStateToString:(unint64_t)a3
{
  BOOL v3 = @"Unknown";
  if (a3 == 1) {
    BOOL v3 = @"Disabled";
  }
  if (a3 == 2) {
    return @"Enabled";
  }
  else {
    return v3;
  }
}

+ (id)locationAuthorizationStatusToString:(int)a3
{
  if ((a3 - 1) > 3) {
    return @"NotDetermined";
  }
  else {
    return off_1E69ADEA0[a3 - 1];
  }
}

+ (id)regionMonitorMonitoringModeToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E69ADEC0[a3 - 1];
  }
}

- (ENRegionMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)ENRegionMonitor;
  v2 = [(ENRegionMonitor *)&v7 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.exposureNotification.regionMonitor", v3);
    regionMonitorQueue = v2->_regionMonitorQueue;
    v2->_regionMonitorQueue = (OS_dispatch_queue *)v4;

    v2->_monitoringMode = 0;
    [(ENRegionMonitor *)v2 setup];
  }
  return v2;
}

- (void)_setup
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [ENRegionHistoryManager alloc];
  uint64_t v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  id v6 = [(ENRegionHistoryManager *)v4 initWithDelegate:self queue:v5];
  regionHistoryManager = self->_regionHistoryManager;
  self->_regionHistoryManager = v6;

  [(ENRegionMonitor *)self _createLocationManager];
  [(ENRegionMonitor *)self _createCountryDataSource];

  [(ENRegionMonitor *)self _createSubdivisionDataSource];
}

- (void)setup
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__ENRegionMonitor_setup__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__ENRegionMonitor_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_notifyDelegateOfCurrentRegion
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  if ([(ENRegionMonitor *)self authorizationState] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      dispatch_queue_t v4 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v5 = [v4 isSensitiveLoggingAllowed];

      if (v5
        && gLogCategory_ENRegionMonitor <= 30
        && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
      {
        int v8 = [(ENRegionMonitor *)self currentRegionVisit];
        LogPrintF_safe();
      }
      id v6 = [(ENRegionMonitor *)self currentRegionVisit];
      objc_super v7 = [v6 region];
      [WeakRetained regionMonitor:self regionDidChange:v7];
    }
    else if (gLogCategory__ENRegionMonitor <= 90 {
           && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_ENRegionMonitor <= 30 {
         && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF_safe();
  }
}

- (void)updateRegionMonitorMonitoringMode:(unint64_t)a3
{
  int v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ENRegionMonitor_updateRegionMonitorMonitoringMode___block_invoke;
  v6[3] = &unk_1E69ACC88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __53__ENRegionMonitor_updateRegionMonitorMonitoringMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringMode:*(void *)(a1 + 40)];
}

- (unint64_t)getMonitoringMode
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  dispatch_queue_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ENRegionMonitor_getMonitoringMode__block_invoke;
  v7[3] = &unk_1E69ADE30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__ENRegionMonitor_getMonitoringMode__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) monitoringMode];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)monitoringMode
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  return self->_monitoringMode;
}

- (void)setMonitoringMode:(unint64_t)a3
{
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_monitoringMode != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      objc_super v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(id)objc_opt_class() regionMonitorMonitoringModeToString:self->_monitoringMode];
      id v9 = [(id)objc_opt_class() regionMonitorMonitoringModeToString:a3];
      LogPrintF_safe();
    }
    self->_monitoringMode = a3;
    [(ENRegionMonitor *)self _resetRegionMonitor];
  }
}

- (void)disableRegionMonitor
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ENRegionMonitor_disableRegionMonitor__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __39__ENRegionMonitor_disableRegionMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoringEnabled:0];
}

- (void)resetRegionMonitor
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ENRegionMonitor_resetRegionMonitor__block_invoke;
  block[3] = &unk_1E69ACA50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__ENRegionMonitor_resetRegionMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetRegionMonitor];
}

- (void)_resetRegionMonitor
{
  dispatch_queue_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v4);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    double v20 = NSStringFromSelector(a2);
    LogPrintF_safe();
  }
  [(ENRegionMonitor *)self _stopAllDataSources];
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    unint64_t v5 = NSStringFromSelector(a2);
    id v6 = objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor exposureNotificationAuthorizationState](self, "exposureNotificationAuthorizationState"));
    objc_super v7 = objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor significantLocationsAuthorizationState](self, "significantLocationsAuthorizationState"));
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "regionMonitorAuthorizationStateToString:", -[ENRegionMonitor authorizationState](self, "authorizationState"));
    if ([(ENRegionMonitor *)self monitoringEnabled]) {
      id v9 = "yes";
    }
    else {
      id v9 = "no";
    }
    objc_msgSend((id)objc_opt_class(), "regionMonitorMonitoringModeToString:", -[ENRegionMonitor monitoringMode](self, "monitoringMode"));
    v26 = v25 = v9;
    v23 = v7;
    v24 = v8;
    id v21 = v5;
    int v22 = v6;
    LogPrintF_safe();
  }
  if (![(ENRegionMonitor *)self monitoringEnabled])
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_23;
  }
  if ([(ENRegionMonitor *)self authorizationState] != 2)
  {
    if (gLogCategory_ENRegionMonitor > 30
      || gLogCategory_ENRegionMonitor == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_23:
    NSStringFromSelector(a2);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();
    goto LABEL_24;
  }
  if (!IsAppleInternalBuild() || !CFPrefs_GetInt64())
  {
    [(ENRegionMonitor *)self setTestRegionDataSource:0];
    if ([(ENRegionMonitor *)self monitoringMode] != 2
      && [(ENRegionMonitor *)self monitoringMode] != 3)
    {
      return;
    }
    id v13 = [(ENRegionMonitor *)self telephonyDataSource];
    [v13 startMonitoring];

    v14 = [(ENRegionMonitor *)self coreLocationDataSource];
    [v14 startMonitoring];

    id v27 = [(ENRegionMonitor *)self regionHistoryManager];
    if ([v27 fileStatus] == 2)
    {
      id v15 = [(ENRegionMonitor *)self regionHistoryManager];
      uint64_t v16 = [v15 getAllRegionVisits];
      v17 = [v16 lastObject];
      uint64_t v18 = [v17 region];
      char v19 = [v18 validSubdivisionCode];

      if (v19) {
        return;
      }
      if (gLogCategory_ENRegionMonitor <= 30
        && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      id v27 = [(ENRegionMonitor *)self coreLocationDataSource];
      [v27 updateRegion];
    }
    goto LABEL_24;
  }
  [(ENRegionMonitor *)self _createTestDataSource];
  uint64_t v10 = [(ENRegionMonitor *)self testRegionDataSource];
  [v10 startMonitoring];

  uint64_t v11 = [(ENRegionMonitor *)self testRegionDataSource];
  id v27 = [v11 currentRegionVisit];

  uint64_t v12 = v27;
  if (v27)
  {
    [(ENRegionMonitor *)self setCurrentRegionVisit:v27];
LABEL_24:
    uint64_t v12 = v27;
  }
}

- (void)_createTestDataSource
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [[ENRegionTestDataSource alloc] initWithDelegate:self];
  [(ENRegionMonitor *)self setTestRegionDataSource:v4];
}

- (void)_createCountryDataSource
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [[ENRegionMonitorTelephonyDataSource alloc] initWithDelegate:self];
  [(ENRegionMonitor *)self setTelephonyDataSource:v4];
}

- (void)_createSubdivisionDataSource
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t Int64 = CFPrefs_GetInt64();
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (Int64)
  {
    unint64_t v5 = [[ENRegionMonitorCoreLocationDataSource alloc] initWithDelegate:self];
    [(ENRegionMonitor *)self setCoreLocationDataSource:v5];
  }
}

- (void)_stopAllDataSources
{
  BOOL v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(ENRegionMonitor *)self testRegionDataSource];
  [v4 stopMonitoring];

  unint64_t v5 = [(ENRegionMonitor *)self telephonyDataSource];
  [v5 stopMonitoring];

  id v6 = [(ENRegionMonitor *)self coreLocationDataSource];
  [v6 stopMonitoring];
}

- (void)setExposureNotificationAuthorizationState:(unint64_t)a3
{
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_exposureNotificationAuthorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      objc_super v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:self->_exposureNotificationAuthorizationState];
      id v9 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:a3];
      LogPrintF_safe();
    }
    self->_exposureNotificationAuthorizationState = a3;
    [(ENRegionMonitor *)self updateAuthorizationState];
  }
}

- (void)setSignificantLocationsAuthorizationState:(unint64_t)a3
{
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_significantLocationsAuthorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      objc_super v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:self->_significantLocationsAuthorizationState];
      id v9 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:a3];
      LogPrintF_safe();
    }
    self->_significantLocationsAuthorizationState = a3;
    [(ENRegionMonitor *)self updateAuthorizationState];
  }
}

- (unint64_t)getAuthorizationState
{
  dispatch_queue_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v4);

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  unint64_t v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ENRegionMonitor_getAuthorizationState__block_invoke;
  block[3] = &unk_1E69ADE30;
  block[4] = self;
  void block[5] = &v11;
  dispatch_sync(v5, block);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    id v6 = NSStringFromSelector(a2);
    id v9 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:v12[3]];
    LogPrintF_safe();
  }
  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __40__ENRegionMonitor_getAuthorizationState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)updateAuthorizationState
{
  if ([(ENRegionMonitor *)self exposureNotificationAuthorizationState] == 2
    && [(ENRegionMonitor *)self significantLocationsAuthorizationState] == 2)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }

  [(ENRegionMonitor *)self setAuthorizationState:v3];
}

- (void)setAuthorizationState:(unint64_t)a3
{
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_authorizationState != a3)
  {
    if (gLogCategory_ENRegionMonitor <= 30
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      unint64_t v7 = NSStringFromSelector(a2);
      uint64_t v8 = [(id)objc_opt_class() regionMonitorAuthorizationStateToString:self->_authorizationState];
      [(id)objc_opt_class() regionMonitorAuthorizationStateToString:a3];
      v12 = uint64_t v11 = v8;
      uint64_t v10 = v7;
      LogPrintF_safe();
    }
    self->_authorizationState = a3;
    id v9 = [(ENRegionMonitor *)self delegate];
    [v9 regionMonitor:self authorizationStateDidChange:self->_authorizationState];

    [(ENRegionMonitor *)self _notifyDelegateOfCurrentRegion];
    [(ENRegionMonitor *)self _resetRegionMonitor];
  }
}

- (void)_createLocationManager
{
  uint64_t v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t Int64 = CFPrefs_GetInt64();
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    unint64_t v5 = "no";
    if (Int64) {
      unint64_t v5 = "yes";
    }
    uint64_t v16 = "yes";
    v17 = v5;
    LogPrintF_safe();
  }
  if (Int64)
  {
    id v6 = [(ENRegionMonitor *)self exposureNotificationLocationManager];

    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1E608]);
      uint64_t v8 = [MEMORY[0x1E4F28B58] bundleWithPath:@"/System/Library/LocationBundles/ExposureNotificationBundle.bundle"];
      id v9 = [(ENRegionMonitor *)self regionMonitorQueue];
      uint64_t v10 = (void *)[v7 initWithEffectiveBundle:v8 delegate:self onQueue:v9];
      [(ENRegionMonitor *)self setExposureNotificationLocationManager:v10];
    }
    uint64_t v11 = [(ENRegionMonitor *)self significantLocationsLocationManager];

    if (!v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1E608]);
      uint64_t v13 = [MEMORY[0x1E4F28B58] bundleWithPath:@"/System/Library/LocationBundles/Routine.bundle"];
      uint64_t v14 = [(ENRegionMonitor *)self regionMonitorQueue];
      id v15 = (void *)[v12 initWithEffectiveBundle:v13 delegate:self onQueue:v14];
      [(ENRegionMonitor *)self setSignificantLocationsLocationManager:v15];
    }
  }
  else
  {
    [(ENRegionMonitor *)self setExposureNotificationAuthorizationState:2];
    [(ENRegionMonitor *)self setSignificantLocationsAuthorizationState:2];
  }
}

- (id)getCurrentRegionVisit
{
  uint64_t v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  dispatch_queue_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ENRegionMonitor_getCurrentRegionVisit__block_invoke;
  v7[3] = &unk_1E69ADE30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__ENRegionMonitor_getCurrentRegionVisit__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) currentRegionVisit];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (ENRegionVisit)currentRegionVisit
{
  uint64_t v3 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v3);

  currentRegionVisit = self->_currentRegionVisit;

  return currentRegionVisit;
}

- (BOOL)purgeAllRegionHistoryWithError:(id *)a3
{
  id v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ENRegionMonitor_purgeAllRegionHistoryWithError___block_invoke;
  block[3] = &unk_1E69ADE58;
  block[4] = self;
  void block[5] = &v10;
  void block[6] = &v14;
  dispatch_sync(v6, block);

  if (a3) {
    *a3 = (id) v15[5];
  }
  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __50__ENRegionMonitor_purgeAllRegionHistoryWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 _purgeAllRegionHistoryWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)_purgeAllRegionHistoryWithError:(id *)a3
{
  id v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v5);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  [(ENRegionMonitor *)self setCurrentRegionVisit:0];
  regionHistoryManager = self->_regionHistoryManager;

  return [(ENRegionHistoryManager *)regionHistoryManager purgeAllRegionHistoryWithError:a3];
}

- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [(ENRegionMonitor *)self regionMonitorQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ENRegionMonitor_purgeRegionsOlderThanDate_error___block_invoke;
  v12[3] = &unk_1E69ADE80;
  uint64_t v14 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v15 = &v20;
  dispatch_sync(v8, v12);

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v10 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __51__ENRegionMonitor_purgeRegionsOlderThanDate_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _purgeRegionsOlderThanDate:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  id v6 = [*(id *)(a1 + 32) currentRegionVisit];
  char v7 = [v6 date];

  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = [v8 laterDate:v7];
  LODWORD(v8) = [v8 isEqualToDate:v9];

  if (v8) {
    [*(id *)(a1 + 32) setCurrentRegionVisit:0];
  }
}

- (BOOL)_purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v7);

  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    id v10 = v6;
    LogPrintF_safe();
  }
  BOOL v8 = -[ENRegionHistoryManager purgeRegionsOlderThanDate:error:](self->_regionHistoryManager, "purgeRegionsOlderThanDate:error:", v6, a4, v10);

  return v8;
}

- (id)_getCurrentRegionVisitWithError:(id *)a3
{
  char v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v5);

  if ([(ENRegionMonitor *)self authorizationState] == 2)
  {
    id v6 = [(ENRegionMonitor *)self currentRegionVisit];
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v7 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v8 = [v7 isSensitiveLoggingAllowed];

    if (v8
      && gLogCategory_ENRegionMonitor <= 90
      && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)getCurrentRegionVisitWithError:(id *)a3
{
  char v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ENRegionMonitor_getCurrentRegionVisitWithError___block_invoke;
  block[3] = &unk_1E69ADE58;
  block[4] = self;
  void block[5] = &v16;
  void block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3) {
    *a3 = (id) v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __50__ENRegionMonitor_getCurrentRegionVisitWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _getCurrentRegionVisitWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)getAllRegionVisitsWithError:(id *)a3
{
  uint64_t v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__4;
  uint64_t v14 = __Block_byref_object_dispose__4;
  id v15 = 0;
  id v6 = [(ENRegionMonitor *)self regionMonitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ENRegionMonitor_getAllRegionVisitsWithError___block_invoke;
  block[3] = &unk_1E69ADE58;
  block[4] = self;
  void block[5] = &v16;
  void block[6] = &v10;
  dispatch_sync(v6, block);

  if (a3) {
    *a3 = (id) v11[5];
  }
  id v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __47__ENRegionMonitor_getAllRegionVisitsWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 _getAllRegionVisitsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)_getAllRegionVisitsWithError:(id *)a3
{
  uint64_t v5 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v5);

  if ([(ENRegionMonitor *)self authorizationState] == 2)
  {
    id v6 = [(ENRegionHistoryManager *)self->_regionHistoryManager getAllRegionVisits];
  }
  else
  {
    if (a3)
    {
      ENErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory__ENRegionMonitor <= 90
      && (gLogCategory__ENRegionMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    id v6 = 0;
  }

  return v6;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(ENRegionMonitor *)self exposureNotificationLocationManager];

  if (v5 == v8)
  {
    -[ENRegionMonitor setExposureNotificationAuthorizationState:](self, "setExposureNotificationAuthorizationState:", objc_msgSend((id)objc_opt_class(), "regionMonitorStateFromAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus")));
  }
  else
  {
    id v6 = [(ENRegionMonitor *)self significantLocationsLocationManager];

    if (v6 == v8) {
      -[ENRegionMonitor setSignificantLocationsAuthorizationState:](self, "setSignificantLocationsAuthorizationState:", objc_msgSend((id)objc_opt_class(), "regionMonitorStateFromAuthorizationStatus:", objc_msgSend(v8, "authorizationStatus")));
    }
  }
  if (gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    id v7 = objc_msgSend((id)objc_opt_class(), "locationAuthorizationStatusToString:", objc_msgSend(v8, "authorizationStatus"));
    LogPrintF_safe();
  }
}

- (void)currentRegionVisitDidChange:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ENRegionMonitor *)self regionMonitorQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v6 = [v5 isSensitiveLoggingAllowed];

  if (v6
    && gLogCategory_ENRegionMonitor <= 30
    && (gLogCategory_ENRegionMonitor != -1 || _LogCategory_Initialize()))
  {
    id v7 = v8;
    LogPrintF_safe();
  }
  -[ENRegionMonitor setCurrentRegionVisit:](self, "setCurrentRegionVisit:", v8, v7);
}

- (unint64_t)exposureNotificationAuthorizationState
{
  return self->_exposureNotificationAuthorizationState;
}

- (unint64_t)significantLocationsAuthorizationState
{
  return self->_significantLocationsAuthorizationState;
}

- (ENRegionMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENRegionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ENRegionTestDataSource)testRegionDataSource
{
  return self->_testRegionDataSource;
}

- (void)setTestRegionDataSource:(id)a3
{
}

- (ENRegionMonitorTelephonyDataSource)telephonyDataSource
{
  return self->_telephonyDataSource;
}

- (void)setTelephonyDataSource:(id)a3
{
}

- (ENRegionMonitorCoreLocationDataSource)coreLocationDataSource
{
  return self->_coreLocationDataSource;
}

- (void)setCoreLocationDataSource:(id)a3
{
}

- (void)setRegionMonitorQueue:(id)a3
{
}

- (CLLocationManager)exposureNotificationLocationManager
{
  return self->_exposureNotificationLocationManager;
}

- (void)setExposureNotificationLocationManager:(id)a3
{
}

- (CLLocationManager)significantLocationsLocationManager
{
  return self->_significantLocationsLocationManager;
}

- (void)setSignificantLocationsLocationManager:(id)a3
{
}

- (BOOL)monitoringEnabled
{
  return self->_monitoringEnabled;
}

- (void)setRegionHistoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionHistoryManager, 0);
  objc_storeStrong((id *)&self->_significantLocationsLocationManager, 0);
  objc_storeStrong((id *)&self->_exposureNotificationLocationManager, 0);
  objc_storeStrong((id *)&self->_regionMonitorQueue, 0);
  objc_storeStrong((id *)&self->_coreLocationDataSource, 0);
  objc_storeStrong((id *)&self->_telephonyDataSource, 0);
  objc_storeStrong((id *)&self->_testRegionDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentRegionVisit, 0);
}

@end