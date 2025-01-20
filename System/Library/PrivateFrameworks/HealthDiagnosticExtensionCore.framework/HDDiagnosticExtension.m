@interface HDDiagnosticExtension
- (BOOL)_captureLog;
- (BOOL)allowsSensitiveAttachments;
- (HDDiagnosticExtension)init;
- (NSMutableString)collectionLog;
- (NSURL)temporaryDirectoryURL;
- (id)_currentProtectionStateString;
- (id)_generateTemporaryAttachmentDirectory;
- (id)_loadOperationsFromPluginsWithAttachmentDirectoryURL:(id)a3;
- (id)attachmentsForParameters:(id)a3;
- (void)_beginMonitoringForContentProtectionStatus;
- (void)_captureLog;
- (void)_endMonitoringForContentProtectionStatus;
- (void)_log:(id)a3;
- (void)diagnosticOperation:(id)a3 logMessage:(id)a4;
- (void)setCollectionLog:(id)a3;
@end

@implementation HDDiagnosticExtension

- (HDDiagnosticExtension)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDDiagnosticExtension;
  v2 = [(DEExtensionProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(DEExtensionProvider *)v2 setLoggingConsent:@"The attached logs may contain some of your personal information, including sensitive health information from HealthKit."];
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    collectionLog = v3->_collectionLog;
    v3->_collectionLog = v4;

    v3->_logLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)attachmentsForParameters:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  self->_captureStartTime = CFAbsoluteTimeGetCurrent();
  v4 = [(HDDiagnosticExtension *)self _generateTemporaryAttachmentDirectory];
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = v4;

  v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:self->_captureStartTime];
  [(HDDiagnosticExtension *)self _log:@"Beginning diagnostic capture at %@", v6];

  _HKInitializeLogging();
  objc_super v7 = (void *)*MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_INFO))
  {
    v8 = self->_temporaryDirectoryURL;
    v9 = v7;
    v10 = [(NSURL *)v8 path];
    *(_DWORD *)buf = 138412290;
    v78 = v10;
    _os_log_impl(&dword_22943A000, v9, OS_LOG_TYPE_INFO, "Writing diagnostics to '%@'", buf, 0xCu);
  }
  [(HDDiagnosticExtension *)self _beginMonitoringForContentProtectionStatus];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v11 addObject:v12];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v70;
    do
    {
      uint64_t v17 = 0;
      v18 = v15;
      do
      {
        if (*(void *)v70 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v69 + 1) + 8 * v17);
        [v19 setDelegate:self];
        if (v18) {
          [v19 addDependency:v18];
        }
        id v15 = v19;

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }

  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v21];

  v22 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v22];

  v23 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v23];

  v24 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v24];

  v25 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v25];

  v26 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v26];

  v27 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v27];

  v28 = +[HDDiagnosticOperation operationWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObject:v28];

  v29 = [(HDDiagnosticExtension *)self _loadOperationsFromPluginsWithAttachmentDirectoryURL:self->_temporaryDirectoryURL];
  [v20 addObjectsFromArray:v29];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v55 = v20;
  uint64_t v30 = [v55 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v66 != v32) {
          objc_enumerationMutation(v55);
        }
        v34 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v34 setDelegate:self];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v35 = obj;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v62;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v62 != v38) {
                objc_enumerationMutation(v35);
              }
              [v34 addDependency:*(void *)(*((void *)&v61 + 1) + 8 * j)];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v74 count:16];
          }
          while (v37);
        }
      }
      uint64_t v31 = [v55 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v31);
  }

  v40 = [obj arrayByAddingObjectsFromArray:v55];
  -[HDDiagnosticExtension _log:](self, "_log:", @"Running %ld diagnostic operations", [v40 count]);
  id v41 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v41 addOperations:v40 waitUntilFinished:1];
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v43 = v40;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v58 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = [*(id *)(*((void *)&v57 + 1) + 8 * k) attachments];
        [v42 addObjectsFromArray:v48];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v45);
  }

  uint64_t v49 = [v43 count];
  uint64_t v50 = [v42 count];
  uint64_t v51 = [v42 count];
  v52 = "s:";
  if (v51 == 1) {
    v52 = ":";
  }
  [(HDDiagnosticExtension *)self _log:@"Finished %ld diagnostic operations, producing %ld attachment%s %@", v49, v50, v52, v42];
  [(HDDiagnosticExtension *)self _endMonitoringForContentProtectionStatus];
  [(HDDiagnosticExtension *)self _captureLog];
  v53 = (void *)[objc_alloc(MEMORY[0x263F3A080]) initWithPathURL:self->_temporaryDirectoryURL];
  [v42 addObject:v53];

  return v42;
}

- (void)diagnosticOperation:(id)a3 logMessage:(id)a4
{
  id v5 = a4;
  [(HDDiagnosticExtension *)self _log:@"%@: %@", objc_opt_class(), v5];
}

- (id)_currentProtectionStateString
{
  uint64_t v2 = MKBGetDeviceLockState();
  if (v2 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264866C38[(int)v2];
  }
  return v3;
}

