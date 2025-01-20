@interface HFMediaAccessoryItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)_hasOnboarded;
- (BOOL)_isDumbSpeaker;
- (BOOL)_isHAPCapableSpeaker;
- (BOOL)_isInstallingSoftwareUpdate;
- (BOOL)_shouldDecorateDiagnosticInfoWithKeys:(id)a3 cdpStatusGood:(BOOL)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)allowsAppleMusicAccount;
- (BOOL)containsActions;
- (BOOL)isAirPort;
- (BOOL)isAnnounceEnabled;
- (BOOL)isAppleTV;
- (BOOL)isAudioAnalysisEnabled;
- (BOOL)isAudioReceiver;
- (BOOL)isContainedWithinMediaSystem;
- (BOOL)isDoorbellChimeEnabled;
- (BOOL)isHomePod;
- (BOOL)isHomePodAndIsInMediaSystem;
- (BOOL)isHomePodMediaSystem;
- (BOOL)isHomePodStereoPair;
- (BOOL)isItemGroup;
- (BOOL)isItemInActionBuilder;
- (BOOL)isSiriDisabled;
- (BOOL)isSiriEndpointAccessory;
- (BOOL)isStandaloneHomePod;
- (BOOL)shouldShowMutedMicIcon;
- (BOOL)supportsAlarmQuickControls;
- (BOOL)supportsCoordinationForAlarmsAndTimers;
- (BOOL)supportsDirectObliteration;
- (BOOL)supportsMediaAction;
- (BOOL)supportsMediaQuickControls;
- (BOOL)supportsMultiUser;
- (BOOL)supportsPlaybackState;
- (BOOL)supportsSoftwareUpdate;
- (BOOL)supportsTimerQuickControls;
- (HFAccessoryRepresentable)accessoryRepresentableObject;
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)homeKitObject;
- (HFHomeKitSettingsVendor)homeKitSettingsVendor;
- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager;
- (HFMediaAccessoryItem)init;
- (HFMediaAccessoryItem)initWithValueSource:(id)a3 homeKitObject:(id)a4;
- (HFMediaAccessoryItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFMediaValueSource)mediaValueSource;
- (HMHome)home;
- (NSSet)accessoriesSupportingSoftwareUpdate;
- (NSSet)services;
- (NSString)description;
- (id)_decorateWithDiagnosticInfoKeys:(id)a3 cdpStatusGood:(BOOL)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)enableDoorbellChime:(BOOL)a3;
- (id)iconDescriptor:(id)a3;
- (id)mediaProfileContainers;
- (id)namingComponentForHomeKitObject;
- (id)performStandardUpdateWithOptions:(id)a3;
- (id)profiles;
- (id)room;
- (id)serviceLikeBuilderInHome:(id)a3;
- (id)serviceNameComponents;
- (id)setEnableAnnounce:(BOOL)a3;
- (id)setEnableAudioAnalysis:(BOOL)a3;
- (id)setSiriDisabled:(BOOL)a3;
- (id)settings;
- (int64_t)mediaAccessoryItemType;
- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3;
- (unint64_t)homePodVariant;
- (unint64_t)numberOfItemsContainedWithinGroup;
- (unint64_t)preferredActionOnTap:(id)a3;
- (void)_decorateOutcomeWithAccessorySpecificKeys:(id)a3;
- (void)_decorateServiceLikeItemKeys:(id)a3;
- (void)_decorateSettingsSyncKeys:(id)a3;
- (void)_decorateWithMediaSessionKeys:(id)a3;
- (void)_decorateWithMediaSystemSpecificKeys:(id)a3;
- (void)_decorateWithSiriEndpointProfileSpecificKeys:(id)a3;
- (void)_decorateWithSoftwareUpdateStateKeys:(id)a3;
- (void)_decorateWithSymptomFixInFlightKeys:(id)a3;
- (void)setIsItemInActionBuilder:(BOOL)a3;
@end

@implementation HFMediaAccessoryItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v8 = objc_msgSend(v6, "hf_homeKitObject");
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = HFLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v6, "hf_homeKitObject");
    v13 = objc_msgSend(v6, "hf_containedProfiles");
    int v20 = 136316162;
    v21 = "+[HFMediaAccessoryItem(RepresentableItem) itemWithAccessoryRepresentableObject:valueSource:]";
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    v25 = v12;
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "(%s) object: %@, homeKitObject: %@, accessory: %@, containedProfiles: %@", (uint8_t *)&v20, 0x34u);
  }
  if (v10)
  {
    v14 = [v10 mediaProfile];
    if (v14)
    {
      id v15 = objc_alloc((Class)a1);
      v16 = [v10 mediaProfile];
      v17 = (void *)[v15 initWithValueSource:v7 mediaProfileContainer:v16];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    id v18 = objc_alloc((Class)a1);
    v14 = objc_msgSend(v6, "hf_homeKitObject");
    v17 = (void *)[v18 initWithValueSource:v7 mediaProfileContainer:v14];
  }

  return v17;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  if ([v3 conformsToProtocol:&unk_26C0FB658]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    id v7 = [(HFMediaAccessoryItem *)self accessories];
    id v6 = [v7 anyObject];
  }
  return (HFAccessoryRepresentable *)v6;
}

- (HFMediaAccessoryItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithValueSource_mediaProfileContainer_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessoryItem.m", 82, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessoryItem init]",
    v5);

  return 0;
}

- (HFMediaAccessoryItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"HFMediaAccessoryItem.m", 87, @"Invalid parameter not satisfying: %@", @"valueSource" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"HFMediaAccessoryItem.m", 88, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];

LABEL_3:
  v50.receiver = self;
  v50.super_class = (Class)HFMediaAccessoryItem;
  v11 = [(HFMediaAccessoryItem *)&v50 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_45;
  }
  objc_storeStrong((id *)&v11->_valueSource, a3);
  v13 = &unk_26C155B48;
  id v14 = v10;
  id v15 = v14;
  if (!v10) {
    goto LABEL_10;
  }
  if ([v14 conformsToProtocol:v13]) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  v17 = (HFMediaProfileContainer *)v15;
  if (!v16)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    int v20 = NSStringFromProtocol((Protocol *)v13);
    [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v20 file lineNumber description];

LABEL_10:
    v17 = 0;
  }

  mediaProfileContainer = v12->_mediaProfileContainer;
  v12->_mediaProfileContainer = v17;

  __int16 v22 = &unk_26C12B8A0;
  id v23 = v15;
  __int16 v24 = v23;
  if (!v10)
  {
LABEL_17:
    __int16 v26 = 0;
    goto LABEL_18;
  }
  if ([v23 conformsToProtocol:v22]) {
    v25 = v24;
  }
  else {
    v25 = 0;
  }
  __int16 v26 = (HFHomeKitSettingsVendor *)v24;
  if (!v25)
  {
    id v27 = [MEMORY[0x263F08690] currentHandler];
    __int16 v28 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v29 = NSStringFromProtocol((Protocol *)v22);
    [v27 handleFailureInFunction:v28, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v29 file lineNumber description];

    goto LABEL_17;
  }
LABEL_18:

  homeKitSettingsVendor = v12->_homeKitSettingsVendor;
  v12->_homeKitSettingsVendor = v26;

  v31 = &unk_26C1141D8;
  id v32 = v24;
  v33 = v32;
  if (v10)
  {
    if ([v32 conformsToProtocol:v31]) {
      v34 = v33;
    }
    else {
      v34 = 0;
    }
    v35 = (HFHomeKitObject *)v33;
    if (v34) {
      goto LABEL_25;
    }
    v36 = [MEMORY[0x263F08690] currentHandler];
    v37 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v38 = NSStringFromProtocol((Protocol *)v31);
    [v36 handleFailureInFunction:v37, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v38 file lineNumber description];
  }
  v35 = 0;
