@interface PFCloudKitSetupAssistant
- (PFCloudKitSetupAssistant)initWithSetupRequest:(id)a3 mirroringOptions:(id)a4 observedStore:(id)a5;
- (uint64_t)_deleteZone:(void *)a3 error:;
- (uint64_t)_initializeCloudKitForObservedStore:(unsigned char *)a3 andNoteMetadataInitialization:;
- (uint64_t)_saveZone:(void *)a3 error:;
- (void)beginActivityForPhase:(uint64_t)a1;
- (void)dealloc;
- (void)endActivityForPhase:(uint64_t)a3 withError:;
@end

@implementation PFCloudKitSetupAssistant

- (PFCloudKitSetupAssistant)initWithSetupRequest:(id)a3 mirroringOptions:(id)a4 observedStore:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PFCloudKitSetupAssistant;
  v8 = [(PFCloudKitSetupAssistant *)&v11 init];
  if (v8)
  {
    v8->_setupRequest = (NSCloudKitMirroringDelegateSetupRequest *)a3;
    v8->_cloudKitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v9 = (NSCloudKitMirroringDelegateOptions *)a4;
    v8->_mirroringOptions = v9;
    if (v9) {
      v9 = (NSCloudKitMirroringDelegateOptions *)v9->_storeMonitorProvider;
    }
    v8->_storeMonitor = (PFCloudKitStoreMonitor *)-[PFCloudKitStoreMonitorProvider createMonitorForObservedStore:inTransactionWithLabel:]((uint64_t)v9, (uint64_t)a5);
  }
  return v8;
}

- (void)dealloc
{
  self->_container = 0;
  self->_database = 0;

  self->_databaseSubscription = 0;
  self->_largeBlobDirectoryURL = 0;

  self->_currentUserRecordID = 0;
  cloudKitSemaphore = self->_cloudKitSemaphore;
  if (cloudKitSemaphore) {
    dispatch_release(cloudKitSemaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitSetupAssistant;
  [(PFCloudKitSetupAssistant *)&v4 dealloc];
}

- (uint64_t)_initializeCloudKitForObservedStore:(unsigned char *)a3 andNoteMetadataInitialization:
{
  uint64_t v280 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = *(void *)(result + 8);
  if (v6) {
    BOOL v7 = *(unsigned char *)(v6 + 12) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v227 = 0;
  uint64_t v228 = (uint64_t)&v227;
  uint64_t v229 = 0x2020000000;
  LOBYTE(v230) = 1;
  *(void *)v246 = 0;
  uint64_t v247 = (uint64_t)v246;
  uint64_t v248 = 0x3052000000;
  v249 = __Block_byref_object_copy__26;
  v250 = __Block_byref_object_dispose__26;
  v251 = 0;
  -[PFCloudKitSetupAssistant beginActivityForPhase:](result, 1);
  uint64_t v8 = *(void *)(v5 + 56);
  *(void *)v259 = MEMORY[0x1E4F143A8];
  *(void *)&v259[8] = 3221225472;
  *(void *)&v259[16] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke;
  v260 = &unk_1E544BB50;
  v261 = (void *)v8;
  v262 = (uint64_t *)v5;
  v263 = &v227;
  v264 = v246;
  -[PFCloudKitStoreMonitor performBlock:](v8, (uint64_t)v259);
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 1, *(void *)(v247 + 40));
  if (*(unsigned char *)(v228 + 24)) {
    goto LABEL_5;
  }
  v9 = (__CFString *)*(id *)(v247 + 40);
  if (!v9)
  {
    uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v28 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 187;
      _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
LABEL_5:
    v9 = 0;
  }

  *(void *)(v247 + 40) = 0;
  int v10 = *(unsigned __int8 *)(v228 + 24);
  _Block_object_dispose(v246, 8);
  _Block_object_dispose(&v227, 8);
  if (!v10)
  {
LABEL_70:
    v12 = v9;
    goto LABEL_71;
  }
  *a3 = 1;
  if (v7) {
    goto LABEL_9;
  }
  *(void *)v239 = 0;
  *(void *)&v239[8] = v239;
  *(void *)&v239[16] = 0x2020000000;
  LOBYTE(v240) = 1;
  uint64_t v227 = 0;
  uint64_t v228 = (uint64_t)&v227;
  uint64_t v229 = 0x3052000000;
  v230 = __Block_byref_object_copy__26;
  v231 = __Block_byref_object_dispose__26;
  v232 = 0;
  v13 = *(void **)(v5 + 8);
  if (v13) {
    v14 = (void *)v13[10];
  }
  else {
    v14 = 0;
  }
  id v15 = (id)objc_msgSend(v14, "containerWithIdentifier:options:", objc_msgSend(v13, "containerIdentifier"), objc_msgSend(*(id *)(v5 + 8), "containerOptions"));
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v5, 2);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  uint64_t v277 = 0;
  v16 = (void (*)(uint64_t))*(id *)(v5 + 56);
  *(void *)v246 = MEMORY[0x1E4F143A8];
  uint64_t v247 = 3221225472;
  uint64_t v248 = (uint64_t)__48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke;
  v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DAD8;
  v250 = v16;
  v251 = &v227;
  v252 = (uint64_t *)buf;
  v253 = v239;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v16, (uint64_t)v246);
  if (*(unsigned char *)(*(void *)&v239[8] + 24))
  {
    if (v15)
    {
      v17 = *(NSObject **)(v5 + 48);
      char v18 = [*(id *)(v5 + 8) useDeviceToDeviceEncryption];
      v19 = *(void **)(v5 + 56);
      if (v19) {
        v19 = (void *)v19[6];
      }
      v20 = v19;
      *(void *)v259 = MEMORY[0x1E4F143A8];
      *(void *)&v259[8] = 3221225472;
      *(void *)&v259[16] = __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_38;
      v260 = &unk_1E544DB28;
      LOBYTE(v267) = v18;
      uint64_t v265 = (uint64_t)buf;
      uint64_t v266 = (uint64_t)&v227;
      v261 = v20;
      v262 = (uint64_t *)v5;
      v263 = (uint64_t *)v17;
      v264 = v239;
      [v15 accountInfoWithCompletionHandler:v259];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      *(unsigned char *)(*(void *)&v239[8] + 24) = 0;
      v30 = (void *)MEMORY[0x1E4F28C58];
      *(void *)v272 = *MEMORY[0x1E4F28588];
      v31 = NSString;
      uint64_t v226 = [*(id *)(v5 + 8) containerIdentifier];
      *(void *)v259 = [v31 stringWithFormat:@"Failed to get a container back for the identifier: %@"];
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v259 forKeys:v272 count:1];
      id v33 = (id)[v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:134400 userInfo:v32];
      *(void *)(v228 + 40) = v33;
    }
  }
  *(void *)(v5 + 16) = v15;
  if (*(unsigned char *)(*(void *)&v239[8] + 24))
  {
    uint64_t v34 = [*(id *)(v5 + 8) databaseScope];
    switch(v34)
    {
      case 3:
        id v35 = (id)[*(id *)(v5 + 16) sharedCloudDatabase];
        break;
      case 2:
        id v35 = (id)[*(id *)(v5 + 16) privateCloudDatabase];
        break;
      case 1:
        id v35 = (id)[*(id *)(v5 + 16) publicCloudDatabase];
        break;
      default:
        *(unsigned char *)(*(void *)&v239[8] + 24) = 0;
        v44 = (void *)MEMORY[0x1E4F28C58];
        *(void *)v237 = *MEMORY[0x1E4F28588];
        v45 = NSString;
        uint64_t v226 = softLinkCKDatabaseScopeString([*(id *)(v5 + 8) databaseScope]);
        uint64_t v268 = [v45 stringWithFormat:@"CloudKit integration does not support the '%@' database scope."];
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:v237 count:1];
        id v47 = (id)[v44 errorWithDomain:*MEMORY[0x1E4F281F8] code:134400 userInfo:v46];
        *(void *)(v228 + 40) = v47;
        goto LABEL_36;
    }
    *(void *)(v5 + 24) = v35;
LABEL_36:
    if (*(unsigned char *)(*(void *)&v239[8] + 24) && !*(void *)(v5 + 24))
    {
      *(unsigned char *)(*(void *)&v239[8] + 24) = 0;
      v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v258 = *MEMORY[0x1E4F28588];
      v49 = NSString;
      uint64_t v226 = softLinkCKDatabaseScopeString([*(id *)(v5 + 8) databaseScope]);
      *(void *)v243 = [v49 stringWithFormat:@"Failed to get a database back for scope '%@' from container: %@"];
      uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:&v258 count:1];
      id v51 = (id)[v48 errorWithDomain:*MEMORY[0x1E4F281F8] code:134400 userInfo:v50];
      *(void *)(v228 + 40) = v51;
    }
  }
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 2, *(void *)(v228 + 40));
  if (*(unsigned char *)(*(void *)&v239[8] + 24))
  {
LABEL_40:
    v12 = v9;
    goto LABEL_42;
  }
  v12 = (__CFString *)*(id *)(v228 + 40);
  if (!v12)
  {
    uint64_t v90 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v97 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v278 = 136315394;
      *(void *)&v278[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v278[12] = 1024;
      *(_DWORD *)&v278[14] = 479;
      _os_log_fault_impl(&dword_18AB82000, v97, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v278, 0x12u);
    }
    goto LABEL_40;
  }
