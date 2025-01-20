@interface HFContainedObjectListDifference
+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5;
+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5 block:(id)a6;
- (BOOL)isASubsetOfB;
- (BOOL)isBSubsetOfA;
- (NSArray)containedObjectResults;
- (NSNumber)isASubsetOfBValue;
- (NSNumber)isBSubsetOfAValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilder;
- (id)reevaluateWithBlock:(id)a3;
- (void)setContainedObjectResults:(id)a3;
- (void)setIsASubsetOfBValue:(id)a3;
- (void)setIsBSubsetOfAValue:(id)a3;
@end

@implementation HFContainedObjectListDifference

+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5 block:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = (void *)MEMORY[0x263EFF9A0];
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 dictionary];
  v15 = objc_msgSend(v13, "na_reduceWithInitialValue:reducer:", v14, &__block_literal_global_127);

  v16 = [MEMORY[0x263EFF9A0] dictionary];
  v17 = objc_msgSend(v12, "na_reduceWithInitialValue:reducer:", v16, &__block_literal_global_130);

  v18 = (void *)MEMORY[0x263EFFA08];
  v19 = [v15 allKeys];
  v20 = [v18 setWithArray:v19];

  v21 = (void *)MEMORY[0x263EFFA08];
  v22 = [v17 allKeys];
  v23 = [v21 setWithArray:v22];

  v24 = [v20 setByAddingObjectsFromSet:v23];
  v25 = [MEMORY[0x263EFF9A0] dictionary];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_3;
  v35[3] = &unk_26408E680;
  id v26 = v10;
  id v38 = v26;
  id v27 = v15;
  id v36 = v27;
  id v28 = v17;
  id v37 = v28;
  v29 = objc_msgSend(v24, "na_reduceWithInitialValue:reducer:", v25, v35);

  v30 = [v29 allValues];
  int v31 = objc_msgSend(v30, "na_any:", &__block_literal_global_135);

  if (v31)
  {
    v32 = [(HFDifference *)[HFContainedObjectListDifference alloc] initWithKey:v9 priority:2];
    v33 = [v29 allValues];
    [(HFContainedObjectListDifference *)v32 setContainedObjectResults:v33];
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = NSNumber;
  id v6 = a2;
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  [v4 setObject:v6 forKeyedSubscript:v7];

  return v4;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = NSNumber;
  id v6 = a2;
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  [v4 setObject:v6 forKeyedSubscript:v7];

  return v4;
}

id __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
  v11 = (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v9, v10);
  [v5 setObject:v11 forKeyedSubscript:v8];

  return v5;
}

BOOL __92__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB_block___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 realDifferences];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)containedObjectDifferenceWithKey:(id)a3 objectsA:(id)a4 objectsB:(id)a5
{
  return (id)[a1 containedObjectDifferenceWithKey:a3 objectsA:a4 objectsB:a5 block:&__block_literal_global_139];
}

HFComparisonResult *__86__HFContainedObjectListDifference_containedObjectDifferenceWithKey_objectsA_objectsB___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 conformsToProtocol:&unk_26C101FA0]) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  id v8 = v5;
  if ([v8 conformsToProtocol:&unk_26C101FA0]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v4)
  {
    v11 = [v7 compareToObject:v10];
  }
  else
  {
    v11 = [[HFComparisonResult alloc] initWithObjectA:v7 objectB:v10];
  }
  id v12 = v11;

  return v12;
}

- (BOOL)isASubsetOfB
{
  isASubsetOfBValue = self->_isASubsetOfBValue;
  if (!isASubsetOfBValue)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    id v4 = [(HFContainedObjectListDifference *)self containedObjectResults];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__HFContainedObjectListDifference_isASubsetOfB__block_invoke;
    v8[3] = &unk_26408E6E8;
    v8[4] = &v9;
    objc_msgSend(v4, "na_each:", v8);

    id v5 = [NSNumber numberWithBool:*((unsigned __int8 *)v10 + 24)];
    uint64_t v6 = self->_isASubsetOfBValue;
    self->_isASubsetOfBValue = v5;

    _Block_object_dispose(&v9, 8);
    isASubsetOfBValue = self->_isASubsetOfBValue;
  }
  return [(NSNumber *)isASubsetOfBValue BOOLValue];
}

void __47__HFContainedObjectListDifference_isASubsetOfB__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectA];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [v7 realDifferences];
    uint64_t v6 = [v5 count];

    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

- (BOOL)isBSubsetOfA
{
  isBSubsetOfAValue = self->_isBSubsetOfAValue;
  if (!isBSubsetOfAValue)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    id v4 = [(HFContainedObjectListDifference *)self containedObjectResults];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__HFContainedObjectListDifference_isBSubsetOfA__block_invoke;
    v8[3] = &unk_26408E6E8;
    v8[4] = &v9;
    objc_msgSend(v4, "na_each:", v8);

    id v5 = [NSNumber numberWithBool:*((unsigned __int8 *)v10 + 24)];
    uint64_t v6 = self->_isBSubsetOfAValue;
    self->_isBSubsetOfAValue = v5;

    _Block_object_dispose(&v9, 8);
    isBSubsetOfAValue = self->_isBSubsetOfAValue;
  }
  return [(NSNumber *)isBSubsetOfAValue BOOLValue];
}

void __47__HFContainedObjectListDifference_isBSubsetOfA__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectB];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [v7 realDifferences];
    uint64_t v6 = [v5 count];

    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

- (id)reevaluateWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(HFContainedObjectListDifference *)self copy];
  uint64_t v6 = [(HFContainedObjectListDifference *)self containedObjectResults];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__HFContainedObjectListDifference_reevaluateWithBlock___block_invoke;
  v10[3] = &unk_26408E710;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_map:", v10);

  [v5 setContainedObjectResults:v8];
  [v5 setIsASubsetOfBValue:0];
  [v5 setIsBSubsetOfAValue:0];

  return v5;
}

id __55__HFContainedObjectListDifference_reevaluateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 objectA];
  id v5 = [v3 objectB];
  uint64_t v6 = (*(void (**)(uint64_t, void *, void *, id))(v2 + 16))(v2, v4, v5, v3);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFContainedObjectListDifference;
  id v4 = [(HFDifference *)&v11 copyWithZone:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HFContainedObjectListDifference *)self containedObjectResults];
  uint64_t v9 = (void *)[v8 copy];
  [v7 setContainedObjectResults:v9];

  return v7;
}

- (id)descriptionBuilder
{
  v8.receiver = self;
  v8.super_class = (Class)HFContainedObjectListDifference;
  id v3 = [(HFDifference *)&v8 descriptionBuilder];
  id v4 = [(HFContainedObjectListDifference *)self containedObjectResults];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_189);
  id v6 = (id)[v3 appendObject:v5 withName:@"contained results"];

  return v3;
}

BOOL __53__HFContainedObjectListDifference_descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 realDifferences];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)containedObjectResults
{
  return self->_containedObjectResults;
}

- (void)setContainedObjectResults:(id)a3
{
}

- (NSNumber)isASubsetOfBValue
{
  return self->_isASubsetOfBValue;
}

- (void)setIsASubsetOfBValue:(id)a3
{
}

- (NSNumber)isBSubsetOfAValue
{
  return self->_isBSubsetOfAValue;
}

- (void)setIsBSubsetOfAValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isBSubsetOfAValue, 0);
  objc_storeStrong((id *)&self->_isASubsetOfBValue, 0);
  objc_storeStrong((id *)&self->_containedObjectResults, 0);
}

@end