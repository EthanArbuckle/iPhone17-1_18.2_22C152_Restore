@interface BLSFrameSpecifiersRequestResponse
- (BLSFrameSpecifiersRequestResponse)initWithDateSpecifiers:(id)a3;
- (NSArray)dateSpecifiers;
@end

@implementation BLSFrameSpecifiersRequestResponse

- (BLSFrameSpecifiersRequestResponse)initWithDateSpecifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  xpc_object_t empty = xpc_array_create_empty();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)BSCreateSerializedBSXPCEncodableObject();
        if (v12) {
          xpc_array_append_value(empty, v12);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v5 setObject:empty forSetting:1];
  v15.receiver = self;
  v15.super_class = (Class)BLSFrameSpecifiersRequestResponse;
  v13 = [(BLSFrameSpecifiersRequestResponse *)&v15 initWithInfo:v5 error:0];

  return v13;
}

- (NSArray)dateSpecifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(BLSFrameSpecifiersRequestResponse *)self info];
  id v4 = [v3 objectForSetting:1];

  if (v4 && MEMORY[0x1BA99C9B0](v4) == MEMORY[0x1E4F14568])
  {
    size_t count = xpc_array_get_count(v4);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:count];
    if (count)
    {
      size_t v9 = 0;
      *(void *)&long long v8 = 134218498;
      long long v14 = v8;
      do
      {
        uint64_t v10 = xpc_array_get_value(v4, v9);
        if (v10)
        {
          uint64_t v11 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v7 addObject:v11];
          }
          else
          {
            v12 = bls_scenes_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v14;
              long long v16 = self;
              __int16 v17 = 2114;
              long long v18 = v11;
              __int16 v19 = 2114;
              v20 = v10;
              _os_log_fault_impl(&dword_1B55DE000, v12, OS_LOG_TYPE_FAULT, "%p %{public}@ is not of type BLSAlwaysOnDateSpecifier from %{public}@", buf, 0x20u);
            }
          }
        }

        ++v9;
      }
      while (count != v9);
    }
    id v5 = objc_msgSend(v7, "copy", v14);
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

@end