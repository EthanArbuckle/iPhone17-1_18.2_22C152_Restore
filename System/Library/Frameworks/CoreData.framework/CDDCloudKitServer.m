@interface CDDCloudKitServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDDCloudKitServer)initWithListener:(id)a3 configuration:(id)a4;
- (CDDCloudKitServerConfiguration)configuration;
- (CKScheduler)scheduler;
- (NSXPCListener)listener;
- (PFCloudKitContainerProvider)containerProvider;
- (uint64_t)createRealPathForPath:(void *)a3 error:;
- (void)dealloc;
- (void)finishedActivity:(id)a3 withResult:(id)a4 inManagedObjectContext:(id)a5;
- (void)handleMessage:(id)a3 reply:(id)a4;
- (void)runActivity:(uint64_t)a3 completionHandler:;
- (void)setUp;
- (void)tearDown;
@end

@implementation CDDCloudKitServer

- (CDDCloudKitServer)initWithListener:(id)a3 configuration:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CDDCloudKitServer;
  v6 = [(CDDCloudKitServer *)&v12 init];
  if (v6)
  {
    v6->_configuration = (CDDCloudKitServerConfiguration *)[a4 copy];
    if (a3)
    {
      v7 = (NSXPCListener *)a3;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29290]);
      configuration = v6->_configuration;
      if (configuration) {
        machServiceName = configuration->_machServiceName;
      }
      else {
        machServiceName = 0;
      }
      v7 = (NSXPCListener *)[v8 initWithMachServiceName:machServiceName];
    }
    v6->_listener = v7;
    [(NSXPCListener *)v7 setDelegate:v6];
    v6->_initialized = 0;
    v6->_initializationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6->_containerProvider = objc_alloc_init(PFCloudKitContainerProvider);
    v6->_scheduler = (CKScheduler *)(id)[(Class)getCloudKitCKSchedulerClass[0]() sharedScheduler];
  }
  return v6;
}

- (void)dealloc
{
  [(CDDCloudKitServer *)self tearDown];

  dispatch_release((dispatch_object_t)self->_initializationGroup);
  self->_lastInitializationError = 0;

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitServer;
  [(CDDCloudKitServer *)&v3 dealloc];
}

- (void)setUp
{
  dispatch_group_enter((dispatch_group_t)self->_initializationGroup);
  global_queue = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CDDCloudKitServer_setUp__block_invoke;
  block[3] = &unk_1E544B868;
  block[4] = self;
  dispatch_async(global_queue, block);
  [(NSXPCListener *)self->_listener resume];
}

void __26__CDDCloudKitServer_setUp__block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18C127630]();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    *(unsigned char *)(v3 + 8) = 0;

    *(void *)(v3 + 48) = 0;
    id v4 = +[CDDCloudKitMetadataModel newMetadataModel];
    *(void *)(v3 + 32) = [[NSPersistentContainer alloc] initWithName:@"CDDCloudKitServer" managedObjectModel:v4];
    uint64_t v5 = *(void *)(v3 + 24);
    if (v5) {
      uint64_t v6 = *(void *)(v5 + 8);
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    id v8 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "persistentStoreDescriptions"), "lastObject");
    objc_msgSend(v8, "setURL:", objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", @"cdck.sqlite", 0));

    id v30 = 0;
    self;
    if (+[NSCloudKitMirroringDelegate checkAndCreateDirectoryAtURL:v7 wipeIfExists:0 error:&v30])
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 1;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v16 = *(void **)(v3 + 32);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __32__CDDCloudKitServer__setUpAsync__block_invoke;
      v25[3] = &unk_1E544D570;
      v25[5] = v8;
      v25[6] = &v26;
      v25[4] = v15;
      [v16 loadPersistentStoresWithCompletionHandler:v25];
      if (*((unsigned char *)v27 + 24))
      {
        *(unsigned char *)(v3 + 8) = 1;
      }
      else
      {
        _NSCoreDataLog(1, @"Failed to load persistent stores for CloudKit integration: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v15);
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F28588];
        v32[0] = [NSString stringWithFormat:@"Failed to initialize storage:\n%@", objc_msgSend(v15, "description")];
        uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
        *(void *)(v3 + 48) = [v23 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v24];
      }

      _Block_object_dispose(&v26, 8);
    }
    else
    {
      _NSCoreDataLog(1, @"Failed to create directory for persistent storage: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v30);
      *(void *)(v3 + 48) = v30;
    }
    dispatch_group_leave(*(dispatch_group_t *)(v3 + 40));
  }
}

- (void)tearDown
{
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;

  [(NSXPCListener *)listener setDelegate:0];
}

