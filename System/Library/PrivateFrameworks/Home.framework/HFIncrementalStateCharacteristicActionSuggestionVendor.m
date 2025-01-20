@interface HFIncrementalStateCharacteristicActionSuggestionVendor
- (HFIncrementalStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3;
- (NSString)characteristicType;
- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4;
@end

@implementation HFIncrementalStateCharacteristicActionSuggestionVendor

- (HFIncrementalStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFIncrementalStateCharacteristicActionSuggestionVendor;
  v6 = [(HFIncrementalStateCharacteristicActionSuggestionVendor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_characteristicType, a3);
  }

  return v7;
}

- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_178);
  if ([v7 count])
  {
    v8 = [v7 allObjects];
    objc_super v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    v10 = [v9 lastObject];
    v11 = [v5 metadata];
    v12 = objc_msgSend(v11, "hf_normalizedValueForValue:", v10);

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2;
    v17[3] = &unk_264099298;
    id v18 = v12;
    id v13 = v12;
    v14 = objc_msgSend(v6, "na_filter:", v17);
    v15 = [[HFCustomCharacteristicActionSuggestionResult alloc] initWithCharacteristic:v5 targetValue:v13 matchingActions:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  v3 = [v2 targetValue];

  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

BOOL __108__HFIncrementalStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  v4 = [v3 targetValue];

  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    BOOL v7 = [v6 compare:*(void *)(a1 + 32)] != -1;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (void).cxx_destruct
{
}

@end