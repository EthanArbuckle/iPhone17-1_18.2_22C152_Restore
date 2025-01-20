@interface NSArray(KeyPathLookup)
- (id)hmf_firstObjectWithValue:()KeyPathLookup forKeyPath:;
- (uint64_t)hmf_firstObjectWithCharacteristicType:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithInstanceID:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithName:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithSPIUniqueIdentifier:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithUUID:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithUniqueIdentifier:()KeyPathLookup;
- (uint64_t)hmf_firstObjectWithZoneID:()KeyPathLookup;
@end

@implementation NSArray(KeyPathLookup)

- (id)hmf_firstObjectWithValue:()KeyPathLookup forKeyPath:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    _HMFPreconditionFailure(@"keyPath");
  }
  v8 = v7;
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = a1;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "valueForKeyPath:", v8, (void)v18);
          char v15 = [v14 isEqual:v6];

          if (v15)
          {
            id v16 = v13;

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

- (uint64_t)hmf_firstObjectWithInstanceID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"instanceID");
}

- (uint64_t)hmf_firstObjectWithUUID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"uuid");
}

- (uint64_t)hmf_firstObjectWithName:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"name");
}

- (uint64_t)hmf_firstObjectWithZoneID:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"zoneID");
}

- (uint64_t)hmf_firstObjectWithUniqueIdentifier:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"uniqueIdentifier");
}

- (uint64_t)hmf_firstObjectWithSPIUniqueIdentifier:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"contextSPIUniqueIdentifier");
}

- (uint64_t)hmf_firstObjectWithCharacteristicType:()KeyPathLookup
{
  return objc_msgSend(a1, "hmf_firstObjectWithValue:forKeyPath:", a3, @"characteristicType");
}

@end