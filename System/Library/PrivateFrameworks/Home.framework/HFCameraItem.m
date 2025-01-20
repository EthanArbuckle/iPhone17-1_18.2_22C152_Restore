@interface HFCameraItem
+ (BOOL)cameraContainsMotionServiceItem:(id)a3;
+ (BOOL)shouldIgnoreStreamErrorForCameraSettings:(id)a3;
+ (BOOL)shouldReportNotificationsAsDisabledForProfile:(id)a3;
+ (void)getErrorDescription:(id *)a3 detailedErrorDescription:(id *)a4 forCameraStreamError:(id)a5;
- (BOOL)isCompoundItem;
- (NSString)description;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)numberOfCompoundItems;
@end

@implementation HFCameraItem

id __44__HFCameraItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [WeakRetained profile];
  v7 = [v6 userSettings];
  if ([v7 currentAccessMode])
  {
    v8 = [WeakRetained profile];
    v9 = [v8 accessory];
    int v10 = [v9 isReachable];

    if (v10) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }

  v12 = [NSNumber numberWithInteger:v11];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12);

  v13 = (void *)MEMORY[0x263EFFA08];
  v14 = [WeakRetained profile];
  v15 = [v14 accessory];
  v16 = [WeakRetained profile];
  v17 = [WeakRetained profile];
  v18 = [v17 userSettings];
  v19 = objc_msgSend(v13, "setWithObjects:", v15, v16, v18, 0);
  [v5 setObject:v19 forKeyedSubscript:@"dependentHomeKitObjects"];

  v20 = &HFCAPackageStateOn;
  if (v11 != 2) {
    v20 = &HFCAPackageStateOff;
  }
  v21 = *v20;
  v22 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierIPCamera" state:v21];
  [v5 setObject:v22 forKeyedSubscript:@"icon"];

  v23 = [WeakRetained profile];
  v24 = [v23 snapshotControl];
  v25 = [v24 mostRecentSnapshot];
  [v5 setObject:v25 forKeyedSubscript:@"HFResultCameraSnapshotKey"];

  v26 = NSNumber;
  v27 = [WeakRetained profile];
  v28 = [v27 streamControl];
  v29 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "streamState"));
  [v5 setObject:v29 forKeyedSubscript:@"HFResultCameraStreamStateKey"];

  v30 = NSNumber;
  v31 = [WeakRetained profile];
  v32 = [v31 userSettings];
  v33 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v32, "currentAccessMode"));
  [v5 setObject:v33 forKeyedSubscript:@"HFResultCameraCurrentAccessModeKey"];

  v34 = [WeakRetained profile];
  v35 = [v34 streamControl];
  v36 = [v35 cameraStream];

  if (v36)
  {
    [v5 setObject:v36 forKeyedSubscript:@"HFResultCameraStreamKey"];
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "audioStreamSetting"));
    [v5 setObject:v37 forKeyedSubscript:@"HFResultCameraAudioStreamSettingKey"];
  }
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    v38 = [WeakRetained accessory];
    v39 = [v38 name];
    v40 = +[HFDemoModeAccessoryManager demoSnapshotURLForCameraName:v39];

    v41 = [WeakRetained accessory];
    v42 = [v41 name];
    v43 = +[HFDemoModeAccessoryManager demoLiveStreamURLForCameraName:v42];

    [v5 setObject:v40 forKeyedSubscript:@"HFResultCameraDemoSnapshotURLKey"];
    [v5 setObject:v43 forKeyedSubscript:@"HFResultCameraDemoLiveStreamURLKey"];
    v44 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v62 = v40;
      __int16 v63 = 2112;
      v64 = v43;
      _os_log_impl(&dword_20B986000, v44, OS_LOG_TYPE_DEFAULT, "Snapshot:%@ and movie:%@", buf, 0x16u);
    }
  }
  if (+[HFUtilities shouldSuppressAllErrorsForDemo])
  {
    v45 = &unk_26C0F78F0;
    v46 = v5;
    v47 = @"state";
LABEL_18:
    [v46 setObject:v45 forKeyedSubscript:v47];
    goto LABEL_23;
  }
  v48 = [WeakRetained profile];
  v49 = [v48 userSettings];
  BOOL v50 = +[HFCameraItem shouldIgnoreStreamErrorForCameraSettings:v49];

  if (v50)
  {
    v47 = @"persistentWarningDescription";
    v46 = v5;
    v45 = 0;
    goto LABEL_18;
  }
  v51 = [WeakRetained profile];
  v52 = objc_msgSend(v51, "hf_cameraManager");
  v53 = [v52 cachedStreamError];

  if (v53 && [v53 code] != 23)
  {
    id v59 = 0;
    v60 = 0;
    [(id)objc_opt_class() getErrorDescription:&v60 detailedErrorDescription:&v59 forCameraStreamError:v53];
    v54 = v60;
    id v55 = v59;
    id v56 = v54;
    [v5 setObject:v56 forKeyedSubscript:@"errorDescription"];
    [v5 setObject:v55 forKeyedSubscript:@"longErrorDescription"];

    [v5 setObject:&unk_26C0F7908 forKeyedSubscript:@"badge"];
  }

