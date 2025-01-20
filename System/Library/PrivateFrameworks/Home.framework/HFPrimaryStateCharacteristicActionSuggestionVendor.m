@interface HFPrimaryStateCharacteristicActionSuggestionVendor
- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4;
- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4 bucketingPolicy:(unint64_t)a5;
- (NSString)characteristicType;
- (id)_bucketingValueForAction:(id)a3;
- (id)normalStateValue;
- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4;
- (unint64_t)bucketingPolicy;
@end

@implementation HFPrimaryStateCharacteristicActionSuggestionVendor

- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4
{
  return [(HFPrimaryStateCharacteristicActionSuggestionVendor *)self initWithCharacteristicType:a3 normalStateValue:a4 bucketingPolicy:0];
}

- (HFPrimaryStateCharacteristicActionSuggestionVendor)initWithCharacteristicType:(id)a3 normalStateValue:(id)a4 bucketingPolicy:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFPrimaryStateCharacteristicActionSuggestionVendor;
  v11 = [(HFPrimaryStateCharacteristicActionSuggestionVendor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristicType, a3);
    objc_storeStrong(&v12->_normalStateValue, a4);
    v12->_bucketingPolicy = a5;
  }

  return v12;
}

- (id)suggestedActionForCharacteristic:(id)a3 candidateActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F08760]);
  id v9 = [v7 allObjects];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke;
  v39[3] = &unk_2640991D8;
  v39[4] = self;
  id v10 = objc_msgSend(v9, "na_map:", v39);
  v11 = (void *)[v8 initWithArray:v10];

  v12 = [v11 allObjects];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2;
  v37[3] = &unk_26408DF60;
  id v13 = v11;
  id v38 = v13;
  objc_super v14 = [v12 sortedArrayUsingComparator:v37];

  v15 = [v14 firstObject];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3;
  v33[3] = &unk_264099200;
  id v16 = v15;
  id v34 = v16;
  id v17 = v13;
  id v35 = v17;
  id v18 = v14;
  id v36 = v18;
  if (__104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3((uint64_t)v33))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_4;
    v30[3] = &unk_264099228;
    id v19 = v16;
    id v31 = v19;
    v32 = self;
    v20 = objc_msgSend(v7, "na_filter:", v30);
    if ([v20 count])
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5;
      v25[3] = &unk_264099250;
      id v21 = v19;
      id v26 = v21;
      v27 = self;
      id v28 = v6;
      id v29 = v20;
      v22 = __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5((uint64_t)v25);
      v23 = [(HFPrimaryStateCharacteristicActionSuggestionVendor *)self normalStateValue];
      objc_msgSend(v22, "setIsMutuallyExclusiveAction:", objc_msgSend(v21, "isEqual:", v23));
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bucketingValueForAction:a2];
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "countForObject:", a3));
  id v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) countForObject:v7];

  v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "countForObject:")) {
    return 0;
  }
  if ([*(id *)(a1 + 48) count] == 1) {
    return 1;
  }
  uint64_t v3 = [*(id *)(a1 + 40) countForObject:*(void *)(a1 + 32)];
  v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 48) objectAtIndexedSubscript:1];
  BOOL v2 = v3 != [v4 countForObject:v5];

  return v2;
}

uint64_t __104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _bucketingValueForAction:a2];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

HFCustomCharacteristicActionSuggestionResult *__104__HFPrimaryStateCharacteristicActionSuggestionVendor_suggestedActionForCharacteristic_candidateActions___block_invoke_5(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF9D0] null];

  if (v2 == v3)
  {
    v5 = [HFIncrementalStateCharacteristicActionSuggestionVendor alloc];
    id v6 = [*(id *)(a1 + 40) characteristicType];
    id v7 = [(HFIncrementalStateCharacteristicActionSuggestionVendor *)v5 initWithCharacteristicType:v6];
    uint64_t v4 = [(HFIncrementalStateCharacteristicActionSuggestionVendor *)v7 suggestedActionForCharacteristic:*(void *)(a1 + 48) candidateActions:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v4 = [[HFCustomCharacteristicActionSuggestionResult alloc] initWithCharacteristic:*(void *)(a1 + 48) targetValue:*(void *)(a1 + 32) matchingActions:*(void *)(a1 + 56)];
  }
  return v4;
}

- (id)_bucketingValueForAction:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(HFPrimaryStateCharacteristicActionSuggestionVendor *)self bucketingPolicy];
  if (v6 == 1)
  {
    id v7 = [v5 targetValue];
    id v8 = [(HFPrimaryStateCharacteristicActionSuggestionVendor *)self normalStateValue];
    if ([v7 isEqual:v8]) {
      [v5 targetValue];
    }
    else {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
    }
  }
  else if (!v6)
  {
    uint64_t v3 = [v5 targetValue];
  }

  return v3;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (id)normalStateValue
{
  return self->_normalStateValue;
}

- (unint64_t)bucketingPolicy
{
  return self->_bucketingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_normalStateValue, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

@end