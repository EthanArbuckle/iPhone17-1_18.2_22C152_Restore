@interface GCRemoteUserDefaultsProxy
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)agentConnectionEstablished;
- (GCRemoteUserDefaultsProxy)init;
- (GCUserDefaultsXPCProxyServiceRemoteClientInterface)activeClient;
- (double)doubleForKey:(id)a3;
- (float)floatForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dataForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4;
- (void)postInitialKVONotificationForObservation:(id)a3 keyPath:(id)a4;
- (void)refreshActiveClient;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)setActiveClient:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)userDefaultsCheckIn:(id)a3 effectiveUserIdentifier:(unsigned int)a4;
@end

@implementation GCRemoteUserDefaultsProxy

- (GCRemoteUserDefaultsProxy)init
{
  v11.receiver = self;
  v11.super_class = (Class)GCRemoteUserDefaultsProxy;
  v2 = [(GCRemoteUserDefaultsProxy *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("GCRemoteUserDefaultsProxy", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:sel_consoleUserDidChange_ name:GCCurrentConsoleUserDidChangeNotification object:0];
  }
  return v2;
}

- (BOOL)agentConnectionEstablished
{
  v2 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy objectForKey:]();
      }
    }
    uint64_t v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_36];

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__7;
      v19 = __Block_byref_object_dispose__7;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_125;
      v14[3] = &unk_26D22CB18;
      v14[4] = &v15;
      [v9 objectForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy objectForKey:]();
        }
      }
      id v10 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

LABEL_6:
      goto LABEL_9;
    }
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy objectForKey:]();
      }
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_cold_1();
    }
  }
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_125(uint64_t a1, void *a2)
{
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy stringForKey:]();
      }
    }
    uint64_t v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_128];

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__7;
      v19 = __Block_byref_object_dispose__7;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_129;
      v14[3] = &unk_26D22CB40;
      v14[4] = &v15;
      [v9 stringForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy stringForKey:]();
        }
      }
      id v10 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

LABEL_6:
      goto LABEL_9;
    }
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy stringForKey:]();
      }
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_cold_1();
    }
  }
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_129(uint64_t a1, void *a2)
{
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy dataForKey:]();
      }
    }
    uint64_t v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_132_0];

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__7;
      v19 = __Block_byref_object_dispose__7;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_133;
      v14[3] = &unk_26D22CB68;
      v14[4] = &v15;
      [v9 dataForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy dataForKey:]();
        }
      }
      id v10 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

LABEL_6:
      goto LABEL_9;
    }
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy dataForKey:]();
      }
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_cold_1();
    }
  }
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_133(uint64_t a1, void *a2)
{
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy dictionaryForKey:]();
      }
    }
    uint64_t v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_136_0];

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__7;
      v19 = __Block_byref_object_dispose__7;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_137;
      v14[3] = &unk_26D22CB90;
      v14[4] = &v15;
      [v9 dictionaryForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy dictionaryForKey:]();
        }
      }
      id v10 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

LABEL_6:
      goto LABEL_9;
    }
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy dictionaryForKey:]();
      }
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_cold_1();
    }
  }
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_137(uint64_t a1, void *a2)
{
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy arrayForKey:]();
      }
    }
    uint64_t v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_140];

      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__7;
      v19 = __Block_byref_object_dispose__7;
      id v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_141;
      v14[3] = &unk_26D22CBB8;
      v14[4] = &v15;
      [v9 arrayForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy arrayForKey:]();
        }
      }
      id v10 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

