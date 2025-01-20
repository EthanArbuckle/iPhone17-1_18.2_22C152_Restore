@interface NSXPCStoreConnection
- (id)initForStore:(id)a3;
- (id)sendMessage:(void *)a3 store:(void *)a4 error:;
- (void)createConnectionWithOptions:(uint64_t)a1;
- (void)dealloc;
- (void)disconnect;
- (void)performAndWait:(uint64_t)a1;
- (void)reconnect;
- (void)sendMessageWithContext:(void *)a1;
@end

@implementation NSXPCStoreConnection

- (void)sendMessageWithContext:(void *)a1
{
  if (a1)
  {
    id newValue = 0;
    if (a2)
    {
      id v3 = -[NSXPCStoreConnection sendMessage:store:error:](a1, *(void *)(a2 + 16), *(void **)(a2 + 8), &newValue);
      objc_setProperty_nonatomic((id)a2, v4, v3, 24);
      objc_setProperty_nonatomic((id)a2, v5, newValue, 32);
    }
    else
    {
      -[NSXPCStoreConnection sendMessage:store:error:](a1, 0, 0, &newValue);
    }
  }
}

- (id)sendMessage:(void *)a3 store:(void *)a4 error:
{
  id v4 = a1;
  if (a1)
  {
    if (a1[3])
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3052000000;
      v38 = __Block_byref_object_copy__2;
      v39 = __Block_byref_object_dispose__2;
      uint64_t v40 = 0;
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3052000000;
      v32 = __Block_byref_object_copy__2;
      v33 = __Block_byref_object_dispose__2;
      uint64_t v34 = 0;
      uint64_t v8 = [a3 URL];
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke;
      v24[3] = &unk_1E544B8E0;
      v24[8] = &v35;
      v24[9] = &v29;
      v24[4] = v4;
      v24[5] = v8;
      v24[6] = a2;
      v24[7] = a3;
      v24[10] = &v25;
      -[NSXPCStoreConnection performAndWait:]((uint64_t)v4, (uint64_t)v24);
      if (*((unsigned char *)v26 + 24))
      {
        if (+[NSXPCStore debugDefault] >= 1) {
          _NSCoreDataLog(8, @"Returning reply dict %@", v9, v10, v11, v12, v13, v14, v36[5]);
        }
      }
      else
      {
        if (a4)
        {
          v15 = (void *)v30[5];
          if (v15)
          {
            *a4 = v15;
            v30[5] = 0;
          }
        }
        if (+[NSXPCStore debugDefault] >= 1) {
          _NSCoreDataLog(8, @"Failed send (no reply dict).", v16, v17, v18, v19, v20, v21, v23);
        }
      }

      if (*((unsigned char *)v26 + 24)) {
        id v4 = (id)v36[5];
      }
      else {
        id v4 = 0;
      }
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);
    }
    else
    {
      id v4 = 0;
      if (a4) {
        *a4 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 134070, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Connection is nil", @"Reason"));
      }
    }
  }
  return v4;
}

- (void)reconnect
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __33__NSXPCStoreConnection_reconnect__block_invoke;
    v1[3] = &unk_1E544B868;
    v1[4] = a1;
    -[NSXPCStoreConnection performAndWait:](a1, (uint64_t)v1);
  }
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2(uint64_t *a1, void *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
  _NSCoreDataLog(1, @"XPC: synchronousRemoteObjectProxyWithErrorHandler: store '%@' encountered error: %@", v3, v4, v5, v6, v7, v8, a1[4]);
}

- (id)initForStore:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NSXPCStoreConnection;
  uint64_t v4 = [(NSXPCStoreConnection *)&v14 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_store = (NSXPCStore *)a3;
    v4->_connection = (NSXPCConnection *)-[NSXPCStoreConnection createConnectionWithOptions:]((uint64_t)v4, (void *)[a3 options]);
    if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isFileURL")
      && (uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "URL"), "path")) != 0)
    {
      uint64_t v7 = (__CFString *)[v6 lastPathComponent];
    }
    else
    {
      uint64_t v7 = @"nil";
    }
    uint64_t v8 = (void *)[NSString stringWithFormat:@"NSXPCStoreConnection %p for %@", v5, v7];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v10 = [a3 _persistentStoreCoordinator];
    if (v10)
    {
      unsigned int v11 = *(unsigned __int16 *)(v10 + 24);
      if ((v11 >> 2)) {
        uint64_t v9 = dispatch_queue_attr_make_with_qos_class(v9, (dispatch_qos_class_t)(v11 >> 2), 0);
      }
    }
    uint64_t v12 = dispatch_queue_create((const char *)[v8 UTF8String], v9);
    v5->_queue = (OS_dispatch_queue *)v12;
    dispatch_set_context(v12, v5);
    if (v9) {
      dispatch_release(v9);
    }
  }
  return v5;
}

