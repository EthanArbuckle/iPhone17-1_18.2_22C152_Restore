@interface NSAttributedString(HKAdditions)
+ (id)hk_attributedStringForSpacing:()HKAdditions nonBreaking:;
+ (uint64_t)hk_attributedStringForSpacing:()HKAdditions;
@end

@implementation NSAttributedString(HKAdditions)

+ (id)hk_attributedStringForSpacing:()HKAdditions nonBreaking:
{
  if (hk_attributedStringForSpacing_nonBreaking__onceToken != -1) {
    dispatch_once(&hk_attributedStringForSpacing_nonBreaking__onceToken, &__block_literal_global_50);
  }
  if (a4) {
    uint64_t v6 = -a3;
  }
  else {
    uint64_t v6 = a3;
  }
  v7 = [NSNumber numberWithInteger:v6];
  os_unfair_lock_lock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
  v8 = [(id)hk_attributedStringForSpacing_nonBreaking____spacerCache objectForKeyedSubscript:v7];
  os_unfair_lock_unlock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    switch(a3)
    {
      case 0:
        id v10 = objc_alloc_init(MEMORY[0x1E4F28B18]);
        goto LABEL_16;
      case 1:
        id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
        v13 = @" ";
        goto LABEL_15;
      case 2:
        id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
        v13 = @" ";
        goto LABEL_15;
      case 3:
        goto LABEL_12;
      default:
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E4F29FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
          +[NSAttributedString(HKAdditions) hk_attributedStringForSpacing:nonBreaking:](a3, v11);
        }
LABEL_12:
        id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
        v13 = @" ";
LABEL_15:
        id v10 = (id)[v12 initWithString:v13];
LABEL_16:
        id v9 = v10;
        if (a4)
        {
          v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁠"];
          v15 = (void *)[v14 mutableCopy];
          [v15 appendAttributedString:v9];
          [v15 appendAttributedString:v14];
          uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v15];

          id v9 = (id)v16;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
        [(id)hk_attributedStringForSpacing_nonBreaking____spacerCache setObject:v9 forKeyedSubscript:v7];
        os_unfair_lock_unlock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
        break;
    }
  }

  return v9;
}

+ (uint64_t)hk_attributedStringForSpacing:()HKAdditions
{
  return objc_msgSend(a1, "hk_attributedStringForSpacing:nonBreaking:", a3, 0);
}

+ (void)hk_attributedStringForSpacing:()HKAdditions nonBreaking:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Unknown HKAttributedStringSpacer: %ld, falling back to standard space", (uint8_t *)&v2, 0xCu);
}

@end