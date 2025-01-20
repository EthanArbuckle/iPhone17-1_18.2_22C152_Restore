@interface LADomainStateCompanion
- (LADomainStateCompanion)initWithResult:(id)a3;
- (NSData)stateHash;
- (NSSet)availableCompanionTypes;
- (id)description;
- (id)stateHashForCompanionType:(int64_t)a3;
- (void)_resolveCombinedStateHash;
@end

@implementation LADomainStateCompanion

- (LADomainStateCompanion)initWithResult:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)LADomainStateCompanion;
  v5 = [(LADomainStateCompanion *)&v31 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F72E50]];
    id v26 = v4;
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F72E60]];
    uint64_t v10 = objc_opt_new();
    availableCompanions = v5->_availableCompanions;
    v5->_availableCompanions = (NSMutableSet *)v10;

    uint64_t v12 = objc_opt_new();
    stateHashForCompanionType = v5->_stateHashForCompanionType;
    v5->_stateHashForCompanionType = (NSMutableDictionary *)v12;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v20 = [v14 objectForKeyedSubscript:v19];
          int v21 = [v20 BOOLValue];

          if (v21)
          {
            [(NSMutableSet *)v5->_availableCompanions addObject:v19];
            v22 = (void *)MEMORY[0x1E4F72F50];
            v23 = [v9 objectForKeyedSubscript:v19];
            v24 = [v22 saltHash:v23 withBundleID:v7];

            [(NSMutableDictionary *)v5->_stateHashForCompanionType setObject:v24 forKeyedSubscript:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }

    [(LADomainStateCompanion *)v5 _resolveCombinedStateHash];
    id v4 = v26;
  }

  return v5;
}

- (NSSet)availableCompanionTypes
{
  return (NSSet *)self->_availableCompanions;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (id)stateHashForCompanionType:(int64_t)a3
{
  stateHashForCompanionType = self->_stateHashForCompanionType;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)stateHashForCompanionType objectForKeyedSubscript:v4];

  return v5;
}

- (void)_resolveCombinedStateHash
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_stateHashForCompanionType allKeys];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  if ((unint64_t)[v4 count] > 1)
  {
    v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_stateHashForCompanionType, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
          [v5 appendData:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    v6 = [MEMORY[0x1E4F72F50] createHashForDomainState:v5];
  }
  else
  {
    v5 = [(NSMutableDictionary *)self->_stateHashForCompanionType allValues];
    v6 = [v5 firstObject];
  }
  stateHash = self->_stateHash;
  self->_stateHash = v6;
}

- (id)description
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  v6 = [(LADomainStateCompanion *)self availableCompanionTypes];
  id v7 = [v5 stringWithFormat:@"availableCompanions: %@", v6];
  v15[0] = v7;
  uint64_t v8 = NSString;
  uint64_t v9 = [(LADomainStateCompanion *)self stateHash];
  uint64_t v10 = [v8 stringWithFormat:@"stateHash: %@", v9];
  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v12 = [v11 componentsJoinedByString:@"; "];
  v13 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHashForCompanionType, 0);
  objc_storeStrong((id *)&self->_stateHash, 0);

  objc_storeStrong((id *)&self->_availableCompanions, 0);
}

@end