@interface _INVocabularyConnection
+ (void)initialize;
- (_INVocabularyConnection)init;
- (id)_connect;
- (id)settingsService;
- (void)_clearConnection;
- (void)dealloc;
@end

@implementation _INVocabularyConnection

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (id)settingsService
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__71855;
  v10 = __Block_byref_object_dispose__71856;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___INVocabularyConnection_settingsService__block_invoke;
  v5[3] = &unk_1E551B170;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.siri.vocabularyupdates" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC31568];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&from, self->_connection);
    uint64_t v8 = self->_connection;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35___INVocabularyConnection__connect__block_invoke;
    v17[3] = &unk_1E551B148;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    [(NSXPCConnection *)v8 setInterruptionHandler:v17];
    v9 = self->_connection;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __35___INVocabularyConnection__connect__block_invoke_69;
    v14 = &unk_1E551B148;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    [(NSXPCConnection *)v9 setInvalidationHandler:&v11];
    [(NSXPCConnection *)self->_connection resume];
    self->_connectionValid = 1;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (_INVocabularyConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)_INVocabularyConnection;
  v2 = [(_INVocabularyConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("INVocabularyConnectionQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_connectionValid = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  [(_INVocabularyConnection *)self _clearConnection];
  v3.receiver = self;
  v3.super_class = (Class)_INVocabularyConnection;
  [(_INVocabularyConnection *)&v3 dealloc];
}

- (void)_clearConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___INVocabularyConnection__clearConnection__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

@end