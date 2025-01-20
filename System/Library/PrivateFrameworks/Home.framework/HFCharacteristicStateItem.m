@interface HFCharacteristicStateItem
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFAggregatedCharacteristicValueSource)valueSource;
- (HFCharacteristicStateItem)init;
- (HFCharacteristicStateItem)initWithCharacteristicType:(id)a3 valueSource:(id)a4 resultsProvider:(id)a5;
- (NSString)characteristicType;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)resultsProvider;
- (unint64_t)hash;
@end

@implementation HFCharacteristicStateItem

- (HFCharacteristicStateItem)initWithCharacteristicType:(id)a3 valueSource:(id)a4 resultsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFCharacteristicStateItem.m", 28, @"Invalid parameter not satisfying: %@", @"resultsProvider" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HFCharacteristicStateItem;
  v12 = [(HFCharacteristicStateItem *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    characteristicType = v12->_characteristicType;
    v12->_characteristicType = (NSString *)v13;

    objc_storeStrong((id *)&v12->_valueSource, a4);
    uint64_t v15 = [v11 copy];
    id resultsProvider = v12->_resultsProvider;
    v12->_id resultsProvider = (id)v15;
  }
  return v12;
}

- (HFCharacteristicStateItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCharacteristicType_valueSource_resultsProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicStateItem.m", 39, @"%s is unavailable; use %@ instead",
    "-[HFCharacteristicStateItem init]",
    v5);

  return 0;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_1 != -1) {
    dispatch_once(&_MergedGlobals_2_1, &__block_literal_global_18_5);
  }
  v2 = (void *)qword_26AB2EA18;
  return (NAIdentity *)v2;
}

void __40__HFCharacteristicStateItem_na_identity__block_invoke_2()
{
  id v4 = [MEMORY[0x263F58198] builder];
  v0 = [v4 appendCharacteristic:&__block_literal_global_22_6];
  v1 = [v0 appendCharacteristic:&__block_literal_global_24_4];
  uint64_t v2 = [v1 build];
  v3 = (void *)qword_26AB2EA18;
  qword_26AB2EA18 = v2;
}

uint64_t __40__HFCharacteristicStateItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

uint64_t __40__HFCharacteristicStateItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 valueSource];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(HFCharacteristicStateItem *)self characteristicType];
  v6 = [v4 setWithObject:v5];

  v7 = [(HFCharacteristicStateItem *)self valueSource];
  v8 = [v7 readValuesForCharacteristicTypes:v6];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HFCharacteristicStateItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_264096628;
  v11[4] = self;
  id v9 = [v8 flatMap:v11];

  return v9;
}

id __57__HFCharacteristicStateItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 allCharacteristicTypes];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    v6 = [v3 allCharacteristicTypes];
    NSLog(&cfstr_UnexpectedNumb.isa, [v6 count], v3);
  }
  v7 = [*(id *)(a1 + 32) characteristicType];
  v8 = [v3 responseForCharacteristicType:v7];
  id v9 = [v8 value];

  id v10 = (void *)MEMORY[0x263EFF9A0];
  id v11 = [*(id *)(a1 + 32) resultsProvider];
  v12 = ((void (**)(void, void *))v11)[2](v11, v9);
  uint64_t v13 = [v10 dictionaryWithDictionary:v12];

  v14 = [*(id *)(a1 + 32) valueSource];
  uint64_t v15 = [*(id *)(a1 + 32) characteristicType];
  v16 = [v14 allCharacteristicsForCharacteristicType:v15];
  [v13 setObject:v16 forKeyedSubscript:@"dependentHomeKitObjects"];

  v17 = (void *)MEMORY[0x263EFFA08];
  v18 = [*(id *)(a1 + 32) characteristicType];
  objc_super v19 = [v17 setWithObject:v18];
  [v13 setObject:v19 forKeyedSubscript:@"characteristicTypes"];

  v20 = (void *)MEMORY[0x263F58190];
  v21 = +[HFItemUpdateOutcome outcomeWithResults:v13];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (HFAggregatedCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)resultsProvider
{
  return self->_resultsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsProvider, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end