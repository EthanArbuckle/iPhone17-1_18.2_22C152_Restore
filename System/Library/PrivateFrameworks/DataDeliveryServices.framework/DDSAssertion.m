@interface DDSAssertion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAssertion:(id)a3;
- (DDSAssertion)init;
- (DDSAssertion)initWithCoder:(id)a3;
- (DDSAssertion)initWithQuery:(id)a3;
- (DDSAssetPolicy)policy;
- (DDSAssetQuery)query;
- (NSDate)lastUpdated;
- (NSMutableSet)descriptors;
- (NSSet)assertionIdentifiers;
- (NSSet)clientIdentifiers;
- (id)addDescriptorWithAssertionID:(id)a3 clientID:(id)a4 policy:(id)a5;
- (id)assertionIDsForClientID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dumpDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateDescription;
- (void)removeDescriptorWithAssertionID:(id)a3;
- (void)removeDescriptorWithClientID:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setLastUpdated:(id)a3;
@end

@implementation DDSAssertion

- (DDSAssertion)initWithQuery:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDSAssertion;
  v6 = [(DDSAssertion *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    descriptors = v7->_descriptors;
    v7->_descriptors = v8;
  }
  return v7;
}

- (id)addDescriptorWithAssertionID:(id)a3 clientID:(id)a4 policy:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v25 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(DDSAssertion *)self descriptors];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 assertionIdentifier];
        if ([v16 isEqualToString:v8])
        {
          v17 = [v15 clientIdentifier];
          char v18 = [v17 isEqualToString:v9];

          if (v18)
          {

            v22 = DefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v31 = v8;
              _os_log_impl(&dword_1E41D6000, v22, OS_LOG_TYPE_DEFAULT, "Descriptor with assertion id: %{public}@ already added.", buf, 0xCu);
            }

            v20 = 0;
            v19 = v25;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v19 = v25;
  v20 = [[DDSAssertDescriptor alloc] initWithPolicy:v25 assertionID:v8 clientID:v9];
  v21 = [(DDSAssertion *)self descriptors];
  [v21 addObject:v20];

  [(DDSAssertion *)self invalidateDescription];
LABEL_16:

  return v20;
}

- (NSSet)clientIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(DDSAssertion *)self descriptors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__DDSAssertion_clientIdentifiers__block_invoke;
  v7[3] = &unk_1E6E3A2D0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __33__DDSAssertion_clientIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 clientIdentifier];
  [v2 addObject:v3];
}

- (NSSet)assertionIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(DDSAssertion *)self descriptors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__DDSAssertion_assertionIdentifiers__block_invoke;
  v7[3] = &unk_1E6E3A2D0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __36__DDSAssertion_assertionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 assertionIdentifier];
  [v2 addObject:v3];
}

- (id)assertionIDsForClientID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6 = [(DDSAssertion *)self descriptors];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__DDSAssertion_assertionIDsForClientID___block_invoke;
  v12[3] = &unk_1E6E3A2F8;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __40__DDSAssertion_assertionIDsForClientID___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 clientIdentifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    v6 = [v7 assertionIdentifier];
    [v5 addObject:v6];
  }
}

- (DDSAssetPolicy)policy
{
  id v3 = objc_alloc_init(DDSAssetPolicy);
  [(DDSAssetPolicy *)v3 setPreferredDownloadFrequency:0x7FFFFFFFLL];
  int v4 = [(DDSAssertion *)self descriptors];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__DDSAssertion_policy__block_invoke;
  v7[3] = &unk_1E6E3A2D0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __22__DDSAssertion_policy__block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 policy];
  if ([*(id *)(a1 + 32) downloadWithoutPower]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v8 downloadWithoutPower];
  }
  [*(id *)(a1 + 32) setDownloadWithoutPower:v3];
  if ([*(id *)(a1 + 32) downloadOverCellular]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v8 downloadOverCellular];
  }
  [*(id *)(a1 + 32) setDownloadOverCellular:v4];
  uint64_t v5 = [*(id *)(a1 + 32) preferredDownloadFrequency];
  uint64_t v6 = [v8 preferredDownloadFrequency];
  if (v5 >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  [*(id *)(a1 + 32) setPreferredDownloadFrequency:v7];
}

- (void)removeDescriptorWithClientID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  char v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v5 = [(DDSAssertion *)self descriptors];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __45__DDSAssertion_removeDescriptorWithClientID___block_invoke;
  uint64_t v11 = &unk_1E6E3A320;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];

  uint64_t v7 = [(DDSAssertion *)self descriptors];
  [v7 removeObject:v15[5]];

  [(DDSAssertion *)self invalidateDescription];
  _Block_object_dispose(&v14, 8);
}

