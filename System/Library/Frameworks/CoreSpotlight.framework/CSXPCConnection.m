@interface CSXPCConnection
+ (BOOL)copyBoolForKey:(const char *)a3 fromXPCDictionary:(id)a4;
+ (BOOL)dictionary:(id)a3 setSharedMemory:(void *)a4 forKey:(const char *)a5 size:(unint64_t)a6 forSizeKey:(const char *)a7;
+ (BOOL)journalEnabled;
+ (double)copyDoubleForKey:(const char *)a3 fromXPCDictionary:(id)a4;
+ (id)appIdentifierFromTeamAppTuple:(id)a3;
+ (id)constructArray:(id)a3;
+ (id)constructDictionary:(id)a3;
+ (id)copyNSArrayFromXPCArray:(id)a3;
+ (id)copyNSArrayFromXPCObject:(id)a3;
+ (id)copyNSDataForKey:(const char *)a3 fromXPCDictionary:(id)a4;
+ (id)copyNSDictionaryFromXPCObject:(id)a3;
+ (id)copyNSNumberArrayFromXPCArray:(id)a3;
+ (id)copyNSObject:(id)a3;
+ (id)copyNSString:(id)a3;
+ (id)copyNSStringArrayFromXPCArray:(id)a3;
+ (id)copyNSStringForKey:(const char *)a3 fromXPCDictionary:(id)a4;
+ (id)copyNSStringOrDictArrayFromXPCArray:(id)a3;
+ (id)copyNSStringSetFromXPCArray:(id)a3;
+ (id)copyPlistFromXPCObject:(id)a3;
+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5;
+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5 allowWritableSharedMemory:(BOOL)a6;
+ (id)processNameForPID:(int)a3;
+ (unint64_t)copyUInt64ForKey:(const char *)a3 fromXPCDictionary:(id)a4;
+ (void)array:(id)a3 setValue:(id)a4 atIndex:(int64_t)a5;
+ (void)dictionary:(id)a3 setArray:(id)a4 forKey:(const char *)a5;
+ (void)dictionary:(id)a3 setNumberArray:(id)a4 forKey:(const char *)a5;
+ (void)dictionary:(id)a3 setPlistBytes:(__MDPlistBytes *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6;
+ (void)dictionary:(id)a3 setPlistContainer:(_MDPlistContainer *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6;
+ (void)dictionary:(id)a3 setStringArray:(id)a4 forKey:(const char *)a5;
+ (void)dictionary:(id)a3 setStringOrDictionaryArray:(id)a4 forKey:(const char *)a5;
+ (void)dictionary:(id)a3 setValue:(id)a4 forKey:(const char *)a5;
+ (void)dictionary:(id)a3 setXPCFdArray:(id)a4 forKey:(const char *)a5;
+ (void)journalDictionary:(id)a3 toFolderPath:(const char *)a4 forPID:(int)a5 withLabel:(const char *)a6 andID:(unint64_t)a7;
+ (void)setJournalEnabled:(BOOL)a3;
- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3;
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)handleMessage:(id)a3 type:(_xpc_type_s *)a4 connection:(id)a5;
- (BOOL)listener;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (BOOL)machService;
- (BOOL)nonLaunching;
- (BOOL)previouslyInitialized;
- (BOOL)privateDaemon;
- (CSXPCConnection)initWithMachServiceName:(id)a3;
- (CSXPCConnection)initWithServiceName:(id)a3;
- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4;
- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4 uuid:(id)a5;
- (NSString)serviceName;
- (NSString)uuid;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (id)initListenerWithName:(id)a3;
- (id)initMachServiceListenerWithName:(id)a3;
- (id)initMachServiceListenerWithName:(id)a3 enableConnectionLogging:(BOOL)a4;
- (unsigned)user;
- (void)_lostClientConnection:(id)a3 error:(id)a4;
- (void)handleError:(id)a3;
- (void)resume;
- (void)sendMessageAsync:(id)a3;
- (void)sendMessageAsync:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setNonLaunching:(BOOL)a3;
- (void)setPreviouslyInitialized:(BOOL)a3;
- (void)setPrivateDaemon:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUser:(unsigned int)a3;
- (void)startListener;
- (void)suspend;
@end

@implementation CSXPCConnection

- (BOOL)previouslyInitialized
{
  return self->_previouslyInitialized;
}

+ (id)copyNSStringArrayFromXPCArray:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (size_t count = xpc_array_get_count(v3)) != 0)
  {
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __49__CSXPCConnection_copyNSStringArrayFromXPCArray___block_invoke;
    applier[3] = &unk_1E554C3A0;
    id v7 = v6;
    id v10 = v7;
    xpc_array_apply(v4, applier);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)copyNSStringForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  id result = (id)xpc_dictionary_get_string(a4, a3);
  if (result)
  {
    [NSString stringWithUTF8String:result];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

uint64_t __49__CSXPCConnection_copyNSStringArrayFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [NSString stringWithUTF8String:string_ptr];
    [v5 addObject:v6];
  }
  return 1;
}

