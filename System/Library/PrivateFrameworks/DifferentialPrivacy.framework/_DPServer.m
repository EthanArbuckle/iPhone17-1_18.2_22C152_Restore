@interface _DPServer
+ (BOOL)shouldNotRecord:(id)a3 forKey:(id)a4 count:(unint64_t)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)metadataMethodsAllowed;
- (BOOL)retireReports:(id)a3 inDirectory:(id)a4;
- (NSXPCListener)listener;
- (_DPServer)init;
- (_DPServer)initWithDatabaseDirectoryPath:(id)a3 reportsDirectoryPath:(id)a4 enablePeriodicTasks:(BOOL)a5 enterSandbox:(BOOL)a6;
- (_DPStorage)db;
- (id)reportsNotYetSubmittedInDirecory:(id)a3;
- (void)donateDonationReceivedEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4 count:(int)a5;
- (void)init;
- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6;
- (void)recordValues:(id)a3 forKey:(id)a4 usingSelector:(SEL)a5;
- (void)recordValues:(id)a3 metadata:(id)a4 forKey:(id)a5 usingSelector:(SEL)a6;
- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5;
- (void)reportsNotYetSubmittedWithReply:(id)a3;
- (void)retireReports:(id)a3 withReply:(id)a4;
- (void)setupPeriodicTasksWith:(id)a3;
- (void)start;
@end

@implementation _DPServer

- (BOOL)metadataMethodsAllowed
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.private.dprivacyd.metadata.allow"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (_DPServer)init
{
  v3 = +[_DPLog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_DPServer init](v3);
  }

  char v4 = +[_DPStrings databaseDirectoryPath];
  v5 = +[_DPStrings reportsDirectoryPath];
  v6 = [(_DPServer *)self initWithDatabaseDirectoryPath:v4 reportsDirectoryPath:v5 enablePeriodicTasks:1 enterSandbox:1];

  return v6;
}

