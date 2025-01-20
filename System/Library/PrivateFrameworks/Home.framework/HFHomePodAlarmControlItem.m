@interface HFHomePodAlarmControlItem
+ (Class)valueClass;
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFHomeKitSettingsValueManager)valueManager;
- (HFHomePodAlarmControlItem)initWithMediaProfileContainer:(id)a3 displayResults:(id)a4;
- (HFHomePodAlarmControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFMediaProfileContainer)mediaProfileContainer;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
- (unint64_t)hash;
@end

@implementation HFHomePodAlarmControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFHomePodAlarmControlItem)initWithMediaProfileContainer:(id)a3 displayResults:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(v8, "hf_home");
  if (!v10)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFHomePodAlarmControlItem.m", 40, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v11 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v12 = objc_msgSend(v10, "hf_characteristicValueManager");
  v13 = [MEMORY[0x263EFFA08] set];
  v14 = [(HFSimpleAggregatedCharacteristicValueSource *)v11 initWithValueSource:v12 characteristics:v13 primaryServiceDescriptor:0];

  v15 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v19.receiver = self;
  v19.super_class = (Class)HFHomePodAlarmControlItem;
  v16 = [(HFControlItem *)&v19 initWithValueSource:v14 characteristicOptions:v15 displayResults:v9];

  if (v16) {
    objc_storeStrong((id *)&v16->_mediaProfileContainer, a3);
  }

  return v16;
}

- (HFHomePodAlarmControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithMediaProfileContainer_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomePodAlarmControlItem.m", 57, @"%s is unavailable; use %@ instead",
    "-[HFHomePodAlarmControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
  v7 = [(HFControlItem *)self displayResults];
  id v8 = (void *)[v5 initWithMediaProfileContainer:v6 displayResults:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (HFHomeKitSettingsValueManager)valueManager
{
  v2 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
  v3 = objc_msgSend(v2, "hf_settingsValueManager");

  return (HFHomeKitSettingsValueManager *)v3;
}

- (id)readValueAndPopulateStandardResults
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)HFHomePodAlarmControlItem;
  v3 = [(HFControlItem *)&v23 readValueAndPopulateStandardResults];
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:&unk_26C0F62E8 forKeyedSubscript:@"controlItemPurpose"];
  id v5 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_backingAccessory");
  v7 = objc_msgSend(v6, "hf_siriEndpointProfile");

  if (v7)
  {
    id v8 = HFLogForCategory(0x3DuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "Setting HomePodAlarmControlItem purpose to HFControlItemPreferredPurposeSecondaryAlternateQuickControl", buf, 2u);
    }

    [v4 setObject:&unk_26C0F6300 forKeyedSubscript:@"controlItemPurpose"];
  }
  id v9 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
  v10 = objc_msgSend(v9, "hf_dependentHomeKitObjectsForDownstreamItems");
  v11 = (void *)[v10 mutableCopy];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v12 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
    v13 = objc_msgSend(v12, "hf_settingsAdapterManager");
    v14 = [v13 adapterForIdentifier:@"MobileTimerAdapter"];

    int v15 = [v14 isAdapterReady];
    v16 = HFLogForCategory(4uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v15 ^ 1;
      _os_log_debug_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEBUG, "mobileTimerAdapter isAdapterReady = %{BOOL}d Alarm QC will be hidden = %{BOOL}d", buf, 0xEu);
    }

    if ((v15 & 1) == 0) {
      [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    v17 = [v14 alarmCollectionSetting];
    objc_msgSend(v11, "na_safeAddObject:", v17);
  }
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"actionRequiresDeviceUnlock"];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v11, @"dependentHomeKitObjects");
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__HFHomePodAlarmControlItem_readValueAndPopulateStandardResults__block_invoke;
  v21[3] = &unk_26408E098;
  id v22 = v4;
  id v18 = v4;
  objc_super v19 = [v3 flatMap:v21];

  return v19;
}

id __64__HFHomePodAlarmControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFHomePodAlarmControlItem;
  uint64_t v5 = [(HFControlItem *)&v13 resultsForBatchReadResponse:v4];
  v6 = (void *)[(id)v5 mutableCopy];

  v7 = [(HFHomePodAlarmControlItem *)self mediaProfileContainer];
  LOBYTE(v5) = objc_msgSend(v7, "hf_isReachable");

  if ((v5 & 1) == 0)
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    id v9 = [MEMORY[0x263EFFA08] set];
    v10 = [v4 contextProvider];
    v11 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v8 readTraits:v9 contextProvider:v10];

    objc_msgSend(v6, "na_safeSetObject:forKey:", v11, @"underlyingError");
  }

  return v6;
}

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(NSDictionary, "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3);
}

- (id)normalizedValueForValue:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_235 != -1) {
    dispatch_once(&_MergedGlobals_235, &__block_literal_global_37_1);
  }
  v2 = (void *)qword_26AB2EED8;
  return (NAIdentity *)v2;
}

void __40__HFHomePodAlarmControlItem_na_identity__block_invoke_2()
{
  id v3 = [MEMORY[0x263F58198] builder];
  v0 = [v3 appendCharacteristic:&__block_literal_global_41_1];
  uint64_t v1 = [v0 build];
  v2 = (void *)qword_26AB2EED8;
  qword_26AB2EED8 = v1;
}

id __40__HFHomePodAlarmControlItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 mediaProfileContainer];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
}

@end