+ (id)copyNSStringOrDictArrayFromXPCArray:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (size_t count = xpc_array_get_count(v4)) != 0)
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__CSXPCConnection_copyNSStringOrDictArrayFromXPCArray___block_invoke;
    v10[3] = &unk_1E554C3F0;
    id v8 = v7;
    id v11 = v8;
    id v12 = a1;
    xpc_array_apply(v5, v10);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)copyNSDataForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  size_t length = 0;
  id result = (id)xpc_dictionary_get_data(a4, a3, &length);
  if (result)
  {
    [MEMORY[0x1E4F1C9B8] dataWithBytes:result length:length];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (void)dictionary:(id)a3 setStringOrDictionaryArray:(id)a4 forKey:(const char *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    v19 = a5;
    v20 = v8;
    objc_opt_class();
    objc_opt_class();
    xpc_object_t empty = xpc_array_create_empty();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
          if (objc_opt_isKindOfClass())
          {
            v17 = (const char *)[v16 UTF8String];
            if (v17) {
              xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v17);
            }
          }
          else
          {
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              +[CSXPCConnection dictionary:setStringOrDictionaryArray:forKey:]();
            }
            v18 = [a1 constructDictionary:v16];
            xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v18);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    id v8 = v20;
    xpc_dictionary_set_value(v20, v19, empty);
  }
}

+ (void)dictionary:(id)a3 setStringArray:(id)a4 forKey:(const char *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    xpc_object_t v9 = xpc_array_create(0, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v18 + 1) + 8 * v14);
          v16 = (const char *)objc_msgSend(v15, "UTF8String", (void)v18);
          if (v16)
          {
            xpc_object_t v17 = xpc_string_create(v16);
            xpc_array_append_value(v9, v17);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a5, v9);
  }
}

+ (BOOL)journalEnabled
{
  if (gJournalEnabled) {
    return isAppleInternalInstall();
  }
  else {
    return 0;
  }
}

void __47__CSXPCConnection_sendMessageAsync_completion___block_invoke(uint64_t a1, void *a2)
{
  id xdict = a2;
  if (MEMORY[0x192F9A3C0]() == MEMORY[0x1E4F14590])
  {
    if (*(unsigned char *)(a1 + 48) && !xpc_dictionary_get_int64(xdict, "status")) {
      [*(id *)(a1 + 32) setPreviouslyInitialized:1];
    }
  }
  else
  {
    if (xdict == (id)MEMORY[0x1E4F14520])
    {
      id xdict = xpc_dictionary_create(0, 0, 0);

      id v4 = xdict;
      int64_t v5 = 4097;
    }
    else
    {
      if (xdict != (id)MEMORY[0x1E4F14528])
      {

        id v3 = 0;
        goto LABEL_12;
      }
      id xdict = xpc_dictionary_create(0, 0, 0);

      id v4 = xdict;
      int64_t v5 = 4099;
    }
    xpc_dictionary_set_int64(v4, "status", v5);
    xpc_dictionary_set_string(xdict, "ed", (const char *)[(id)*MEMORY[0x1E4F281F8] UTF8String]);
  }
  id v3 = xdict;
LABEL_12:
  id xdicta = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setPreviouslyInitialized:(BOOL)a3
{
  self->_previouslyInitialized = a3;
}

void __29__CSXPCConnection_connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __29__CSXPCConnection_connection__block_invoke_2_cold_1();
  }

  uint64_t v5 = MEMORY[0x192F9A3C0](v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (v5 == MEMORY[0x1E4F14590])
  {
    [WeakRetained handleReply:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setPreviouslyInitialized:0];
    [v7 handleError:v3];
  }
}