LABEL_42:

  *(void *)(*(void *)&buf[8] + 40) = 0;
  *(void *)(v228 + 40) = 0;
  int v52 = *(unsigned __int8 *)(*(void *)&v239[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v227, 8);
  _Block_object_dispose(v239, 8);
  if (!v52) {
    goto LABEL_71;
  }
  *(void *)v278 = 0;
  *(void *)&v278[8] = v278;
  *(void *)&v278[16] = 0x2020000000;
  char v279 = 0;
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v5, 3);
  uint64_t v227 = 0;
  uint64_t v228 = (uint64_t)&v227;
  uint64_t v229 = 0x3052000000;
  v230 = __Block_byref_object_copy__26;
  v231 = __Block_byref_object_dispose__26;
  v232 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  uint64_t v277 = 0;
  v53 = *(void **)(v5 + 56);
  if (v53) {
    v53 = (void *)v53[6];
  }
  v54 = *(NSObject **)(v5 + 48);
  v55 = v53;
  v56 = *(void **)(v5 + 16);
  *(void *)v259 = MEMORY[0x1E4F143A8];
  *(void *)&v259[8] = 3221225472;
  *(void *)&v259[16] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke;
  v260 = &unk_1E544DD80;
  v263 = (uint64_t *)v278;
  v264 = (uint8_t *)&v227;
  uint64_t v265 = (uint64_t)buf;
  v261 = v55;
  v262 = (uint64_t *)v54;
  [v56 fetchUserRecordIDWithCompletionHandler:v259];
  dispatch_semaphore_wait(v54, 0xFFFFFFFFFFFFFFFFLL);
  v57 = (void (*)(uint64_t))*(id *)(v5 + 56);
  if (*(unsigned char *)(*(void *)&v278[8] + 24))
  {
    *(void *)(v5 + 80) = *(id *)(v228 + 40);
    *(void *)v246 = MEMORY[0x1E4F143A8];
    uint64_t v247 = 3221225472;
    uint64_t v248 = (uint64_t)__47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DDF8;
    v250 = v57;
    v251 = (uint64_t *)v5;
    v252 = &v227;
    v253 = v278;
    uint64_t v254 = (uint64_t)buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v57, (uint64_t)v246);
    v58 = *(void **)(*(void *)&buf[8] + 40);
    if (!v58)
    {
      v9 = 0;
      goto LABEL_55;
    }
    goto LABEL_53;
  }
  v59 = (void *)[*(id *)(*(void *)&buf[8] + 40) domain];
  if (![v59 isEqualToString:getCloudKitCKErrorDomain[0]()]
    || [*(id *)(*(void *)&buf[8] + 40) code] != 9)
  {
    v60 = (void *)MEMORY[0x18C127630]();
    uint64_t v61 = __ckLoggingOverride;
    uint64_t v62 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Identity fetch failed with unknown error: %@"];
    _NSCoreDataLog(v61 != 0, v62, v63, v64, v65, v66, v67, v68, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]");
    v58 = *(void **)(*(void *)&buf[8] + 40);
    if (!v58)
    {
      uint64_t v114 = [NSString stringWithUTF8String:"Identity fetch failed but did not set an error."];
      _NSCoreDataLog(17, v114, v115, v116, v117, v118, v119, v120, v226);
      v121 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v246 = 0;
        _os_log_fault_impl(&dword_18AB82000, v121, OS_LOG_TYPE_FAULT, "CoreData: Identity fetch failed but did not set an error.", v246, 2u);
      }
      v122 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v123 = *(void *)(*(void *)&buf[8] + 40);
      if (v123)
      {
        *(void *)v272 = *MEMORY[0x1E4F28A50];
        *(void *)v246 = v123;
        uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v246 forKeys:v272 count:1];
      }
      else
      {
        uint64_t v124 = 0;
      }
      v69 = (__CFString *)[v122 errorWithDomain:*MEMORY[0x1E4F281F8] code:134400 userInfo:v124];
      goto LABEL_54;
    }
LABEL_53:
    v69 = v58;
LABEL_54:
    v9 = v69;
    goto LABEL_55;
  }
  *(void *)v239 = 0;
  *(void *)&v239[8] = v239;
  *(void *)&v239[16] = 0x3052000000;
  v240 = __Block_byref_object_copy__26;
  v241 = __Block_byref_object_dispose__26;
  uint64_t v242 = 0;
  *(void *)v246 = MEMORY[0x1E4F143A8];
  uint64_t v247 = 3221225472;
  uint64_t v248 = (uint64_t)__47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_151;
  v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DDF8;
  v252 = (uint64_t *)v278;
  v253 = v239;
  v250 = v57;
  v251 = (uint64_t *)v5;
  uint64_t v254 = (uint64_t)buf;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v57, (uint64_t)v246);
  if (*(unsigned char *)(*(void *)&v278[8] + 24)) {
    v9 = 0;
  }
  else {
    v9 = (__CFString *)*(id *)(*(void *)&v239[8] + 40);
  }

  *(void *)(*(void *)&v239[8] + 40) = 0;
  _Block_object_dispose(v239, 8);
LABEL_55:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 3, (uint64_t)v9);
  if (*(unsigned char *)(*(void *)&v278[8] + 24))
  {
LABEL_56:
    v9 = v12;
    goto LABEL_58;
  }
  if (!v9)
  {
    uint64_t v106 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v106, v107, v108, v109, v110, v111, v112, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v113 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v239 = 136315394;
      *(void *)&v239[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v239[12] = 1024;
      *(_DWORD *)&v239[14] = 1631;
      _os_log_fault_impl(&dword_18AB82000, v113, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v239, 0x12u);
    }
    goto LABEL_56;
  }
