@interface NSArray(BW_AVAudioSelectableInputUtilities)
+ (uint64_t)bw_selectedInputsArrayForBuiltInMicRouteDictionary:()BW_AVAudioSelectableInputUtilities dataSource:polarPattern:;
- (void)bw_builtInMicRouteDictionary;
@end

@implementation NSArray(BW_AVAudioSelectableInputUtilities)

+ (uint64_t)bw_selectedInputsArrayForBuiltInMicRouteDictionary:()BW_AVAudioSelectableInputUtilities dataSource:polarPattern:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a3
    && a4
    && (uint64_t v7 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F76858]]) != 0
    && (uint64_t v8 = v7, (v9 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F76790]]) != 0))
  {
    uint64_t v10 = v9;
    uint64_t v11 = *MEMORY[0x1E4F768D8];
    uint64_t v12 = *MEMORY[0x1E4F768C8];
    v18[0] = *MEMORY[0x1E4F768D8];
    v18[1] = v12;
    v19[0] = v8;
    v19[1] = v9;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    if (a5)
    {
      v16[0] = v11;
      v16[1] = v12;
      v17[0] = v8;
      v17[1] = v10;
      v16[2] = *MEMORY[0x1E4F768D0];
      v17[2] = [NSNumber numberWithUnsignedInt:a5];
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    }
    else
    {
      uint64_t v14 = 0;
    }
    return objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v13, v14, 0);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (void)bw_builtInMicRouteDictionary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v11;
  uint64_t v5 = *MEMORY[0x1E4F76888];
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v11 != v4) {
      objc_enumerationMutation(a1);
    }
    uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = (void *)[v7 objectForKeyedSubscript:v5];
      if (v8)
      {
        if ([v8 isEqualToString:@"MicrophoneBuiltIn"]) {
          return v7;
        }
      }
    }
    if (v3 == ++v6)
    {
      uint64_t v3 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        goto LABEL_4;
      }
      return 0;
    }
  }
}

@end