+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5 allowWritableSharedMemory:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = xpc_dictionary_get_value(v9, a3);
  if (v10)
  {
    uint64_t v11 = [CSDataWrapper alloc];
    uint64_t v12 = xpc_dictionary_get_value(v9, a3);
    data = [(CSDataWrapper *)v11 initWithXPCValue:v12 allowWritableSharedMemory:v6];

    if (a4)
    {
      if (data)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v9, a4);
        if (uint64) {
          [(CSDataWrapper *)data setDataSize:uint64];
        }
      }
    }
  }
  else
  {
    size_t length = 0;
    data = (CSDataWrapper *)xpc_dictionary_get_data(v9, a3, &length);
    if (data)
    {
      id v15 = [CSDataWrapper alloc];
      v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      data = [(CSDataWrapper *)v15 initWithData:v16];
    }
  }

  return data;
}

+ (id)dataWrapperForKey:(const char *)a3 sizeKey:(const char *)a4 fromXPCDictionary:(id)a5
{
  return +[CSXPCConnection dataWrapperForKey:a3 sizeKey:a4 fromXPCDictionary:a5 allowWritableSharedMemory:0];
}

void __29__CSXPCConnection_connection__block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), WeakRetained[5]);
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      BOOL v5 = *((unsigned char *)v4 + 8) == 0;
      id v6 = [v4 serviceName];
      id v7 = (const char *)[v6 UTF8String];
      id v8 = [v4 queue];
      if (v5) {
        xpc_connection_t mach_service = xpc_connection_create(v7, v8);
      }
      else {
        xpc_connection_t mach_service = xpc_connection_create_mach_service(v7, v8, 0);
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = mach_service;

      uint64_t v12 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v13 = [v4 queue];
      xpc_connection_set_target_queue(v12, v13);

      uint64_t v14 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __29__CSXPCConnection_connection__block_invoke_2;
      handler[3] = &unk_1E554C328;
      objc_copyWeak(&v17, v2);
      handler[4] = v4;
      xpc_connection_set_event_handler(v14, handler);
      if (*((unsigned char *)v4 + 8) && v4[3])
      {
        v18[0] = 0;
        v18[1] = 0;
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4[3]];
        [v15 getUUIDBytes:v18];

        xpc_connection_set_instance();
      }
      if (*((unsigned char *)v4 + 10)) {
        xpc_connection_set_non_launching();
      }
      objc_storeStrong(v4 + 5, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      xpc_connection_activate(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      objc_destroyWeak(&v17);
    }
  }
}

- (void)sendMessageAsync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = !self->_previouslyInitialized && xpc_dictionary_get_string(v6, "p") == 0;
  id v9 = [(CSXPCConnection *)self connection];
  uint64_t v10 = [(CSXPCConnection *)self queue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __47__CSXPCConnection_sendMessageAsync_completion___block_invoke;
  handler[3] = &unk_1E554C378;
  BOOL v14 = v8;
  handler[4] = self;
  id v13 = v7;
  id v11 = v7;
  xpc_connection_send_message_with_reply(v9, v6, v10, handler);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_object)connection
{
  if (self->_listener)
  {
    id v3 = self->_connection;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__8;
    id v13 = __Block_byref_object_dispose__8;
    id v14 = 0;
    id location = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__CSXPCConnection_connection__block_invoke;
    aBlock[3] = &unk_1E554C350;
    objc_copyWeak(&v7, &location);
    aBlock[4] = &v9;
    id v4 = (void (**)(void))_Block_copy(aBlock);
    if (dispatch_get_specific("csXPCConnectionQueue") == self) {
      v4[2](v4);
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_queue, v4);
    }
    id v3 = (OS_xpc_object *)(id)v10[5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v9, 8);
  }

  return v3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x192F9A3C0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 == MEMORY[0x1E4F14578])
  {
    id v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = WeakRetained[4];
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 1024;
      pid_t pid = xpc_connection_get_pid(v3);
      _os_log_impl(&dword_18D0E3000, v6, OS_LOG_TYPE_INFO, "new connection(%p) for service %@ pid: %d", buf, 0x1Cu);
    }

    if ([WeakRetained addClientConnectionIfAllowedForConnection:v3])
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, v3);
      BOOL v8 = [WeakRetained queue];
      xpc_connection_set_target_queue(v3, v8);

      id location = 0;
      objc_initWeak(&location, WeakRetained);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49;
      v9[3] = &unk_1E554C2D8;
      objc_copyWeak(&v10, &location);
      objc_copyWeak(&v11, (id *)buf);
      char v12 = *(unsigned char *)(a1 + 40);
      xpc_connection_set_event_handler(v3, v9);
      xpc_connection_resume(v3);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      xpc_connection_cancel(v3);
    }
  }
}