uint64_t __32__CDDCloudKitServer__setUpAsync__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 0;
    id v4 = *(void **)(result + 32);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "URL"), "path");
    return [v4 setObject:a3 forKey:v5];
  }
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  listener = self->_listener;
  if (listener == a3)
  {
    [a4 setExportedObject:self];
    objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1ED7FA9F0));
    [a4 resume];
  }
  else
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Called to accept connection for unknown listener: %@", a4];
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a3;
      _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Called to accept connection for unknown listener: %@", buf, 0xCu);
    }
  }
  return listener == a3;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  initializationGroup = self->_initializationGroup;
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  intptr_t v9 = dispatch_group_wait(initializationGroup, v8);
  uint64_t v10 = (void *)MEMORY[0x18C127630]();
  if (v9)
  {
    uint64_t v11 = [CDDCloudKitResponse alloc];
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v101 = *MEMORY[0x1E4F28588];
    v102 = @"The server was unable to process the request because it timed out waiting for initialization.";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v11, a3, 0, (void *)[v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v13]);
LABEL_3:
    id v15 = v14;
    goto LABEL_4;
  }
  if (!self->_initialized)
  {
    v39 = [CDDCloudKitResponse alloc];
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v103 = *MEMORY[0x1E4F28588];
    v41 = NSString;
    v90 = (NSString *)[(NSError *)self->_lastInitializationError description];
    uint64_t v104 = [v41 stringWithFormat:@"The server is not initialized due to: %@"];
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v39, a3, 0, (void *)[v40 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v42]);
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3)
    {
      v16 = (void *)*((void *)a3 + 3);
      id v17 = (void *)*((void *)a3 + 4);
    }
    else
    {
      v16 = 0;
      id v17 = 0;
    }
    if ((int)[v16 fileDescriptor] < 1)
    {
      v60 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v111 = *MEMORY[0x1E4F28588];
      v112 = @"Provided file handle is invalid, it doesn't point to the requested store.";
      uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      uint64_t v22 = [v60 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v61];
      goto LABEL_44;
    }
    memset(&v119, 0, sizeof(v119));
    uint64_t v18 = (NSString *)stat((const char *)[v17 fileSystemRepresentation], &v119);
    if (v18)
    {
      __error();
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *__error();
      uint64_t v113 = *MEMORY[0x1E4F28588];
      v90 = v18;
      uint64_t v114 = [NSString stringWithFormat:@"Failed to stat file at url (%d:%d): %@"];
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      uint64_t v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:v20 userInfo:v21];
      goto LABEL_44;
    }
    memset(&v100, 0, sizeof(v100));
    v62 = (NSString *)fstat([v16 fileDescriptor], &v100);
    if (v62)
    {
      __error();
      v63 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *__error();
      uint64_t v115 = *MEMORY[0x1E4F28588];
      v65 = NSString;
      [v16 fileDescriptor];
      v90 = v62;
      uint64_t v116 = [v65 stringWithFormat:@"Failed to fstat file descriptor (%d:%d): %d"];
      uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      uint64_t v22 = [v63 errorWithDomain:*MEMORY[0x1E4F28798] code:v64 userInfo:v66];
      goto LABEL_44;
    }
    if (v119.st_ino != v100.st_ino || v119.st_dev != v100.st_dev)
    {
      v75 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v117 = *MEMORY[0x1E4F28588];
      v118 = @"Provided file handle is invalid, it doesn't point to the requested store.";
      uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      uint64_t v22 = [v75 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v76];
LABEL_44:
      v77 = (void *)v22;
      if (!v22)
      {
        uint64_t v78 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v78, v79, v80, v81, v82, v83, v84, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m");
        v85 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          v119.st_dev = 136315394;
          *(void *)&v119.st_mode = "/Library/Caches/com.apple.xbs/Sources/Persistence/coredatad/CloudKit/CDDCloudKitServer.m";
          WORD2(v119.st_ino) = 1024;
          *(_DWORD *)((char *)&v119.st_ino + 6) = 668;
          _os_log_fault_impl(&dword_18AB82000, v85, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&v119, 0x12u);
        }
      }
      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:]([CDDCloudKitResponse alloc], a3, 0, v77);
      goto LABEL_3;
    }
    v67 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    if (a3) {
      uint64_t v68 = *((void *)a3 + 4);
    }
    else {
      uint64_t v68 = 0;
    }
    if (![v67 isWritableFileAtPath:v68])
    {
      v86 = [CDDCloudKitResponse alloc];
      v87 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v107 = *MEMORY[0x1E4F28588];
      v108 = @"Provided file handle is invalid, the file is not writable.";
      uint64_t v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v86, a3, 0, (void *)[v87 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v88]);
      goto LABEL_3;
    }
    *(void *)&v100.st_dev = 0;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(void *)&v100.st_uid = 0x2020000000;
    LOBYTE(v100.st_rdev) = 0;
    *(void *)&v119.st_dev = 0;
    v119.st_ino = (__darwin_ino64_t)&v119;
    *(void *)&v119.st_uid = 0x3052000000;
    *(void *)&v119.st_rdev = __Block_byref_object_copy__22;
    v119.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__22;
    v119.st_atimespec.tv_nsec = 0;
    v69 = [(NSPersistentContainer *)self->_metadataContainer newBackgroundContext];
    uint64_t v91 = MEMORY[0x1E4F143A8];
    uint64_t v92 = 3221225472;
    uint64_t v93 = (uint64_t)__48__CDDCloudKitServer__handleRegistrationMessage___block_invoke;
    v94 = &unk_1E544D598;
    v95 = self;
    id v96 = a3;
    v97 = v69;
    v98 = &v119;
    v99 = &v100;
    [(NSManagedObjectContext *)v69 performBlockAndWait:&v91];

    uint64_t v70 = *(void *)(v119.st_ino + 40);
    if (v70)
    {
      v71 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v109 = *MEMORY[0x1E4F28588];
      if (a3) {
        uint64_t v72 = *((void *)a3 + 1);
      }
      else {
        uint64_t v72 = 0;
      }
      uint64_t v110 = [NSString stringWithFormat:@"Failed to register store for message '%@' due to the following error: %@", v72, v70];
      uint64_t v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      v74 = (void *)[v71 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v73];
    }
    else
    {
      v74 = 0;
    }
    v89 = [CDDCloudKitResponse alloc];
    id v15 = -[CDDCloudKitResponse initWithMessage:success:error:](v89, a3, *(unsigned char *)(v100.st_ino + 24), v74);

    *(void *)(v119.st_ino + 40) = 0;
    v54 = &v119;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = [CDDCloudKitResponse alloc];
      v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v105 = *MEMORY[0x1E4F28588];
      v57 = NSString;
      v58 = (objc_class *)objc_opt_class();
      v90 = NSStringFromClass(v58);
      uint64_t v106 = [v57 stringWithFormat:@"Unknown message: %@"];
      uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      uint64_t v14 = -[CDDCloudKitResponse initWithMessage:success:error:](v55, a3, 0, (void *)[v56 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v59]);
      goto LABEL_3;
    }
    *(void *)&v100.st_dev = 0;
    v100.st_ino = (__darwin_ino64_t)&v100;
    *(void *)&v100.st_uid = 0x3052000000;
    *(void *)&v100.st_rdev = __Block_byref_object_copy__22;
    v100.st_atimespec.tv_sec = (__darwin_time_t)__Block_byref_object_dispose__22;
    v100.st_atimespec.tv_nsec = 0;
    uint64_t v91 = 0;
    uint64_t v92 = (uint64_t)&v91;
    uint64_t v93 = 0x2020000000;
    LOBYTE(v94) = 0;
    v43 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v44 = 16;
    }
    else {
      uint64_t v44 = __ckLoggingOverride;
    }
    uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Asked to schedule activity for store: %@"];
    _NSCoreDataLog(v44, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]");
    v52 = [(NSPersistentContainer *)self->_metadataContainer newBackgroundContext];
    *(void *)&v119.st_dev = MEMORY[0x1E4F143A8];
    v119.st_ino = 3221225472;
    *(void *)&v119.st_uid = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke;
    *(void *)&v119.st_rdev = &unk_1E544D598;
    v119.st_atimespec.tv_sec = (__darwin_time_t)self;
    v119.st_atimespec.tv_nsec = (uint64_t)a3;
    v119.st_mtimespec.tv_sec = (__darwin_time_t)v52;
    v119.st_mtimespec.tv_nsec = (uint64_t)&v100;
    v119.st_ctimespec.tv_sec = (__darwin_time_t)&v91;
    [(NSManagedObjectContext *)v52 performBlockAndWait:&v119];

    v53 = [CDDCloudKitResponse alloc];
    id v15 = -[CDDCloudKitResponse initWithMessage:success:error:](v53, a3, *(unsigned char *)(v92 + 24), *(void **)(v100.st_ino + 40));

    *(void *)(v100.st_ino + 40) = 0;
    v54 = (stat *)&v91;
  }
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v100, 8);
LABEL_4:
  if (v15)
  {
    if (*((unsigned char *)v15 + 8) || v15[3]) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v23 = [NSString stringWithUTF8String:"CloudKit Server is attempting to send back a nil response: %@"];
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)a3);
    id v30 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v119.st_dev = 138412290;
      *(void *)&v119.st_mode = a3;
      _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: CloudKit Server is attempting to send back a nil response: %@", (uint8_t *)&v119, 0xCu);
    }
  }
  uint64_t v31 = [NSString stringWithUTF8String:"Bug in CoreData CloudKit Server: Response success == NO but error is also nil."];
  _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)v90);
  v38 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v119.st_dev) = 0;
    _os_log_fault_impl(&dword_18AB82000, v38, OS_LOG_TYPE_FAULT, "CoreData: Bug in CoreData CloudKit Server: Response success == NO but error is also nil.", (uint8_t *)&v119, 2u);
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_18:
  if (a4) {
LABEL_19:
  }
    (*((void (**)(id, void *))a4 + 2))(a4, v15);
