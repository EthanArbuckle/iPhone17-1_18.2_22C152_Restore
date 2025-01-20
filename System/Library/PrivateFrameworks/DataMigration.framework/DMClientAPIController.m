@interface DMClientAPIController
- (BOOL)_migrateWithConnection:(id)a3 checkNecessity:(BOOL)a4 lastRelevantPlugin:(id)a5 testMigrationInfrastructureOnly:(BOOL)a6;
- (DMClientAPIController)init;
- (double)connectionMigrationTimeIntervalToLastRetryDate;
- (unint64_t)connectionMigrationMaximumAttempts;
- (void)progressHostIsReady;
- (void)setConnectionMigrationMaximumAttempts:(unint64_t)a3;
- (void)setConnectionMigrationTimeIntervalToLastRetryDate:(double)a3;
@end

@implementation DMClientAPIController

- (DMClientAPIController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DMClientAPIController;
  v2 = [(DMClientAPIController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(DMClientAPIController *)v2 setConnectionMigrationMaximumAttempts:3];
    [(DMClientAPIController *)v3 setConnectionMigrationTimeIntervalToLastRetryDate:1.0];
  }
  return v3;
}

- (BOOL)_migrateWithConnection:(id)a3 checkNecessity:(BOOL)a4 lastRelevantPlugin:(id)a5 testMigrationInfrastructureOnly:(BOOL)a6
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  id v11 = a3;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1C9C8] date];
  [(DMClientAPIController *)self connectionMigrationTimeIntervalToLastRetryDate];
  v14 = objc_msgSend(v13, "dateByAddingTimeInterval:");

  unint64_t v15 = [(DMClientAPIController *)self connectionMigrationMaximumAttempts];
  if (v15)
  {
    for (unint64_t i = v15 - 1; ; --i)
    {
      uint64_t v17 = [v11 migrateCheckingNecessity:v9 lastRelevantPlugin:v12 testMigrationInfrastructureOnly:v7];
      if (v17 != 4)
      {
        if (v17 == 3)
        {
          uint64_t v21 = v6;
          v22 = @"Data migrator successful so far. Un-blocking because plugin %@ did finish";
        }
        else
        {
          if (v17 != 2)
          {
            BOOL v23 = v17 == 1;
            _DMLogFunc(v6, 5, @"Data migrator completed with success: %s!");
            goto LABEL_18;
          }
          uint64_t v21 = v6;
          v22 = @"Data migrator was not necessary";
        }
        _DMLogFunc(v21, 5, v22);
        goto LABEL_13;
      }
      if (!v9)
      {
        v18 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v19 = [v18 compare:v14];

        if (v19 == 1) {
          break;
        }
      }
      uint64_t v20 = v6;
      if (!i)
      {
        v24 = @"Data migrator XPC interruption. Will not retry, because we are out of retries.";
        goto LABEL_17;
      }
      _DMLogFunc(v6, 5, @"Data migrator XPC interruption. Will retry.");
    }
    uint64_t v20 = v6;
    v24 = @"Data migrator XPC interruption. Will not retry, because too much time elapsed in the earlier attempt(s).";
LABEL_17:
    _DMLogFunc(v20, 5, v24);
    BOOL v23 = 0;
  }
  else
  {
LABEL_13:
    BOOL v23 = 1;
  }
LABEL_18:

  return v23;
}

- (void)progressHostIsReady
{
  id v6 = +[DMConnection connection];
  if (v6)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, "msgID", 14);
    v4 = [v6 connection];
    id v5 = (id)[v4 sendMessageSync:v3];
  }
  else
  {
    _DMLogFunc(v2, 3, @"Can't connect to datamigrator!");
  }
}

- (unint64_t)connectionMigrationMaximumAttempts
{
  return self->_connectionMigrationMaximumAttempts;
}

- (void)setConnectionMigrationMaximumAttempts:(unint64_t)a3
{
  self->_connectionMigrationMaximumAttempts = a3;
}

- (double)connectionMigrationTimeIntervalToLastRetryDate
{
  return self->_connectionMigrationTimeIntervalToLastRetryDate;
}

- (void)setConnectionMigrationTimeIntervalToLastRetryDate:(double)a3
{
  self->_connectionMigrationTimeIntervalToLastRetryDate = a3;
}

@end