LABEL_25:

  homeKitObject = v12->_homeKitObject;
  v12->_homeKitObject = v35;

  if ([(HFMediaAccessoryItem *)v12 isAppleTV])
  {
    uint64_t v40 = 1;
  }
  else if ([(HFMediaAccessoryItem *)v12 isStandaloneHomePod])
  {
    uint64_t v40 = 2;
  }
  else if ([(HFMediaAccessoryItem *)v12 isHomePodAndIsInMediaSystem])
  {
    uint64_t v40 = 3;
  }
  else if ([(HFMediaAccessoryItem *)v12 isHomePodStereoPair])
  {
    uint64_t v40 = 4;
  }
  else if ([(HFMediaAccessoryItem *)v12 isAirPort])
  {
    uint64_t v40 = 7;
  }
  else if ([(HFMediaAccessoryItem *)v12 isAudioReceiver])
  {
    uint64_t v40 = 8;
  }
  else if ([(HFMediaAccessoryItem *)v12 _isHAPCapableSpeaker])
  {
    uint64_t v40 = 6;
  }
  else if ([(HFMediaAccessoryItem *)v12 _isDumbSpeaker])
  {
    v41 = HFLogForCategory(0x3DuLL);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      BOOL v45 = [(HFMediaAccessoryItem *)v12 isSiriEndpointAccessory];
      v46 = [(HFMediaAccessoryItem *)v12 accessories];
      v47 = [v46 anyObject];
      v48 = [v47 mediaProfile];
      v49 = objc_msgSend(v48, "hf_siriLanguageOptionsManager");
      *(_DWORD *)buf = 67109378;
      BOOL v52 = v45;
      __int16 v53 = 2112;
      v54 = v49;
      _os_log_debug_impl(&dword_20B986000, v41, OS_LOG_TYPE_DEBUG, "isSiriEndPoint %{BOOL}d siriLanguageOptionsManager = %@", buf, 0x12u);
    }
    uint64_t v40 = 5;
  }
  else
  {
    uint64_t v40 = 0;
  }
  v12->_mediaAccessoryItemType = v40;
LABEL_45:

  return v12;
}

- (HFMediaAccessoryItem)initWithValueSource:(id)a3 homeKitObject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HFMediaAccessoryItem.m", 152, @"Invalid parameter not satisfying: %@", @"homeKitObject" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  __int16 v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"HFMediaAccessoryItem.m", 153, @"Invalid parameter not satisfying: %@", @"valueSource" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = v9;
  if ([v12 conformsToProtocol:&unk_26C155B48]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = [v11 mediaProfile];
  v16 = (void *)v15;
  if (v15) {
    v17 = (void *)v15;
  }
  else {
    v17 = v14;
  }
  id v18 = &unk_26C155B48;
  id v19 = v17;
  int v20 = v19;
  if (!v19) {
    goto LABEL_18;
  }
  if ([v19 conformsToProtocol:v18]) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  __int16 v22 = v20;
  if (!v21)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    id v23 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    __int16 v24 = NSStringFromProtocol((Protocol *)v18);
    [v29 handleFailureInFunction:v23, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v24 file lineNumber description];

LABEL_18:
    __int16 v22 = 0;
  }

  v25 = [(HFMediaAccessoryItem *)self initWithValueSource:v7 mediaProfileContainer:v22];
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFMediaAccessoryItem *)self valueSource];
  id v5 = [(HFMediaAccessoryItem *)self copyWithValueSource:v4];

  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v5 = objc_msgSend(v4, "hf_prettyDescription");
  id v6 = (id)[v3 appendObject:v5 withName:@"mediaProfile"];

  id v7 = [(HFItem *)self latestResults];
  id v8 = [v7 objectForKey:@"childItems"];
  id v9 = (id)[v3 appendObject:v8 withName:@"controlItems"];

  id v10 = [v3 build];

  return (NSString *)v10;
}

- (HFMediaValueSource)mediaValueSource
{
  v3 = [(HFMediaAccessoryItem *)self valueSource];
  if ([v3 conformsToProtocol:&unk_26C11D330]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    id v7 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    objc_msgSend(v7, "hf_mediaValueSource");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (HFMediaValueSource *)v6;
}

- (id)createControlItemsWithOptions:(id)a3
{
  v4 = objc_opt_new();
  if ([(HFMediaAccessoryItem *)self supportsMediaQuickControls])
  {
    id v5 = [HFMediaControlItem alloc];
    id v6 = [(HFMediaAccessoryItem *)self mediaValueSource];
    id v7 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    id v8 = [(HFMediaControlItem *)v5 initWithValueSource:v6 mediaProfileContainer:v7 mediaAccessoryItemType:[(HFMediaAccessoryItem *)self mediaAccessoryItemType] displayResults:0];
    objc_msgSend(v4, "na_safeAddObject:", v8);
  }
  id v9 = [(HFMediaAccessoryItem *)self home];
  int v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  if (v10)
  {
    if ([(HFMediaAccessoryItem *)self supportsAlarmQuickControls])
    {
      id v11 = [HFHomePodAlarmControlItem alloc];
      id v12 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      v13 = [(HFHomePodAlarmControlItem *)v11 initWithMediaProfileContainer:v12 displayResults:0];
      objc_msgSend(v4, "na_safeAddObject:", v13);
    }
    if ([(HFMediaAccessoryItem *)self supportsTimerQuickControls])
    {
      id v14 = [HFHomePodTimerControlItem alloc];
      uint64_t v15 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      v16 = [(HFHomePodTimerControlItem *)v14 initWithMediaProfileContainer:v15 displayResults:0];
      objc_msgSend(v4, "na_safeAddObject:", v16);
    }
  }
  return v4;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaAccessoryItem *)self performStandardUpdateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26409C508;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  id v7 = [v5 flatMap:v9];

  return v7;
}