LABEL_6:
      goto LABEL_9;
    }
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy arrayForKey:]();
      }
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_cold_1();
    }
  }
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_141(uint64_t a1, void *a2)
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  [v8 setObject:v7 forKey:v6];
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (v6)
  {
    if (gc_isInternalBuild())
    {
      objc_super v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy BOOLForKey:]();
      }
    }
    id v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v7)
    {
      id v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_144];

      uint64_t v14 = 0;
      v15[0] = &v14;
      v15[1] = 0x2020000000;
      char v16 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_145;
      v13[3] = &unk_26D22CBE0;
      v13[4] = &v14;
      [v9 BOOLForKey:v4 withReply:v13];
      if (gc_isInternalBuild())
      {
        v12 = getGCLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy BOOLForKey:]((uint64_t)v15, v12);
        }
      }
      LOBYTE(v6) = *(unsigned char *)(v15[0] + 24) != 0;
      _Block_object_dispose(&v14, 8);
    }
    else
    {
      if (!gc_isInternalBuild())
      {
        LOBYTE(v6) = 0;
        goto LABEL_9;
      }
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy BOOLForKey:]();
      }
      LOBYTE(v6) = 0;
    }
  }
LABEL_9:

  return v6;
}

void __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_cold_1();
    }
  }
}

uint64_t __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_145(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  [v7 setBool:v4 forKey:v6];
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  double v7 = 0.0;
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy doubleForKey:]();
      }
    }
    id v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v8)
    {
      v9 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_148];

      uint64_t v15 = 0;
      char v16 = (double *)&v15;
      uint64_t v17 = 0x2020000000;
      uint64_t v18 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_149;
      v14[3] = &unk_26D22CC08;
      v14[4] = &v15;
      [v10 doubleForKey:v4 withReply:v14];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy doubleForKey:]();
        }
      }
      double v7 = v16[3];
      _Block_object_dispose(&v15, 8);
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_8;
      }
      id v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy doubleForKey:]();
      }
    }
  }
LABEL_8:

  return v7;
}

void __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_cold_1();
    }
  }
}

uint64_t __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_149(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  [v7 setDouble:v6 forKey:a3];
}

- (float)floatForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  float v7 = 0.0;
  if (v6)
  {
    if (gc_isInternalBuild())
    {
      v12 = getGCLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy floatForKey:]();
      }
    }
    id v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

    if (v8)
    {
      v9 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
      id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_152];

      uint64_t v21 = 0;
      v22[0] = &v21;
      v22[1] = 0x2020000000;
      int v23 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_153;
      v20[3] = &unk_26D22CC30;
      v20[4] = &v21;
      [v10 floatForKey:v4 withReply:v20];
      if (gc_isInternalBuild())
      {
        v13 = getGCLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[GCRemoteUserDefaultsProxy floatForKey:]((uint64_t)v22, v13, v14, v15, v16, v17, v18, v19);
        }
      }
      float v7 = *(float *)(v22[0] + 24);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_8;
      }
      id v10 = getGCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy floatForKey:]();
      }
    }
  }
LABEL_8:

  return v7;
}

void __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_cold_1();
    }
  }
}

uint64_t __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_153(uint64_t result, float a2)
{
  *(float *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  *(float *)&double v7 = a3;
  [v8 setFloat:v6 forKey:v7];
}

- (int64_t)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(GCRemoteUserDefaultsProxy *)v5 agentConnectionEstablished];
  objc_sync_exit(v5);

  if (!v6) {
    goto LABEL_8;
  }
  if (gc_isInternalBuild())
  {
    v12 = getGCLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[GCRemoteUserDefaultsProxy integerForKey:]();
    }
  }
  double v7 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];

  if (!v7)
  {
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy integerForKey:]();
      }
      int64_t v10 = 0;
      goto LABEL_6;
    }
LABEL_8:
    int64_t v10 = 0;
    goto LABEL_9;
  }
  id v8 = [(GCRemoteUserDefaultsProxy *)v5 activeClient];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_156];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_157;
  v14[3] = &unk_26D22CC58;
  v14[4] = &v15;
  [v9 integerForKey:v4 withReply:v14];
  if (gc_isInternalBuild())
  {
    v13 = getGCLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[GCRemoteUserDefaultsProxy integerForKey:]();
    }
  }
  int64_t v10 = v16[3];
  _Block_object_dispose(&v15, 8);
LABEL_6:

LABEL_9:
  return v10;
}

