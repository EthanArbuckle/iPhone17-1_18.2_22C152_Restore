@interface CCSetDescriptor
+ (id)accountIdentifierFromAccount:(id)a3 error:(id *)a4;
+ (id)localeIdentifierWithValue:(id)a3 error:(id *)a4;
+ (id)setDescriptorFromDescriptor:(id)a3 error:(id *)a4;
+ (id)setDescriptorsFromEncodedString:(id)a3 error:(id *)a4;
+ (id)setDescriptorsFromResourceDescriptors:(id)a3 error:(id *)a4;
+ (id)sourceIdentifierWithValue:(id)a3 error:(id *)a4;
@end

@implementation CCSetDescriptor

+ (id)setDescriptorsFromResourceDescriptors:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        v13 = +[CCSetDescriptor setDescriptorFromDescriptor:v12 error:&v19];
        id v14 = v19;
        if (v13) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (!v15)
        {
          v16 = v14;
          CCSetError(a4, v14);

          v17 = 0;
          goto LABEL_14;
        }
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v6 copy];
LABEL_14:

  return v17;
}

+ (id)sourceIdentifierWithValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithKey:@"sourceIdentifier" value:v6 error:a4];

  return v7;
}

+ (id)setDescriptorFromDescriptor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [CCSetDescriptor alloc];
  id v7 = [v5 key];
  uint64_t v8 = [v5 value];

  uint64_t v9 = [(BMResourceDescriptor *)v6 initWithKey:v7 value:v8 error:a4];

  return v9;
}

+ (id)localeIdentifierWithValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithKey:@"localeIdentifier" value:v6 error:a4];

  return v7;
}

+ (id)accountIdentifierFromAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  uint64_t v8 = [v6 accountIdentifier];

  uint64_t v9 = (void *)[v7 initWithKey:@"accountIdentifier" value:v8 error:a4];

  return v9;
}

+ (id)setDescriptorsFromEncodedString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__5;
  long long v20 = __Block_byref_object_dispose__5;
  id v21 = (id)objc_opt_new();
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  id v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__CCSetDescriptor_setDescriptorsFromEncodedString_error___block_invoke;
  v9[3] = &unk_26527A890;
  v9[4] = &v10;
  v9[5] = &v16;
  if ([MEMORY[0x263F29E90] enumerateDescriptorsFromEncodedString:v5 error:a4 usingBlock:v9])
  {
    id v6 = (void *)v17[5];
    if (!v6)
    {
      CCSetError(a4, (id)v11[5]);
      id v6 = (void *)v17[5];
    }
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

void __57__CCSetDescriptor_setDescriptorsFromEncodedString_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  v4 = +[CCSetDescriptor setDescriptorFromDescriptor:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  if (v4)
  {
    [v6 addObject:v4];
  }
  else
  {
    *(void *)(v5 + 40) = 0;
  }
}

@end