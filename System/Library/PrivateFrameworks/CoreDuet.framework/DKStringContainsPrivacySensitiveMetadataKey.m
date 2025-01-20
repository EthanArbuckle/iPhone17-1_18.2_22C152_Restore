@interface DKStringContainsPrivacySensitiveMetadataKey
@end

@implementation DKStringContainsPrivacySensitiveMetadataKey

void ___DKStringContainsPrivacySensitiveMetadataKey_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = _DKPrivacySensitiveMetadataKeys();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * v5);
        v7 = +[_DKMetadataPersistenceLookupTable keyToAttribute]();
        v8 = objc_msgSend(v7, "objectForKeyedSubscript:", v6, (void)v11);

        if (v8) {
          [v0 addObject:v8];
        }
        [v0 addObject:v6];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  uint64_t v9 = [v0 copy];
  v10 = (void *)_DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings;
  _DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings = v9;
}

@end