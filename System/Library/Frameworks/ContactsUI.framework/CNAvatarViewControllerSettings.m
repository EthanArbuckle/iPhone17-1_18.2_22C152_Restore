@interface CNAvatarViewControllerSettings
+ (BOOL)threeDTouchEnabledDefaultValue;
+ (id)defaultSettings;
+ (id)defaultSettingsWithBackgroundStyle:(unint64_t)a3;
+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 threeDTouchEnabled:(BOOL)a4;
+ (id)defaultSettingsWithPersonaId:(id)a3;
+ (id)defaultSettingsWithPersonaId:(id)a3 backgroundStyle:(unint64_t)a4;
+ (id)settingsWithContactStore:(id)a3;
+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 threeDTouchEnabled:(BOOL)a5;
+ (id)settingsWithContactStore:(id)a3 threeDTouchEnabled:(BOOL)a4;
+ (id)settingsWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8;
- (BOOL)threeDTouchEnabled;
- (CNAvatarViewControllerSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8 personaId:(id)a9;
- (CNContactStore)contactStore;
- (CNSchedulerProvider)schedulerProvider;
- (CNUILikenessRendering)likenessRenderer;
- (CNUIPRLikenessResolver)likenessResolver;
- (NSString)personaId;
- (unint64_t)backgroundStyle;
- (unint64_t)style;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setContactStore:(id)a3;
- (void)setLikenessRenderer:(id)a3;
- (void)setLikenessResolver:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setSchedulerProvider:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
@end

@implementation CNAvatarViewControllerSettings

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (unint64_t)style
{
  return self->_style;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUILikenessRendering)likenessRenderer
{
  return self->_likenessRenderer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

+ (id)defaultSettingsWithCacheSize:(unint64_t)a3 threeDTouchEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[CNUIContactsEnvironment currentEnvironment];
  v8 = [v7 contactStore];
  v9 = [a1 settingsWithContactStore:v8 cacheSize:a3 threeDTouchEnabled:v4];

  return v9;
}

+ (id)defaultSettings
{
  return (id)[a1 defaultSettingsWithBackgroundStyle:0];
}

+ (id)defaultSettingsWithBackgroundStyle:(unint64_t)a3
{
  v5 = +[CNUIContactsEnvironment currentEnvironment];
  v6 = [v5 cachingLikenessResolver];
  v7 = [v5 cachingLikenessRenderer];
  v8 = [v5 contactStore];
  uint64_t v9 = [a1 threeDTouchEnabledDefaultValue];
  v10 = [v5 defaultSchedulerProvider];
  v11 = [a1 settingsWithLikenessResolver:v6 likenessRenderer:v7 contactStore:v8 threeDTouchEnabled:v9 schedulerProvider:v10 backgroundStyle:a3];

  return v11;
}

+ (BOOL)threeDTouchEnabledDefaultValue
{
  return 0;
}

+ (id)settingsWithContactStore:(id)a3 cacheSize:(unint64_t)a4 threeDTouchEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = +[CNUIContactsEnvironment currentEnvironment];
  id v9 = objc_alloc(MEMORY[0x1E4F5A6E0]);
  v10 = [v8 defaultSchedulerProvider];
  v11 = (void *)[v9 initWithContactStore:v7 schedulerProvider:v10];

  [v11 setProhibitedSources:8];
  id v12 = v11;
  if (a4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = (void *)MEMORY[0x1E4F5A6C0];
    v15 = [v8 defaultSchedulerProvider];
    v16 = [v17 rendererWithLikenessResolver:v12 schedulerProvider:v15];
    v13 = v12;
  }
  else
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E8]) initWithLikenessResolver:v12 capacity:a4];

    v14 = (void *)MEMORY[0x1E4F5A6C0];
    v15 = [v8 defaultSchedulerProvider];
    v16 = [v14 cachingRendererWithLikenessResolver:v13 capacity:a4 schedulerProvider:v15];
  }

  v18 = [v8 defaultSchedulerProvider];
  v19 = +[CNAvatarViewControllerSettings settingsWithLikenessResolver:v13 likenessRenderer:v16 contactStore:v7 threeDTouchEnabled:v5 schedulerProvider:v18 backgroundStyle:0];

  return v19;
}

