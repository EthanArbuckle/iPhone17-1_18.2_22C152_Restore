@interface NSMutableDictionary(AVTExtensions)
- (void)avt_applyPoseRoundingBehaviour;
@end

@implementation NSMutableDictionary(AVTExtensions)

- (void)avt_applyPoseRoundingBehaviour
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v10 = _AVTPoseRoundingBehaviour();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [a1 allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v8 = [a1 objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = objc_msgSend(v8, "avt_numberByRoundingWithBehavior:", v10);
          [a1 setObject:v9 forKeyedSubscript:v7];
        }
        else if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v8, "avt_applyPoseRoundingBehaviour");
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

@end