LABEL_20:
}

void __48__CDDCloudKitServer__handleRegistrationMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    id v4 = *(void **)(v3 + 32);
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = -[CDDCloudKitServer createRealPathForPath:error:](v2, v4, (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitRegisteredClient entityName]);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = *(void *)(v8 + 16);
      uint64_t v8 = *(void *)(v8 + 56);
    }
    else
    {
      uint64_t v9 = 0;
    }
    -[NSFetchRequest setPredicate:](v7, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleIdentifier = %@ AND storeConfigurationName = %@ AND storePath = %@", v9, v8, v6]);
    id v22 = 0;
    uint64_t v10 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v7 error:&v22];
    if (!v10) {
      goto LABEL_25;
    }
    if ([v10 count]) {
      goto LABEL_21;
    }
    uint64_t v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitRegisteredClient entityName], *(void *)(a1 + 48));
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = v13 ? *(void *)(v13 + 16) : 0;
    [(NSManagedObject *)v11 setBundleIdentifier:v14];
    [(NSManagedObject *)v12 setStorePath:v6];
    id v15 = *(void **)(a1 + 40);
    if (!v15) {
      goto LABEL_30;
    }
    if (v15[5])
    {
      -[NSManagedObject setFileProtectionType:](v12, "setFileProtectionType:");
      id v15 = *(void **)(a1 + 40);
      if (!v15) {
        goto LABEL_30;
      }
    }
    v16 = (void *)v15[7];
    if (!v16) {
      goto LABEL_19;
    }
    char v17 = [v16 isEqualToString:@"PF_DEFAULT_CONFIGURATION_NAME"];
    id v15 = *(void **)(a1 + 40);
    if ((v17 & 1) == 0)
    {
      if (v15) {
        uint64_t v18 = v15[7];
      }
      else {
        uint64_t v18 = 0;
      }
      [(NSManagedObject *)v12 setStoreConfigurationName:v18];
      id v15 = *(void **)(a1 + 40);
    }
    if (v15) {
LABEL_19:
    }
      uint64_t v19 = v15[8];
    else {
LABEL_30:
    }
      uint64_t v19 = 0;
    [(NSManagedObject *)v12 setContainerIdentifier:v19];
    if ([*(id *)(a1 + 48) save:&v22]) {
LABEL_21:
    }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    else {
LABEL_25:
    }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v22;
  }
  else
  {
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v21 = v20;
  }
}

