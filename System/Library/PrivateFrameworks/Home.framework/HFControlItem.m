@interface HFControlItem
+ (Class)valueClass;
+ (NAIdentity)na_identity;
- (BOOL)canCopyWithCharacteristicOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsItemRepresentingServices:(id)a3;
- (HFAggregatedCharacteristicValueSource)valueSource;
- (HFControlItem)init;
- (HFControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5;
- (HFControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5;
- (HFControlItemCharacteristicOptions)characteristicOptions;
- (NSDictionary)displayResults;
- (NSSet)characteristicTypes;
- (NSString)debugDescription;
- (NSString)description;
- (id)_descriptionWithCharacteristicOptions:(BOOL)a3 includeResults:(BOOL)a4;
- (id)_standardResultsForResultValue:(id)a3 characteristicValuesByType:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)_tintColor;
- (id)characteristicValuesByTypeForBatchReadResponse:(id)a3;
- (id)characteristicValuesForValue:(id)a3;
- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataForCharacteristicType:(id)a3;
- (id)normalizedCharacteristicValuesForValues:(id)a3;
- (id)normalizedValueForCharacteristicValue:(id)a3 ofType:(id)a4;
- (id)normalizedValueForValue:(id)a3;
- (id)readValueAndPopulateStandardResults;
- (id)resultsForBatchReadResponse:(id)a3;
- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4;
- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4;
- (id)valueForCharacteristicValues:(id)a3;
- (id)writeValue:(id)a3;
- (int64_t)_primaryStateForValue:(id)a3;
- (int64_t)sortPriority;
- (unint64_t)_accessorySuspendedState;
- (unint64_t)hash;
@end

@implementation HFControlItem

uint64_t __28__HFControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristicOptions];
}

uint64_t __28__HFControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 displayResults];
}

uint64_t __28__HFControlItem_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 valueSource];
}

- (unint64_t)_accessorySuspendedState
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [(HFControlItem *)self valueSource];
  v3 = [v2 allServices];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_121_1);
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v11[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v7 = [v4 sortedArrayUsingDescriptors:v6];
  v8 = [v7 lastObject];
  unint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

uint64_t __28__HFControlItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (!v4) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v4;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];

LABEL_7:
    v6 = 0;
  }

  uint64_t v9 = [v6 computeHashFromContents];
  return v9;
}

- (id)readValueAndPopulateStandardResults
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = [(HFControlItem *)self valueSource];
    *(_DWORD *)buf = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ valueSource = %@", buf, 0x20u);
  }
  v7 = [(HFControlItem *)self valueSource];
  v8 = [(HFControlItem *)self characteristicOptions];
  uint64_t v9 = [v8 allCharacteristicTypes];
  v10 = [v7 readValuesForCharacteristicTypes:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__HFControlItem_readValueAndPopulateStandardResults__block_invoke;
  v13[3] = &unk_2640919E0;
  objc_copyWeak(&v14, &location);
  v11 = [v10 flatMap:v13];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HFControlItem *)self characteristicValuesByTypeForBatchReadResponse:v4];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __45__HFControlItem_resultsForBatchReadResponse___block_invoke;
  v31[3] = &unk_264091A08;
  v31[4] = self;
  id v6 = v5;
  id v32 = v6;
  v7 = __45__HFControlItem_resultsForBatchReadResponse___block_invoke((uint64_t)v31);
  if (v7)
  {
    [(id)objc_opt_class() valueClass];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = [(id)objc_opt_class() valueClass];
      NSLog(&cfstr_ValueIsNotComp.isa, v7, self, v8);
    }
  }
  uint64_t v9 = [(HFControlItem *)self _standardResultsForResultValue:v7 characteristicValuesByType:v6];
  v10 = (void *)[v9 mutableCopy];

  unint64_t v11 = [(HFControlItem *)self _accessorySuspendedState];
  v12 = [NSNumber numberWithUnsignedInteger:v11];
  [v10 setObject:v12 forKeyedSubscript:@"suspendedState"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v13 = [(HFControlItem *)self characteristicOptions];
  id v14 = [v13 allRequiredCharacteristicTypes];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [v4 responseForCharacteristicType:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        uint64_t v20 = [v19 error];
        if (v20)
        {
          v21 = (void *)v20;
          uint64_t v22 = [v19 readTraits];
          v23 = [v4 contextProvider];
          v24 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v21 readTraits:v22 contextProvider:v23];

          objc_msgSend(v10, "na_safeSetObject:forKey:", v24, @"underlyingError");
          goto LABEL_14;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v25 = (void *)[v10 copy];
  return v25;
}

id __45__HFControlItem_resultsForBatchReadResponse___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) characteristicOptions];
  uint64_t v3 = [v2 allRequiredCharacteristicTypes];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = [*(id *)(a1 + 40) allKeys];
  id v6 = [v4 setWithArray:v5];
  int v7 = [v3 isSubsetOfSet:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) valueForCharacteristicValues:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)characteristicValuesByTypeForBatchReadResponse:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v23 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(HFControlItem *)self characteristicOptions];
  id v6 = [v5 allCharacteristicTypes];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138412546;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v13 = -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](self, "valueForCharacteristicType:inBatchReadResponse:", v12, v4, v21);
        if (v13)
        {
          id v14 = [(HFControlItem *)self normalizedValueForCharacteristicValue:v13 ofType:v12];
          [v23 setObject:v14 forKeyedSubscript:v12];
        }
        else
        {
          uint64_t v15 = [(HFControlItem *)self characteristicOptions];
          uint64_t v16 = [v15 allRequiredCharacteristicTypes];
          int v17 = [v16 containsObject:v12];

          if (!v17) {
            goto LABEL_12;
          }
          id v14 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            __int16 v18 = [MEMORY[0x263F0E248] localizedDescriptionForCharacteristicType:v12];
            id v19 = [(HFControlItem *)self _descriptionWithCharacteristicOptions:1 includeResults:0];
            *(_DWORD *)buf = v21;
            long long v29 = v18;
            __int16 v30 = 2112;
            v31 = v19;
            _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "Missing value for characteristic type %@ for control item %@", buf, 0x16u);
          }
        }

