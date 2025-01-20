@interface HFAccessoryDiagnosticsControlItem
+ (Class)valueClass;
- (HFAccessoryDiagnosticsControlItem)initWithValueSource:(id)a3 displayResults:(id)a4;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFAccessoryDiagnosticsControlItem

- (HFAccessoryDiagnosticsControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F0C460];
  uint64_t v7 = *MEMORY[0x263F0C3B0];
  v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 setWithObject:v6];
  v12 = [MEMORY[0x263EFFA08] setWithObject:v7];
  v13 = [HFControlItemCharacteristicOptions alloc];
  v19[0] = &unk_26C0F6318;
  v19[1] = &unk_26C0F6330;
  v20[0] = v12;
  v20[1] = v11;
  v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v15 = [(HFControlItemCharacteristicOptions *)v13 initWithCharacteristicTypesByUsage:v14];

  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryDiagnosticsControlItem;
  v16 = [(HFControlItem *)&v18 initWithValueSource:v10 characteristicOptions:v15 displayResults:v9];

  return v16;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    v8 = [(HFControlItem *)self displayResults];
    id v9 = (void *)[v7 initWithValueSource:v6 displayResults:v8];

    [v9 copyLatestResultsFromItem:self];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  v5 = [(HFItem *)self latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"characteristicValuesByType"];
  id v7 = v6;
  if (!v6) {
    id v6 = (void *)MEMORY[0x263EFFA78];
  }
  v8 = (void *)[v6 mutableCopy];

  [v8 addEntriesFromDictionary:v4];
  id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F0C3B0]];

  return v9;
}

- (id)characteristicValuesForValue:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    v8 = v6;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  v8 = 0;
LABEL_8:

  uint64_t v14 = *MEMORY[0x263F0C3B0];
  v15[0] = v8;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v11];

  return v12;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryDiagnosticsControlItem;
  v3 = [(HFControlItem *)&v8 resultsForBatchReadResponse:a3];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"characteristicValuesByType"];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F0C460]];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"secondaryValue"];
  }

  return v4;
}

@end