- (uint64_t)createRealPathForPath:(void *)a3 error:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = realpath_DARWIN_EXTSN((const char *)[a2 UTF8String], 0);
  if (v4)
  {
    uint64_t v5 = [[NSString alloc] initWithCString:v4 encoding:4];
  }
  else if (a3)
  {
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v8 = *MEMORY[0x1E4F28588];
    v9[0] = @"Failed to get a real path for the provided store path.";
    uint64_t v5 = 0;
    *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
  }
  else
  {
    uint64_t v5 = 0;
  }
  free(v4);
  return v5;
}

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    id v4 = *(void **)(v3 + 24);
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = (NSManagedObject *)-[CDDCloudKitServer createRealPathForPath:error:](v2, v4, (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  if (v5)
  {
    uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitRegisteredClient entityName]);
    uint64_t v91 = v5;
    -[NSFetchRequest setPredicate:](v6, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"storePath = %@", v5]);
    id v99 = 0;
    uint64_t v92 = a1;
    uint64_t v7 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v6 error:&v99];
    uint64_t v8 = v7;
    if (v7)
    {
      if ([v7 count])
      {
        v90 = (NSManagedObject *)[v8 lastObject];
        if ((unint64_t)[v8 count] >= 2)
        {
          uint64_t v9 = [NSString stringWithUTF8String:"Multiple clients registered for the same store path: %@\n%@"];
          v87 = v8;
          _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
          v16 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v110 = v91;
            __int16 v111 = 2112;
            v112 = v8;
            _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Multiple clients registered for the same store path: %@\n%@", buf, 0x16u);
          }
        }
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        char v17 = (void *)[(NSManagedObject *)v90 scheduledActivities];
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v20 = [v17 countByEnumeratingWithState:&v95 objects:v108 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v96;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v96 != v21) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(NSManagedObject **)(*((void *)&v95 + 1) + 8 * i);
              uint64_t v24 = [(NSManagedObject *)v23 activityType];
              if (v24 == 1)
              {
                uint64_t v18 = v23;
              }
              else if (v24 == 2)
              {
                uint64_t v19 = v23;
              }
              else
              {
                uint64_t v25 = [NSString stringWithUTF8String:"Found unknown activity type: %@"];
                _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)v23);
                uint64_t v32 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v110 = v23;
                  _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Found unknown activity type: %@", buf, 0xCu);
                }
              }
            }
            uint64_t v20 = [v17 countByEnumeratingWithState:&v95 objects:v108 count:16];
          }
          while (v20);
        }
        uint64_t v33 = objc_msgSend((id)objc_msgSend(*(id *)(v92 + 32), "containerProvider"), "containerWithIdentifier:", -[NSManagedObject containerIdentifier](v90, "containerIdentifier"));
        if (v33)
        {
          uint64_t v34 = *(void *)(v92 + 40);
          if (!v34) {
            goto LABEL_42;
          }
          uint64_t v35 = *(void *)(v34 + 16);
          if (v35 != 2 || v19)
          {
            if (v35 != 1 || v18) {
              goto LABEL_42;
            }
            uint64_t v18 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitScheduledActivity entityName], *(void *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v18, "setActivityUUID:", [MEMORY[0x1E4F29128] UUID]);
            [(NSManagedObject *)v18 setActivityType:1];
            [(NSManagedObject *)v18 setRegisteredClient:v90];
            -[NSManagedObject setScheduledAt:](v18, "setScheduledAt:", [MEMORY[0x1E4F1C9C8] date]);
            uint64_t v46 = objc_msgSend(@"com.apple.coredatad.cloudkit.", "stringByAppendingString:", objc_msgSend((id)-[NSManagedObject activityUUID](v18, "activityUUID"), "UUIDString"));
            uint64_t v37 = (void *)[objc_alloc(getCloudKitCKSchedulerActivityClass()) initWithIdentifier:v46 container:v33 priority:2];
            uint64_t v106 = [NSString stringWithUTF8String:*MEMORY[0x1E4F14360]];
            uint64_t v107 = MEMORY[0x1E4F14518];
            objc_msgSend(v37, "setAdditionalXPCActivityCriteria:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));
            -[NSManagedObject populateFromCriteria:](v18, "populateFromCriteria:", [v37 additionalXPCActivityCriteria]);
          }
          else
          {
            uint64_t v19 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[CDDCloudKitScheduledActivity entityName], *(void *)(v92 + 48));
            -[NSManagedObject setActivityUUID:](v19, "setActivityUUID:", [MEMORY[0x1E4F29128] UUID]);
            [(NSManagedObject *)v19 setActivityType:2];
            [(NSManagedObject *)v19 setRegisteredClient:v90];
            -[NSManagedObject setScheduledAt:](v19, "setScheduledAt:", [MEMORY[0x1E4F1C9C8] date]);
            uint64_t v36 = objc_msgSend(@"com.apple.coredatad.cloudkit.", "stringByAppendingString:", objc_msgSend((id)-[NSManagedObject activityUUID](v19, "activityUUID"), "UUIDString"));
            uint64_t v37 = (void *)[objc_alloc(getCloudKitCKSchedulerActivityClass()) initWithIdentifier:v36 container:v33 priority:2];
          }
          if (v37)
          {
            uint64_t v47 = (NSManagedObject *)[*(id *)(v92 + 32) scheduler];
            uint64_t v48 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 0x10) {
              uint64_t v49 = 16;
            }
            else {
              uint64_t v49 = __ckLoggingOverride;
            }
            uint64_t v50 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Scheduling activity: %@ for client: %@ with scheduler: %@"];
            uint64_t v88 = v90;
            v89 = v47;
            _NSCoreDataLog(v49, v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
            objc_initWeak((id *)buf, *(id *)(v92 + 32));
            uint64_t v57 = [v37 identifier];
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2;
            v93[3] = &unk_1E544D5C0;
            objc_copyWeak(&v94, (id *)buf);
            v93[4] = *(void *)(v92 + 32);
            [(NSManagedObject *)v47 registerActivityIdentifier:v57 handler:v93];
            [(NSManagedObject *)v47 submitActivity:v37];
            objc_destroyWeak(&v94);
            objc_destroyWeak((id *)buf);
LABEL_46:
            int v67 = [*(id *)(v92 + 48) hasChanges];
            uint64_t v68 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 0x10) {
              uint64_t v69 = 16;
            }
            else {
              uint64_t v69 = __ckLoggingOverride;
            }
            if (v67)
            {
              uint64_t v70 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Saving changes for client: %@"];
              _NSCoreDataLog(v69, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              *(unsigned char *)(*(void *)(*(void *)(v92 + 64) + 8) + 24) = [*(id *)(v92 + 48) save:&v99];
              if (!*(unsigned char *)(*(void *)(*(void *)(v92 + 64) + 8) + 24))
              {
                id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v104 = *MEMORY[0x1E4F28588];
                uint64_t v105 = [NSString stringWithFormat:@"Failed to save changes: %@", v99, 400, v90, v88, v89];
                uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                *(void *)(*(void *)(*(void *)(v92 + 56) + 8) + 40) = [v77 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v78];
              }
            }
            else
            {
              uint64_t v79 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"No change to save for client: %@"];
              _NSCoreDataLog(v69, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
              *(unsigned char *)(*(void *)(*(void *)(v92 + 64) + 8) + 24) = 1;
            }

            goto LABEL_57;
          }
