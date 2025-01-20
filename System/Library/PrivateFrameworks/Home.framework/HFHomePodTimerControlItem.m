@interface HFHomePodTimerControlItem
+ (Class)valueClass;
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFHomeKitSettingsValueManager)valueManager;
- (HFHomePodTimerControlItem)initWithMediaProfileContainer:(id)a3 displayResults:(id)a4;
- (HFHomePodTimerControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFMediaProfileContainer)mediaProfileContainer;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
- (unint64_t)hash;
@end

@implementation HFHomePodTimerControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFHomePodTimerControlItem)initWithMediaProfileContainer:(id)a3 displayResults:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_msgSend(v8, "hf_home");
  if (!v10)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFHomePodTimerControlItem.m", 40, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v11 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  v12 = objc_msgSend(v10, "hf_characteristicValueManager");
  v13 = [MEMORY[0x263EFFA08] set];
  v14 = [(HFSimpleAggregatedCharacteristicValueSource *)v11 initWithValueSource:v12 characteristics:v13 primaryServiceDescriptor:0];

  v15 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v19.receiver = self;
  v19.super_class = (Class)HFHomePodTimerControlItem;
  v16 = [(HFControlItem *)&v19 initWithValueSource:v14 characteristicOptions:v15 displayResults:v9];

  if (v16) {
    objc_storeStrong((id *)&v16->_mediaProfileContainer, a3);
  }

  return v16;
}

- (HFHomePodTimerControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithMediaProfileContainer_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFHomePodTimerControlItem.m", 57, @"%s is unavailable; use %@ instead",
    "-[HFHomePodTimerControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFHomePodTimerControlItem *)self mediaProfileContainer];
  v7 = [(HFControlItem *)self displayResults];
  id v8 = (void *)[v5 initWithMediaProfileContainer:v6 displayResults:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (HFHomeKitSettingsValueManager)valueManager
{
  v2 = [(HFHomePodTimerControlItem *)self mediaProfileContainer];
  v3 = objc_msgSend(v2, "hf_settingsValueManager");

  return (HFHomeKitSettingsValueManager *)v3;
}

- (id)readValueAndPopulateStandardResults
{
  v13.receiver = self;
  v13.super_class = (Class)HFHomePodTimerControlItem;
  v3 = [(HFControlItem *)&v13 readValueAndPopulateStandardResults];
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [(HFHomePodTimerControlItem *)self mediaProfileContainer];
  v6 = objc_msgSend(v5, "hf_dependentHomeKitObjectsForDownstreamItems");
  v7 = (void *)[v6 mutableCopy];

  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"dependentHomeKitObjects");
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"actionRequiresDeviceUnlock"];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HFHomePodTimerControlItem_readValueAndPopulateStandardResults__block_invoke;
  v11[3] = &unk_26408E098;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v3 flatMap:v11];

  return v9;
}

id __64__HFHomePodTimerControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
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
  v13.super_class = (Class)HFHomePodTimerControlItem;
  uint64_t v5 = [(HFControlItem *)&v13 resultsForBatchReadResponse:v4];
  v6 = (void *)[(id)v5 mutableCopy];

  v7 = [(HFHomePodTimerControlItem *)self mediaProfileContainer];
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
  if (_MergedGlobals_300 != -1) {
    dispatch_once(&_MergedGlobals_300, &__block_literal_global_32_4);
  }
  v2 = (void *)qword_26AB2FB68;
  return (NAIdentity *)v2;
}

void __40__HFHomePodTimerControlItem_na_identity__block_invoke_2()
{
  id v3 = [MEMORY[0x263F58198] builder];
  v0 = [v3 appendCharacteristic:&__block_literal_global_36_6];
  uint64_t v1 = [v0 build];
  v2 = (void *)qword_26AB2FB68;
  qword_26AB2FB68 = v1;
}

id __40__HFHomePodTimerControlItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
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