void __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (gc_isInternalBuild())
  {
    BOOL v3 = getGCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_cold_1();
    }
  }
}

uint64_t __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_157(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(GCRemoteUserDefaultsProxy *)self activeClient];
  [v7 setInteger:a3 forKey:v6];
}

- (void)postInitialKVONotificationForObservation:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [(GCRemoteUserDefaultsProxy *)v8 agentConnectionEstablished];
  objc_sync_exit(v8);

  if (!v9) {
    goto LABEL_16;
  }
  id v10 = objc_alloc_init((Class)&off_26D2B4CF0);
  [v10 setObject:&unk_26D2875A8 forKeyedSubscript:NSKeyValueChangeKindKey];
  if (([v6 options] & 4) == 0)
  {
    if (([v6 options] & 1) == 0) {
      goto LABEL_14;
    }
    objc_super v11 = [(GCRemoteUserDefaultsProxy *)v8 objectForKey:v7];
    if (v11)
    {
      [v10 setObject:v11 forKeyedSubscript:NSKeyValueChangeNewKey];
    }
    else
    {
      uint64_t v15 = +[NSNull null];
      [v10 setObject:v15 forKeyedSubscript:NSKeyValueChangeNewKey];
    }
    if (([v6 options] & 2) == 0) {
      goto LABEL_14;
    }
    v12 = +[NSNull null];
    v13 = &NSKeyValueChangeOldKey;
    goto LABEL_12;
  }
  v12 = [(GCRemoteUserDefaultsProxy *)v8 objectForKey:v7];
  if (v12)
  {
    v13 = &NSKeyValueChangeNewKey;
LABEL_12:
    [v10 setObject:v12 forKeyedSubscript:*v13];
    goto LABEL_13;
  }
  uint64_t v14 = +[NSNull null];
  [v10 setObject:v14 forKeyedSubscript:NSKeyValueChangeNewKey];

LABEL_13:
LABEL_14:
  if (gc_isInternalBuild())
  {
    uint64_t v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - postInitialKVONotificationForObservation:%@ keyPath:%@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v16 = [v6 observer];
  objc_msgSend(v16, "observeValueForKeyPath:ofObject:change:context:", v7, v8, v10, objc_msgSend(v6, "context"));

LABEL_16:
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  if (gc_isInternalBuild())
  {
    uint64_t v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412802;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2048;
      v25 = a6;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - addObserver:%@ forKeyPath:%@ context:%lu", (uint8_t *)&v20, 0x20u);
    }
  }
  v13 = [(NSMutableDictionary *)v12->_observers objectForKeyedSubscript:v11];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (!v14)
  {
    uint64_t v14 = objc_opt_new();
    if ([(GCRemoteUserDefaultsProxy *)v12 agentConnectionEstablished])
    {
      uint64_t v15 = [(GCRemoteUserDefaultsProxy *)v12 activeClient];
      [v15 observeKeyPath:v11];
    }
    if (gc_isInternalBuild())
    {
      id v19 = getGCLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v11;
        _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - begin observing key path %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  uint64_t v16 = [[GCObservation alloc] initWithObserver:v10 options:a5 context:a6];
  [v14 addObject:v16];
  [(NSMutableDictionary *)v12->_observers setObject:v14 forKeyedSubscript:v11];
  if (([(GCObservation *)v16 options] & 4) != 0) {
    [(GCRemoteUserDefaultsProxy *)v12 postInitialKVONotificationForObservation:v16 keyPath:v11];
  }
  if (gc_isInternalBuild())
  {
    int v18 = getGCLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[GCRemoteUserDefaultsProxy addObserver:forKeyPath:options:context:]();
    }
  }
  objc_sync_exit(v12);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  id v11 = [(NSMutableDictionary *)v10->_observers objectForKeyedSubscript:v9];
  v12 = (void *)[v11 mutableCopy];

  if (gc_isInternalBuild())
  {
    int v18 = getGCLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2048;
      v25 = a5;
      _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - removeObserver %@ forKeyPath %@ context %lu", (uint8_t *)&v20, 0x20u);
    }
  }
  if (v12)
  {
    v13 = [[GCObservation alloc] initWithObserver:v8 options:0 context:0];
    if ([v12 containsObject:v13])
    {
      [v12 removeObject:v13];
      uint64_t v14 = [v12 count];
      observers = v10->_observers;
      if (v14)
      {
        [(NSMutableDictionary *)observers setObject:v12 forKeyedSubscript:v9];
      }
      else
      {
        [(NSMutableDictionary *)observers removeObjectForKey:v9];
        if ([(GCRemoteUserDefaultsProxy *)v10 agentConnectionEstablished])
        {
          uint64_t v17 = [(GCRemoteUserDefaultsProxy *)v10 activeClient];
          [v17 stopObservingKeyPath:v9];
        }
        if (gc_isInternalBuild())
        {
          id v19 = getGCLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v20 = 138412290;
            id v21 = v9;
            _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - stop observing key path %@", (uint8_t *)&v20, 0xCu);
          }
        }
      }
      if (!gc_isInternalBuild()) {
        goto LABEL_16;
      }
      uint64_t v16 = getGCLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:]();
      }
    }
    else
    {
      if (!gc_isInternalBuild())
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v16 = getGCLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:]();
      }
    }

    goto LABEL_16;
  }
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v13 = (GCObservation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
      -[GCRemoteUserDefaultsProxy removeObserver:forKeyPath:context:]();
    }
    goto LABEL_16;
  }
