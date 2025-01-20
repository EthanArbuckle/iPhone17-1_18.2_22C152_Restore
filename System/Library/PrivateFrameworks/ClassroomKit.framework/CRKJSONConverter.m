@interface CRKJSONConverter
+ (id)JSONArrayForArray:(id)a3;
+ (id)JSONDictionaryForDictionary:(id)a3;
+ (id)bestEffortJSONObjectForObject:(id)a3;
+ (id)stringForDate:(id)a3;
+ (id)stringForObject:(id)a3;
@end

@implementation CRKJSONConverter

+ (id)JSONArrayForArray:(id)a3
{
  id v3 = [a1 bestEffortJSONObjectForObject:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    v6 = [NSString stringWithUTF8String:"+[CRKJSONConverter JSONArrayForArray:]"];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v5 handleFailureInFunction:v6, @"CRKJSONConverter.m", 23, @"expected %@, got %@", v8, v10 file lineNumber description];
  }

  return v3;
}

+ (id)JSONDictionaryForDictionary:(id)a3
{
  id v3 = [a1 bestEffortJSONObjectForObject:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    v6 = [NSString stringWithUTF8String:"+[CRKJSONConverter JSONDictionaryForDictionary:]"];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v5 handleFailureInFunction:v6, @"CRKJSONConverter.m", 30, @"expected %@, got %@", v8, v10 file lineNumber description];
  }

  return v3;
}

+ (id)bestEffortJSONObjectForObject:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08900] isValidJSONObject:v4]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v4 dictionaryValue];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v5 = [a1 stringForObject:v4];
            goto LABEL_5;
          }
          id v8 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = [MEMORY[0x263F08690] currentHandler];
            v27 = [NSString stringWithUTF8String:"+[CRKJSONConverter bestEffortJSONObjectForObject:]"];
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            [v26 handleFailureInFunction:v27, @"CRKJSONConverter.m", 69, @"expected %@, got %@", v29, v31 file lineNumber description];
          }
          id v10 = [v8 allObjects];
          v13 = [a1 JSONArrayForArray:v10];
          v6 = [v13 sortedArrayUsingSelector:sel_compare_];

          goto LABEL_13;
        }
        id v8 = v4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = [MEMORY[0x263F08690] currentHandler];
          v21 = [NSString stringWithUTF8String:"+[CRKJSONConverter bestEffortJSONObjectForObject:]"];
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          [v20 handleFailureInFunction:v21, @"CRKJSONConverter.m", 62, @"expected %@, got %@", v23, v25 file lineNumber description];
        }
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke_2;
        v32[3] = &__block_descriptor_40_e8__16__0_8l;
        v32[4] = a1;
        uint64_t v12 = objc_msgSend(v8, "crk_mapUsingBlock:", v32);
LABEL_19:
        v6 = (void *)v12;
        goto LABEL_20;
      }
      uint64_t v11 = [v4 dictionaryRepresentation];
    }
    id v8 = (id)v11;
    uint64_t v12 = [a1 bestEffortJSONObjectForObject:v11];
    goto LABEL_19;
  }
  id v8 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = [NSString stringWithUTF8String:"+[CRKJSONConverter bestEffortJSONObjectForObject:]"];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [v14 handleFailureInFunction:v15, @"CRKJSONConverter.m", 45, @"expected %@, got %@", v17, v19 file lineNumber description];
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke;
  v33[3] = &unk_2646F5A00;
  id v34 = v9;
  id v35 = a1;
  id v10 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v33];
  v6 = (void *)[v10 copy];

LABEL_13:
LABEL_20:

LABEL_6:

  return v6;
}

void __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v9 = [v5 bestEffortJSONObjectForObject:a3];
  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) stringForObject:v6];

  [v7 setObject:v9 forKeyedSubscript:v8];
}

uint64_t __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) bestEffortJSONObjectForObject:a2];
}

+ (id)stringForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_3:
    id v6 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"+[CRKJSONConverter stringForObject:]"];
      uint64_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      [v10 handleFailureInFunction:v11, @"CRKJSONConverter.m", 84, @"expected %@, got %@", v13, v15 file lineNumber description];
    }
    id v6 = [a1 stringForDate:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        [v4 stringValue];
      }
      else {
      id v5 = [v4 description];
      }
      goto LABEL_3;
    }
    id v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      v17 = [NSString stringWithUTF8String:"+[CRKJSONConverter stringForObject:]"];
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      [v16 handleFailureInFunction:v17, @"CRKJSONConverter.m", 89, @"expected %@, got %@", v19, v21 file lineNumber description];
    }
    id v6 = [v8 base64EncodedStringWithOptions:0];
  }
LABEL_12:

  return v6;
}

+ (id)stringForDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA18];
  id v4 = a3;
  id v5 = [v3 timeZoneWithAbbreviation:@"GMT"];
  id v6 = [MEMORY[0x263F088C0] stringFromDate:v4 timeZone:v5 formatOptions:1907];

  return v6;
}

@end