id __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  id v4 = HFItemUpdateOptionActionBuilders;
  id v5 = a2;
  id v6 = [v3 objectForKeyedSubscript:v4];
  uint64_t v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_229);

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v9 = [v8 BOOLValue];

  v79 = (void *)v7;
  [*(id *)(a1 + 40) setIsItemInActionBuilder:v7 != 0];
  id v10 = [HFMutableItemUpdateOutcome alloc];
  id v11 = [v5 standardResults];

  id v12 = [(HFItemUpdateOutcome *)v10 initWithResults:v11];
  v13 = [*(id *)(a1 + 40) mediaProfileContainer];
  [(HFMutableItemUpdateOutcome *)v12 setObject:v13 forKeyedSubscript:@"HFMediaAccessoryItemProfileContainerKey"];

  id v14 = [*(id *)(a1 + 40) mediaProfileContainer];
  [(HFMutableItemUpdateOutcome *)v12 setObject:v14 forKeyedSubscript:@"HFResultHomeKitSettingsVendorKey"];

  uint64_t v15 = [*(id *)(a1 + 40) mediaProfileContainer];
  v16 = objc_msgSend(v15, "hf_mediaRouteIdentifier");
  if (v16)
  {
    [(HFMutableItemUpdateOutcome *)v12 setObject:v16 forKeyedSubscript:@"HFResultMediaRouteIdentifierKey"];
  }
  else
  {
    v17 = [MEMORY[0x263EFF9D0] null];
    [(HFMutableItemUpdateOutcome *)v12 setObject:v17 forKeyedSubscript:@"HFResultMediaRouteIdentifierKey"];
  }
  id v18 = +[HFExecutionEnvironment sharedInstance];
  if ([v18 hostProcess] == 100)
  {
  }
  else
  {
    id v19 = +[HFExecutionEnvironment sharedInstance];
    uint64_t v20 = [v19 hostProcess];

    if (v20 != 3) {
      goto LABEL_9;
    }
  }
  if (!+[HFUtilities isDeviceUnlocked]) {
    [(HFMutableItemUpdateOutcome *)v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isDisabled"];
  }
LABEL_9:
  [*(id *)(a1 + 40) _decorateServiceLikeItemKeys:v12];
  if (v9) {
    [(HFMutableItemUpdateOutcome *)v12 setObject:&unk_26C0F7D70 forKeyedSubscript:@"state"];
  }
  else {
    [*(id *)(a1 + 40) _decorateWithMediaSessionKeys:v12];
  }
  [*(id *)(a1 + 40) _decorateOutcomeWithAccessorySpecificKeys:v12];
  [*(id *)(a1 + 40) _decorateWithMediaSystemSpecificKeys:v12];
  [*(id *)(a1 + 40) _decorateWithSiriEndpointProfileSpecificKeys:v12];
  v21 = [*(id *)(a1 + 40) mediaProfileContainer];
  if (objc_msgSend(v21, "hf_isReachable"))
  {
    __int16 v22 = [*(id *)(a1 + 40) mediaProfileContainer];
    char v23 = [v22 hasValidSettings];

    if ((v23 & 1) == 0) {
      [*(id *)(a1 + 40) _decorateSettingsSyncKeys:v12];
    }
  }
  else
  {
  }
  if ([*(id *)(a1 + 40) isHomePod])
  {
    __int16 v24 = +[HFMediaAccessoryUtility sharedInstance];
    v25 = [*(id *)(a1 + 40) mediaProfileContainer];
    __int16 v26 = objc_msgSend(v25, "hf_backingAccessory");
    id v27 = [v26 uniqueIdentifier];
    __int16 v28 = [v27 UUIDString];
    int v29 = [v24 isHomePodRestartingCurrently:v28];
  }
  else
  {
    int v29 = 0;
  }
  if ([*(id *)(a1 + 40) isHomePodAndIsInMediaSystem])
  {
    uint64_t v30 = +[HFMediaAccessoryUtility sharedInstance];
    v31 = [*(id *)(a1 + 40) mediaProfileContainer];
    id v32 = [v31 uniqueIdentifier];
    v33 = [v32 UUIDString];
    int v34 = [v30 isHomePodRestartingCurrently:v33];

    int v35 = v34 ^ 1;
    if (!v29) {
      goto LABEL_21;
    }
LABEL_24:
    v36 = HFLogForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v73 = [*(id *)(a1 + 40) mediaProfileContainer];
      v74 = objc_msgSend(v73, "hf_backingAccessory");
      v75 = [v74 uniqueIdentifier];
      *(_DWORD *)buf = 136315394;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      __int16 v84 = 2112;
      v85 = v75;
      _os_log_debug_impl(&dword_20B986000, v36, OS_LOG_TYPE_DEBUG, "%s container is a solo HomePod that's restarting (uuid: %@)", buf, 0x16u);
    }
    v37 = HFLogForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v76 = [*(id *)(a1 + 40) mediaProfileContainer];
      v77 = [v76 uniqueIdentifier];
      v78 = [v77 UUIDString];
      *(_DWORD *)buf = 136315394;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      __int16 v84 = 2112;
      v85 = v78;
      _os_log_debug_impl(&dword_20B986000, v37, OS_LOG_TYPE_DEBUG, "%s container is a stereo pair HomePod that's restarting (uuid: %@)", buf, 0x16u);
    }
    if (v9) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  int v35 = 1;
  if (v29) {
    goto LABEL_24;
  }
LABEL_21:
  if (v9) {
    goto LABEL_30;
  }
LABEL_29:
  if (([*(id *)(a1 + 40) isItemInActionBuilder] & v29 ^ 1 | v35) == 1)
  {
LABEL_30:
    v38 = HFLogForCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
      _os_log_debug_impl(&dword_20B986000, v38, OS_LOG_TYPE_DEBUG, "%s Decorating with Software Update State keys", buf, 0xCu);
    }

    [*(id *)(a1 + 40) _decorateWithSoftwareUpdateStateKeys:v12];
    goto LABEL_36;
  }
  v39 = HFLogForCategory(0);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v83 = "-[HFMediaAccessoryItem _subclass_updateWithOptions:]_block_invoke";
    _os_log_debug_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEBUG, "%s NOT decorating with Software Update State keys", buf, 0xCu);
  }

LABEL_36:
  uint64_t v40 = [*(id *)(a1 + 40) createControlItemsWithOptions:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) isItemInActionBuilder])
  {
    v41 = [[HFMediaActionSetting alloc] initWithActionBuilder:v79];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_302;
    v80[3] = &unk_26409C4E0;
    v81 = v41;
    v42 = v41;
    objc_msgSend(v40, "na_each:", v80);
  }
  v43 = [*(id *)(a1 + 40) mediaProfileContainer];
  v44 = [v43 accessories];
  uint64_t v45 = objc_msgSend(v44, "na_any:", &__block_literal_global_307_1) ^ 1;

  id v46 = (id)[*(id *)(a1 + 40) _decorateWithDiagnosticInfoKeys:v12 cdpStatusGood:v45];
  [*(id *)(a1 + 40) _decorateWithSymptomFixInFlightKeys:v12];
  v47 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionPreviousResults];
  v48 = [v47 objectForKeyedSubscript:@"childItems"];
  v49 = v48;
  if (v48)
  {
    id v50 = v48;
  }
  else
  {
    id v50 = [MEMORY[0x263EFFA08] set];
  }
  v51 = v50;

  BOOL v52 = objc_msgSend(v51, "na_setByDiffingWithSet:", v40);
  [(HFMutableItemUpdateOutcome *)v12 setObject:v52 forKeyedSubscript:@"childItems"];
  __int16 v53 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"description"];

  if (v53)
  {
    v54 = (void *)MEMORY[0x263F086A0];
    uint64_t v55 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"description"];
    v56 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"title"];
    v57 = objc_msgSend(v54, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v55, v56);
    v58 = [v57 string];
    [(HFMutableItemUpdateOutcome *)v12 setObject:v58 forKeyedSubscript:@"description"];
  }
  v59 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"controlDescription"];

  if (v59)
  {
    v60 = (void *)MEMORY[0x263F086A0];
    v61 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"controlDescription"];
    v62 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"title"];
    v63 = objc_msgSend(v60, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v61, v62);
    v64 = [v63 string];
    [(HFMutableItemUpdateOutcome *)v12 setObject:v64 forKeyedSubscript:@"controlDescription"];
  }
  v65 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"detailedControlDescription"];

  if (v65)
  {
    v66 = (void *)MEMORY[0x263F086A0];
    v67 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"detailedControlDescription"];
    v68 = [(HFItemUpdateOutcome *)v12 objectForKeyedSubscript:@"title"];
    v69 = objc_msgSend(v66, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:", v67, v68);
    v70 = [v69 string];
    [(HFMutableItemUpdateOutcome *)v12 setObject:v70 forKeyedSubscript:@"detailedControlDescription"];
  }
  v71 = [MEMORY[0x263F58190] futureWithResult:v12];

  return v71;
}

uint64_t __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_302(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = v6;
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;

    [v5 setMediaActionSetting:*(void *)(a1 + 32)];
  }
}

uint64_t __52__HFMediaAccessoryItem__subclass_updateWithOptions___block_invoke_2_304(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 diagnosticInfoManager];
  int v5 = [v4 isCDPStatusGoodForAccessory:v2];

  return v5 ^ 1u;
}

- (id)room
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v3 = objc_msgSend(v2, "hf_parentRoom");

  return v3;
}

- (HFMediaAccessoryCommonSettingsManager)commonSettingsManager
{
  id v2 = [(HFMediaAccessoryItem *)self accessories];
  id v3 = [v2 anyObject];

  id v4 = [v3 mediaProfile];
  int v5 = objc_msgSend(v4, "hf_mediaAccessoryCommonSettingsManager");

  return (HFMediaAccessoryCommonSettingsManager *)v5;
}

- (BOOL)isSiriEndpointAccessory
{
  id v2 = [(HFMediaAccessoryItem *)self accessories];
  id v3 = [v2 anyObject];

  LOBYTE(v2) = objc_msgSend(v3, "hf_isSiriEndpoint");
  return (char)v2;
}

- (BOOL)_hasOnboarded
{
  id v2 = [(HFMediaAccessoryItem *)self accessories];
  id v3 = [v2 anyObject];

  LOBYTE(v2) = objc_msgSend(v3, "hf_needsOnboarding") ^ 1;
  return (char)v2;
}

