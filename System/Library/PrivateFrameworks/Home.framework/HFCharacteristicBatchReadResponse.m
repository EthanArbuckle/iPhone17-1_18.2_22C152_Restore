@interface HFCharacteristicBatchReadResponse
+ (NAIdentity)na_identity;
+ (id)_aggregatedValueForValues:(id)a3 withAggregationPolicy:(unint64_t)a4 metadata:(id)a5;
+ (id)_averageValueForValues:(id)a3 metadata:(id)a4;
+ (id)_mostAbnormalValueForValues:(id)a3;
+ (id)_mostCommonValueForValues:(id)a3;
+ (id)aggregatedMetadataForCharacteristics:(id)a3;
+ (id)aggregatedReadResponseFromResponses:(id)a3 withAggregationPolicy:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (HFCharacteristicBatchReadResponse)init;
- (HFCharacteristicBatchReadResponse)initWithReadResponses:(id)a3 contextProvider:(id)a4;
- (HFCharacteristicOperationContextProviding)contextProvider;
- (NSDictionary)responseKeyedByCharacteristicUUID;
- (NSDictionary)responsesKeyedByCharacteristicType;
- (NSSet)allCharacteristicTypes;
- (NSSet)allCharacteristics;
- (NSSet)allFailedReadResponses;
- (NSSet)allReadResponses;
- (NSSet)allServices;
- (NSString)description;
- (id)_aggregatedMetadataForCharacteristicType:(id)a3;
- (id)_responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4 filter:(id)a5;
- (id)allResponsesForCharacteristicRecipe:(id)a3;
- (id)allResponsesForCharacteristicType:(id)a3;
- (id)allResponsesForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4;
- (id)allResponsesForCharacteristicTypes:(id)a3;
- (id)batchResponseForService:(id)a3;
- (id)batchResponseForService:(id)a3 includeChildServices:(BOOL)a4;
- (id)responseForCharacteristic:(id)a3;
- (id)responseForCharacteristicRecipe:(id)a3;
- (id)responseForCharacteristicType:(id)a3;
- (id)responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4;
- (id)responseForCharacteristicType:(id)a3 inService:(id)a4;
- (id)responseForCharacteristicType:(id)a3 inService:(id)a4 aggregationPolicy:(unint64_t)a5;
- (id)responseForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4;
- (id)servicesWithErrorForCharacteristicType:(id)a3;
- (id)servicesWithValue:(id)a3 forCharacteristicType:(id)a4;
- (id)servicesWithValuesPassingTest:(id)a3 forCharacteristicType:(id)a4;
- (unint64_t)defaultAggregationPolicyForCharacteristicType:(id)a3;
- (unint64_t)hash;
@end

@implementation HFCharacteristicBatchReadResponse

uint64_t __55__HFCharacteristicBatchReadResponse_allCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 service];
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

- (id)responseForCharacteristicRecipe:(id)a3
{
  id v4 = a3;
  v5 = [(HFCharacteristicBatchReadResponse *)self allResponsesForCharacteristicRecipe:v4];
  v6 = objc_opt_class();
  v7 = [v4 characteristicType];

  v8 = objc_msgSend(v6, "aggregatedReadResponseFromResponses:withAggregationPolicy:", v5, -[HFCharacteristicBatchReadResponse defaultAggregationPolicyForCharacteristicType:](self, "defaultAggregationPolicyForCharacteristicType:", v7));

  return v8;
}

- (id)allResponsesForCharacteristicRecipe:(id)a3
{
  id v4 = a3;
  v5 = [(HFCharacteristicBatchReadResponse *)self responsesKeyedByCharacteristicType];
  v6 = [v4 characteristicType];
  v7 = [v5 objectForKeyedSubscript:v6];

  v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_45_1);
  v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_48_3);
  v10 = [v4 matchResultForServices:v9];

  v11 = [v10 allCharacteristics];
  v12 = objc_msgSend(v11, "na_setByIntersectingWithSet:", v8);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_3;
  v16[3] = &unk_26408FAC8;
  id v17 = v12;
  id v13 = v12;
  v14 = objc_msgSend(v7, "na_filter:", v16);

  return v14;
}

