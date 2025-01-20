@interface HFMultiStateControlItem
+ (Class)valueClass;
+ (id)na_identity;
- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6;
- (HFMultiStateControlItem)initWithValueSource:(id)a3 multiStateCharacteristicType:(id)a4 allCharacteristicOptions:(id)a5 possibleValueSet:(id)a6 displayResults:(id)a7;
- (HFMultiStateValueSet)possibleValueSet;
- (NSString)multiStateCharacteristicType;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
@end

@implementation HFMultiStateControlItem

id __38__HFMultiStateControlItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 possibleValueSet];
  v3 = [v2 allValues];

  return v3;
}

- (HFMultiStateValueSet)possibleValueSet
{
  return self->_possibleValueSet;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

void __38__HFMultiStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58198];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFMultiStateControlItem;
  v2 = objc_msgSendSuper2(&v7, sel_na_identity);
  v3 = [v1 builderWithIdentity:v2];
  v4 = [v3 appendCharacteristic:&__block_literal_global_95 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_4_4];
  uint64_t v5 = [v4 build];
  v6 = (void *)qword_26AB2E748;
  qword_26AB2E748 = v5;
}

+ (id)na_identity
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__HFMultiStateControlItem_na_identity__block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a1;
  v2 = __38__HFMultiStateControlItem_na_identity__block_invoke((uint64_t)v4);
  return v2;
}

id __38__HFMultiStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HFMultiStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (_MergedGlobals_1_1 != -1) {
    dispatch_once(&_MergedGlobals_1_1, block);
  }
  v1 = (void *)qword_26AB2E748;
  return v1;
}

uint64_t __38__HFMultiStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = v4;
  if (!v5)
  {
    objc_super v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicType:(id)a4 possibleValueSet:(id)a5 displayResults:(id)a6
{
  v10 = (void *)MEMORY[0x263EFFA08];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 setWithObject:v13];
  v16 = +[HFControlItemCharacteristicOptions optionsWithReadWriteCharacteristicTypes:v15];

  v17 = [(HFMultiStateControlItem *)self initWithValueSource:v14 multiStateCharacteristicType:v13 allCharacteristicOptions:v16 possibleValueSet:v12 displayResults:v11];
  return v17;
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 multiStateCharacteristicType:(id)a4 allCharacteristicOptions:(id)a5 possibleValueSet:(id)a6 displayResults:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HFMultiStateControlItem;
  id v14 = [(HFControlItem *)&v20 initWithValueSource:a3 characteristicOptions:a5 displayResults:a7];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    possibleValueSet = v14->_possibleValueSet;
    v14->_possibleValueSet = (HFMultiStateValueSet *)v15;

    uint64_t v17 = [v12 copy];
    multiStateCharacteristicType = v14->_multiStateCharacteristicType;
    v14->_multiStateCharacteristicType = (NSString *)v17;
  }
  return v14;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFMultiStateControlItem *)self multiStateCharacteristicType];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)objc_opt_class());
  objc_super v7 = [(HFMultiStateControlItem *)self multiStateCharacteristicType];
  v8 = [(HFMultiStateControlItem *)self possibleValueSet];
  uint64_t v9 = [(HFControlItem *)self displayResults];
  v10 = (void *)[v6 initWithValueSource:v5 characteristicType:v7 possibleValueSet:v8 displayResults:v9];

  [v10 copyLatestResultsFromItem:self];
  return v10;
}

- (NSString)multiStateCharacteristicType
{
  return self->_multiStateCharacteristicType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleValueSet, 0);
  objc_storeStrong((id *)&self->_multiStateCharacteristicType, 0);
}

- (HFMultiStateControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  objc_super v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithValueSource_characteristicType_possibleValueSet_displayResults_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMultiStateControlItem.m", 57, @"%s is unavailable; use %@ instead",
    "-[HFMultiStateControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (id)characteristicValuesForValue:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HFMultiStateControlItem *)self multiStateCharacteristicType];
    uint64_t v9 = v5;
    v10[0] = v4;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

    objc_super v7 = [(HFControlItem *)self normalizedCharacteristicValuesForValues:v6];
  }
  else
  {
    objc_super v7 = (void *)MEMORY[0x263EFFA78];
  }
  return v7;
}

@end