- (BOOL)isAnnounceEnabled
{
  id v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v4 = objc_msgSend(v3, "hf_settingsValueManager");
  if (![(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    if (v4)
    {
      id v8 = [v3 settings];
      id v6 = objc_msgSend(v8, "hf_accessorySettingAtKeyPath:", @"root.announce.enabled");

      objc_opt_class();
      int v9 = [v4 valueForSetting:v6];
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v7 = v10;

      if (v7)
      {
        LOBYTE(v7) = [v7 BOOLValue];

        id v6 = v9;
      }
      goto LABEL_10;
    }
LABEL_11:
    LOBYTE(v7) = 0;
    goto LABEL_12;
  }
  int v5 = [(HFMediaAccessoryItem *)self commonSettingsManager];
  id v6 = [v5 settingValueForKeyPath:HFAnnounceEnabledKeyPath];

  if (!v6) {
    goto LABEL_11;
  }
  LOBYTE(v7) = [v6 BOOLValue];
LABEL_10:

LABEL_12:
  return (char)v7;
}

- (id)setEnableAnnounce:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v6 = objc_msgSend(v5, "hf_settingsValueManager");
  id v7 = objc_msgSend(v5, "hf_backingAccessory");
  id v8 = [v7 uniqueIdentifier];

  if ([(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    int v9 = [(HFMediaAccessoryItem *)self commonSettingsManager];
    id v10 = objc_msgSend(v5, "hf_backingAccessory");
    id v11 = [v10 home];
    id v12 = [v11 uniqueIdentifier];
    v13 = HFAnnounceEnabledKeyPath;
    id v14 = [NSNumber numberWithBool:v3];
    uint64_t v15 = [v9 updateAccessorySettingWithHomeIdentifier:v12 accessoryIdentifier:v8 keyPath:v13 rawSettingValue:v14];
  }
  else
  {
    v16 = [v5 settings];
    int v9 = objc_msgSend(v16, "hf_accessorySettingAtKeyPath:", @"root.announce.enabled");

    id v10 = [NSNumber numberWithBool:v3];
    if (v6) {
      v17 = v6;
    }
    else {
      v17 = 0;
    }
    uint64_t v15 = [v17 changeValueForSetting:v9 toValue:v10];
  }

  return v15;
}

- (BOOL)isAudioAnalysisEnabled
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v4 = objc_msgSend(v3, "hf_settingsValueManager");
  if (![(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    if (v4)
    {
      id v8 = [v3 settings];
      id v6 = objc_msgSend(v8, "hf_accessorySettingAtKeyPath:", @"root.audioAnalysis.enabled");

      objc_opt_class();
      int v9 = [v4 valueForSetting:v6];
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v7 = v10;

      id v11 = HFLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        id v14 = "-[HFMediaAccessoryItem isAudioAnalysisEnabled]";
        __int16 v15 = 2112;
        v16 = v6;
        __int16 v17 = 2112;
        id v18 = v3;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%s audioAnalysisEnabledSetting = %@ for mediaProfileContainer = %@", (uint8_t *)&v13, 0x20u);
      }

      if (v7)
      {
        LOBYTE(v7) = [v7 BOOLValue];

        id v6 = v9;
      }
      goto LABEL_12;
    }
LABEL_13:
    LOBYTE(v7) = 0;
    goto LABEL_14;
  }
  int v5 = [(HFMediaAccessoryItem *)self commonSettingsManager];
  id v6 = [v5 settingValueForKeyPath:HFAudioAnalysisEnabledKeyPath];

  if (!v6) {
    goto LABEL_13;
  }
  LOBYTE(v7) = [v6 BOOLValue];
LABEL_12:

LABEL_14:
  return (char)v7;
}

- (id)setEnableAudioAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v6 = objc_msgSend(v5, "hf_settingsValueManager");
  id v7 = objc_msgSend(v5, "hf_backingAccessory");
  id v8 = [v7 uniqueIdentifier];

  if ([(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    int v9 = [(HFMediaAccessoryItem *)self commonSettingsManager];
    id v10 = objc_msgSend(v5, "hf_backingAccessory");
    id v11 = [v10 home];
    id v12 = [v11 uniqueIdentifier];
    int v13 = HFAudioAnalysisEnabledKeyPath;
    id v14 = [NSNumber numberWithBool:v3];
    __int16 v15 = [v9 updateAccessorySettingWithHomeIdentifier:v12 accessoryIdentifier:v8 keyPath:v13 rawSettingValue:v14];
  }
  else
  {
    v16 = [v5 settings];
    int v9 = objc_msgSend(v16, "hf_accessorySettingAtKeyPath:", @"root.audioAnalysis.enabled");

    id v10 = [NSNumber numberWithBool:v3];
    __int16 v15 = [v6 changeValueForSetting:v9 toValue:v10];
  }

  return v15;
}

- (id)profiles
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = [v2 mediaProfiles];

  return v3;
}

- (id)settings
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = [v2 settings];

  return v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  int v5 = [(HFMediaAccessoryItem *)self homeKitObject];
  if ([v5 conformsToProtocol:&unk_26C155B48]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValueSource:v4 mediaProfileContainer:v7];
  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (unint64_t)_effectiveLoadingStateForSuggestedLoadingState:(unint64_t)a3
{
  int v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v6 = objc_msgSend(v5, "hf_settingsValueManager");

  id v7 = [v6 pendingWrites];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    a3 = 2;
  }
  else
  {
    int v9 = [(HFMediaAccessoryItem *)self mediaValueSource];
    id v10 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    id v11 = objc_msgSend(v10, "hf_mediaRouteIdentifier");
    int v12 = [v9 hasPendingWritesForRouteID:v11];

    if (v12) {
      a3 = 2;
    }
  }

  return a3;
}

- (HMHome)home
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_home");

  return (HMHome *)v3;
}

- (NSSet)services
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (id)accessories
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = [v2 accessories];

  return v3;
}

- (id)mediaProfileContainers
{
  id v2 = [(HFMediaAccessoryItem *)self profiles];
  BOOL v3 = [v2 allObjects];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_316);

  return v4;
}

id __46__HFMediaAccessoryItem_mediaProfileContainers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = a3;
  if ([(HFMediaAccessoryItem *)self isHomePodMediaSystem])
  {
    int v5 = [HFMediaSystemBuilder alloc];
    id v6 = [(HFMediaAccessoryItem *)self homeKitObject];
    id v7 = [(HFMediaSystemBuilder *)v5 initWithExistingObject:v6 inHome:v4];
  }
  else
  {
    objc_opt_class();
    uint64_t v8 = [(HFMediaAccessoryItem *)self homeKitObject];
    if (objc_opt_isKindOfClass()) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
    id v6 = v9;

    id v10 = [v6 accessory];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [(HFMediaAccessoryItem *)self homeKitObject];
    }
    id v13 = v12;

    id v7 = [[HFAccessoryBuilder alloc] initWithExistingObject:v13 inHome:v4];
    id v4 = v13;
  }

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  id v2 = [(HFMediaAccessoryItem *)self homeKitObject];
  BOOL v3 = +[HFNamingComponents namingComponentFromHomeKitObject:v2];

  return v3;
}

- (BOOL)isItemGroup
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  unint64_t v3 = [v2 numberOfItemsContainedWithinGroup];

  return v3;
}

- (NSSet)accessoriesSupportingSoftwareUpdate
{
  id v2 = [(HFMediaAccessoryItem *)self accessories];
  unint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_323_1);

  return (NSSet *)v3;
}

uint64_t __59__HFMediaAccessoryItem_accessoriesSupportingSoftwareUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 softwareUpdateController];
  if (v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v2 supportsSoftwareUpdateV2];
  }

  return v4;
}

- (BOOL)allowsAppleMusicAccount
{
  return (unint64_t)([(HFMediaAccessoryItem *)self mediaAccessoryItemType] - 1) < 4;
}

