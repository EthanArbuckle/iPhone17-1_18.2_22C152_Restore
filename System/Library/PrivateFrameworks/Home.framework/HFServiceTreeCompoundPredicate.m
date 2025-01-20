@interface HFServiceTreeCompoundPredicate
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFServiceTreeCompoundPredicate)initWithRootServicePredicate:(id)a3 childServicePredicates:(id)a4;
- (HFServiceTreeMatching)rootServicePredicate;
- (NSArray)childServicePredicates;
- (NSString)description;
- (id)matchingServicesForRootService:(id)a3;
- (unint64_t)hash;
@end

@implementation HFServiceTreeCompoundPredicate

- (HFServiceTreeCompoundPredicate)initWithRootServicePredicate:(id)a3 childServicePredicates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceTreeCompoundPredicate;
  v9 = [(HFServiceTreeCompoundPredicate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootServicePredicate, a3);
    objc_storeStrong((id *)&v10->_childServicePredicates, a4);
  }

  return v10;
}

- (id)matchingServicesForRootService:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFServiceTreeCompoundPredicate *)self rootServicePredicate];
  v6 = [v5 matchingServicesForRootService:v4];
  id v7 = (void *)[v6 mutableCopy];

  if ([v7 count])
  {
    id v20 = v4;
    v22 = objc_msgSend(v4, "hf_childServices");
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = [(HFServiceTreeCompoundPredicate *)self childServicePredicates];
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v13 = v22;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = [v12 matchingServicesForRootService:*(void *)(*((void *)&v23 + 1) + 8 * j)];
                [v7 unionSet:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v15);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    id v4 = v20;
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFServiceTreeCompoundPredicate *)self rootServicePredicate];
  id v5 = (id)[v3 appendObject:v4 withName:@"rootServicePredicate"];

  v6 = [(HFServiceTreeCompoundPredicate *)self childServicePredicates];
  [v3 appendArraySection:v6 withName:@"childServicePredicates" skipIfEmpty:0];

  id v7 = [v3 build];

  return (NSString *)v7;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2FF00 != -1) {
    dispatch_once(&qword_26AB2FF00, &__block_literal_global_118_2);
  }
  v2 = (void *)qword_26AB2FF08;
  return (NAIdentity *)v2;
}

void __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_123_3];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_126_1];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2FF08;
  qword_26AB2FF08 = v3;
}

uint64_t __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 rootServicePredicate];
}

uint64_t __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 childServicePredicates];
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

- (HFServiceTreeMatching)rootServicePredicate
{
  return self->_rootServicePredicate;
}

- (NSArray)childServicePredicates
{
  return self->_childServicePredicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServicePredicates, 0);
  objc_storeStrong((id *)&self->_rootServicePredicate, 0);
}

@end