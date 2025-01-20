@interface BRAccountTokenWillChangeObserver
- (BRAccountTokenWillChangeObserver)initWithPersonaID:(id)a3;
- (NSString)personaID;
- (void)_accountWillChange;
@end

@implementation BRAccountTokenWillChangeObserver

- (BRAccountTokenWillChangeObserver)initWithPersonaID:(id)a3
{
  v4 = (NSString *)a3;
  v5 = brc_bread_crumbs((uint64_t)"-[BRAccountTokenWillChangeObserver initWithPersonaID:]", 42);
  v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRAccountTokenWillChangeObserver initWithPersonaID:]();
  }

  personaID = self->_personaID;
  self->_personaID = v4;
  v8 = v4;

  +[BRAccount startAccountTokenChangeObserverIfNeeded];
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__accountWillChange name:@"BRAccountTokenWillChangeNotification" object:0];

  return self;
}

- (void)_accountWillChange
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 personaID];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_19ED3F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] received token change notification, invalidating cache for persona: %@%@", (uint8_t *)&v6, 0x16u);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void).cxx_destruct
{
}

- (void)initWithPersonaID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Initializing BRAccountTokenWillChangeObserver with persona: %@%@");
}

@end