LABEL_12:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }

  return v23;
}

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(HFControlItem *)self servicePredicateForCharacteristicType:v7 withUsage:0];
  uint64_t v9 = [[HFServiceStateCharacteristicRecipe alloc] initWithCharacteristicType:v7 servicePredicate:v8 required:1];

  uint64_t v10 = [v6 responseForCharacteristicRecipe:v9];

  unint64_t v11 = [v10 value];

  return v11;
}

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  return +[HFServiceTreeTypePredicate anyServiceTypePredicate];
}

- (id)_standardResultsForResultValue:(id)a3 characteristicValuesByType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [(HFControlItem *)self displayResults];

  if (v9)
  {
    uint64_t v10 = [(HFControlItem *)self displayResults];
    [v8 addEntriesFromDictionary:v10];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:@"value"];
  }
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:@"characteristicValuesByType"];
  }
  unint64_t v11 = [(HFControlItem *)self characteristicOptions];
  uint64_t v12 = [v11 allCharacteristicTypes];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke;
  v28[3] = &unk_26408CEC0;
  v28[4] = self;
  v13 = objc_msgSend(v12, "na_map:", v28);
  id v14 = objc_msgSend(v13, "na_setByFlattening");

  [v8 setObject:v14 forKeyedSubscript:@"dependentHomeKitObjects"];
  uint64_t v15 = [(HFControlItem *)self characteristicOptions];
  uint64_t v16 = [v15 allCharacteristicTypes];
  [v8 setObject:v16 forKeyedSubscript:@"characteristicTypes"];

  int v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "na_any:", &__block_literal_global_61_0));
  [v8 setObject:v17 forKeyedSubscript:@"actionRequiresDeviceUnlock"];

  __int16 v18 = [(HFControlItem *)self characteristicOptions];
  id v19 = [v18 characteristicTypesForUsage:0];
  uint64_t v20 = [v19 allObjects];
  long long v21 = [v20 firstObject];

  uint64_t v22 = [(HFControlItem *)self valueSource];
  id v23 = [v22 allServices];
  long long v24 = [v23 anyObject];
  long long v25 = objc_msgSend(v24, "hf_effectiveServiceType");

  long long v26 = +[HFDecorationIconFactory iconDescriptorForCharacteristicType:v21 effectiveServiceType:v25 primaryState:[(HFControlItem *)self _primaryStateForValue:v6]];
  [v8 setObject:v26 forKeyedSubscript:@"decorationIconDescriptor"];

  return v8;
}

- (HFControlItemCharacteristicOptions)characteristicOptions
{
  return self->_characteristicOptions;
}

- (NSDictionary)displayResults
{
  return self->_displayResults;
}