LABEL_42:
          v58 = (void *)MEMORY[0x18C127630]();
          if ((unint64_t)__ckLoggingOverride >= 0x10) {
            uint64_t v59 = 16;
          }
          else {
            uint64_t v59 = __ckLoggingOverride;
          }
          uint64_t v60 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Already have scheduled activity for client: %@\n%@\n%@"];
          uint64_t v88 = v19;
          v89 = v18;
          _NSCoreDataLog(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[CDDCloudKitServer _handleScheduleMessage:]_block_invoke");
          uint64_t v37 = 0;
          goto LABEL_46;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v102 = *MEMORY[0x1E4F28588];
        uint64_t v44 = NSString;
        if ([(NSManagedObject *)v90 containerIdentifier]) {
          uint64_t v45 = [(NSManagedObject *)v90 containerIdentifier];
        }
        else {
          uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
        }
        uint64_t v103 = [v44 stringWithFormat:@"Failed to get a container for '%@", v45, v87];
        uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        id v39 = (id)[v43 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v86];
      }
      else
      {
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v100 = *MEMORY[0x1E4F28588];
        uint64_t v41 = *(void *)(v92 + 40);
        if (v41) {
          uint64_t v41 = *(void *)(v41 + 24);
        }
        uint64_t v101 = [NSString stringWithFormat:@"No client is registered for: %@", v41];
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v39 = (id)[v40 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v42];
      }
    }
    else
    {
      id v39 = v99;
    }
    *(void *)(*(void *)(*(void *)(v92 + 56) + 8) + 40) = v39;