- (id)responseForCharacteristicType:(id)a3
{
  id v4 = a3;
  v5 = [(HFCharacteristicBatchReadResponse *)self responseForCharacteristicType:v4 aggregationPolicy:[(HFCharacteristicBatchReadResponse *)self defaultAggregationPolicyForCharacteristicType:v4]];

  return v5;
}

- (unint64_t)defaultAggregationPolicyForCharacteristicType:(id)a3
{
  v3 = [(HFCharacteristicBatchReadResponse *)self _aggregatedMetadataForCharacteristicType:a3];
  if (objc_msgSend(v3, "hf_isNumeric"))
  {
    unint64_t v4 = 0;
  }
  else
  {
    v5 = [v3 format];
    unint64_t v4 = [v5 isEqualToString:*MEMORY[0x263F0BE38]] ^ 1;
  }
  return v4;
}

- (id)responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4
{
  return [(HFCharacteristicBatchReadResponse *)self _responseForCharacteristicType:a3 aggregationPolicy:a4 filter:0];
}

- (id)_aggregatedMetadataForCharacteristicType:(id)a3
{
  v3 = [(HFCharacteristicBatchReadResponse *)self allResponsesForCharacteristicType:a3];
  unint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_68_3);

  v5 = [(id)objc_opt_class() aggregatedMetadataForCharacteristics:v4];

  return v5;
}

+ (id)aggregatedMetadataForCharacteristics:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    id v7 = 0;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v5 = 138412802;
    long long v18 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "metadata", v18);
        v12 = v11;
        if (v7)
        {
          if ((objc_msgSend(v7, "hf_isEqualToMetadata:", v11) & 1) == 0)
          {
            id v13 = HFLogForCategory(0);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v14 = objc_msgSend(v10, "hf_characteristicTypeDescription");
              v15 = objc_msgSend(v12, "hf_prettyDescription");
              v16 = objc_msgSend(v7, "hf_prettyDescription");
              *(_DWORD *)buf = v18;
              v24 = v14;
              __int16 v25 = 2112;
              v26 = v15;
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Found different metadata for characteristic type %@! %@ and %@ are not identical. Using the first metadata found.", buf, 0x20u);
            }
          }
        }
        else
        {
          id v7 = v11;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_responseForCharacteristicType:(id)a3 aggregationPolicy:(unint64_t)a4 filter:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(HFCharacteristicBatchReadResponse *)self responsesKeyedByCharacteristicType];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (v8)
  {
    uint64_t v12 = objc_msgSend(v11, "na_filter:", v8);

    v11 = (void *)v12;
  }
  id v13 = [(id)objc_opt_class() aggregatedReadResponseFromResponses:v11 withAggregationPolicy:a4];

  return v13;
}

- (id)allResponsesForCharacteristicType:(id)a3
{
  id v4 = a3;
  long long v5 = [(HFCharacteristicBatchReadResponse *)self responsesKeyedByCharacteristicType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)responsesKeyedByCharacteristicType
{
  return self->_responsesKeyedByCharacteristicType;
}

+ (id)aggregatedReadResponseFromResponses:(id)a3 withAggregationPolicy:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = (void *)MEMORY[0x263F08760];
    id v9 = [v6 allObjects];
    v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_59_3);
    v11 = [v8 setWithArray:v10];

    uint64_t v12 = objc_msgSend(v6, "na_map:", &__block_literal_global_61_2);
    id v13 = [a1 aggregatedMetadataForCharacteristics:v12];

    v14 = [a1 _aggregatedValueForValues:v11 withAggregationPolicy:a4 metadata:v13];
    v15 = objc_msgSend(v6, "na_map:", &__block_literal_global_63_2);
    v16 = objc_msgSend(v15, "na_setByFlattening");
    id v17 = [v16 setByAddingObject:@"Aggregated"];

    long long v18 = [v6 anyObject];
    long long v19 = [v18 characteristic];

    long long v20 = objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_65_0);
    long long v21 = [v20 error];

    id v7 = [[HFCharacteristicReadResponse alloc] initWithCharacteristic:v19 readTraits:v17 value:v14 error:v21];
  }
  else
  {
    id v7 = [v6 anyObject];
  }

  return v7;
}

