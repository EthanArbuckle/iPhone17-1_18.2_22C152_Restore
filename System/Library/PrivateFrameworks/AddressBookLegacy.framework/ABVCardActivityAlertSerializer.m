@interface ABVCardActivityAlertSerializer
+ (id)serializeDictionary:(id)a3;
+ (id)serializeString:(id)a3;
@end

@implementation ABVCardActivityAlertSerializer

+ (id)serializeDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F28E78] string];
  v6 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_93);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [a3 objectForKey:v11];
        if (v11)
        {
          v13 = (void *)v12;
          if (([v11 isEqualToString:&stru_1EF03E278] & 1) == 0
            && v13
            && ([v13 isEqualToString:&stru_1EF03E278] & 1) == 0)
          {
            if ([v5 length]) {
              [v5 appendString:@"\\,"];
            }
            objc_msgSend(v5, "appendString:", objc_msgSend(a1, "serializeString:", v11));
            [v5 appendString:@"="];
            objc_msgSend(v5, "appendString:", objc_msgSend(a1, "serializeString:", v13));
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  return v5;
}

+ (id)serializeString:(id)a3
{
  v4 = off_1E5986F60;
  if (!+[ABVCardActivityAlertQuotingSerializationStrategy strategyWouldAlterString:](ABVCardActivityAlertQuotingSerializationStrategy, "strategyWouldAlterString:"))
  {
    v4 = off_1E5986F58;
    if (!+[ABVCardActivityAlertEscapingSerializationStrategy strategyWouldAlterString:a3])return a3; {
  }
    }
  v5 = *v4;
  return (id)[(__objc2_class *)v5 serializeString:a3];
}

@end