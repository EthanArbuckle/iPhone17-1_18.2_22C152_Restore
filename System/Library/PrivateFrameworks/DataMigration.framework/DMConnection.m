@interface DMConnection
+ (id)connection;
- (BOOL)isMigrationNeeded;
- (DMConnection)init;
- (id)connection;
- (id)migrationPhaseDescription;
- (id)orderedPluginIdentifiers;
- (id)previousBuildVersion;
- (id)userDataDispositionAuxiliaryData;
- (int64_t)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5;
- (unsigned)userDataDisposition;
- (void)cancelDeferredExit;
- (void)changeVisibility:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)deferExit;
- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3;
- (void)migrationPluginResults:(id)a3;
- (void)reportMigrationFailure;
- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4;
@end

@implementation DMConnection

- (void).cxx_destruct
{
}

- (void)dealloc
{
  _DMLogFunc(v2, 7, @"DMConnection will dealloc %@");
  [(DMXPCConnection *)self->_connection invalidate];
  v5.receiver = self;
  v5.super_class = (Class)DMConnection;
  [(DMConnection *)&v5 dealloc];
}

+ (id)connection
{
  return objc_alloc_init(DMConnection);
}

- (unsigned)userDataDisposition
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 6);
  objc_super v5 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14530]);
    _DMLogFunc(v2, 6, @"Data migrator -userDataDisposition: XPC error: %s");
    unsigned int uint64 = 0;
  }
  else
  {
    unsigned int uint64 = xpc_dictionary_get_uint64(v5, "disposition");
  }

  return uint64;
}

- (id)previousBuildVersion
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 7);
  objc_super v5 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14530]);
    _DMLogFunc(v2, 6, @"Data migrator -userDataDisposition: XPC error: %s");
  }
  else
  {
    string = xpc_dictionary_get_string(v5, "previousBuildVersion");
    if (string)
    {
      v7 = [NSString stringWithUTF8String:string];
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (DMConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)DMConnection;
  v3 = [(DMConnection *)&v8 init];
  if (v3)
  {
    xpc_object_t v4 = [[DMXPCConnection alloc] initWithServiceName:@"com.apple.datamigrator"];
    connection = v3->_connection;
    v3->_connection = v4;

    v6 = v3->_connection;
    if (v6)
    {
      [(DMXPCConnection *)v6 targetForegroundUserSessionIfNecessary];
      [(DMXPCConnection *)v3->_connection resume];
    }
    else
    {

      v3 = 0;
    }
  }
  _DMLogFunc(v2, 7, @"DMConnection did init %@");
  return v3;
}

- (BOOL)isMigrationNeeded
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 5);
  objc_super v5 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14530]);
    _DMLogFunc(v2, 6, @"Data migrator -isMigrationNeeded: XPC error: %s");
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = xpc_dictionary_get_BOOL(v5, "isMigrationNeeded");
  }

  return v6;
}

- (id)connection
{
  return self->_connection;
}

- (id)userDataDispositionAuxiliaryData
{
  v23[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 13);
  objc_super v5 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14530]);
    v17 = @"Data migrator -userDataDispositionAuxiliaryData: XPC error: %s";
    uint64_t v18 = v2;
  }
  else
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v5, "dispositionAuxiliaryData", &length);
    if (data)
    {
      v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      objc_super v8 = (void *)MEMORY[0x1E4F28DC0];
      v9 = (void *)MEMORY[0x1E4F1CAD0];
      v23[0] = objc_opt_class();
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      v11 = [v9 setWithArray:v10];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      v22[0] = objc_opt_class();
      v22[1] = objc_opt_class();
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      v14 = [v12 setWithArray:v13];
      id v20 = 0;
      v15 = [v8 unarchivedDictionaryWithKeysOfClasses:v11 objectsOfClasses:v14 fromData:v7 error:&v20];
      id v16 = v20;

      _DMLogFunc(v2, 6, @"Data migrator -userDataDispositionAuxiliaryData: did unarchive auxiliary data with success %d error %@");
      goto LABEL_7;
    }
    uint64_t v18 = v2;
    v17 = @"Data migrator -userDataDispositionAuxiliaryData: got no auxiliary data";
  }
  _DMLogFunc(v18, 6, v17);
  v15 = 0;
LABEL_7:

  return v15;
}

