@interface HFCharacteristicValueDisplayError
+ (id)errorWithCategory:(unint64_t)a3;
+ (id)errorWithUnderlyingError:(id)a3 readTraits:(id)a4 contextProvider:(id)a5;
+ (id)errorWithUnderlyingSymptom:(id)a3 isFixingCurrently:(BOOL)a4 contextProvider:(id)a5;
+ (id)mostEgregiousError:(id)a3;
- (BOOL)isPersistentError;
- (BOOL)isThreadNetworkError;
- (HFCharacteristicOperationContextProviding)contextProvider;
- (HMSymptom)underlyingSymptom;
- (NSError)underlyingError;
- (id)description;
- (unint64_t)category;
- (void)setCategory:(unint64_t)a3;
- (void)setContextProvider:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)setUnderlyingSymptom:(id)a3;
@end

@implementation HFCharacteristicValueDisplayError

+ (id)errorWithUnderlyingError:(id)a3 readTraits:(id)a4 contextProvider:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 domain];
  uint64_t v11 = *MEMORY[0x263F0C710];
  int v12 = [v10 isEqualToString:*MEMORY[0x263F0C710]];

  if (v12)
  {
    v13 = [v7 userInfo];
    v14 = [v13 valueForKey:*MEMORY[0x263F08608]];

    uint64_t v15 = [v7 code];
    if (v15 > 77)
    {
      if (v15 != 78)
      {
        if (v15 == 87)
        {
          uint64_t v16 = 6;
          goto LABEL_6;
        }
        uint64_t v16 = 0;
        if (v15 != 103) {
          goto LABEL_6;
        }
LABEL_49:
        v25 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      if ((unint64_t)v15 > 0x3B)
      {
        uint64_t v16 = 0;
        goto LABEL_6;
      }
      if (((1 << v15) & 0x840000000004300) != 0) {
        goto LABEL_5;
      }
      uint64_t v16 = 0;
      if (v15 != 4) {
        goto LABEL_6;
      }
      v24 = [v14 domain];
      if ([v24 isEqualToString:v11])
      {
        if ([v14 code] == 2400)
        {

          goto LABEL_49;
        }
        uint64_t v27 = [v14 code];

        if (v27 == 2401) {
          goto LABEL_49;
        }
      }
      else
      {
      }
    }
LABEL_5:
    uint64_t v16 = 1;
LABEL_6:

LABEL_35:
    v25 = objc_alloc_init(HFCharacteristicValueDisplayError);
    [(HFCharacteristicValueDisplayError *)v25 setCategory:v16];
    [(HFCharacteristicValueDisplayError *)v25 setContextProvider:v9];
    v14 = (void *)[v7 copy];
    [(HFCharacteristicValueDisplayError *)v25 setUnderlyingError:v14];
LABEL_36:

    goto LABEL_37;
  }
  v17 = [v7 domain];
  int v18 = [v17 isEqualToString:@"HFErrorDomain"];

  if (!v18)
  {
    uint64_t v16 = 0;
    goto LABEL_35;
  }
  uint64_t v19 = [v7 code];
  if (v19 > 57)
  {
    uint64_t v20 = 11;
    uint64_t v21 = 12;
    if (v19 != 72) {
      uint64_t v21 = 0;
    }
    if (v19 != 71) {
      uint64_t v20 = v21;
    }
    uint64_t v22 = 9;
    uint64_t v23 = 10;
    if (v19 != 70) {
      uint64_t v23 = 0;
    }
    if (v19 != 58) {
      uint64_t v22 = v23;
    }
    if (v19 <= 70) {
      uint64_t v16 = v22;
    }
    else {
      uint64_t v16 = v20;
    }
    goto LABEL_35;
  }
  if ((unint64_t)(v19 - 34) < 2)
  {
    uint64_t v16 = 1;
    goto LABEL_35;
  }
  if (v19 != 4)
  {
    if (v19 == 56) {
      uint64_t v16 = 8;
    }
    else {
      uint64_t v16 = 0;
    }
    goto LABEL_35;
  }
  if ([v8 containsObject:@"DoesNotSupportNotifications"])
  {
    uint64_t v16 = 5;
    goto LABEL_35;
  }
  if (([v8 containsObject:@"InvalidOrMissingAuthorizationData"] & 1) != 0
    || [v8 containsObject:@"AdditionalSetupRequired"])
  {
    uint64_t v16 = 6;
    goto LABEL_35;
  }
  v25 = 0;
LABEL_37:

  return v25;
}

+ (id)errorWithUnderlyingSymptom:(id)a3 isFixingCurrently:(BOOL)a4 contextProvider:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = objc_alloc_init(HFCharacteristicValueDisplayError);
  [(HFCharacteristicValueDisplayError *)v8 setCategory:7];
  [(HFCharacteristicValueDisplayError *)v8 setContextProvider:v6];

  [(HFCharacteristicValueDisplayError *)v8 setUnderlyingSymptom:v7];
  return v8;
}

