@interface HKStateOfMind(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableStateOfMind)codableRepresentationForSync;
@end

@implementation HKStateOfMind(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (void *)[[a1 alloc] _init];
    if ([v5 applyToObject:v6])
    {
      uint64_t v7 = HKObjectValidationConfigurationWithOptions();
      v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      if (v9) {
        v10 = 0;
      }
      else {
        v10 = v6;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HDCodableStateOfMind)codableRepresentationForSync
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableStateOfMind);
  v25.receiver = a1;
  v25.super_class = (Class)&off_1F187D1C0;
  v3 = objc_msgSendSuper2(&v25, sel_codableRepresentationForSync);
  [(HDCodableStateOfMind *)v2 setSample:v3];

  -[HDCodableStateOfMind setReflectiveInterval:](v2, "setReflectiveInterval:", [a1 reflectiveInterval]);
  [a1 valence];
  -[HDCodableStateOfMind setValence:](v2, "setValence:");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [a1 labels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        -[HDCodableStateOfMind addLabels:](v2, "addLabels:", [*(id *)(*((void *)&v21 + 1) + 8 * i) longLongValue]);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = objc_msgSend(a1, "domains", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HDCodableStateOfMind addDomains:](v2, "addDomains:", [*(id *)(*((void *)&v17 + 1) + 8 * j) longLongValue]);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v11);
  }

  v14 = [a1 context];

  if (v14)
  {
    v15 = [a1 context];
    [(HDCodableStateOfMind *)v2 setContext:v15];
  }

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  uint64_t v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addStateOfMindLogs:v5];
  }

  return v5 != 0;
}

@end