- (BOOL)supportsMediaAction
{
  BOOL v3 = [(HFMediaAccessoryItem *)self allowsAppleMusicAccount];
  if (v3)
  {
    uint64_t v4 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    char v5 = objc_msgSend(v4, "hf_supportsMediaActions");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isHomePodMediaSystem
{
  objc_opt_class();
  BOOL v3 = [(HFMediaAccessoryItem *)self homeKitObject];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)isHomePod
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isHomePod");

  return v4;
}

- (unint64_t)homePodVariant
{
  if ([(HFMediaAccessoryItem *)self isHomePod])
  {
    BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    char v4 = objc_msgSend(v3, "hf_backingAccessory");
    unint64_t v5 = [v4 homePodVariant];
  }
  else
  {
    if (![(HFMediaAccessoryItem *)self isHomePodMediaSystem]) {
      return 0;
    }
    BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    char v4 = [v3 accessories];
    BOOL v6 = [v4 anyObject];
    unint64_t v5 = [v6 homePodVariant];
  }
  return v5;
}

- (BOOL)supportsSoftwareUpdate
{
  if ([(HFMediaAccessoryItem *)self isHomePod]
    || [(HFMediaAccessoryItem *)self isHomePodMediaSystem])
  {
    return 1;
  }
  char v4 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  unint64_t v5 = objc_msgSend(v4, "hf_backingAccessory");
  char v6 = [v5 supportsSoftwareUpdateV2];

  return v6;
}

- (BOOL)supportsMultiUser
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v3 = objc_msgSend(v2, "hf_supportsMultiUser");

  return v3;
}

- (BOOL)isStandaloneHomePod
{
  BOOL v3 = [(HFMediaAccessoryItem *)self isHomePod];
  if (v3) {
    LOBYTE(v3) = ![(HFMediaAccessoryItem *)self isContainedWithinItemGroup];
  }
  return v3;
}

- (BOOL)isHomePodStereoPair
{
  BOOL v3 = [(HFMediaAccessoryItem *)self isHomePodMediaSystem];
  if (v3) {
    LOBYTE(v3) = ![(HFMediaAccessoryItem *)self isContainedWithinItemGroup];
  }
  return v3;
}

- (BOOL)isHomePodAndIsInMediaSystem
{
  BOOL v3 = [(HFMediaAccessoryItem *)self isHomePod];
  if (v3)
  {
    LOBYTE(v3) = [(HFMediaAccessoryItem *)self isContainedWithinMediaSystem];
  }
  return v3;
}

- (BOOL)isContainedWithinMediaSystem
{
  if ([(HFMediaAccessoryItem *)self isHomePodMediaSystem]) {
    return 0;
  }
  char v4 = [(HFMediaAccessoryItem *)self room];
  unint64_t v5 = [v4 home];
  char v6 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v7 = objc_msgSend(v6, "hf_backingAccessory");
  uint64_t v8 = objc_msgSend(v5, "hf_mediaSystemForAccessory:", v7);
  BOOL v3 = v8 != 0;

  return v3;
}

- (BOOL)isAppleTV
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAppleTV");

  return v4;
}

- (BOOL)isAirPort
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAirPortExpressSpeaker");

  return v4;
}

- (BOOL)_isDumbSpeaker
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isDumbSpeaker");

  return v4;
}

- (BOOL)_isHAPCapableSpeaker
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = [v3 mediaProfile];
  BOOL v5 = [v4 capability] == 1;

  return v5;
}

- (BOOL)isAudioReceiver
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isAudioReceiver");

  return v4;
}

- (BOOL)isSiriDisabled
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v4 = objc_msgSend(v3, "hf_settingsValueManager");

  BOOL v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v6 = objc_msgSend(v5, "hf_backingAccessory");
  int v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  if (v7)
  {
    uint64_t v8 = [(HFMediaAccessoryItem *)self commonSettingsManager];
    int v9 = [v8 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];

    if (v9)
    {
      int v10 = [v9 BOOLValue] ^ 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  else if (v4)
  {
    id v11 = [(HFMediaAccessoryItem *)self settings];
    int v9 = objc_msgSend(v11, "hf_accessorySettingAtKeyPath:", @"root.siri.allowHeySiri");

    id v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      int v18 = 138412802;
      uint64_t v19 = v17;
      __int16 v20 = 2080;
      v21 = "-[HFMediaAccessoryItem isSiriDisabled]";
      __int16 v22 = 2112;
      char v23 = v9;
      _os_log_debug_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEBUG, "%@:%s heySiriSetting = %@", (uint8_t *)&v18, 0x20u);
    }
    objc_opt_class();
    id v13 = [v4 valueForSetting:v9];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      int v10 = [v15 BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
LABEL_15:

  return v10;
}

- (id)setSiriDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v6 = objc_msgSend(v5, "hf_backingAccessory");
  int v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

  uint64_t v8 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  int v9 = v8;
  if (v7)
  {
    int v10 = objc_msgSend(v8, "hf_backingAccessory");
    id v11 = [v10 uniqueIdentifier];

    id v12 = [(HFMediaAccessoryItem *)self commonSettingsManager];
    id v13 = [(HFMediaAccessoryItem *)self home];
    id v14 = [v13 uniqueIdentifier];
    id v15 = HFAllowHeySiriSettingKeyPath;
    v16 = [NSNumber numberWithInt:!v3];
    __int16 v17 = [v12 updateAccessorySettingWithHomeIdentifier:v14 accessoryIdentifier:v11 keyPath:v15 rawSettingValue:v16];
  }
  else
  {
    id v11 = objc_msgSend(v8, "hf_settingsValueManager");

    int v18 = [(HFMediaAccessoryItem *)self settings];
    id v12 = objc_msgSend(v18, "hf_accessorySettingAtKeyPath:", @"root.siri.allowHeySiri");

    id v13 = [NSNumber numberWithBool:!v3];
    __int16 v17 = [v11 changeValueForSetting:v12 toValue:v13];
  }

  return v17;
}

- (BOOL)isDoorbellChimeEnabled
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  BOOL v3 = +[HFMediaHelper isDoorbellChimeEnabled:v2];

  return v3;
}

