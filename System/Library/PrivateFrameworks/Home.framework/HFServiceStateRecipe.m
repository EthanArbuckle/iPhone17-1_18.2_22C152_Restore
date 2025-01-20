@interface HFServiceStateRecipe
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFServiceStateRecipe)initWithPredicate:(id)a3 characteristicRecipes:(id)a4;
- (HFServiceTreeMatching)predicate;
- (NSSet)characteristicRecipes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)matchResultForServices:(id)a3;
- (unint64_t)hash;
@end

@implementation HFServiceStateRecipe

- (HFServiceStateRecipe)initWithPredicate:(id)a3 characteristicRecipes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceStateRecipe;
  v9 = [(HFServiceStateRecipe *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_characteristicRecipes, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFServiceStateRecipe *)self predicate];
  v6 = [(HFServiceStateRecipe *)self characteristicRecipes];
  id v7 = (void *)[v4 initWithPredicate:v5 characteristicRecipes:v6];

  return v7;
}

- (id)matchResultForServices:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    v21 = self;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v8 = [(HFServiceStateRecipe *)self predicate];
        v9 = [v8 matchingServicesForRootService:v7];

        if ([v9 count])
        {
          v24 = v9;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v10 = [(HFServiceStateRecipe *)self characteristicRecipes];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v26 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                v16 = [MEMORY[0x263EFFA08] setWithObject:v7];
                v17 = [v15 matchResultForServices:v16];

                [v5 addObject:v17];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v12);
          }

          self = v21;
          v9 = v24;
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  v18 = +[HFServiceStateCharacteristicMatchResult matchResultByMergingResults:v5];

  return v18;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFServiceStateRecipe *)self predicate];
  id v5 = (id)[v3 appendObject:v4 withName:@"predicate"];

  v6 = [(HFServiceStateRecipe *)self characteristicRecipes];
  uint64_t v7 = [v6 allObjects];
  [v3 appendArraySection:v7 withName:@"characteristicRecipes" skipIfEmpty:0];

  id v8 = [v3 build];

  return (NSString *)v8;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2FF30 != -1) {
    dispatch_once(&qword_26AB2FF30, &__block_literal_global_266_0);
  }
  v2 = (void *)qword_26AB2FF38;
  return (NAIdentity *)v2;
}

void __35__HFServiceStateRecipe_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_271];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_274];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2FF38;
  qword_26AB2FF38 = v3;
}

uint64_t __35__HFServiceStateRecipe_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 predicate];
}

uint64_t __35__HFServiceStateRecipe_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 characteristicRecipes];
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

- (HFServiceTreeMatching)predicate
{
  return self->_predicate;
}

- (NSSet)characteristicRecipes
{
  return self->_characteristicRecipes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicRecipes, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end