- (id)allResponsesForCharacteristicTypes:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicTypes___block_invoke;
  v5[3] = &unk_26408CEC0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "na_flatMap:", v5);
  return v3;
}

uint64_t __82__HFCharacteristicBatchReadResponse_batchResponseForService_includeChildServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_4;
  }
  long long v5 = *(void **)(a1 + 32);
  id v6 = [v3 characteristic];
  id v7 = [v6 service];
  LOBYTE(v5) = [v5 containsObject:v7];

  if (v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
LABEL_4:
    id v9 = [v4 characteristic];
    v10 = [v9 service];
    uint64_t v8 = [v10 isEqual:*(void *)(a1 + 40)];
  }
  return v8;
}

- (HFCharacteristicBatchReadResponse)initWithReadResponses:(id)a3 contextProvider:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HFCharacteristicBatchReadResponse;
  id v9 = [(HFCharacteristicBatchReadResponse *)&v37 init];
  v10 = v9;
  if (v9)
  {
    id v30 = v8;
    objc_storeStrong((id *)&v9->_allReadResponses, a3);
    v29 = v10;
    objc_storeStrong((id *)&v10->_contextProvider, a4);
    v11 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v31 = v7;
    id obj = v7;
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v18 = [v17 characteristic];
          long long v19 = [v18 uniqueIdentifier];

          long long v20 = [(NSDictionary *)v11 objectForKeyedSubscript:v19];

          if (v20)
          {
            long long v21 = [(NSDictionary *)v11 objectForKeyedSubscript:v19];
            NSLog(&cfstr_GotMultipleHfc.isa, v17, v21);
          }
          [(NSDictionary *)v11 setObject:v17 forKeyedSubscript:v19];
          long long v22 = [v17 characteristic];
          v23 = [v22 characteristicType];
          v24 = [(NSDictionary *)v12 na_objectForKey:v23 withDefaultValue:&__block_literal_global_183];

          [v24 addObject:v17];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v14);
    }

    v10 = v29;
    responseKeyedByCharacteristicUUID = v29->_responseKeyedByCharacteristicUUID;
    v29->_responseKeyedByCharacteristicUUID = v11;
    v26 = v11;

    responsesKeyedByCharacteristicType = v29->_responsesKeyedByCharacteristicType;
    v29->_responsesKeyedByCharacteristicType = v12;

    id v8 = v30;
    id v7 = v31;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_296 != -1) {
    dispatch_once(&_MergedGlobals_296, &__block_literal_global_17_8);
  }
  v2 = (void *)qword_26AB2FA88;
  return (NAIdentity *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsesKeyedByCharacteristicType, 0);
  objc_storeStrong((id *)&self->_responseKeyedByCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_allReadResponses, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
  objc_storeStrong((id *)&self->_allCharacteristicTypes, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

uint64_t __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 contextProvider];
}

uint64_t __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 allReadResponses];
}

id __48__HFCharacteristicBatchReadResponse_allServices__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristic];
  id v3 = [v2 service];

  return v3;
}

- (NSSet)allCharacteristics
{
  allCharacteristics = self->_allCharacteristics;
  if (!allCharacteristics)
  {
    unint64_t v4 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
    objc_msgSend(v4, "na_map:", &__block_literal_global_36_5);
    long long v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_allCharacteristics;
    self->_allCharacteristics = v5;

    allCharacteristics = self->_allCharacteristics;
  }
  return allCharacteristics;
}