- (void)sendMessageAsync:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSXPCConnection *)self connection];
  xpc_connection_send_message(v5, v4);
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = (_xpc_connection_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_3(v5);
    }

    uint64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_2((uint64_t)v5, (uint64_t)v3, v7);
    }
  }
  [WeakRetained handleMessage:v3 type:MEMORY[0x192F9A3C0](v3) connection:v5];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_1((uint64_t)v5, v8);
    }
  }
}

- (BOOL)handleMessage:(id)a3 type:(_xpc_type_s *)a4 connection:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (_xpc_connection_s *)a5;
  if (a4 == (_xpc_type_s *)MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v8, "command");
    if (!string) {
      goto LABEL_20;
    }
    id v11 = string;
    char v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[CSXPCConnection handleMessage:type:connection:]((int)v11, v9);
    }

    BOOL v13 = [(CSXPCConnection *)self handleCommand:v11 info:v8 connection:v9];
    if (!v13 && !strncmp(v11, "test", 4uLL))
    {
      xpc_dictionary_get_remote_connection(v8);
      v27 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_object_t reply = xpc_dictionary_create_reply(v8);
      xpc_connection_send_message(v27, reply);
    }
    else if (!strncmp(v11, "checkin", 7uLL))
    {
      id v14 = [NSString stringWithUTF8String:v11];
      __int16 v15 = [v14 componentsSeparatedByString:@":"];

      uint64_t v16 = [v15 firstObject];
      int v17 = [v16 isEqualToString:@"checkin"];

      if (v17)
      {
        xpc_dictionary_get_remote_connection(v8);
        long long v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_object_t v19 = xpc_dictionary_create_reply(v8);
        long long v20 = v19;
        if (v18 && v19)
        {
          if ((unint64_t)[v15 count] >= 2)
          {
            id v21 = [v15 objectAtIndexedSubscript:1];
            xpc_dictionary_set_string(v20, "reply_string", (const char *)[v21 UTF8String]);
          }
          xpc_dictionary_set_int64(v20, "status", 0);
          xpc_connection_send_message(v18, v20);
        }

        BOOL v13 = 1;
      }

      if (!v13) {
        goto LABEL_20;
      }
    }
    else if (!v13)
    {
LABEL_20:
      xpc_dictionary_get_remote_connection(v8);
      long long v22 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_object_t v23 = xpc_dictionary_create_reply(v8);
      long long v24 = v23;
      if (v22 && v23)
      {
        xpc_dictionary_set_int64(v23, "status", -1);
        xpc_connection_send_message(v22, v24);
      }

      goto LABEL_24;
    }
    BOOL v25 = 1;
    goto LABEL_25;
  }
  if (a4 == (_xpc_type_s *)MEMORY[0x1E4F145A8]) {
    [(CSXPCConnection *)self _lostClientConnection:v9 error:v8];
  }
LABEL_24:
  BOOL v25 = 0;
LABEL_25:

  return v25;
}

- (void)setPrivateDaemon:(BOOL)a3
{
  self->_privateDaemon = a3;
}

- (CSXPCConnection)initWithMachServiceName:(id)a3
{
  return [(CSXPCConnection *)self initWithServiceName:a3 machService:1];
}

- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4
{
  return [(CSXPCConnection *)self initWithServiceName:a3 machService:a4 uuid:0];
}

- (CSXPCConnection)initWithServiceName:(id)a3 machService:(BOOL)a4 uuid:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CSXPCConnection;
  id v11 = [(CSXPCConnection *)&v21 init];
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v9;
      _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Start service name %@", buf, 0xCu);
    }
    *((unsigned char *)v11 + 8) = a4;
    objc_storeStrong((id *)v11 + 4, a3);
    objc_storeStrong((id *)v11 + 3, a5);
    id v12 = [v9 stringByAppendingString:@".workloop"];
    BOOL v13 = dispatch_workloop_create((const char *)[v12 UTF8String]);

    id v14 = [v9 stringByAppendingString:@".queue"];
    __int16 v15 = (const char *)[v14 UTF8String];
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2(v15, v17, v13);
    xpc_object_t v19 = (void *)*((void *)v11 + 6);
    *((void *)v11 + 6) = v18;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v11 + 6), "csXPCConnectionQueue", v11, 0);
  }

  return (CSXPCConnection *)v11;
}

