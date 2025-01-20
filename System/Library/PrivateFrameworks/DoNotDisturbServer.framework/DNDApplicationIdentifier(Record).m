@interface DNDApplicationIdentifier(Record)
+ (uint64_t)newWithDictionaryRepresentation:()Record context:;
- (id)dictionaryRepresentationWithContext:()Record;
@end

@implementation DNDApplicationIdentifier(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "bs_safeStringForKey:", @"bundleID");
  v6 = objc_msgSend(v4, "bs_safeNumberForKey:", @"platform");

  uint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [[a1 alloc] initWithBundleID:v5 platform:v7];

  return v8;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(v4, "arrayHealingSource", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = (void *)[(id)objc_opt_class() newWithDictionaryRepresentation:v11 context:v4];
        if ([a1 isEqual:v12])
        {
          uint64_t v13 = [v11 mutableCopy];

          v5 = (void *)v13;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v14 = [a1 bundleID];
  [v5 setObject:v14 forKeyedSubscript:@"bundleID"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "platform"));
  [v5 setObject:v15 forKeyedSubscript:@"platform"];

  return v5;
}

@end