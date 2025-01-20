@interface ATXUserEducationSuggestionServer
+ (id)sharedInstance;
- (ATXUserEducationSuggestionCustomizeFocusServer)customizeFocusServer;
- (ATXUserEducationSuggestionExploreFacesServer)exploreFacesServer;
- (ATXUserEducationSuggestionServer)init;
- (ATXUserEducationSuggestionSleepMigrationServer)sleepMigrationServer;
@end

@implementation ATXUserEducationSuggestionServer

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ATXUserEducationSuggestionServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_1, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  return v2;
}

void __50__ATXUserEducationSuggestionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;
}

- (ATXUserEducationSuggestionServer)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)ATXUserEducationSuggestionServer;
  v2 = [(ATXUserEducationSuggestionServer *)&v17 init];
  if (v2)
  {
    v3 = __atxlog_handle_context_user_education_suggestions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[ATXUserEducationSuggestionServer init]";
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%s: starting server", buf, 0xCu);
    }

    id v4 = objc_alloc(MEMORY[0x1E4F4B3C8]);
    uint64_t v5 = *MEMORY[0x1E4F4B580];
    uint64_t v6 = *MEMORY[0x1E4F4B578];
    v7 = objc_opt_new();
    uint64_t v8 = [v4 initWithOurInterfaceFactory:MEMORY[0x1E4F4AE20] theirInterfaceFactory:MEMORY[0x1E4F4AE18] ourServiceName:v5 theirServiceName:v6 requestHandler:v7];
    connector = v2->_connector;
    v2->_connector = (ATXUserEducationSuggestionConnector *)v8;

    v10 = [[ATXUserEducationSuggestionCustomizeFocusServer alloc] initWithConnector:v2->_connector];
    customizeFocusServer = v2->_customizeFocusServer;
    v2->_customizeFocusServer = v10;

    v12 = [[ATXUserEducationSuggestionSleepMigrationServer alloc] initWithConnector:v2->_connector];
    sleepMigrationServer = v2->_sleepMigrationServer;
    v2->_sleepMigrationServer = v12;

    if (([MEMORY[0x1E4F93B08] isiPad] & 1) == 0)
    {
      v14 = [[ATXUserEducationSuggestionExploreFacesServer alloc] initWithConnector:v2->_connector];
      exploreFacesServer = v2->_exploreFacesServer;
      v2->_exploreFacesServer = v14;
    }
  }
  return v2;
}

- (ATXUserEducationSuggestionCustomizeFocusServer)customizeFocusServer
{
  return self->_customizeFocusServer;
}

- (ATXUserEducationSuggestionSleepMigrationServer)sleepMigrationServer
{
  return self->_sleepMigrationServer;
}

- (ATXUserEducationSuggestionExploreFacesServer)exploreFacesServer
{
  return self->_exploreFacesServer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreFacesServer, 0);
  objc_storeStrong((id *)&self->_sleepMigrationServer, 0);
  objc_storeStrong((id *)&self->_customizeFocusServer, 0);
  objc_storeStrong((id *)&self->_connector, 0);
}

@end