- (void)setUser:(unsigned int)a3
{
  self->_user = a3;
}

- (void)setNonLaunching:(BOOL)a3
{
  if (a3)
  {
    self->_nonLaunching = 1;
    if (self->_connection) {
      xpc_connection_set_non_launching();
    }
  }
}

+ (void)dictionary:(id)a3 setPlistContainer:(_MDPlistContainer *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  id v8 = a3;
  id v9 = _MDPlistContainerCopyDispatchData();
  id v10 = v9;
  if (v9)
  {
    xpc_object_t v11 = xpc_data_create_with_dispatch_data(v9);
    if (v11)
    {
      xpc_dictionary_set_value(v8, a5, v11);
      if (a6) {
        xpc_dictionary_set_uint64(v8, a6, 0);
      }
    }
  }
}

+ (void)dictionary:(id)a3 setPlistBytes:(__MDPlistBytes *)a4 forKey:(const char *)a5 sizeKey:(const char *)a6
{
  id v8 = a3;
  id v9 = _MDPlistBytesCopyDispatchData();
  id v10 = v9;
  if (v9)
  {
    xpc_object_t v11 = xpc_data_create_with_dispatch_data(v9);
    if (v11)
    {
      xpc_dictionary_set_value(v8, a5, v11);
      if (a6) {
        xpc_dictionary_set_uint64(v8, a6, 0);
      }
    }
  }
}

- (void)startListener
{
}

- (CSXPCConnection)initWithServiceName:(id)a3
{
  return [(CSXPCConnection *)self initWithServiceName:a3 machService:0];
}

- (id)initListenerWithName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSXPCConnection *)self initWithServiceName:v4 machService:0];
  if (v5)
  {
    xpc_connection_t v6 = xpc_connection_create((const char *)[v4 UTF8String], (dispatch_queue_t)v5->_queue);
    connection = v5->_connection;
    v5->_connection = v6;
  }
  return v5;
}

- (id)initMachServiceListenerWithName:(id)a3
{
  return [(CSXPCConnection *)self initMachServiceListenerWithName:a3 enableConnectionLogging:1];
}

- (id)initMachServiceListenerWithName:(id)a3 enableConnectionLogging:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(CSXPCConnection *)self initWithServiceName:v6 machService:1];
  id v8 = v7;
  if (v7)
  {
    v7->_listener = 1;
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v6 UTF8String], (dispatch_queue_t)v7->_queue, 1uLL);
    connection = v8->_connection;
    v8->_connection = mach_service;

    if (v8->_connection)
    {
      id location = 0;
      objc_initWeak(&location, v8);
      xpc_object_t v11 = v8->_connection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke;
      handler[3] = &unk_1E554C300;
      objc_copyWeak(&v14, &location);
      BOOL v15 = a4;
      xpc_connection_set_event_handler(v11, handler);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  return 0;
}

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  id v4 = [a3 connection];
  LOBYTE(self) = [(CSXPCConnection *)self addClientConnectionIfAllowedForConnection:v4];

  return (char)self;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  return 1;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (_xpc_connection_s *)a3;
  id v6 = a4;
  if (v6 == (id)MEMORY[0x1E4F14520])
  {
    id v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      id v12 = v5;
      __int16 v13 = 1024;
      pid_t pid = xpc_connection_get_pid(v5);
      _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "### Connection(%p) interrupted pid: %d", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14528];
    id v8 = logForCSLogCategoryDefault();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6 == v7)
    {
      if (v9) {
        -[CSXPCConnection lostClientConnection:error:](v5, v8);
      }
    }
    else if (v9)
    {
      -[CSXPCConnection lostClientConnection:error:](v5, v6, v8);
    }
  }

  return 0;
}

- (void)_lostClientConnection:(id)a3 error:(id)a4
{
  connection = (_xpc_connection_s *)a3;
  if (!-[CSXPCConnection lostClientConnection:error:](self, "lostClientConnection:error:")) {
    xpc_connection_cancel(connection);
  }
}

