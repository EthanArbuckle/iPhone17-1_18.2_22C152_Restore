@interface MSAssistantPreferences
+ (BOOL)isMultiUserEnabledForSiri;
+ (id)intentExamples;
+ (id)sharedPreferences;
+ (id)supportedMediaIntents;
- (AFMultiUserConnection)connection;
- (MSAssistantPreferences)init;
- (void)getHomeUserIDForSpeaker:(id)a3 completion:(id)a4;
- (void)getSharedUserIDForHomeUser:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation MSAssistantPreferences

+ (id)sharedPreferences
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__MSAssistantPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, block);
  }
  v2 = (void *)sharedPreferences_sharedInstance;

  return v2;
}

uint64_t __43__MSAssistantPreferences_sharedPreferences__block_invoke()
{
  sharedPreferences_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (MSAssistantPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSAssistantPreferences;
  v2 = [(MSAssistantPreferences *)&v6 init];
  if (v2)
  {
    v3 = (AFMultiUserConnection *)objc_alloc_init(MEMORY[0x263F28560]);
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (void)getHomeUserIDForSpeaker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  connection = self->_connection;
  if (connection)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__MSAssistantPreferences_getHomeUserIDForSpeaker_completion___block_invoke;
    v11[3] = &unk_2647753D0;
    id v12 = v7;
    [(AFMultiUserConnection *)connection getSharedUserInfoForSharedUserID:v6 completion:v11];
  }
  else if (v7)
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

void __61__MSAssistantPreferences_getHomeUserIDForSpeaker_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 homeUserId];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0);
  }
}

- (void)getSharedUserIDForHomeUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void, void))v7;
  connection = self->_connection;
  if (connection)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__MSAssistantPreferences_getSharedUserIDForHomeUser_completion___block_invoke;
    v11[3] = &unk_2647753F8;
    id v12 = v7;
    [(AFMultiUserConnection *)connection getSharedUserIdForHomeUserId:v6 completion:v11];
  }
  else if (v7)
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

uint64_t __64__MSAssistantPreferences_getSharedUserIDForHomeUser_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)isMultiUserEnabledForSiri
{
  uint64_t v2 = AFPreferencesSupportedMultiUserLanguages();
  id v3 = [MEMORY[0x263F285A0] sharedPreferences];
  v4 = [v3 languageCode];

  LOBYTE(v3) = [v2 containsObject:v4];
  return (char)v3;
}

+ (id)intentExamples
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 preferredLocalizations];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", (void)v17);
        v11 = [v10 pathForResource:@"AppIntentVocabulary" ofType:@"plist" inDirectory:&stru_26D978A38 forLocalization:v9];

        if (v11)
        {
          v13 = [NSDictionary dictionaryWithContentsOfFile:v11];
          v14 = [v13 valueForKeyPath:@"IntentPhrases"];
          v15 = [v14 valueForKeyPath:@"IntentExamples"];

          id v12 = [v15 firstObject];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

+ (id)supportedMediaIntents
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 objectForInfoDictionaryKey:@"INSupportedMediaCategories"];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  uint64_t v6 = v5;

  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  v8 = (void *)[v6 copy];
  uint64_t v9 = [v7 setWithArray:v8];

  return v9;
}

- (AFMultiUserConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end