LABEL_17:

  objc_sync_exit(v10);
}

- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(NSMutableDictionary *)v8->_observers objectForKeyedSubscript:v6];
  id v10 = v9;
  if (v9 && [v9 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "observer", (void)v17);
          objc_msgSend(v16, "observeValueForKeyPath:ofObject:change:context:", v6, v8, v7, objc_msgSend(v15, "context"));
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_12;
    }
    id v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[GCRemoteUserDefaultsProxy observeUserDefaultsValueForKeyPath:change:]();
    }
  }

LABEL_12:
  objc_sync_exit(v8);
}

- (void)userDefaultsCheckIn:(id)a3 effectiveUserIdentifier:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    if (v4)
    {
      id v7 = self;
      objc_sync_enter(v7);
      if (gc_isInternalBuild())
      {
        id v10 = getGCLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v13 = 67109378;
          LODWORD(v14[0]) = v4;
          WORD2(v14[0]) = 2112;
          *(void *)((char *)v14 + 6) = v6;
          _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "GCRemoteUserDefaultsProxy - agent connection fully established for user %d /w %@", (uint8_t *)&v13, 0x12u);
        }
      }
      clients = v7->_clients;
      id v9 = +[NSNumber numberWithUnsignedInt:v4];
      [(NSMutableDictionary *)clients setObject:v6 forKey:v9];

      if (gc_isInternalBuild())
      {
        id v11 = getGCLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = v7->_clients;
          int v13 = 138412290;
          v14[0] = v12;
          _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "Clients is now: %@", (uint8_t *)&v13, 0xCu);
        }
      }
      [(GCRemoteUserDefaultsProxy *)v7 refreshActiveClient];
      objc_sync_exit(v7);
    }
    else
    {
      if (!gc_isInternalBuild()) {
        goto LABEL_11;
      }
      getGCLogger();
      id v7 = (GCRemoteUserDefaultsProxy *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
        -[GCRemoteUserDefaultsProxy userDefaultsCheckIn:effectiveUserIdentifier:]();
      }
    }
  }
  else
  {
    if (!gc_isInternalBuild()) {
      goto LABEL_11;
    }
    getGCLogger();
    id v7 = (GCRemoteUserDefaultsProxy *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[GCRemoteUserDefaultsProxy userDefaultsCheckIn:effectiveUserIdentifier:]();
    }
  }

LABEL_11:
}

- (void)refreshActiveClient
{
}

- (GCUserDefaultsXPCProxyServiceRemoteClientInterface)activeClient
{
  return self->_activeClient;
}