- (void)setupPeriodicTasksWith:(id)a3
{
  id v10 = a3;
  v3 = objc_opt_new();
  [v3 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.ReportFilesMaintenance" database:v10];
  [v10 scheduleStorageCullingWithName:@"com.apple.DifferentialPrivacy.StorageCulling" database:v10];
  [v10 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.StorageMaintenance" database:v10];
  char v4 = objc_opt_new();
  [v4 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.TransparencyLogMaintenance" database:v10];
  if (!+[_DPDeviceInfo isRunningAsLaunchDaemon])
  {
    v5 = objc_opt_new();
    [v5 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.DediscoReporter" database:v10];
    v6 = objc_opt_new();
    [v6 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.PrivacyBudgetMaintenance" database:v10];
    v7 = objc_opt_new();
    [v7 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.runtimeBlacklistMaintenance" database:v10];
    v8 = objc_opt_new();
    [v8 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.serverBlacklistUpdate" database:v10];
    v9 = [[_DPTokenFetcher alloc] initWithTaskName:@"com.apple.DifferentialPrivacy.TokenFetcher"];
    [(_DPTokenFetcher *)v9 scheduleMaintenanceWithName:@"com.apple.DifferentialPrivacy.TokenFetcher" database:v10];
  }
}

- (_DPServer)initWithDatabaseDirectoryPath:(id)a3 reportsDirectoryPath:(id)a4 enablePeriodicTasks:(BOOL)a5 enterSandbox:(BOOL)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  id v12 = v10;
  if (!v11)
  {
    v22 = +[_DPLog daemon];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_DPServer initWithDatabaseDirectoryPath:reportsDirectoryPath:enablePeriodicTasks:enterSandbox:](v22);
    }

    exit(1);
  }
  v13 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __one_time_setup_block_invoke;
  block[3] = &unk_1E6C440C8;
  id v25 = v11;
  id v26 = v12;
  if (one_time_setup_onceToken != -1) {
    dispatch_once(&one_time_setup_onceToken, block);
  }

  v23.receiver = self;
  v23.super_class = (Class)_DPServer;
  v14 = [(_DPServer *)&v23 init];
  if (v14)
  {
    uint64_t v15 = +[_DPStorage storageWithDirectory:v11 readOnly:0];
    db = v14->_db;
    v14->_db = (_DPStorage *)v15;

    +[_DPPrivacyBudgetProperties initializeAllBudgetProperties];
    +[_DPPrivacyBudget createBudgetRecordsIn:v14->_db];
    +[_DPBlacklistManager processRuntimeBlacklist];
    if (v6) {
      [(_DPServer *)v14 setupPeriodicTasksWith:v14->_db];
    }
    id v17 = objc_alloc(MEMORY[0x1E4F29290]);
    v18 = +[_DPStrings machServiceName];
    uint64_t v19 = [v17 initWithMachServiceName:v18];
    listener = v14->_listener;
    v14->_listener = (NSXPCListener *)v19;

    [(NSXPCListener *)v14->_listener setDelegate:v14];
  }

  return v14;
}

- (void)start
{
  [(NSXPCListener *)self->_listener resume];
  v2 = +[_DPLog daemon];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DC55E000, v2, OS_LOG_TYPE_INFO, "dprivacyd: accepting work now", v3, 2u);
  }

  dispatch_main();
}

+ (BOOL)shouldNotRecord:(id)a3 forKey:(id)a4 count:(unint64_t)a5
{
  int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[_DPKeyNames keyPropertiesForKey:v8];
  char v10 = [v9 approvedForNonDNU];
  uint64_t v11 = [v9 transport];
  if (+[_DPDeviceInfo isDataCollectionEnabled]
    || (v10 & 1) != 0)
  {
    if (!+[_DPDeviceInfo isDisabledByTaskingForTransport:v11])
    {
      BOOL v19 = 0;
      goto LABEL_16;
    }
    id v12 = [NSString stringWithFormat:@"%@: Disabled by Tasking (%lu)", v7, v11];
    v16 = +[_DPLog daemon];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[_DPServer shouldNotRecord:forKey:count:]();
    }

    char v17 = [v9 telemetryAllowed];
    BOOL v18 = 1;
    if ((v17 & 1) == 0) {
      BOOL v18 = +[_DPDeviceInfo isInternalBuild];
    }
    LOBYTE(v24) = v18;
    LODWORD(v22) = 1;
    HIDWORD(v22) = v5;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v8, 1, 0, 0, 103, v12, v22, v24);
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"%@: Disabled by D&U switch and not approved for non D&U", v7];
    v13 = +[_DPLog daemon];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[_DPServer shouldNotRecord:forKey:count:]();
    }

    char v14 = [v9 telemetryAllowed];
    BOOL v15 = 1;
    if ((v14 & 1) == 0) {
      BOOL v15 = +[_DPDeviceInfo isInternalBuild];
    }
    LOBYTE(v23) = v15;
    LODWORD(v21) = 1;
    HIDWORD(v21) = v5;
    +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v8, 1, 0, 0, 102, v12, v21, v23);
  }

  BOOL v19 = 1;
LABEL_16:

  return v19;
}

- (void)recordValues:(id)a3 forKey:(id)a4 usingSelector:(SEL)a5
{
}

- (void)recordValues:(id)a3 metadata:(id)a4 forKey:(id)a5 usingSelector:(SEL)a6
{
  id v20 = a3;
  id v10 = a4;
  id v19 = a5;
  uint64_t v11 = [[_DPDatabaseRecorder alloc] initWithKey:v19 storage:self->_db];
  uint64_t v12 = [v20 count];
  if (v12)
  {
    unint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = v12;
    do
    {
      v16 = (void *)MEMORY[0x1E019F810]();
      if (v15 >= 128) {
        uint64_t v17 = 128;
      }
      else {
        uint64_t v17 = v15;
      }
      BOOL v18 = objc_msgSend(v20, "subarrayWithRange:", v14, v17);
      [(_DPDatabaseRecorder *)v11 performSelector:a6 withObject:v18 withObject:v10];
      v15 -= v17;

      v14 += 128;
    }
    while (v14 < v13);
  }
}

- (void)recordBitValues:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    unint64_t v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordBitValues_];
  }
}

