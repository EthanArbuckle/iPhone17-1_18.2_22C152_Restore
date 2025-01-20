@interface IKJSEntityValueProvider
- (IKEntityValueProviding)entityValueProvider;
- (id)_valueForEntityProperty:(id)a3;
- (id)valueForEntityProperty:(id)a3;
- (id)valuesForEntityProperties:(id)a3;
- (void)setEntityValueProvider:(id)a3;
@end

@implementation IKJSEntityValueProvider

- (id)valueForEntityProperty:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  v5 = [(IKJSObject *)self appContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__IKJSEntityValueProvider_valueForEntityProperty___block_invoke;
  v9[3] = &unk_1E6DE4C88;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 evaluateDelegateBlockSync:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __50__IKJSEntityValueProvider_valueForEntityProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _valueForEntityProperty:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)valuesForEntityProperties:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  if ([v4 count])
  {
    v5 = [(IKJSObject *)self appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__IKJSEntityValueProvider_valuesForEntityProperties___block_invoke;
    v8[3] = &unk_1E6DE5AE8;
    id v9 = v4;
    id v10 = self;
    v11 = &v12;
    [v5 evaluateDelegateBlockSync:v8];
  }
  if (v13[5])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:");
  }
  else
  {
    id v6 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __53__IKJSEntityValueProvider_valuesForEntityProperties___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(a1 + 40), "_valueForEntityProperty:", v7, (void)v13);
        if (v8)
        {
          id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v9)
          {
            uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
            uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v12 = *(void **)(v11 + 40);
            *(void *)(v11 + 40) = v10;

            id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          [v9 setObject:v8 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)_valueForEntityProperty:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isEqualToString:@"entityUniqueIdentifier"];
  entityValueProvider = self->_entityValueProvider;
  if (v5)
  {
    uint64_t v7 = [(IKEntityValueProviding *)entityValueProvider entityUniqueIdentifier];
    goto LABEL_11;
  }
  uint64_t v7 = [(IKEntityValueProviding *)entityValueProvider valueForEntityProperty:v4];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(IKEntityValueProviding *)self->_entityValueProvider stringValueWithNativeValue:v7 forProperty:v4];
    if (v8)
    {
      id v9 = v8;
LABEL_6:
      uint64_t v10 = v9;

      uint64_t v7 = v10;
LABEL_10:

      goto LABEL_11;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v7, "unsignedLongLongValue"));
LABEL_9:
    uint64_t v10 = v7;
    uint64_t v7 = (void *)v11;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v7 string];
      goto LABEL_9;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v7 stringValue];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      id v9 = v10;
      goto LABEL_6;
    }
  }
LABEL_11:

  return v7;
}

- (IKEntityValueProviding)entityValueProvider
{
  return self->_entityValueProvider;
}

- (void)setEntityValueProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end