- (id)normalizedValueForCharacteristicValue:(id)a3 ofType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(HFControlItem *)self valueSource];
  uint64_t v9 = [v8 metadataForCharacteristicType:v6];

  uint64_t v10 = objc_msgSend(v9, "hf_normalizedValueForValue:", v7);

  return v10;
}

id __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 valueSource];
  id v5 = [v4 allCharacteristicsForCharacteristicType:v3];

  return v5;
}

- (HFAggregatedCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (int64_t)_primaryStateForValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      uint64_t v8 = 2;
      if (fabs(v7) < 2.22044605e-16) {
        uint64_t v8 = 1;
      }
      if (v7 > 0.0) {
        int64_t v9 = v8;
      }
      else {
        int64_t v9 = 1;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v6 integerValue]) {
          int64_t v9 = 1;
        }
        else {
          int64_t v9 = 2;
        }
      }
      else if ([(HFControlItem *)self conformsToProtocol:&unk_26C1083F8])
      {
        int64_t v9 = [v6 integerValue];
      }
      else
      {
        int64_t v9 = 1;
      }
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (id)metadataForCharacteristicType:(id)a3
{
  id v4 = a3;
  id v5 = [(HFControlItem *)self valueSource];
  id v6 = [v5 metadataForCharacteristicType:v4];

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:HFItemUpdateOptionDisableOptionalData];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F58190];
    uint64_t v7 = [(HFControlItem *)self displayResults];
    uint64_t v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = MEMORY[0x263EFFA78];
    }
    uint64_t v10 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    unint64_t v11 = [v6 futureWithResult:v10];
  }
  else
  {
    uint64_t v8 = [(HFControlItem *)self readValueAndPopulateStandardResults];
    unint64_t v11 = [v8 flatMap:&__block_literal_global_57];
  }

  return v11;
}

id __45__HFControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)MEMORY[0x263F58190];
  id v3 = +[HFItemUpdateOutcome outcomeWithResults:a2];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

void __28__HFControlItem_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  v1 = [v0 appendCharacteristic:&__block_literal_global_144_0];
  id v2 = [v1 appendCharacteristic:&__block_literal_global_147_1 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_150_1];
  id v3 = (id)[v2 appendCharacteristic:&__block_literal_global_153_0];

  uint64_t v4 = [v0 build];

  int v5 = (void *)qword_26AB2E7A8;
  qword_26AB2E7A8 = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2E7A0 != -1) {
    dispatch_once(&qword_26AB2E7A0, &__block_literal_global_137_0);
  }
  id v2 = (void *)qword_26AB2E7A8;
  return (NAIdentity *)v2;
}

BOOL __50__HFControlItem_supportsItemRepresentingServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_characteristicOfType:", *(void *)(a1 + 32));
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 requiresDeviceUnlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayResults, 0);
  objc_storeStrong((id *)&self->_characteristicOptions, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

id __41__HFControlItem__accessorySuspendedState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  BOOL v3 = [a2 accessory];
  unint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "suspendedState"));

  return v4;
}

id __52__HFControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained resultsForBatchReadResponse:v3];
    uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];
  }

  return v7;
}

uint64_t __50__HFControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HFControlItem_supportsItemRepresentingServices___block_invoke_2;
  v8[3] = &unk_26408E0E8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = [(HFControlItem *)self characteristicOptions];
  id v6 = [(HFControlItem *)self copyWithCharacteristicOptions:v5 valueSource:v4];

  return v6;
}

- (HFControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFControlItem;
  uint64_t v12 = [(HFControlItem *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_valueSource, a3);
    objc_storeStrong((id *)&v13->_characteristicOptions, a4);
    uint64_t v14 = [v11 copy];
    displayResults = v13->_displayResults;
    v13->_displayResults = (NSDictionary *)v14;
  }
  return v13;
}

- (id)_descriptionWithCharacteristicOptions:(BOOL)a3 includeResults:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [MEMORY[0x263F58188] builderWithObject:self];
  if (v5)
  {
    uint64_t v8 = [(HFControlItem *)self characteristicOptions];
    id v9 = (id)[v7 appendObject:v8 withName:@"characteristics"];
  }
  if (v4)
  {
    id v10 = [(HFItem *)self latestResults];
    id v11 = (id)[v7 appendObject:v10 withName:@"latestResults"];
  }
  uint64_t v12 = [v7 build];

  return v12;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HFControlItem *)self characteristicOptions];
  id v6 = [v5 allRequiredCharacteristicTypes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__HFControlItem_supportsItemRepresentingServices___block_invoke;
  v10[3] = &unk_26408D210;
  id v11 = v4;
  id v7 = v4;
  char v8 = objc_msgSend(v6, "na_all:", v10);

  return v8;
}

