@interface ACDDatabaseBackupActivity
+ (ACDDatabaseBackupActivity)new;
- (ACDDatabase)database;
- (ACDDatabaseBackupActivity)init;
- (ACDDatabaseBackupActivity)initWithDatabase:(id)a3;
- (id)activityCriteria;
- (void)_registerActivityIfNeededSchedulingBackup:(BOOL)a3;
- (void)_registerActivitySchedulingBackup:(BOOL)a3;
- (void)registerActivityIfNeeded;
- (void)scheduleBackup;
- (void)scheduleBackupIfNonexistent;
@end

@implementation ACDDatabaseBackupActivity

+ (ACDDatabaseBackupActivity)new
{
  return 0;
}

- (ACDDatabaseBackupActivity)init
{
  return 0;
}

- (ACDDatabaseBackupActivity)initWithDatabase:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACDDatabaseBackupActivity;
  v6 = [(ACDDatabaseBackupActivity *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.accounts.databasebackup.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)activityCriteria
{
  activityExecutionCriteria = self->_activityExecutionCriteria;
  if (!activityExecutionCriteria)
  {
    v4 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    id v5 = self->_activityExecutionCriteria;
    self->_activityExecutionCriteria = v4;

    xpc_dictionary_set_string(self->_activityExecutionCriteria, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
    xpc_dictionary_set_BOOL(self->_activityExecutionCriteria, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_int64(self->_activityExecutionCriteria, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF81E8]);
    xpc_dictionary_set_int64(self->_activityExecutionCriteria, (const char *)*MEMORY[0x263EF81A0], *MEMORY[0x263EF81E0]);
    activityExecutionCriteria = self->_activityExecutionCriteria;
  }

  return activityExecutionCriteria;
}

- (void)registerActivityIfNeeded
{
}

- (void)_registerActivityIfNeededSchedulingBackup:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke;
  v4[3] = &unk_264321D38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

void __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    v3 = _ACDLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke_cold_1(v3);
    }
  }
  else
  {
    [v2 _registerActivitySchedulingBackup:*(unsigned __int8 *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 40)) {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    }
  }
}

- (void)_registerActivitySchedulingBackup:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v5 = _ACDLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "com.apple.accounts.databasebackup.activity";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Registering activity %s (scheduling backup: %d)\"", buf, 0x12u);
  }

  v6 = (void *)*MEMORY[0x263EF8188];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke;
  v7[3] = &unk_264321D60;
  BOOL v8 = v3;
  v7[4] = self;
  xpc_activity_register("com.apple.accounts.databasebackup.activity", v6, v7);
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (xpc_activity_set_state(v3, 4))
    {
      dispatch_queue_t v9 = (void *)os_transaction_create();
      uint64_t v10 = *(void *)(a1 + 32);
      __int16 v11 = *(NSObject **)(v10 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2;
      block[3] = &unk_264320E08;
      block[4] = v10;
      uint64_t v13 = v3;
      id v14 = v9;
      v6 = v9;
      dispatch_async(v11, block);
    }
    else
    {
      v6 = _ACDLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_cold_1(v6);
      }
    }
    goto LABEL_16;
  }
  if (!state)
  {
    BOOL v5 = _ACDLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2183AD000, v5, OS_LOG_TYPE_DEFAULT, "\"Checking in for accounts database backup activity\"", buf, 2u);
    }

    if (*(unsigned char *)(a1 + 40))
    {
      v6 = xpc_activity_copy_criteria(v3);
      v7 = [*(id *)(a1 + 32) activityCriteria];
      if (!v6 || !xpc_equal(v6, v7))
      {
        BOOL v8 = _ACDLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2183AD000, v8, OS_LOG_TYPE_DEFAULT, "\"Setting accounts database backup activity criteria\"", buf, 2u);
        }

        xpc_activity_set_criteria(v3, v7);
      }

LABEL_16:
    }
  }
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2183AD000, v2, OS_LOG_TYPE_DEFAULT, "\"Running accounts database backup activity\"", buf, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) database];
  id v9 = 0;
  int v4 = [v3 performBackupReturningError:&v9];
  id v5 = v9;

  v6 = _ACDLogSystem();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [*(id *)(a1 + 32) database];
      *(_DWORD *)buf = 138477827;
      __int16 v11 = v8;
      _os_log_impl(&dword_2183AD000, v7, OS_LOG_TYPE_DEFAULT, "\"Successfully backed up database: %{private}@\"", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2_cold_1((uint64_t)v5, v7);
  }

  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
}

- (void)scheduleBackup
{
}

- (void)scheduleBackupIfNonexistent
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"Accounts' database local backup file exists.\"", v1, 2u);
}

- (ACDDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activityExecutionCriteria, 0);
}

void __71__ACDDatabaseBackupActivity__registerActivityIfNeededSchedulingBackup___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2183AD000, log, OS_LOG_TYPE_DEBUG, "\"ACDDatabaseBackupActivity already has an xpc_activity pending\"", v1, 2u);
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"Couldn't set ACDDatabaseBackupActivity activity state to XPC_ACTIVITY_STATE_CONTINUE\"", v1, 2u);
}

void __63__ACDDatabaseBackupActivity__registerActivitySchedulingBackup___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "\"Failed to backup database, error: %@\"", (uint8_t *)&v2, 0xCu);
}

@end