- (void)createConnectionWithOptions:(uint64_t)a1
{
  v80[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [a2 valueForKey:@"serviceName"];
  if (v4 || (uint64_t v4 = [a2 valueForKey:@"NSXPCStoreServiceName"]) != 0)
  {
    uint64_t v5 = (void *)[a2 valueForKey:@"agentOrDaemon"];
    if (!v5) {
      uint64_t v5 = (void *)[a2 valueForKey:@"NSXPCStoreDaemonize"];
    }
    char v6 = [v5 BOOLValue];
    id v7 = objc_alloc(MEMORY[0x1E4F29268]);
    if (v6)
    {
      uint64_t v8 = (void *)[v7 initWithMachServiceName:v4 options:2];
      if (!v8)
      {
        uint64_t v9 = [NSString stringWithUTF8String:"Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil"];
        _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, v4);
        uint64_t v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          uint64_t v23 = "CoreData: Unable to create mach service NSXPCConnection -initWithMachServiceName:%@ returned nil";
LABEL_14:
          v33 = v16;
          uint32_t v34 = 12;
LABEL_15:
          _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, v23, (uint8_t *)&valueCallBacks, v34);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v8 = (void *)[v7 initWithServiceName:v4];
      if (!v8)
      {
        uint64_t v26 = [NSString stringWithUTF8String:"Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil"];
        _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, v4);
        uint64_t v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          LODWORD(valueCallBacks.version) = 138412290;
          *(CFIndex *)((char *)&valueCallBacks.version + 4) = v4;
          uint64_t v23 = "CoreData: Unable to create service NSXPCConnection -initWithServiceName:%@ returned nil";
          goto LABEL_14;
        }
LABEL_31:
        _NSCoreDataLog(1, @"Failed to create NSXPCConnection", v17, v18, v19, v20, v21, v22, v75);
        return 0;
      }
    }
  }
  else
  {
    uint64_t v35 = [a2 valueForKey:@"NSXPCStoreServerEndpointFactory"];
    if (!v35)
    {
      uint64_t v44 = [NSString stringWithUTF8String:"Unable to create NSXPCConnection; no service name or endpoint factory."];
      _NSCoreDataLog(17, v44, v45, v46, v47, v48, v49, v50, v74);
      uint64_t v51 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_31;
      }
      LOWORD(valueCallBacks.version) = 0;
      uint64_t v23 = "CoreData: Unable to create NSXPCConnection; no service name or endpoint factory.";
      v33 = v51;
      uint32_t v34 = 2;
      goto LABEL_15;
    }
    v36 = (void *)v35;
    id v77 = 0;
    if (objc_opt_respondsToSelector()) {
      uint64_t v37 = [v36 newEndpointWithError:&v77];
    }
    else {
      uint64_t v37 = [v36 newEndpoint];
    }
    v52 = (void *)v37;
    if (!v37)
    {
      if (v77)
      {
        _NSCoreDataLog(1, @"Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpointWithError returned error %@", v38, v39, v40, v41, v42, v43, (uint64_t)v36);
        uint64_t v70 = *MEMORY[0x1E4F28490];
        uint64_t v71 = [v77 code];
        uint64_t v72 = [NSString stringWithFormat:@"NSXPCStoreServerEndpointFactory failed to provide an endpoint"];
        uint64_t v79 = *MEMORY[0x1E4F28A50];
        v80[0] = v77;
        id v73 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v70, v71, v72, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1]);
        -[_NSCoreDataException _setDomain:]((uint64_t)v73, (void *)[v77 domain]);
        objc_exception_throw(v73);
      }
      uint64_t v54 = [NSString stringWithUTF8String:"Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpoint returned nil"];
      _NSCoreDataLog(17, v54, v55, v56, v57, v58, v59, v60, (uint64_t)v36);
      uint64_t v16 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_31;
      }
      LODWORD(valueCallBacks.version) = 134217984;
      *(CFIndex *)((char *)&valueCallBacks.version + 4) = (CFIndex)v36;
      uint64_t v23 = "CoreData: Unable to create token NSXPCConnection.  NSXPCStoreServerEndpointFactory %p -newEndpoint returned nil";
      goto LABEL_14;
    }
    uint64_t v53 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v37];
    if (!v53)
    {
      uint64_t v61 = [NSString stringWithUTF8String:"Unable to create token NSXPCConnection -initWithListenerEndpoint:%p returned nil"];
      _NSCoreDataLog(17, v61, v62, v63, v64, v65, v66, v67, (uint64_t)v52);
      v68 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LODWORD(valueCallBacks.version) = 134217984;
        *(CFIndex *)((char *)&valueCallBacks.version + 4) = (CFIndex)v52;
        _os_log_fault_impl(&dword_18AB82000, v68, OS_LOG_TYPE_FAULT, "CoreData: Unable to create token NSXPCConnection -initWithListenerEndpoint:%p returned nil", (uint8_t *)&valueCallBacks, 0xCu);
      }

      goto LABEL_31;
    }
    uint64_t v8 = (void *)v53;
  }
  [v8 setInterruptionHandler:&__block_literal_global_1];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke_2;
  v76[3] = &unk_1E544B868;
  v76[4] = a1;
  [v8 setInvalidationHandler:v76];
  v24 = (const void *)[*(id *)(a1 + 16) _persistentStoreCoordinator];
  memset(&valueCallBacks, 0, 24);
  *(_OWORD *)&valueCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E4F1D540] + 24);
  uint64_t v25 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], &valueCallBacks);
  CFDictionarySetValue(v25, @"PSCKey", v24);
  [*(id *)(a1 + 24) setUserInfo:v25];
  CFRelease(v25);
  objc_msgSend(v8, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1ED7EC5A8));
  [v8 resume];
  return v8;
}

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (+[NSXPCStore debugDefault] >= 1)
  {
    _NSCoreDataLog(8, @"Connection interrupted.", v9, v10, v11, v12, v13, v14, a9);
  }
}

