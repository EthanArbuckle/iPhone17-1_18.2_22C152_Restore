@interface ABSMultiValue
+ (void)initialize;
- (ABSMultiValue)initWithPropertyType:(unsigned int)a3 mutable:(BOOL)a4 values:(id)a5;
- (BOOL)addValue:(id)a3 label:(id)a4 outIdentifier:(int *)a5;
- (BOOL)insertValue:(id)a3 label:(id)a4 atIndex:(int64_t)a5 outIdentifier:(int *)a6;
- (BOOL)mutable;
- (BOOL)removeValueAtIndex:(int64_t)a3;
- (BOOL)replaceLabel:(id)a3 atIndex:(int64_t)a4;
- (BOOL)replaceValue:(id)a3 atIndex:(int64_t)a4;
- (NSMutableArray)values;
- (id)allValues;
- (id)copyValueAtIndex:(int64_t)a3;
- (id)labelAtIndex:(int64_t)a3;
- (id)mutableCopy;
- (int)identifierAtIndex:(int64_t)a3;
- (int)nextLegacyIdentifier;
- (unint64_t)indexForIdentifier:(int)a3;
- (unint64_t)indexOfValue:(id)a3;
- (unsigned)propertyType;
@end

@implementation ABSMultiValue

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSMultiValue;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize];
}

- (ABSMultiValue)initWithPropertyType:(unsigned int)a3 mutable:(BOOL)a4 values:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ABSMultiValue;
  v9 = [(ABSMultiValue *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_propertyType = a3 & 0xFFFFFEFF;
    v9->_mutable = a4;
    if (v8)
    {
      uint64_t v11 = [v8 mutableCopy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x263EFF980] array];
    }
    values = v10->_values;
    v10->_values = (NSMutableArray *)v11;
  }
  return v10;
}

- (id)mutableCopy
{
  v3 = [ABSMultiValue alloc];
  uint64_t v4 = [(ABSMultiValue *)self propertyType];
  v5 = [(ABSMultiValue *)self values];
  v6 = [(ABSMultiValue *)v3 initWithPropertyType:v4 mutable:1 values:v5];

  return v6;
}

- (id)copyValueAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(ABSMultiValue *)self values],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    v10 = 0;
  }
  else
  {
    v7 = [(ABSMultiValue *)self values];
    id v8 = [v7 objectAtIndexedSubscript:a3];

    v9 = [v8 value];
    v10 = sABSValueToABValueTransform_block_invoke((uint64_t)v9, v9);
  }
  if ([(ABSMultiValue *)self mutable] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v11 = [v10 mutableCopy];
  }
  else {
    uint64_t v11 = [v10 copy];
  }
  v12 = (void *)v11;

  return v12;
}

- (id)allValues
{
  objc_super v2 = [(ABSMultiValue *)self values];
  v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_14);

  return v3;
}

id __26__ABSMultiValue_allValues__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = [a2 value];
  v3 = sABSValueToABValueTransform_block_invoke((uint64_t)v2, v2);

  return v3;
}

- (id)labelAtIndex:(int64_t)a3
{
  if (a3 < 0
    || ([(ABSMultiValue *)self values],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    v9 = 0;
  }
  else
  {
    v7 = [(ABSMultiValue *)self values];
    id v8 = [v7 objectAtIndexedSubscript:a3];

    v9 = [v8 label];
  }

  return v9;
}

- (unint64_t)indexForIdentifier:(int)a3
{
  uint64_t v4 = [(ABSMultiValue *)self values];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ABSMultiValue_indexForIdentifier___block_invoke;
  v7[3] = &__block_descriptor_36_e31_B32__0__CNLabeledValue_8Q16_B24l;
  int v8 = a3;
  unint64_t v5 = [v4 indexOfObjectPassingTest:v7];

  return v5;
}

BOOL __36__ABSMultiValue_indexForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 iOSLegacyIdentifier] == *(_DWORD *)(a1 + 32);
}

- (unint64_t)indexOfValue:(id)a3
{
  uint64_t v4 = sABValueToABSValueTransform_block_invoke_2((uint64_t)self, a3);
  unint64_t v5 = [(ABSMultiValue *)self values];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__ABSMultiValue_indexOfValue___block_invoke;
  v9[3] = &unk_264223AB8;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __30__ABSMultiValue_indexOfValue___block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  v3 = [a2 value];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (int)identifierAtIndex:(int64_t)a3
{
  if (a3 < 0) {
    return -1;
  }
  unint64_t v5 = [(ABSMultiValue *)self values];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return -1;
  }
  unint64_t v7 = [(ABSMultiValue *)self values];
  int v8 = [v7 objectAtIndexedSubscript:a3];

  LODWORD(v7) = [v8 iOSLegacyIdentifier];
  return (int)v7;
}