- (void)setActiveClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClient, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)objectForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)objectForKey:.cold.2()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)objectForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-objectForKey: %@", v2, v3, v4, v5, v6);
}

void __42__GCRemoteUserDefaultsProxy_objectForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)stringForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)stringForKey:.cold.2()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)stringForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-stringForKey: %@", v2, v3, v4, v5, v6);
}

void __42__GCRemoteUserDefaultsProxy_stringForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)dataForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)dataForKey:.cold.2()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)dataForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-dataForKey: %@", v2, v3, v4, v5, v6);
}

void __40__GCRemoteUserDefaultsProxy_dataForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)dictionaryForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)dictionaryForKey:.cold.2()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)dictionaryForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-dictionaryForKey: %@", v2, v3, v4, v5, v6);
}

void __46__GCRemoteUserDefaultsProxy_dictionaryForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)arrayForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)arrayForKey:.cold.2()
{
  OUTLINED_FUNCTION_6_0(__stack_chk_guard);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)arrayForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-arrayForKey: %@", v2, v3, v4, v5, v6);
}

void __41__GCRemoteUserDefaultsProxy_arrayForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)BOOLForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)BOOLForKey:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "  %d", (uint8_t *)v3, 8u);
}

- (void)BOOLForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-BOOLForKey: %@", v2, v3, v4, v5, v6);
}

void __40__GCRemoteUserDefaultsProxy_BOOLForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)doubleForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)doubleForKey:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %f", v2, v3, v4, v5, v6);
}

- (void)doubleForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-doubleForKey: %@", v2, v3, v4, v5, v6);
}

void __42__GCRemoteUserDefaultsProxy_doubleForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)floatForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (double)floatForKey:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_24(&dword_220998000, a2, a3, "  %f", a5, a6, a7, a8, 0);
  return result;
}

- (void)floatForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-floatForKey: %@", v2, v3, v4, v5, v6);
}

void __41__GCRemoteUserDefaultsProxy_floatForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)integerForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_20(&dword_220998000, v0, v1, "  No client", v2, v3, v4, v5, v6);
}

- (void)integerForKey:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %ld", v2, v3, v4, v5, v6);
}

- (void)integerForKey:.cold.3()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "-integerForKey: %@", v2, v3, v4, v5, v6);
}

void __43__GCRemoteUserDefaultsProxy_integerForKey___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "  %@", v2, v3, v4, v5, v6);
}

- (void)addObserver:forKeyPath:options:context:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "GCRemoteUserDefaultsProxy - observers are now %@", v2, v3, v4, v5, v6);
}

- (void)removeObserver:forKeyPath:context:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_1(&dword_220998000, v0, v1, "GCRemoteUserDefaultsProxy - trying to remove an observer that doesn't exist.", v2, v3, v4, v5, v6);
}

- (void)removeObserver:forKeyPath:context:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_24(&dword_220998000, v0, v1, "GCRemoteUserDefaultsProxy - observers are now %@", v2, v3, v4, v5, v6);
}

- (void)removeObserver:forKeyPath:context:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_1(&dword_220998000, v0, v1, "GCRemoteUserDefaultsProxy - trying to remove an observer that doesn't exist!", v2, v3, v4, v5, v6);
}

- (void)observeUserDefaultsValueForKeyPath:change:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_1(&dword_220998000, v0, v1, "GCRemoteUserDefaultsProxy - observeUserDefaultsValueForKeyPath call for field we're not observing!", v2, v3, v4, v5, v6);
}

- (void)userDefaultsCheckIn:effectiveUserIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_1(&dword_220998000, v0, v1, "Received nil client in userDefaultsCheckIn!", v2, v3, v4, v5, v6);
}

- (void)userDefaultsCheckIn:effectiveUserIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4_1(&dword_220998000, v0, v1, "Received invalid user identifier in userDefaultsCheckIn!", v2, v3, v4, v5, v6);
}

@end