@interface HFServiceStateCharacteristicMatchResult
+ (NAIdentity)na_identity;
+ (id)matchResultByMergingResults:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HFServiceStateCharacteristicMatchResult)init;
- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristics:(id)a4;
- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristicsByServiceUUID:(id)a4;
- (NSDictionary)characteristicsByServiceUUID;
- (NSDictionary)servicesByUUID;
- (NSSet)allCharacteristics;
- (NSSet)services;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation HFServiceStateCharacteristicMatchResult

uint64_t __61__HFServiceStateCharacteristicMatchResult_allCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allObjects];
}

- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristicsByServiceUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceStateCharacteristicMatchResult;
  v9 = [(HFServiceStateCharacteristicMatchResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_services, a3);
    objc_storeStrong((id *)&v10->_characteristicsByServiceUUID, a4);
  }

  return v10;
}

- (NSSet)allCharacteristics
{
  allCharacteristics = self->_allCharacteristics;
  if (!allCharacteristics)
  {
    v4 = (void *)MEMORY[0x263EFFA08];
    v5 = [(HFServiceStateCharacteristicMatchResult *)self characteristicsByServiceUUID];
    v6 = [v5 allValues];
    id v7 = objc_msgSend(v6, "na_flatMap:", &__block_literal_global_153_3);
    id v8 = [v4 setWithArray:v7];
    v9 = self->_allCharacteristics;
    self->_allCharacteristics = v8;

    allCharacteristics = self->_allCharacteristics;
  }
  return allCharacteristics;
}

- (NSDictionary)characteristicsByServiceUUID
{
  return self->_characteristicsByServiceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicsByServiceUUID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_servicesByUUID, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
}

- (HFServiceStateCharacteristicMatchResult)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(HFServiceStateCharacteristicMatchResult *)self initWithServices:v3 characteristicsByServiceUUID:MEMORY[0x263EFFA78]];

  return v4;
}

- (HFServiceStateCharacteristicMatchResult)initWithServices:(id)a3 characteristics:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_146_2);
  id v8 = [(HFServiceStateCharacteristicMatchResult *)self initWithServices:v6 characteristicsByServiceUUID:v7];

  return v8;
}

id __76__HFServiceStateCharacteristicMatchResult_initWithServices_characteristics___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 service];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (NSDictionary)servicesByUUID
{
  servicesByUUID = self->_servicesByUUID;
  if (!servicesByUUID)
  {
    v4 = [(HFServiceStateCharacteristicMatchResult *)self services];
    objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_150_2);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_servicesByUUID;
    self->_servicesByUUID = v5;

    servicesByUUID = self->_servicesByUUID;
  }
  return servicesByUUID;
}

uint64_t __57__HFServiceStateCharacteristicMatchResult_servicesByUUID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

+ (id)matchResultByMergingResults:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9C0] set];
  v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 services];
        [v4 unionSet:v11];

        objc_super v12 = [v10 characteristicsByServiceUUID];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke;
        v16[3] = &unk_26409CDB8;
        id v17 = v5;
        [v12 enumerateKeysAndObjectsUsingBlock:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v13 = [[HFServiceStateCharacteristicMatchResult alloc] initWithServices:v4 characteristicsByServiceUUID:v5];
  return v13;
}

void __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "na_objectForKey:withDefaultValue:", a2, &__block_literal_global_157);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 unionSet:v5];
}

uint64_t __71__HFServiceStateCharacteristicMatchResult_matchResultByMergingResults___block_invoke_2()
{
  return [MEMORY[0x263EFF9C0] set];
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFServiceStateCharacteristicMatchResult *)self characteristicsByServiceUUID];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __54__HFServiceStateCharacteristicMatchResult_description__block_invoke;
  v11 = &unk_26409CDE0;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

void __54__HFServiceStateCharacteristicMatchResult_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v11 = [a3 allObjects];
  uint64_t v7 = objc_msgSend(v11, "na_map:", &__block_literal_global_162_0);
  uint64_t v8 = [*(id *)(a1 + 40) servicesByUUID];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  v10 = objc_msgSend(v9, "hf_prettyDescription");
  [v5 appendArraySection:v7 withName:v10 skipIfEmpty:0];
}

uint64_t __54__HFServiceStateCharacteristicMatchResult_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_prettyDescription");
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2FF10 != -1) {
    dispatch_once(&qword_26AB2FF10, &__block_literal_global_166_1);
  }
  v2 = (void *)qword_26AB2FF18;
  return (NAIdentity *)v2;
}

void __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_171_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_174_1];
  uint64_t v3 = [v0 build];

  v4 = (void *)qword_26AB2FF18;
  qword_26AB2FF18 = v3;
}

uint64_t __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 services];
}

uint64_t __54__HFServiceStateCharacteristicMatchResult_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 characteristicsByServiceUUID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NSSet)services
{
  return self->_services;
}

@end