+ (Class)valueClass
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFControlItem.m", 46, @"%s is an abstract method that must be overriden by subclass %@", "+[HFControlItem valueClass]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (HFControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [HFControlItemCharacteristicOptions alloc];
  uint64_t v16 = &unk_26C0F65B8;
  v17[0] = v9;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

  v13 = [(HFControlItemCharacteristicOptions *)v11 initWithCharacteristicTypesByUsage:v12];
  uint64_t v14 = [(HFControlItem *)self initWithValueSource:v10 characteristicOptions:v13 displayResults:v8];

  return v14;
}

- (HFControlItem)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = NSStringFromSelector(sel_initWithValueSource_characteristicOptions_displayResults_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFControlItem.m", 69, @"%s is unavailable; use %@ instead",
    "-[HFControlItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(HFControlItem *)self valueSource];
  id v5 = [(HFControlItem *)self copyWithValueSource:v4];

  return v5;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 characteristicTypesForUsage:0];
  if ([v5 count])
  {
    id v6 = [v4 allRequiredCharacteristicTypes];
    id v7 = [(HFControlItem *)self characteristicOptions];
    id v8 = [v7 allRequiredCharacteristicTypes];
    char v9 = [v6 isSubsetOfSet:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  char v9 = [(HFControlItem *)self displayResults];
  id v10 = (void *)[v8 initWithValueSource:v6 characteristicOptions:v7 displayResults:v9];

  [v10 copyLatestResultsFromItem:self];
  return v10;
}

- (NSSet)characteristicTypes
{
  id v2 = [(HFControlItem *)self characteristicOptions];
  id v3 = [v2 characteristicTypesForUsage:0];

  return (NSSet *)v3;
}

- (id)writeValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(id)objc_opt_class() valueClass];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = [(id)objc_opt_class() valueClass];
      NSLog(&cfstr_ValueIsNotComp.isa, v4, self, v5);
    }
  }
  id v6 = [(HFControlItem *)self characteristicValuesForValue:v4];
  if ([v6 count])
  {
    id v7 = objc_opt_new();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __28__HFControlItem_writeValue___block_invoke;
    v12[3] = &unk_26408CF10;
    v12[4] = self;
    id v13 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    char v9 = [(HFControlItem *)self valueSource];
    id v10 = [v9 writeValuesForCharacteristicRecipes:v8];
  }
  else
  {
    id v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v10;
}

void __28__HFControlItem_writeValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 servicePredicateForCharacteristicType:v7 withUsage:1];
  id v8 = [[HFServiceStateCharacteristicRecipe alloc] initWithCharacteristicType:v7 servicePredicate:v9 required:1];

  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v8];
}

- (id)_tintColor
{
  if (qword_26AB2E798 != -1) {
    dispatch_once(&qword_26AB2E798, &__block_literal_global_114);
  }
  id v3 = [(HFControlItem *)self valueSource];
  id v4 = [v3 primaryServiceDescriptor];
  uint64_t v5 = [v4 serviceType];

  if (([v5 isEqualToString:*MEMORY[0x263F0D7D0]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x263F0D828]])
  {
    id v6 = [(HFControlItem *)self valueSource];
    id v7 = [v6 allServices];
    id v8 = [v7 anyObject];
    uint64_t v9 = objc_msgSend(v8, "hf_effectiveServiceType");

    uint64_t v5 = (void *)v9;
  }
  id v10 = [(id)_MergedGlobals_5_0 objectForKeyedSubscript:v5];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x263F1C550] systemYellowColor];
  }
  id v13 = v12;

  return v13;
}

