@interface HFOverrideCharacteristicValueSource
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabledForProfile:(id)a3;
- (BOOL)isNaturalLightingSupportedForProfile:(id)a3;
- (HFCharacteristicOperationContextProviding)contextProvider;
- (HFCharacteristicValueSource)originalValueSource;
- (HFOverrideCharacteristicValueProvider)overrideValueProvider;
- (HFOverrideCharacteristicValueSource)initWithOriginalValueSource:(id)a3 overrideValueProvider:(id)a4;
- (id)cachedErrorForWriteToCharacteristic:(id)a3;
- (id)cachedValueForCharacteristic:(id)a3;
- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4;
- (id)readValuesForCharacteristics:(id)a3;
- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4;
- (id)writeValuesForCharacteristics:(id)a3;
- (unint64_t)hash;
- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5;
- (void)commitTransactionWithReason:(id)a3;
- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5;
- (void)setOverrideValueProvider:(id)a3;
@end

@implementation HFOverrideCharacteristicValueSource

uint64_t __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 overrideValueProvider];
}

uint64_t __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 originalValueSource];
}

- (id)readValuesForCharacteristics:(id)a3
{
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke;
  v16[3] = &unk_2640903A0;
  v16[4] = self;
  id v4 = a3;
  v5 = objc_msgSend(v4, "na_filter:", v16);
  v6 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v5);

  objc_initWeak(&location, self);
  v7 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  v8 = [v7 readValuesForCharacteristics:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke_2;
  v12[3] = &unk_264090328;
  objc_copyWeak(&v14, &location);
  id v9 = v5;
  id v13 = v9;
  v10 = [v8 flatMap:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
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
  if (_MergedGlobals_298 != -1) {
    dispatch_once(&_MergedGlobals_298, &__block_literal_global_11_7);
  }
  v2 = (void *)qword_26AB2FAE8;
  return (NAIdentity *)v2;
}

id __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22 = v3;
  v5 = [v3 allReadResponses];
  v6 = (void *)[v5 mutableCopy];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v12 = [WeakRetained overrideValueProvider];
        id v13 = [v12 valueSource:WeakRetained overrideValueForCharacteristic:v11];

        id v14 = [HFCharacteristicReadResponse alloc];
        v15 = [MEMORY[0x263EFFA08] setWithObject:@"ValueOverridden"];
        v16 = [(HFCharacteristicReadResponse *)v14 initWithCharacteristic:v11 readTraits:v15 value:v13 error:0];
        [v6 addObject:v16];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  v17 = [HFCharacteristicBatchReadResponse alloc];
  v18 = [v22 contextProvider];
  v19 = [(HFCharacteristicBatchReadResponse *)v17 initWithReadResponses:v6 contextProvider:v18];

  v20 = [MEMORY[0x263F58190] futureWithResult:v19];

  return v20;
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  if ([v5 conformsToProtocol:&unk_26C111090]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 isNaturalLightingEnabledForProfile:v4];
  return v8;
}

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  if ([v5 conformsToProtocol:&unk_26C111090]) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 isNaturalLightingSupportedForProfile:v4];
  return v8;
}

- (id)cachedErrorForWriteToCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [(HFOverrideCharacteristicValueSource *)self overrideValueProvider];
  if ([v5 valueSource:self shouldOverrideValueForCharacteristic:v4])
  {
    v6 = 0;
LABEL_5:

    goto LABEL_7;
  }
  id v7 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
    v6 = [v5 cachedErrorForWriteToCharacteristic:v4];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (HFCharacteristicValueSource)originalValueSource
{
  return self->_originalValueSource;
}

uint64_t __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 overrideValueProvider];
  uint64_t v6 = [v5 valueSource:*(void *)(a1 + 32) shouldOverrideValueForCharacteristic:v4];

  return v6;
}

- (HFOverrideCharacteristicValueProvider)overrideValueProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideValueProvider);
  return (HFOverrideCharacteristicValueProvider *)WeakRetained;
}

- (HFOverrideCharacteristicValueSource)initWithOriginalValueSource:(id)a3 overrideValueProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFOverrideCharacteristicValueSource;
  uint64_t v9 = [(HFOverrideCharacteristicValueSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalValueSource, a3);
    objc_storeWeak((id *)&v10->_overrideValueProvider, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideValueProvider);
  objc_storeStrong((id *)&self->_originalValueSource, 0);
}

void __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_18_7];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_20_8];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2FAE8;
  qword_26AB2FAE8 = v3;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  if ([v7 conformsToProtocol:&unk_26C111090]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 writeNaturalLightEnabledState:v4 forProfile:v6];

  return v10;
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v12 = a4;
  id v9 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  if ([v9 conformsToProtocol:&unk_26C111090]) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  [v11 fetchNaturalLightColorTemperatureForBrightness:a3 lightProfile:v12 completion:v8];
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  v12[3] = &unk_264091C28;
  id v13 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(a4, "na_map:", v12);
  id v9 = objc_msgSend(v8, "na_setByFlattening");

  v10 = [(HFOverrideCharacteristicValueSource *)self readValuesForCharacteristics:v9];

  return v10;
}

id __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  BOOL v4 = [a2 characteristics];
  v5 = [v3 setWithArray:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v8[3] = &unk_2640903A0;
  id v9 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_filter:", v8);

  return v6;
}

uint64_t __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  id v4 = a3;
  v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  id v6 = [v5 writeValuesForCharacteristics:v4];

  return v6;
}

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4 = a3;
  v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  id v6 = [v5 cachedValueForCharacteristic:v4];

  return v6;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  uint64_t v3 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
    id v6 = [v5 contextProvider];
  }
  else
  {
    id v6 = 0;
  }
  return (HFCharacteristicOperationContextProviding *)v6;
}

- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  [v11 beginTransactionWithReason:v10 readPolicy:v9 logger:v8];
}

- (void)commitTransactionWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HFOverrideCharacteristicValueSource *)self originalValueSource];
  [v5 commitTransactionWithReason:v4];
}

- (void)setOverrideValueProvider:(id)a3
{
}

@end