+ (id)mostEgregiousError:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    v5 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_23_1);
    id v6 = objc_msgSend(v3, "na_filter:", &__block_literal_global_25_2);
    id v7 = v6;
    if (v5)
    {
      uint64_t v8 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_27_3);
      id v9 = (void *)v8;
      if (v8) {
        v10 = (void *)v8;
      }
      else {
        v10 = v5;
      }
      id v4 = v10;
    }
    else if ([v6 count] == 1)
    {
      id v4 = [v7 anyObject];
    }
    else if ((unint64_t)[v7 count] < 2)
    {
      v29 = v7;
      v13 = objc_msgSend(v3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_34_1);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v14 = *MEMORY[0x263F0C710];
      v34[0] = @"HFErrorDomain";
      v34[1] = v14;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            uint64_t v21 = [v20 allObjects];
            uint64_t v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_40_0];

            if ([v22 count])
            {
              v24 = v15;
              goto LABEL_22;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      uint64_t v23 = [v13 allKeys];
      v24 = [v23 sortedArrayUsingSelector:sel_compare_];

      v25 = [v24 firstObject];
      v26 = [v13 objectForKey:v25];
      uint64_t v27 = [v26 allObjects];
      uint64_t v22 = [v27 sortedArrayUsingComparator:&__block_literal_global_40_0];

LABEL_22:
      id v4 = [v22 firstObject];

      id v7 = v29;
    }
    else
    {
      uint64_t v11 = [v7 allObjects];
      int v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_30_4];

      id v4 = [v12 firstObject];
    }
  }
  else
  {
    id v4 = [v3 anyObject];
  }

  return v4;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 underlyingError];
  uint64_t v3 = objc_msgSend(v2, "hf_isHomeKitUnreachableError");

  return v3;
}

BOOL __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 underlyingSymptom];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 underlyingSymptom];
  if ([v3 type] == 11)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v2 underlyingSymptom];
    if ([v5 type] == 19)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [v2 underlyingSymptom];
      if ([v6 type] == 1)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [v2 underlyingSymptom];
        if ([v7 type] == 20)
        {
          BOOL v4 = 1;
        }
        else
        {
          uint64_t v8 = [v2 underlyingSymptom];
          BOOL v4 = [v8 type] == 2;
        }
      }
    }
  }

  return v4;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 underlyingSymptom];
  id v6 = [v4 underlyingSymptom];

  objc_msgSend(MEMORY[0x263F0E830], "hf_symptomArraySortComparator");
  id v7 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v8 = ((uint64_t (**)(void, void *, void *))v7)[2](v7, v5, v6);

  return v8;
}

id __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = NSString;
  BOOL v3 = [a2 underlyingError];
  id v4 = [v3 domain];
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 underlyingError];
  id v7 = [v6 domain];
  uint64_t v8 = [v5 underlyingError];
  id v9 = [v8 domain];
  uint64_t v10 = [v7 compare:v9];

  if (!v10)
  {
    uint64_t v11 = NSNumber;
    int v12 = [v4 underlyingError];
    v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "code"));
    uint64_t v14 = NSNumber;
    uint64_t v15 = [v5 underlyingError];
    uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
    uint64_t v10 = [v13 compare:v16];
  }
  return v10;
}

+ (id)errorWithCategory:(unint64_t)a3
{
  id v4 = objc_alloc_init(HFCharacteristicValueDisplayError);
  [(HFCharacteristicValueDisplayError *)v4 setCategory:a3];
  return v4;
}

- (BOOL)isPersistentError
{
  BOOL v3 = [(HFCharacteristicValueDisplayError *)self contextProvider];
  uint64_t v4 = objc_msgSend(v3, "hf_remoteAccessState");

  return [(HFCharacteristicValueDisplayError *)self category] - 5 < 8 || (unint64_t)(v4 - 1) < 2;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCharacteristicValueDisplayError category](self, "category"));
  id v5 = (id)[v3 appendObject:v4 withName:@"category"];

  id v6 = [(HFCharacteristicValueDisplayError *)self underlyingError];
  id v7 = (id)[v3 appendObject:v6 withName:@"error" skipIfNil:1];

  uint64_t v8 = [(HFCharacteristicValueDisplayError *)self underlyingSymptom];
  id v9 = (id)[v3 appendObject:v8 withName:@"symptom" skipIfNil:1];

  uint64_t v10 = [v3 build];

  return v10;
}

- (BOOL)isThreadNetworkError
{
  return [(HFCharacteristicValueDisplayError *)self category] == 4
      || [(HFCharacteristicValueDisplayError *)self category] == 2
      || [(HFCharacteristicValueDisplayError *)self category] == 3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  return self->_contextProvider;
}

- (void)setContextProvider:(id)a3
{
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (HMSymptom)underlyingSymptom
{
  return self->_underlyingSymptom;
}

- (void)setUnderlyingSymptom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSymptom, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
}

@end