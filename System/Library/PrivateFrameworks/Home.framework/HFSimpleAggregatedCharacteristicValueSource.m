@interface HFSimpleAggregatedCharacteristicValueSource
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabled;
- (BOOL)isNaturalLightingSupported;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceDescriptor)primaryServiceDescriptor;
- (HFSimpleAggregatedCharacteristicValueSource)init;
- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 characteristics:(id)a4 primaryServiceDescriptor:(id)a5;
- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 services:(id)a4 primaryServiceDescriptor:(id)a5;
- (NSDictionary)characteristicsByType;
- (NSSet)allServices;
- (NSSet)characteristics;
- (NSSet)lightProfiles;
- (id)allCharacteristicsForCharacteristicType:(id)a3;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataForCharacteristicType:(id)a3;
- (id)readValuesForCharacteristicTypes:(id)a3;
- (id)readValuesForServiceStateRecipe:(id)a3;
- (id)writeNaturalLightEnabledState:(BOOL)a3;
- (id)writeValuesForCharacteristicRecipes:(id)a3;
- (id)writeValuesForCharacteristicTypes:(id)a3;
- (unint64_t)hash;
- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5;
- (void)commitTransactionWithReason:(id)a3;
- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4;
@end

@implementation HFSimpleAggregatedCharacteristicValueSource

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 valueSource];
}

uint64_t __108__HFSimpleAggregatedCharacteristicValueSource_initWithValueSource_characteristics_primaryServiceDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

uint64_t __62__HFSimpleAggregatedCharacteristicValueSource_characteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allObjects];
}

uint64_t __87__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__lightProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_lightProfiles");
}

uint64_t __100__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingSupported__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isNaturalLightingSupportedForProfile:a2];
}

- (id)readValuesForCharacteristicTypes:(id)a3
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__HFSimpleAggregatedCharacteristicValueSource_readValuesForCharacteristicTypes___block_invoke;
  v8[3] = &unk_26408CEC0;
  v8[4] = self;
  v4 = objc_msgSend(a3, "na_flatMap:", v8);
  v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  v6 = [v5 readValuesForCharacteristics:v4];

  return v6;
}

- (BOOL)isNaturalLightingSupported
{
  v3 = [(HFSimpleAggregatedCharacteristicValueSource *)self lightProfiles];
  v4 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  v5 = &unk_26C111090;
  if ([v4 conformsToProtocol:v5]) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingSupported__block_invoke;
  v14[3] = &unk_26408E998;
  id v8 = v7;
  id v15 = v8;
  int v9 = objc_msgSend(v3, "na_all:", v14);
  if (!+[HFUtilities isRunningInStoreDemoMode]
    && !+[HFUtilities isPressDemoModeEnabled])
  {
    v10 = [(HFSimpleAggregatedCharacteristicValueSource *)self allServices];
    v11 = [v10 anyObject];

    v12 = [v11 home];
    v9 &= objc_msgSend(v12, "hf_enabledResidentsSupportsNaturalLight");
  }
  return v9;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)lightProfiles
{
  v2 = [(HFSimpleAggregatedCharacteristicValueSource *)self allServices];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_21);

  return (NSSet *)v3;
}

- (NSSet)allServices
{
  allServices = self->_allServices;
  if (!allServices)
  {
    v4 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristics];
    objc_msgSend(v4, "na_map:", &__block_literal_global_16);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allServices;
    self->_allServices = v5;

    allServices = self->_allServices;
  }
  return allServices;
}

- (NSSet)characteristics
{
  characteristics = self->_characteristics;
  if (!characteristics)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristicsByType];
    v6 = [v5 allValues];
    id v7 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_19);
    id v8 = [v4 setWithArray:v7];
    int v9 = self->_characteristics;
    self->_characteristics = v8;

    characteristics = self->_characteristics;
  }
  return characteristics;
}

- (id)metadataForCharacteristicType:(id)a3
{
  id v4 = a3;
  v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristicsByType];
  v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = +[HFCharacteristicBatchReadResponse aggregatedMetadataForCharacteristics:v6];

  return v7;
}

- (id)allCharacteristicsForCharacteristicType:(id)a3
{
  id v4 = a3;
  v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristicsByType];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)characteristicsByType
{
  return self->_characteristicsByType;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_208 != -1) {
    dispatch_once(&_MergedGlobals_208, &__block_literal_global_30);
  }
  v2 = (void *)qword_26AB2EBC8;
  return (NAIdentity *)v2;
}

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_allServices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 service];
}

uint64_t __98__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isNaturalLightingEnabledForProfile:a2];
}

id __80__HFSimpleAggregatedCharacteristicValueSource_readValuesForCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 characteristicsByType];
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

- (BOOL)isNaturalLightingEnabled
{
  id v3 = [(HFSimpleAggregatedCharacteristicValueSource *)self lightProfiles];
  unint64_t v4 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  v5 = &unk_26C111090;
  if ([v4 conformsToProtocol:v5]) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __98__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingEnabled__block_invoke;
  v11[3] = &unk_26408E998;
  id v12 = v7;
  id v8 = v7;
  char v9 = objc_msgSend(v3, "na_all:", v11);

  return v9;
}

- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 characteristics:(id)a4 primaryServiceDescriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    NSLog(&cfstr_ValueSourceCan.isa);
  }
  v17.receiver = self;
  v17.super_class = (Class)HFSimpleAggregatedCharacteristicValueSource;
  id v12 = [(HFSimpleAggregatedCharacteristicValueSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_valueSource, a3);
    objc_storeStrong((id *)&v13->_primaryServiceDescriptor, a5);
    uint64_t v14 = objc_msgSend(v10, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_13);
    characteristicsByType = v13->_characteristicsByType;
    v13->_characteristicsByType = (NSDictionary *)v14;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicsByType, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_primaryServiceDescriptor, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
}

