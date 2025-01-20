@interface NSDictionary(MGRemoteQueryCoding)
- (id)rq_arrayOfDecodedClass:()MGRemoteQueryCoding forKey:;
- (id)rq_coded;
- (id)rq_decodedObjectOfClass:()MGRemoteQueryCoding forKey:;
- (id)rq_numberForKey:()MGRemoteQueryCoding;
- (id)rq_stringForKey:()MGRemoteQueryCoding;
@end

@implementation NSDictionary(MGRemoteQueryCoding)

- (id)rq_coded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"Key is not a string", 0, (void)v13);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v12);
        }
        v9 = objc_msgSend(v3, "objectForKey:", v8, (void)v13);
        v10 = objc_msgSend(v9, "rq_coded");
        [v2 setObject:v10 forKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)rq_stringForKey:()MGRemoteQueryCoding
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_msgSend(NSString, "rq_instanceFromCoded:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)rq_numberForKey:()MGRemoteQueryCoding
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_msgSend(NSNumber, "rq_instanceFromCoded:", v1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)rq_decodedObjectOfClass:()MGRemoteQueryCoding forKey:
{
  uint64_t v5 = [a1 objectForKey:a4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(a3, "rq_instanceFromCoded:", v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)rq_arrayOfDecodedClass:()MGRemoteQueryCoding forKey:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(a3, "rq_instanceFromCoded:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end