- (int64_t)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5
{
  BOOL v6 = a5;
  id v9 = a4;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v10, "msgID", 0);
  xpc_dictionary_set_BOOL(v10, "checkNecessity", a3);
  if (v9) {
    xpc_dictionary_set_string(v10, "lastRelevantPlugin", (const char *)[v9 UTF8String]);
  }
  if (v6) {
    xpc_dictionary_set_BOOL(v10, "testMigrationInfrastructureOnly", 1);
  }
  v11 = [(DMXPCConnection *)self->_connection sendMessageSync:v10];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    BOOL v13 = v11 == (void *)MEMORY[0x1E4F14520];
    xpc_dictionary_get_string(v11, (const char *)*MEMORY[0x1E4F14530]);
    _DMLogFunc(v5, 6, @"Data migrator -migrateWithCompletion: XPC error: %s");
    int64_t int64 = 4 * v13;
  }
  else
  {
    int64_t int64 = xpc_dictionary_get_int64(v11, "migrationResult");
  }

  return int64;
}

- (id)orderedPluginIdentifiers
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "msgID", 1);
  xpc_object_t v4 = [(DMXPCConnection *)self->_connection sendMessageSync:v3];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v5 = xpc_dictionary_get_value(v4, "results");
    if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F14568])
    {
      size_t count = xpc_array_get_count(v5);
      BOOL v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
      if (count)
      {
        for (size_t i = 0; i != count; ++i)
        {
          id v9 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_array_get_string(v5, i));
          [v6 addObject:v9];
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)changeVisibility:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "msgID", 3);
  xpc_dictionary_set_BOOL(v7, "visible", a3);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = self;
  connection = v14->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__DMConnection_changeVisibility_completion___block_invoke;
  v10[3] = &unk_1E6C1E148;
  id v9 = v6;
  id v11 = v9;
  v12 = v13;
  [(DMXPCConnection *)connection sendMessage:v7 replyHandler:v10];

  _Block_object_dispose(v13, 8);
}

void __44__DMConnection_changeVisibility_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1E01944D0](a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  xpc_object_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "msgID", 2);
  xpc_dictionary_set_BOOL(xdict, "progress", a3);
  xpc_dictionary_set_BOOL(xdict, "invert", a4);
  id v7 = [(DMXPCConnection *)self->_connection sendMessageSync:xdict];
}

- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "msgID", 4);
  xpc_dictionary_set_uint64(xdict, "disposition", a3);
  id v5 = [(DMXPCConnection *)self->_connection sendMessageSync:xdict];
}

- (void)reportMigrationFailure
{
  id v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msgID", 8);
  xpc_object_t v4 = [(DMXPCConnection *)self->_connection sendMessageSync:v6];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    id v5 = @"Data migrator -reportMigrationFailure: XPC error: %s";
  }
  else
  {
    id v5 = @"Data migrator -reportMigrationFailure: succeeded";
  }
  _DMLogFunc(v2, 6, v5);
}

- (id)migrationPhaseDescription
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "msgID", 9);
  xpc_object_t v4 = [(DMXPCConnection *)self->_connection sendMessageSync:v3];
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8] || (string = xpc_dictionary_get_string(v4, "description")) == 0)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [NSString stringWithUTF8String:string];
  }

  return v6;
}

- (void)migrationPluginResults:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "msgID", 10);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  v12 = self;
  connection = v12->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__DMConnection_migrationPluginResults___block_invoke;
  v8[3] = &unk_1E6C1E148;
  id v7 = v4;
  id v9 = v7;
  xpc_object_t v10 = v11;
  [(DMXPCConnection *)connection sendMessage:v5 replyHandler:v8];

  _Block_object_dispose(v11, 8);
}

void __39__DMConnection_migrationPluginResults___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (MEMORY[0x1E01944D0]() == MEMORY[0x1E4F145A8])
  {
    if (*(void *)(a1 + 32))
    {
      _DMLogFunc(v2, 6, @"Data migrator -migrationPluginResults: got xpc error");
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.datamigrator" code:2 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
  else
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "results", &length);
    if (data)
    {
      id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      id v15 = 0;
      id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];
      id v8 = v15;
      _DMLogFunc(v2, 6, @"Data migrator -migrationPluginResults: did unarchive results with success %d error %@");
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v8);
      }
    }
    else
    {
      _DMLogFunc(v2, 6, @"Data migrator -migrationPluginResults: got no results");
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        (*(void (**)(uint64_t, void, void))(v12 + 16))(v12, 0, 0);
      }
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

- (void)deferExit
{
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 11);
  id v3 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
}

- (void)cancelDeferredExit
{
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 12);
  id v3 = [(DMXPCConnection *)self->_connection sendMessageSync:v4];
}

@end