@interface HFControlItemCharacteristicOptions
+ (HFControlItemCharacteristicOptions)optionsWithReadWriteCharacteristicTypes:(id)a3;
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFControlItemCharacteristicOptions)init;
- (HFControlItemCharacteristicOptions)initWithCharacteristicTypesByUsage:(id)a3;
- (NSDictionary)characteristicTypesByUsage;
- (NSSet)allCharacteristicTypes;
- (NSSet)allRequiredCharacteristicTypes;
- (NSString)description;
- (id)_characteristicTypesForUsagesPassingTest:(id)a3;
- (id)_optionsByReducingWithOptions:(id)a3 reducer:(id)a4;
- (id)characteristicTypesForUsage:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)optionsByAddingCharacteristicOptions:(id)a3;
- (id)optionsByAddingCharacteristicTypes:(id)a3 forUsage:(unint64_t)a4;
- (id)optionsByIntersectingWithOptions:(id)a3;
- (unint64_t)hash;
@end

@implementation HFControlItemCharacteristicOptions

uint64_t __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 characteristicTypesByUsage];
}

uint64_t __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_5(uint64_t a1, void *a2)
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

- (void).cxx_destruct
{
}

id __79__HFControlItemCharacteristicOptions__characteristicTypesForUsagesPassingTest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((*(unsigned int (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 unsignedIntegerValue]))
  {
    [v8 unionSet:v7];
  }

  return v8;
}

uint64_t __60__HFControlItemCharacteristicOptions_allCharacteristicTypes__block_invoke()
{
  return 1;
}

BOOL __68__HFControlItemCharacteristicOptions_allRequiredCharacteristicTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 2;
}

- (id)_optionsByReducingWithOptions:(id)a3 reducer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([v6 characteristicTypesByUsage],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    v10 = [(HFControlItemCharacteristicOptions *)self characteristicTypesByUsage];
    v11 = objc_msgSend(v10, "na_dictionaryByMappingValues:", &__block_literal_global_237);
    v12 = (void *)[v11 mutableCopy];

    v13 = [v6 characteristicTypesByUsage];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_2;
    v21 = &unk_264091B40;
    id v22 = v12;
    id v23 = v7;
    id v14 = v12;
    [v13 enumerateKeysAndObjectsUsingBlock:&v18];

    id v15 = objc_alloc((Class)objc_opt_class());
    v16 = (HFControlItemCharacteristicOptions *)objc_msgSend(v15, "initWithCharacteristicTypesByUsage:", v14, v18, v19, v20, v21);
  }
  else
  {
    v16 = self;
  }

  return v16;
}

- (id)_characteristicTypesForUsagesPassingTest:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlItemCharacteristicOptions *)self characteristicTypesByUsage];
  id v6 = [MEMORY[0x263EFF9C0] set];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__HFControlItemCharacteristicOptions__characteristicTypesForUsagesPassingTest___block_invoke;
  v10[3] = &unk_264091AD8;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);

  return v8;
}

- (NSDictionary)characteristicTypesByUsage
{
  return self->_characteristicTypesByUsage;
}

- (NSSet)allRequiredCharacteristicTypes
{
  return (NSSet *)[(HFControlItemCharacteristicOptions *)self _characteristicTypesForUsagesPassingTest:&__block_literal_global_227];
}

- (NSSet)allCharacteristicTypes
{
  return (NSSet *)[(HFControlItemCharacteristicOptions *)self _characteristicTypesForUsagesPassingTest:&__block_literal_global_225];
}

id __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  return v3;
}

void __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_260 withRole:3 comparatorBlock:0 hashBlock:&__block_literal_global_262];
  uint64_t v2 = [v0 build];

  uint64_t v3 = (void *)qword_26AB2E7B8;
  qword_26AB2E7B8 = v2;
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

+ (NAIdentity)na_identity
{
  if (qword_26AB2E7B0 != -1) {
    dispatch_once(&qword_26AB2E7B0, &__block_literal_global_255);
  }
  uint64_t v2 = (void *)qword_26AB2E7B8;
  return (NAIdentity *)v2;
}