+ (id)settingsWithContactStore:(id)a3 threeDTouchEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = +[CNUIContactsEnvironment currentEnvironment];
  id v7 = objc_alloc(MEMORY[0x1E4F5A6E0]);
  v8 = [v6 defaultSchedulerProvider];
  id v9 = (void *)[v7 initWithContactStore:v5 schedulerProvider:v8];

  [v9 setProhibitedSources:8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E8]) initWithLikenessResolver:v9];
  v11 = (void *)MEMORY[0x1E4F5A6C0];
  id v12 = [v6 defaultSchedulerProvider];
  v13 = [v11 cachingRendererWithLikenessResolver:v10 schedulerProvider:v12];

  v14 = [v6 defaultSchedulerProvider];
  v15 = +[CNAvatarViewControllerSettings settingsWithLikenessResolver:v10 likenessRenderer:v13 contactStore:v5 threeDTouchEnabled:v4 schedulerProvider:v14 backgroundStyle:0];

  return v15;
}

+ (id)settingsWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8
{
  BOOL v9 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[CNAvatarViewControllerSettings alloc] initWithLikenessResolver:v16 likenessRenderer:v15 contactStore:v14 threeDTouchEnabled:v9 schedulerProvider:v13 backgroundStyle:a8 personaId:0];

  return v17;
}

- (CNAvatarViewControllerSettings)initWithLikenessResolver:(id)a3 likenessRenderer:(id)a4 contactStore:(id)a5 threeDTouchEnabled:(BOOL)a6 schedulerProvider:(id)a7 backgroundStyle:(unint64_t)a8 personaId:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = (NSString *)a9;
  v24.receiver = self;
  v24.super_class = (Class)CNAvatarViewControllerSettings;
  v19 = [(CNAvatarViewControllerSettings *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_likenessResolver, a3);
    objc_storeStrong((id *)&v20->_likenessRenderer, a4);
    objc_storeStrong((id *)&v20->_contactStore, a5);
    v20->_threeDTouchEnabled = a6;
    objc_storeStrong((id *)&v20->_schedulerProvider, a7);
    v20->_backgroundStyle = a8;
    v20->_personaId = v18;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_likenessRenderer, 0);
  objc_storeStrong((id *)&self->_likenessResolver, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setSchedulerProvider:(id)a3
{
}

- (void)setLikenessRenderer:(id)a3
{
}

- (void)setLikenessResolver:(id)a3
{
}

- (CNUIPRLikenessResolver)likenessResolver
{
  return self->_likenessResolver;
}

- (void)setPersonaId:(id)a3
{
  self->_personaId = (NSString *)a3;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_threeDTouchEnabled = a3;
}

- (void)setContactStore:(id)a3
{
}

+ (id)defaultSettingsWithPersonaId:(id)a3 backgroundStyle:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[CNUIContactsEnvironment currentEnvironment];
  v8 = v7;
  if (v6) {
    [v7 setPersonaId:v6];
  }
  BOOL v9 = [CNAvatarViewControllerSettings alloc];
  v10 = [v8 cachingLikenessResolver];
  v11 = [v8 cachingLikenessRenderer];
  id v12 = [v8 contactStore];
  uint64_t v13 = [a1 threeDTouchEnabledDefaultValue];
  id v14 = [v8 defaultSchedulerProvider];
  id v15 = [(CNAvatarViewControllerSettings *)v9 initWithLikenessResolver:v10 likenessRenderer:v11 contactStore:v12 threeDTouchEnabled:v13 schedulerProvider:v14 backgroundStyle:a4 personaId:v6];

  return v15;
}

+ (id)defaultSettingsWithPersonaId:(id)a3
{
  return (id)[a1 defaultSettingsWithPersonaId:a3 backgroundStyle:0];
}

+ (id)settingsWithContactStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "settingsWithContactStore:threeDTouchEnabled:", v4, objc_msgSend(a1, "threeDTouchEnabledDefaultValue"));

  return v5;
}

@end