LABEL_58:

  *(void *)(v228 + 40) = 0;
  *(void *)(*(void *)&buf[8] + 40) = 0;

  int v70 = *(unsigned __int8 *)(*(void *)&v278[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v227, 8);
  _Block_object_dispose(v278, 8);
  if (!v70) {
    goto LABEL_70;
  }
  uint64_t v268 = 0;
  v269 = &v268;
  uint64_t v270 = 0x2020000000;
  char v271 = 1;
  v257 = 0;
  *(void *)v239 = 0;
  *(void *)&v239[8] = v239;
  *(void *)&v239[16] = 0x3052000000;
  v240 = __Block_byref_object_copy__26;
  v241 = __Block_byref_object_dispose__26;
  uint64_t v242 = 0;
  v71 = (void (*)(uint64_t))*(id *)(v5 + 56);
  *(void *)v237 = 0;
  *(void *)&v237[8] = v237;
  *(void *)&v237[16] = 0x2020000000;
  char v238 = 0;
  uint64_t v72 = [*(id *)(v5 + 8) databaseScope];
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v5, 4);
  *(void *)v278 = 0;
  *(void *)&v278[8] = v278;
  *(void *)&v278[16] = 0x2020000000;
  char v279 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  uint64_t v277 = 0;
  uint64_t v73 = [*(id *)(v5 + 8) databaseScope];
  if (v73 == 3)
  {
    v98 = (uint64_t *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v99 = (uint64_t *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v100 = (void (*)(uint64_t))*(id *)(v5 + 56);
    *(void *)v246 = MEMORY[0x1E4F143A8];
    uint64_t v247 = 3221225472;
    uint64_t v248 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_90;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DB78;
    uint64_t v254 = 3;
    v252 = (uint64_t *)buf;
    v253 = v278;
    v250 = v100;
    v251 = v99;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v100, (uint64_t)v246);

    if (!*(void *)(*(void *)&buf[8] + 40) && [v99 count])
    {
      v101 = dispatch_semaphore_create(0);
      v102 = objc_msgSend(objc_alloc(getCloudKitCKModifyRecordsOperationClass()), "initWithRecordsToSave:recordIDsToDelete:", 0, objc_msgSend(v99, "allObjects"));
      -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(v5 + 72) options], v102);
      [v102 setMarkAsParticipantNeedsNewInvitationToken:1];
      uint64_t v227 = MEMORY[0x1E4F143A8];
      uint64_t v228 = 3221225472;
      uint64_t v229 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3_95;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E544DBF0;
      v233 = buf;
      v231 = (void (*)(uint64_t))v101;
      v232 = v278;
      [v102 setModifyRecordsCompletionBlock:&v227];
      [*(id *)(v5 + 24) addOperation:v102];

      dispatch_semaphore_wait(v101, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v101);
    }
    if (!*(void *)(*(void *)&buf[8] + 40) && [v98 count])
    {
      v103 = *(id *)(v5 + 56);
      *(void *)v259 = MEMORY[0x1E4F143A8];
      *(void *)&v259[8] = 3221225472;
      *(void *)&v259[16] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4_99;
      v260 = &unk_1E544DB50;
      v261 = v103;
      v262 = v98;
      uint64_t v265 = (uint64_t)v278;
      uint64_t v266 = 3;
      v263 = (uint64_t *)v5;
      v264 = buf;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v103, (uint64_t)v259);
    }
    v104 = *(void **)(*(void *)&buf[8] + 40);
    if (v104)
    {
      v105 = v104;
      if (v105)
      {
        v257 = v105;
      }
      else
      {
        uint64_t v133 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v133, v134, v135, v136, v137, v138, v139, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
        v140 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v272 = 136315394;
          *(void *)&v272[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKi"
                                "tSetupAssistant.m";
          *(_WORD *)&v272[12] = 1024;
          *(_DWORD *)&v272[14] = 770;
          _os_log_fault_impl(&dword_18AB82000, v140, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v272, 0x12u);
        }
      }
      goto LABEL_100;
    }
  }
  else if (v73 == 2)
  {
    v74 = (uint64_t *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v75 = (void (*)(uint64_t))*(id *)(v5 + 56);
    *(void *)v246 = MEMORY[0x1E4F143A8];
    uint64_t v247 = 3221225472;
    uint64_t v248 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke;
    v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DB78;
    uint64_t v254 = 2;
    v252 = (uint64_t *)buf;
    v253 = v278;
    v250 = v75;
    v251 = v74;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v75, (uint64_t)v246);

    if (!*(void *)(*(void *)&buf[8] + 40) && [v74 count])
    {
      uint64_t v76 = [v74 allObjects];
      v77 = dispatch_semaphore_create(0);
      v78 = (void *)[objc_alloc(getCloudKitCKModifyRecordZonesOperationClass()) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v76];
      -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(v5 + 72) options], v78);
      uint64_t v227 = MEMORY[0x1E4F143A8];
      uint64_t v228 = 3221225472;
      uint64_t v229 = (uint64_t)__71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E544DBA0;
      v233 = v278;
      v234 = (uint64_t *)buf;
      v231 = (void (*)(uint64_t))v76;
      v232 = v77;
      [v78 setModifyRecordZonesCompletionBlock:&v227];
      [*(id *)(v5 + 24) addOperation:v78];

      dispatch_semaphore_wait(v77, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v77);
    }
    if (!*(void *)(*(void *)&buf[8] + 40) && [v74 count])
    {
      v79 = *(id *)(v5 + 56);
      *(void *)v259 = MEMORY[0x1E4F143A8];
      *(void *)&v259[8] = 3221225472;
      *(void *)&v259[16] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4;
      v260 = &unk_1E544DB50;
      v261 = v79;
      v262 = v74;
      uint64_t v265 = (uint64_t)v278;
      uint64_t v266 = 2;
      v263 = (uint64_t *)v5;
      v264 = buf;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v79, (uint64_t)v259);
    }
    v80 = *(void **)(*(void *)&buf[8] + 40);
    if (v80)
    {
      v81 = v80;
      if (v81)
      {
        v257 = v81;
      }
      else
      {
        uint64_t v125 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v125, v126, v127, v128, v129, v130, v131, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
        v132 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v272 = 136315394;
          *(void *)&v272[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKi"
                                "tSetupAssistant.m";
          *(_WORD *)&v272[12] = 1024;
          *(_DWORD *)&v272[14] = 630;
          _os_log_fault_impl(&dword_18AB82000, v132, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v272, 0x12u);
        }
      }
LABEL_100:

      *(void *)(*(void *)&buf[8] + 40) = 0;
    }
  }
  int v141 = *(unsigned __int8 *)(*(void *)&v278[8] + 24);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v278, 8);
  v142 = v269;
  *((unsigned char *)v269 + 24) = v141;
  if (v141)
  {
    if ((unint64_t)(v72 - 1) > 1)
    {
      *(unsigned char *)(*(void *)&v237[8] + 24) = 1;
    }
    else
    {
      uint64_t v227 = MEMORY[0x1E4F143A8];
      uint64_t v228 = 3221225472;
      uint64_t v229 = (uint64_t)__51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke;
      v230 = (void (*)(uint64_t, uint64_t))&unk_1E544DC40;
      v231 = v71;
      v232 = (unsigned char *)v5;
      v233 = v237;
      v234 = &v268;
      v235 = v239;
      uint64_t v236 = v72;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v71, (uint64_t)&v227);
      v142 = v269;
    }
  }
  if (*((unsigned char *)v142 + 24) && !*(unsigned char *)(*(void *)&v237[8] + 24))
  {
    *((unsigned char *)v142 + 24) = 0;
    if (v72 == 3)
    {
      *((unsigned char *)v142 + 24) = 1;
      goto LABEL_107;
    }
    if (v72 != 2)
    {
      id v162 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:v72];
      v163 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:v162];
      *(void *)v278 = 0;
      *(void *)&v278[8] = v278;
      *(void *)&v278[16] = 0x2020000000;
      char v279 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v275 = __Block_byref_object_copy__26;
      v276 = __Block_byref_object_dispose__26;
      uint64_t v277 = 0;
      uint64_t v164 = [*(id *)(v5 + 8) databaseScope];
      v165 = *(NSObject **)(v5 + 48);
      id v166 = objc_alloc(getCloudKitCKFetchRecordZonesOperationClass());
      uint64_t v258 = [v163 zoneID];
      v167 = objc_msgSend(v166, "initWithRecordZoneIDs:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v258, 1));
      -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(v5 + 72) options], v167);
      *(void *)v272 = 0;
      *(void *)&v272[8] = v272;
      *(void *)&v272[16] = 0x2020000000;
      uint64_t v273 = 0;
      *(void *)v259 = MEMORY[0x1E4F143A8];
      *(void *)&v259[8] = 3221225472;
      *(void *)&v259[16] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke;
      v260 = &unk_1E544DC90;
      v263 = (uint64_t *)buf;
      v264 = v278;
      uint64_t v265 = (uint64_t)v272;
      uint64_t v266 = v164;
      v261 = v163;
      v262 = (uint64_t *)v165;
      [v167 setFetchRecordZonesCompletionBlock:v259];
      [*(id *)(v5 + 24) addOperation:v167];
      dispatch_semaphore_wait(v165, 0xFFFFFFFFFFFFFFFFLL);
      if (*(unsigned char *)(*(void *)&v278[8] + 24))
      {
        v168 = (void (*)(uint64_t))*(id *)(v5 + 56);
        *(void *)v246 = MEMORY[0x1E4F143A8];
        uint64_t v247 = 3221225472;
        uint64_t v248 = (uint64_t)__53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_112;
        v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DC40;
        v250 = v168;
        v251 = (uint64_t *)v163;
        v252 = (uint64_t *)v272;
        v253 = v278;
        uint64_t v254 = (uint64_t)buf;
        uint64_t v255 = v164;
        -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v168, (uint64_t)v246);
      }
      else if (v164 == 1 && [*(id *)(*(void *)&buf[8] + 40) code] == 9)
      {
        v180 = (void *)[*(id *)(*(void *)&buf[8] + 40) domain];
        if ([v180 isEqualToString:getCloudKitCKErrorDomain[0]()])
        {
          v181 = objc_msgSend((id)objc_msgSend(v163, "zoneID"), "zoneName");
          if (([v181 isEqualToString:getCloudKitCKRecordZoneDefaultName[0]()] & 1) == 0)
          {
            uint64_t v182 = [NSString stringWithUTF8String:"Custom zones aren't supported yet with the public database."];
            _NSCoreDataLog(17, v182, v183, v184, v185, v186, v187, v188, v226);
            v189 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v246 = 0;
              _os_log_fault_impl(&dword_18AB82000, v189, OS_LOG_TYPE_FAULT, "CoreData: Custom zones aren't supported yet with the public database.", v246, 2u);
            }
          }
          *(unsigned char *)(*(void *)&v278[8] + 24) = 1;

          *(void *)(*(void *)&buf[8] + 40) = 0;
          v190 = (void (*)(uint64_t))*(id *)(v5 + 56);
          *(void *)v246 = MEMORY[0x1E4F143A8];
          uint64_t v247 = 3221225472;
          uint64_t v248 = (uint64_t)__53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_114;
          v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DCB8;
          v250 = v190;
          v251 = (uint64_t *)v163;
          uint64_t v254 = 1;
          v252 = (uint64_t *)v278;
          v253 = buf;
          -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v190, (uint64_t)v246);
        }
      }

      if (!*(unsigned char *)(*(void *)&v278[8] + 24))
      {
        v191 = (__CFString *)*(id *)(*(void *)&buf[8] + 40);
        if (v191)
        {
          v257 = v191;
        }
        else
        {
          uint64_t v204 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v204, v205, v206, v207, v208, v209, v210, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
          v211 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v243 = 136315394;
            *(void *)&v243[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloud"
                                  "KitSetupAssistant.m";
            __int16 v244 = 1024;
            int v245 = 1170;
            _os_log_fault_impl(&dword_18AB82000, v211, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v243, 0x12u);
          }
        }
      }

      *(void *)(*(void *)&buf[8] + 40) = 0;
      char v212 = *(unsigned char *)(*(void *)&v278[8] + 24);
      _Block_object_dispose(v272, 8);
      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v278, 8);
      *((unsigned char *)v269 + 24) = v212;

      goto LABEL_107;
    }
    id v150 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:2];
    v151 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:v150];
    if (-[PFCloudKitSetupAssistant _saveZone:error:](v5, (uint64_t)v151, &v257))
    {
      *((unsigned char *)v269 + 24) = 1;
LABEL_185:

      goto LABEL_107;
    }
    v177 = v257;
    v178 = (void *)[(__CFString *)v257 domain];
    if ([v178 isEqualToString:getCloudKitCKErrorDomain[0]()])
    {
      if ([(__CFString *)v177 code] == 112) {
        goto LABEL_149;
      }
      if ([(__CFString *)v177 code] == 2)
      {
        v213 = (void *)[(__CFString *)v177 userInfo];
        v214 = objc_msgSend((id)objc_msgSend(v213, "objectForKey:", getCloudKitCKPartialErrorsByItemIDKey()), "objectForKey:", objc_msgSend(v151, "zoneID"));
        v215 = (void *)[v214 domain];
        if ([v215 isEqualToString:getCloudKitCKErrorDomain[0]()])
        {
          if ([v214 code] == 112)
          {
LABEL_149:
            *(void *)v259 = 0;
            if ((-[PFCloudKitSetupAssistant _deleteZone:error:](v5, v151, v259) & 1) == 0)
            {
              int v179 = *((unsigned __int8 *)v269 + 24);
              goto LABEL_181;
            }
LABEL_150:
            int v179 = -[PFCloudKitSetupAssistant _saveZone:error:](v5, (uint64_t)v151, v259);
            *((unsigned char *)v269 + 24) = v179;
LABEL_181:
            if (v179)
            {
              v216 = 0;
            }
            else
            {
              v217 = (void *)MEMORY[0x18C127630]();
              uint64_t v218 = __ckLoggingOverride;
              uint64_t v219 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ unable to recover from error: %@\nEncountered subsequent error: %@"];
              _NSCoreDataLog(v218 != 0, v219, v220, v221, v222, v223, v224, v225, (uint64_t)"-[PFCloudKitSetupAssistant _createZoneIfNecessary:]");
              v216 = *(__CFString **)v259;
            }
            v257 = v216;
            goto LABEL_185;
          }
          if ([v214 code] == 14)
          {
            *(void *)v259 = 0;
            goto LABEL_150;
          }
        }
      }
    }
    *((unsigned char *)v269 + 24) = 0;
    goto LABEL_185;
  }