- (int)nextLegacyIdentifier
{
  v3 = [(ABSMultiValue *)self values];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  unint64_t v5 = [(ABSMultiValue *)self values];
  unint64_t v6 = [v5 valueForKeyPath:@"@max.iOSLegacyIdentifier"];
  int v7 = [v6 intValue] + 1;

  return v7;
}

- (BOOL)addValue:(id)a3 label:(id)a4 outIdentifier:(int *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(ABSMultiValue *)self mutable];
  BOOL v11 = v10;
  if (v10)
  {
    uint64_t v12 = sABValueToABSValueTransform_block_invoke_2(v10, v8);

    v13 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v9 value:v12];
    objc_msgSend(v13, "setIOSLegacyIdentifier:", -[ABSMultiValue nextLegacyIdentifier](self, "nextLegacyIdentifier"));
    objc_super v14 = [(ABSMultiValue *)self values];
    [v14 addObject:v13];

    if (a5) {
      *a5 = [v13 iOSLegacyIdentifier];
    }

    id v8 = (id)v12;
  }

  return v11;
}

- (BOOL)insertValue:(id)a3 label:(id)a4 atIndex:(int64_t)a5 outIdentifier:(int *)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [(ABSMultiValue *)self mutable];
  BOOL v13 = 0;
  if ((a5 & 0x8000000000000000) == 0 && v12)
  {
    objc_super v14 = [(ABSMultiValue *)self values];
    unint64_t v15 = [v14 count];

    if (v15 >= a5)
    {
      uint64_t v17 = sABValueToABSValueTransform_block_invoke_2(v16, v10);

      v18 = [MEMORY[0x263EFEAD0] labeledValueWithLabel:v11 value:v17];
      objc_msgSend(v18, "setIOSLegacyIdentifier:", -[ABSMultiValue nextLegacyIdentifier](self, "nextLegacyIdentifier"));
      v19 = [(ABSMultiValue *)self values];
      [v19 insertObject:v18 atIndex:a5];

      if (a6) {
        *a6 = [v18 iOSLegacyIdentifier];
      }

      BOOL v13 = 1;
      id v10 = (id)v17;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)removeValueAtIndex:(int64_t)a3
{
  BOOL v5 = [(ABSMultiValue *)self mutable];
  BOOL result = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5)
  {
    int v7 = [(ABSMultiValue *)self values];
    unint64_t v8 = [v7 count];

    if (v8 <= a3)
    {
      return 0;
    }
    else
    {
      id v9 = [(ABSMultiValue *)self values];
      [v9 removeObjectAtIndex:a3];

      return 1;
    }
  }
  return result;
}

- (BOOL)replaceValue:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(ABSMultiValue *)self mutable];
  BOOL v8 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v7)
  {
    id v9 = [(ABSMultiValue *)self values];
    unint64_t v10 = [v9 count];

    if (v10 <= a4)
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v12 = sABValueToABSValueTransform_block_invoke_2(v11, v6);

      BOOL v13 = [(ABSMultiValue *)self values];
      objc_super v14 = [v13 objectAtIndexedSubscript:a4];

      unint64_t v15 = (void *)MEMORY[0x263EFEAD0];
      uint64_t v16 = [v14 label];
      uint64_t v17 = [v15 labeledValueWithLabel:v16 value:v12];

      v18 = [(ABSMultiValue *)self values];
      [v18 replaceObjectAtIndex:a4 withObject:v17];

      BOOL v8 = 1;
      id v6 = (id)v12;
    }
  }

  return v8;
}

- (BOOL)replaceLabel:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(ABSMultiValue *)self mutable];
  BOOL v8 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v7)
  {
    id v9 = [(ABSMultiValue *)self values];
    unint64_t v10 = [v9 count];

    if (v10 <= a4)
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v11 = [(ABSMultiValue *)self values];
      uint64_t v12 = [v11 objectAtIndexedSubscript:a4];

      BOOL v13 = (void *)MEMORY[0x263EFEAD0];
      objc_super v14 = [v12 value];
      unint64_t v15 = [v13 labeledValueWithLabel:v6 value:v14];

      uint64_t v16 = [(ABSMultiValue *)self values];
      [v16 replaceObjectAtIndex:a4 withObject:v15];

      BOOL v8 = 1;
    }
  }

  return v8;
}

- (unsigned)propertyType
{
  return self->_propertyType;
}

- (BOOL)mutable
{
  return self->_mutable;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

@end