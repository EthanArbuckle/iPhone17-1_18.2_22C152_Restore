@interface CDContextValue
@end

@implementation CDContextValue

void __47___CDContextValue_supportedContextValueClasses__block_invoke()
{
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v9 = (void *)getCSSearchableItemClass_softClass;
  uint64_t v24 = getCSSearchableItemClass_softClass;
  if (!getCSSearchableItemClass_softClass)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __getCSSearchableItemClass_block_invoke;
    v20[3] = &unk_1E5609408;
    v20[4] = &v21;
    __getCSSearchableItemClass_block_invoke((uint64_t)v20);
    v9 = (void *)v22[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v21, 8);
  uint64_t v11 = objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v10, 0);
  v12 = (void *)supportedContextValueClasses_supportedContextValueClasses;
  supportedContextValueClasses_supportedContextValueClasses = v11;
}

@end