LABEL_107:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 4, *(void *)(*(void *)&v239[8] + 40));
  if (*((unsigned char *)v269 + 24))
  {
LABEL_108:
    v12 = v9;
    goto LABEL_109;
  }
  v146 = *(void **)(*(void *)&v239[8] + 40);
  if (v146)
  {
    v12 = v146;
    v257 = v12;
    if (!v12)
    {
LABEL_123:
      uint64_t v152 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v152, v153, v154, v155, v156, v157, v158, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v159 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v259 = 136315394;
        *(void *)&v259[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        *(_WORD *)&v259[12] = 1024;
        *(_DWORD *)&v259[14] = 897;
        _os_log_fault_impl(&dword_18AB82000, v159, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v259, 0x12u);
      }
      goto LABEL_108;
    }
  }
  else
  {
    v12 = v257;
    if (!v257) {
      goto LABEL_123;
    }
  }
LABEL_109:

  *(void *)(*(void *)&v239[8] + 40) = 0;
  int v143 = *((unsigned __int8 *)v269 + 24);
  _Block_object_dispose(v237, 8);
  _Block_object_dispose(v239, 8);
  _Block_object_dispose(&v268, 8);
  if (!v143) {
    goto LABEL_71;
  }
  *(void *)v239 = 0;
  *(void *)&v239[8] = v239;
  *(void *)&v239[16] = 0x2020000000;
  LOBYTE(v240) = 1;
  *(void *)v278 = 0;
  *(void *)&v278[8] = v278;
  *(void *)&v278[16] = 0x2020000000;
  char v279 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v275 = __Block_byref_object_copy__26;
  v276 = __Block_byref_object_dispose__26;
  uint64_t v277 = 0;
  *(void *)v272 = 0;
  *(void *)&v272[8] = v272;
  *(void *)&v272[16] = 0x2020000000;
  LOBYTE(v273) = 0;
  uint64_t v268 = 0;
  v269 = &v268;
  uint64_t v270 = 0x2020000000;
  char v271 = 0;
  uint64_t v144 = [*(id *)(v5 + 8) databaseScope];
  if (v144 == 1)
  {
    BOOL v145 = 1;
    goto LABEL_167;
  }
  -[PFCloudKitSetupAssistant beginActivityForPhase:](v5, 5);
  v147 = *(id *)(v5 + 56);
  v148 = v147;
  if (v144 == 3)
  {
    *(void *)v259 = MEMORY[0x1E4F143A8];
    *(void *)&v259[8] = 3221225472;
    *(void *)&v259[16] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_3;
    v260 = &unk_1E544DD30;
    uint64_t v265 = 3;
    v261 = v147;
    v262 = (uint64_t *)v272;
    v263 = (uint64_t *)v239;
    v264 = buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v147, (uint64_t)v259);
  }
  else if (v144 == 2)
  {
    v149 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:2];
    *(void *)v259 = MEMORY[0x1E4F143A8];
    *(void *)&v259[8] = 3221225472;
    *(void *)&v259[16] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke;
    v260 = &unk_1E544DD08;
    v261 = v148;
    v262 = (uint64_t *)v149;
    uint64_t v267 = 2;
    v263 = &v268;
    v264 = v272;
    uint64_t v265 = (uint64_t)v239;
    uint64_t v266 = (uint64_t)buf;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v148, (uint64_t)v259);
  }
  if (*(unsigned char *)(*(void *)&v239[8] + 24))
  {
    uint64_t v160 = [*(id *)(v5 + 8) databaseScope];
    switch(v160)
    {
      case 1:
        v161 = PFPublicDatabaseSubscriptionID;
        break;
      case 2:
        v161 = PFPrivateDatabaseSubscriptionID;
        break;
      case 3:
        v161 = PFSharedDatabaseSubscriptionID;
        break;
      default:
        *(unsigned char *)(*(void *)&v239[8] + 24) = 0;
        id v170 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v258 = *MEMORY[0x1E4F28588];
        *(void *)v243 = [NSString stringWithFormat:@"CloudKit integration does not support the '%@' database scope.", softLinkCKDatabaseScopeString(objc_msgSend(*(id *)(v5 + 8), "databaseScope"))];
        uint64_t v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:&v258 count:1];
        uint64_t v172 = [v170 initWithDomain:*MEMORY[0x1E4F281F8] code:134400 userInfo:v171];
        v169 = 0;
        *(void *)(*(void *)&buf[8] + 40) = v172;
LABEL_142:
        if (*(unsigned char *)(*(void *)&v239[8] + 24))
        {
          *(void *)(v5 + 32) = [objc_alloc((Class)getCloudKitCKDatabaseSubscriptionClass[0]()) initWithSubscriptionID:v169];
          id v173 = objc_alloc_init((Class)getCloudKitCKNotificationInfoClass[0]());
          [v173 setShouldSendContentAvailable:1];
          [*(id *)(v5 + 32) setNotificationInfo:v173];

          if (*(unsigned char *)(*(void *)&v272[8] + 24))
          {
            *(unsigned char *)(*(void *)&v239[8] + 24) = 1;
          }
          else
          {
            *(unsigned char *)(*(void *)&v239[8] + 24) = 0;
            v174 = (void (*)(uint64_t))*(id *)(v5 + 32);
            v175 = *(NSObject **)(v5 + 48);
            if (*((unsigned char *)v269 + 24))
            {
              v257 = @"com.apple.coredata.cloudkit.zone.subscription";
              uint64_t v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v257 count:1];
            }
            else
            {
              uint64_t v176 = 0;
            }
            id v192 = objc_alloc(getCloudKitCKModifySubscriptionsOperationClass());
            v256 = v174;
            v193 = objc_msgSend(v192, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v256, 1), v176);
            -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(v5 + 72) options], v193);
            *(void *)v246 = MEMORY[0x1E4F143A8];
            uint64_t v247 = 3221225472;
            uint64_t v248 = (uint64_t)__66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_5;
            v249 = (void (*)(uint64_t, uint64_t))&unk_1E544DD58;
            v252 = (uint64_t *)v239;
            v253 = buf;
            uint64_t v254 = (uint64_t)v278;
            v250 = v174;
            v251 = (uint64_t *)v175;
            [v193 setModifySubscriptionsCompletionBlock:v246];
            [*(id *)(v5 + 24) addOperation:v193];
            dispatch_semaphore_wait(v175, 0xFFFFFFFFFFFFFFFFLL);
            v194 = (void (*)(uint64_t))*(id *)(v5 + 56);
            uint64_t v227 = MEMORY[0x1E4F143A8];
            uint64_t v228 = 3221225472;
            uint64_t v229 = (uint64_t)__66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_131;
            v230 = (void (*)(uint64_t, uint64_t))&unk_1E544DD30;
            v231 = v194;
            v232 = v239;
            v233 = v278;
            v234 = (uint64_t *)buf;
            v235 = (unsigned char *)v144;
            -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v194, (uint64_t)&v227);
          }
        }
        goto LABEL_163;
    }
    v169 = *v161;
    goto LABEL_142;
  }
LABEL_163:
  -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 5, *(void *)(*(void *)&buf[8] + 40));
  if (!*(unsigned char *)(*(void *)&v239[8] + 24))
  {
    v195 = (__CFString *)*(id *)(*(void *)&buf[8] + 40);
    if (v195) {
      goto LABEL_166;
    }
    uint64_t v196 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v196, v197, v198, v199, v200, v201, v202, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v203 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v237 = 136315394;
      *(void *)&v237[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
      *(_WORD *)&v237[12] = 1024;
      *(_DWORD *)&v237[14] = 1427;
      _os_log_fault_impl(&dword_18AB82000, v203, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v237, 0x12u);
    }
  }
  v195 = v12;
LABEL_166:

  *(void *)(*(void *)&buf[8] + 40) = 0;
  BOOL v145 = *(unsigned char *)(*(void *)&v239[8] + 24) != 0;
  v12 = v195;
LABEL_167:
  _Block_object_dispose(&v268, 8);
  _Block_object_dispose(v272, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v278, 8);
  _Block_object_dispose(v239, 8);
  v9 = v12;
  if (v145)
  {
LABEL_9:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v275) = 1;
    *(void *)v246 = 0;
    uint64_t v247 = (uint64_t)v246;
    uint64_t v248 = 0x3052000000;
    v249 = __Block_byref_object_copy__26;
    v250 = __Block_byref_object_dispose__26;
    v251 = 0;
    uint64_t v11 = *(void *)(v5 + 56);
    uint64_t v227 = 0;
    uint64_t v228 = (uint64_t)&v227;
    uint64_t v229 = 0x3052000000;
    v230 = __Block_byref_object_copy__26;
    v231 = __Block_byref_object_dispose__26;
    v232 = 0;
    -[PFCloudKitSetupAssistant beginActivityForPhase:](v5, 6);
    *(void *)v259 = MEMORY[0x1E4F143A8];
    *(void *)&v259[8] = 3221225472;
    *(void *)&v259[16] = __60__PFCloudKitSetupAssistant__initializeAssetStorageURLError___block_invoke;
    v260 = &unk_1E544DAD8;
    v261 = (void *)v11;
    v262 = &v227;
    v263 = (uint64_t *)buf;
    v264 = v246;
    -[PFCloudKitStoreMonitor performBlock:](v11, (uint64_t)v259);
    -[PFCloudKitSetupAssistant endActivityForPhase:withError:](v5, 6, *(void *)(v247 + 40));
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      *(void *)(v5 + 40) = *(id *)(v228 + 40);
    }
    else
    {
      v12 = (__CFString *)*(id *)(v247 + 40);
      if (v12)
      {
LABEL_22:

        *(void *)(v228 + 40) = 0;
        *(void *)(v247 + 40) = 0;
        int v29 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(&v227, 8);
        _Block_object_dispose(v246, 8);
        _Block_object_dispose(buf, 8);
        if (v29) {
          return 1;
        }
        goto LABEL_71;
      }
      uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v43 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v239 = 136315394;
        *(void *)&v239[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        *(_WORD *)&v239[12] = 1024;
        *(_DWORD *)&v239[14] = 275;
        _os_log_fault_impl(&dword_18AB82000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v239, 0x12u);
      }
    }
    v12 = v9;
    goto LABEL_22;
  }
