@interface CAAnimationGroup(AVTExtensions)
- (id)avt_animationsByUngroupingRecursively;
- (void)avt_animationsByUngroupingRecursively;
@end

@implementation CAAnimationGroup(AVTExtensions)

- (id)avt_animationsByUngroupingRecursively
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [a1 animations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = objc_msgSend(v8, "avt_animationsByUngroupingRecursively");
          [v2 addObjectsFromArray:v9];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v9 = [v8 copy];
            [v8 beginTime];
            -[NSObject setBeginTime:](v9, "setBeginTime:");
            [v8 speed];
            float v11 = v10;
            [a1 speed];
            *(float *)&double v13 = v11 * v12;
            [v9 setSpeed:v13];
            [v8 timeOffset];
            double v15 = v14;
            [a1 beginTime];
            double v17 = v15 - v16;
            [a1 speed];
            double v19 = v18;
            [a1 timeOffset];
            [v9 setTimeOffset:v20 + v17 * v19];
            [v2 addObject:v9];
          }
          else
          {
            v9 = avt_default_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              [(CAAnimationGroup(AVTExtensions) *)v26 avt_animationsByUngroupingRecursively];
            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  return v2;
}

- (void)avt_animationsByUngroupingRecursively
{
  uint64_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl(&dword_20B819000, a4, OS_LOG_TYPE_ERROR, "Error: Unreachable code: Unsupported animation class %@", a1, 0xCu);
}

@end