void __27__HFControlItem__tintColor__block_invoke()
{
  v24[21] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F0D780];
  uint64_t v22 = [MEMORY[0x263F1C550] systemYellowColor];
  v24[0] = v22;
  v23[1] = *MEMORY[0x263F0D7D0];
  long long v21 = [MEMORY[0x263F1C550] systemYellowColor];
  v24[1] = v21;
  v23[2] = *MEMORY[0x263F0D828];
  uint64_t v20 = [MEMORY[0x263F1C550] systemYellowColor];
  v24[2] = v20;
  v23[3] = *MEMORY[0x263F0D618];
  id v19 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[3] = v19;
  v23[4] = *MEMORY[0x263F0D6C8];
  __int16 v18 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[4] = v18;
  v23[5] = *MEMORY[0x263F0D708];
  objc_super v17 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[5] = v17;
  v23[6] = *MEMORY[0x263F0D720];
  uint64_t v16 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[6] = v16;
  v23[7] = *MEMORY[0x263F0D870];
  uint64_t v15 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[7] = v15;
  v23[8] = *MEMORY[0x263F0D890];
  uint64_t v14 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[8] = v14;
  v23[9] = *MEMORY[0x263F0D8B8];
  id v13 = [MEMORY[0x263F1C550] systemCyanColor];
  v24[9] = v13;
  v23[10] = *MEMORY[0x263F0D6A8];
  id v12 = [MEMORY[0x263F1C550] systemMintColor];
  v24[10] = v12;
  v23[11] = *MEMORY[0x263F0D6F8];
  v0 = [MEMORY[0x263F1C550] systemMintColor];
  v24[11] = v0;
  v23[12] = *MEMORY[0x263F0D798];
  v1 = [MEMORY[0x263F1C550] systemMintColor];
  v24[12] = v1;
  v23[13] = *MEMORY[0x263F0D788];
  id v2 = [MEMORY[0x263F1C550] systemMintColor];
  v24[13] = v2;
  v23[14] = *MEMORY[0x263F0D7D8];
  id v3 = [MEMORY[0x263F1C550] systemMintColor];
  v24[14] = v3;
  v23[15] = *MEMORY[0x263F0D8A8];
  id v4 = [MEMORY[0x263F1C550] systemMintColor];
  v24[15] = v4;
  v23[16] = *MEMORY[0x263F0D6D8];
  uint64_t v5 = [MEMORY[0x263F1C550] systemBlueColor];
  v24[16] = v5;
  v23[17] = *MEMORY[0x263F0D740];
  id v6 = [MEMORY[0x263F1C550] systemBlueColor];
  v24[17] = v6;
  v23[18] = *MEMORY[0x263F0D880];
  id v7 = [MEMORY[0x263F1C550] systemBlueColor];
  v24[18] = v7;
  v23[19] = *MEMORY[0x263F0D738];
  id v8 = [MEMORY[0x263F1C550] systemTealColor];
  v24[19] = v8;
  v23[20] = *MEMORY[0x263F0D850];
  uint64_t v9 = [MEMORY[0x263F1C550] systemTealColor];
  v24[20] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:21];
  id v11 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = v10;
}

- (id)valueForCharacteristicValues:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x263F08690];
  id v6 = a3;
  id v7 = [v5 currentHandler];
  [v7 handleFailureInMethod:a2, self, @"HFControlItem.m", 318, @"%s is an abstract method that must be overriden by subclass %@", "-[HFControlItem valueForCharacteristicValues:]", objc_opt_class() object file lineNumber description];

  id v8 = [v6 allValues];

  uint64_t v9 = [v8 firstObject];

  return v9;
}

- (id)characteristicValuesForValue:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFControlItem.m", 324, @"%s is an abstract method that must be overriden by subclass %@", "-[HFControlItem characteristicValuesForValue:]", objc_opt_class() object file lineNumber description];

  return (id)MEMORY[0x263EFFA78];
}

- (id)normalizedValueForValue:(id)a3
{
  id v4 = [(HFControlItem *)self characteristicValuesForValue:a3];
  uint64_t v5 = [(HFControlItem *)self valueForCharacteristicValues:v4];

  return v5;
}

- (int64_t)sortPriority
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(HFControlItem *)self characteristicOptions];
  id v3 = [v2 allCharacteristicTypes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    int64_t v7 = -1000;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(MEMORY[0x263F0E248], "hf_sortPriorityForCharacteristicType:", *(void *)(*((void *)&v11 + 1) + 8 * i));
        if (v7 <= v9) {
          int64_t v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v7 = -1000;
  }

  return v7;
}

- (id)normalizedCharacteristicValuesForValues:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__HFControlItem_normalizedCharacteristicValuesForValues___block_invoke;
  v5[3] = &unk_264091A30;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "na_dictionaryByMappingValues:", v5);
  return v3;
}

uint64_t __57__HFControlItem_normalizedCharacteristicValuesForValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) normalizedValueForCharacteristicValue:a3 ofType:a2];
}

- (NSString)description
{
  return (NSString *)[(HFControlItem *)self _descriptionWithCharacteristicOptions:0 includeResults:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HFControlItem *)self _descriptionWithCharacteristicOptions:1 includeResults:1];
}

@end