LABEL_57:
    uint64_t v5 = v91;
    goto LABEL_58;
  }
  id v38 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
LABEL_58:
}

void __44__CDDCloudKitServer__handleScheduleMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(void *)(a1 + 32), a2, a3);
  }
  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Asked to run activity but no server: %@"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    uint64_t v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a2;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Asked to run activity but no server: %@", buf, 0xCu);
    }
  }
}

- (void)runActivity:(uint64_t)a3 completionHandler:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = *(NSObject **)(a1 + 40);
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    if (dispatch_group_wait(v6, v7))
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Failed to handle activity because initialization took longer than expected: %@"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, (uint64_t)a2);
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = a2;
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Failed to handle activity because initialization took longer than expected: %@", buf, 0xCu);
      }
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
    }
    else
    {
      v16 = (void *)MEMORY[0x18C127630]();
      uint64_t v17 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v18 = 16;
      }
      else {
        uint64_t v18 = __ckLoggingOverride;
      }
      uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Asked to run activity: %@"];
      _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]");
      uint64_t v26 = (void *)[*(id *)(a1 + 32) newBackgroundContext];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke;
      v27[3] = &unk_1E544BE90;
      v27[4] = a2;
      v27[5] = v26;
      v27[6] = a1;
      v27[7] = a3;
      [v26 performBlockAndWait:v27];

      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
      objc_msgSend((id)objc_msgSend((id)a1, "scheduler"), "unregisterActivityIdentifier:", objc_msgSend(a2, "identifier"));
    }
  }
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke(uint64_t a1)
{
  v116[1] = *MEMORY[0x1E4F143B8];
  uint64_t v108 = 0;
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "identifier"), "substringFromIndex:", objc_msgSend(@"com.apple.coredatad.cloudkit.", "length"))];
  id v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[CDDCloudKitScheduledActivity entityName]);
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"activityUUID = %@", v3]);
  uint64_t v5 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v4 error:&v108];
  uint64_t v6 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 0x10) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Looking up activities matching the identifier: %@\n%@"];
  [*v2 identifier];
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
  if (v5)
  {
    if ([v5 count])
    {
      if ((unint64_t)[v5 count] >= 2)
      {
        uint64_t v15 = [NSString stringWithUTF8String:"Found more than one scheduled activities matching the identifier '%@': %@"];
        uint64_t v16 = [*(id *)(a1 + 32) identifier];
        _NSCoreDataLog(17, v15, v17, v18, v19, v20, v21, v22, v16);
        uint64_t v23 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          uint64_t v101 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v101;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v5;
          _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Found more than one scheduled activities matching the identifier '%@': %@", buf, 0x16u);
        }
      }
      uint64_t v24 = (void *)[v5 lastObject];
      uint64_t v25 = (void *)[v24 registeredClient];
      uint64_t v26 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v27 = 16;
      }
      else {
        uint64_t v27 = __ckLoggingOverride;
      }
      uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Running scheduled activity: %@\nClient: %@"];
      _NSCoreDataLog(v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke");
      uint64_t v35 = [NSPersistentStoreDescription alloc];
      uint64_t v36 = -[NSPersistentStoreDescription initWithURL:](v35, "initWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(v25, "storePath")));
      -[NSPersistentStoreDescription setConfiguration:](v36, "setConfiguration:", [v25 storeConfigurationName]);
      uint64_t v37 = [v25 fileProtectionType];
      [(NSPersistentStoreDescription *)v36 setOption:v37 forKey:*MEMORY[0x1E4F28370]];
      [(NSPersistentStoreDescription *)v36 setOption:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentHistoryTrackingKey"];
      uint64_t v38 = MEMORY[0x1E4F1CC38];
      [(NSPersistentStoreDescription *)v36 setOption:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentStoreRemoteChangeNotificationOptionKey"];
      id v39 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:]([NSCloudKitMirroringDelegateOptions alloc], "initWithContainerIdentifier:", [v25 containerIdentifier]);
      id v40 = (void *)[*(id *)(a1 + 48) containerProvider];
      if (v39)
      {
        objc_setProperty_nonatomic(v39, v41, v40, 80);
        [(NSCloudKitMirroringDelegateOptions *)v39 setAutomaticallyScheduleImportAndExportOperations:0];
        v39->_useDaemon = 0;
      }
      else
      {
        [0 setAutomaticallyScheduleImportAndExportOperations:0];
      }
      uint64_t v42 = [[NSCloudKitMirroringDelegate alloc] initWithOptions:v39];
      [(NSPersistentStoreDescription *)v36 setMirroringDelegate:v42];

      uint64_t v107 = 0;
      uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(v25, "storePath"));
      uint64_t v115 = @"NSReadOnlyPersistentStoreOption";
      v116[0] = v38;
      id v44 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v43, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:&v115 count:1], &v107);
      if (v44)
      {
        uint64_t v103 = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:v44];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000;
        v112 = __Block_byref_object_copy__22;
        uint64_t v113 = __Block_byref_object_dispose__22;
        uint64_t v114 = 0;
        uint64_t v45 = dispatch_semaphore_create(0);
        uint64_t v46 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2;
        v106[3] = &unk_1E544D5E8;
        v106[4] = v45;
        uint64_t v102 = [v46 addObserverForName:@"PFCloudKitDidSetupNotificationName" object:v42 queue:0 usingBlock:v106];
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_130;
        v105[3] = &unk_1E544D610;
        v105[4] = buf;
        uint64_t v47 = [(NSPersistentStoreCoordinator *)v103 addPersistentStoreWithDescription:v36 completionHandler:v105];
        BOOL v48 = *(void *)(*(void *)&buf[8] + 40) == 0;
        uint64_t v49 = (void *)MEMORY[0x18C127630](v47);
        unint64_t v50 = __ckLoggingOverride;
        if (v48)
        {
          uint64_t v76 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Store initialized waiting for the mirroring delegate to set up."];
          if (v50 >= 0x10) {
            uint64_t v83 = 16;
          }
          else {
            uint64_t v83 = v50;
          }
          _NSCoreDataLog(v83, v76, v77, v78, v79, v80, v81, v82, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
          dispatch_time_t v84 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v45, v84))
          {
            id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v109 = *MEMORY[0x1E4F28588];
            uint64_t v110 = @"Timed out waiting for the mirroring delegate to set up.";
            uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            uint64_t v87 = [v85 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v86];
            *(void *)(*(void *)&buf[8] + 40) = v87;
          }
          else
          {
            uint64_t v88 = (void *)MEMORY[0x18C127630]();
            unint64_t v89 = __ckLoggingOverride;
            uint64_t v90 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Mirroring delegate initialized."];
            if (v89 >= 0x10) {
              uint64_t v97 = 16;
            }
            else {
              uint64_t v97 = v89;
            }
            _NSCoreDataLog(v97, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
            long long v98 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
            [(NSManagedObjectContext *)v98 setPersistentStoreCoordinator:v103];
            -[NSManagedObjectContext setTransactionAuthor:](v98, "setTransactionAuthor:", [NSString stringWithFormat:@"%@.%@", objc_msgSend(v25, "bundleIdentifier"), objc_msgSend((id)objc_msgSend(v24, "activityUUID"), "UUIDString"), v24, v25]);
            v104[0] = MEMORY[0x1E4F143A8];
            v104[1] = 3221225472;
            v104[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3;
            v104[3] = &unk_1E544D660;
            uint64_t v100 = *(void *)(a1 + 40);
            uint64_t v99 = *(void *)(a1 + 48);
            v104[4] = v103;
            v104[5] = v99;
            v104[6] = v24;
            v104[7] = v100;
            v104[8] = v98;
            v104[9] = buf;
            [(NSManagedObjectContext *)v98 performBlockAndWait:v104];
          }
        }
        else
        {
          uint64_t v51 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to load persistent store for client: %@\n%@"];
          _NSCoreDataLog(v50 != 0, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", v102);

        *(void *)(*(void *)&buf[8] + 40) = 0;
        _Block_object_dispose(buf, 8);
      }
      else
      {
        int v67 = (void *)MEMORY[0x18C127630]();
        BOOL v68 = __ckLoggingOverride != 0;
        uint64_t v69 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to load managed object model for registered client: %@\n%@"];
        _NSCoreDataLog(v68, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
      }
    }
    else
    {
      v58 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v59 = 16;
      }
      else {
        uint64_t v59 = __ckLoggingOverride;
      }
      uint64_t v60 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"No activity registered with identifier: %@"];
      _NSCoreDataLog(v59, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_2");
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

intptr_t __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKeyedSubscript:", @"result");
  if ([v3 success])
  {
    if ([v3 error])
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "Error was non-nil, but expected nil");
      _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, v22);
      uint64_t v11 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        uint64_t v12 = "CoreData: Error was non-nil, but expected nil";
        uint64_t v13 = (uint8_t *)&v22;
LABEL_8:
        _os_log_fault_impl(&dword_18AB82000, v11, OS_LOG_TYPE_FAULT, v12, v13, 2u);
      }
    }
  }
  else
  {
    uint64_t v14 = [NSString stringWithUTF8String:"Success was NO but expected YES"];
    _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v22);
    uint64_t v11 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "CoreData: Success was NO but expected YES";
      uint64_t v13 = buf;
      goto LABEL_8;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_130(uint64_t a1, uint64_t a2, void *a3)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [NSCloudKitMirroringExportRequest alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4;
  v13[3] = &unk_1E544D638;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 32);
  long long v15 = v3;
  if (!objc_msgSend(*(id *)(a1 + 64), "executeRequest:error:", -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](v2, "initWithOptions:completionBlock:", 0, v13), *(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v4 = (void *)MEMORY[0x18C127630](*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to execute export request: %@\n%@"];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_3");
  }
}