void __52__NSXPCStoreConnection_createConnectionWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  +[_NSXPCStoreUtilities logMessage:forComponent:]((uint64_t)_NSXPCStoreUtilities, @"XPC connection was invalidated", *(void *)(*(void *)(a1 + 32) + 16), a4, a5, a6, a7, a8, vars0);
  if (+[NSXPCStore debugDefault] >= 1)
  {
    _NSCoreDataLog(8, @"Connection invalidated.", v9, v10, v11, v12, v13, v14, a9);
  }
}

void *__33__NSXPCStoreConnection_reconnect__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 24))
  {
    v2 = result;
    result = *(void **)(v1 + 16);
    if (result)
    {
      result = -[NSXPCStoreConnection createConnectionWithOptions:](v1, (void *)[result options]);
      *(void *)(v2[4] + 24) = result;
    }
  }
  return result;
}

- (void)performAndWait:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000;
    uint64_t v11 = __Block_byref_object_copy__2;
    uint64_t v12 = __Block_byref_object_dispose__2;
    uint64_t v13 = 0;
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v4 = *(NSObject **)(a1 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__NSXPCStoreConnection_performAndWait___block_invoke;
    v7[3] = &unk_1E544B908;
    v7[4] = a2;
    v7[5] = &v8;
    dispatch_sync(v4, v7);
    uint64_t v5 = (void *)v9[5];
    if (v5)
    {
      id v6 = v5;
      objc_exception_throw((id)v9[5]);
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (void)disconnect
{
  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      [v2 setInvalidationHandler:0];
      [*(id *)(a1 + 24) setInterruptionHandler:0];
      [*(id *)(a1 + 24) setUserInfo:0];
      [*(id *)(a1 + 24) invalidate];

      *(void *)(a1 + 24) = 0;
    }
  }
}

- (void)dealloc
{
  self->_store = 0;
  if (self->_connection)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__NSXPCStoreConnection_dealloc__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = self;
    current_queue = dispatch_get_current_queue();
    if (dispatch_get_context(current_queue) == self) {
      -[NSXPCStoreConnection disconnect]((uint64_t)self);
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_queue, block);
    }
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStoreConnection;
  [(NSXPCStoreConnection *)&v5 dealloc];
}

void __31__NSXPCStoreConnection_dealloc__block_invoke(uint64_t a1)
{
}

uint64_t __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_2;
  v10[3] = &unk_1E544B890;
  long long v11 = *(_OWORD *)(a1 + 64);
  v10[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_3;
  v9[3] = &unk_1E544B8B8;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 80);
  v9[6] = *(void *)(a1 + 64);
  v9[7] = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  v9[4] = v5;
  v9[5] = v7;
  return [v3 handleRequest:v4 reply:v9];
}

void __48__NSXPCStoreConnection_sendMessage_store_error___block_invoke_3(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v6 = +[_NSXPCStoreUtilities classesForErrorArchive]();
    uint64_t v3 = +[_NSXPCStoreUtilities decodeSecureArchivedData:usingDelegate:classes:]((uint64_t)_NSXPCStoreUtilities, v3, a1[4], v6);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (!a2) {
    a2 = [MEMORY[0x1E4F1CA98] null];
  }
  *(void *)(*(void *)(a1[6] + 8) + 40) = objc_msgSend(v7, "initWithObjectsAndKeys:", a2, @"reply", v3, @"error", 0);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  if (+[NSXPCStore debugDefault] >= 1) {
    _NSCoreDataLog(8, @"Created reply dict: %@", v8, v9, v10, v11, v12, v13, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
}

uint64_t __39__NSXPCStoreConnection_performAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end