LABEL_23:
  v57 = [MEMORY[0x263F58190] futureWithResult:v5];

  return v57;
}

+ (BOOL)shouldIgnoreStreamErrorForCameraSettings:(id)a3
{
  id v3 = a3;
  if ([v3 currentAccessMode]) {
    BOOL v4 = [v3 currentAccessMode] == 3;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFAccessoryProfileItem *)self profile];
  v6 = [v5 accessory];
  if (v6)
  {
    v7 = [(HFAccessoryProfileItem *)self valueSource];

    if (v7)
    {
      objc_initWeak((id *)location, self);
      v20.receiver = self;
      v20.super_class = (Class)HFCameraItem;
      v8 = [(HFAccessoryProfileItem *)&v20 _subclass_updateWithOptions:v4];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __44__HFCameraItem__subclass_updateWithOptions___block_invoke;
      v18[3] = &unk_26408FB70;
      objc_copyWeak(&v19, (id *)location);
      v9 = [v8 flatMap:v18];
      objc_destroyWeak(&v19);

      objc_destroyWeak((id *)location);
      goto LABEL_8;
    }
  }
  else
  {
  }
  int v10 = HFLogForCategory(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(HFAccessoryProfileItem *)self profile];
    v12 = [v11 accessory];
    v13 = [(HFAccessoryProfileItem *)self valueSource];
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v12;
    __int16 v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Camera Item: Missing profile accessory:%@ or value source:%@", location, 0x16u);
  }
  v14 = (void *)MEMORY[0x263F58190];
  v21 = @"hidden";
  uint64_t v22 = MEMORY[0x263EFFA88];
  v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v16 = +[HFItemUpdateOutcome outcomeWithResults:v15];
  v9 = [v14 futureWithResult:v16];

LABEL_8:
  return v9;
}

- (NSString)description
{
  if (+[HFUtilities hasInternalDiagnostics])
  {
    id v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(HFAccessoryProfileItem *)self profile];
    v7 = objc_msgSend(v6, "hf_prettyDescription");
    v8 = [(HFItem *)self latestResults];
    id v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];
  }
  else
  {
    if (_MergedGlobals_306 != -1) {
      dispatch_once(&_MergedGlobals_306, &__block_literal_global_22_9);
    }
    id v9 = (id)qword_26AB2FBE8;
  }
  return (NSString *)v9;
}

void __27__HFCameraItem_description__block_invoke_2()
{
  v0 = (void *)qword_26AB2FBE8;
  qword_26AB2FBE8 = (uint64_t)&stru_26C081158;
}

+ (void)getErrorDescription:(id *)a3 detailedErrorDescription:(id *)a4 forCameraStreamError:(id)a5
{
  id v13 = a5;
  v7 = _HFLocalizedStringWithDefaultValue(@"HFCameraErrorNotReachable", @"HFCameraErrorNotReachable", 1);
  v8 = _HFLocalizedStringWithDefaultValue(@"HFCameraLongFormErrorNotReachable", @"HFCameraLongFormErrorNotReachable", 1);
  id v9 = [v13 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0C710]];

  if (v10 && [v13 code] == 14)
  {
    uint64_t v11 = _HFLocalizedStringWithDefaultValue(@"HFCameraErrorBusy", @"HFCameraErrorBusy", 1);

    uint64_t v12 = _HFLocalizedStringWithDefaultValue(@"HFCameraLongFormErrorBusy", @"HFCameraLongFormErrorBusy", 1);

    v7 = (void *)v11;
    v8 = (void *)v12;
  }
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = v8;
  }
}

+ (BOOL)cameraContainsMotionServiceItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v4 services];
  char v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_45_2);

  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8;
  }

  return v9;
}

uint64_t __48__HFCameraItem_cameraContainsMotionServiceItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isCameraContainedMotionSensor");
}

+ (BOOL)shouldReportNotificationsAsDisabledForProfile:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HFLogForCategory(0xEuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 userSettings];
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "cameraProfile userSettings = %@", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [v3 userSettings];
  if ([v6 isAccessModeChangeNotificationEnabled])
  {
    char v7 = 1;
  }
  else
  {
    char v8 = [v3 userSettings];
    if ([v8 isReachabilityEventNotificationEnabled])
    {
      char v7 = 1;
    }
    else
    {
      BOOL v9 = objc_msgSend(v3, "hf_userNotificationSettings");
      char v7 = [v9 areNotificationsEnabled];
    }
  }

  return v7 ^ 1;
}

- (BOOL)isCompoundItem
{
  return [(HFCameraItem *)self numberOfCompoundItems] != 0;
}

- (unint64_t)numberOfCompoundItems
{
  v2 = [(HFAccessoryProfileItem *)self accessory];
  id v3 = objc_msgSend(v2, "hf_visibleServices");
  unint64_t v4 = [v3 count];

  return v4;
}

@end