- (NSSet)allReadResponses
{
  return self->_allReadResponses;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  return self->_contextProvider;
}

uint64_t __73__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicRecipe___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __72__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) allResponsesForCharacteristicType:a2];
}

- (id)batchResponseForService:(id)a3
{
  return [(HFCharacteristicBatchReadResponse *)self batchResponseForService:a3 includeChildServices:0];
}

uint64_t __75__HFCharacteristicBatchReadResponse_initWithReadResponses_contextProvider___block_invoke()
{
  return [MEMORY[0x263EFF9C0] set];
}

- (id)batchResponseForService:(id)a3 includeChildServices:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = objc_msgSend(v6, "hf_childServices");
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__HFCharacteristicBatchReadResponse_batchResponseForService_includeChildServices___block_invoke;
  v17[3] = &unk_2640993F0;
  BOOL v20 = v4;
  id v18 = v8;
  id v19 = v7;
  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = objc_msgSend(v9, "na_filter:", v17);

  uint64_t v13 = [HFCharacteristicBatchReadResponse alloc];
  uint64_t v14 = [(HFCharacteristicBatchReadResponse *)self contextProvider];
  uint64_t v15 = [(HFCharacteristicBatchReadResponse *)v13 initWithReadResponses:v12 contextProvider:v14];

  return v15;
}

id __59__HFCharacteristicBatchReadResponse_allCharacteristicTypes__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 characteristic];
  id v3 = [v2 characteristicType];

  return v3;
}

uint64_t __85__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristic];
  BOOL v4 = [v3 service];
  long long v5 = [v4 serviceType];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

- (NSSet)allCharacteristicTypes
{
  allCharacteristicTypes = self->_allCharacteristicTypes;
  if (!allCharacteristicTypes)
  {
    BOOL v4 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
    objc_msgSend(v4, "na_map:", &__block_literal_global_38_4);
    long long v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_allCharacteristicTypes;
    self->_allCharacteristicTypes = v5;

    allCharacteristicTypes = self->_allCharacteristicTypes;
  }
  return allCharacteristicTypes;
}

- (NSSet)allServices
{
  allServices = self->_allServices;
  if (!allServices)
  {
    BOOL v4 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
    objc_msgSend(v4, "na_map:", &__block_literal_global_50_2);
    long long v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_allServices;
    self->_allServices = v5;

    allServices = self->_allServices;
  }
  return allServices;
}

uint64_t __78__HFCharacteristicBatchReadResponse__aggregatedMetadataForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

- (id)responseForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(HFCharacteristicBatchReadResponse *)self defaultAggregationPolicyForCharacteristicType:v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inServicesOfTypes___block_invoke;
  v12[3] = &unk_26408FAC8;
  id v13 = v6;
  id v9 = v6;
  id v10 = [(HFCharacteristicBatchReadResponse *)self _responseForCharacteristicType:v7 aggregationPolicy:v8 filter:v12];

  return v10;
}

void __48__HFCharacteristicBatchReadResponse_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_24_8];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_26_2];
  uint64_t v3 = [v0 build];

  BOOL v4 = (void *)qword_26AB2FA88;
  qword_26AB2FA88 = v3;
}

- (HFCharacteristicBatchReadResponse)init
{
  BOOL v4 = [MEMORY[0x263F08690] currentHandler];
  long long v5 = NSStringFromSelector(sel_initWithReadResponses_contextProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicBatchReadResponse.m", 33, @"%s is unavailable; use %@ instead",
    "-[HFCharacteristicBatchReadResponse init]",
    v5);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  long long v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
  long long v5 = [v4 allObjects];
  [v3 appendArraySection:v5 withName:@"readResponses" skipIfEmpty:0];

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (NSSet)allFailedReadResponses
{
  id v2 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
  uint64_t v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_33_5);

  return (NSSet *)v3;
}

