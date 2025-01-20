@interface CNAvatarImageRendererSettings
+ (id)defaultSettings;
+ (id)defaultSettingsWithCacheSize:(unint64_t)a3;
+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 personaId:(id)a4;
+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 skipContactLookup:(BOOL)a4;
+ (id)defaultSettingsWithPersonaId:(id)a3;
+ (id)offMainThreadSynchronousRenderingOnlySettingsWithCacheSize:(unint64_t)a3;
+ (id)settingsWithContactStore:(id)a3;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 concurrentCaches:(BOOL)a6 skipContactLookup:(BOOL)a7 personaId:(id)a8;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 skipContactLookup:(BOOL)a6;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 skipContactLookup:(BOOL)a5;
+ (id)settingsWithContactStore:(id)a3 schedulerProvider:(id)a4;
- (CNAvatarImageRendererSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 schedulerProvider:(id)a5;
- (CNSchedulerProvider)schedulerProvider;
- (CNUILikenessRendering)likenessRenderer;
- (CNUIPRLikenessResolver)likenessResolver;
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
@end

@implementation CNAvatarImageRendererSettings

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

- (CNUILikenessRendering)likenessRenderer
{
  return self->_likenessRenderer;
}

+ (id)defaultSettings
{
  return (id)[a1 defaultSettingsWithCacheSize:0];
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3
{
  return (id)[a1 defaultSettingsWithCacheSize:a3 skipContactLookup:0];
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 skipContactLookup:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[CNUIContactsEnvironment currentEnvironment];
  v8 = v7;
  if (v4)
  {
    v9 = 0;
  }
  else
  {
    v9 = [v7 contactStore];
  }
  v10 = [a1 settingsWithContactStore:v9 cacheSize:a3 skipContactLookup:v4];

  return v10;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 skipContactLookup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = +[CNUIContactsEnvironment currentEnvironment];
  v10 = [v9 defaultSchedulerProvider];
  v11 = [a1 settingsWithContactStore:v8 cacheSize:a4 schedulerProvider:v10 skipContactLookup:v5];

  return v11;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 skipContactLookup:(BOOL)a6
{
  return (id)[a1 settingsWithContactStore:a3 cacheSize:a4 schedulerProvider:a5 concurrentCaches:0 skipContactLookup:a6 personaId:0];
}

- (CNAvatarImageRendererSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarImageRendererSettings;
  v12 = [(CNAvatarImageRendererSettings *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_likenessResolver, a3);
    objc_storeStrong((id *)&v13->_likenessRenderer, a4);
    objc_storeStrong((id *)&v13->_schedulerProvider, a5);
    v14 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likenessRenderer, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);

  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)style
{
  return self->_style;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5 concurrentCaches:(BOOL)a6 skipContactLookup:(BOOL)a7 personaId:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  id v16 = objc_alloc(MEMORY[0x1E4F5A6E0]);
  if (v15) {
    v17 = (void *)[v16 initWithPersonaId:v15 schedulerProvider:v14];
  }
  else {
    v17 = (void *)[v16 initWithContactStore:v13 schedulerProvider:v14];
  }
  v18 = v17;
  [v17 setProhibitedSources:8];
  if (v9) {
    [v18 setLookupOptions:1];
  }
  id v19 = v18;
  v20 = [MEMORY[0x1E4F5A6C0] rendererWithLikenessResolver:v19 schedulerProvider:v14];
  if (a4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v19;
  }
  else
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E8]) initWithLikenessResolver:v19 capacity:a4 schedulerProvider:v14];

    if (v10) {
      [MEMORY[0x1E4F5A6C0] concurrentCachingRendererWithLikenessResolver:v21 capacity:a4 schedulerProvider:v14];
    }
    else {
    uint64_t v22 = [MEMORY[0x1E4F5A6C0] cachingRendererWithLikenessResolver:v21 capacity:a4 schedulerProvider:v14];
    }

    v20 = (void *)v22;
  }
  v23 = [[CNAvatarImageRendererSettings alloc] initWithLikenessResolver:v21 likenessRenderer:v20 schedulerProvider:v14];

  return v23;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 schedulerProvider:(id)a5
{
  return (id)[a1 settingsWithContactStore:a3 cacheSize:a4 schedulerProvider:a5 skipContactLookup:0];
}

+ (id)settingsWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  return (id)[a1 settingsWithContactStore:a3 cacheSize:0 schedulerProvider:a4];
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4
{
  return (id)[a1 settingsWithContactStore:a3 cacheSize:a4 skipContactLookup:0];
}

+ (id)settingsWithContactStore:(id)a3
{
  return (id)[a1 settingsWithContactStore:a3 cacheSize:0];
}

+ (id)offMainThreadSynchronousRenderingOnlySettingsWithCacheSize:(unint64_t)a3
{
  BOOL v5 = +[CNUIContactsEnvironment currentEnvironment];
  v6 = [v5 contactStore];
  v7 = [v5 defaultSchedulerProvider];
  id v8 = [v7 inlineScheduler];
  id v9 = objc_alloc(MEMORY[0x1E4F5A4F0]);
  BOOL v10 = [v7 backgroundScheduler];
  id v11 = [v7 immediateScheduler];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke;
  v20[3] = &unk_1E5497E58;
  id v21 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_2;
  v18[3] = &unk_1E5497E58;
  id v19 = v21;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_3;
  v16[3] = &unk_1E5497E80;
  id v17 = v19;
  id v12 = v19;
  id v13 = (void *)[v9 initWithBackgroundScheduler:v10 mainThreadScheduler:v8 inlineScheduler:v8 immediateScheduler:v11 serialSchedulerProvider:v20 synchronousSerialSchedulerProvider:v18 readerWriterSchedulerProvider:v16];

  id v14 = [a1 settingsWithContactStore:v6 cacheSize:a3 schedulerProvider:v13 concurrentCaches:1 skipContactLookup:0 personaId:0];

  return v14;
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newSerialSchedulerWithName:a2];

  return v2;
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newSynchronousSerialSchedulerWithName:a2];

  return v2;
}

id __92__CNAvatarImageRendererSettings_offMainThreadSynchronousRenderingOnlySettingsWithCacheSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newReaderWriterSchedulerWithName:a2];

  return v2;
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 personaId:(id)a4
{
  id v6 = a4;
  v7 = +[CNUIContactsEnvironment currentEnvironment];
  id v8 = [v7 defaultSchedulerProvider];
  id v9 = [a1 settingsWithContactStore:0 cacheSize:a3 schedulerProvider:v8 concurrentCaches:0 skipContactLookup:0 personaId:v6];

  return v9;
}

+ (id)defaultSettingsWithPersonaId:(id)a3
{
  return (id)[a1 defaultSettingsWithCacheSize:0 personaId:a3];
}

@end