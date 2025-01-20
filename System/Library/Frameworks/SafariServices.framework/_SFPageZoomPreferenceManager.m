@interface _SFPageZoomPreferenceManager
+ (id)sharedManager;
- (_SFPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3;
- (void)_didRemoveHostnames:(id)a3;
- (void)dealloc;
- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5;
- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5;
- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6;
@end

@implementation _SFPageZoomPreferenceManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_45);
  }
  v2 = (void *)sharedManager_sharedManager;

  return v2;
}

- (_SFPageZoomPreferenceManager)initWithPerSitePreferencesStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFPageZoomPreferenceManager;
  v3 = [(WBSPageZoomPreferenceManager *)&v7 initWithPerSitePreferencesStore:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__didRemoveHostnames_ name:*MEMORY[0x1E4F99240] object:0];
    [v4 addObserver:v3 selector:sel__historyWasCleared_ name:*MEMORY[0x1E4F99268] object:0];
    v5 = v3;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SFPageZoomPreferenceManager;
  [(_SFPageZoomPreferenceManager *)&v4 dealloc];
}

- (void)_didRemoveHostnames:(id)a3
{
  objc_super v4 = [a3 object];
  id v5 = (id)[v4 copy];

  [(WBSPageZoomPreferenceManager *)self removePageZoomPreferencesForHostnames:v5];
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82___SFPageZoomPreferenceManager_setValue_ofPreference_forDomain_completionHandler___block_invoke;
  v13[3] = &unk_1E5C726C8;
  id v14 = v10;
  v12.receiver = self;
  v12.super_class = (Class)_SFPageZoomPreferenceManager;
  id v11 = v10;
  [(WBSPerSitePreferenceManager *)&v12 setValue:a3 ofPreference:a4 forDomain:a5 completionHandler:v13];
}

- (void)setDefaultValue:(id)a3 ofPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79___SFPageZoomPreferenceManager_setDefaultValue_ofPreference_completionHandler___block_invoke;
  v11[3] = &unk_1E5C726C8;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)_SFPageZoomPreferenceManager;
  id v9 = v8;
  [(WBSPerSitePreferenceManager *)&v10 setDefaultValue:a3 ofPreference:a4 completionHandler:v11];
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98___SFPageZoomPreferenceManager_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
  v11[3] = &unk_1E5C726C8;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)_SFPageZoomPreferenceManager;
  id v9 = v8;
  [(WBSPerSitePreferenceManager *)&v10 removePreferenceValuesForDomains:a3 fromPreference:a4 completionHandler:v11];
}

@end