- (void)handleError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  id v6 = (void *)MEMORY[0x1E4F14528];
  if (v4 == (id)MEMORY[0x1E4F14520] || v4 == (id)MEMORY[0x1E4F14528])
  {
    id v8 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F14530]);
      id v10 = [(CSXPCConnection *)self serviceName];
      int v12 = 134218498;
      __int16 v13 = self;
      __int16 v14 = 2080;
      uint64_t v15 = string;
      __int16 v16 = 2112;
      int v17 = v10;
      _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "### Connection error %p %s for %@", (uint8_t *)&v12, 0x20u);
    }
    if (v5 == v6)
    {
      connection = self->_connection;
      self->_connection = 0;
    }
  }
}

- (void)suspend
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = self->_connection;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      BOOL v5 = v3;
      _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "### suspending %@", (uint8_t *)&v4, 0xCu);
    }
    xpc_connection_suspend(v3);
    dispatch_suspend((dispatch_object_t)self->_queue);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      BOOL v5 = v3;
      _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "### suspended %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)resume
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = self->_connection;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      BOOL v5 = v3;
      _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "### resuming %@", (uint8_t *)&v4, 0xCu);
    }
    dispatch_resume((dispatch_object_t)self->_queue);
    xpc_connection_resume(v3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      BOOL v5 = v3;
      _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "### resumed %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (unint64_t)copyUInt64ForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_uint64(a4, a3);
}

+ (BOOL)copyBoolForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_BOOL(a4, a3);
}

+ (double)copyDoubleForKey:(const char *)a3 fromXPCDictionary:(id)a4
{
  return xpc_dictionary_get_double(a4, a3);
}

+ (id)copyNSArrayFromXPCArray:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (!v3 || !xpc_array_get_count(v3)) {
    goto LABEL_5;
  }
  BOOL v5 = plist_xpc_to_ns(v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)copyNSString:(id)a3
{
  id result = (id)xpc_string_get_string_ptr(a3);
  if (result)
  {
    [NSString stringWithUTF8String:result];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (id)copyNSObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x192F9A3C0]();
  if (v5 == MEMORY[0x1E4F145F0])
  {
    uint64_t v7 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v4)];
LABEL_10:
    uint64_t v6 = (void *)v7;
    goto LABEL_11;
  }
  if (v5 == MEMORY[0x1E4F14590])
  {
    uint64_t v7 = [a1 copyNSDictionaryFromXPCObject:v4];
    goto LABEL_10;
  }
  if (v5 == MEMORY[0x1E4F14568])
  {
    uint64_t v7 = [a1 copyNSArrayFromXPCObject:v4];
    goto LABEL_10;
  }
  if (v5 == MEMORY[0x1E4F145C0])
  {
    uint64_t v7 = [NSNumber numberWithLongLong:xpc_int64_get_value(v4)];
    goto LABEL_10;
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

+ (id)copyNSDictionaryFromXPCObject:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithCapacity:xpc_dictionary_get_count(v5)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CSXPCConnection_copyNSDictionaryFromXPCObject___block_invoke;
  v9[3] = &unk_1E554C3C8;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  xpc_dictionary_apply(v5, v9);

  return v7;
}

uint64_t __49__CSXPCConnection_copyNSDictionaryFromXPCObject___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend(*(id *)(a1 + 40), "copyNSObject:");
  if (v4)
  {
    id v5 = [NSString stringWithUTF8String:a2];
    if (v5) {
      [*(id *)(a1 + 32) setObject:v4 forKey:v5];
    }
  }
  return 1;
}

+ (id)copyNSArrayFromXPCObject:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithCapacity:xpc_array_get_count(v5)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CSXPCConnection_copyNSArrayFromXPCObject___block_invoke;
  v9[3] = &unk_1E554C3F0;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  xpc_array_apply(v5, v9);

  return v7;
}

uint64_t __44__CSXPCConnection_copyNSArrayFromXPCObject___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 40), "copyNSObject:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return 1;
}

uint64_t __55__CSXPCConnection_copyNSStringOrDictArrayFromXPCArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x192F9A3C0]();
  if (v5 == MEMORY[0x1E4F145F0])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (string_ptr)
    {
      BOOL v9 = *(void **)(a1 + 32);
      uint64_t v6 = [NSString stringWithUTF8String:string_ptr];
      id v7 = v9;
      goto LABEL_7;
    }
  }
  else if (v5 == MEMORY[0x1E4F14590])
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 40) copyNSDictionaryFromXPCObject:v4];
    if (!v6)
    {
LABEL_8:

      goto LABEL_9;
    }
    id v7 = *(void **)(a1 + 32);
