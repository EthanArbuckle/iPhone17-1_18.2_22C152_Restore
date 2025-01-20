@interface HFMultiStateValueSet
+ (id)binaryValueSetWithCharacteristicMetadata:(id)a3 firstValue:(id)a4 firstTitle:(id)a5 secondValue:(id)a6 secondTitle:(id)a7;
- (BOOL)addValue:(id)a3 displayResults:(id)a4;
- (BOOL)addValue:(id)a3 displayResults:(id)a4 addOnlyIfValid:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (HFMultiStateValueSet)init;
- (HFMultiStateValueSet)initWithCharacteristicMetadata:(id)a3;
- (HMCharacteristicMetadata)characteristicMetadata;
- (NSArray)sortedValues;
- (NSMutableDictionary)displayResultsByValue;
- (NSSet)allValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayResultsForValue:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)valueComparator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addValuesFromArray:(id)a3 displayResultsGenerator:(id)a4;
- (void)minusSet:(id)a3;
- (void)removeValue:(id)a3;
- (void)removeValuesFromArray:(id)a3;
- (void)setValueComparator:(id)a3;
- (void)unionSet:(id)a3 displayResultsGenerator:(id)a4;
@end

@implementation HFMultiStateValueSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayResultsByValue, 0);
  objc_storeStrong(&self->_valueComparator, 0);
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
}

+ (id)binaryValueSetWithCharacteristicMetadata:(id)a3 firstValue:(id)a4 firstTitle:(id)a5 secondValue:(id)a6 secondTitle:(id)a7
{
  v29[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a3)
  {
    id v15 = a3;
    v16 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v15];

    v28 = @"title";
    v29[0] = v12;
    v17 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    [(HFMultiStateValueSet *)v16 addValue:v11 displayResults:v17];

    v26 = @"title";
    id v27 = v14;
    v18 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [(HFMultiStateValueSet *)v16 addValue:v13 displayResults:v18];

    v19 = [(HFMultiStateValueSet *)v16 allValues];
    uint64_t v20 = [v19 count];

    if (v20 == 2)
    {
      v25[0] = v11;
      v25[1] = v13;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
      v22 = +[HFUtilities comparatorWithSortedObjects:v21];
      [(HFMultiStateValueSet *)v16 setValueComparator:v22];

      v23 = v16;
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)addValue:(id)a3 displayResults:(id)a4
{
  return [(HFMultiStateValueSet *)self addValue:a3 displayResults:a4 addOnlyIfValid:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFMultiStateValueSet *)self characteristicMetadata];
  v6 = (void *)[v4 initWithCharacteristicMetadata:v5];

  v7 = [(HFMultiStateValueSet *)self displayResultsByValue];
  uint64_t v8 = [v7 mutableCopy];
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = [(HFMultiStateValueSet *)self valueComparator];
  [v6 setValueComparator:v10];

  return v6;
}

- (BOOL)addValue:(id)a3 displayResults:(id)a4 addOnlyIfValid:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFMultiStateControlItem.m", 175, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x263F08690] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"HFMultiStateControlItem.m", 176, @"Invalid parameter not satisfying: %@", @"displayResults" object file lineNumber description];

LABEL_3:
  id v12 = [(HFMultiStateValueSet *)self displayResultsByValue];
  id v13 = [v12 objectForKeyedSubscript:v9];

  if (v13) {
    NSLog(&cfstr_ValueAlreadyEx.isa, v9, self);
  }
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v14 = [(HFMultiStateValueSet *)self characteristicMetadata];
  if (!v14) {
    goto LABEL_8;
  }
  id v15 = (void *)v14;
  v16 = [(HFMultiStateValueSet *)self characteristicMetadata];
  int v17 = objc_msgSend(v16, "hf_isValidValue:", v9);

  if (!v17)
  {
    BOOL v19 = 0;
  }
  else
  {
LABEL_8:
    v18 = [(HFMultiStateValueSet *)self displayResultsByValue];
    [v18 setObject:v11 forKeyedSubscript:v9];

    BOOL v19 = 1;
  }

  return v19;
}

