@interface _CDModeClassifier
- (ATXModeClassifier)modeClassifier;
- (_CDModeClassifier)init;
- (void)_enableFocusModesIfPossible;
- (void)setModeClassifier:(id)a3;
@end

@implementation _CDModeClassifier

- (_CDModeClassifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CDModeClassifier;
  v2 = [(_CDModeClassifier *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_CDModeClassifier *)v2 _enableFocusModesIfPossible];
  }
  return v3;
}

- (void)_enableFocusModesIfPossible
{
  objc_initWeak(&location, self);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getATXModeClassifierClass_softClass;
  uint64_t v20 = getATXModeClassifierClass_softClass;
  if (!getATXModeClassifierClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getATXModeClassifierClass_block_invoke;
    v15 = &unk_1E5609408;
    v16 = &v17;
    ProactiveContextClientLibraryCore();
    Class Class = objc_getClass("ATXModeClassifier");
    *(void *)(v16[1] + 24) = Class;
    getATXModeClassifierClass_softClass Class = *(void *)(v16[1] + 24);
    v2 = (void *)v18[3];
  }
  id v4 = v2;
  _Block_object_dispose(&v17, 8);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  objc_super v5 = (void *)getATXModeDuetHelperClass_softClass;
  uint64_t v20 = getATXModeDuetHelperClass_softClass;
  if (!getATXModeDuetHelperClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getATXModeDuetHelperClass_block_invoke;
    v15 = &unk_1E5609408;
    v16 = &v17;
    ProactiveContextClientLibraryCore();
    Class v6 = objc_getClass("ATXModeDuetHelper");
    *(void *)(v16[1] + 24) = v6;
    getATXModeDuetHelperClass_softClass Class = *(void *)(v16[1] + 24);
    objc_super v5 = (void *)v18[3];
  }
  id v7 = v5;
  _Block_object_dispose(&v17, 8);
  v8 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___CDModeClassifier__enableFocusModesIfPossible__block_invoke;
  v9[3] = &unk_1E5609698;
  objc_copyWeak(&v10, &location);
  [v4 provideModeClassifierWhenReadyWithDuetHelper:v8 block:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (ATXModeClassifier)modeClassifier
{
  return (ATXModeClassifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModeClassifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end