LABEL_71:
  if (v12)
  {
    if (a2)
    {
      result = 0;
      *a2 = v12;
      return result;
    }
  }
  else
  {
    uint64_t v82 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v82, v83, v84, v85, v86, v87, v88, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
    v89 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)v259 = 136315394;
    *(void *)&v259[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
    *(_WORD *)&v259[12] = 1024;
    *(_DWORD *)&v259[14] = 104;
    _os_log_fault_impl(&dword_18AB82000, v89, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v259, 0x12u);
  }
  return 0;
}

- (void)beginActivityForPhase:(uint64_t)a1
{
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    objc_super v4 = *(void **)(v3 + 72);
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = (id)[v4 beginActivityForPhase:a2];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v5);
}

- (void)endActivityForPhase:(uint64_t)a3 withError:
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    id v5 = *(void **)(v4 + 72);
  }
  else {
    id v5 = 0;
  }
  id v6 = (id)[v5 endActivityForPhase:a2 withError:a3];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "progressProvider"), "publishActivity:", v6);
}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke(uint64_t *a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v46 = *MEMORY[0x1E4F28588];
    id v47 = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    *(void *)(*(void *)(a1[7] + 8) + 40) = [v10 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v11];
    goto LABEL_23;
  }
  uint64_t v3 = a1[4];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    uint64_t v5 = a1[4];
  }
  else
  {
    uint64_t v5 = 0;
    id WeakRetained = 0;
  }
  id v6 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v5);
  [(NSManagedObjectContext *)v6 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2;
  v34[3] = &unk_1E544BB28;
  v34[4] = v2;
  v34[5] = v6;
  v34[6] = a1[5];
  [(NSManagedObjectContext *)v6 performBlockAndWait:v34];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = +[PFCloudKitMetadataModel checkAndRepairSchemaOfStore:withManagedObjectContext:error:]((uint64_t)PFCloudKitMetadataModel, v2, (uint64_t)v6, (void *)(*(void *)(a1[7] + 8) + 40));
  uint64_t v7 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    id v12 = *(id *)(*(void *)(a1[7] + 8) + 40);
    goto LABEL_20;
  }
  if (!a1[5])
  {
LABEL_17:
    *(unsigned char *)(v7 + 24) = 0;
    id v12 = *(id *)(*(void *)(a1[7] + 8) + 40);
    goto LABEL_20;
  }
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3052000000;
  v43 = __Block_byref_object_copy__26;
  v44 = __Block_byref_object_dispose__26;
  uint64_t v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 1;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke;
  v35[3] = &unk_1E544BEB8;
  v35[4] = v6;
  v35[5] = &v40;
  v35[6] = &v36;
  [(NSManagedObjectContext *)v6 performBlockAndWait:v35];
  if (!*((unsigned char *)v37 + 24))
  {
    id v9 = (id)v41[5];
    if (v9)
    {
      *(void *)(v8 + 40) = v9;
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v50 = 1024;
        int v51 = 1685;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v41[5] = 0;
  int v21 = *((unsigned __int8 *)v37 + 24);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  if (!v21)
  {
    uint64_t v7 = *(void *)(a1[6] + 8);
    goto LABEL_17;
  }
  uint64_t v22 = (void *)+[NSCKEvent beginEventForRequest:withMonitor:error:]((uint64_t)NSCKEvent, *(void *)(a1[5] + 72), a1[4], (void *)(*(void *)(a1[7] + 8) + 40));
  uint64_t v23 = v22;
  if (v22)
  {
    *(void *)(a1[5] + 64) = v22;
    objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 8), "progressProvider"), "eventUpdated:", v23);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    id v24 = *(id *)(*(void *)(a1[7] + 8) + 40);
  }

LABEL_20:
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v25 = (void *)MEMORY[0x18C127630](v12);
    BOOL v26 = __ckLoggingOverride != 0;
    uint64_t v27 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to initialize CloudKit metadata: %@"];
    _NSCoreDataLog(v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke");
  }

LABEL_23:
}

void __56__PFCloudKitSetupAssistant__checkAndInitializeMetadata___block_invoke_2(uint64_t a1)
{
  if (!+[_PFRoutines _isInMemoryStore:]((uint64_t)_PFRoutines, *(unsigned __int8 **)(a1 + 32)))
  {
    uint64_t v11 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "setQueryGenerationFromToken:error:", +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"), &v11) & 1) == 0)
    {
      v2 = (void *)MEMORY[0x18C127630]();
      BOOL v3 = __ckLoggingOverride != 0;
      uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Unable to set query generation on moc: %@"];
      _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[PFCloudKitSetupAssistant _checkAndInitializeMetadata:]_block_invoke_2");
    }
  }
}

void __60__PFCloudKitSetupAssistant__initializeAssetStorageURLError___block_invoke(uint64_t *a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    id v38 = 0;
    uint64_t v3 = a1[4];
    if (v3) {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    }
    else {
      id WeakRetained = 0;
    }
    p_info = &OBJC_METACLASS___PFCloudKitSizeMetric.info;
    *(void *)(*(void *)(a1[5] + 8) + 40) = (id)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, v2);
    if (!*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F281F8];
      uint64_t v41 = *MEMORY[0x1E4F28588];
      uint64_t v42 = [NSString stringWithFormat:@"Failed to create largeBlobDirectoryURL with observed store: %@", v2];
      *(void *)(*(void *)(a1[7] + 8) + 40) = objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 134403, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
LABEL_29:

      goto LABEL_30;
    }
    id v6 = (id)[MEMORY[0x1E4F28CB8] defaultManager];
    char v37 = 0;
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "path"), &v37))
    {
      uint64_t v7 = *(void **)(*(void *)(a1[5] + 8) + 40);
      if (v37)
      {
        id v30 = WeakRetained;
        uint64_t v31 = v2;
        uint64_t v8 = objc_msgSend(v6, "subpathsAtPath:", objc_msgSend(v7, "path"));
        uint64_t v36 = 0;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v45 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v33 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = (void *)[*(id *)(*(void *)(a1[5] + 8) + 40) URLByAppendingPathComponent:*(void *)(*((void *)&v32 + 1) + 8 * i)];
              if (([v6 removeItemAtURL:v13 error:&v36] & 1) == 0
                && unlink((const char *)objc_msgSend((id)objc_msgSend(v13, "path"), "fileSystemRepresentation")))
              {
                uint64_t v14 = (void *)MEMORY[0x18C127630]();
                BOOL v15 = __ckLoggingOverride != 0;
                uint64_t v16 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to asset file (and unlink:%d) at url: %@\n%@"];
                __error();
                _NSCoreDataLog(v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[PFCloudKitSetupAssistant _initializeAssetStorageURLError:]_block_invoke");
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v45 count:16];
          }
          while (v10);
        }
        uint64_t v23 = a1 + 6;
        id WeakRetained = v30;
        v2 = v31;
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___PFCloudKitSizeMetric + 32);
        goto LABEL_24;
      }
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v6 removeItemAtURL:v7 error:&v38];
    }
    uint64_t v23 = a1 + 6;
    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      goto LABEL_27;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v6 createDirectoryAtURL:*(void *)(*(void *)(a1[5] + 8) + 40) withIntermediateDirectories:1 attributes:0 error:&v38];
    if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      goto LABEL_27;
    }
    uint64_t v28 = *(void **)(*(void *)(a1[5] + 8) + 40);
    uint64_t v43 = *MEMORY[0x1E4F1C630];
    uint64_t v44 = MEMORY[0x1E4F1CC38];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v28, "setResourceValues:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), &v38);
LABEL_24:
    if (*(unsigned char *)(*(void *)(*v23 + 8) + 24))
    {
      uint64_t v29 = (void *)+[PFCloudKitSerializer oldAssetStorageDirectoryURLForStore:]((uint64_t)(p_info + 396), v2);
      if (objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(v29, "path"))) {
        *(unsigned char *)(*(void *)(*v23 + 8) + 24) = [v6 removeItemAtURL:v29 error:&v38];
      }
      goto LABEL_28;
    }
LABEL_27:
    *(void *)(*(void *)(a1[7] + 8) + 40) = v38;
LABEL_28:

    goto LABEL_29;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F281F8];
  uint64_t v39 = *MEMORY[0x1E4F28578];
  uint64_t v40 = @"Failed to initialize the asset storage url because the store was removed from the coordinator.";
  *(void *)(*(void *)(a1[7] + 8) + 40) = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
LABEL_30:
}

