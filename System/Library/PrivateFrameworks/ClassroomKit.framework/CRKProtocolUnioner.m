@interface CRKProtocolUnioner
+ (id)nameOfProtocol:(id)a3;
+ (id)nameOfUnionOfProtocols:(id)a3;
+ (id)protocolByUnioningProtocols:(id)a3;
+ (id)sortedNamesOfProtocols:(id)a3;
@end

@implementation CRKProtocolUnioner

+ (id)protocolByUnioningProtocols:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [a1 nameOfUnionOfProtocols:v4];
    objc_allocateProtocol((const char *)[v5 UTF8String]);
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            protocol_addProtocol(v6, *(Protocol **)(*((void *)&v15 + 1) + 8 * i));
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }

      objc_registerProtocol(v6);
      v12 = v6;
    }
    else
    {
      NSProtocolFromString((NSString *)v5);
      v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v13 = &unk_26D845748;
  }

  return v13;
}

+ (id)nameOfUnionOfProtocols:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 addObject:v8];

  uint64_t v9 = [a1 sortedNamesOfProtocols:v5];

  [v6 addObjectsFromArray:v9];
  uint64_t v10 = [v6 componentsJoinedByString:@"_"];

  return v10;
}

+ (id)sortedNamesOfProtocols:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "nameOfProtocol:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v5 sortUsingSelector:sel_compare_];
  v12 = (void *)[v5 copy];

  return v12;
}

+ (id)nameOfProtocol:(id)a3
{
  v3 = NSString;
  Name = protocol_getName((Protocol *)a3);

  return (id)[v3 stringWithUTF8String:Name];
}

@end