BOOL __59__HFCharacteristicBatchReadResponse_allFailedReadResponses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)responseForCharacteristic:(id)a3
{
  id v4 = a3;
  long long v5 = [(HFCharacteristicBatchReadResponse *)self responseKeyedByCharacteristicUUID];
  id v6 = [v4 uniqueIdentifier];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (id)responseForCharacteristicType:(id)a3 inService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService___block_invoke;
  v14[3] = &unk_26408FAC8;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(HFCharacteristicBatchReadResponse *)self _responseForCharacteristicType:v6 aggregationPolicy:1 filter:v14];
  id v10 = [v9 readTraits];
  int v11 = [v10 containsObject:@"Aggregated"];

  if (v11)
  {
    uint64_t v12 = objc_msgSend(v8, "hf_prettyDescription");
    NSLog(&cfstr_AskedForARespo.isa, v6, v12);
  }
  return v9;
}

uint64_t __77__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 characteristic];
  id v4 = [v3 service];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)responseForCharacteristicType:(id)a3 inService:(id)a4 aggregationPolicy:(unint64_t)a5
{
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __95__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService_aggregationPolicy___block_invoke;
  v12[3] = &unk_26408FAC8;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(HFCharacteristicBatchReadResponse *)self _responseForCharacteristicType:a3 aggregationPolicy:a5 filter:v12];

  return v10;
}

uint64_t __95__HFCharacteristicBatchReadResponse_responseForCharacteristicType_inService_aggregationPolicy___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 characteristic];
  id v4 = [v3 service];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (id)allResponsesForCharacteristicType:(id)a3 inServicesOfTypes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HFCharacteristicBatchReadResponse *)self responsesKeyedByCharacteristicType];
  id v9 = [v8 objectForKeyedSubscript:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicType_inServicesOfTypes___block_invoke;
  v13[3] = &unk_26408FAC8;
  id v14 = v6;
  id v10 = v6;
  int v11 = objc_msgSend(v9, "na_filter:", v13);

  return v11;
}

uint64_t __89__HFCharacteristicBatchReadResponse_allResponsesForCharacteristicType_inServicesOfTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 characteristic];
  id v4 = [v3 service];
  uint64_t v5 = [v4 serviceType];
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

- (id)servicesWithValue:(id)a3 forCharacteristicType:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__HFCharacteristicBatchReadResponse_servicesWithValue_forCharacteristicType___block_invoke;
  v10[3] = &unk_264099418;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(HFCharacteristicBatchReadResponse *)self servicesWithValuesPassingTest:v10 forCharacteristicType:a4];

  return v8;
}

uint64_t __77__HFCharacteristicBatchReadResponse_servicesWithValue_forCharacteristicType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isEqual:*(void *)(a1 + 32)];
}

- (id)servicesWithValuesPassingTest:(id)a3 forCharacteristicType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke;
  id v17 = &unk_264099440;
  id v18 = v7;
  id v19 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = objc_msgSend(v8, "na_filter:", &v14);
  uint64_t v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_54_2, v14, v15, v16, v17);

  return v12;
}

uint64_t __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristic];
  uint64_t v5 = [v4 characteristicType];
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [v3 characteristic];
    id v8 = [v7 service];
    id v9 = [v3 value];
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v8, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __89__HFCharacteristicBatchReadResponse_servicesWithValuesPassingTest_forCharacteristicType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristic];
  id v3 = [v2 service];

  return v3;
}

- (id)servicesWithErrorForCharacteristicType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFCharacteristicBatchReadResponse *)self allReadResponses];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke;
  v10[3] = &unk_26408FAC8;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_filter:", v10);
  id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_56_2);

  return v8;
}

BOOL __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristic];
  uint64_t v5 = [v4 characteristicType];
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    id v6 = [v3 value];
    if (v6)
    {
      BOOL v7 = 0;
    }
    else
    {
      id v8 = [v3 error];
      BOOL v7 = v8 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id __76__HFCharacteristicBatchReadResponse_servicesWithErrorForCharacteristicType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristic];
  id v3 = [v2 service];

  return v3;
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