- (HFServiceDescriptor)primaryServiceDescriptor
{
  return self->_primaryServiceDescriptor;
}

id __101__HFSimpleAggregatedCharacteristicValueSource_initWithValueSource_services_primaryServiceDescriptor___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 characteristics];
  unint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 services:(id)a4 primaryServiceDescriptor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_msgSend(v9, "na_flatMap:", &__block_literal_global_2);
  v13 = [(HFSimpleAggregatedCharacteristicValueSource *)self initWithValueSource:v11 characteristics:v12 primaryServiceDescriptor:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_allServices, a4);
  }

  return v13;
}

void __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_37];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_39];
  uint64_t v3 = [v0 build];

  unint64_t v4 = (void *)qword_26AB2EBC8;
  qword_26AB2EBC8 = v3;
}

- (HFSimpleAggregatedCharacteristicValueSource)init
{
  unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithValueSource_characteristics_primaryServiceDescriptor_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAggregatedCharacteristicValueSource.m", 29, @"%s is unavailable; use %@ instead",
    "-[HFSimpleAggregatedCharacteristicValueSource init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  id v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self copyWithValueSource:v4];

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x37uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[HFSimpleAggregatedCharacteristicValueSource copyWithValueSource:]";
    __int16 v13 = 2048;
    uint64_t v14 = 63;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s (Line: %ld) Copying with valueSource %@.", (uint8_t *)&v11, 0x20u);
  }

  id v6 = objc_alloc((Class)objc_opt_class());
  id v7 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristics];
  id v8 = [(HFSimpleAggregatedCharacteristicValueSource *)self primaryServiceDescriptor];
  id v9 = (void *)[v6 initWithValueSource:v4 characteristics:v7 primaryServiceDescriptor:v8];

  return v9;
}

- (id)readValuesForServiceStateRecipe:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x37uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
    int v15 = 136315906;
    id v16 = "-[HFSimpleAggregatedCharacteristicValueSource readValuesForServiceStateRecipe:]";
    __int16 v17 = 2048;
    uint64_t v18 = 90;
    __int16 v19 = 2112;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%s (Line: %ld) valueSource for %@ = %@", (uint8_t *)&v15, 0x2Au);
  }
  id v7 = [(HFSimpleAggregatedCharacteristicValueSource *)self allServices];
  id v8 = [v4 matchResultForServices:v7];

  id v9 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  id v10 = [v8 allCharacteristics];
  int v11 = [(HFSimpleAggregatedCharacteristicValueSource *)self characteristics];
  id v12 = objc_msgSend(v10, "na_setByIntersectingWithSet:", v11);
  __int16 v13 = [v9 readValuesForCharacteristics:v12];

  return v13;
}

- (id)writeValuesForCharacteristicRecipes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HFCharacteristicValueSet);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __83__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicRecipes___block_invoke;
  __int16 v13 = &unk_26408CEE8;
  uint64_t v14 = self;
  int v15 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];

  id v7 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  id v8 = [v7 writeValuesForCharacteristics:v6];

  return v8;
}

void __83__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicRecipes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) allServices];
  id v8 = [v5 matchResultForServices:v7];

  id v9 = [v8 allCharacteristics];
  uint64_t v10 = [*(id *)(a1 + 32) characteristics];
  uint64_t v11 = objc_msgSend(v9, "na_setByIntersectingWithSet:", v10);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(a1 + 40), "setValue:forCharacteristic:", v6, *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)writeValuesForCharacteristicTypes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HFCharacteristicValueSet);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __81__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicTypes___block_invoke;
  uint64_t v13 = &unk_26408CF10;
  uint64_t v14 = self;
  uint64_t v15 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];

  id v7 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  id v8 = [v7 writeValuesForCharacteristics:v6];

  return v8;
}

void __81__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "characteristicsByType", 0);
  id v8 = [v7 objectForKeyedSubscript:v5];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 40) setValue:v6 forCharacteristic:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  [v11 beginTransactionWithReason:v10 readPolicy:v9 logger:v8];
}

- (void)commitTransactionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  [v5 commitTransactionWithReason:v4];
}

- (id)writeNaturalLightEnabledState:(BOOL)a3
{
  id v5 = [(HFSimpleAggregatedCharacteristicValueSource *)self lightProfiles];
  id v6 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  id v7 = &unk_26C111090;
  if ([v6 conformsToProtocol:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v5 allObjects];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke;
  uint64_t v18 = &unk_26408E9E8;
  id v19 = v9;
  BOOL v20 = a3;
  id v11 = v9;
  uint64_t v12 = objc_msgSend(v10, "na_map:", &v15);

  long long v13 = objc_msgSend(MEMORY[0x263F58190], "chainFutures:", v12, v15, v16, v17, v18);

  return v13;
}

id __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_2;
  v9[3] = &unk_26408E9C0;
  id v5 = *(id *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 40);
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = [v4 futureWithBlock:v9];

  return v7;
}

void __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) writeNaturalLightEnabledState:*(unsigned __int8 *)(a1 + 48) forProfile:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_3;
  v7[3] = &unk_26408E7F0;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 addCompletionBlock:v7];
}

uint64_t __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v11 = [(HFSimpleAggregatedCharacteristicValueSource *)self lightProfiles];
  id v7 = [(HFSimpleAggregatedCharacteristicValueSource *)self valueSource];
  if ([v7 conformsToProtocol:&unk_26C111090]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v11 anyObject];
  [v9 fetchNaturalLightColorTemperatureForBrightness:a3 lightProfile:v10 completion:v6];
}

@end