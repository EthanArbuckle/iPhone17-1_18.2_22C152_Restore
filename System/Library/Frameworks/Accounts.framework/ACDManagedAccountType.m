@interface ACDManagedAccountType
- (id)_dataclassStringsFromManaged:(id)a3;
- (id)description;
- (id)supportedDataclassStrings;
- (id)syncableDataclassStrings;
@end

@implementation ACDManagedAccountType

- (id)description
{
  v2 = NSString;
  v3 = [(ACDManagedAccountType *)self identifier];
  v4 = [v2 stringWithFormat:@"<ACDManagedAccountType:%@>", v3];

  return v4;
}

- (id)supportedDataclassStrings
{
  v3 = [(ACDManagedAccountType *)self supportedDataclasses];
  v4 = [(ACDManagedAccountType *)self _dataclassStringsFromManaged:v3];

  return v4;
}

- (id)syncableDataclassStrings
{
  v3 = [(ACDManagedAccountType *)self syncableDataclasses];
  v4 = [(ACDManagedAccountType *)self _dataclassStringsFromManaged:v3];

  return v4;
}

- (id)_dataclassStringsFromManaged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "name", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end