void __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2;
    v6[3] = &unk_1E544DB00;
    v6[4] = v2;
    v6[5] = v3;
    long long v7 = *(_OWORD *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v10[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
}

id __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_2(uint64_t a1)
{
  id result = (id)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey", *(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (result)
  {
    id result = (id)[result stringValue];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return result;
}

intptr_t __48__PFCloudKitSetupAssistant__checkAccountStatus___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetched account info for store %@: %@\n%@"];
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitSetupAssistant _checkAccountStatus:]_block_invoke");
  if (!a2)
  {
    uint64_t v25 = (void *)[a3 domain];
    if ([v25 isEqualToString:getCloudKitCKErrorDomain[0]()]
      && [a3 code] == 9)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v16 setObject:@"Unable to initialize without an iCloud account (CKErrorNotAuthenticated)." forKey:*MEMORY[0x1E4F28588]];
      [v16 setObject:a3 forKey:*MEMORY[0x1E4F28A50]];
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F281F8];
      uint64_t v19 = 134400;
      goto LABEL_20;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v27 = a3;
    goto LABEL_22;
  }
  uint64_t v15 = [a2 accountStatus];
  if (v15 != 1 || ![a2 hasValidCredentials])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = v20;
    if (a3) {
      [v20 setObject:a3 forKey:*MEMORY[0x1E4F28A50]];
    }
    if (v15 == 3)
    {
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (v21)
      {
        [v16 setObject:v21 forKey:@"PFCloudKitOldUserIdentityKey"];
        [v16 setObject:&unk_1ED7E2A28 forKey:@"NSCloudKitMirroringDelegateResetSyncReasonKey"];
        uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F281F8];
        uint64_t v24 = 134405;
LABEL_38:
        id v38 = (void *)[v22 errorWithDomain:v23 code:v24 userInfo:v16];
        goto LABEL_39;
      }
      if ([*(id *)(*(void *)(a1 + 40) + 8) databaseScope] == 1)
      {
        id v38 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_39:
        id v26 = v38;
        goto LABEL_40;
      }
      [a2 hasValidCredentials];
      self;
      uint64_t v47 = *MEMORY[0x1E4F28588];
      uint64_t v29 = @"Unable to initialize without an iCloud account (CKAccountStatusNoAccount).";
    }
    else
    {
      int v28 = [a2 hasValidCredentials];
      self;
      uint64_t v29 = @"Unable to determine the status of the iCloud account (CKAccountStatusCouldNotDetermine).";
      switch(v15)
      {
        case 0:
          break;
        case 1:
          if (v28)
          {
            uint64_t v30 = [NSString stringWithUTF8String:"failureReasonForAccountStatus was called with an available account and valid credentials."];
            _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, v55);
            char v37 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: failureReasonForAccountStatus was called with an available account and valid credentials.", buf, 2u);
            }
          }
          uint64_t v29 = @"Unable to initialize because even though there is an available account it does not have valid credentials. The user will need to enter their password in settings, or via a password prompt.";
          break;
        case 2:
          uint64_t v29 = @"Unable to initialize without a valid iCloud account (CKAccountStatusRestricted).";
          break;
        case 4:
          uint64_t v29 = @"Unable to initialize without a valid iCloud account (CKAccountStatusTemporarilyUnavailable).";
          break;
        default:
          uint64_t v39 = [NSString stringWithUTF8String:"Cannot generate a failure reason for an unknown account status: %ld"];
          _NSCoreDataLog(17, v39, v40, v41, v42, v43, v44, v45, v15);
          uint64_t v46 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v61 = v15;
            _os_log_fault_impl(&dword_18AB82000, v46, OS_LOG_TYPE_FAULT, "CoreData: Cannot generate a failure reason for an unknown account status: %ld", buf, 0xCu);
          }
          uint64_t v29 = @"Unknown account status";
          break;
      }
      uint64_t v47 = *MEMORY[0x1E4F28588];
    }
    [v16 setObject:v29 forKey:v47];
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = 134400;
    goto LABEL_38;
  }
  if (!*(unsigned char *)(a1 + 80)
    || ([a2 deviceToDeviceEncryptionAvailability] & 1) != 0
    && ([a2 deviceToDeviceEncryptionAvailability] & 2) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v16 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:@"PFCloudKitOldUserIdentityKey"];
    [v16 setObject:&unk_1ED7E2A28 forKey:@"NSCloudKitMirroringDelegateResetSyncReasonKey"];
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = 134405;
LABEL_20:
    id v26 = (id)[v17 initWithDomain:v18 code:v19 userInfo:v16];
LABEL_40:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v26;

    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  char v49 = [a2 deviceToDeviceEncryptionAvailability];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v51 = *MEMORY[0x1E4F281F8];
  if (v49)
  {
    uint64_t v58 = *MEMORY[0x1E4F28588];
    v59 = @"Unable to initialize the CloudKit container because this device does not support device to device encryption.";
    uint64_t v52 = (void *)MEMORY[0x1E4F1C9E8];
    v53 = &v59;
    v54 = &v58;
  }
  else
  {
    uint64_t v56 = *MEMORY[0x1E4F28588];
    v57 = @"Unable to initialize the CloudKit container because this account does not support device to device encryption.";
    uint64_t v52 = (void *)MEMORY[0x1E4F1C9E8];
    v53 = &v57;
    v54 = &v56;
  }
  id v27 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 134400, objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, 1));
LABEL_22:
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v27;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2;
    v7[3] = &unk_1E544DB50;
    v7[4] = v2;
    v7[5] = v3;
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    long long v8 = *(_OWORD *)(a1 + 40);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v14[0] = 0;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  v16[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1]);
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"database.databaseScopeNum = %@ AND %K == YES", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 72)), @"needsRecoveryFromIdentityLoss"]);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v14];
  if (v14[0])
  {
    id result = v14[0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    id v5 = v3;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "ckRecordZoneName"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "ckOwnerName"));
          [*(id *)(a1 + 48) addObject:v9];

          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id result = (id)[v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        id v6 = result;
      }
      while (result);
    }
  }
  return result;
}

intptr_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[7] + 8) + 40) = a4;
    id v5 = (void *)MEMORY[0x18C127630]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting zones %@ in response to Manatee identity loss failed, %@"];
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
  }
  uint64_t v14 = a1[5];

  return dispatch_semaphore_signal(v14);
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5;
    v7[3] = &unk_1E544DBC8;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    long long v8 = *(_OWORD *)(a1 + 48);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v2 = *(void **)(a1 + 32);
  id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  id v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v6);
        id v27 = 0;
        long long v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v7, *(void *)(a1 + 80), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v27);
        uint64_t v9 = v27;
        if (v27) {
          goto LABEL_17;
        }
        if (v8)
        {
          [(NSManagedObject *)v8 setNeedsRecoveryFromIdentityLoss:0];
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          uint64_t v10 = [NSString stringWithUTF8String:"Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@"];
          _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          id v17 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v27;
            _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@", buf, 0xCu);
          }
        }
        if ([*(id *)(a1 + 48) hasChanges])
        {
          if (([*(id *)(a1 + 48) save:&v27] & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x18C127630]();
            uint64_t v19 = __ckLoggingOverride;
            uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"];
            _NSCoreDataLog(v19 != 0, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            uint64_t v9 = v27;
            if (v27)
            {
LABEL_17:
              id result = v9;
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              return result;
            }
          }
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_90(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_91;
    v7[3] = &unk_1E544DB50;
    v7[4] = v2;
    v7[5] = v3;
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    long long v8 = *(_OWORD *)(a1 + 40);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_2_91(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v16[0] = 0;
  v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  v18[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1]);
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"database.databaseScopeNum = %@ AND %K == YES", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 72)), @"needsNewShareInvitation"]);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v16];
  if (v16[0])
  {
    id result = v16[0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  else
  {
    id v5 = v3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v13;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((void *)&v12 + 1) + 8 * (void)v8));
          id v10 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
          uint64_t v11 = (void *)[v10 initWithRecordName:getCloudKitCKRecordNameZoneWideShare() zoneID:v9];
          [*(id *)(a1 + 48) addObject:v11];

          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id result = (id)[v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        id v6 = result;
      }
      while (result);
    }
  }
  return result;
}

intptr_t __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_3_95(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = a4;
    id v5 = (void *)MEMORY[0x18C127630]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleting records in Shared database %@ in response to Manatee identity loss failed, %@"];
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke_3");
  }
  long long v14 = a1[4];

  return dispatch_semaphore_signal(v14);
}

void __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_4_99(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_100;
    v7[3] = &unk_1E544DBC8;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    long long v8 = *(_OWORD *)(a1 + 48);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not recovery from Manatee identity loss because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

id __71__PFCloudKitSetupAssistant__recoverFromManateeIdentityLossIfNecessary___block_invoke_5_100(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v2 = *(void **)(a1 + 32);
  id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  id v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v29;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v6);
        id v27 = 0;
        long long v8 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v7, *(void *)(a1 + 80), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v27);
        uint64_t v9 = v27;
        if (v27) {
          goto LABEL_17;
        }
        if (v8)
        {
          [(NSManagedObject *)v8 setNeedsRecoveryFromIdentityLoss:0];
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          uint64_t v10 = [NSString stringWithUTF8String:"Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@"];
          _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v27);
          id v17 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v27;
            _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch zone metadata during un-marking zones needing recovery from Manatee identity loss: %@", buf, 0xCu);
          }
        }
        if ([*(id *)(a1 + 48) hasChanges])
        {
          if (([*(id *)(a1 + 48) save:&v27] & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x18C127630]();
            uint64_t v19 = __ckLoggingOverride;
            uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to save metadata while un-marking zones needing recovery from Manatee identity loss: %@"];
            _NSCoreDataLog(v19 != 0, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[PFCloudKitSetupAssistant _recoverFromManateeIdentityLossIfNecessary:]_block_invoke");
            uint64_t v9 = v27;
            if (v27)
            {
LABEL_17:
              id result = v9;
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              return result;
            }
          }
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id result = (id)[v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2;
    v7[3] = &unk_1E544DC18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    long long v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

void __51__PFCloudKitSetupAssistant__createZoneIfNecessary___block_invoke_2(uint64_t a1)
{
  v6[5] = *(id *)MEMORY[0x1E4F143B8];
  v6[0] = 0;
  id v2 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:*(void *)(a1 + 80)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v2, [v4 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v6);
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(NSManagedObject *)v5 hasRecordZone];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v6[0];
  }
}

- (uint64_t)_saveZone:(void *)a3 error:
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  long long v28 = __Block_byref_object_copy__26;
  long long v29 = __Block_byref_object_dispose__26;
  uint64_t v30 = 0;
  uint64_t v6 = *(NSObject **)(a1 + 48);
  id v7 = objc_alloc(getCloudKitCKModifyRecordZonesOperationClass());
  v39[0] = a2;
  long long v8 = objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 1), 0);
  -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1 + 72) options], v8);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke;
  v23[3] = &unk_1E544DD58;
  v23[6] = &v25;
  v23[7] = v24;
  v23[8] = &v31;
  v23[4] = a2;
  v23[5] = v6;
  [v8 setModifyRecordZonesCompletionBlock:v23];
  [*(id *)(a1 + 24) addOperation:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  if (!*((unsigned char *)v32 + 24)) {
    goto LABEL_3;
  }
  uint64_t v9 = [*(id *)(a1 + 8) databaseScope];
  id v10 = *(id *)(a1 + 56);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2;
  v22[3] = &unk_1E544DC40;
  v22[4] = v10;
  v22[5] = a2;
  v22[6] = v24;
  v22[7] = &v31;
  v22[8] = &v25;
  v22[9] = v9;
  -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v10, (uint64_t)v22);

  if (!*((unsigned char *)v32 + 24))
  {
LABEL_3:
    id v11 = (id)v26[5];
    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v37 = 1024;
        int v38 = 983;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v26[5] = 0;
  uint64_t v20 = *((unsigned __int8 *)v32 + 24);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
  return v20;
}