- (void)recordBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    BOOL v18 = (void *)MEMORY[0x1E4F28C58];
    id v19 = +[_DPStrings errorDomain];
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v24[0] = @"Missing entitlement required for this method";
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v21 = [v18 errorWithDomain:v19 code:0 userInfo:v20];
    v14[2](v14, 0, v21);

LABEL_8:
    goto LABEL_9;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    id v19 = (void *)os_transaction_create();
    uint64_t v22 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    v14[2](v14, 1, 0);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordBitValues_metadata_];
    goto LABEL_8;
  }
  uint64_t v17 = +[_DPLog daemon];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[_DPServer recordBitValues:metadata:forKey:withReply:]();
  }

  v14[2](v14, 1, 0);
LABEL_9:
}

- (void)recordBitVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordBitVectors_];
  }
}

- (void)recordBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v18 = +[_DPStrings errorDomain];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Missing entitlement required for this method";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];
    v14[2](v14, 0, v20);

LABEL_6:
    goto LABEL_7;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    BOOL v18 = (void *)os_transaction_create();
    uint64_t v21 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    v14[2](v14, 1, 0);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordBitVectors_metadata_];
    goto LABEL_6;
  }
  v14[2](v14, 1, 0);
LABEL_7:
}

- (void)recordFloatVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordFloatVectors_];
    v10[2](v10, 1, 0);
  }
}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v18 = +[_DPStrings errorDomain];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Missing entitlement required for this method";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];
    v14[2](v14, 0, v20);

LABEL_6:
    goto LABEL_7;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    BOOL v18 = (void *)os_transaction_create();
    uint64_t v21 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordFloatVectors_metadata_];
    v14[2](v14, 1, 0);
    goto LABEL_6;
  }
  v14[2](v14, 1, 0);
LABEL_7:
}

- (void)recordNumbers:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordNumbers_];
  }
}

- (void)recordNumbers:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v18 = +[_DPStrings errorDomain];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Missing entitlement required for this method";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];
    v14[2](v14, 0, v20);

LABEL_6:
    goto LABEL_7;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    BOOL v18 = (void *)os_transaction_create();
    uint64_t v21 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    v14[2](v14, 1, 0);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordNumbers_metadata_];
    goto LABEL_6;
  }
  v14[2](v14, 1, 0);
LABEL_7:
}

- (void)recordNumbersVectors:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordNumbersVectors_];
  }
}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v18 = +[_DPStrings errorDomain];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Missing entitlement required for this method";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];
    v14[2](v14, 0, v20);

LABEL_6:
    goto LABEL_7;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    BOOL v18 = (void *)os_transaction_create();
    uint64_t v21 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    v14[2](v14, 1, 0);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordNumbersVectors_metadata_];
    goto LABEL_6;
  }
  v14[2](v14, 1, 0);
LABEL_7:
}

- (void)recordStrings:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = objc_msgSend(v11, "shouldNotRecord:forKey:count:", v12, v9, objc_msgSend(v15, "count"));

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v9, 1, [v15 count]);
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordStrings_];
  }
}

- (void)recordStrings:(id)a3 metadata:(id)a4 forKey:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = (void (**)(id, void, void *))a6;
  if (![(_DPServer *)self metadataMethodsAllowed])
  {
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 0, [v11 count]);
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v18 = +[_DPStrings errorDomain];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v23[0] = @"Missing entitlement required for this method";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v20 = [v17 errorWithDomain:v18 code:0 userInfo:v19];
    v14[2](v14, 0, v20);

LABEL_6:
    goto LABEL_7;
  }
  id v15 = objc_opt_class();
  v16 = NSStringFromSelector(a2);
  LODWORD(v15) = objc_msgSend(v15, "shouldNotRecord:forKey:count:", v16, v13, objc_msgSend(v11, "count"));

  if (!v15)
  {
    BOOL v18 = (void *)os_transaction_create();
    uint64_t v21 = (void *)MEMORY[0x1E019F810]();
    -[_DPServer donateDonationReceivedEventToBitacoraForKey:succeeded:count:](self, "donateDonationReceivedEventToBitacoraForKey:succeeded:count:", v13, 1, [v11 count]);
    v14[2](v14, 1, 0);
    [(_DPServer *)self recordValues:v11 metadata:v12 forKey:v13 usingSelector:sel_recordStrings_metadata_];
    goto LABEL_6;
  }
  v14[2](v14, 1, 0);
