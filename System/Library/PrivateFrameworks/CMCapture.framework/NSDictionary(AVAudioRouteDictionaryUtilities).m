@interface NSDictionary(AVAudioRouteDictionaryUtilities)
- (uint64_t)bw_containsBuiltInMicAsAnInput;
- (void)bw_dataSourceDictionaryForDesiredMicOrientation:()AVAudioRouteDictionaryUtilities;
@end

@implementation NSDictionary(AVAudioRouteDictionaryUtilities)

- (void)bw_dataSourceDictionaryForDesiredMicOrientation:()AVAudioRouteDictionaryUtilities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[a1 objectForKeyedSubscript:*MEMORY[0x1E4F76840]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v15;
  uint64_t v9 = *MEMORY[0x1E4F76798];
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v8) {
      objc_enumerationMutation(v5);
    }
    v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 objectForKeyedSubscript:v9];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 intValue] == a3) {
        return v11;
      }
    }
    if (v7 == ++v10)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v11 = 0;
      if (v7) {
        goto LABEL_5;
      }
      return v11;
    }
  }
}

- (uint64_t)bw_containsBuiltInMicAsAnInput
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = (void *)[a1 objectForKeyedSubscript:*MEMORY[0x1E4F76860]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (![v2 count]) {
    return 0;
  }
  v3 = (void *)[v2 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F76888]];
  if (!v4) {
    return 0;
  }
  return [v4 isEqualToString:@"MicrophoneBuiltIn"];
}

@end