- (id)enableDoorbellChime:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v6 = objc_msgSend(v5, "hf_settingsValueManager");

  int v7 = [(HFMediaAccessoryItem *)self settings];
  uint64_t v8 = objc_msgSend(v7, "hf_accessorySettingAtKeyPath:", @"root.doorbellChime.enabled");

  if (v8 || ![(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    id v12 = [NSNumber numberWithBool:v3];
    uint64_t v19 = [v6 changeValueForSetting:v8 toValue:v12];
  }
  else
  {
    int v9 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    int v10 = objc_msgSend(v9, "hf_backingAccessory");
    id v11 = [v10 mediaProfile];
    id v12 = objc_msgSend(v11, "hf_mediaAccessoryCommonSettingsManager");

    v21 = [(HFMediaAccessoryItem *)self home];
    id v13 = [v21 uniqueIdentifier];
    id v14 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    id v15 = objc_msgSend(v14, "hf_backingAccessory");
    v16 = [v15 identifier];
    __int16 v17 = HFDoorbellChimeEnabledKeyPath;
    int v18 = [NSNumber numberWithBool:v3];
    uint64_t v19 = [v12 updateAccessorySettingWithHomeIdentifier:v13 accessoryIdentifier:v16 keyPath:v17 rawSettingValue:v18];
  }
  return v19;
}

- (BOOL)supportsPlaybackState
{
  unint64_t v2 = [(HFMediaAccessoryItem *)self mediaAccessoryItemType];
  return (v2 > 8) | (0x5Fu >> v2) & 1;
}

- (BOOL)supportsMediaQuickControls
{
  BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v4 = objc_msgSend(v3, "hf_mediaValueSource");

  if (!v4) {
    return 0;
  }
  unint64_t v5 = [(HFMediaAccessoryItem *)self mediaAccessoryItemType];
  if (v5 <= 9) {
    return (0x1F6u >> v5) & 1;
  }
  else {
    return 1;
  }
}

- (BOOL)supportsAlarmQuickControls
{
  return [(HFMediaAccessoryItem *)self isStandaloneHomePod]
      || [(HFMediaAccessoryItem *)self isHomePodStereoPair]
      || [(HFMediaAccessoryItem *)self isSiriEndpointAccessory]
      && [(HFMediaAccessoryItem *)self supportsCoordinationForAlarmsAndTimers];
}

- (BOOL)supportsTimerQuickControls
{
  BOOL v3 = [(HFMediaAccessoryItem *)self supportsCoordinationForAlarmsAndTimers];
  if (v3) {
    LOBYTE(v3) = [(HFMediaAccessoryItem *)self isStandaloneHomePod]
  }
              || [(HFMediaAccessoryItem *)self isHomePodStereoPair]
              || [(HFMediaAccessoryItem *)self isSiriEndpointAccessory]
              && [(HFMediaAccessoryItem *)self supportsCoordinationForAlarmsAndTimers];
  return v3;
}

- (BOOL)supportsCoordinationForAlarmsAndTimers
{
  if ([(HFMediaAccessoryItem *)self isHomePod])
  {
    BOOL v3 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    char v4 = objc_msgSend(v3, "hf_backingAccessory");
    unint64_t v5 = [v4 softwareVersion];
    char v6 = objc_msgSend(v5, "hf_canSupportCoordination");

    return v6;
  }
  else if ([(HFMediaAccessoryItem *)self isHomePodMediaSystem])
  {
    uint64_t v8 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    int v9 = [v8 accessories];
    char v10 = objc_msgSend(v9, "na_all:", &__block_literal_global_326_1);

    return v10;
  }
  else
  {
    return _os_feature_enabled_impl();
  }
}

uint64_t __62__HFMediaAccessoryItem_supportsCoordinationForAlarmsAndTimers__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 softwareVersion];
  uint64_t v3 = objc_msgSend(v2, "hf_canSupportCoordination");

  return v3;
}

- (BOOL)supportsDirectObliteration
{
  if (![(HFMediaAccessoryItem *)self isHomePod] || !_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v3 = [(HFMediaAccessoryItem *)self accessories];
  char v4 = [v3 allObjects];
  unint64_t v5 = [v4 firstObject];

  LOBYTE(v3) = [v5 supportsCompanionInitiatedObliterate];
  return (char)v3;
}

- (void)_decorateOutcomeWithAccessorySpecificKeys:(id)a3
{
  id v11 = a3;
  char v4 = -[HFMediaAccessoryItem iconDescriptor:](self, "iconDescriptor:");
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v7 = v6;

  if ([v7 isSystemImage])
  {
    uint64_t v8 = [v7 imageIdentifier];
    [v11 setObject:v8 forKeyedSubscript:@"iconNames"];
  }
  [v11 setObject:v5 forKeyedSubscript:@"icon"];
  int v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFMediaAccessoryItem preferredActionOnTap:](self, "preferredActionOnTap:", v11));
  [v11 setObject:v9 forKeyedSubscript:@"controlItemPurpose"];

  if ([(HFMediaAccessoryItem *)self shouldShowMutedMicIcon])
  {
    char v10 = [v11 objectForKeyedSubscript:@"descriptionBadge"];

    if (!v10) {
      [v11 setObject:&unk_26C0F7D88 forKeyedSubscript:@"descriptionBadge"];
    }
  }
}

- (BOOL)shouldShowMutedMicIcon
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFMediaAccessoryItem *)self isSiriDisabled];
  int v4 = v3;
  id v5 = HFLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    int v20 = 138413058;
    v21 = v14;
    __int16 v22 = 2080;
    char v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    __int16 v24 = 1024;
    int v25 = v3;
    __int16 v26 = 1024;
    LODWORD(v27) = [(HFMediaAccessoryItem *)self isSiriDisabled];
    _os_log_debug_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEBUG, "%@:%s shouldShowMutedMicIcon = %{BOOL}d AND  self.isSiriDisabled = %{BOOL}d", (uint8_t *)&v20, 0x22u);
  }
  char v6 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  id v7 = [v6 accessories];

  int v8 = objc_msgSend(v7, "na_all:", &__block_literal_global_336_0);
  int v9 = HFLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    v16 = [(HFMediaAccessoryItem *)self home];
    uint64_t v17 = [v16 audioAnalysisClassifierOptions];
    BOOL v18 = [(HFMediaAccessoryItem *)self isAudioAnalysisEnabled];
    int v20 = 138413314;
    v21 = v15;
    __int16 v22 = 2080;
    char v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    __int16 v24 = 1024;
    int v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    __int16 v28 = 1024;
    BOOL v29 = v18;
    _os_log_debug_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEBUG, "%@:%s supportsAudioAnalysis = %{BOOL}d AND self.home.audioAnalysisClassifierOptions = %lu, isAudioAnalysisEnabled = %{BOOL}d", (uint8_t *)&v20, 0x2Cu);
  }
  if (v8)
  {
    char v10 = [(HFMediaAccessoryItem *)self home];
    uint64_t v11 = [v10 audioAnalysisClassifierOptions];

    int v4 = !v11 && v3;
    if (v11 && v3) {
      int v4 = ![(HFMediaAccessoryItem *)self isAudioAnalysisEnabled];
    }
  }
  id v12 = HFLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    int v20 = 138412802;
    v21 = v19;
    __int16 v22 = 2080;
    char v23 = "-[HFMediaAccessoryItem shouldShowMutedMicIcon]";
    __int16 v24 = 1024;
    int v25 = v4;
    _os_log_debug_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEBUG, "%@:%s Returning  shouldShowMutedMicIcon = %{BOOL}d", (uint8_t *)&v20, 0x1Cu);
  }
  return v4;
}

uint64_t __46__HFMediaAccessoryItem_shouldShowMutedMicIcon__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsAudioAnalysis];
}

- (void)_decorateWithSoftwareUpdateStateKeys:(id)a3
{
  id v14 = a3;
  if ([(HFMediaAccessoryItem *)self supportsSoftwareUpdate])
  {
    int v4 = [(HFMediaAccessoryItem *)self valueSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      char v6 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      id v7 = objc_msgSend(v6, "hf_home");
      int v8 = objc_msgSend(v7, "hf_currentUserIsOwner");

      if (v8)
      {
        int v9 = [(HFMediaAccessoryItem *)self accessoriesSupportingSoftwareUpdate];
        char v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_339_2);

        if (([v10 supportsSoftwareUpdateV2] & 1) == 0
          && ![(HFMediaAccessoryItem *)self isHomePod]
          && ![(HFMediaAccessoryItem *)self isHomePodMediaSystem])
        {
LABEL_17:

          goto LABEL_18;
        }
        if (objc_msgSend(v10, "hf_isReadyToInstallSoftwareUpdate"))
        {
          [v14 setObject:&unk_26C0F7DA0 forKeyedSubscript:@"badge"];
          [v14 setObject:&unk_26C0F7DB8 forKeyedSubscript:@"descriptionBadge"];
          uint64_t v11 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionUpdateAvailable", @"HFMediaAccessoryStateDescriptionUpdateAvailable", 1);
          [v14 setObject:v11 forKeyedSubscript:@"detailedControlDescription"];
        }
        if (objc_msgSend(v10, "hf_isInstallingSoftwareUpdate"))
        {
          id v12 = @"HFFirmwareUpdateInstallingDescription";
        }
        else
        {
          if (!objc_msgSend(v10, "hf_isDownloadingSoftwareUpdate"))
          {
LABEL_15:
            if ([v10 supportsSoftwareUpdateV2]) {
              [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasSoftwareUpdateV2Dependency"];
            }
            goto LABEL_17;
          }
          id v12 = @"HFFirmwareUpdateDownloadingDescription";
        }
        id v13 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);
        if (v13)
        {
          [v14 setObject:v13 forKeyedSubscript:@"description"];
          [v14 setObject:v13 forKeyedSubscript:@"detailedControlDescription"];
        }
        goto LABEL_15;
      }
    }
  }
