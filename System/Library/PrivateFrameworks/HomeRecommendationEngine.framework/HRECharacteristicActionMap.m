@interface HRECharacteristicActionMap
+ (id)characteristicActionMap:(id)a3;
+ (id)conditonalCharacteristicActionMap:(id)a3 condition:(id)a4;
+ (id)emptyMap;
- (HRECharacteristicActionMap)initWithMap:(id)a3 condition:(id)a4;
- (NSMutableDictionary)characteristicTypeValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flattenedMapEvaluatedForObject:(id)a3;
- (id)mergeWithActionMaps:(id)a3;
- (void)setCharacteristicTypeValues:(id)a3;
@end

@implementation HRECharacteristicActionMap

- (HRECharacteristicActionMap)initWithMap:(id)a3 condition:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HRECharacteristicActionMap;
  v7 = [(HREActionMap *)&v11 initWithCondition:a4 childMaps:0];
  if (v7)
  {
    uint64_t v8 = [v6 mutableCopy];
    characteristicTypeValues = v7->_characteristicTypeValues;
    v7->_characteristicTypeValues = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (id)emptyMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__HRECharacteristicActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_268944C08 != -1) {
    dispatch_once(&qword_268944C08, block);
  }
  v2 = (void *)_MergedGlobals_23;

  return v2;
}

uint64_t __38__HRECharacteristicActionMap_emptyMap__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  _MergedGlobals_23 = [v1 initWithMap:MEMORY[0x263EFFA78] condition:0];

  return MEMORY[0x270F9A758]();
}

+ (id)characteristicActionMap:(id)a3
{
  id v3 = a3;
  v4 = [[HRECharacteristicActionMap alloc] initWithMap:v3 condition:0];

  return v4;
}

+ (id)conditonalCharacteristicActionMap:(id)a3 condition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[HRECharacteristicActionMap alloc] initWithMap:v6 condition:v5];

  return v7;
}

- (id)mergeWithActionMaps:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_5);

    if (objc_msgSend(v5, "na_all:", &__block_literal_global_4))
    {
      id v6 = +[HREActionMap emptyMap];
      if ([(HRECharacteristicActionMap *)self isEqual:v6])
      {
        v7 = [HRECharacteristicActionMap alloc];
        uint64_t v8 = [(HRECharacteristicActionMap *)v7 initWithMap:MEMORY[0x263EFFA78] condition:0];
      }
      else
      {
        uint64_t v8 = [(HRECharacteristicActionMap *)self copy];
      }
      v10 = (void *)v8;

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_3;
      v12[3] = &unk_264CF4230;
      v9 = v10;
      v13 = v9;
      objc_msgSend(v5, "na_each:", v12);
    }
    else
    {
      NSLog(&cfstr_CannotMergeMap.isa, self, v5);
      v9 = self;
    }
  }
  else
  {
    v9 = self;
    id v5 = v4;
  }

  return v9;
}

uint64_t __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HREActionMap emptyMap];
  int v4 = [v2 isEqual:v3];

  return v4 ^ 1u;
}

uint64_t __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 characteristicTypeValues];
  id v5 = [v4 allKeys];
  id v6 = (void *)[v5 mutableCopy];

  v7 = [*(id *)(a1 + 32) characteristicTypeValues];
  uint64_t v8 = [v7 allKeys];
  [v6 removeObjectsInArray:v8];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_4;
  v15 = &unk_264CF4208;
  id v16 = *(id *)(a1 + 32);
  id v17 = v3;
  id v9 = v3;
  objc_msgSend(v6, "na_each:", &v12);
  v10 = objc_msgSend(*(id *)(a1 + 32), "childMaps", v12, v13, v14, v15);
  objc_super v11 = [v9 childMaps];
  [v10 addObjectsFromArray:v11];
}

void __50__HRECharacteristicActionMap_mergeWithActionMaps___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v7 = [v3 characteristicTypeValues];
  id v5 = [v7 objectForKeyedSubscript:v4];
  id v6 = [*(id *)(a1 + 32) characteristicTypeValues];
  [v6 setObject:v5 forKeyedSubscript:v4];
}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HRECharacteristicActionMap;
  id v5 = [(HREActionMap *)&v10 flattenedMapEvaluatedForObject:v4];
  if (v5)
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      goto LABEL_8;
    }
    NSLog(&cfstr_SuperFlattened.isa, self, v4, v6);
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HRECharacteristicActionMap;
  id v4 = [(HREActionMap *)&v12 copyWithZone:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HRECharacteristicActionMap *)self characteristicTypeValues];
  id v9 = (void *)[v8 mutableCopy];
  if (v9)
  {
    [v7 setCharacteristicTypeValues:v9];
  }
  else
  {
    objc_super v10 = [MEMORY[0x263EFF9A0] dictionary];
    [v7 setCharacteristicTypeValues:v10];
  }
  return v5;
}

- (NSMutableDictionary)characteristicTypeValues
{
  return self->_characteristicTypeValues;
}

- (void)setCharacteristicTypeValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end