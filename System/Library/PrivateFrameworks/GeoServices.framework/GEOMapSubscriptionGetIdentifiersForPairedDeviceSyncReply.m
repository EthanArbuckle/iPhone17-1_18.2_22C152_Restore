@interface GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply
- (BOOL)isValid;
- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)identifiers;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply;
  v7 = [(GEOXPCReply *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_array(v6, "identifiers");
    size_t count = xpc_array_get_count(v8);
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          v13 = [NSString stringWithUTF8String:string];
          [v10 addObject:v13];
        }
      }
    }
    uint64_t v14 = [v10 count];
    if (v14) {
      v15 = (void *)[v10 copy];
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_identifiers, v15);
    if (v14) {

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncReply;
  [(GEOXPCReply *)&v17 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_identifiers count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_identifiers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v13 + 1) + 8 * v10);
          v12 = (const char *)objc_msgSend(v11, "UTF8String", (void)v13);
          if (v12) {
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "identifiers", v5);
    }
  }
}

- (void).cxx_destruct
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

@end