- (uint64_t)_deleteZone:(void *)a3 error:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__26;
  uint64_t v26 = __Block_byref_object_dispose__26;
  uint64_t v27 = 0;
  uint64_t v6 = *(NSObject **)(a1 + 48);
  id v7 = objc_alloc(getCloudKitCKModifyRecordZonesOperationClass());
  v36[0] = [a2 zoneID];
  long long v8 = objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v36, 1));
  -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1 + 72) options], v8);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke;
  v21[3] = &unk_1E544DC68;
  v21[6] = &v28;
  v21[7] = &v22;
  v21[4] = a2;
  v21[5] = v6;
  [v8 setModifyRecordZonesCompletionBlock:v21];
  [*(id *)(a1 + 24) addOperation:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v9 = (id)v23[5];
  if (!*((unsigned char *)v29 + 24))
  {
    uint64_t v12 = v23[5];
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m");
      uint64_t v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/CloudKit/PFCloudKitSetupAssistant.m";
        __int16 v34 = 1024;
        int v35 = 1016;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  uint64_t v10 = *((unsigned __int8 *)v29 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

intptr_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a4;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a2);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "zoneID"), "isEqual:", objc_msgSend(*(id *)(a1 + 32), "zoneID")))
          {
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 capabilities];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          }
        }
        uint64_t v7 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3;
    v7[3] = &unk_1E544DC18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    long long v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

uint64_t __44__PFCloudKitSetupAssistant__saveZone_error___block_invoke_3(uint64_t a1)
{
  id v5 = 0;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)[*(id *)(a1 + 32) zoneID], *(void *)(a1 + 80), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1), -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 2) & 1), -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 1) & 1), -[NSManagedObject setSupportsZoneSharing:](v3, "setSupportsZoneSharing:", (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 3) & 1), -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1), uint64_t result = [*(id *)(a1 + 48) save:&v5], (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

intptr_t __46__PFCloudKitSetupAssistant__deleteZone_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (objc_msgSend(a3, "containsObject:", objc_msgSend(*(id *)(a1 + 32), "zoneID"))) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a4;
  }
  uint64_t v6 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v6);
}

intptr_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
LABEL_11:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v4;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  if (!a2)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Zone fetch didn't return an error or a dictionary of zones"];
    _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, v20);
    long long v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Zone fetch didn't return an error or a dictionary of zones", buf, 2u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F281F8];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    uint64_t v23 = [NSString stringWithFormat:@"Could not locate the desired zone in the database with scope '%@': %@", softLinkCKDatabaseScopeString(*(void *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID")];
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = &v23;
    uint64_t v18 = &v22;
    goto LABEL_10;
  }
  id v5 = objc_msgSend(a2, "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "zoneID"));
  if (!v5)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v25[0] = [NSString stringWithFormat:@"Could not locate the desired zone in the database with scope '%@': %@", softLinkCKDatabaseScopeString(*(void *)(a1 + 72)), objc_msgSend(*(id *)(a1 + 32), "zoneID")];
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = v25;
    uint64_t v18 = &v24;
LABEL_10:
    id v4 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, 134400, objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1));
    goto LABEL_11;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v5 capabilities];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_112(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2;
    v7[3] = &unk_1E544DC18;
    v7[4] = *(void *)(a1 + 40);
    v7[5] = v2;
    void v7[6] = v3;
    long long v8 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2(uint64_t a1)
{
  id v5 = 0;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)[*(id *)(a1 + 32) zoneID], *(void *)(a1 + 80), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        -[NSManagedObject setSupportsFetchChanges:](v2, "setSupportsFetchChanges:", *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) & 1), -[NSManagedObject setSupportsRecordSharing:](v3, "setSupportsRecordSharing:", (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 2) & 1), -[NSManagedObject setSupportsAtomicChanges:](v3, "setSupportsAtomicChanges:", (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 1) & 1), -[NSManagedObject setHasRecordZone:](v3, "setHasRecordZone:", 1), uint64_t result = [*(id *)(a1 + 48) save:&v5], (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

void __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_114(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_115;
    v7[3] = &unk_1E544D9F8;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 64);
    v7[4] = v4;
    v7[5] = v2;
    void v7[6] = v3;
    long long v8 = *(_OWORD *)(a1 + 48);
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
  }
}

uint64_t __53__PFCloudKitSetupAssistant__checkIfZoneExists_error___block_invoke_2_115(uint64_t a1)
{
  id v5 = 0;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)[*(id *)(a1 + 32) zoneID], *(void *)(a1 + 72), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v5);
  if (!v2
    || (uint64_t v3 = v2,
        [(NSManagedObject *)v2 setSupportsFetchChanges:0],
        [(NSManagedObject *)v3 setSupportsRecordSharing:0],
        [(NSManagedObject *)v3 setSupportsAtomicChanges:1],
        [(NSManagedObject *)v3 setHasRecordZone:1],
        uint64_t result = [*(id *)(a1 + 48) save:&v5],
        (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t result = (uint64_t)v5;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    long long v4 = *(_OWORD *)(a1 + 64);
    long long v9 = *(_OWORD *)(a1 + 48);
    long long v10 = v4;
    v8[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2;
    v8[3] = &unk_1E544DCE0;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 80);
    v8[4] = v5;
    v8[5] = v2;
    v8[6] = v3;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v13[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
  }
}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2(uint64_t a1)
{
  v5[5] = *(id *)MEMORY[0x1E4F143B8];
  v5[0] = 0;
  id v2 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), *(void *)(a1 + 88), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v5);
  uint64_t v3 = v2;
  if (!v2
    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -[NSManagedObject hasSubscription](v2, "hasSubscription"), *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend((id)-[NSManagedObject database](v3, "database"), "hasSubscription"), uint64_t result = objc_msgSend(*(id *)(a1 + 48), "save:", v5), (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    uint64_t result = (uint64_t)v5[0];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = result;
  }
  return result;
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_3(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4;
    v7[3] = &unk_1E544DC40;
    v7[4] = v2;
    v7[5] = v3;
    long long v8 = *(_OWORD *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v11 = *MEMORY[0x1E4F28588];
    v12[0] = @"The mirroring delegate could not initialize because it's store was removed from the coordinator.";
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1));
  }
}

uint64_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_4(uint64_t a1)
{
  v4[5] = *(id *)MEMORY[0x1E4F143B8];
  v4[0] = 0;
  id v2 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(a1 + 72), *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)v4);
  if (!v2
    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -[NSManagedObject hasSubscription](v2, "hasSubscription"), uint64_t result = [*(id *)(a1 + 40) save:v4], (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t result = (uint64_t)v4[0];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

intptr_t __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(a2);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v11), "subscriptionID"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "subscriptionID")))break; {
      if (v9 == ++v11)
      }
      {
        uint64_t v9 = [a2 countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v12 = 1;
    if (a2) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_9:
    int v12 = 0;
    if (a2) {
      goto LABEL_13;
    }
  }
  uint64_t v13 = [NSString stringWithUTF8String:"Saved subscriptions was unexpectedly nil."];
  _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, v44);
  uint64_t v20 = __pflogFaultLog;
  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
LABEL_13:
    if (a4) {
      goto LABEL_14;
    }
LABEL_21:
    if (v12) {
      goto LABEL_22;
    }
    id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v42 = *MEMORY[0x1E4F281F8];
    uint64_t v49 = *MEMORY[0x1E4F28588];
    uint64_t v50 = [NSString stringWithFormat:@"Subscription save succeeded but did not return '%@' as a saved subscription", objc_msgSend(*(id *)(a1 + 32), "subscriptionID")];
    id v40 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 134400, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
LABEL_24:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v40;
    goto LABEL_25;
  }
  *(_WORD *)buf = 0;
  _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Saved subscriptions was unexpectedly nil.", buf, 2u);
  if (!a4) {
    goto LABEL_21;
  }
LABEL_14:
  if (v12)
  {
    uint64_t v21 = (void *)MEMORY[0x18C127630]();
    BOOL v22 = __ckLoggingOverride != 0;
    uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to save our subscription and had an operation error, %@"];
    _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitSetupAssistant _setupDatabaseSubscriptionIfNecessary:]_block_invoke");