LABEL_7:
    [v7 addObject:v6];
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

+ (id)copyNSNumberArrayFromXPCArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (size_t count = xpc_array_get_count(v3)) != 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __49__CSXPCConnection_copyNSNumberArrayFromXPCArray___block_invoke;
    applier[3] = &unk_1E554C3A0;
    id v7 = v6;
    id v10 = v7;
    xpc_array_apply(v4, applier);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __49__CSXPCConnection_copyNSNumberArrayFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xdouble)
{
  double value = xpc_double_get_value(xdouble);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithDouble:value];
  [v5 addObject:v6];

  return 1;
}

+ (id)copyNSStringSetFromXPCArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && xpc_array_get_count(v3))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __47__CSXPCConnection_copyNSStringSetFromXPCArray___block_invoke;
    applier[3] = &unk_1E554C3A0;
    id v10 = v5;
    id v6 = v5;
    xpc_array_apply(v4, applier);
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __47__CSXPCConnection_copyNSStringSetFromXPCArray___block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (string_ptr)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [NSString stringWithUTF8String:string_ptr];
    [v5 addObject:v6];
  }
  return 1;
}

+ (void)dictionary:(id)a3 setArray:(id)a4 forKey:(const char *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    key = (char *)a5;
    xpc_object_t v9 = xpc_array_create(0, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(*((void *)&v18 + 1) + 8 * v14) requiringSecureCoding:1 error:0];
          xpc_object_t v16 = xpc_data_create((const void *)[v15 bytes], objc_msgSend(v15, "length"));
          xpc_array_append_value(v9, v16);

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, key, v9);
  }
}

+ (void)dictionary:(id)a3 setXPCFdArray:(id)a4 forKey:(const char *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    xpc_object_t v9 = xpc_array_create(0, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          xpc_array_append_value(v9, *(xpc_object_t *)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a5, v9);
  }
}

+ (void)dictionary:(id)a3 setValue:(id)a4 forKey:(const char *)a5
{
  xpc_object_t xdict = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_dictionary_set_int64(xdict, a5, [v8 integerValue]);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = [a1 constructDictionary:v8];
LABEL_7:
    id v10 = v9;
    xpc_dictionary_set_value(xdict, a5, v9);

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = [a1 constructArray:v8];
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[CSXPCConnection dictionary:setValue:forKey:]();
  }
  xpc_dictionary_set_string(xdict, a5, (const char *)[v8 UTF8String]);
LABEL_10:
}

+ (void)array:(id)a3 setValue:(id)a4 atIndex:(int64_t)a5
{
  xpc_object_t xarray = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_array_set_int64(xarray, a5, [v8 integerValue]);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = [a1 constructDictionary:v8];
LABEL_7:
    id v10 = v9;
    xpc_array_set_value(xarray, a5, v9);

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    xpc_object_t v9 = [a1 constructArray:v8];
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[CSXPCConnection array:setValue:atIndex:]();
  }
  xpc_array_set_string(xarray, a5, (const char *)[v8 UTF8String]);
LABEL_10:
}

+ (id)constructArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(a1, "array:setValue:atIndex:", empty, *(void *)(*((void *)&v12 + 1) + 8 * i), -1, (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return empty;
}

+ (id)constructDictionary:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__CSXPCConnection_constructDictionary___block_invoke;
  v8[3] = &unk_1E554C418;
  id v10 = a1;
  id v6 = empty;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

void __39__CSXPCConnection_constructDictionary___block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "dictionary:setValue:forKey:", *(void *)(a1 + 32), v6, objc_msgSend(v5, "UTF8String"));
}

+ (void)dictionary:(id)a3 setNumberArray:(id)a4 forKey:(const char *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 count])
  {
    xpc_object_t v9 = xpc_array_create(0, 0);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "doubleValue", (void)v17);
          xpc_object_t v16 = xpc_double_create(v15);
          xpc_array_append_value(v9, v16);

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    xpc_dictionary_set_value(v7, a5, v9);
  }
}