void __45__DDSAssertion_removeDescriptorWithClientID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 clientIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)removeDescriptorWithAssertionID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  char v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  uint64_t v5 = [(DDSAssertion *)self descriptors];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __48__DDSAssertion_removeDescriptorWithAssertionID___block_invoke;
  uint64_t v11 = &unk_1E6E3A320;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];

  int v7 = [(DDSAssertion *)self descriptors];
  [v7 removeObject:v15[5]];

  [(DDSAssertion *)self invalidateDescription];
  _Block_object_dispose(&v14, 8);
}

void __48__DDSAssertion_removeDescriptorWithAssertionID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 assertionIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (DDSAssertion)init
{
  return 0;
}

- (DDSAssertion)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DDSAssertion;
  uint64_t v5 = [(DDSAssertion *)&v26 init];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(sel_query);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    query = v5->_query;
    v5->_query = (DDSAssetQuery *)v9;

    uint64_t v11 = objc_opt_class();
    id v12 = NSStringFromSelector(sel_lastUpdated);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    v17 = [v15 setWithArray:v16];

    char v18 = NSStringFromSelector(sel_descriptors);
    id v25 = 0;
    uint64_t v19 = [v4 decodeTopLevelObjectOfClasses:v17 forKey:v18 error:&v25];
    id v20 = v25;
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSMutableSet *)v19;

    id v6 = v5;
    if (v20)
    {
      v22 = DefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[DDSAssertion initWithCoder:]((uint64_t)v20, v22);
      }

      id v6 = 0;
    }
  }
  v23 = v6;

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDSAssertion *)self query];
  id v6 = NSStringFromSelector(sel_query);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(DDSAssertion *)self lastUpdated];
  id v8 = NSStringFromSelector(sel_lastUpdated);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(DDSAssertion *)self descriptors];
  uint64_t v9 = NSStringFromSelector(sel_descriptors);
  [v4 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)invalidateDescription
{
  self->_description = 0;
  MEMORY[0x1F41817F8]();
}

- (id)description
{
  description = self->_description;
  if (!description)
  {
    id v4 = NSString;
    uint64_t v5 = objc_opt_class();
    id v6 = [(DDSAssertion *)self query];
    uint64_t v7 = [(DDSAssertion *)self policy];
    id v8 = [v4 stringWithFormat:@"<%@: %p, query: %@, policy: %@>", v5, self, v6, v7];
    uint64_t v9 = self->_description;
    self->_description = v8;

    description = self->_description;
  }
  return description;
}

- (id)dumpDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if (DDS_IS_INTERNAL_INSTALL())
  {
    id v4 = [(DDSAssertion *)self query];
    uint64_t v5 = [v4 dumpDescription];
    [v3 appendFormat:@"[\n%@\n", v5];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(DDSAssertion *)self descriptors];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dumpDescription];
          [v3 appendFormat:@"\n%@", v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v12 = [(DDSAssertion *)self lastUpdated];
    uint64_t v13 = DDS_STRING_FROM_DATE(v12);
    [v3 appendFormat:@"\n\nUpdated: %@\n]", v13];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(DDSAssertion *)self query];
  id v6 = (void *)[v4 initWithQuery:v5];

  if (v6)
  {
    uint64_t v7 = [(DDSAssertion *)self descriptors];
    [v6 setDescriptors:v7];

    uint64_t v8 = [(DDSAssertion *)self lastUpdated];
    [v6 setLastUpdated:v8];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(DDSAssertion *)self isEqualToAssertion:v4];

  return v5;
}

- (BOOL)isEqualToAssertion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAssertion *)self query];
  id v6 = [v4 query];
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    uint64_t v7 = [(DDSAssertion *)self policy];
    uint64_t v8 = [v4 policy];
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      uint64_t v9 = [(DDSAssertion *)self lastUpdated];
      id v10 = [v4 lastUpdated];
      if ([v9 isEqualToDate:v10])
      {
        uint64_t v11 = [(DDSAssertion *)self descriptors];
        id v12 = [v4 descriptors];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(DDSAssertion *)self query];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(DDSAssertion *)self policy];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DDSAssertion *)self lastUpdated];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(DDSAssertion *)self descriptors];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (DDSAssetQuery)query
{
  return self->_query;
}

- (NSMutableSet)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Error decoding descriptors: (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end