LABEL_18:
}

uint64_t __61__HFMediaAccessoryItem__decorateWithSoftwareUpdateStateKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isReadyToInstallSoftwareUpdate")
    && ([v2 isControllable] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = objc_msgSend(v2, "hf_isSoftwareUpdateInProgress");
  }

  return v3;
}

- (void)_decorateWithMediaSessionKeys:(id)a3
{
  id v19 = a3;
  int v4 = [(HFMediaAccessoryItem *)self mediaValueSource];
  id v5 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  char v6 = objc_msgSend(v5, "hf_mediaRouteIdentifier");
  uint64_t v7 = [v4 lastPlaybackStateForProfileForRouteID:v6];

  int v8 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  int v9 = [v8 mediaProfiles];
  int v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_355_0);

  if ((v10 & 1) != 0 || [(HFMediaAccessoryItem *)self isItemInActionBuilder])
  {
    switch(v7)
    {
      case 0:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder]) {
          goto LABEL_8;
        }
        if (!v10) {
          goto LABEL_10;
        }
        uint64_t v11 = @"HFStatusDescriptionSpeaker_NotPlaying";
        goto LABEL_9;
      case 1:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder]) {
          id v13 = @"HFMediaAccessoryStateControlDescriptionPlay";
        }
        else {
          id v13 = @"HFMediaAccessoryStateDescriptionPlaying";
        }
        uint64_t v7 = 1;
        goto LABEL_26;
      case 3:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder]) {
          id v14 = @"HFMediaAccessoryStateControlDescriptionStop";
        }
        else {
          id v14 = @"HFMediaAccessoryStateDescriptionStopped";
        }
        id v12 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
        uint64_t v7 = 3;
        break;
      case 4:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder])
        {
          id v12 = 0;
        }
        else
        {
          id v12 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionInterrupted", @"HFMediaAccessoryStateDescriptionInterrupted", 1);
        }
        uint64_t v7 = 4;
        break;
      case 6:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder])
        {
          id v12 = 0;
        }
        else
        {
          id v12 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionLoading", @"HFMediaAccessoryStateDescriptionLoading", 1);
        }
        uint64_t v7 = 6;
        break;
      default:
        if ([(HFMediaAccessoryItem *)self isItemInActionBuilder]) {
          id v13 = @"HFMediaAccessoryStateControlDescriptionPause";
        }
        else {
          id v13 = @"HFMediaAccessoryStateDescriptionPaused";
        }
LABEL_26:
        id v12 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
        break;
    }
  }
  else if ([(HFMediaAccessoryItem *)self isItemInActionBuilder])
  {
LABEL_8:
    uint64_t v11 = @"HFMediaAccessoryStateControlDescriptionVolume";
LABEL_9:
    id v12 = _HFLocalizedStringWithDefaultValue(v11, v11, 1);
    uint64_t v7 = 0;
  }
  else
  {
LABEL_10:
    uint64_t v7 = 0;
    id v12 = 0;
  }
  if ([(HFMediaAccessoryItem *)self isItemInActionBuilder])
  {
    [v19 setObject:v12 forKeyedSubscript:@"description"];
    if (v7 == 2) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
  }
  else
  {
    if (v12)
    {
      v16 = [v19 objectForKeyedSubscript:@"description"];

      if (!v16)
      {
        if ([(HFMediaAccessoryItem *)self supportsPlaybackState]) {
          uint64_t v17 = v12;
        }
        else {
          uint64_t v17 = 0;
        }
        [v19 setObject:v17 forKeyedSubscript:@"description"];
      }
    }
    if (v7 == 1) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
  }
  BOOL v18 = [NSNumber numberWithInteger:v15];
  [v19 setObject:v18 forKeyedSubscript:@"state"];
}

uint64_t __54__HFMediaAccessoryItem__decorateWithMediaSessionKeys___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 settings];
  if (v3)
  {
    int v4 = [v2 settings];

    uint64_t v5 = [v4 isControllable];
  }
  else
  {
    int v4 = [v2 accessory];

    uint64_t v5 = [v4 isReachable];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)_decorateSettingsSyncKeys:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([(HFMediaAccessoryItem *)self isHomePod]
     || [(HFMediaAccessoryItem *)self isHomePodMediaSystem])
    && ![(HFMediaAccessoryItem *)self isItemInActionBuilder])
  {
    uint64_t v5 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateSettingsSyncingStatus", @"HFMediaAccessoryStateSettingsSyncingStatus", 1);
    [v4 setObject:v5 forKeyedSubscript:@"description"];

    uint64_t v6 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateSettingsSyncingDescription", @"HFMediaAccessoryStateSettingsSyncingDescription", 1);
    [v4 setObject:v6 forKeyedSubscript:@"longErrorDescription"];

    uint64_t v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      int v9 = 136315394;
      int v10 = "-[HFMediaAccessoryItem _decorateSettingsSyncKeys:]";
      __int16 v11 = 2112;
      id v12 = v8;
      _os_log_debug_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEBUG, "%s mediaProfileContainer: %@ is Configuring", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_decorateServiceLikeItemKeys:(id)a3
{
  id v15 = a3;
  id v4 = [(HFMediaAccessoryItem *)self serviceNameComponents];
  if (v4)
  {
    [v15 setObject:v4 forKeyedSubscript:@"serviceNameComponents"];
    uint64_t v5 = [v4 composedString];
    if (v5) {
      [v15 setObject:v5 forKeyedSubscript:@"title"];
    }
    uint64_t v6 = [v4 serviceName];
    [v15 setObject:v6 forKeyedSubscript:@"shortTitle"];
  }
  uint64_t v7 = [(HFMediaAccessoryItem *)self room];
  int v8 = [v7 uniqueIdentifier];
  [v15 safeSetObject:v8 forKey:@"roomIdentifier"];

  int v9 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  int v10 = objc_msgSend(v9, "hf_dateAdded");
  [v15 safeSetObject:v10 forKey:@"dateAdded"];

  __int16 v11 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  LODWORD(v10) = objc_msgSend(v11, "hf_hasSetFavorite");

  if (v10)
  {
    id v12 = NSNumber;
    uint64_t v13 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
    id v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hf_isFavorite"));
    [v15 setObject:v14 forKeyedSubscript:@"isFavorite"];
  }
}

- (void)_decorateWithMediaSystemSpecificKeys:(id)a3
{
  id v12 = a3;
  if ([(HFMediaAccessoryItem *)self isHomePodMediaSystem]
    || [(HFMediaAccessoryItem *)self isHomePod])
  {
    id v4 = [v12 objectForKeyedSubscript:@"dependentHomeKitObjects"];
    uint64_t v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    int v8 = v7;

    int v9 = [(HFMediaAccessoryItem *)self settings];
    int v10 = objc_msgSend(v9, "hf_accessorySettingAtKeyPath:", @"root.siri.allowHeySiri");
    objc_msgSend(v8, "na_safeAddObject:", v10);

    [v12 setObject:v8 forKeyedSubscript:@"dependentHomeKitObjects"];
    if ([(HFMediaAccessoryItem *)self isHomePodMediaSystem])
    {
      __int16 v11 = _HFLocalizedStringWithDefaultValue(@"HFMediaSystemTypeDescription", @"HFMediaSystemTypeDescription", 1);
      [v12 setObject:v11 forKeyedSubscript:@"detailText"];
    }
  }
}

- (void)_decorateWithSiriEndpointProfileSpecificKeys:(id)a3
{
  id v12 = a3;
  if ([(HFMediaAccessoryItem *)self isSiriEndpointAccessory])
  {
    id v4 = [v12 objectForKeyedSubscript:@"dependentHomeKitObjects"];
    uint64_t v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    int v8 = v7;

    int v9 = [(HFMediaAccessoryItem *)self accessories];
    int v10 = [v9 anyObject];
    __int16 v11 = objc_msgSend(v10, "hf_siriEndpointProfile");
    objc_msgSend(v8, "na_safeAddObject:", v11);

    [v12 setObject:v8 forKeyedSubscript:@"dependentHomeKitObjects"];
  }
}

- (id)_decorateWithDiagnosticInfoKeys:(id)a3 cdpStatusGood:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(HFMediaAccessoryItem *)self _shouldDecorateDiagnosticInfoWithKeys:v6 cdpStatusGood:v4])
  {
    id v7 = _HFLocalizedStringWithDefaultValue(@"HFSymptomDescriptionProblemAccount", @"HFSymptomDescriptionProblemAccount", 1);
    [v6 setObject:v7 forKeyedSubscript:@"description"];

    if ([(HFMediaAccessoryItem *)self isAppleTV]) {
      int v8 = @"HFSymptomDescriptionProblemAccountMessageAppleTV";
    }
    else {
      int v8 = @"HFSymptomDescriptionProblemAccountMessageHomePod";
    }
    int v9 = _HFLocalizedStringWithDefaultValue(v8, v8, 1);
    [v6 setObject:v9 forKeyedSubscript:@"longErrorDescription"];

    if ([(HFMediaAccessoryItem *)self isAppleTV]) {
      int v10 = @"HFSymptomDescriptionProblemFixAccountMessageAppleTV";
    }
    else {
      int v10 = @"HFSymptomDescriptionProblemFixAccountMessageHomePod";
    }
    __int16 v11 = _HFLocalizedStringWithDefaultValue(v10, v10, 1);
    [v6 setObject:v11 forKeyedSubscript:@"errorMessageTitle"];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"descriptionBadge"];
    uint64_t v13 = (void *)v12;
    if (v12) {
      id v14 = (void *)v12;
    }
    else {
      id v14 = &unk_26C0F7DD0;
    }
    [v6 setObject:v14 forKeyedSubscript:@"descriptionBadge"];
  }
  return v6;
}

