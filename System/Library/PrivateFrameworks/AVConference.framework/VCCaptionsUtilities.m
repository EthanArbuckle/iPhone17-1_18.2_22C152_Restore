@interface VCCaptionsUtilities
+ (id)formattedTextWithTranscription:(id)a3;
@end

@implementation VCCaptionsUtilities

+ (id)formattedTextWithTranscription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = (void *)[a3 segments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        for (unint64_t i = [v4 length]; i < objc_msgSend(v10, "range"); ++i)
          [v4 appendString:@" "];
        objc_msgSend(v4, "appendString:", objc_msgSend(v10, "text"));
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v7);
  }
  return v4;
}

@end