LABEL_7:
}

- (void)recordWords:(id)a3 forKey:(id)a4 withReply:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = objc_opt_class();
  id v12 = NSStringFromSelector(a2);
  LODWORD(v11) = [v11 shouldNotRecord:v12 forKey:v9 count:1];

  if (v11)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v13 = (void *)os_transaction_create();
    unint64_t v14 = (void *)MEMORY[0x1E019F810]();
    [(_DPServer *)self donateDonationReceivedEventToBitacoraForKey:v9 succeeded:1 count:1];
    v10[2](v10, 1, 0);
    [(_DPServer *)self recordValues:v15 forKey:v9 usingSelector:sel_recordWords_];
  }
}

- (void)reportsNotYetSubmittedWithReply:(id)a3
{
  id v8 = (void (**)(id, uint64_t, void *, void))a3;
  char v4 = (void *)os_transaction_create();
  int v5 = (void *)MEMORY[0x1E019F810]();
  BOOL v6 = +[_DPStrings reportsDirectoryPath];
  id v7 = [(_DPServer *)self reportsNotYetSubmittedInDirecory:v6];

  v8[2](v8, 1, v7, 0);
}

- (id)reportsNotYetSubmittedInDirecory:(id)a3
{
  return +[_DPReportFilesMaintainer reportsInDirectory:a3];
}

- (void)retireReports:(id)a3 withReply:(id)a4
{
  id v11 = a3;
  BOOL v6 = (void (**)(id, BOOL, void))a4;
  id v7 = (void *)os_transaction_create();
  id v8 = (void *)MEMORY[0x1E019F810]();
  id v9 = +[_DPStrings reportsDirectoryPath];
  BOOL v10 = [(_DPServer *)self retireReports:v11 inDirectory:v9];

  v6[2](v6, v10, 0);
}

- (BOOL)retireReports:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E019F810]();
  id v8 = +[_DPReportFilesMaintainer retiredReportsPath:v6];
  BOOL v9 = +[_DPReportFilesMaintainer retireFiles:v5 toDirectory:v8];

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.private.dprivacyd.allow"];
  id v7 = v6;
  if (v6 && ([v6 BOOLValue] & 1) != 0)
  {
    id v8 = _DPDaemonInterface();
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    [v5 resume];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v10 = +[_DPLog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_DPServer listener:shouldAcceptNewConnection:](v5);
    }

    [v5 invalidate];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)donateDonationReceivedEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4 count:(int)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  id v7 = +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:");
  char v8 = [v7 telemetryAllowed];
  BOOL v9 = 1;
  if ((v8 & 1) == 0) {
    BOOL v9 = +[_DPDeviceInfo isInternalBuild];
  }
  if (v6) {
    uint64_t v10 = 100;
  }
  else {
    uint64_t v10 = 104;
  }
  if (v6) {
    id v11 = 0;
  }
  else {
    id v11 = @"Metadata methods not allowed";
  }
  LOBYTE(v13) = v9;
  LODWORD(v12) = 1;
  HIDWORD(v12) = a5;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v14, 1, 0, v6, v10, v11, v12, v13);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (_DPStorage)db
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2 = +[_DPStrings databaseDirectoryPath];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DC55E000, a1, OS_LOG_TYPE_DEBUG, "DataBaseDirectoryPath: %@", v3, 0xCu);
}

- (void)initWithDatabaseDirectoryPath:(os_log_t)log reportsDirectoryPath:enablePeriodicTasks:enterSandbox:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "nil databaseDirectoryPath, exiting.", v1, 2u);
}

+ (void)shouldNotRecord:forKey:count:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "%@ for key: %@");
}

- (void)recordBitValues:metadata:forKey:withReply:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_DEBUG, "Skipping recording for key=%@", v1, 0xCu);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_2_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
}

@end