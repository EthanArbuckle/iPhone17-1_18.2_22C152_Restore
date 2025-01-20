@interface BMDSLClasses
+ (id)allowed;
@end

@implementation BMDSLClasses

+ (id)allowed
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:11];
  v4 = objc_msgSend(v2, "initWithArray:", v3, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);

  return v4;
}

@end