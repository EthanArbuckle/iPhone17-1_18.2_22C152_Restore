@interface BMStreamSyncPolicy
+ (id)syncableStreamConfigurations;
+ (id)syncableStreams;
- (BMStreamSyncPolicy)initWithLegacyDescriptor:(id)a3 platformPolicies:(id)a4;
- (BMStreamSyncPolicy)initWithPolicyDictionary:(id)a3 syncUUID:(id)a4 legacySyncID:(id)a5 eventClass:(Class)a6;
- (NSString)legacyDescriptor;
@end

@implementation BMStreamSyncPolicy

- (BMStreamSyncPolicy)initWithPolicyDictionary:(id)a3 syncUUID:(id)a4 legacySyncID:(id)a5 eventClass:(Class)a6
{
  return [(BMStreamSyncPolicy *)self initWithLegacyDescriptor:a5 platformPolicies:a3];
}

- (void).cxx_destruct
{
}

- (BMStreamSyncPolicy)initWithLegacyDescriptor:(id)a3 platformPolicies:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMStreamSyncPolicy;
  v7 = [(BMResourceSyncPolicy *)&v11 initWithPolicyDictionary:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    legacyDescriptor = v7->_legacyDescriptor;
    v7->_legacyDescriptor = (NSString *)v8;
  }
  return v7;
}

+ (id)syncableStreams
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = BiomeLibraryNodeBridge();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(v2, "allStreams", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 configuration];
        objc_super v11 = [v10 syncPolicy];

        if (v11)
        {
          v12 = [v11 platformPolicies];
          uint64_t v13 = [v12 count];

          if (v13) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)syncableStreamConfigurations
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = BiomeLibraryNodeBridge();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend(v2, "allStreams", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) configuration];
        v10 = [v9 syncPolicy];
        objc_super v11 = v10;
        if (v10)
        {
          v12 = [v10 platformPolicies];
          uint64_t v13 = [v12 count];

          if (v13) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)legacyDescriptor
{
  return self->_legacyDescriptor;
}

@end