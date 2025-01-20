@interface UTType(DOCAdditions)
+ (id)doc_contentTypesForIdentifiers:()DOCAdditions;
+ (id)doc_identifiersForContentTypes:()DOCAdditions;
- (uint64_t)doc_conformsToAnyInContentTypes:()DOCAdditions;
@end

@implementation UTType(DOCAdditions)

- (uint64_t)doc_conformsToAnyInContentTypes:()DOCAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(a1, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11))
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

+ (id)doc_identifiersForContentTypes:()DOCAdditions
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__UTType_DOCAdditions__doc_identifiersForContentTypes___block_invoke;
  v8[3] = &unk_2641B5AD8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

+ (id)doc_contentTypesForIdentifiers:()DOCAdditions
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x263F1D920];
    uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v3];
    id v6 = [v4 _typesWithIdentifiers:v5];

    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__UTType_DOCAdditions__doc_contentTypesForIdentifiers___block_invoke;
    v13[3] = &unk_2641B5AB0;
    id v14 = v6;
    id v8 = v7;
    id v15 = v8;
    id v9 = v6;
    [v3 enumerateObjectsUsingBlock:v13];
    v10 = v15;
    id v11 = v8;
  }
  else
  {
    id v11 = (id)MEMORY[0x263EFFA68];
  }

  return v11;
}

@end