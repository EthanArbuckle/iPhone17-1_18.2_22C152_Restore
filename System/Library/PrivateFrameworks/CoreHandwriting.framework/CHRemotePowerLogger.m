@interface CHRemotePowerLogger
- (id)connection;
- (void)_teardownXPCConnection;
- (void)dealloc;
- (void)executeLoggingRequest:(id)a3;
- (void)logModelInference:(unint64_t)a3 startTimestamp:(double)a4 endTimestamp:(double)a5 data:(id)a6;
- (void)logModelLoaded:(unint64_t)a3;
- (void)logModelUnloaded:(unint64_t)a3;
- (void)setupXPCConnectionIfNeeded;
@end

@implementation CHRemotePowerLogger

- (void)setupXPCConnectionIfNeeded
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->__connection)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v7 = objc_msgSend_initWithMachServiceName_options_(v3, v4, @"com.apple.handwritingd.remoterecognition", 0, v5, v6);
    connection = v2->__connection;
    v2->__connection = (NSXPCConnection *)v7;

    v13 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v9, (uint64_t)&unk_1F2063C40, v10, v11, v12);
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v20 = objc_msgSend_setWithObject_(v14, v16, v15, v17, v18, v19);
    objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v13, v21, (uint64_t)v20, (uint64_t)sel_handlePowerLoggingRequest_, 0, 0);
    objc_msgSend_setRemoteObjectInterface_(v2->__connection, v22, (uint64_t)v13, v23, v24, v25);
    objc_initWeak(&location, v2);
    v26 = v2->__connection;
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = sub_1C4A4DBD4;
    v43 = &unk_1E64E1CD0;
    objc_copyWeak(&v44, &location);
    objc_msgSend_setInterruptionHandler_(v26, v27, (uint64_t)&v40, v28, v29, v30);
    objc_msgSend_setInvalidationHandler_(v2->__connection, v31, (uint64_t)&unk_1F2012CB0, v32, v33, v34, v40, v41, v42, v43);
    objc_msgSend_resume(v2->__connection, v35, v36, v37, v38, v39);
    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

- (id)connection
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->__connection;
  objc_sync_exit(v2);

  return v3;
}

- (void)_teardownXPCConnection
{
  obj = self;
  objc_sync_enter(obj);
  objc_msgSend_invalidate(obj->__connection, v2, v3, v4, v5, v6);
  connection = obj->__connection;
  obj->__connection = 0;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  objc_msgSend__teardownXPCConnection(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CHRemotePowerLogger;
  [(CHRemotePowerLogger *)&v7 dealloc];
}

- (void)logModelLoaded:(unint64_t)a3
{
  uint64_t v5 = [CHRemotePowerLoggingLoadingRequest alloc];
  id v14 = (id)objc_msgSend_initWithModel_(v5, v6, a3, v7, v8, v9);
  objc_msgSend_executeLoggingRequest_(self, v10, (uint64_t)v14, v11, v12, v13);
}

- (void)logModelUnloaded:(unint64_t)a3
{
  uint64_t v5 = [CHRemotePowerLoggingUnloadingRequest alloc];
  id v14 = (id)objc_msgSend_initWithModel_(v5, v6, a3, v7, v8, v9);
  objc_msgSend_executeLoggingRequest_(self, v10, (uint64_t)v14, v11, v12, v13);
}

- (void)logModelInference:(unint64_t)a3 startTimestamp:(double)a4 endTimestamp:(double)a5 data:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [CHRemotePowerLoggingInferenceRequest alloc];
  id started = (id)objc_msgSend_initWithModel_startTime_endTime_data_(v11, v12, a3, (uint64_t)v10, v13, v14, a4, a5);

  objc_msgSend_executeLoggingRequest_(self, v15, (uint64_t)started, v16, v17, v18);
}

- (void)executeLoggingRequest:(id)a3
{
  id v4 = a3;
  if (qword_1EA3C92C8 != -1) {
    dispatch_once(&qword_1EA3C92C8, &unk_1F2013170);
  }
  uint64_t v5 = qword_1EA3C92C0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4A4E0DC;
  v7[3] = &unk_1E64E2C80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
}

@end