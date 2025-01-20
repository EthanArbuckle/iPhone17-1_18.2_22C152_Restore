@interface KGPropertyValueArray
- (KGElementIdentifierSet)elementIdentifiers;
- (KGPropertyValueArray)initWithValues:(id)a3 elementIdentifiers:(id)a4;
- (NSArray)values;
- (void)enumerateUsingBlock:(id)a3;
@end

@implementation KGPropertyValueArray

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifiers, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (KGElementIdentifierSet)elementIdentifiers
{
  return self->_elementIdentifiers;
}

- (NSArray)values
{
  return self->_values;
}

- (void)enumerateUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  elementIdentifiers = self->_elementIdentifiers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__KGPropertyValueArray_enumerateUsingBlock___block_invoke;
  v7[3] = &unk_1E68DC748;
  v7[4] = self;
  v9 = v10;
  id v6 = v4;
  id v8 = v6;
  [(KGElementIdentifierSet *)elementIdentifiers enumerateIdentifiersWithBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __44__KGPropertyValueArray_enumerateUsingBlock___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 8);
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  objc_msgSend(v2, "objectAtIndexedSubscript:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
}

- (KGPropertyValueArray)initWithValues:(id)a3 elementIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KGPropertyValueArray;
  v9 = [(KGPropertyValueArray *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_values, a3);
    objc_storeStrong((id *)&v10->_elementIdentifiers, a4);
  }

  return v10;
}

@end