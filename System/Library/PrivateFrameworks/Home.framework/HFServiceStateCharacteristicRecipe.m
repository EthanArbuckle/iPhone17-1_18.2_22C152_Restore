@interface HFServiceStateCharacteristicRecipe
+ (NAIdentity)na_identity;
+ (id)recipeForRootServiceCharacteristicType:(id)a3 required:(BOOL)a4;
+ (id)recipesForRootServiceCharacteristicTypes:(id)a3 required:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRequired;
- (HFServiceStateCharacteristicRecipe)initWithCharacteristicType:(id)a3 servicePredicate:(id)a4 required:(BOOL)a5;
- (HFServiceTreeMatching)servicePredicate;
- (NSString)characteristicType;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)matchResultForServices:(id)a3;
- (unint64_t)hash;
@end

@implementation HFServiceStateCharacteristicRecipe

uint64_t __61__HFServiceStateCharacteristicRecipe_matchResultForServices___block_invoke()
{
  return [MEMORY[0x263EFF9C0] set];
}

- (HFServiceStateCharacteristicRecipe)initWithCharacteristicType:(id)a3 servicePredicate:(id)a4 required:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceStateCharacteristicRecipe;
  v11 = [(HFServiceStateCharacteristicRecipe *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristicType, a3);
    objc_storeStrong((id *)&v12->_servicePredicate, a4);
    v12->_required = a5;
  }

  return v12;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (id)matchResultForServices:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23 = [MEMORY[0x263EFF9C0] set];
  v5 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v8 = [(HFServiceStateCharacteristicRecipe *)self servicePredicate];
        id v9 = [v8 matchingServicesForRootService:v7];

        if ([v9 count])
        {
          uint64_t v27 = i;
          [v23 unionSet:v9];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v26 = v9;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v29 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                v16 = [(HFServiceStateCharacteristicRecipe *)self characteristicType];
                v17 = objc_msgSend(v15, "hf_characteristicOfType:", v16);

                if (v17)
                {
                  v18 = [v15 uniqueIdentifier];
                  v19 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v18, &__block_literal_global_205_0);
                  [v19 addObject:v17];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
            }
            while (v12);
          }

          id v9 = v26;
          uint64_t i = v27;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }

  v20 = [[HFServiceStateCharacteristicMatchResult alloc] initWithServices:v23 characteristicsByServiceUUID:v5];
  return v20;
}

- (HFServiceTreeMatching)servicePredicate
{
  return self->_servicePredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePredicate, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

+ (id)recipeForRootServiceCharacteristicType:(id)a3 required:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = +[HFServiceTreeTypePredicate anyServiceTypePredicate];
  id v9 = (void *)[v7 initWithCharacteristicType:v6 servicePredicate:v8 required:v4];

  return v9;
}

+ (id)recipesForRootServiceCharacteristicTypes:(id)a3 required:(BOOL)a4
{
  BOOL v4 = (void *)MEMORY[0x263EFFA08];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__HFServiceStateCharacteristicRecipe_recipesForRootServiceCharacteristicTypes_required___block_invoke;
  v8[3] = &__block_descriptor_41_e54___HFServiceStateCharacteristicRecipe_16__0__NSString_8l;
  v8[4] = a1;
  BOOL v9 = a4;
  v5 = objc_msgSend(a3, "na_map:", v8);
  id v6 = [v4 setWithArray:v5];

  return v6;
}

uint64_t __88__HFServiceStateCharacteristicRecipe_recipesForRootServiceCharacteristicTypes_required___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) recipeForRootServiceCharacteristicType:a2 required:*(unsigned __int8 *)(a1 + 40)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFServiceStateCharacteristicRecipe *)self characteristicType];
  id v6 = [(HFServiceStateCharacteristicRecipe *)self servicePredicate];
  id v7 = objc_msgSend(v4, "initWithCharacteristicType:servicePredicate:required:", v5, v6, -[HFServiceStateCharacteristicRecipe isRequired](self, "isRequired"));

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (void *)MEMORY[0x263F0E248];
  v5 = [(HFServiceStateCharacteristicRecipe *)self characteristicType];
  id v6 = [v4 localizedDescriptionForCharacteristicType:v5];
  [v3 appendString:v6 withName:@"characteristicType"];

  id v7 = [(HFServiceStateCharacteristicRecipe *)self servicePredicate];
  id v8 = (id)[v3 appendObject:v7 withName:@"servicePredicate"];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFServiceStateCharacteristicRecipe isRequired](self, "isRequired"), @"required");
  id v10 = [v3 build];

  return (NSString *)v10;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2FF20 != -1) {
    dispatch_once(&qword_26AB2FF20, &__block_literal_global_219_2);
  }
  v2 = (void *)qword_26AB2FF28;
  return (NAIdentity *)v2;
}

void __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_224_1];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_227_2];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_230_0];
  uint64_t v4 = [v0 build];

  v5 = (void *)qword_26AB2FF28;
  qword_26AB2FF28 = v4;
}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristicType];
}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 servicePredicate];
}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 isRequired];
  return [v2 numberWithBool:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isRequired
{
  return self->_required;
}

@end