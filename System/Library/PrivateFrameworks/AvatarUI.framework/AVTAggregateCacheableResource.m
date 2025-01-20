@interface AVTAggregateCacheableResource
- (AVTAggregateCacheableResource)initWithCacheableResources:(id)a3;
- (BOOL)requiresEncryption;
- (NSArray)cacheableResources;
- (id)identifierForScope:(id)a3 persistent:(BOOL)a4;
- (id)persistentIdentifierForScope:(id)a3;
- (id)volatileIdentifierForScope:(id)a3;
- (unint64_t)costForScope:(id)a3;
@end

@implementation AVTAggregateCacheableResource

- (AVTAggregateCacheableResource)initWithCacheableResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAggregateCacheableResource;
  v6 = [(AVTAggregateCacheableResource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cacheableResources, a3);
  }

  return v7;
}

- (unint64_t)costForScope:(id)a3
{
  return [a3 cacheableResourceAssociatedCost];
}

- (BOOL)requiresEncryption
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(AVTAggregateCacheableResource *)self cacheableResources];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) requiresEncryption])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)volatileIdentifierForScope:(id)a3
{
  return [(AVTAggregateCacheableResource *)self identifierForScope:a3 persistent:0];
}

- (id)persistentIdentifierForScope:(id)a3
{
  return [(AVTAggregateCacheableResource *)self identifierForScope:a3 persistent:1];
}

- (id)identifierForScope:(id)a3 persistent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v18 = a3;
  v6 = [MEMORY[0x263F089D8] string];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v7 = [(AVTAggregateCacheableResource *)self cacheableResources];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v13 = [v12 persistentIdentifierForScope:0];
        }
        else
        {
          uint64_t v13 = [v12 volatileIdentifierForScope:0];
        }
        v14 = (void *)v13;
        [v6 appendFormat:@"%@_", v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  if ([v6 length]) {
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  }
  if (v18)
  {
    v15 = [v18 cacheableResourceAssociatedIdentifier];
    [v6 appendString:v15];
  }
  v16 = (void *)[v6 copy];

  return v16;
}

- (NSArray)cacheableResources
{
  return self->_cacheableResources;
}

- (void).cxx_destruct
{
}

@end