uint64_t __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 readTraits];
}

BOOL __95__HFCharacteristicBatchReadResponse_aggregatedReadResponseFromResponses_withAggregationPolicy___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_aggregatedValueForValues:(id)a3 withAggregationPolicy:(unint64_t)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (a4 == 2)
  {
    uint64_t v11 = [a1 _averageValueForValues:v9 metadata:v10];
  }
  else if (a4 == 1)
  {
    uint64_t v11 = [a1 _mostCommonValueForValues:v9];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    uint64_t v11 = [a1 _mostAbnormalValueForValues:v9];
  }
  uint64_t v5 = (void *)v11;
LABEL_8:

  return v5;
}

+ (id)_mostAbnormalValueForValues:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSLog(&cfstr_AttemptingToUs.isa, v10);
          id v13 = [a1 _mostCommonValueForValues:v4];

          goto LABEL_19;
        }
        if (v7)
        {
          if (objc_msgSend(v7, "na_compareAbsoluteValue:", v10) == -1) {
            uint64_t v11 = v10;
          }
          else {
            uint64_t v11 = v7;
          }
          id v12 = v11;

          id v7 = v12;
        }
        else
        {
          id v7 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  id v7 = v7;
  id v13 = v7;
LABEL_19:

  return v13;
}

+ (id)_mostCommonValueForValues:(id)a3
{
  return (id)objc_msgSend(a3, "na_mostCommonObject");
}

+ (id)_averageValueForValues:(id)a3 metadata:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [a4 format];
  if (qword_26AB2FA90 != -1) {
    dispatch_once(&qword_26AB2FA90, &__block_literal_global_76_3);
  }
  id v9 = (id)qword_26AB2FA98;
  if ([v9 containsObject:v8])
  {
    SEL v30 = a2;
    id v31 = a1;
    id v10 = [MEMORY[0x263EFF980] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v18 = [MEMORY[0x263F08690] currentHandler];
            [v18 handleFailureInMethod:v30, v31, @"HFCharacteristicBatchReadResponse.m", 401, @"Expected a numeric value, but received %@ instead!", v16 object file lineNumber description];
          }
          for (uint64_t j = [v11 countForObject:v16]; j; --j)
            [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    double v21 = 0.0;
    double v22 = 0.0;
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * k) doubleValue];
          double v22 = v22 + v26;
        }
        uint64_t v23 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v23);
    }

    if ([v19 count]) {
      double v21 = v22 / (double)(unint64_t)[v19 count];
    }
    if ([v8 isEqualToString:*MEMORY[0x263F0BE40]])
    {
      uint64_t v27 = [NSNumber numberWithDouble:v21];
    }
    else
    {
      if ([v8 isEqualToString:*MEMORY[0x263F0BE68]]) {
        [NSNumber numberWithUnsignedLongLong:(unint64_t)v21];
      }
      else {
      uint64_t v27 = [NSNumber numberWithLongLong:(uint64_t)v21];
      }
    }
    v28 = (void *)v27;
  }
  else
  {
    NSLog(&cfstr_CannotTakeTheA.isa, v8);
    v28 = [a1 _mostCommonValueForValues:v7];
  }

  return v28;
}

void __69__HFCharacteristicBatchReadResponse__averageValueForValues_metadata___block_invoke_2()
{
  v5[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BE40];
  v5[0] = *MEMORY[0x263F0BE48];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0BE58];
  v5[2] = *MEMORY[0x263F0BE70];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x263F0BE68];
  v5[4] = *MEMORY[0x263F0BE60];
  void v5[5] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:6];
  id v4 = (void *)qword_26AB2FA98;
  qword_26AB2FA98 = v3;
}

- (NSDictionary)responseKeyedByCharacteristicUUID
{
  return self->_responseKeyedByCharacteristicUUID;
}

@end