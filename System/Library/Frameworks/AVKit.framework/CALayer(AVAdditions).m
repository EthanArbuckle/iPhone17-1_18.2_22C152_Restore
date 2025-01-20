@interface CALayer(AVAdditions)
- (void)avkit_removeAllSublayerTransformAnimations;
@end

@implementation CALayer(AVAdditions)

- (void)avkit_removeAllSublayerTransformAnimations
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [a1 animationKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v7 = [a1 animationForKey:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v8 = v7;
        }
        else {
          v8 = 0;
        }
        v9 = [v8 keyPath];
        int v10 = [v9 containsString:@"sublayerTransform"];

        if (v10) {
          [a1 removeAnimationForKey:v6];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v3);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = [a1 sublayers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "avkit_removeAllSublayerTransformAnimations");
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

@end