void __51__CDDCloudKitServer_runActivity_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v13 = *(id *)(a1 + 32);
  if (([a2 success] & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x18C127630]();
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Backup export failed: %@"];
    [a2 error];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[CDDCloudKitServer runActivity:completionHandler:]_block_invoke_4");
  }
  [*(id *)(a1 + 40) finishedActivity:*(void *)(a1 + 48) withResult:a2 inManagedObjectContext:*(void *)(a1 + 56)];
}

- (void)finishedActivity:(id)a3 withResult:(id)a4 inManagedObjectContext:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke;
  v5[3] = &unk_1E544C948;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  v5[7] = self;
  [a5 performBlock:v5];
}

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke(id *a1)
{
  if ([a1[4] success])
  {
    uint64_t v2 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v3 = 16;
    }
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Successfully finished activity, pruning: %@"];
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    [a1[6] deleteObject:a1[5]];
    id location = 0;
    if (([a1[6] save:&location] & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v12 = 16;
      }
      else {
        uint64_t v12 = __ckLoggingOverride;
      }
      uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to prune activity after successful execution: %@"];
      _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
LABEL_10:
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a1[4], "error"), "code") == 134410 {
         && (uint64_t v20 = objc_msgSend((id)objc_msgSend(a1[4], "error"), "domain"),
  }
             [v20 isEqualToString:*MEMORY[0x1E4F281F8]]))
  {
    uint64_t v21 = (void *)MEMORY[0x18C127630]();
    BOOL v22 = __ckLoggingOverride != 0;
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Execution of activity encountered a fatal error, it will not be retried: %@\n%@"];
    [a1[4] error];
    _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    [a1[6] deleteObject:a1[5]];
    id location = 0;
    if (([a1[6] save:&location] & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v30 = 16;
      }
      else {
        uint64_t v30 = __ckLoggingOverride;
      }
      uint64_t v31 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to prune activity after fatal error: %@"];
      _NSCoreDataLog(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v38 = (void *)MEMORY[0x18C127630]();
    BOOL v39 = __ckLoggingOverride != 0;
    uint64_t v40 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Execution of activity failed: %@\n%@"];
    [a1[4] error];
    _NSCoreDataLog(v39, v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    uint64_t v47 = objc_msgSend((id)objc_msgSend(a1[7], "containerProvider"), "containerWithIdentifier:", objc_msgSend((id)objc_msgSend(a1[5], "registeredClient"), "containerIdentifier"));
    uint64_t v48 = objc_msgSend(@"com.apple.coredatad.cloudkit.", "stringByAppendingString:", objc_msgSend((id)objc_msgSend(a1[5], "activityUUID"), "UUIDString"));
    uint64_t v49 = (void *)[objc_alloc(getCloudKitCKSchedulerActivityClass()) initWithIdentifier:v48 container:v47 priority:2];
    objc_msgSend(v49, "setAdditionalXPCActivityCriteria:", objc_msgSend(a1[5], "xpcActivityCriteria"));
    unint64_t v50 = (void *)[a1[7] scheduler];
    uint64_t v51 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v52 = 16;
    }
    else {
      uint64_t v52 = __ckLoggingOverride;
    }
    uint64_t v53 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Scheduling activity: %@ for client: %@ with scheduler: %@"];
    [a1[5] registeredClient];
    _NSCoreDataLog(v52, v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[CDDCloudKitServer finishedActivity:withResult:inManagedObjectContext:]_block_invoke");
    objc_initWeak(&location, a1[7]);
    uint64_t v60 = [v49 identifier];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2;
    v61[3] = &unk_1E544D5C0;
    objc_copyWeak(&v62, &location);
    v61[4] = a1[7];
    [v50 registerActivityIdentifier:v60 handler:v61];
    [v50 submitActivity:v49];

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
  }
}

void __72__CDDCloudKitServer_finishedActivity_withResult_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[CDDCloudKitServer runActivity:completionHandler:](*(void *)(a1 + 32), a2, a3);
  }
  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"Asked to run activity but no server: %@"];
    _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)a2);
    uint64_t v14 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = a2;
      _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Asked to run activity but no server: %@", buf, 0xCu);
    }
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (CDDCloudKitServerConfiguration)configuration
{
  return self->_configuration;
}

- (PFCloudKitContainerProvider)containerProvider
{
  return self->_containerProvider;
}

- (CKScheduler)scheduler
{
  return self->_scheduler;
}

@end