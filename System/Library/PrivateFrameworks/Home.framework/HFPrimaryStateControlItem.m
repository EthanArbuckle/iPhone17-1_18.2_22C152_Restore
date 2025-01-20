@interface HFPrimaryStateControlItem
+ (Class)valueClass;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6;
- (HFValueTransformer)valueTransformer;
- (NSString)primaryStateCharacteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)toggleValue;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writePrimaryState:(int64_t)a3;
- (id)writeValue:(id)a3;
@end

@implementation HFPrimaryStateControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  if ([(HFPrimaryStateControlItem *)self canCopyWithCharacteristicOptions:a3])
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    v8 = [(HFPrimaryStateControlItem *)self primaryStateCharacteristicType];
    v9 = [(HFPrimaryStateControlItem *)self valueTransformer];
    v10 = [(HFControlItem *)self displayResults];
    v11 = (void *)[v7 initWithValueSource:v6 characteristicType:v8 valueTransformer:v9 displayResults:v10];

    [v11 copyLatestResultsFromItem:self];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlItem *)self characteristicOptions];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  v5 = [(HFPrimaryStateControlItem *)self primaryStateCharacteristicType];
  char v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = [(HFPrimaryStateControlItem *)self valueTransformer];
  v8 = [v7 transformedValueForValue:v6];

  return v8;
}

- (HFValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (NSString)primaryStateCharacteristicType
{
  return self->_primaryStateCharacteristicType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformer, 0);
  objc_storeStrong((id *)&self->_primaryStateCharacteristicType, 0);
}

- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 valueTransformer:(id)a5 displayResults:(id)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [HFControlItemCharacteristicOptions alloc];
  v23 = &unk_26C0F7860;
  v15 = [MEMORY[0x263EFFA08] setWithObject:v10];
  v24[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v17 = [(HFControlItemCharacteristicOptions *)v14 initWithCharacteristicTypesByUsage:v16];

  v22.receiver = self;
  v22.super_class = (Class)HFPrimaryStateControlItem;
  v18 = [(HFControlItem *)&v22 initWithValueSource:v13 characteristicOptions:v17 displayResults:v12];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_valueTransformer, a5);
    uint64_t v19 = [v10 copy];
    primaryStateCharacteristicType = v18->_primaryStateCharacteristicType;
    v18->_primaryStateCharacteristicType = (NSString *)v19;
  }
  return v18;
}

- (HFPrimaryStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HFPrimaryStateControlItem;
  return [(HFControlItem *)&v6 initWithValueSource:a3 characteristicOptions:a4 displayResults:a5];
}

- (id)writeValue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFPrimaryStateControlItem;
  v3 = [(HFControlItem *)&v5 writeValue:a3];
  return v3;
}

- (id)writePrimaryState:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_super v5 = [(HFPrimaryStateControlItem *)self writeValue:v4];

  return v5;
}

- (id)toggleValue
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 homeManager];
  [v4 hasOptedToHH2];
  objc_super v5 = objc_opt_new();

  objc_super v6 = [(HFControlItem *)self valueSource];
  [v6 beginTransactionWithReason:@"HFPrimaryStateControlItem-Toggle" readPolicy:v5 logger:0];

  id v7 = [(HFControlItem *)self readValueAndPopulateStandardResults];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__HFPrimaryStateControlItem_toggleValue__block_invoke;
  v11[3] = &unk_26408E098;
  v11[4] = self;
  v8 = [v7 flatMap:v11];

  v9 = [(HFControlItem *)self valueSource];
  [v9 commitTransactionWithReason:@"HFPrimaryStateControlItem-Toggle"];

  return v8;
}

id __40__HFPrimaryStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"value"];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 integerValue];
    if (v5 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2 * (v5 == 1);
    }
    id v7 = [*(id *)(a1 + 32) writePrimaryState:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F58190];
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 35);
    id v7 = [v8 futureWithError:v9];
  }
  return v7;
}

- (id)characteristicValuesForValue:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFPrimaryStateControlItem *)self valueTransformer];
  uint64_t v6 = [v5 valueForTransformedValue:v4];

  id v7 = [(HFPrimaryStateControlItem *)self primaryStateCharacteristicType];
  id v11 = v7;
  v12[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v8];

  return v9;
}

@end