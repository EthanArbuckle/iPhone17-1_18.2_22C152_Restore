@interface PAMediaConversionServiceCompositeImageMetadataPolicy
+ (BOOL)supportsSecureCoding;
+ (id)policyWithPolicies:(id)a3;
- (BOOL)metadataNeedsProcessing:(id)a3;
- (NSArray)policies;
- (PAMediaConversionServiceCompositeImageMetadataPolicy)initWithCoder:(id)a3;
- (id)processMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPolicies:(id)a3;
@end

@implementation PAMediaConversionServiceCompositeImageMetadataPolicy

- (void).cxx_destruct
{
}

- (void)setPolicies:(id)a3
{
}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)processMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(PAMediaConversionServiceCompositeImageMetadataPolicy *)self policies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 metadataNeedsProcessing:v4])
        {
          uint64_t v11 = [v10 processMetadata:v4];

          id v4 = (id)v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)metadataNeedsProcessing:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(PAMediaConversionServiceCompositeImageMetadataPolicy *)self policies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) metadataNeedsProcessing:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PAMediaConversionServiceCompositeImageMetadataPolicy *)self policies];
  [v4 encodeObject:v5 forKey:@"policyList"];
}

- (PAMediaConversionServiceCompositeImageMetadataPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"policyList"])
  {
    id v5 = [v4 decodeObjectForKey:@"policyList"];
    [(PAMediaConversionServiceCompositeImageMetadataPolicy *)self setPolicies:v5];
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)policyWithPolicies:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PAMediaConversionServiceImageMetadataPolicy.m", 335, @"Invalid parameter not satisfying: %@", @"policies" object file lineNumber description];
  }
  uint64_t v6 = objc_opt_new();
  [v6 setPolicies:v5];

  return v6;
}

@end