- (NSSet)allValues
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFMultiStateValueSet *)self displayResultsByValue];
  v4 = [v3 allKeys];
  BOOL v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (NSMutableDictionary)displayResultsByValue
{
  return self->_displayResultsByValue;
}

- (HMCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (void)setValueComparator:(id)a3
{
}

- (HFMultiStateValueSet)initWithCharacteristicMetadata:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFMultiStateValueSet;
  v6 = [(HFMultiStateValueSet *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristicMetadata, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    displayResultsByValue = v7->_displayResultsByValue;
    v7->_displayResultsByValue = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)valueComparator
{
  return self->_valueComparator;
}

- (HFMultiStateValueSet)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithCharacteristicMetadata_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMultiStateControlItem.m", 112, @"%s is unavailable; use %@ instead",
    "-[HFMultiStateValueSet init]",
    v5);

  return 0;
}

- (NSArray)sortedValues
{
  v3 = [(HFMultiStateValueSet *)self allValues];
  v4 = [v3 allObjects];

  id v5 = [(HFMultiStateValueSet *)self valueComparator];
  if (v5)
  {
    v6 = [(HFMultiStateValueSet *)self valueComparator];
    id v7 = [v4 sortedArrayUsingComparator:v6];
  }
  else
  {
    id v7 = v4;
  }

  return (NSArray *)v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = [(HFMultiStateValueSet *)self sortedValues];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (unint64_t)count
{
  v2 = [(HFMultiStateValueSet *)self displayResultsByValue];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)displayResultsForValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMultiStateValueSet *)self displayResultsByValue];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  id v4 = [(HFMultiStateValueSet *)self sortedValues];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)removeValue:(id)a3
{
  id v7 = a3;
  id v4 = [(HFMultiStateValueSet *)self displayResultsByValue];
  id v5 = [v4 objectForKeyedSubscript:v7];

  if (!v5) {
    NSLog(&cfstr_ValueDoesNotEx.isa, v7, self);
  }
  v6 = [(HFMultiStateValueSet *)self displayResultsByValue];
  [v6 removeObjectForKey:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(HFMultiStateValueSet *)self displayResultsByValue];
    v6 = [v4 displayResultsByValue];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)addValuesFromArray:(id)a3 displayResultsGenerator:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HFMultiStateValueSet_addValuesFromArray_displayResultsGenerator___block_invoke;
  v8[3] = &unk_264094808;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __67__HFMultiStateValueSet_addValuesFromArray_displayResultsGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:");

  if (!v3)
  {
    id v4 = v8;
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
      id v4 = v8;
      id v7 = (void *)v6;
    }
    else
    {
      id v7 = (void *)MEMORY[0x263EFFA78];
    }
    [*(id *)(a1 + 32) addValue:v4 displayResults:v7];
  }
}

- (void)removeValuesFromArray:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMultiStateValueSet *)self displayResultsByValue];
  [v5 removeObjectsForKeys:v4];
}

- (void)unionSet:(id)a3 displayResultsGenerator:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__HFMultiStateValueSet_unionSet_displayResultsGenerator___block_invoke;
  v8[3] = &unk_264094830;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __57__HFMultiStateValueSet_unionSet_displayResultsGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "displayResultsForValue:");

  if (!v3)
  {
    id v4 = v8;
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
      id v4 = v8;
      id v7 = (void *)v6;
    }
    else
    {
      id v7 = (void *)MEMORY[0x263EFFA78];
    }
    [*(id *)(a1 + 32) addValue:v4 displayResults:v7];
  }
}

- (void)minusSet:(id)a3
{
  id v4 = [a3 allObjects];
  [(HFMultiStateValueSet *)self removeValuesFromArray:v4];
}

- (unint64_t)hash
{
  v2 = [(HFMultiStateValueSet *)self displayResultsByValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = [(HFMultiStateValueSet *)self displayResultsByValue];
  unint64_t v3 = [v2 description];

  return v3;
}

@end