+ (BOOL)dictionary:(id)a3 setSharedMemory:(void *)a4 forKey:(const char *)a5 size:(unint64_t)a6 forSizeKey:(const char *)a7
{
  id v11 = a3;
  if (a4) {
    BOOL v12 = a6 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = !v12;
  if (!v12)
  {
    xpc_object_t v14 = xpc_shmem_create(a4, a6);
    if (v14)
    {
      xpc_dictionary_set_value(v11, a5, v14);
      xpc_dictionary_set_uint64(v11, a7, a6);
    }
    else
    {
      xpc_dictionary_set_data(v11, a5, a4, a6);
    }
  }
  return v13;
}

+ (id)appIdentifierFromTeamAppTuple:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0xC
    && [v3 characterAtIndex:10] == 46)
  {
    uint64_t v4 = 0;
    while (1)
    {
      int v5 = [v3 characterAtIndex:v4];
      if ((v5 - 48) > 0x2A || (v5 - 65) >= 0xFFFFFFF9) {
        break;
      }
      if (++v4 == 10)
      {
        id v7 = [v3 substringFromIndex:11];
        goto LABEL_11;
      }
    }
  }
  id v7 = 0;
LABEL_11:

  return v7;
}

+ (id)processNameForPID:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    *(void *)xpc_object_t v9 = 0xE00000001;
    int v10 = 1;
    int v11 = a3;
    bzero(v7, 0x288uLL);
    size_t v6 = 648;
    if (sysctl(v9, 4u, v7, &v6, 0, 0) == -1 || !v6) {
      objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
    }
    else {
      objc_msgSend(NSString, "stringWithFormat:", @"%s", v8);
    }
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = &stru_1EDBB3A50;
  }

  return v4;
}

+ (void)setJournalEnabled:(BOOL)a3
{
  if (isAppleInternalInstall()) {
    gJournalEnabled = a3;
  }
}

+ (id)copyPlistFromXPCObject:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)journalDictionary:(id)a3 toFolderPath:(const char *)a4 forPID:(int)a5 withLabel:(const char *)a6 andID:(unint64_t)a7
{
  id v15 = a3;
  if (+[CSXPCConnection journalEnabled])
  {
    uint64_t v11 = getpid();
    if (a5) {
      uint64_t v12 = a5;
    }
    else {
      uint64_t v12 = v11;
    }
    BOOL v13 = +[CSXPCConnection processNameForPID:v12];
    xpc_object_t v14 = [NSString stringWithFormat:@"%s/%s_%u_%@_%lld.plist", a4, a6, v11, v13, a7];
    [v15 writeToFile:v14 atomically:1];
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (BOOL)machService
{
  return self->_machService;
}

- (void)setConnection:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (BOOL)listener
{
  return self->_listener;
}

- (BOOL)nonLaunching
{
  return self->_nonLaunching;
}

- (BOOL)privateDaemon
{
  return self->_privateDaemon;
}

- (unsigned)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "exit connection: %p", (uint8_t *)&v2, 0xCu);
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18D0E3000, log, OS_LOG_TYPE_DEBUG, "enter connection: %p message: %p", (uint8_t *)&v3, 0x16u);
}

void __75__CSXPCConnection_initMachServiceListenerWithName_enableConnectionLogging___block_invoke_49_cold_3(_xpc_connection_s *a1)
{
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

- (void)handleMessage:(int)a1 type:(xpc_connection_t)connection connection:.cold.1(int a1, xpc_connection_t connection)
{
  xpc_connection_get_pid(connection);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)lostClientConnection:(_xpc_connection_s *)a1 error:(NSObject *)a2 .cold.1(_xpc_connection_s *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  xpc_connection_get_pid(a1);
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_ERROR, "### Connection(%p) invalid  pid: %d", v3, 0x12u);
}

- (void)lostClientConnection:(NSObject *)a3 error:.cold.2(_xpc_connection_s *a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
  xpc_connection_get_pid(a1);
  int v5 = 134218498;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_1_5();
  _os_log_error_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_ERROR, "### Connection(%p) error %s pid: %d", (uint8_t *)&v5, 0x1Cu);
}

void __29__CSXPCConnection_connection__block_invoke_2_cold_1()
{
  qos_class_self();
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

+ (void)dictionary:setValue:forKey:.cold.1()
{
}

+ (void)array:setValue:atIndex:.cold.1()
{
}

+ (void)dictionary:setStringOrDictionaryArray:forKey:.cold.1()
{
}

@end