uint64_t __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_3()
{
  return [MEMORY[0x263EFF9C0] set];
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v4 = [a3 unsignedIntegerValue];
  return [(HFControlItemCharacteristicOptions *)self characteristicTypesForUsage:v4];
}

- (id)characteristicTypesForUsage:(unint64_t)a3
{
  uint64_t v4 = [(HFControlItemCharacteristicOptions *)self characteristicTypesByUsage];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v9 = v8;

  return v9;
}

void __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", a2, &__block_literal_global_240);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __75__HFControlItemCharacteristicOptions_optionsByAddingCharacteristicOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionSet:");
}

+ (HFControlItemCharacteristicOptions)optionsWithReadWriteCharacteristicTypes:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v9 = &unk_26C0F65B8;
  v10[0] = v4;
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = (void *)[v5 initWithCharacteristicTypesByUsage:v6];
  return (HFControlItemCharacteristicOptions *)v7;
}

- (HFControlItemCharacteristicOptions)init
{
  return [(HFControlItemCharacteristicOptions *)self initWithCharacteristicTypesByUsage:MEMORY[0x263EFFA78]];
}

- (id)optionsByAddingCharacteristicTypes:(id)a3 forUsage:(unint64_t)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [HFControlItemCharacteristicOptions alloc];
  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  v13 = v8;
  v14[0] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [(HFControlItemCharacteristicOptions *)v7 initWithCharacteristicTypesByUsage:v9];
  id v11 = [(HFControlItemCharacteristicOptions *)self optionsByAddingCharacteristicOptions:v10];

  return v11;
}

- (HFControlItemCharacteristicOptions)initWithCharacteristicTypesByUsage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFControlItemCharacteristicOptions;
  id v5 = [(HFControlItemCharacteristicOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    characteristicTypesByUsage = v5->_characteristicTypesByUsage;
    v5->_characteristicTypesByUsage = (NSDictionary *)v6;
  }
  return v5;
}

- (id)optionsByAddingCharacteristicOptions:(id)a3
{
  return [(HFControlItemCharacteristicOptions *)self _optionsByReducingWithOptions:a3 reducer:&__block_literal_global_232_0];
}

id __49__HFControlItemCharacteristicOptions_description__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  uint64_t v3 = (void *)MEMORY[0x263F0E248];
  id v4 = a2;
  id v5 = [v3 localizedDescriptionForCharacteristicType:v4];
  uint64_t v6 = [v2 stringWithFormat:@"%@ (%@)", v5, v4];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [v3 activeMultilinePrefix];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __49__HFControlItemCharacteristicOptions_description__block_invoke;
  id v11 = &unk_26408D450;
  v12 = self;
  id v13 = v3;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"characteristicsByUsage" multilinePrefix:v4 block:&v8];

  uint64_t v6 = objc_msgSend(v5, "build", v8, v9, v10, v11, v12);

  return (NSString *)v6;
}

void __49__HFControlItemCharacteristicOptions_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v9 = [a3 allObjects];
  uint64_t v6 = objc_msgSend(v9, "na_map:", &__block_literal_global_247_0);
  unint64_t v7 = [v5 unsignedIntegerValue];

  if (v7 > 2) {
    uint64_t v8 = @"(unknown)";
  }
  else {
    uint64_t v8 = off_264091BA8[v7];
  }
  [v4 appendArraySection:v6 withName:v8 skipIfEmpty:1];
}

void __49__HFControlItemCharacteristicOptions_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) characteristicTypesByUsage];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__HFControlItemCharacteristicOptions_description__block_invoke_2;
  v3[3] = &unk_264091B68;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

- (id)optionsByIntersectingWithOptions:(id)a3
{
  return [(HFControlItemCharacteristicOptions *)self _optionsByReducingWithOptions:a3 reducer:&__block_literal_global_234];
}

uint64_t __71__HFControlItemCharacteristicOptions_optionsByIntersectingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectSet:");
}

@end