- (void)_decorateWithSymptomFixInFlightKeys:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  uint64_t v3 = [v9 objectForKeyedSubscript:@"symptom"];
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  id v6 = [v9 objectForKeyedSubscript:@"updateInProgress"];
  int v7 = [v6 BOOLValue];

  if (v7 && ([v5 type] == 1 || objc_msgSend(v5, "type") == 2 || objc_msgSend(v5, "type") == 20))
  {
    int v8 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAuthenticatingAccount", @"HFServiceDescriptionAuthenticatingAccount", 1);
    [v9 setObject:v8 forKeyedSubscript:@"updateInProgressTitle"];
  }
}

- (id)performStandardUpdateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [HFMediaAccessoryItemUpdateRequest alloc];
  id v6 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  int v7 = [(HFMediaAccessoryItem *)self valueSource];
  int v8 = [(HFMediaAccessoryItemUpdateRequest *)v5 initWithMediaProfileContainer:v6 valueSource:v7];

  id v9 = [(HFMediaAccessoryItemUpdateRequest *)v8 updateWithOptions:v4];

  return v9;
}

- (BOOL)_shouldDecorateDiagnosticInfoWithKeys:(id)a3 cdpStatusGood:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(HFMediaAccessoryItem *)self isHomePod]
    || [(HFMediaAccessoryItem *)self isHomePodMediaSystem]
    || [(HFMediaAccessoryItem *)self isAppleTV];
  int v8 = [v6 objectForKeyedSubscript:@"symptom"];

  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7;
  }
  BOOL v10 = v9 && !a4;

  return v10;
}

- (BOOL)_isInstallingSoftwareUpdate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(HFMediaAccessoryItem *)self accessoriesSupportingSoftwareUpdate];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "hf_isInstallingSoftwareUpdate"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)serviceNameComponents
{
  id v2 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  uint64_t v3 = objc_msgSend(v2, "hf_serviceNameComponents");

  return v3;
}

- (id)iconDescriptor:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"state"];
  uint64_t v5 = [v4 integerValue];

  id v6 = &HFCAPackageStateOn;
  if (v5 != 2) {
    id v6 = &HFCAPackageStateOff;
  }
  long long v7 = *v6;
  long long v8 = (void *)MEMORY[0x263F1C6C8];
  long long v9 = [MEMORY[0x263F1C550] systemGrayColor];
  long long v10 = [v8 configurationWithHierarchicalColor:v9];

  __int16 v11 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D300] scale:3];
  uint64_t v12 = [v11 configurationByApplyingConfiguration:v10];
  switch([(HFMediaAccessoryItem *)self mediaAccessoryItemType])
  {
    case 0:
    case 5:
    case 6:
    case 9:
      uint64_t v13 = [HFImageIconDescriptor alloc];
      id v14 = @"hifispeaker.fill";
      goto LABEL_14;
    case 1:
      uint64_t v13 = [HFImageIconDescriptor alloc];
      id v14 = @"appletv.fill";
      goto LABEL_14;
    case 2:
    case 3:
      id v15 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      BOOL v16 = +[HFMediaHelper isHomePodMini:v15];

      uint64_t v13 = [HFImageIconDescriptor alloc];
      if (v16) {
        id v14 = @"homepodmini.fill";
      }
      else {
        id v14 = @"homepod.fill";
      }
      goto LABEL_14;
    case 4:
      BOOL v18 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
      BOOL v19 = +[HFMediaHelper isHomePodMiniMediaSystem:v18];

      uint64_t v13 = [HFImageIconDescriptor alloc];
      if (v19) {
        id v14 = @"homepodmini.2.fill";
      }
      else {
        id v14 = @"homepod.2.fill";
      }
      goto LABEL_14;
    case 7:
      uint64_t v13 = [HFImageIconDescriptor alloc];
      id v14 = @"airport.extreme";
LABEL_14:
      uint64_t v17 = [(HFImageIconDescriptor *)v13 initWithSystemImageNamed:v14 configuration:v12];
      goto LABEL_15;
    case 8:
      uint64_t v17 = [[HFCAPackageIconDescriptor alloc] initWithPackageIdentifier:@"HFCAPackageIconIdentifierReceiver" state:v7];
LABEL_15:
      self = (HFMediaAccessoryItem *)v17;
      break;
    default:
      break;
  }

  return self;
}

- (unint64_t)preferredActionOnTap:(id)a3
{
  if ([(HFMediaAccessoryItem *)self isItemInActionBuilder]) {
    return 8;
  }
  unint64_t v4 = [(HFMediaAccessoryItem *)self mediaAccessoryItemType];
  if (v4 > 9) {
    return 8;
  }
  else {
    return qword_20BD13C20[v4];
  }
}

- (BOOL)containsActions
{
  return 1;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFItemBuilder *)[HFMediaPlaybackActionBuilder alloc] initWithHome:v4];

  id v6 = (void *)MEMORY[0x263EFF9C0];
  long long v7 = [(HFMediaAccessoryItem *)self mediaProfileContainer];
  long long v8 = [v6 setWithObject:v7];
  [(HFMediaPlaybackActionBuilder *)v5 setMediaProfiles:v8];

  if (+[HFUtilities isAMac]
    || +[HFUtilities isAVisionPro])
  {
    [(HFMediaPlaybackActionBuilder *)v5 setTargetPlayState:2];
    [(HFMediaPlaybackActionBuilder *)v5 setPlaybackArchive:0];
  }
  else
  {
    [(HFMediaPlaybackActionBuilder *)v5 setTargetPlayState:1];
    long long v9 = [[HFPlaybackArchive alloc] initWithMediaPlayerPlaybackArchive:0];
    [(HFMediaPlaybackActionBuilder *)v5 setPlaybackArchive:v9];
  }
  long long v10 = (void *)MEMORY[0x263F58190];
  __int16 v11 = [MEMORY[0x263EFFA08] setWithObject:v5];
  uint64_t v12 = [v10 futureWithResult:v11];

  return v12;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (BOOL)isItemInActionBuilder
{
  return self->_isItemInActionBuilder;
}

- (void)setIsItemInActionBuilder:(BOOL)a3
{
  self->_isItemInActionBuilder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end