- (void)_beginMonitoringForContentProtectionStatus
{
  int v3 = MKBDeviceUnlockedSinceBoot();
  v4 = "has";
  if (!v3) {
    v4 = "has not";
  }
  [(HDDiagnosticExtension *)self _log:@"Device %s been unlocked since boot.", v4];
  if (MKBDeviceFormattedForContentProtection())
  {
    id v5 = (const char *)*MEMORY[0x263F55A78];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __67__HDDiagnosticExtension__beginMonitoringForContentProtectionStatus__block_invoke;
    handler[3] = &unk_264866C18;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_contentProtectionNotifyToken, MEMORY[0x263EF83A0], handler);
    v6 = [(HDDiagnosticExtension *)self _currentProtectionStateString];
    [(HDDiagnosticExtension *)self _log:@"Current content protection state is: %@", v6];
  }
  else
  {
    [(HDDiagnosticExtension *)self _log:@"Content protection not enabled on this device."];
  }
}

void __67__HDDiagnosticExtension__beginMonitoringForContentProtectionStatus__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _currentProtectionStateString];
  [v1 _log:@"Content protection state changed: %@", v2];
}

- (void)_endMonitoringForContentProtectionStatus
{
  id v3 = [(HDDiagnosticExtension *)self _currentProtectionStateString];
  -[HDDiagnosticExtension _log:](self, "_log:", @"Ending content protection state monitoring; final state is %@",
    v3);
}

- (id)_loadOperationsFromPluginsWithAttachmentDirectoryURL:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NSURL;
  v6 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"/System/Library/Health/DiagnosticExtensionPlugins/"];
  objc_super v7 = [v5 fileURLWithPath:v6];

  v8 = (void *)MEMORY[0x263F0A5F0];
  v29[0] = &unk_26DD952C0;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  id v27 = 0;
  v10 = [v8 loadPrincipalClassesConformingToProtocols:v9 fromBundlesInDirectoryAtURL:v7 skipLoadedBundles:0 error:&v27];
  id v11 = v27;

  if (v10)
  {
    id v21 = v11;
    v22 = self;
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = objc_alloc_init(*(Class *)(*((void *)&v23 + 1) + 8 * i));
          v19 = [v18 diagnosticOperationsWithAttachmentDirectoryURL:v4];
          [v12 addObjectsFromArray:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    -[HDDiagnosticExtension _log:](v22, "_log:", @"Loaded %ld diagnostic operations from %ld plugins", [v12 count], objc_msgSend(v13, "count"));
    id v11 = v21;
  }
  else
  {
    [(HDDiagnosticExtension *)self _log:@"Unable to load diagnostic operation plugin classes: %@", v11];
    id v12 = (id)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (void)_log:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  v6 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v12];

  p_logLocuint64_t k = &self->_logLock;
  os_unfair_lock_lock(&self->_logLock);
  [(NSMutableString *)self->_collectionLog appendFormat:@"[%0.3lf] %@\n", Current - self->_captureStartTime, v6];
  _HKInitializeLogging();
  v8 = *MEMORY[0x263F098F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_22943A000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  os_unfair_lock_unlock(p_logLock);
}

- (BOOL)_captureLog
{
  id v3 = [(NSURL *)self->_temporaryDirectoryURL URLByAppendingPathComponent:@"HDDiagnosticExtension.log" isDirectory:0];
  p_logLocuint64_t k = &self->_logLock;
  os_unfair_lock_lock(&self->_logLock);
  id v5 = (void *)[(NSMutableString *)self->_collectionLog copy];
  os_unfair_lock_unlock(p_logLock);
  id v10 = 0;
  char v6 = [v5 writeToURL:v3 atomically:1 encoding:4 error:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x263F098F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098F8], OS_LOG_TYPE_ERROR)) {
      [(HDDiagnosticExtension *)v8 _captureLog];
    }
  }

  return v6;
}

- (id)_generateTemporaryAttachmentDirectory
{
  id v2 = [MEMORY[0x263F0A980] sharedBehavior];
  id v3 = NSString;
  id v4 = [v2 currentDeviceDisplayName];
  id v5 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  char v6 = [v5 invertedSet];
  id v7 = objc_msgSend(v4, "hk_stringByRemovingCharactersInSet:", v6);
  v8 = [v2 currentDeviceClass];
  v9 = [v2 currentInternalDeviceModel];
  id v10 = [v2 currentOSBuild];
  uint64_t v11 = [v3 stringWithFormat:@"HealthKitDiagnostics_%@_%@_%@_%@.XXXXXX", v7, v8, v9, v10];

  uint64_t v12 = NSTemporaryDirectory();
  id v13 = [v12 stringByAppendingPathComponent:v11];

  id v14 = v13;
  uint64_t v15 = strdup((const char *)[v14 UTF8String]);
  uint64_t v16 = [NSString stringWithUTF8String:mkdtemp(v15)];
  uint64_t v17 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v16 isDirectory:1];
  free(v15);

  return v17;
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (BOOL)allowsSensitiveAttachments
{
  return self->_allowsSensitiveAttachments;
}

- (NSMutableString)collectionLog
{
  return self->_collectionLog;
}

- (void)setCollectionLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionLog, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
}

- (void)_captureLog
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a1;
  char v6 = [a2 path];
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_22943A000, v5, OS_LOG_TYPE_ERROR, "Error writing %@: %@", (uint8_t *)&v7, 0x16u);
}

@end