LABEL_22:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_25;
  }
  if (![a2 count])
  {
    id v40 = a4;
    goto LABEL_24;
  }
  uint64_t v30 = [NSString stringWithUTF8String:"Saved some subscriptions (%lu) %@, but had an operation error, %@"];
  uint64_t v31 = [a2 count];
  _NSCoreDataLog(17, v30, v32, v33, v34, v35, v36, v37, v31);
  int v38 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    uint64_t v39 = [a2 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v52 = v39;
    __int16 v53 = 2112;
    v54 = a2;
    __int16 v55 = 2112;
    uint64_t v56 = a4;
    _os_log_fault_impl(&dword_18AB82000, v38, OS_LOG_TYPE_FAULT, "CoreData: Saved some subscriptions (%lu) %@, but had an operation error, %@", buf, 0x20u);
  }
LABEL_25:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [a3 containsObject:@"com.apple.coredata.cloudkit.zone.subscription"];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_131(uint64_t a1)
{
  id v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_132;
    v5[3] = &unk_1E544DC40;
    v5[4] = v2;
    v5[5] = v3;
    long long v6 = *(_OWORD *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v5];
  }
}

void __66__PFCloudKitSetupAssistant__setupDatabaseSubscriptionIfNecessary___block_invoke_2_132(uint64_t a1)
{
  id v9 = 0;
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2 == 2)
  {
    id v3 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:2];
    uint64_t v4 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v3, *(void *)(a1 + 72), *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v9);
    id v5 = (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4)
    {
      long long v6 = v4;
      if (*v5) {
        objc_msgSend((id)-[NSManagedObject database](v4, "database"), "setHasSubscription:", 1);
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        [(NSManagedObject *)v6 setHasSubscription:0];
      }
      if ([*(id *)(a1 + 40) save:&v9]) {
        goto LABEL_10;
      }
      id v5 = (unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    *id v5 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v9;
LABEL_10:

    return;
  }
  uint64_t v7 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, v2, *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v9);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!v7) {
    goto LABEL_15;
  }
  if (*(unsigned char *)(v8 + 24))
  {
    [(NSManagedObject *)v7 setHasSubscription:1];
    if (([*(id *)(a1 + 40) save:&v9] & 1) == 0)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_15:
      *(unsigned char *)(v8 + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v9;
    }
  }
}

intptr_t __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke(void *a1, void *a2, void *a3)
{
  long long v6 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = __ckLoggingOverride;
  }
  uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Fetched user recordID for store %@: %@\n%@"];
  _NSCoreDataLog(v7, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    id v15 = a2;
    uint64_t v16 = a1[7];
  }
  else
  {
    id v15 = a3;
    uint64_t v16 = a1[8];
  }
  *(void *)(*(void *)(v16 + 8) + 40) = v15;
  uint64_t v17 = a1[5];

  return dispatch_semaphore_signal(v17);
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3;
    v5[3] = &unk_1E544DDA8;
    v5[4] = v2;
    v5[5] = v3;
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v6 = *(_OWORD *)(a1 + 40);
    long long v7 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v5];
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_3(uint64_t a1)
{
  v46[2] = *MEMORY[0x1E4F143B8];
  v41[0] = 0;
  v46[0] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v46[1] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  uint64_t v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2], *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)v41);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v18 = a1 + 64;
LABEL_24:
    *(unsigned char *)(*(void *)(*(void *)v18 + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v41[0];
    return;
  }
  long long v4 = (NSManagedObject *)[v2 objectForKey:@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"];
  if (!v4) {
    long long v4 = +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey", 0, *(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  if (![(NSManagedObject *)v4 BOOLValue])
  {
    [(NSManagedObject *)v4 setBoolValue:1];
    +[NSCKMetadataEntry insertMetadataEntryWithKey:stringValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey", [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName], *(void *)(a1 + 32), *(void **)(a1 + 40));
    goto LABEL_22;
  }
  id v5 = (void *)[v3 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
  long long v6 = v5;
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v19 = (void *)MEMORY[0x18C127630]();
    unint64_t v20 = __ckLoggingOverride;
    uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record changed from nil to %@"];
    if (v20 >= 3) {
      uint64_t v28 = 3;
    }
    else {
      uint64_t v28 = v20;
    }
    _NSCoreDataLog(v28, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    v42[0] = @"PFCloudKitNewUserIdentityKey";
    uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    v42[1] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v43[0] = v30;
    v43[1] = &unk_1ED7E2A58;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
    goto LABEL_21;
  }
  char v7 = objc_msgSend((id)objc_msgSend(v5, "stringValue"), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "recordName"));
  uint64_t v8 = (void *)MEMORY[0x18C127630]();
  unint64_t v9 = __ckLoggingOverride;
  if ((v7 & 1) == 0)
  {
    if ((unint64_t)__ckLoggingOverride >= 3) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = __ckLoggingOverride;
    }
    uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record has changed from %@ to %@"];
    [v6 stringValue];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_3");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    v44[0] = @"PFCloudKitOldUserIdentityKey";
    v45[0] = [v6 stringValue];
    v44[1] = @"PFCloudKitNewUserIdentityKey";
    uint64_t v40 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recordName];
    v44[2] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v45[1] = v40;
    v45[2] = &unk_1ED7E2A40;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
LABEL_21:
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v29 initWithDomain:*MEMORY[0x1E4F281F8] code:134405 userInfo:v31];
    goto LABEL_22;
  }
  uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: CKIdentity record matches store: %@"];
  if (v9 >= 0x10) {
    uint64_t v17 = 16;
  }
  else {
    uint64_t v17 = v9;
  }
  _NSCoreDataLog(v17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke");
LABEL_22:
  uint64_t v18 = a1 + 64;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ([*(id *)(a1 + 40) save:v41] & 1) == 0)
  {
    goto LABEL_24;
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_151(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](*(void *)(a1 + 32));
  if (v2)
  {
    id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](*(void *)(a1 + 32));
    [(NSManagedObjectContext *)v3 setTransactionAuthor:@"NSCloudKitMirroringDelegate.setup"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_152;
    v7[3] = &unk_1E544DDD0;
    v7[4] = v2;
    v7[5] = v3;
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v8 = *(_OWORD *)(a1 + 40);
    long long v9 = v4;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v6 = *MEMORY[0x1E4F281F8];
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = [NSString stringWithFormat:@"Identity check was cancelled because the store was removed from the coordinator."];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 134407, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
  }
}

void __47__PFCloudKitSetupAssistant__checkUserIdentity___block_invoke_2_152(uint64_t a1)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  v33[0] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v33[1] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  uint64_t v2 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2], *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v30);
  if (!v2) {
    goto LABEL_16;
  }
  id v3 = v2;
  if (!objc_msgSend((id)objc_msgSend(v2, "objectForKey:", @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"), "BOOLValue"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v11 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v12 = 16;
    }
    else {
      uint64_t v12 = __ckLoggingOverride;
    }
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: First identity fetch failed due to authentication but store was never assigned to a user record: %@"];
    _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
    unint64_t v20 = (void *)[v3 objectForKey:@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"];
    if (v20) {
      [v20 setBoolValue:1];
    }
    else {
      +[NSCKMetadataEntry insertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey", 1, *(void *)(a1 + 32), *(void **)(a1 + 40));
    }
    if ([*(id *)(a1 + 40) save:&v30]) {
      return;
    }
LABEL_16:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v10 = v30;
    goto LABEL_17;
  }
  uint64_t v4 = [v3 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    *(unsigned char *)(v5 + 24) = 0;
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v8 = *MEMORY[0x1E4F281F8];
    v31[0] = @"PFCloudKitOldUserIdentityKey";
    uint64_t v9 = [v6 stringValue];
    v31[1] = @"NSCloudKitMirroringDelegateResetSyncReasonKey";
    v32[0] = v9;
    v32[1] = &unk_1ED7E2A28;
    id v10 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 134405, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
LABEL_17:
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v10;
    return;
  }
  *(unsigned char *)(v5 + 24) = 1;
  uint64_t v21 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 0x10) {
    uint64_t v22 = 16;
  }
  else {
    uint64_t v22 = __ckLoggingOverride;
  }
  uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Identity fetch failed due to authentication but store was never assigned to a user record: %@"];
  _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitSetupAssistant _checkUserIdentity:]_block_invoke_2");
}

void __96__PFCloudKitSetupAssistant__checkAndTruncateEventHistoryIfNeededWithManagedObjectContext_error___block_invoke(uint64_t *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKEvent entityPath]);
  uint64_t v3 = a1[4];
  if (v3)
  {
    unint64_t v4 = -[NSManagedObjectContext _countForFetchRequest_:error:](v3, v2, (id *)(*(void *)(a1[5] + 8) + 40));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      id v5 = *(id *)(*(void *)(a1[5] + 8) + 40);
    }
    else if (v4 >= 0x4E21)
    {
      [(NSFetchRequest *)v2 setFetchLimit:v4 - 10000];
      [(NSFetchRequest *)v2 setResultType:1];
      v10[0] = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"SELF" ascending:1];
      -[NSFetchRequest setSortDescriptors:](v2, "setSortDescriptors:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
      uint64_t v6 = [(id)a1[4] executeFetchRequest:v2 error:*(void *)(a1[5] + 8) + 40];
      if (v6)
      {
        id v7 = [[NSBatchDeleteRequest alloc] initWithObjectIDs:v6];
        [(NSBatchDeleteRequest *)v7 setResultType:0];
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1[4], "executeRequest:error:", v7, *(void *)(a1[5] + 8) + 40), "result"), "BOOLValue");
        if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
          id v8 = *(id *)(*(void *)(a1[5] + 8) + 40);
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        id v9 = *(id *)(*(void *)(a1[5] + 8) + 40);
      }
    }
  }
}

@end