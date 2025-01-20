@interface PFUbiquitySetupAssistant
+ (PFUbiquityBaseline)createBaselineFromMostRecentLocation:(uint64_t)a3 localPeerID:(uint64_t *)a4 error:;
+ (id)createActualStoreURLForStoreURL:(uint64_t)a3 localPeerID:(__CFString *)a4 containerIdentifier:(uint64_t)a5 andStoreName:;
+ (uint64_t)doBasicSanityCheckForUbiquityRootURL:(uint64_t *)a3 withError:;
+ (uint64_t)findContainerIDForToken:(uint64_t)a3 storeName:(BOOL *)a4 haveExistingMappings:;
+ (uint64_t)removeUbiquityMetadataFromStore:(uint64_t)a1;
+ (void)createDefaultLocalPeerID;
+ (void)setContainerIdentifierUUID:(void *)a3 forIdentityToken:(uint64_t)a4 forStoreName:;
- (BOOL)checkKnowledgeVectorsAndBaselineWithStore:(void *)a3 error:;
- (BOOL)detectAndFixForkedContainer:(void *)a3 store:(id *)a4 error:;
- (BOOL)initializeStack:(uint64_t)a1;
- (PFUbiquitySetupAssistant)init;
- (PFUbiquitySetupAssistant)initWithPersistentStoreCoordinator:(id)a3 andStoreOptions:(id)a4 forPersistentStoreOfType:(id)a5 atURL:(id)a6;
- (uint64_t)attemptMetadataRecoveryForStore:(uint64_t *)a3 error:;
- (uint64_t)canReadFromUbiquityRootLocation:(uint64_t)a1;
- (uint64_t)doPostValidationInit:(uint64_t)a1;
- (uint64_t)initializeBaselineForStore:(void *)a3 error:;
- (uint64_t)initializeContainerIdentifierWithStore:(uint64_t)a1 error:(uint64_t)a2;
- (uint64_t)initializeReceiptFile:(uint64_t)a1;
- (uint64_t)initializeStoreKnowledgeVectorFromStore:(uint64_t)a1 error:(void *)a2;
- (uint64_t)moveLocalLogFilesToUbiquityLocation:(uint64_t)a1;
- (uint64_t)performCoordinatorPostStoreSetup:(void *)a3 error:;
- (uint64_t)pruneStagingDirectoryForStore:(uint64_t)a1 error:(void *)a2;
- (uint64_t)respondToBaselineRoll:(uint64_t)a1;
- (uint64_t)seedStore:(uint64_t *)a3 error:;
- (uint64_t)sideLoadStore:(void *)a3 error:;
- (uint64_t)tryToReplaceLocalStore:(uint64_t)a3 withStoreSideLoadedByImporter:;
- (uint64_t)validateOptionsWithError:(uint64_t)a1;
- (void)coordinatorWillRemoveStore:(id)a3;
- (void)dealloc;
- (void)exportedLog:(id)a3;
- (void)finishSetupWithRetry:(uint64_t)a1;
- (void)longDescription;
- (void)ubiquityIdentityTokenChanged:(id)a3;
- (void)updateDictionary:(void *)a1 withPhraseLearningSnapshot:(void *)a2;
- (void)updateDictionary:(void *)a1 withShortcutSnapshot:(void *)a2;
@end

@implementation PFUbiquitySetupAssistant

- (PFUbiquitySetupAssistant)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquitySetupAssistant;
  v2 = [(PFUbiquitySetupAssistant *)&v5 init];
  v3 = (PFUbiquitySetupAssistant *)v2;
  if (v2)
  {
    *((void *)v2 + 7) = 0;
    *((void *)v2 + 9) = 0;
    v2[80] = 0;
    *((_WORD *)v2 + 148) = 0;
    v2[298] = 0;
    *((void *)v2 + 38) = 0;
    *((_WORD *)v2 + 156) = 0;
    *((void *)v2 + 40) = 0;
    v2[328] = 0;
    *((void *)v2 + 1) = 0;
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 4) = 0;
    *((void *)v2 + 5) = 0;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 196) = 0u;
    *((void *)v2 + 27) = 0;
    *((void *)v2 + 28) = 0;
    *((_WORD *)v2 + 116) = 0;
    *((_OWORD *)v2 + 15) = 0u;
    *((_OWORD *)v2 + 16) = 0u;
    *((_WORD *)v2 + 136) = 0;
    *((void *)v2 + 42) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v3->_gidToRid = (NSMutableDictionary *)objc_opt_new();
    v3->_entityNameToGidSet = (NSMutableDictionary *)objc_opt_new();
    v3->_initialSyncSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v3->_initialSyncComplete = 0;
    v3->_queryLocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_notifyAboutSetupProgress = 0;
    v3->_numSetupTries = 0;
    v3->_retryDelaySec = 60;
    v3->_failSetup = 0;
    v3->_failSetupError = 0;
    v3->_gotAccountChange = 0;
  }
  return v3;
}

- (PFUbiquitySetupAssistant)initWithPersistentStoreCoordinator:(id)a3 andStoreOptions:(id)a4 forPersistentStoreOfType:(id)a5 atURL:(id)a6
{
  v10 = [(PFUbiquitySetupAssistant *)self init];
  if (v10)
  {
    v10->_options = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a4];
    v10->_psc = (NSPersistentStoreCoordinator *)a3;
    v10->_storeURL = (NSURL *)a6;
    v10->_storeType = (NSString *)a5;
  }
  return v10;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_options = 0;
  self->_psc = 0;

  self->_storeType = 0;
  self->_storeURL = 0;

  self->_actualStoreFileURL = 0;
  self->_storeKV = 0;

  self->_storeMetadataDict = 0;
  self->_localPeerID = 0;

  self->_ubiquityName = 0;
  self->_ubiquityContainerIdentifier = 0;

  self->_ubiquityIdentityToken = 0;
  self->_ubiquityRootURL = 0;

  self->_ubiquityRootSubpath = 0;
  self->_ubiquityRootLocation = 0;

  self->_localRootLocation = 0;
  self->_modelVersionHash = 0;

  self->_stack = 0;
  self->_storeMetadata = 0;
  self->_localPeerState = 0;

  self->_metaKV = 0;
  self->_localPeerReceipt = 0;

  self->_receiptKV = 0;
  self->_containerIdentifier = 0;

  self->_preStoreContainerUUID = 0;
  self->_migrationAssistant = 0;

  self->_migrationManager = 0;
  self->_baseline = 0;

  self->_logLocationsExportedDuringSideLoad = 0;
  self->_gidToRid = 0;

  self->_entityNameToGidSet = 0;
  self->_entry = 0;

  self->_previousModelVersionHash = 0;
  self->_seedStoreURL = 0;

  self->_baselineKV = 0;
  self->_queryLocations = 0;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initialSyncSemaphore);
  dispatch_release((dispatch_object_t)self->_initialSyncSemaphore);
  objc_setProperty_nonatomic(self, v3, 0, 416);
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquitySetupAssistant;
  [(PFUbiquitySetupAssistant *)&v4 dealloc];
}

- (void)longDescription
{
  v4.receiver = (id)a1;
  v4.super_class = (Class)PFUbiquitySetupAssistant;
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", objc_msgSendSuper2(&v4, sel_description));
  [v2 appendFormat:@"\n\toptions: %@", *(void *)(a1 + 8)];
  [v2 appendFormat:@"\n\tpsc: %@", *(void *)(a1 + 16)];
  [v2 appendFormat:@"\n\tstore: %@", *(void *)(a1 + 24)];
  [v2 appendFormat:@"\n\tstoreURL: %@", *(void *)(a1 + 40)];
  [v2 appendFormat:@"\n\tactualStoreURL: %@", *(void *)(a1 + 48)];
  [v2 appendFormat:@"\n\tstoreMetadata: %@", *(void *)(a1 + 56)];
  [v2 appendFormat:@"\n\tstoreKV: %@", *(void *)(a1 + 72)];
  objc_msgSend(v2, "appendFormat:", @"\n\tstoreFileExists: %d", *(unsigned __int8 *)(a1 + 227));
  objc_msgSend(v2, "appendFormat:", @"\n\tstoreFileIsReadOnly: %d", *(unsigned __int8 *)(a1 + 228));
  objc_msgSend(v2, "appendFormat:", @"\n\tubiquityEnabled: %d", *(unsigned __int8 *)(a1 + 80));
  [v2 appendFormat:@"\n\tubiquityIdentityToken: %@", *(void *)(a1 + 88)];
  [v2 appendFormat:@"\n\tubiquityRootURL: %@", *(void *)(a1 + 96)];
  [v2 appendFormat:@"\n\tubiquityRootSubpath: %@", *(void *)(a1 + 104)];
  [v2 appendFormat:@"\n\tubiquityName: %@", *(void *)(a1 + 112)];
  [v2 appendFormat:@"\n\tubiquityContainerIdentifier: %@", *(void *)(a1 + 120)];
  [v2 appendFormat:@"\n\tlocalPeerID: %@", *(void *)(a1 + 128)];
  [v2 appendFormat:@"\n\tmodelVersionHash: %@", *(void *)(a1 + 136)];
  [v2 appendFormat:@"\n\tubiquityRootLocation: %@", *(void *)(a1 + 152)];
  [v2 appendFormat:@"\n\tlocalRootLocation: %@", *(void *)(a1 + 160)];
  [v2 appendFormat:@"\n\tmetaKV: %@", *(void *)(a1 + 192)];
  [v2 appendFormat:@"\n\tbaseline: %@", *(void *)(a1 + 200)];
  objc_msgSend(v2, "appendFormat:", @"\n\tbaselineFileExists: %d", *(unsigned __int8 *)(a1 + 208));
  objc_msgSend(v2, "appendFormat:", @"\n\thasUploadingBaseline: %d", *(unsigned __int8 *)(a1 + 209));
  objc_msgSend(v2, "appendFormat:", @"\n\tmonitorBaslineUploadAsync: %d", *(unsigned __int8 *)(a1 + 210));
  objc_msgSend(v2, "appendFormat:", @"\n\tdidBaselineCopy: %d", *(unsigned __int8 *)(a1 + 211));
  [v2 appendFormat:@"\n\tbaselineKV: %@", *(void *)(a1 + 216)];
  objc_msgSend(v2, "appendFormat:", @"\n\thasStoreMetadataFile: %d", *(unsigned __int8 *)(a1 + 229));
  objc_msgSend(v2, "appendFormat:", @"\n\thasStoreMetadataEntry: %d", *(unsigned __int8 *)(a1 + 230));
  objc_msgSend(v2, "appendFormat:", @"\n\thasContainerUUID: %d", *(unsigned __int8 *)(a1 + 231));
  objc_msgSend(v2, "appendFormat:", @"\n\thasContainerUUIDInStore: %d", *(unsigned __int8 *)(a1 + 232));
  objc_msgSend(v2, "appendFormat:", @"\n\tneedsMetadataRecovery: %d", *(unsigned __int8 *)(a1 + 233));
  [v2 appendFormat:@"\n\tlocalPeerReceipt: %@", *(void *)(a1 + 240)];
  [v2 appendFormat:@"\n\treceiptKV: %@", *(void *)(a1 + 248)];
  [v2 appendFormat:@"\n\tcontainerIdentifier: %@", *(void *)(a1 + 256)];
  [v2 appendFormat:@"\n\tpreStoreContainerUUID: %@", *(void *)(a1 + 264)];
  objc_msgSend(v2, "appendFormat:", @"\n\tusedExistingUUIDMapping: %d", *(unsigned __int8 *)(a1 + 272));
  objc_msgSend(v2, "appendFormat:", @"\n\thasLocalTransactionLogs: %d", *(unsigned __int8 *)(a1 + 273));
  objc_msgSend(v2, "appendFormat:", @"\n\tvotedOffIsland: %d", *(unsigned __int8 *)(a1 + 224));
  objc_msgSend(v2, "appendFormat:", @"\n\treapUbiquitousLogs: %d", *(unsigned __int8 *)(a1 + 225));
  objc_msgSend(v2, "appendFormat:", @"\n\trespondToBaselineRoll: %d", *(unsigned __int8 *)(a1 + 226));
  objc_msgSend(v2, "appendFormat:", @"\n\thasMigrationOptions: %d", *(unsigned __int8 *)(a1 + 274));
  objc_msgSend(v2, "appendFormat:", @"\n\tdidMigrateBaseline: %d", *(unsigned __int8 *)(a1 + 275));
  objc_msgSend(v2, "appendFormat:", @"\n\tstoreWasMigrated: %d", *(unsigned __int8 *)(a1 + 276));
  objc_msgSend(v2, "appendFormat:", @"\n\treplayLogsSynchronously: %d", *(unsigned __int8 *)(a1 + 296));
  objc_msgSend(v2, "appendFormat:", @"\n\tuseLocalAccount: %d", *(unsigned __int8 *)(a1 + 297));
  objc_msgSend(v2, "appendFormat:", @"\n\tabortSetup: %d", *(unsigned __int8 *)(a1 + 313));
  objc_msgSend(v2, "appendFormat:", @"\n\tgotExportNotification: %d", *(unsigned __int8 *)(a1 + 328));
  return v2;
}

- (uint64_t)validateOptionsWithError:(uint64_t)a1
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v97 = 0;
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSUbiquityImporterPrivateStoreKey"), "BOOLValue") & 1) != 0|| (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSPersistentStoreRemoveUbiquitousMetadataOption"), "BOOLValue"))
  {
    return 1;
  }
  id v6 = (id)[*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousContentNameKey"];
  *(void *)(a1 + 112) = v6;
  if (!v6)
  {
    *(unsigned char *)(a1 + 80) = 0;
    if (![*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousContentURLKey"]) {
      return 1;
    }
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8], 134311, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"No value for NSPersistentStoreUbiquitousContentNameKey was given however there is a value for NSPersistentStoreUbiquitousContentURLKey, did you forget to pass the value for NSPersistentStoreUbiquitousContentNameKey to the options dictionary for this store?", *MEMORY[0x1E4F28568]) code userInfo];
    if (v17) {
      goto LABEL_26;
    }
    uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v25 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    __int16 v115 = 1024;
    int v116 = 373;
    goto LABEL_58;
  }
  p_cache = PFUbiquityMetadataFactory.cache;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByString:", @"."), "count") >= 2
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Invalid option: the value for NSPersistentStoreUbiquitousContentNameKey should not contain periods: %@", "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 358, *(void *)(a1 + 112));
  }
  if (([*(id *)(a1 + 32) isEqual:@"SQLite"] & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F281F8];
    v28 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v29 = [NSString stringWithFormat:@"The %@ persistent store type does not support iCloud integration.", *(void *)(a1 + 32)];
    uint64_t v17 = objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 134080, objc_msgSend(v28, "dictionaryWithObject:forKey:", v29, *MEMORY[0x1E4F28568]));
    if (v17)
    {
LABEL_26:
      if (a2)
      {
        uint64_t v4 = 0;
        *a2 = v17;
        return v4;
      }
      return 0;
    }
    uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v25 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    __int16 v115 = 1024;
    int v116 = 364;
LABEL_58:
    _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  *(void *)(a1 + 120) = (id)[*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousContainerIdentifierKey"];
  id v8 = (id)[*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousPeerTokenOption"];
  id v9 = v8;
  if (!v8)
  {
LABEL_30:
    int v16 = 1;
    goto LABEL_31;
  }
  if (![v8 isNSString] || !objc_msgSend(v9, "length"))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Invalid value for NSPersistentStoreUbiquitousPeerTokenOption: %@", "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 408, v9);
    }
    goto LABEL_30;
  }
  v10 = (void *)[MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  if (![v9 length]) {
    goto LABEL_46;
  }
  unint64_t v11 = 0;
  uint64_t v12 = *MEMORY[0x1E4F281F8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  char v14 = 1;
  do
  {
    if ((objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v11)) & 1) == 0)
    {
      uint64_t v15 = [NSString stringWithFormat:@"NSPersistentStoreUbiquitousPeerTokenOption must be an alpha numeric string, %@ has invalid characters", v9];
      uint64_t v111 = v13;
      uint64_t v112 = v15;
      uint64_t v97 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v12, 134311, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
      unint64_t v11 = [v9 length];
      char v14 = 0;
    }
    ++v11;
  }
  while (v11 < [v9 length]);
  p_cache = (void **)(PFUbiquityMetadataFactory + 16);
  if (v14)
  {
LABEL_46:
    v48 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
    v49 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v48];
    [v49 appendFormat:@"~%@", objc_msgSend(v9, "lowercaseString")];
    *(void *)(a1 + 128) = [[NSString alloc] initWithString:v49];

    int v16 = 1;
  }
  else
  {
    int v16 = 0;
  }
LABEL_31:
  id v30 = (id)[*(id *)(a1 + 8) objectForKey:@"PFSetupLocationSentinelOverrideKey"];
  if (v30)
  {
    self;
    id v31 = (id)_PFUbiquityLocationSentinel;
    _PFUbiquityLocationSentinel = [v30 copy];
  }

  uint64_t v32 = *(void *)(a1 + 128);
  if (v32)
  {
    if (v32 != [MEMORY[0x1E4F1CA98] null]) {
      goto LABEL_35;
    }
LABEL_43:
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F281F8];
    uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Unable to generate a peer ID for this peer." forKey:*MEMORY[0x1E4F28568]];
LABEL_56:
    int v51 = 0;
    uint64_t v97 = [v33 errorWithDomain:v34 code:134311 userInfo:v46];
    goto LABEL_61;
  }
  v45 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
  *(void *)(a1 + 128) = v45;
  if (!v45) {
    goto LABEL_43;
  }
LABEL_35:

  if (!v16)
  {
    v47 = (void *)(a1 + 40);
    if ([*(id *)(a1 + 40) isFileURL]) {
      goto LABEL_95;
    }
LABEL_82:
    v61 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F281F8];
    uint64_t v101 = *MEMORY[0x1E4F28568];
    uint64_t v102 = [NSString stringWithFormat:@"%@ is not a valid file URL", *v47];
    uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v64 = 134080;
    v65 = v61;
    uint64_t v66 = v62;
    goto LABEL_83;
  }
  id v9 = (id)[*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousContentURLKey"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 isEqual:*(void *)(a1 + 40)])
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F281F8];
        uint64_t v109 = *MEMORY[0x1E4F28568];
        uint64_t v110 = [NSString stringWithFormat:@"The value passed for NSPersistentStoreUbiquitousContentURLKey cannot be the same as the store URL.\nNSPersistentStoreUbiquitousContentNameKey: %@\nstoreURL: %@", v9, *(void *)(a1 + 40)];
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        v36 = &v110;
        v37 = &v109;
LABEL_55:
        uint64_t v46 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
        goto LABEL_56;
      }
      if (objc_msgSend((id)objc_msgSend(v9, "path"), "rangeOfString:", @".nosync") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F281F8];
        uint64_t v107 = *MEMORY[0x1E4F28568];
        uint64_t v108 = [NSString stringWithFormat:@"The value passed for NSPersistentStoreUbiquitousContentURLKey cannot be inside a .nosync, nothing will ever sync.\n%@", v9];
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        v36 = &v108;
        v37 = &v107;
        goto LABEL_55;
      }
      id v50 = v9;
      *(void *)(a1 + 96) = v50;
      *(void *)(a1 + 152) = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v50);
    }
    else
    {
      if (![v9 isNSString])
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F281F8];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        uint64_t v104 = [NSString stringWithFormat:@"%@ is not a valid value for NSPersistentStoreUbiquitousContentURLKey, it must be an instance of NSString or NSURL.", v9];
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        v36 = &v104;
        v37 = &v103;
        goto LABEL_55;
      }
      if ([v9 length])
      {
        if ([v9 characterAtIndex:0] == 47)
        {
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v34 = *MEMORY[0x1E4F281F8];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          uint64_t v106 = [NSString stringWithFormat:@"%@ is not a valid value for NSPersistentStoreUbiquitousContentURLKey, it must be a relative path.", v9];
          v35 = (void *)MEMORY[0x1E4F1C9E8];
          v36 = &v106;
          v37 = &v105;
          goto LABEL_55;
        }
        *(void *)(a1 + 104) = v9;
      }
    }
  }
  int v51 = 1;
LABEL_61:

  v47 = (void *)(a1 + 40);
  if (([*(id *)(a1 + 40) isFileURL] & 1) == 0) {
    goto LABEL_82;
  }
  if (v51)
  {
    *(unsigned char *)(a1 + 228) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue");
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v52 = (void *)[*(id *)(a1 + 16) persistentStores];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v93 objects:v100 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v94;
      while (2)
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v94 != v55) {
            objc_enumerationMutation(v52);
          }
          v57 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v57, "options"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey"), "isEqualToString:", *(void *)(a1 + 112)))
          {
            v68 = p_cache;
            v69 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v70 = *MEMORY[0x1E4F281F8];
            v71 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v72 = *(void *)(a1 + 112);
            if (!v72) {
              uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
            }
            uint64_t v73 = *MEMORY[0x1E4F28568];
            uint64_t v74 = [v57 URL];
            uint64_t v67 = objc_msgSend(v69, "errorWithDomain:code:userInfo:", v70, 134311, objc_msgSend(v71, "dictionaryWithObjectsAndKeys:", v72, @"NSPersistentStoreUbiquitousContentNameKey", @"The provided ubiquity name is already in use.", v73, v74, *MEMORY[0x1E4F289D0], 0));
            uint64_t v97 = v67;
            p_cache = v68;
            goto LABEL_96;
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v93 objects:v100 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }
    *(void *)(a1 + 304) = (id)[*(id *)(a1 + 8) objectForKey:@"NSPersistentStoreUbiquitousSeedStoreURLKey"];
    v58 = *(void **)(a1 + 40);
    if (v58 && ([v58 isFileURL] & 1) != 0)
    {
      if ([*(id *)(a1 + 32) isEqualToString:@"SQLite"])
      {
        uint64_t v59 = +[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, (void *)[*(id *)(a1 + 16) managedObjectModel]);
        *(void *)(a1 + 136) = v59;
        if (v59)
        {
          if (*(unsigned char *)(a1 + 228)
            || (v83 = *(void **)(a1 + 96)) == 0
            || +[PFUbiquitySetupAssistant doBasicSanityCheckForUbiquityRootURL:withError:]((uint64_t)PFUbiquitySetupAssistant, v83, &v97))
          {
            int v60 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSInferMappingModelAutomaticallyOption"), "BOOLValue");
            if (v60) {
              LOBYTE(v60) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSMigratePersistentStoresAutomaticallyOption"), "BOOLValue");
            }
            *(unsigned char *)(a1 + 274) = v60;
            if (!*(unsigned char *)(a1 + 384)) {
              *(unsigned char *)(a1 + 384) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"PFUbiquitySetupNotifyAboutProgressKey"), "BOOLValue");
            }
            *(unsigned char *)(a1 + 80) = *(void *)(a1 + 112) != 0;
            if (-[PFUbiquitySetupAssistant doPostValidationInit:](a1, &v97))
            {
              uint64_t v4 = 1;
              goto LABEL_102;
            }
          }
          goto LABEL_95;
        }
        uint64_t v80 = [NSString stringWithFormat:@"Unable to get a model version hash from this coordinator's managed object model: %@", *(void *)(a1 + 16)];
        if ([p_cache + 253 canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  No model version hash for coordinator: %@\nModel: %@", "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 519, *(void *)(a1 + 16), [*(id *)(a1 + 16) managedObjectModel]);
        }
        v81 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v82 = *MEMORY[0x1E4F281F8];
        uint64_t v98 = *MEMORY[0x1E4F28568];
        uint64_t v99 = v80;
        uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
        uint64_t v64 = 134060;
        v65 = v81;
        uint64_t v66 = v82;
LABEL_83:
        uint64_t v67 = [v65 errorWithDomain:v66 code:v64 userInfo:v63];
        uint64_t v97 = v67;
        goto LABEL_96;
      }
      v75 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F281F8];
      v77 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      v79 = @"Core Data Ubiquity integration can only be enabled on SQLite stores, you must pass store type NSSQLiteStoreType to -addPersistentStoreWithType:configuration:URL:storeURL:options:error:.";
    }
    else
    {
      v75 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F281F8];
      v77 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v78 = *MEMORY[0x1E4F28568];
      v79 = @"Received a nil or non file URL value for the store URL.";
    }
    uint64_t v63 = [v77 dictionaryWithObject:v79 forKey:v78];
    v65 = v75;
    uint64_t v66 = v76;
    uint64_t v64 = 134311;
    goto LABEL_83;
  }
LABEL_95:
  uint64_t v67 = v97;
LABEL_96:
  if (v67)
  {
    if (a2)
    {
      uint64_t v4 = 0;
      *a2 = v67;
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v84 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v84, v85, v86, v87, v88, v89, v90, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    v91 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v115 = 1024;
      int v116 = 550;
      _os_log_fault_impl(&dword_18AB82000, v91, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  uint64_t v4 = 0;
LABEL_102:
  if ([p_cache + 253 canLogMessageAtLevel:3])
  {
    v92 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquitySetupAssistant validateOptionsWithError:]", 552, v92);
  }
  return v4;
}

+ (void)createDefaultLocalPeerID
{
  self;
  v0 = NSUserName();
  if (v0 && (v1 = v0, [(NSString *)v0 length])) {
    v2 = [(NSString *)v1 lowercaseString];
  }
  else {
    v2 = @"nobody";
  }
  SEL v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v2];
  [v3 appendString:@"~"];
  self;
  *(void *)&v14.byte0 = 0;
  *(void *)&v14.byte8 = 0;
  v13[0] = 0;
  v13[1] = 0;
  Class v4 = NSClassFromString((NSString *)@"UIDevice");
  objc_super v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName");
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  processName: %@", "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2083, v5);
  }
  if (v4
    && ([v5 isEqualToString:@"kbd"] & 1) == 0
    && (id v6 = objc_msgSend((id)-[objc_class currentDevice](v4, "currentDevice"), "identifierForVendor")) != 0)
  {
    v7 = (__CFString *)[v6 UUIDString];
  }
  else
  {
    int v8 = MEMORY[0x18C126D60](&v14, v13);
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Returning private sys id", "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2093);
    }
    if (v8 == -1)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  gethostuuid returned -1. Giving up now.", "+[PFUbiquitySetupAssistant generateMachineUUIDString]", 2108);
      }
      goto LABEL_19;
    }
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
    CFUUIDRef v10 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], v14);
    unint64_t v11 = (__CFString *)CFUUIDCreateString(v9, v10);
    CFMakeCollectable(v11);
    CFRelease(v10);
    v7 = v11;
  }
  if (!v7)
  {
LABEL_19:

    return 0;
  }
  [v3 appendString:v7];
  return v3;
}

+ (uint64_t)doBasicSanityCheckForUbiquityRootURL:(uint64_t *)a3 withError:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v58 = 0;
  objc_super v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t result = [a2 path];
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  if (([v5 fileExistsAtPath:result] & 1) == 0
    && ([v5 createDirectoryAtURL:a2 withIntermediateDirectories:1 attributes:0 error:&v58] & 1) == 0)
  {
    uint64_t v15 = v58;
    if (!v58)
    {
      uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v23 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      int v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v61 = 1024;
      int v62 = 2740;
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  int v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", v7, &v58);
  if (!v8)
  {
    uint64_t v15 = v58;
    if (!v58)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v23 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      int v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v61 = 1024;
      int v62 = 2747;
      goto LABEL_26;
    }
    goto LABEL_15;
  }
  CFAllocatorRef v9 = v8;
  unint64_t v10 = [v8 filePosixPermissions];
  if (([v9 fileIsImmutable] & 1) != 0
    || (uint64_t v24 = [v9 fileType], v24 != *MEMORY[0x1E4F283C0])
    || v10 <= 0x17F)
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    if (!a2) {
      a2 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v14 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 134327, objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", a2, @"affectedDirectory", v9, @"fileAttributes", @"CoreData: Ubiquity: must be able to write to the affected path as a directory.", @"reason", 0));
    uint64_t v58 = v14;
    if (!v14)
    {
      uint64_t v27 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v23 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      int v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v61 = 1024;
      int v62 = 2756;
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  v25 = (void *)[v5 attributesOfFileSystemForPath:v7 error:&v58];
  if (v25)
  {
    v26 = v25;
    if (objc_msgSend((id)objc_msgSend(v25, "valueForKey:", *MEMORY[0x1E4F283A0]), "longLongValue") >= 0x100000) {
      return 1;
    }
    v48 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F281F8];
    id v50 = (void *)MEMORY[0x1E4F1C9E8];
    if (!a2) {
      a2 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v14 = objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 134327, objc_msgSend(v50, "dictionaryWithObjectsAndKeys:", a2, @"affectedDirectory", v26, @"fileAttributes", @"CoreData: Ubiquity: requires at least 1mb of free space to allocate it's metadata storage.", @"reason", 0));
    uint64_t v58 = v14;
    if (!v14)
    {
      uint64_t v51 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v51, v52, v53, v54, v55, v56, v57, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v23 = __pflogFaultLog;
      uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (result)
      {
        *(_DWORD *)buf = 136315394;
        int v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        __int16 v61 = 1024;
        int v62 = 2772;
        goto LABEL_26;
      }
      return result;
    }
LABEL_9:
    if (a3)
    {
      uint64_t v15 = v14;
LABEL_16:
      uint64_t result = 0;
      *a3 = v15;
      return result;
    }
    return 0;
  }
  uint64_t v15 = v58;
  if (v58)
  {
LABEL_15:
    if (a3) {
      goto LABEL_16;
    }
    return 0;
  }
  uint64_t v41 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
  uint64_t v23 = __pflogFaultLog;
  uint64_t result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    int v60 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
    __int16 v61 = 1024;
    int v62 = 2763;
LABEL_26:
    _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  return result;
}

- (uint64_t)doPostValidationInit:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  Class v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken");
  if (!v4) {
    Class v4 = (void *)[*(id *)(a1 + 8) objectForKey:@"NSUbiquityIdentityTokenOverrideKey"];
  }
  *(void *)(a1 + 88) = v4;
  if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Current identity token: %@", "-[PFUbiquitySetupAssistant doPostValidationInit:]", 564, *(void *)(a1 + 88));
  }
  uint64_t v5 = *(void *)(a1 + 88);
  *(unsigned char *)(a1 + 297) = v5 == 0;
  if (v5)
  {
    id v6 = (__CFString *)(id)+[PFUbiquitySetupAssistant findContainerIDForToken:storeName:haveExistingMappings:]((uint64_t)PFUbiquitySetupAssistant, v5, *(void *)(a1 + 112), (BOOL *)(a1 + 312));
    *(void *)(a1 + 264) = v6;
    if (v6)
    {
      *(unsigned char *)(a1 + 272) = 1;
    }
    else
    {
      id v7 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
      *(void *)(a1 + 264) = v7;
      +[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]((uint64_t)PFUbiquitySetupAssistant, (uint64_t)v7, *(void **)(a1 + 88), *(void *)(a1 + 112));
      id v6 = *(__CFString **)(a1 + 264);
    }
  }
  else
  {
    id v6 = @"local";
    *(void *)(a1 + 264) = v6;
  }
  id v8 = +[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]((uint64_t)PFUbiquitySetupAssistant, *(void **)(a1 + 40), *(void *)(a1 + 128), v6, *(void *)(a1 + 112));
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "path"), "stringByDeletingLastPathComponent");
  unint64_t v10 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (([v10 fileExistsAtPath:v9] & 1) != 0
    || [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v37])
  {
    *(unsigned char *)(a1 + 227) = objc_msgSend(v10, "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 48), "path"));
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nStore file exists: %d - %@", "-[PFUbiquitySetupAssistant doPostValidationInit:]", 592, a1, *(unsigned __int8 *)(a1 + 227), *(void *)(a1 + 48));
    }
    if (*(unsigned char *)(a1 + 227)
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"NSPersistentStoreRebuildFromUbiquitousContentOption"), "BOOLValue"))
    {
      if ([*(id *)(a1 + 16) _destroyPersistentStoreAtURL:*(void *)(a1 + 48) withType:@"SQLite" options:*(void *)(a1 + 8) error:&v37])
      {
        *(unsigned char *)(a1 + 227) = 0;
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to destroy persistent store: %@\n%@", "-[PFUbiquitySetupAssistant doPostValidationInit:]", 600, *(void *)(a1 + 48), v37);
      }
    }
    *(void *)(a1 + 160) = +[PFUbiquityLocation createLocalContainerRootLocationWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(__CFString **)(a1 + 264), *(void *)(a1 + 112), *(void **)(a1 + 40));
    self;
    id v11 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 112), *(void *)(a1 + 128));
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = *((void *)v11 + 11);
      if (v13) {
        uint64_t v14 = *(void **)(v13 + 48);
      }
      else {
        uint64_t v14 = 0;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(v18, "URL")) & 1) == 0
              && (objc_msgSend(*(id *)(a1 + 48), "isEqual:", objc_msgSend(v18, "URL")) & 1) == 0)
            {
              uint64_t v15 = [NSString stringWithFormat:@"The store name: %@ is already in use.\n\tStore URL: %@\n\tIn Use Store URL: %@\n", *(void *)(a1 + 112), *(void *)(a1 + 40), objc_msgSend(v18, "URL")];
              uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v21 = *(void *)(a1 + 112);
              if (!v21) {
                uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
              }
              uint64_t v22 = objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, @"NSPersistentStoreUbiquitousContentNameKey", v15, *MEMORY[0x1E4F28568], 0);
              uint64_t v37 = [v19 errorWithDomain:*MEMORY[0x1E4F281F8] code:134311 userInfo:v22];
              LOBYTE(v15) = 1;
              goto LABEL_38;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
LABEL_38:

    if ((v15 & 1) == 0)
    {
      uint64_t v23 = 1;
      goto LABEL_46;
    }
  }
  if (!v37)
  {
    uint64_t v24 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    uint64_t v31 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v40 = 1024;
      int v41 = 649;
      _os_log_fault_impl(&dword_18AB82000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_45;
  }
  if (!a2)
  {
LABEL_45:
    uint64_t v23 = 0;
    goto LABEL_46;
  }
  uint64_t v23 = 0;
  *a2 = v37;
LABEL_46:

  return v23;
}

+ (uint64_t)findContainerIDForToken:(uint64_t)a3 storeName:(BOOL *)a4 haveExistingMappings:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  id v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", a3);
  if (a4) {
    *a4 = v7 != 0;
  }
  id v8 = (void *)[v7 objectForKey:@"PFUbiquitySetupTokenAndIDArray"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t result = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"token"), "isEqual:", a2)) {
          return [v13 objectForKey:@"cid"];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t result = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  return result;
}

+ (void)setContainerIdentifierUUID:(void *)a3 forIdentityToken:(uint64_t)a4 forStoreName:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = self;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a2, @"cid", a3, @"token", 0);
  uint64_t v18 = a4;
  id v8 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", a4), "mutableCopy");
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v19 = (void *)v7;
  id v9 = (id)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"PFUbiquitySetupTokenAndIDArray"), "mutableCopy");
  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v10 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = (void *)[v15 objectForKey:@"token"];
        if (![v16 isNSString] || !objc_msgSend(a3, "isNSString"))
        {
          if (![v16 isEqual:a3]) {
            continue;
          }
LABEL_15:
          [v10 addObject:v15];
          continue;
        }
        if ([v16 isEqualToString:a3]) {
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  [v9 removeObjectsInArray:v10];

  [v9 addObject:v19];
  [v8 setObject:v9 forKey:@"PFUbiquitySetupTokenAndIDArray"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setObject:forKey:", v8, v18);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "synchronize") & 1) == 0
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUser Defaults didn't synchronize", "+[PFUbiquitySetupAssistant setContainerIdentifierUUID:forIdentityToken:forStoreName:]", 4088, v17);
  }
}

+ (id)createActualStoreURLForStoreURL:(uint64_t)a3 localPeerID:(__CFString *)a4 containerIdentifier:(uint64_t)a5 andStoreName:
{
  self;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "path"), "rangeOfString:", @"CoreDataUbiquitySupport");
  uint64_t v10 = a2;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v9;
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Looks like we were passed the full URL, not the store file URL: %@\n%@", "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4018, a5, a2);
    }
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", objc_msgSend(a2, "path"));
    objc_msgSend(v12, "deleteCharactersInRange:", v11, objc_msgSend(v12, "length") - v11);
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:1];

    uint64_t v10 = objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(a2, "lastPathComponent"), 0);
  }
  long long v14 = +[PFUbiquityLocation createLocalStoresPathWithLocalPeerID:containerID:storeName:andStoreURL:]((uint64_t)PFUbiquityLocation, a3, a4, a5, v10);
  if ((_BYTE)dword_1EB270AB0)
  {
    objc_msgSend(v14, "appendString:", objc_msgSend(a2, "lastPathComponent"));
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v14];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Created actual store url: %@\nfor url: %@", "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4044, v15, a2);
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Using the original store URL (linked on or after 10.9 / 7.0): %@", "+[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]", 4046, a2);
    }
    id v15 = a2;
  }

  return v15;
}

- (uint64_t)performCoordinatorPostStoreSetup:(void *)a3 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v31 = 0;
  if (!*(unsigned char *)(a1 + 80) || ([a2 isReadOnly] & 1) != 0) {
    return 1;
  }
  *(void *)(a1 + 24) = a2;
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    id v8 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]", 667, v8);
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:a1 selector:sel_ubiquityIdentityTokenChanged_ name:*MEMORY[0x1E4F28A38] object:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_coordinatorWillRemoveStore_, @"NSPersistentStoreCoordinatorWillRemoveStoreNotification", a2);
  self;
  uint64_t v10 = _sharedSwitchboard;
  if (-[PFUbiquitySwitchboard registerUbiquitizedPersistentStore:withURL:forLocalPeerID:withLocalRootLocation:andUbiquityRootLocation:error:](_sharedSwitchboard, a2, *(void *)(a1 + 40), *(void *)(a1 + 128), *(void **)(a1 + 160), *(void *)(a1 + 152), &v31))
  {
    -[NSPersistentStoreCoordinator _setIsRegisteredWithUbiquity:](*(void (**)(void))(a1 + 16), 1);
    uint64_t v11 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](v10, *(void *)(a1 + 112), *(void *)(a1 + 128));
    *(void *)(a1 + 320) = v11;
    if (v11) {
      uint64_t v11 = (void *)v11[11];
    }
    -[PFUbiquitySwitchboardEntryMetadata setUseLocalAccount:]((uint64_t)v11, *(unsigned __int8 *)(a1 + 297) != 0);
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "metadata"), "mutableCopy");
    *(void *)(a1 + 56) = v12;
    *(unsigned char *)(a1 + 64) = 0;
    if (![v12 objectForKey:@"PFUbiquitySetupOriginalStoreURLAbsoluteStringKey"])
    {
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"), @"PFUbiquitySetupOriginalStoreURLAbsoluteStringKey");
      *(unsigned char *)(a1 + 64) = 1;
    }
    uint64_t v13 = (void *)[*(id *)(a1 + 56) objectForKey:@"com.apple.coredata.ubiquity.ubiquitized"];
    if (!v13 || ([v13 BOOLValue] & 1) == 0)
    {
      [*(id *)(a1 + 56) setObject:&unk_1ED7E2C98 forKey:@"com.apple.coredata.ubiquity.ubiquitized"];
      *(unsigned char *)(a1 + 64) = 1;
    }
    if (*(unsigned char *)(a1 + 297))
    {
      uint64_t v14 = *(void *)(a1 + 320);
      if (v14) {
        uint64_t v15 = *(void *)(v14 + 64);
      }
      else {
        uint64_t v15 = 0;
      }
      char v16 = -[PFUbiquityContainerMonitor startMonitor:](v15, &v31);
      if (*(unsigned char *)(a1 + 64) && ([a2 isReadOnly] & 1) == 0)
      {
        [a2 setMetadata:*(void *)(a1 + 56)];
        uint64_t v28 = objc_alloc_init(NSSaveChangesRequest);
        [a2 executeRequest:v28 withContext:0 error:0];

        if (v16)
        {
LABEL_32:
          uint64_t v6 = 1;
          goto LABEL_33;
        }
      }
      else if (v16)
      {
        goto LABEL_32;
      }
    }
    else if (-[PFUbiquitySetupAssistant initializeStoreKnowledgeVectorFromStore:error:](a1, a2))
    {
      int v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKey:", @"PFUbiquitySetupSynchronousSideLoadKey"), "BOOLValue");
      id v18 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, (uint64_t)a2);
      uint64_t v19 = *(void *)(a1 + 320);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__PFUbiquitySetupAssistant_performCoordinatorPostStoreSetup_error___block_invoke;
      v30[3] = &unk_1E544B778;
      v30[4] = a1;
      v30[5] = v18;
      if (-[PFUbiquitySwitchboardEntry finishSetupForStore:withSetupAssistant:synchronously:error:finishBlock:](v19, (uint64_t)v18, (void *)a1, v17, &v31, (uint64_t)v30))
      {
        goto LABEL_32;
      }
    }
  }
  if (v31)
  {
    if (a3)
    {
      uint64_t v6 = 0;
      *a3 = v31;
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    uint64_t v27 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v34 = 1024;
      int v35 = 723;
      _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }
  uint64_t v6 = 0;
LABEL_33:
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    uint64_t v29 = -[PFUbiquitySetupAssistant longDescription](a1);
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]", 726, v29);
  }
  return v6;
}

- (uint64_t)initializeStoreKnowledgeVectorFromStore:(uint64_t)a1 error:(void *)a2
{
  uint64_t v2 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (id)[a2 persistentStoreCoordinator];
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3052000000;
    uint64_t v14 = __Block_byref_object_copy__65;
    uint64_t v15 = __Block_byref_object_dispose__65;
    uint64_t v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke;
    v10[3] = &unk_1E544B9B0;
    v10[4] = a2;
    v10[5] = &v11;
    [v4 performBlockAndWait:v10];
    id v5 = (id)v12[5];
    if (![(id)v12[5] objectForKey:*(void *)(v2 + 128)])
    {
      uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke_2;
      v9[3] = &unk_1E544BB28;
      v9[4] = a2;
      v9[5] = v2;
      v9[6] = v6;
      [v4 performBlockAndWait:v9];
    }
    uint64_t v7 = [PFUbiquityKnowledgeVector alloc];
    *(void *)(v2 + 72) = [(PFUbiquityKnowledgeVector *)v7 initWithStoreKnowledgeVectorDictionary:v12[5]];
    uint64_t v2 = 1;

    _Block_object_dispose(&v11, 8);
  }
  return v2;
}

void __67__PFUbiquitySetupAssistant_performCoordinatorPostStoreSetup_error___block_invoke(uint64_t a1)
{
}

- (void)finishSetupWithRetry:(uint64_t)a1
{
  v85[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a2 && (id v4 = objc_loadWeakRetained((id *)(a2 + 8))) != 0)
  {
    id v71 = v4;
    if ([v4 persistentStoreCoordinator])
    {
      if (!*(unsigned char *)(a1 + 313))
      {
        id v74 = 0;
        id WeakRetained = objc_loadWeakRetained((id *)(a2 + 8));
        uint64_t v6 = [WeakRetained persistentStoreCoordinator];
        if (!*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 297) || *(unsigned char *)(a1 + 228))
        {
          int v7 = 1;
          char v75 = 1;
          goto LABEL_10;
        }
        if (WeakRetained && (uint64_t v10 = v6) != 0)
        {
          if (!*(unsigned char *)(a1 + 313))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              uint64_t v11 = -[PFUbiquitySetupAssistant longDescription](a1);
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 894, v11);
            }
            ++*(void *)(a1 + 392);
            if (*(unsigned char *)(a1 + 384))
            {
              uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a1, @"setupAssistant", 0);
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"PFUbiquitySetupWillFinishNotification", v10, v12);
            }
            if (*(unsigned char *)(a1 + 313)) {
              goto LABEL_25;
            }
            if (!-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:](a1, &v74)) {
              goto LABEL_51;
            }
            if (*(unsigned char *)(a1 + 313)
              || ([*(id *)(a1 + 112) isEqualToString:@"UserDictionary"] & 1) == 0
              && ![*(id *)(a1 + 112) hasPrefix:@"PhraseLearning_zh_Han"])
            {
LABEL_25:
              int v13 = 0;
              goto LABEL_52;
            }
            if (*(unsigned char *)(a1 + 227) && !*(unsigned char *)(a1 + 296))
            {
              if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"PFUbiquitySetupCheckForFork"), "BOOLValue"))
              {
                int v15 = 1;
                goto LABEL_47;
              }
              int v14 = 0;
            }
            else
            {
              int v14 = 1;
            }
            if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"PFUbiquitySetupDoFork"), "BOOLValue") & 1) == 0)
            {
              uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"com.apple.CoreData.ForceUbiquityForkRecovery");
              if (!v16 || ![v16 BOOLValue])
              {
                int v15 = 0;
LABEL_43:
                if (!v14) {
                  goto LABEL_48;
                }
LABEL_47:
                if (-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:](a1, v15, WeakRetained, &v74))
                {
LABEL_48:
                  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"PFUbiquitySetupDoFork"), "BOOLValue"))objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", MEMORY[0x1E4F1CC28], @"PFUbiquitySetupDoFork"); {
                  [*(id *)(a1 + 56) setObject:MEMORY[0x1E4F1CC28] forKey:@"PFUbiquitySetupCheckForFork"];
                  }
                  goto LABEL_25;
                }
LABEL_51:
                int v13 = 1;
LABEL_52:
                if (*(unsigned char *)(a1 + 384))
                {
                  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquitySetupWillInitializeReceiptNotification", a1);
                  if (v13)
                  {
                    int v17 = +[PFUbiquityLogging canLogMessageAtLevel:0];
                    if (v17)
                    {
                      id v18 = -[PFUbiquitySetupAssistant longDescription](a1);
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to read the ubiquity root location.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 949, v18, v74);
LABEL_57:
                      int v17 = 0;
                    }
LABEL_60:
                    int v19 = *(unsigned __int8 *)(a1 + 384);
                    if (!*(unsigned char *)(a1 + 384) || v17)
                    {
                      if (!v17)
                      {
LABEL_68:
                        if (v19 && !v17)
                        {
                          if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                          {
                            uint64_t v21 = -[PFUbiquitySetupAssistant longDescription](a1);
                            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the container identifier.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 969, v21, v74);
                          }
                          goto LABEL_72;
                        }
                        if (!v17)
                        {
                          int v22 = 0;
                          if (!v19) {
                            goto LABEL_84;
                          }
                          int v23 = 1;
                          goto LABEL_78;
                        }
                        if (!*(unsigned char *)(a1 + 313))
                        {
                          if (!-[PFUbiquitySetupAssistant initializeStack:](a1, (uint64_t *)&v74))
                          {
LABEL_72:
                            int v22 = 0;
                            int v23 = 1;
                            goto LABEL_77;
                          }
                          if ([*(id *)(a1 + 176) isInserted]) {
                            -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](*(void **)(a1 + 176), WeakRetained, *(void *)(a1 + 152));
                          }
                          int v23 = 0;
LABEL_76:
                          int v22 = 1;
LABEL_77:
                          if (!*(unsigned char *)(a1 + 384))
                          {
                            if (v23) {
                              goto LABEL_84;
                            }
                            goto LABEL_83;
                          }
LABEL_78:
                          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquitySetupWillInitializeBaselineNotification", a1);
                          if (v23)
                          {
                            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                            {
                              uint64_t v24 = -[PFUbiquitySetupAssistant longDescription](a1);
                              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the metadata stack.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 985, v24, v74);
                            }
                            goto LABEL_84;
                          }
LABEL_83:
                          if (!*(unsigned char *)(a1 + 313))
                          {
                            if (-[PFUbiquitySetupAssistant initializeBaselineForStore:error:](a1, WeakRetained, &v74))
                            {
                              uint64_t v28 = *(void *)(a1 + 320);
                              if (v28)
                              {
                                uint64_t v29 = *(void *)(v28 + 88);
                                if (v29)
                                {
                                  uint64_t v30 = *(void **)(v29 + 120);
                                  if (!v30
                                    || (objc_setProperty_nonatomic(v30, v27, *(id *)(a1 + 72), 88),
                                        (uint64_t v31 = *(void *)(a1 + 320)) != 0)
                                    && (uint64_t v29 = *(void *)(v31 + 88)) != 0)
                                  {
                                    uint64_t v32 = *(void **)(v29 + 120);
                                    if (v32) {
                                      objc_setProperty_nonatomic(v32, v27, *(id *)(a1 + 216), 80);
                                    }
                                  }
                                }
                              }
                              if (!*(unsigned char *)(a1 + 384)) {
                                goto LABEL_91;
                              }
                              int v22 = 1;
                              goto LABEL_87;
                            }
                            int v22 = 0;
                            if (*(unsigned char *)(a1 + 384))
                            {
LABEL_87:
                              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquitySetupWillCheckReceiptNotificaton", a1);
                              if (!v22)
                              {
                                if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                {
                                  uint64_t v25 = -[PFUbiquitySetupAssistant longDescription](a1);
                                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the baseline.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1005, v25, v74);
                                  BOOL v26 = 0;
                                  goto LABEL_108;
                                }
                                goto LABEL_107;
                              }
LABEL_91:
                              if (*(unsigned char *)(a1 + 313)) {
                                BOOL v26 = 1;
                              }
                              else {
                                BOOL v26 = -[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:](a1, WeakRetained, &v74);
                              }
LABEL_108:
                              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                              {
                                long long v33 = -[PFUbiquitySetupAssistant longDescription](a1);
                                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1015, v33);
                              }
                              if (*(unsigned char *)(a1 + 384))
                              {
                                objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:", @"PFUbiquitySetupWillSideLoadStoreNotification", a1);
                                if (!v26)
                                {
                                  int v34 = +[PFUbiquityLogging canLogMessageAtLevel:0];
                                  if (v34)
                                  {
                                    int v35 = -[PFUbiquitySetupAssistant longDescription](a1);
                                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to check the knowledge vectors.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1020, v35, v74);
                                    int v34 = 0;
                                  }
                                  goto LABEL_122;
                                }
                              }
                              else if (!v26)
                              {
                                int v34 = 0;
                                goto LABEL_133;
                              }
                              if (!*(unsigned char *)(a1 + 313))
                              {
                                if (*(unsigned char *)(a1 + 296))
                                {
                                  int v34 = -[PFUbiquitySetupAssistant sideLoadStore:error:](a1, WeakRetained, &v74);
                                  goto LABEL_122;
                                }
                                if (*(unsigned char *)(a1 + 226))
                                {
                                  int v34 = -[PFUbiquitySetupAssistant respondToBaselineRoll:](a1, &v74);
                                  goto LABEL_122;
                                }
                              }
                              int v34 = 1;
LABEL_122:
                              if (*(unsigned char *)(a1 + 384)
                                && (*(unsigned char *)(a1 + 408) ? (char v36 = 1) : (char v36 = v34), (v36 & 1) == 0))
                              {
                                int v34 = +[PFUbiquityLogging canLogMessageAtLevel:0];
                                if (v34)
                                {
                                  uint64_t v37 = -[PFUbiquitySetupAssistant longDescription](a1);
                                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to side load the store.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1043, v37, v74);
                                  int v34 = 0;
                                }
                              }
                              else if (v34)
                              {
                                if (*(unsigned char *)(a1 + 313)) {
                                  goto LABEL_177;
                                }
                                if (!*(unsigned char *)(a1 + 233)) {
                                  goto LABEL_139;
                                }
                                int v34 = -[PFUbiquitySetupAssistant attemptMetadataRecoveryForStore:error:](a1, (uint64_t)WeakRetained, (uint64_t *)&v74);
                              }
LABEL_133:
                              if (*(unsigned char *)(a1 + 384) && !v34)
                              {
                                int v34 = +[PFUbiquityLogging canLogMessageAtLevel:0];
                                if (v34)
                                {
                                  uint64_t v38 = -[PFUbiquitySetupAssistant longDescription](a1);
                                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting metadata recovery.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1055, v38, v74);
                                  int v34 = 0;
                                }
                                goto LABEL_141;
                              }
                              if (!v34)
                              {
LABEL_141:
                                if (*(unsigned char *)(a1 + 384) && !v34)
                                {
                                  if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                  {
                                    uint64_t v39 = -[PFUbiquitySetupAssistant longDescription](a1);
                                    int v40 = 0;
                                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to cache the metadata entry.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1068, v39, v74);
                                    goto LABEL_157;
                                  }
LABEL_156:
                                  int v40 = 0;
LABEL_157:
                                  if (!v40 && *(unsigned char *)(a1 + 384))
                                  {
                                    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                    {
                                      uint64_t v44 = -[PFUbiquitySetupAssistant longDescription](a1);
                                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to finish setup.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1133, v44, v74);
                                      int v45 = 0;
                                      goto LABEL_170;
                                    }
LABEL_169:
                                    int v45 = 0;
                                    goto LABEL_170;
                                  }
                                  if (!v40) {
                                    goto LABEL_169;
                                  }
                                  if (!*(unsigned char *)(a1 + 313))
                                  {
                                    uint64_t v46 = *(void *)(a1 + 168);
                                    if (v46) {
                                      uint64_t v47 = *(void **)(v46 + 8);
                                    }
                                    else {
                                      uint64_t v47 = 0;
                                    }
                                    if ([v47 hasChanges])
                                    {
                                      uint64_t v48 = *(void *)(a1 + 168);
                                      if (v48) {
                                        uint64_t v49 = *(void **)(v48 + 8);
                                      }
                                      else {
                                        uint64_t v49 = 0;
                                      }
                                      int v45 = [v49 save:&v74];
                                    }
                                    else
                                    {
                                      int v45 = 1;
                                    }
                                    if (*(unsigned char *)(a1 + 298))
                                    {
                                      if (*(unsigned char *)(a1 + 384)) {
                                        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"PFUbiquitySetupWillSeedStoreNotification", a1, 0);
                                      }
                                      int v45 = -[PFUbiquitySetupAssistant seedStore:error:](a1, WeakRetained, (uint64_t *)&v74);
                                      if (*(unsigned char *)(a1 + 384)) {
                                        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"PFUbiquitySetupDidSeedStoreNotification", a1, 0);
                                      }
                                    }
LABEL_170:
                                    if (!*(unsigned char *)(a1 + 313) && *(unsigned char *)(a1 + 384))
                                    {
                                      if (!v45
                                        && +[PFUbiquityLogging canLogMessageAtLevel:0])
                                      {
                                        id v50 = -[PFUbiquitySetupAssistant longDescription](a1);
                                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to save the metadata changes.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1159, v50, v74);
                                      }
                                      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"PFUbiquitySetupDidFinishNotification", a1, 0);
                                    }
                                    if (!v45)
                                    {
                                      int v7 = 0;
                                      goto LABEL_179;
                                    }
                                  }
LABEL_177:
                                  -[PFUbiquitySwitchboardEntry setupFinished](*(void *)(a1 + 320));
                                  int v7 = 0;
LABEL_10:
                                  if (!*(unsigned char *)(a1 + 424))
                                  {
                                    id v8 = 0;
                                    char v9 = 1;
                                    goto LABEL_192;
                                  }
LABEL_179:
                                  id v8 = v74;
                                  if (!v74)
                                  {
                                    uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
                                    if (*(unsigned char *)(a1 + 313))
                                    {
                                      uint64_t v80 = @"failed finishing setup for store during asynchronous iCloud initialization";
                                      uint64_t v52 = [WeakRetained URL];
                                      if (!v52) {
                                        uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
                                      }
                                      uint64_t v81 = v52;
                                      uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                                      uint64_t v54 = 134326;
                                    }
                                    else
                                    {
                                      uint64_t v82 = @"failed finishing setup for store during asynchronous iCloud initialization";
                                      uint64_t v55 = [WeakRetained URL];
                                      if (!v55) {
                                        uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
                                      }
                                      uint64_t v83 = v55;
                                      uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
                                      uint64_t v54 = 134080;
                                    }
                                    id v8 = (id)[v51 errorWithDomain:*MEMORY[0x1E4F281F8] code:v54 userInfo:v53];
                                    id v74 = v8;
                                    if (!v8)
                                    {
                                      uint64_t v56 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                                      _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
                                      uint64_t v63 = __pflogFaultLog;
                                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                                      {
                                        *(_DWORD *)buf = 136315394;
                                        v77 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiq"
                                              "uity/Setup/PFUbiquitySetupAssistant.m";
                                        __int16 v78 = 1024;
                                        int v79 = 1197;
                                        _os_log_fault_impl(&dword_18AB82000, v63, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                                      }
                                      id v8 = 0;
                                    }
                                  }
                                  char v9 = 0;
LABEL_192:

                                  if ((v7 | 2) == 2)
                                  {
                                    if (v9) {
                                      goto LABEL_208;
                                    }
                                  }
                                  else if (v75)
                                  {
                                    goto LABEL_208;
                                  }
                                  if (!*(unsigned char *)(a1 + 313))
                                  {
                                    if (v8
                                      && [v8 code] == 4
                                      && +[PFUbiquityLogging canLogMessageAtLevel:0])
                                    {
                                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Setup failed because of a missing file, retrying(%ld): %@", "-[PFUbiquitySetupAssistant finishSetupWithRetry:]", 850, *(void *)(a1 + 392), v8);
                                    }
                                    goto LABEL_203;
                                  }
                                  if (*(unsigned char *)(a1 + 424))
                                  {
                                    *(unsigned char *)(a1 + 424) = 0;
LABEL_203:
                                    if (*(void *)(a1 + 400) && *(void *)(a1 + 392) == 1)
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                      {
                                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@: Retrying after delay: %ld\n%@", "-[PFUbiquitySetupAssistant finishSetupWithRetry:]", 860, a1, 1, v8);
                                      }
                                      uint64_t v64 = *(void *)(a1 + 320);
                                      v72[0] = MEMORY[0x1E4F143A8];
                                      v72[1] = 3221225472;
                                      v72[2] = __49__PFUbiquitySetupAssistant_finishSetupWithRetry___block_invoke;
                                      v72[3] = &unk_1E544B778;
                                      v72[4] = a1;
                                      v72[5] = a2;
                                      -[PFUbiquitySwitchboardEntry afterDelay:executeBlockOnPrivateQueue:](v64, (uint64_t)v72, 1.0);
                                    }
                                  }
LABEL_208:

                                  return;
                                }
                                if (!v34) {
                                  goto LABEL_156;
                                }
LABEL_146:
                                if (*(unsigned char *)(a1 + 313)) {
                                  goto LABEL_177;
                                }
                                if (*(unsigned char *)(a1 + 209) && !*(unsigned char *)(a1 + 210))
                                {
                                  int v40 = 1;
                                  if (([*(id *)(a1 + 200) waitForFileToUpload:&v74] & 1) == 0)
                                  {
                                    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                    {
                                      v65 = -[PFUbiquitySetupAssistant longDescription](a1);
                                      int v40 = 0;
                                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after waiting for the baseline file to upload.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1081, v65, v74);
                                    }
                                    else
                                    {
                                      int v40 = 0;
                                    }
                                  }
                                }
                                else
                                {
                                  int v40 = 1;
                                }
                                uint64_t v41 = *(void *)(a1 + 320);
                                if (v41) {
                                  uint64_t v42 = *(void *)(v41 + 88);
                                }
                                else {
                                  uint64_t v42 = 0;
                                }
                                -[PFUbiquitySwitchboardEntryMetadata setUseLocalStorage:](v42, 0);
                                uint64_t v43 = *(void **)(a1 + 16);
                                v73[0] = MEMORY[0x1E4F143A8];
                                v73[1] = 3221225472;
                                v73[2] = __54__PFUbiquitySetupAssistant_finishSetupForStore_error___block_invoke;
                                v73[3] = &unk_1E544B778;
                                v73[4] = a1;
                                v73[5] = WeakRetained;
                                [v43 performBlockAndWait:v73];
                                if (!*(unsigned char *)(a1 + 313))
                                {
                                  if (-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:](a1, (uint64_t *)&v74))
                                  {
                                    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                                    {
                                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMoved local log files.", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1101, a1);
                                    }
                                  }
                                  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                  {
                                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError moving local log files to the ubiquity directory: %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1103, a1, v74);
                                  }
                                  if (!*(unsigned char *)(a1 + 313))
                                  {
                                    if (-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:](a1, &v74))
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                                      {
                                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nPruned staging directory", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1109, a1);
                                      }
                                    }
                                    else
                                    {
                                      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                      {
                                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError prungin the staging directory: %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1112, a1, v74);
                                      }
                                      id v74 = 0;
                                    }
                                    if (!*(unsigned char *)(a1 + 313))
                                    {
                                      uint64_t v66 = *(void *)(a1 + 320);
                                      if (v66) {
                                        uint64_t v67 = *(void *)(v66 + 64);
                                      }
                                      else {
                                        uint64_t v67 = 0;
                                      }
                                      if (-[PFUbiquityContainerMonitor startMonitor:](v67, &v74))
                                      {
                                        if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                                        {
                                          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nStarted Monitor", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1119, a1);
                                        }
                                      }
                                      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                                      {
                                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError starting monitor: %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 1121, a1, v74);
                                      }
                                      if (!*(unsigned char *)(a1 + 313))
                                      {
                                        v68 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
                                        uint64_t v69 = *(void *)(a1 + 152);
                                        uint64_t v84 = @"PFLogLocationsKey";
                                        uint64_t v70 = *(void *)(a1 + 376);
                                        if (!v70) {
                                          uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
                                        }
                                        v85[0] = v70;
                                        objc_msgSend(v68, "postNotificationName:object:userInfo:", @"PFUbiquityFilePresenterAddPathsNotification", v69, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1));
                                      }
                                    }
                                  }
                                }
                                goto LABEL_157;
                              }
                              if (*(unsigned char *)(a1 + 313)) {
                                goto LABEL_177;
                              }
LABEL_139:
                              self;
                              if (-[PFUbiquityMetadataFactory entryForLocalPeerID:storeName:andUbiquityRootLocation:](_sharedFactory, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 152)))
                              {
                                goto LABEL_146;
                              }
                              self;
                              int v34 = -[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v74);
                              goto LABEL_141;
                            }
LABEL_107:
                            BOOL v26 = 0;
                            goto LABEL_108;
                          }
LABEL_84:
                          if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                          {
                            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError encountered while preparing store metadata: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 999, a1, v74, [v74 userInfo]);
                          }
                          if (*(unsigned char *)(a1 + 384)) {
                            goto LABEL_87;
                          }
                          if (v22) {
                            goto LABEL_91;
                          }
                          goto LABEL_107;
                        }
LABEL_75:
                        int v23 = 0;
                        goto LABEL_76;
                      }
                      if (*(unsigned char *)(a1 + 313)) {
                        goto LABEL_75;
                      }
                      int v17 = -[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:](a1, (uint64_t)WeakRetained);
                    }
                    else
                    {
                      int v17 = +[PFUbiquityLogging canLogMessageAtLevel:0];
                      if (v17)
                      {
                        uint64_t v20 = -[PFUbiquitySetupAssistant longDescription](a1);
                        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSetup failed after attempting to initialize the receipt file.\n%@", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 959, v20, v74);
                        int v17 = 0;
                      }
                    }
                    int v19 = *(unsigned __int8 *)(a1 + 384);
                    goto LABEL_68;
                  }
                }
                else if (v13)
                {
                  goto LABEL_57;
                }
                if (*(unsigned char *)(a1 + 313)) {
                  goto LABEL_75;
                }
                int v17 = -[PFUbiquitySetupAssistant initializeReceiptFile:](a1, &v74);
                goto LABEL_60;
              }
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "removeObjectForKey:", @"com.apple.CoreData.ForceUbiquityForkRecovery");
              if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "synchronize") & 1) == 0
                && +[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUser Defaults didn't synchronize fork removal", "-[PFUbiquitySetupAssistant finishSetupForStore:error:]", 926, a1);
              }
            }
            int v15 = 1;
            goto LABEL_43;
          }
        }
        else
        {
          *(unsigned char *)(a1 + 313) = 1;
        }
        char v75 = 0;
        int v7 = 1;
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v71 = 0;
  }
  *(unsigned char *)(a1 + 313) = 1;
LABEL_14:
}

- (uint64_t)initializeContainerIdentifierWithStore:(uint64_t)a1 error:(uint64_t)a2
{
  uint64_t v31 = 0;
  id v4 = [[PFUbiquityContainerIdentifier alloc] initWithLocalPeerID:*(void *)(a1 + 128) storeName:*(void *)(a1 + 112) andUbiquityRootLocation:*(void *)(a1 + 152)];
  *(void *)(a1 + 256) = v4;
  if (-[PFUbiquityContainerIdentifier identifyContainer:]((uint64_t)v4, &v31))
  {
    uint64_t v5 = *(void *)(a1 + 256);
    if (v5) {
      LOBYTE(v5) = *(unsigned char *)(v5 + 56) != 0;
    }
    *(unsigned char *)(a1 + 231) = v5;
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x3052000000;
    uint64_t v28 = __Block_byref_object_copy__65;
    uint64_t v29 = __Block_byref_object_dispose__65;
    uint64_t v30 = 0;
    uint64_t v30 = [*(id *)(a1 + 56) objectForKey:@"PFUbiquitySetupContainerIdentifierKey"];
    uint64_t v6 = (void *)v26[5];
    if (v6 && [v6 length])
    {
      char v7 = 1;
    }
    else
    {
      char v9 = *(void **)(a1 + 16);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__PFUbiquitySetupAssistant_initializeContainerIdentifierWithStore_error___block_invoke;
      v24[3] = &unk_1E544B9B0;
      v24[4] = a2;
      v24[5] = &v25;
      [v9 performBlockAndWait:v24];
      id v10 = (id)v26[5];
      uint64_t v11 = (void *)v26[5];
      if (v11 && [v11 length])
      {
        [*(id *)(a1 + 56) setObject:v26[5] forKey:@"PFUbiquitySetupContainerIdentifierKey"];
        char v7 = 1;
        *(unsigned char *)(a1 + 64) = 1;
      }
      else
      {
        char v7 = 0;
      }
    }
    *(unsigned char *)(a1 + 232) = v7;
    uint64_t v12 = *(void *)(a1 + 256);
    if (v12)
    {
      int v13 = *(void **)(a1 + 264);
      if (v13 == *(void **)(v12 + 32))
      {
        int v14 = 1;
        goto LABEL_18;
      }
    }
    else
    {
      int v13 = *(void **)(a1 + 264);
      if (!v13)
      {
        int v14 = 1;
        goto LABEL_22;
      }
    }
    int v14 = objc_msgSend(v13, "isEqualToString:");
    uint64_t v12 = *(void *)(a1 + 256);
    if (!v12)
    {
LABEL_22:
      int v15 = 0;
      uint64_t v16 = (void *)v26[5];
      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
LABEL_18:
    int v15 = *(void **)(v12 + 32);
    uint64_t v16 = (void *)v26[5];
    if (v16 == v15)
    {
LABEL_23:
      int v17 = 1;
LABEL_24:
      if (v15 == *(void **)(a1 + 264))
      {
        if ((v14 & v17 & 1) == 0) {
          goto LABEL_31;
        }
      }
      else
      {
        int v18 = [v15 isEqualToString:*(void *)(a1 + 264)];
        if ((v14 & v17 & v18 & 1) == 0)
        {
          if (!v18)
          {
            if (!v17)
            {
              if (v14)
              {
                [*(id *)(a1 + 56) setObject:*(void *)(a1 + 264) forKey:@"PFUbiquitySetupContainerIdentifierKey"];
                uint64_t v8 = 1;
                *(unsigned char *)(a1 + 64) = 1;
                goto LABEL_46;
              }
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                uint64_t v21 = *(void *)(a1 + 256);
                if (v21) {
                  uint64_t v21 = *(void *)(v21 + 32);
                }
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nNo one agrees\n\tcontainer: %@\n\tpreStore: %@\n\tstore: %@\n", "-[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:]", 804, a1, v21, *(void *)(a1 + 264), v26[5]);
              }
              int v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken");
              if (!v22) {
                int v22 = (void *)[*(id *)(a1 + 8) objectForKey:@"NSUbiquityIdentityTokenOverrideKey"];
              }
              if (![v22 isEqual:*(void *)(a1 + 88)])
              {
LABEL_45:
                uint64_t v8 = 0;
                goto LABEL_46;
              }
            }
            [*(id *)(a1 + 56) setObject:*(void *)(a1 + 264) forKey:@"PFUbiquitySetupContainerIdentifierKey"];
            *(unsigned char *)(a1 + 64) = 1;
            uint64_t v19 = -[PFUbiquityContainerIdentifier replaceIdentifierWithUUID:error:](*(void *)(a1 + 256), *(void **)(a1 + 264), &v31);
            goto LABEL_35;
          }
LABEL_31:
          uint64_t v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "ubiquityIdentityToken");
          if (!v20) {
            uint64_t v20 = (void *)[*(id *)(a1 + 8) objectForKey:@"NSUbiquityIdentityTokenOverrideKey"];
          }
          if (![v20 isEqual:*(void *)(a1 + 88)]) {
            goto LABEL_45;
          }
          uint64_t v19 = -[PFUbiquityContainerIdentifier replaceIdentifierWithUUID:error:](*(void *)(a1 + 256), *(void **)(a1 + 264), &v31);
LABEL_35:
          uint64_t v8 = v19;
          goto LABEL_46;
        }
      }
      uint64_t v8 = 1;
LABEL_46:
      _Block_object_dispose(&v25, 8);
      return v8;
    }
LABEL_19:
    int v17 = objc_msgSend(v16, "isEqualToString:");
    int v15 = (void *)v26[5];
    goto LABEL_24;
  }
  uint64_t v8 = 0;
  if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCouldn't identify container: %@", "-[PFUbiquitySetupAssistant initializeContainerIdentifierWithStore:error:]", 817, a1, v31);
    return 0;
  }
  return v8;
}

id __73__PFUbiquitySetupAssistant_initializeContainerIdentifierWithStore_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore ubiquityTableValueForKey:](*(void **)(a1 + 32), @"containerId");
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

void __49__PFUbiquitySetupAssistant_finishSetupWithRetry___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_8;
  }

  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 264) = 0;

  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 160) = 0;

  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 152) = 0;

  *(void *)(v2 + 256) = 0;
  *(void *)(v2 + 200) = 0;
  *(_WORD *)(v2 + 208) = 0;

  *(void *)(v2 + 216) = 0;
  *(void *)(v2 + 168) = 0;
  *(void *)(v2 + 176) = 0;
  *(void *)(v2 + 184) = 0;

  *(void *)(v2 + 192) = 0;
  *(void *)(v2 + 240) = 0;

  *(void *)(v2 + 248) = 0;
  *(void *)(v2 + 256) = 0;

  *(void *)(v2 + 280) = 0;
  *(void *)(v2 + 288) = 0;

  *(void *)(v2 + 376) = objc_opt_new();
  *(void *)(v2 + 144) = 0;
  if (-[PFUbiquitySetupAssistant doPostValidationInit:](v2, &v3))
  {
    -[PFUbiquitySetupAssistant finishSetupWithRetry:](*(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  else
  {
LABEL_8:
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCouldn't clean up from failed setup, giving up until the next time -addPersistentStore is called: %@", "-[PFUbiquitySetupAssistant finishSetupWithRetry:]_block_invoke", 866, *(void *)(a1 + 32), v3);
    }
  }
}

- (uint64_t)canReadFromUbiquityRootLocation:(uint64_t)a1
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v96 = 0;
  uint64_t v3 = *(void *)(a1 + 152);
  if (v3)
  {
    id v4 = (id)-[PFUbiquityLocation createFullURL](v3);
    uint64_t v5 = 0;
    if (!+[PFUbiquitySetupAssistant doBasicSanityCheckForUbiquityRootURL:withError:]((uint64_t)PFUbiquitySetupAssistant, v4, (uint64_t *)&v96))goto LABEL_91; {
LABEL_20:
    }
    if (*(unsigned char *)(a1 + 425))
    {
      self;
      -[PFUbiquitySwitchboard cacheFilePresenterForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 152), *(void *)(a1 + 128));
    }
    uint64_t v70 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 152), *(void *)(a1 + 128));
    id v91 = 0;
    uint64_t v87 = 0;
    uint64_t v88 = &v87;
    uint64_t v89 = 0x2020000000;
    char v90 = 0;
    int v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isUbiquitousItemAtURL:", *(void *)(a1 + 96));
    if (v19)
    {
      if (v5
        || (uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "URLForUbiquityContainerIdentifier:", *(void *)(a1 + 120))) != 0)
      {
        uint64_t v20 = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v5);
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke;
        v86[3] = &unk_1E544E958;
        v86[4] = &v87;
        -[PFUbiquityFileCoordinator coordinateReadingItemAtLocation:options:retryOnError:error:byAccessor:](v70, (uint64_t)v20, 1, 1, &v91, (uint64_t)v86);
      }
    }
    else
    {
      *((unsigned char *)v88 + 24) = 1;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      uint64_t v69 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Read finished: %d");
    }
    if (*((unsigned char *)v88 + 24))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3])
      {
        uint64_t v69 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Read finished: %d / %d / %@");
      }
      if (v19)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000;
        uint64_t v101 = __Block_byref_object_copy__65;
        uint64_t v102 = __Block_byref_object_dispose__65;
        uint64_t v103 = 0;
        uint64_t v82 = 0;
        uint64_t v83 = (atomic_uint *)&v82;
        uint64_t v84 = 0x3020000000;
        int v85 = 0;
        while (!*(_DWORD *)(a1 + 368) && !v83[10])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:1])
          {
            uint64_t v69 = "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]";
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Blocking for initial sync: %@");
          }
          uint64_t v21 = *(void *)(a1 + 120);
          global_queue = dispatch_get_global_queue(0, 0);
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_2;
          v81[3] = &unk_1E544FB20;
          v81[4] = a1;
          v81[5] = &v82;
          v81[6] = buf;
          +[PFUbiquityFilePresenter registerInitialSyncHandlerForURL:andContainerID:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, (uint64_t)v5, v21, global_queue, (uint64_t)v81);
          int v23 = *(NSObject **)(a1 + 360);
          dispatch_time_t v24 = dispatch_time(0, 90000000000);
          intptr_t v25 = dispatch_semaphore_wait(v23, v24);
          __dmb(0xBu);
          if (!v25)
          {
            if (!*(void *)(a1 + 360)) {
              atomic_fetch_add(v83 + 10, 1u);
            }
            break;
          }
          _NSCoreDataLog(1, @" iCloud: Error: failed to receive initial sync notification call back in 90 seconds", v26, v27, v28, v29, v30, v31, (uint64_t)v69);
        }
        if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Initial sync complete: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1503, *(void *)(*(void *)&buf[8] + 40));
        }
        long long v33 = *(void **)(*(void *)&buf[8] + 40);
        if (v33 || v83[10])
        {
          id v34 = v33;
          id v96 = v34;
          if (!v34)
          {
            id v34 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:0];
            id v96 = v34;
          }
          _NSCoreDataLog(1, @" iCloud: Error: initial sync notification returned an error (%@)", v35, v36, v37, v38, v39, v40, (uint64_t)v34);
          int v32 = 0;
        }
        else
        {
          int v32 = 1;
        }
        _Block_object_dispose(&v82, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        int v32 = 1;
      }
      id v41 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 152), (uint64_t)&v96);
      if ([v41 count])
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        uint64_t v43 = [v41 countByEnumeratingWithState:&v77 objects:v99 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v78 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v77 + 1) + 8 * i);
              if (v46)
              {
                int v47 = *(_DWORD *)(v46 + 24);
                if (v47 == 22 || v47 == 10)
                {
                  [*(id *)(a1 + 376) addObject:*(void *)(*((void *)&v77 + 1) + 8 * i)];
                  int v47 = *(_DWORD *)(v46 + 24);
                }
                if (v47 == 15)
                {
                  uint64_t v49 = (void *)-[PFUbiquityLocation createFullURL](v46);
                  if (objc_msgSend((id)objc_msgSend(v49, "path"), "rangeOfString:", @"ubRoot") == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Found Peer: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1534, v49);
                    }
                    [v42 addObject:v49];
                  }
                }
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v77 objects:v99 count:16];
          }
          while (v43);
        }
        if ([v42 count])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting download of all known peers: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1541, v42);
          }
          id v50 = dispatch_get_global_queue(0, 0);
          +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v42, v50, (uint64_t)&__block_literal_global_41);
        }
      }
      else if (!v41 {
             && +[PFUbiquityLogging canLogMessageAtLevel:1])
      }
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to scan root location: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1550, a1, v96);
      }

      uint64_t v51 = *(void *)(a1 + 152);
      if (v51
        && *(unsigned char *)(v51 + 88)
        && +[PFUbiquityLogging canLogMessageAtLevel:2])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAll the faults are live", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1555, a1);
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Store file exists: %d", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1558, *(unsigned __int8 *)(a1 + 227));
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error attempting to read ubiquity root url: %@.\nError: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1560, *(void *)(a1 + 96), v91, [v91 userInfo]);
      }
      int v32 = 0;
      id v96 = v91;
    }

    _Block_object_dispose(&v87, 8);
    if (v32)
    {
      self;
      if (_usesCloudDocs == 1)
      {
        uint64_t v52 = *(void **)(a1 + 96);
        if (v52)
        {
          if (objc_msgSend((id)objc_msgSend(v52, "path"), "rangeOfString:", @"ubRoot") == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Starting download on root URL: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]", 1572, *(void *)(a1 + 96));
            }
            uint64_t v98 = *(void *)(a1 + 96);
            uint64_t v53 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
            uint64_t v54 = dispatch_get_global_queue(0, 0);
            v76[0] = MEMORY[0x1E4F143A8];
            v76[1] = 3221225472;
            v76[2] = __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_4;
            v76[3] = &unk_1E544BDA8;
            v76[4] = a1;
            +[PFUbiquityFilePresenter startDownloadForItems:onQueue:withBlock:]((uint64_t)PFUbiquityFilePresenter, v53, v54, (uint64_t)v76);
          }
        }
      }
      id v55 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 152), (uint64_t)a2);
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v56 = [v55 countByEnumeratingWithState:&v72 objects:v97 count:16];
      if (v56)
      {
        uint64_t v57 = *(void *)v73;
        while (2)
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v73 != v57) {
              objc_enumerationMutation(v55);
            }
            uint64_t v59 = *(void *)(*((void *)&v72 + 1) + 8 * j);
            if (v59
              && (*(_DWORD *)(v59 + 24) - 21) <= 1
              && [*(id *)(v59 + 32) isEqualToString:*(void *)(a1 + 128)]
              && [*(id *)(v59 + 40) isEqualToString:*(void *)(a1 + 112)])
            {
              *(unsigned char *)(a1 + 273) = 1;
              goto LABEL_111;
            }
          }
          uint64_t v56 = [v55 countByEnumeratingWithState:&v72 objects:v97 count:16];
          if (v56) {
            continue;
          }
          break;
        }
      }
LABEL_111:

      uint64_t v16 = 1;
    }
    else
    {
LABEL_91:
      uint64_t v16 = 0;
    }
    goto LABEL_112;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "URLForUbiquityContainerIdentifier:", *(void *)(a1 + 120));
  if (v6)
  {
    uint64_t v5 = (void *)v6;
    char v7 = *(void **)(a1 + 104);
    if (v7)
    {
      uint64_t v8 = (void *)[v7 pathComponents];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v92 objects:v106 count:16];
      id v4 = v5;
      if (v9)
      {
        uint64_t v10 = *(void *)v93;
        id v4 = v5;
        do
        {
          for (uint64_t k = 0; k != v9; ++k)
          {
            if (*(void *)v93 != v10) {
              objc_enumerationMutation(v8);
            }
            id v4 = (id)[v4 URLByAppendingPathComponent:*(void *)(*((void *)&v92 + 1) + 8 * k)];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v92 objects:v106 count:16];
        }
        while (v9);
        if (!v4) {
          goto LABEL_20;
        }
      }
    }
    else
    {
      id v4 = (id)objc_msgSend((id)objc_msgSend(v5, "URLByAppendingPathComponent:", @"CoreData"), "URLByAppendingPathComponent:", *(void *)(a1 + 112));
      if (!v4) {
        goto LABEL_20;
      }
    }
    objc_msgSend(*(id *)(a1 + 176), "setUbiquityRootURLString:", objc_msgSend(v4, "absoluteString"));
    id v17 = v4;
    *(void *)(a1 + 96) = v17;
    int v18 = +[PFUbiquityLocation createUbiquityLocationForRootURL:]((uint64_t)PFUbiquityLocation, v17);
    *(void *)(a1 + 152) = v18;
    -[PFUbiquitySwitchboardEntry setUbiquityRootLocation:](*(void *)(a1 + 320), v18);
    goto LABEL_20;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  v105[0] = @"Didn't get a container URL back from URLForUbiquityContainerIdentifier:, giving up now. Please ensure the application is signed with the proper entitlements to read from the container.";
  v104[0] = @"Reason";
  v104[1] = @"NSPersistentStoreUbiquitousContainerIdentifierKey";
  uint64_t v13 = *(void *)(a1 + 120);
  if (!v13) {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:2];
  uint64_t v15 = [v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:134080 userInfo:v14];
  uint64_t v16 = 0;
  id v96 = (id)v15;
LABEL_112:
  if (*(unsigned char *)(a1 + 425))
  {
    self;
    -[PFUbiquitySwitchboard removeFilePresenterCachedForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 152), *(void *)(a1 + 128));
  }
  if ((v16 & 1) == 0)
  {
    if (v96)
    {
      if (a2) {
        *a2 = v96;
      }
    }
    else
    {
      uint64_t v60 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v67 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1601;
        _os_log_fault_impl(&dword_18AB82000, v67, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v16;
}

- (BOOL)detectAndFixForkedContainer:(void *)a3 store:(id *)a4 error:
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  if (+[PFUbiquityLogging canLogMessageAtLevel:3])
  {
    if (a2) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Detecting Fork and is force:%@", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2127, v6);
  }
  id v159 = 0;
  id v115 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v122 = a1;
  if ([*(id *)(a1 + 112) hasPrefix:@"UserDictionary"])
  {
    int v7 = 0;
  }
  else if ([*(id *)(a1 + 112) hasPrefix:@"PhraseLearning_zh_Han"])
  {
    int v7 = 2;
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v117 = objc_opt_new();
  int v116 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  v133 = objc_opt_new();
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  obuint64_t j = *(id *)(a1 + 376);
  uint64_t v9 = [obj countByEnumeratingWithState:&v155 objects:v171 count:16];
  int v120 = a2;
  if (v9)
  {
    char v123 = 0;
    uint64_t v10 = *(void *)v156;
    uint64_t v125 = *(void *)v156;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v156 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v155 + 1) + 8 * v11);
        if (v12
          && *(_DWORD *)(v12 + 24) == 22
          && [*(id *)(v12 + 48) isEqualToString:*(void *)(v122 + 136)]
          && [*(id *)(v12 + 40) isEqualToString:*(void *)(v122 + 112)])
        {
          id v127 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v13 = (void *)[v117 objectForKey:*(void *)(v12 + 32)];
          if (!v13)
          {
            uint64_t v13 = objc_opt_new();
            [v117 setObject:v13 forKey:*(void *)(v12 + 32)];
          }
          uint64_t v14 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v12 andLocalPeerID:*(void *)(v122 + 128)];
          [v116 addObject:v12];
          if (!-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v14, &v159))
          {
            BOOL v45 = 0;
            goto LABEL_152;
          }
          if ([v13 objectForKey:-[PFUbiquityTransactionLog transactionNumber](v14)]) {
            char v123 = 1;
          }
          else {
            [v13 setObject:v14 forKey:-[PFUbiquityTransactionLog transactionNumber](v14)];
          }
          if (-[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((transactionLogLocatiouint64_t n = v14->_transactionLogLocation) == 0
                ? (storeName = 0)
                : (storeName = transactionLogLocation->_storeName),
                  (saveSnapshot = v14->_saveSnapshot) != 0))
            {
              int v18 = (void *)[(NSMutableDictionary *)saveSnapshot->_storeNameToStoreSaveSnapshots objectForKey:storeName];
              if (v18) {
                int v18 = (void *)v18[11];
              }
            }
            else
            {
              int v18 = 0;
            }
            long long v153 = 0u;
            long long v154 = 0u;
            long long v151 = 0u;
            long long v152 = 0u;
            int v19 = (void *)[v18 allValues];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v151 objects:v170 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v152;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v152 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  int v23 = *(void **)(*((void *)&v151 + 1) + 8 * i);
                  if (v7) {
                    -[PFUbiquitySetupAssistant updateDictionary:withPhraseLearningSnapshot:](v8, v23);
                  }
                  else {
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v8, v23);
                  }
                }
                uint64_t v20 = [v19 countByEnumeratingWithState:&v151 objects:v170 count:16];
              }
              while (v20);
            }
          }
          -[PFUbiquityTransactionLog releaseInsertedObjects]((uint64_t)v14);
          if (-[PFUbiquityTransactionLog loadUpdatedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((dispatch_time_t v24 = v14->_transactionLogLocation) == 0 ? (v25 = 0) : (v25 = v24->_storeName),
                  (uint64_t v26 = v14->_saveSnapshot) != 0))
            {
              uint64_t v27 = (void *)[(NSMutableDictionary *)v26->_storeNameToStoreSaveSnapshots objectForKey:v25];
              if (v27) {
                uint64_t v27 = (void *)v27[12];
              }
            }
            else
            {
              uint64_t v27 = 0;
            }
            long long v149 = 0u;
            long long v150 = 0u;
            long long v147 = 0u;
            long long v148 = 0u;
            uint64_t v28 = (void *)[v27 allValues];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v147 objects:v169 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v148;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v148 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  int v32 = *(void **)(*((void *)&v147 + 1) + 8 * j);
                  if (v7) {
                    -[PFUbiquitySetupAssistant updateDictionary:withPhraseLearningSnapshot:](v8, v32);
                  }
                  else {
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v8, v32);
                  }
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v147 objects:v169 count:16];
              }
              while (v29);
            }
          }
          -[PFUbiquityTransactionLog releaseUpdatedObjects]((uint64_t)v14);
          if (-[PFUbiquityTransactionLog loadDeletedObjectsDataWithError:]((uint64_t)v14, &v159))
          {
            if (v14
              && ((v33 = v14->_transactionLogLocation) == 0 ? (id v34 = 0) : (id v34 = v33->_storeName),
                  (uint64_t v35 = v14->_saveSnapshot) != 0))
            {
              uint64_t v36 = (void *)[(NSMutableDictionary *)v35->_storeNameToStoreSaveSnapshots objectForKey:v34];
              if (v36) {
                uint64_t v36 = (void *)v36[13];
              }
            }
            else
            {
              uint64_t v36 = 0;
            }
            long long v145 = 0u;
            long long v146 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            uint64_t v37 = (void *)[v36 allValues];
            uint64_t v38 = [v37 countByEnumeratingWithState:&v143 objects:v168 count:16];
            if (v38)
            {
              uint64_t v39 = *(void *)v144;
              do
              {
                for (uint64_t k = 0; k != v38; ++k)
                {
                  if (*(void *)v144 != v39) {
                    objc_enumerationMutation(v37);
                  }
                  if (v7)
                  {
                    uint64_t v41 = [*(id *)(*((void *)&v143 + 1) + 8 * k) objectForKey:@"reading"];
                    if (v41) {
                      [v8 removeObjectForKey:v41];
                    }
                  }
                  else
                  {
                    -[PFUbiquitySetupAssistant updateDictionary:withShortcutSnapshot:](v133, *(void **)(*((void *)&v143 + 1) + 8 * k));
                  }
                }
                uint64_t v38 = [v37 countByEnumeratingWithState:&v143 objects:v168 count:16];
              }
              while (v38);
            }
          }
          -[PFUbiquityTransactionLog releaseContents:]((uint64_t)v14);
          uint64_t v10 = v125;
          id v42 = v159;

          [v127 drain];
          id v43 = v159;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v44 = [obj countByEnumeratingWithState:&v155 objects:v171 count:16];
      uint64_t v9 = v44;
    }
    while (v44);
  }
  else
  {
    char v123 = 0;
  }
  if ((v123 & 1) != 0 || v120)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Fork detected, will fork now", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2264);
    }
    uint64_t v46 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(v122 + 152));
    int v47 = -[PFUbiquityLocation createFullPath](*(void *)(v122 + 152));
    uint64_t v48 = +[PFUbiquityLocation createStringByAppendingSubpath:toPath:]((uint64_t)PFUbiquityLocation, (void *)[NSString stringWithFormat:@"fork~%@", *(void *)(v122 + 128)], objc_msgSend(v47, "stringByDeletingLastPathComponent"));
    uint64_t v112 = +[PFUbiquityLocation createUbiquityLocationForRootPath:]((uint64_t)PFUbiquityLocation, v48);

    uint64_t v49 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(v122 + 152));
    id v50 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v112);
    uint64_t v139 = 0;
    v140 = &v139;
    uint64_t v141 = 0x2020000000;
    char v142 = 1;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v165 = __Block_byref_object_copy__65;
    v166 = __Block_byref_object_dispose__65;
    uint64_t v167 = 0;
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke;
    v138[3] = &unk_1E544FB48;
    v138[4] = v116;
    v138[5] = v112;
    v138[6] = buf;
    v138[7] = &v139;
    [v46 coordinateWritingItemAtURL:v49 options:2 writingItemAtURL:v50 options:8 error:&v159 byAccessor:v138];

    if (!*((unsigned char *)v140 + 24) && *(void *)(*(void *)&buf[8] + 40)) {
      id v159 = *(id *)(*(void *)&buf[8] + 40);
    }
    self;
    -[PFUbiquitySwitchboard cacheFilePresenterForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v112, *(void *)(v122 + 128));
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    uint64_t v51 = (void *)[v133 allKeys];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v160 objects:&v172 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v161;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v161 != v53) {
            objc_enumerationMutation(v51);
          }
          uint64_t v55 = *(void *)(*((void *)&v160 + 1) + 8 * m);
          uint64_t v56 = (void *)[v8 objectForKey:v55];
          if (v56)
          {
            uint64_t v57 = (void *)[v56 objectForKey:@"timestamp"];
            uint64_t v58 = objc_msgSend((id)objc_msgSend(v133, "objectForKey:", v55), "objectForKey:", @"timestamp");
            BOOL v59 = !v58 || v57 == 0;
            if (!v59 && (unint64_t)([v57 compare:v58] + 1) <= 1) {
              [v8 removeObjectForKey:v55];
            }
          }
        }
        uint64_t v52 = [v51 countByEnumeratingWithState:&v160 objects:&v172 count:16];
      }
      while (v52);
    }
    uint64_t v60 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(void *)(v122 + 128), *(void *)(v122 + 152), *(void *)(v122 + 112), [*(id *)(v122 + 16) managedObjectModel]);
    uint64_t v61 = v60;
    if (v60
      && [(PFUbiquityBaseline *)v60 loadFileFromLocation:v60->super._currentLocation error:&v159])
    {
      -[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v61, v61->super._currentLocation, &v159);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to load baseline from %@", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2338, v112);
    }

    uint64_t v137 = 0;
    uint64_t v62 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(void *)(v122 + 128), *(void *)(v122 + 152), *(void *)(v122 + 112), [*(id *)(v122 + 16) managedObjectModel]);
    uint64_t v63 = v62;
    if (v62) {
      [(PFUbiquityBaseline *)v62 loadFileFromLocation:v62->super._currentLocation error:&v137];
    }
    -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:]((BOOL)v63, a3, *(void *)(v122 + 128), &v137);
    -[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:]((uint64_t)v63, &v137);
    -[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:]((uint64_t)v63, 0, 1, &v137);
    -[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](v63, [a3 identifier]);

    v124 = [[NSManagedObjectContext alloc] initWithConcurrencyType:3];
    [(NSManagedObjectContext *)v124 setUndoManager:0];
    [(NSManagedObjectContext *)v124 setPersistentStoreCoordinator:*(void *)(v122 + 16)];
    [(NSManagedObjectContext *)v124 _setDelegate:v122];
    [(NSManagedObjectContext *)v124 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    if (v7)
    {
      long long v160 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v163 = 0uLL;
      uint64_t v64 = (void *)[v8 allValues];
      uint64_t v65 = [v64 countByEnumeratingWithState:&v160 objects:&v172 count:16];
      if (v65)
      {
        id v118 = v64;
        uint64_t v119 = *(void *)v161;
        do
        {
          uint64_t v121 = v65;
          for (uint64_t n = 0; n != v121; ++n)
          {
            if (*(void *)v161 != v119) {
              objc_enumerationMutation(v118);
            }
            uint64_t v67 = *(void **)(*((void *)&v160 + 1) + 8 * n);
            uint64_t v68 = [v67 objectForKey:@"defaultReading"];
            uint64_t v69 = [v67 objectForKey:@"extraInteger1"];
            uint64_t v70 = [v67 objectForKey:@"extraInteger2"];
            uint64_t v71 = [v67 objectForKey:@"extraString1"];
            uint64_t v72 = [v67 objectForKey:@"extraString2"];
            uint64_t v73 = [v67 objectForKey:@"frequency"];
            uint64_t v74 = [v67 objectForKey:@"reading"];
            id objb = (id)[v67 objectForKey:@"seed"];
            id v128 = (id)[v67 objectForKey:@"surface"];
            uint64_t v126 = [v67 objectForKey:@"syllables"];
            long long v75 = +[NSEntityDescription insertNewObjectForEntityForName:@"LearningDictionaryEntry" inManagedObjectContext:v124];
            [(NSManagedObject *)v75 setValue:v68 forKey:@"defaultReading"];
            [(NSManagedObject *)v75 setValue:v69 forKey:@"extraInteger1"];
            [(NSManagedObject *)v75 setValue:v70 forKey:@"extraInteger2"];
            [(NSManagedObject *)v75 setValue:v71 forKey:@"extraString1"];
            [(NSManagedObject *)v75 setValue:v72 forKey:@"extraString2"];
            [(NSManagedObject *)v75 setValue:v73 forKey:@"frequency"];
            [(NSManagedObject *)v75 setValue:v74 forKey:@"reading"];
            [(NSManagedObject *)v75 setValue:objb forKey:@"seed"];
            [(NSManagedObject *)v75 setValue:v128 forKey:@"surface"];
            [(NSManagedObject *)v75 setValue:v126 forKey:@"syllables"];
          }
          uint64_t v65 = [v118 countByEnumeratingWithState:&v160 objects:&v172 count:16];
        }
        while (v65);
      }
    }
    else
    {
      long long v160 = 0uLL;
      long long v161 = 0uLL;
      long long v162 = 0uLL;
      long long v163 = 0uLL;
      uint64_t v76 = (void *)[v8 allValues];
      uint64_t v77 = [v76 countByEnumeratingWithState:&v160 objects:&v172 count:16];
      if (v77)
      {
        id v129 = v76;
        id obja = *(id *)v161;
        do
        {
          for (iuint64_t i = 0; ii != v77; ++ii)
          {
            if (*(id *)v161 != obja) {
              objc_enumerationMutation(v129);
            }
            long long v79 = *(void **)(*((void *)&v160 + 1) + 8 * ii);
            uint64_t v80 = [v79 objectForKey:@"phrase"];
            uint64_t v81 = [v79 objectForKey:@"partOfSpeech"];
            uint64_t v82 = [v79 objectForKey:@"shortcut"];
            uint64_t v83 = [v79 objectForKey:@"timestamp"];
            uint64_t v84 = +[NSEntityDescription insertNewObjectForEntityForName:@"UserDictionaryEntry" inManagedObjectContext:v124];
            [(NSManagedObject *)v84 setValue:v82 forKey:@"shortcut"];
            [(NSManagedObject *)v84 setValue:v80 forKey:@"phrase"];
            [(NSManagedObject *)v84 setValue:v81 forKey:@"partOfSpeech"];
            if (v83) {
              [(NSManagedObject *)v84 setValue:v83 forKey:@"timestamp"];
            }
          }
          uint64_t v77 = [v129 countByEnumeratingWithState:&v160 objects:&v172 count:16];
        }
        while (v77);
      }
    }
    *(void *)&long long v160 = 0;
    *((void *)&v160 + 1) = &v160;
    *(void *)&long long v161 = 0x2020000000;
    BYTE8(v161) = 0;
    uint64_t v172 = 0;
    v173 = &v172;
    uint64_t v174 = 0x3052000000;
    v175 = __Block_byref_object_copy__65;
    v176 = __Block_byref_object_dispose__65;
    uint64_t v177 = 0;
    int v85 = *(void **)(v122 + 16);
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_2;
    v136[3] = &unk_1E544F910;
    v136[4] = v122;
    v136[5] = v124;
    v136[6] = &v160;
    v136[7] = &v172;
    [v85 performBlockAndWait:v136];
    int v114 = *(unsigned __int8 *)(*((void *)&v160 + 1) + 24);
    uint64_t v86 = (void *)v173[5];
    if (v86)
    {
      id v87 = v86;
      id v159 = (id)v173[5];
    }
    [(NSManagedObjectContext *)v124 reset];

    uint64_t v88 = [PFUbiquityKnowledgeVector alloc];
    uint64_t v89 = -[PFUbiquityKnowledgeVector initWithKnowledgeVectorString:](v88, "initWithKnowledgeVectorString:", [NSString stringWithFormat:@"%@:1", *(void *)(v122 + 128)]);
    char v90 = *(void **)(v122 + 16);
    v135[0] = MEMORY[0x1E4F143A8];
    v135[1] = 3221225472;
    v135[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_3;
    v135[3] = &unk_1E544B778;
    v135[4] = a3;
    v135[5] = v89;
    [v90 performBlockAndWait:v135];
    id v91 = *(void **)(v122 + 72);
    if (v91)
    {

      *(void *)(v122 + 72) = 0;
    }
    long long v92 = v89;
    *(void *)(v122 + 72) = v92;
    long long v93 = *(void **)(v122 + 216);
    if (v93)
    {

      *(void *)(v122 + 216) = 0;
      long long v92 = *(PFUbiquityKnowledgeVector **)(v122 + 72);
    }
    long long v94 = v92;
    uint64_t v95 = v122;
    *(void *)(v122 + 216) = v94;
    id v96 = *(void **)(v122 + 192);
    if (v96)
    {

      uint64_t v95 = v122;
      *(void *)(v122 + 192) = 0;
    }
    *(void *)(v122 + 192) = *(id *)(v95 + 72);

    if (v114)
    {
      uint64_t v97 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, (uint64_t)v112);
      uint64_t v98 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v112);
      *((unsigned char *)v140 + 24) = 0;
      *(void *)(*(void *)&buf[8] + 40) = 0;
      v134[0] = MEMORY[0x1E4F143A8];
      v134[1] = 3221225472;
      v134[2] = __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_4;
      v134[3] = &unk_1E544F628;
      v134[4] = v122;
      v134[5] = buf;
      v134[6] = &v139;
      [v97 coordinateWritingItemAtURL:v98 options:1 error:&v159 byAccessor:v134];
      if (!*((unsigned char *)v140 + 24)
        && +[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to delete forked contents: %@", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]", 2428, *(void *)(*(void *)&buf[8] + 40));
      }
    }
    self;
    -[PFUbiquitySwitchboard removeFilePresenterCachedForUbiquityRootLocation:andLocalPeerID:](_sharedSwitchboard, (uint64_t)v112, *(void *)(v122 + 128));

    _Block_object_dispose(&v172, 8);
    _Block_object_dispose(&v160, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v139, 8);
    uint64_t v14 = 0;
    BOOL v45 = v114 != 0;
  }
  else
  {
    uint64_t v14 = 0;
    BOOL v45 = 1;
  }
LABEL_152:

  id v99 = v159;
  [v115 drain];
  id v100 = 0;
  id v101 = v159;
  if (!v45)
  {
    if (v159)
    {
      if (a4) {
        *a4 = v159;
      }
    }
    else
    {
      uint64_t v102 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v102, v103, v104, v105, v106, v107, v108, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v109 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2455;
        _os_log_fault_impl(&dword_18AB82000, v109, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v45;
}

- (uint64_t)initializeReceiptFile:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v40 = 0;
  id v4 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:*(void *)(a1 + 128) receiptPeerID:*(void *)(a1 + 128) storeName:*(void *)(a1 + 112) modelVersionHash:*(void *)(a1 + 136) andUbiquityRootLocation:*(void *)(a1 + 152)];
  *(void *)(a1 + 240) = v4;
  if (!-[PFUbiquitySafeSaveFile existsInCloud](v4))
  {
    if (-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](*(void *)(a1 + 240), 1, 0, &v40))
    {
      uint64_t v14 = *(void *)(a1 + 240);
      if (v14)
      {
        BOOL v15 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((void *)v14, *(void **)(v14 + 24), &v40);

        *(void *)(a1 + 240) = 0;
        *(void *)(a1 + 248) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:0];
        if (!v15) {
          goto LABEL_61;
        }
        return 1;
      }
      *(void *)(a1 + 240) = 0;
    }
    *(void *)(a1 + 248) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:0];
    goto LABEL_61;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal peer receipt exists in cloud: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1291, a1, *(void *)(a1 + 240));
  }
  if (-[PFUbiquitySafeSaveFile isFileUploaded:](*(void *)(a1 + 240), (uint64_t)&v40))
  {
    uint64_t v5 = *(void *)(a1 + 240);
    if (v5)
    {
      BOOL v6 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(void *)(v5 + 8), *(void *)(v5 + 32), 0);
      BOOL v7 = v6;
      uint64_t v8 = *(void *)(a1 + 240);
      if (v8)
      {
        BOOL v9 = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(void *)(v8 + 16), *(void *)(v8 + 32), 0);
        if (!v7)
        {
          if (!v9) {
            return 1;
          }
LABEL_56:
          uint64_t v27 = *(void *)(a1 + 240);
          if (v27)
          {
            BOOL v28 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((void *)v27, *(void **)(v27 + 24), &v40);

            *(void *)(a1 + 240) = 0;
            if (v28) {
              return 1;
            }
          }
          else
          {
            *(void *)(a1 + 240) = 0;
          }
LABEL_61:
          if (v40)
          {
            if (a2)
            {
              uint64_t v18 = 0;
              *a2 = v40;
              return v18;
            }
          }
          else
          {
            uint64_t v29 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
            uint64_t v36 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/"
                                   "PFUbiquitySetupAssistant.m";
              __int16 v42 = 1024;
              int v43 = 1375;
              _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            }
          }
          return 0;
        }
        if (v9)
        {
          uint64_t v10 = *(void **)(a1 + 240);
          if (v10) {
            uint64_t v11 = (void *)v10[2];
          }
          else {
            uint64_t v11 = 0;
          }
          BOOL v12 = -[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v10, v11, &v40);
          BOOL v13 = +[PFUbiquityLogging canLogMessageAtLevel:3];
          if (v12)
          {
            if (v13) {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRemoved dangling temporary peer receipt: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1299, a1, *(void *)(a1 + 240));
            }
          }
          else
          {
            if (v13) {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to remove dangling temporary peer receipt: %@\nError: %@\nUserInfo: %@\n", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1301, a1, *(void *)(a1 + 240), v40, [v40 userInfo]);
            }
            id v40 = 0;
          }
        }
        uint64_t v22 = *(void *)(a1 + 240);
        if (v22)
        {
          uint64_t v23 = *(void *)(v22 + 8);
LABEL_42:
          dispatch_time_t v24 = (void *)-[PFUbiquityLocation createFullURL](v23);
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CE8], "unresolvedConflictVersionsOfItemAtURL:", v24), "count"))
          {
            *(void *)buf = 0;
            if ([MEMORY[0x1E4F28CE8] removeOtherVersionsOfItemAtURL:v24 error:buf])
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRemoved conflicting versions of receipt file: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1314, a1, *(void *)(a1 + 240), v38, v39);
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError attempting to remove conflicts for the receipt file: %@\nError: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1317, a1, *(void *)(a1 + 240), *(void *)buf, [*(id *)buf userInfo]);
            }
          }

          intptr_t v25 = *(void **)(a1 + 240);
          if (v25 && [v25 loadFileFromLocation:v25[3] error:&v40])
          {
            uint64_t v26 = *(void **)(a1 + 240);
            if (v26) {
              uint64_t v26 = (void *)v26[11];
            }
            *(void *)(a1 + 248) = v26;
            return 1;
          }
          if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError reading receipt file, will remove so it can be replaced later: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1328, a1, v40);
          }
          id v40 = 0;
          goto LABEL_56;
        }
      }
      else if (!v6)
      {
        return 1;
      }
      uint64_t v23 = 0;
      goto LABEL_42;
    }
    return 1;
  }
  if (!v40)
  {
    uint64_t v19 = *(void *)(a1 + 240);
    if (!v19
      || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](*(void *)(v19 + 16), *(void *)(v19 + 32), 0))
    {
      return 1;
    }
    if ([*(id *)(a1 + 240) waitForFileToUpload:&v40])
    {
      uint64_t v20 = *(void **)(a1 + 240);
      if (v20) {
        uint64_t v21 = (void *)v20[2];
      }
      else {
        uint64_t v21 = 0;
      }
      if (!-[PFUbiquitySafeSaveFile removeFileFromLocation:error:](v20, v21, &v40))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing peer receipt from safe save location: %@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1354, a1, v40);
        }
        id v40 = 0;
      }

      *(void *)(a1 + 240) = 0;
      return 1;
    }
    goto LABEL_61;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError checking receipt file status: %@\n%@", "-[PFUbiquitySetupAssistant initializeReceiptFile:]", 1340, a1, *(void *)(a1 + 240), v40);
  }
  uint64_t v16 = *(void *)(a1 + 240);
  if (!v16) {
    goto LABEL_61;
  }
  if (!-[PFUbiquitySafeSaveFile removeFileFromLocation:error:]((void *)v16, *(void **)(v16 + 24), &v40)) {
    goto LABEL_61;
  }
  uint64_t v17 = *(void *)(a1 + 240);
  uint64_t v18 = 1;
  if ((-[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](v17, 1, 0, &v40) & 1) == 0) {
    goto LABEL_61;
  }
  return v18;
}

- (BOOL)initializeStack:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 1;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__65;
  uint64_t v49 = __Block_byref_object_dispose__65;
  uint64_t v50 = 0;
  id v4 = *(void **)(a1 + 152);
  self;
  uint64_t v5 = (void *)[v4 copy];
  [v5 setUbiquityLocationType:36];
  -[PFUbiquityLocation updateHash](v5);
  BOOL v6 = (void *)[*(id *)(a1 + 96) URLByAppendingPathComponent:@".cdmetadata.nosync"];
  BOOL v7 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v5);
  uint64_t v8 = (void *)[*(id *)(a1 + 96) URLByAppendingPathComponent:@".cdmetadata"];
  BOOL v9 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (!objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v6, "path"))) {
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v8, "path")))
  {
    int v10 = [v9 removeItemAtURL:v8 error:v46 + 5];
    *((unsigned char *)v52 + 24) = v10;
    if (!v10)
    {
LABEL_9:
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Metadata migration failed: %@", "-[PFUbiquitySetupAssistant migrateMetadataRoot:]", 2819, v46[5]);
      }
      goto LABEL_11;
    }
  }
  else if (!*((unsigned char *)v52 + 24))
  {
    goto LABEL_9;
  }
  uint64_t v11 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:andLocalPeerID:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 152), *(void *)(a1 + 128));
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __48__PFUbiquitySetupAssistant_migrateMetadataRoot___block_invoke;
  uint64_t v60 = &unk_1E544FB70;
  uint64_t v61 = v9;
  uint64_t v62 = &v45;
  uint64_t v63 = &v51;
  [v11 coordinateWritingItemAtURL:v6 options:2 writingItemAtURL:v7 options:8 error:v46 + 5 byAccessor:buf];

  if (!*((unsigned char *)v52 + 24)) {
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(v6, "path")))
  {
    char v12 = [v9 removeItemAtURL:v6 error:v46 + 5];
    *((unsigned char *)v52 + 24) = v12;
  }
LABEL_11:

  if (*((unsigned char *)v52 + 24))
  {
LABEL_12:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = v46[5];
  if (!v13)
  {
    uint64_t v36 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v36, v37, v38, v39, v40, v41, v42, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    int v43 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v55 = 136315394;
      uint64_t v56 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v57 = 1024;
      int v58 = 2827;
      _os_log_fault_impl(&dword_18AB82000, v43, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v55, 0x12u);
    }
    goto LABEL_12;
  }
  uint64_t v44 = v46[5];
LABEL_15:
  int v14 = *((unsigned __int8 *)v52 + 24);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  if (!v14) {
    goto LABEL_32;
  }
  BOOL v15 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = +[PFUbiquityLocation createMetadataStoreFileLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void **)(a1 + 152));
  uint64_t v17 = -[PFUbiquityLocation createFullPath]((uint64_t)v16);
  *(unsigned char *)(a1 + 229) = [v15 fileExistsAtPath:v17];

  self;
  if ((-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v44) & 1) == 0)
  {
    uint64_t v13 = v44;
LABEL_32:
    if (v13)
    {
      if (a2)
      {
        BOOL result = 0;
        *a2 = v13;
        return result;
      }
    }
    else
    {
      uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v35 = __pflogFaultLog;
      BOOL result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiqui"
                           "tySetupAssistant.m";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2907;
      _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  self;
  uint64_t v18 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v44);
  *(void *)(a1 + 168) = v18;
  if (v18)
  {
    uint64_t v19 = (void *)+[PFUbiquityStoreMetadata storeMetadatasWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 112), v18[1]);
    uint64_t v20 = v19;
    if (v19 && [v19 count])
    {
      uint64_t v21 = [v20 lastObject];
      *(void *)(a1 + 176) = v21;
      if (v21) {
        *(unsigned char *)(a1 + 230) = 1;
      }
      if ((unint64_t)[v20 count] >= 2) {
        *(unsigned char *)(a1 + 233) = 1;
      }
    }
    if (!*(unsigned char *)(a1 + 230))
    {
      uint64_t v22 = [PFUbiquityStoreMetadata alloc];
      uint64_t v23 = *(void *)(a1 + 168);
      if (v23) {
        uint64_t v24 = *(void *)(v23 + 8);
      }
      else {
        uint64_t v24 = 0;
      }
      intptr_t v25 = [(PFUbiquityStoreMetadata *)v22 initWithUbiquityName:*(void *)(a1 + 112) andUbiquityRootLocation:*(void *)(a1 + 152) insertIntoManagedObjectContext:v24];
      *(void *)(a1 + 176) = v25;
    }
    *(void *)(a1 + 192) = 0;
    uint64_t v26 = -[_PFUbiquityStack createMetadataStoreKnowledgeVector:](*(void *)(a1 + 168), &v44);
    *(void *)(a1 + 192) = v26;
    if (v26) {
      goto LABEL_43;
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError fetching metadata store knowledge vector, metadata will be recovered: %@", "-[PFUbiquitySetupAssistant initializeStack:]", 2886, a1, v44);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError trying to open metadata store: %@", "-[PFUbiquitySetupAssistant initializeStack:]", 2892, a1, v44);
  }
  *(unsigned char *)(a1 + 233) = 1;
LABEL_43:
  if (!*(unsigned char *)(a1 + 229) || !*(unsigned char *)(a1 + 230)) {
    return 1;
  }
  BOOL result = 1;
  if (!*(unsigned char *)(a1 + 227)) {
    *(unsigned char *)(a1 + 233) = 1;
  }
  return result;
}

- (uint64_t)initializeBaselineForStore:(void *)a3 error:
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v76 = 0;
  id v6 = (id)[*(id *)(a1 + 56) objectForKey:@"PFUbiquitySetupPreviousModelVersionHashKey"];
  *(void *)(a1 + 144) = v6;
  if (v6) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 227)) {
    goto LABEL_6;
  }
  if (![*(id *)(a1 + 176) modelVersionHashString])
  {
    *(unsigned char *)(a1 + 233) = 1;
LABEL_6:
    BOOL v7 = *(void **)(a1 + 136);
    goto LABEL_7;
  }
  BOOL v7 = (void *)[*(id *)(a1 + 176) modelVersionHashString];
LABEL_7:
  id v8 = v7;
  *(void *)(a1 + 144) = v8;
  if (!v8) {
    goto LABEL_135;
  }
  [*(id *)(a1 + 56) setObject:v8 forKey:@"PFUbiquitySetupPreviousModelVersionHashKey"];
  *(unsigned char *)(a1 + 64) = 1;
LABEL_9:
  BOOL v9 = -[PFUbiquityBaseline initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:]([PFUbiquityBaseline alloc], "initWithLocalPeerID:ubiquityRootLocation:forStoreWithName:andManagedObjectModel:", *(void *)(a1 + 128), *(void *)(a1 + 152), *(void *)(a1 + 112), [*(id *)(a1 + 16) managedObjectModel]);
  *(void *)(a1 + 200) = v9;
  *(unsigned char *)(a1 + 208) = -[PFUbiquitySafeSaveFile existsInCloud](v9);
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nBaseline exists: %d", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1639, a1, *(unsigned __int8 *)(a1 + 208));
  }
  if (!*(unsigned char *)(a1 + 276) && [*(id *)(a1 + 144) isEqualToString:*(void *)(a1 + 136)])
  {
    if (*(unsigned char *)(a1 + 227)) {
      goto LABEL_35;
    }
    uint64_t v70 = a2;
    uint64_t v71 = a3;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    char v12 = *(void **)(a1 + 376);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v73 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          if (v17)
          {
            int v18 = *(_DWORD *)(v17 + 24);
            if (v18 == 22)
            {
              if ([*(id *)(v17 + 32) isEqualToString:*(void *)(a1 + 128)])
              {
                id v19 = (id)[v11 objectForKey:*(void *)(v17 + 48)];
                if (!v19)
                {
                  id v19 = (id)objc_opt_new();
                  [v11 setObject:v19 forKey:*(void *)(v17 + 48)];
                }
                [v19 addObject:v17];
              }
            }
            else if (v18 == 10 && ([*(id *)(v17 + 48) isEqualToString:*(void *)(a1 + 136)] & 1) == 0)
            {
              [v10 addObject:v17];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v14);
    }
    a2 = v70;
    a3 = v71;
    if (![v10 count])
    {
LABEL_34:

LABEL_35:
      if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", @"PFUbiquitySetupMigrateTransactionLogsKey"), "BOOLValue"))goto LABEL_73; {
      goto LABEL_61;
      }
    }
    if (*(unsigned char *)(a1 + 208))
    {
      if (![v11 count]
        || objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *(void *)(a1 + 136)), "count"))
      {
        goto LABEL_34;
      }
      uint64_t v20 = +[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]((uint64_t)PFUbiquitySetupAssistant, v10, *(void *)(a1 + 128), (uint64_t *)&v76);
      if (v20) {
        goto LABEL_41;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to find a previous baseline file to use for migration. %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1702, a1, v76);
      }
    }
    else
    {
      uint64_t v20 = +[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]((uint64_t)PFUbiquitySetupAssistant, v10, *(void *)(a1 + 128), (uint64_t *)&v76);
      if (v20)
      {
LABEL_41:
        uint64_t v21 = v20;

        permanentLocatiouint64_t n = v21->super._permanentLocation;
        if (permanentLocation) {
          permanentLocatiouint64_t n = (PFUbiquityLocation *)permanentLocation->_modelVersionHash;
        }
        *(void *)(a1 + 144) = permanentLocation;
        goto LABEL_47;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to find a previous baseline file to use for migration. %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1685, a1, v76);
      }
    }
    uint64_t v21 = 0;
LABEL_47:
  }
  uint64_t v23 = +[PFUbiquityLocation createCurrentBaselineLocation:forStoreName:peerID:andModelVersionHash:forFileNamed:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 6, *(void *)(a1 + 112), *(void *)(a1 + 128), *(void *)(a1 + 144), 0, *(void **)(a1 + 152));
  uint64_t v24 = -[PFUbiquityLocation createFullPath]((uint64_t)v23);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v24))
  {
    char v25 = 1;
    int v26 = 1;
  }
  else
  {
    uint64_t v27 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, *(void *)(a1 + 112), *(void *)(a1 + 144), *(void **)(a1 + 152));
    uint64_t v28 = -[PFUbiquityLocation createFullPath]((uint64_t)v27);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v28))
    {
      uint64_t v29 = a3;
      uint64_t v30 = [[PFUbiquityBaseline alloc] initWithBaselineLocation:v27 andLocalPeerID:*(void *)(a1 + 128)];
      uint64_t v31 = v30;
      if (v30
        && [(PFUbiquityBaseline *)v30 loadFileFromLocation:v30->super._currentLocation error:&v76])
      {
        char v25 = -[PFUbiquityBaseline makeCurrentBaselineWithError:]((uint64_t)v31, &v76);
        int v26 = 1;
      }
      else
      {
        int v26 = 0;
        char v25 = 1;
      }

      a3 = v29;
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCan't perform migration because there is no previous baseline file from which to get the managed object model: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1734, a1, v27);
      }
      char v25 = 0;
      int v26 = 1;
    }
  }
  if ((v25 & 1) == 0)
  {
    if (!v26) {
      goto LABEL_135;
    }
LABEL_73:
    if (*(unsigned char *)(a1 + 208)) {
      goto LABEL_74;
    }
LABEL_67:
    if (-[PFUbiquityKnowledgeVector isZeroVector](*(void *)(a1 + 72)))
    {
      uint64_t v36 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", [*(id *)(a1 + 16) managedObjectModel]);
      uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:*(void *)(a1 + 8)];
      [v37 setObject:&unk_1ED7E2C98 forKey:@"NSUbiquityImporterPrivateStoreKey"];
      uint64_t v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"));
      uint64_t v39 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
      if (objc_msgSend(v39, "fileExistsAtPath:", objc_msgSend(v38, "path")))
      {
        if ([v39 removeItemAtURL:v38 error:&v76])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nPurged temporary store directory.\n%@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1853, a1, v38);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
        {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to remove temporary store directory: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1856, a1, v76);
        }
      }
      if ([v39 createDirectoryAtURL:v38 withIntermediateDirectories:1 attributes:0 error:&v76])
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nCreated temporary store directory: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1861, a1, v38);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to create temproary store directory: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1863, a1, v76);
      }
      uint64_t v57 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v36, "addPersistentStoreWithType:configuration:URL:options:error:", *(void *)(a1 + 32), 0, objc_msgSend(v38, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a2, "URL"), "lastPathComponent")), v37, &v76);
      if (v57)
      {
        int v58 = (void *)v57;
        uint64_t v59 = *(void *)(a1 + 200);
        uint64_t v60 = *(void *)(a1 + 128);
      }
      else
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to create store for baseline: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1872, a1, v76);
        }
        uint64_t v59 = *(void *)(a1 + 200);
        uint64_t v60 = *(void *)(a1 + 128);
        int v58 = a2;
      }
      BOOL v61 = -[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:](v59, v58, v60, &v76);

      *(void *)(a1 + 216) = *(id *)(a1 + 72);
      if (!v61) {
        goto LABEL_135;
      }
    }
    else if (!-[PFUbiquityBaseline prepareForBaselineRollOfPersistentStore:andLocalPeerID:error:](*(void *)(a1 + 200), a2, *(void *)(a1 + 128), &v76))
    {
      goto LABEL_135;
    }
    if (-[PFUbiquityBaseline gatherContentsAndConstructArchiveWithError:](*(void *)(a1 + 200), &v76))
    {
      int v62 = -[PFUbiquitySafeSaveFile safeSaveFile:moveToPermanentLocation:error:](*(void *)(a1 + 200), 1, 1, &v76);
      *(unsigned char *)(a1 + 209) = 0;
      if (v62)
      {
        if (-[PFUbiquityBaseline makeCurrentBaselineWithError:](*(void *)(a1 + 200), &v76))
        {
          uint64_t v63 = *(void **)(a1 + 200);
          if (v63)
          {
            uint64_t v63 = (void *)v63[12];
            if (v63) {
              uint64_t v63 = (void *)v63[6];
            }
          }
          uint64_t v64 = v63;

          *(void *)(a1 + 216) = v64;
          if (-[PFUbiquityBaseline updateCurrentStoreIdentifier:error:](*(void **)(a1 + 200), [a2 identifier]))
          {
            return 1;
          }
        }
      }
    }
LABEL_135:
    id v48 = v76;
    if (v76)
    {
LABEL_136:
      if (a3)
      {
        uint64_t v45 = 0;
        *a3 = v48;
        return v45;
      }
      return 0;
    }
LABEL_108:
    uint64_t v49 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v49, v50, v51, v52, v53, v54, v55, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    uint64_t v56 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v78 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v79 = 1024;
      int v80 = 1908;
      _os_log_fault_impl(&dword_18AB82000, v56, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
LABEL_61:
  [*(id *)(a1 + 56) setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupMigrateTransactionLogsKey"];
  *(unsigned char *)(a1 + 64) = 1;
  if (([a2 isReadOnly] & 1) == 0)
  {
    [a2 setMetadata:*(void *)(a1 + 56)];
    uint64_t v32 = objc_alloc_init(NSSaveChangesRequest);
    [a2 executeRequest:v32 withContext:0 error:0];
  }
  uint64_t v33 = [*(id *)(a1 + 16) managedObjectModel];
  uint64_t v34 = *(PFUbiquityMigrationManager **)(a1 + 288);
  if (!v34)
  {
    uint64_t v34 = [[PFUbiquityMigrationManager alloc] initWithDestinationModel:v33 storeName:*(void *)(a1 + 112) previousModelVersionHash:*(void *)(a1 + 144) ubiquityRootLocation:*(void *)(a1 + 152) localPeerID:*(void *)(a1 + 128)];
    *(void *)(a1 + 288) = v34;
    if (!v34)
    {
      id v48 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8], 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Failed to migrate baseline, unable to create ubiquity migration manager", @"reason", 0) code userInfo];
      id v76 = v48;
      if (v48) {
        goto LABEL_136;
      }
      goto LABEL_108;
    }
  }
  if ((-[PFUbiquityMigrationManager migrateTransactionLogs:andBaselineIfNecessaryForStoreName:peerID:error:](v34, 1, *(void *)(a1 + 112), *(void *)(a1 + 128), &v76) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Baseline migration failed for store with ubiquity name: %@\nError: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1773, *(void *)(a1 + 112), v76, [v76 userInfo]);
    }
    goto LABEL_135;
  }
  *(unsigned char *)(a1 + 275) = 1;
  [*(id *)(a1 + 56) removeObjectForKey:@"PFUbiquitySetupMigrateTransactionLogsKey"];
  *(unsigned char *)(a1 + 64) = 1;
  *(unsigned char *)(a1 + 296) = 1;
  int v35 = -[PFUbiquitySafeSaveFile existsInCloud](*(void **)(a1 + 200));
  *(unsigned char *)(a1 + 208) = v35;
  if (!v35) {
    goto LABEL_67;
  }
LABEL_74:
  self;
  if ((_usesCloudDocs & 1) != 0
    || -[PFUbiquityBaseline isUploaded:](*(void *)(a1 + 200), (uint64_t)&v76))
  {
    uint64_t v40 = *(void **)(a1 + 200);
    if (!v40 || v40[3] == v40[2])
    {
      int v41 = [v40 moveToPermanentLocation:&v76];
      goto LABEL_91;
    }
  }
  else
  {
    *(unsigned char *)(a1 + 209) = 1;
    uint64_t v42 = *(void *)(a1 + 200);
    if (v42)
    {
      uint64_t v43 = *(void *)(v42 + 8);
      if (v43) {
        LOBYTE(v43) = -[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v43, 0, 0);
      }
    }
    else
    {
      LOBYTE(v43) = 0;
    }
    *(unsigned char *)(a1 + 210) = v43;
    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
    {
      uint64_t v44 = *(void *)(a1 + 200);
      if (v44) {
        uint64_t v44 = *(void *)(v44 + 24);
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nFound existing baseline file that needs to upload (%d, %d): %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1799, a1, *(unsigned __int8 *)(a1 + 209), *(unsigned __int8 *)(a1 + 210), v44);
    }
  }
  int v41 = 1;
LABEL_91:
  if (*(unsigned char *)(a1 + 209))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nBaseline file is still uploading: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1803, a1, *(void *)(a1 + 200));
    }

    *(void *)(a1 + 216) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:&stru_1ED787880];
    if (v41) {
      return 1;
    }
    goto LABEL_135;
  }
  if (!v41) {
    goto LABEL_135;
  }
  if (!-[PFUbiquitySafeSaveFile downloadLatestVersion:error:](*(void *)(a1 + 200), 1, (uint64_t *)&v76))
  {
    uint64_t v45 = 1;
    if (!+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      return v45;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nThe baseline file exists but could not be downloaded: %@\nError: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1837, a1, *(void *)(a1 + 200), v76, [v76 userInfo]);
    return 1;
  }
  uint64_t v46 = *(void **)(a1 + 200);
  if (!v46 || ![v46 loadFileFromLocation:v46[3] error:&v76])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nThe baseline file exists, but could not be read: %@\nError: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant initializeBaselineForStore:error:]", 1834, a1, *(void *)(a1 + 200), v76, [v76 userInfo]);
    }
    goto LABEL_135;
  }

  uint64_t v47 = *(void **)(a1 + 200);
  if (v47)
  {
    uint64_t v47 = (void *)v47[12];
    if (v47) {
      uint64_t v47 = (void *)v47[6];
    }
  }
  *(void *)(a1 + 216) = v47;
  if (*(unsigned char *)(a1 + 227))
  {
    uint64_t v45 = 1;
    if ((-[PFUbiquityBaseline metadataMatchesCurrentMetadata:](*(void **)(a1 + 200)) & 1) == 0 && !v76) {
      *(unsigned char *)(a1 + 226) = 1;
    }
  }
  else
  {
    if (!*(void *)(a1 + 176) && !*(unsigned char *)(a1 + 233))
    {
      uint64_t v66 = [PFUbiquityStoreMetadata alloc];
      uint64_t v67 = *(void *)(a1 + 168);
      if (v67) {
        uint64_t v68 = *(void *)(v67 + 8);
      }
      else {
        uint64_t v68 = 0;
      }
      uint64_t v69 = [(PFUbiquityStoreMetadata *)v66 initWithUbiquityName:*(void *)(a1 + 112) andUbiquityRootLocation:*(void *)(a1 + 152) insertIntoManagedObjectContext:v68];
      *(void *)(a1 + 176) = v69;

      -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](*(void **)(a1 + 176), a2, *(void *)(a1 + 152));
    }
    uint64_t v45 = 1;
    *(unsigned char *)(a1 + 296) = 1;
  }
  return v45;
}

- (BOOL)checkKnowledgeVectorsAndBaselineWithStore:(void *)a3 error:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v43 = 0;
  if (!*(void *)(a1 + 176))
  {
    id v6 = [PFUbiquityStoreMetadata alloc];
    uint64_t v7 = *(void *)(a1 + 168);
    if (v7) {
      uint64_t v8 = *(void *)(v7 + 8);
    }
    else {
      uint64_t v8 = 0;
    }
    BOOL v9 = [(PFUbiquityStoreMetadata *)v6 initWithUbiquityName:*(void *)(a1 + 112) andUbiquityRootLocation:*(void *)(a1 + 152) insertIntoManagedObjectContext:v8];
    *(void *)(a1 + 176) = v9;
    -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v9, a2, *(void *)(a1 + 152));
  }
  if (!*(void *)(a1 + 248) && *(void *)(a1 + 192))
  {

    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 240) = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:*(void *)(a1 + 128) andKnowledgeVector:*(void *)(a1 + 192) forPeerID:*(void *)(a1 + 128) storeName:*(void *)(a1 + 112) modelVersionHash:*(void *)(a1 + 136) andUbiquityRootLocation:*(void *)(a1 + 152)];
    *(void *)(a1 + 248) = *(id *)(a1 + 192);
    uint64_t v21 = *(void **)(a1 + 240);
    if (v21 && [v21 writeFileToLocation:v21[3] error:&v43])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote peer receipt file: %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3685, a1, *(void *)(a1 + 240));
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError writing local peer receipt file to disk: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3687, a1, v43, [v43 userInfo]);
    }
  }
  if ([*(id *)(a1 + 72) isEqual:*(void *)(a1 + 248)])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal store knowledge vector matches receipt knowledge vector.", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3693, a1);
    }
    id v10 = *(id **)(a1 + 72);
    if (*(unsigned char *)(a1 + 208))
    {
      uint64_t v11 = *(void *)(a1 + 200);
      if (v11 && (uint64_t v12 = *(void *)(v11 + 96)) != 0) {
        uint64_t v13 = *(void *)(v12 + 48);
      }
      else {
        uint64_t v13 = 0;
      }
      if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](v10, v13)) {
        goto LABEL_49;
      }
    }
    else if (!-[PFUbiquityKnowledgeVector isZeroVector]((uint64_t)v10) || !*(unsigned char *)(a1 + 273))
    {
      goto LABEL_49;
    }
    *(unsigned char *)(a1 + 296) = 1;
    goto LABEL_49;
  }
  if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](*(id **)(a1 + 72), *(void *)(a1 + 248)))
  {

    *(void *)(a1 + 240) = 0;
    uint64_t v22 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:*(void *)(a1 + 128) andKnowledgeVector:*(void *)(a1 + 72) forPeerID:*(void *)(a1 + 128) storeName:*(void *)(a1 + 112) modelVersionHash:*(void *)(a1 + 136) andUbiquityRootLocation:*(void *)(a1 + 152)];
    *(void *)(a1 + 240) = v22;
    if (v22
      && [(PFUbiquityPeerReceipt *)v22 writeFileToLocation:v22->super._currentLocation error:&v43])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully wrote peer receipt file: %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3731, a1, *(void *)(a1 + 240), v42);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError writing local peer receipt file to disk: %@\nuserInfo: %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3733, a1, v43, [v43 userInfo]);
    }
LABEL_49:
    if (*(unsigned char *)(a1 + 296)) {
      return 1;
    }
    uint64_t v31 = objc_msgSend((id)objc_msgSend(a2, "metadata"), "objectForKey:", @"com.apple.coredata.ubiquity.baseline.timestamp");
    uint64_t v32 = +[PFUbiquityLocation createBaselineLocation:forStoreName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, 10, *(void *)(a1 + 112), *(void *)(a1 + 136), *(void **)(a1 + 152));
    uint64_t v33 = -[PFUbiquityLocation createFullPath]((uint64_t)v32);
    memset(&buf, 0, sizeof(buf));
    if (stat((const char *)[v33 fileSystemRepresentation], &buf) < 0)
    {
      if (*__error() == 2)
      {

        int v35 = 0;
LABEL_69:

        return 1;
      }
      if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        uint64_t v38 = __error();
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to get the mod time for baseline (%d): %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3757, a1, *v38, v33);
      }

      int v35 = 0;
    }
    else
    {
      id v34 = objc_alloc(NSNumber);
      int v35 = (void *)[v34 initWithLong:buf.st_mtimespec.tv_sec];
      uint64_t v36 = [v31 longValue];
      uint64_t v37 = [v35 longValue];

      if (v36 == v37) {
        goto LABEL_69;
      }
    }
    uint64_t v39 = [[PFUbiquityBaseline alloc] initWithBaselineLocation:v32 andLocalPeerID:*(void *)(a1 + 128)];
    if (-[PFUbiquitySafeSaveFile existsInCloud](v39))
    {
      if (!-[PFUbiquitySafeSaveFile downloadLatestVersion:error:]((uint64_t)v39, 0, (uint64_t *)&v43))
      {
        int v41 = (unsigned char *)(a1 + 226);
        goto LABEL_65;
      }
      if (v39)
      {
        if ([(PFUbiquityBaseline *)v39 loadFileFromLocation:v39->super._currentLocation error:&v43])
        {
          char v40 = -[PFUbiquityBaseline canReplaceStoreAtKnowledgeVector:](v39, *(id **)(a1 + 72));
          *(unsigned char *)(a1 + 226) = 1;
          if (v40)
          {
            int v41 = (unsigned char *)(a1 + 296);
LABEL_65:
            *int v41 = 1;
          }
        }
      }
    }

    if (v35)
    {
      if (([a2 isReadOnly] & 1) == 0)
      {
        [*(id *)(a1 + 56) setObject:v35 forKey:@"com.apple.coredata.ubiquity.baseline.timestamp"];
        *(unsigned char *)(a1 + 64) = 1;
      }
    }
    goto LABEL_69;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLocal store file is behind receipt.\nStore: %@\nReceipt: %@", "-[PFUbiquitySetupAssistant checkKnowledgeVectorsAndBaselineWithStore:error:]", 3705, a1, *(void *)(a1 + 72), *(void *)(a1 + 192));
  }
  *(unsigned char *)(a1 + 296) = 1;

  uint64_t v14 = [[PFUbiquityPeerReceipt alloc] initWithLocalPeerID:*(void *)(a1 + 128) andKnowledgeVector:*(void *)(a1 + 72) forPeerID:*(void *)(a1 + 128) storeName:*(void *)(a1 + 112) modelVersionHash:*(void *)(a1 + 136) andUbiquityRootLocation:*(void *)(a1 + 152)];
  *(void *)(a1 + 240) = v14;
  if (v14) {
    BOOL v15 = [(PFUbiquityPeerReceipt *)v14 writeFileToLocation:v14->super._currentLocation error:&v43];
  }
  else {
    BOOL v15 = 0;
  }
  -[PFUbiquityStoreMetadata updatePeerStatesToMatchKnowledgeVector:](*(void **)(a1 + 176), *(void *)(a1 + 72));

  *(void *)(a1 + 192) = 0;
  id v16 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](*(void *)(a1 + 72));
  *(void *)(a1 + 192) = [[PFUbiquityKnowledgeVector alloc] initWithKnowledgeVectorString:v16];

  uint64_t v17 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary](*(void *)(a1 + 72));
  uint64_t v18 = *(void *)(a1 + 168);
  if (v18) {
    id v19 = *(void **)(v18 + 8);
  }
  else {
    id v19 = 0;
  }
  +[PFUbiquityTransactionEntry deleteTransactionEntriesAfterPeerState:forStoreName:inManagedObjectContext:]((uint64_t)PFUbiquityTransactionEntry, v17, *(void *)(a1 + 112), v19);
  if (v15) {
    goto LABEL_49;
  }
  if (v43)
  {
    if (a3)
    {
      BOOL result = 0;
      *a3 = v43;
      return result;
    }
  }
  else
  {
    uint64_t v23 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    uint64_t v30 = __pflogFaultLog;
    BOOL result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    buf.st_dev = 136315394;
    *(void *)&buf.st_mode = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbi"
                              "quitySetupAssistant.m";
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = 3800;
    _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", (uint8_t *)&buf, 0x12u);
  }
  return 0;
}

- (uint64_t)sideLoadStore:(void *)a3 error:
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v73 = 0;
  self;
  id v6 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, *(void *)(a1 + 112), *(void *)(a1 + 128));
  if (v6 != *(void **)(a1 + 320))
  {
    uint64_t v7 = 0;
LABEL_121:
    uint64_t v26 = 0;
    goto LABEL_122;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", @"CoreDataStores"), "URLByAppendingPathComponent:", *(void *)(a1 + 112));
  uint64_t v9 = *(void *)(a1 + 256);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 32);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v8, "URLByAppendingPathComponent:", v10), "URLByAppendingPathComponent:", *(void *)(a1 + 128));
  uint64_t v12 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = [v11 URLByAppendingPathComponent:@"sideLoad.store"];
  uint64_t v7 = +[_PFUbiquityRecordsImporter createPrivateCoordinatorForStore:error:]((uint64_t)_PFUbiquityRecordsImporter, a2);
  BOOL v14 = v7 != 0;
  if (objc_msgSend(v12, "fileExistsAtPath:", objc_msgSend(v11, "path")))
  {
    if (v7
      && -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](v7, "destroyPersistentStoreAtURL:withType:options:error:", v13, [a2 type], objc_msgSend(a2, "options"), &v73))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Cleared out store for side-load: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2951, v13);
      }
      uint64_t v15 = [(NSPersistentStoreCoordinator *)v7 persistentStoreForURL:v13];
      if (v15
        && ![(NSPersistentStoreCoordinator *)v7 removePersistentStore:v15 error:&v73]
        && +[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing side-load store %@: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2954, a1, v15, v73);
      }
      BOOL v14 = 1;
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing side-load store: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2958, a1, v73);
      }
      BOOL v14 = 0;
    }
    if ([v12 removeItemAtURL:v11 error:&v73])
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Cleared out directory for side-load: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2961, v11);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError removing side-load directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2963, a1, v73);
    }
  }
  if ([v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v73])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Created directory for side-load: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2968, v11);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError creating side-load directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 2970, a1, v73);
  }
  if (*(unsigned char *)(a1 + 208))
  {
    id v16 = *(void **)(a1 + 200);
    if (!v16) {
      goto LABEL_121;
    }
    if (v16[18])
    {
      if (!v14) {
        goto LABEL_121;
      }
    }
    else if (![v16 loadFileFromLocation:v16[3] error:&v73])
    {
      goto LABEL_121;
    }
    if (!-[PFUbiquityBaseline importBaselineForStoreAtURL:ofType:options:withLocalPeerID:stack:andPersistentStoreCoordinator:error:](*(void *)(a1 + 200), v13, *(void *)(a1 + 32), *(void *)(a1 + 8), *(void *)(a1 + 128), *(void *)(a1 + 168), v7, &v73))goto LABEL_121; {
    *(unsigned char *)(a1 + 211) = 1;
    }
    *(unsigned char *)(a1 + 233) = 1;
  }
  else if (!v14)
  {
    goto LABEL_121;
  }
  uint64_t v17 = (void *)+[_PFUbiquityRecordsImporter addPrivateStore:toCoordinator:atURL:error:]((uint64_t)_PFUbiquityRecordsImporter, a2, v7, v13, (uint64_t *)&v73);
  if (!v17) {
    goto LABEL_121;
  }
  if (*(unsigned char *)(a1 + 211))
  {
    uint64_t v18 = *(void **)(a1 + 200);
    if (v18)
    {
      uint64_t v18 = (void *)v18[12];
      if (v18) {
        uint64_t v18 = (void *)v18[6];
      }
    }
    id v19 = v18;

    *(void *)(a1 + 216) = v19;
    uint64_t v21 = *(void *)(a1 + 320);
    if (v21)
    {
      uint64_t v22 = *(void *)(v21 + 88);
      if (v22)
      {
        uint64_t v23 = *(void **)(v22 + 120);
        if (v23) {
          objc_setProperty_nonatomic(v23, v20, v19, 80);
        }
      }
    }
    int v24 = +[PFUbiquityBaseline removePeerSpecificIdentifiersFromStore:withLocalPeerID:]((uint64_t)PFUbiquityBaseline, v17, *(void *)(a1 + 128));
  }
  else
  {
    int v24 = 1;
  }
  uint64_t v26 = -[_PFUbiquityRecordsImporter initWithLocalPeerID:ubiquityRootLocation:storeName:andPrivateStore:]([_PFUbiquityRecordsImporter alloc], *(void *)(a1 + 128), *(void *)(a1 + 152), *(void **)(a1 + 112), v17);
  if (!v24) {
    goto LABEL_122;
  }
  if (v6)
  {
    uint64_t v27 = v6[11];
    if (v27)
    {
      uint64_t v28 = *(void **)(v27 + 88);
      if (v28) {
        objc_setProperty_atomic(v28, v25, *(id *)(a1 + 216), 72);
      }
    }
  }
  if (-[_PFUbiquityStack purgeAndInitializeMetadataStoreFileWithError:](*(void *)(a1 + 168), &v73))
  {
    uint64_t v29 = [PFUbiquityStoreMetadata alloc];
    uint64_t v30 = *(void *)(a1 + 168);
    uint64_t v31 = v30 ? *(void *)(v30 + 8) : 0;
    uint64_t v32 = [(PFUbiquityStoreMetadata *)v29 initWithUbiquityName:*(void *)(a1 + 112) andUbiquityRootLocation:*(void *)(a1 + 152) insertIntoManagedObjectContext:v31];
    *(void *)(a1 + 176) = v32;
    -[PFUbiquityStoreMetadata updateWithStore:andRootLocation:](v32, a2, *(void *)(a1 + 152));

    uint64_t v33 = *(void *)(a1 + 168);
    id v34 = v33 ? *(void **)(v33 + 8) : 0;
    int v35 = [v34 save:&v73];
    *(unsigned char *)(a1 + 233) = v35 ^ 1;
  }
  else
  {
    int v35 = 0;
  }
  *(void *)(a1 + 176) = 0;

  *(void *)(a1 + 168) = 0;
  if (!v35)
  {
LABEL_122:
    if (v73)
    {
      if (a3)
      {
        uint64_t v63 = 0;
        *a3 = v73;
        goto LABEL_128;
      }
    }
    else
    {
      uint64_t v64 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v71 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiq"
                             "uitySetupAssistant.m";
        __int16 v75 = 1024;
        int v76 = 3112;
        _os_log_fault_impl(&dword_18AB82000, v71, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v63 = 0;
    goto LABEL_128;
  }
  uint64_t v36 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void **)(a1 + 160));
  if (+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v36, &v73))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nPruned local root directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3037, a1, v36);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError pruning local root directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3039, a1, v36);
  }

  uint64_t v37 = +[PFUbiquityLocation createPeerRootLocationForPeerID:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void **)(a1 + 152));
  if (+[PFUbiquityTransactionLog pruneTemporaryLogDirectoryForPeerRootLocation:error:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v37, &v73))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nPruned ubiquity root directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3045, a1, v37);
    }
  }
  else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError pruning ubiquity root directory: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3047, a1, v37);
  }

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", a1, sel_exportedLog_, @"PFUbiquityLocationWasExportedNotification", *(void *)(a1 + 152));
  uint64_t v38 = [[PFUbiquitySwitchboardCacheWrapper alloc] initWithStoreName:*(void *)(a1 + 112) privateStore:v17 forLocalPeerID:*(void *)(a1 + 128) andUbiquityRootLocation:*(void *)(a1 + 152)];
  uint64_t v39 = v38;
  if (v38) {
    uint64_t v38 = (PFUbiquitySwitchboardCacheWrapper *)v38->_peerRangeCache;
  }
  if (-[PFUbiquityPeerRangeCache cachePeerRanges:]((uint64_t)v38))
  {
    if (v26) {
      objc_setProperty_nonatomic(v26, v40, v39, 88);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import started (Side load)", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3061);
    }
    BOOL v41 = -[_PFUbiquityRecordsImporter discoverAndImportAllAvailableLogs:error:](v26, 1u, &v73);
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Import finished (Side load)", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3063);
    }
    if (v41)
    {
      int v42 = -[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:](a1, a2, (uint64_t)v26);
      goto LABEL_90;
    }
    if (v73)
    {
      if ([v73 code] == 134302)
      {
        uint64_t v43 = [v73 domain];
        if (v43 == *MEMORY[0x1E4F281F8])
        {
          [*(id *)(a1 + 56) setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupDoFork"];
          *(void *)stat buf = 0;
          if ([(NSPersistentStoreCoordinator *)v7 removePersistentStore:v17 error:buf])
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Failed to remove sideload store: %@\n%@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3073, v17, *(void *)buf);
            }
          }
        }
      }
    }
  }
  int v42 = 0;
LABEL_90:

  if (!v42) {
    goto LABEL_122;
  }
  if (!*(unsigned char *)(a1 + 313))
  {
    uint64_t v44 = *(void *)(a1 + 320);
    if (v44 && (v45 = *(void *)(v44 + 88)) != 0 && (uint64_t v46 = *(void *)(v45 + 88)) != 0) {
      uint64_t v47 = *(void *)(v46 + 48);
    }
    else {
      uint64_t v47 = 0;
    }
    -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v47, *(void *)(a1 + 112), *(void *)(a1 + 152));
    uint64_t v48 = *(void *)(a1 + 320);
    if (v48 && (v49 = *(void *)(v48 + 88)) != 0 && (uint64_t v50 = *(void *)(v49 + 88)) != 0) {
      uint64_t v51 = *(void *)(v50 + 48);
    }
    else {
      uint64_t v51 = 0;
    }
    -[PFUbiquityTransactionLogCache removeLogsCachedForStoreNamed:withUbiquityRootLocation:](v51, *(void *)(a1 + 112), *(void *)(a1 + 160));
    uint64_t v52 = *(void *)(a1 + 320);
    if (v52 && (uint64_t v53 = *(void *)(v52 + 88)) != 0 && (v54 = *(void *)(v53 + 88)) != 0) {
      uint64_t v55 = *(void *)(v54 + 32);
    }
    else {
      uint64_t v55 = 0;
    }
    -[PFUbiquityGlobalObjectIDCache purgeCache](v55);
    uint64_t v56 = *(void *)(a1 + 320);
    if (v56 && (uint64_t v57 = *(void *)(v56 + 88)) != 0 && (v58 = *(void *)(v57 + 88)) != 0) {
      uint64_t v59 = *(void *)(v58 + 56);
    }
    else {
      uint64_t v59 = 0;
    }
    if (-[PFUbiquityTransactionHistoryCache purgeCacheAndWritePendingEntries:error:](v59, 0))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nPurged history cache", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3092, a1);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError purging history cache: %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3095, a1, v73);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
    {
      uint64_t v61 = *(void *)(a1 + 72);
      if (v26)
      {
        id Property = (id)v26[11];
        if (Property) {
          id Property = objc_getProperty(Property, v60, 64, 1);
        }
      }
      else
      {
        id Property = 0;
      }
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Side load finish: %@ / %@", "-[PFUbiquitySetupAssistant sideLoadStore:error:]", 3107, v61, Property);
    }
  }
  uint64_t v63 = 1;
LABEL_128:

  return v63;
}

- (uint64_t)respondToBaselineRoll:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v4 = *(void **)(a1 + 200);
  if (!v4) {
    goto LABEL_14;
  }
  if (v4[18] && v4[12])
  {
    char v5 = 0;
  }
  else
  {
    char v6 = [v4 loadFileFromLocation:v4[3] error:&v20];
    id v4 = *(void **)(a1 + 200);
    char v5 = v6 ^ 1;
    if (!v4)
    {
LABEL_14:
      if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Couldn't load baseline metadata from baseline: %@\n%@", "-[PFUbiquitySetupAssistant respondToBaselineRoll:]", 3961, *(void *)(a1 + 200), v20);
      }
      uint64_t v9 = 0;
LABEL_17:
      if (v20)
      {
        if (a2)
        {
          uint64_t v10 = 0;
          *a2 = v20;
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
        uint64_t v18 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)stat buf = 136315394;
          uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
          __int16 v23 = 1024;
          int v24 = 3975;
          _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      uint64_t v10 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v7 = v4[12];
  if (!v7 || ![*(id *)(v7 + 8) length]) {
    goto LABEL_14;
  }
  uint64_t v8 = *(void **)(a1 + 200);
  if (v8) {
    uint64_t v8 = (void *)v8[12];
  }
  uint64_t v9 = v8;
  if ((v5 & 1) != 0 || !-[PFUbiquityBaseline makeCurrentBaselineWithError:](*(void *)(a1 + 200), &v20)) {
    goto LABEL_17;
  }
  +[PFUbiquityTransactionLog truncateLogFilesBeforeBaselineMetadata:withLocalPeerID:andUbiquityRootLocation:]((uint64_t)PFUbiquityTransactionLog, (uint64_t)v9, *(void **)(a1 + 128), *(void **)(a1 + 152));
  uint64_t v10 = 1;
LABEL_23:

  return v10;
}

- (uint64_t)attemptMetadataRecoveryForStore:(uint64_t *)a3 error:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  char v6 = (id **)(a1 + 168);
  uint64_t v7 = 1;

  *char v6 = 0;
  v6[1] = 0;
  uint64_t v8 = [[PFUbiquityStoreMetadataMedic alloc] initWithStore:a2 localPeerID:*(void *)(a1 + 128) andUbiquityRootLocation:*(void *)(a1 + 152)];
  if (-[PFUbiquityStoreMetadataMedic recoverMetadataWithError:]((void **)&v8->super.isa, &v23))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nSuccessfully recovered metadata", "-[PFUbiquitySetupAssistant attemptMetadataRecoveryForStore:error:]", 2040, a1);
    }
    *(unsigned char *)(a1 + 296) = 1;
    self;
    if (!-[PFUbiquityMetadataFactory cacheEntryForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v23)|| ((self, v9 = -[PFUbiquityMetadataFactory newStackForLocalPeerID:storeName:andUbiquityRootLocation:error:](_sharedFactory, *(void **)(a1 + 128), *(void **)(a1 + 112), *(void **)(a1 + 152), &v23), (*char v6 = v9) == 0)? (v10 = 0): (v10 = v9[1]), v11 = +[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, *(void **)(a1 + 112), v10),
          (*(void *)(a1 + 176) = v11) == 0))
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = 0;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Store metadata recovery appears to have failed, please try adding the store to the coordinator again. If that is unsuccessful, migrate the data to a new ubiquitized persistent store.", *MEMORY[0x1E4F28568] forKey];
      uint64_t v23 = [v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:134312 userInfo:v13];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  if ((v7 & 1) == 0)
  {
    if (v23)
    {
      if (a3) {
        *a3 = v23;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315394;
        uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        __int16 v26 = 1024;
        int v27 = 2060;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v7;
}

void __54__PFUbiquitySetupAssistant_finishSetupForStore_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 64) && ([*(id *)(a1 + 40) isReadOnly] & 1) == 0)
  {
    [*(id *)(a1 + 40) setMetadata:*(void *)(*(void *)(a1 + 32) + 56)];
    uint64_t v2 = objc_alloc_init(NSSaveChangesRequest);
    [*(id *)(a1 + 40) executeRequest:v2 withContext:0 error:0];
  }
}

- (uint64_t)moveLocalLogFilesToUbiquityLocation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  uint64_t v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 136), *(void **)(a1 + 152));
  char v5 = -[PFUbiquityLocation createFullPath]((uint64_t)v4);
  uint64_t v29 = v4;
  if ([v3 fileExistsAtPath:v5])
  {
LABEL_2:
    char v6 = 0;
    char v7 = 1;
    goto LABEL_9;
  }
  if ([v3 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v36])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Created ubiquity peer log directory: %@", "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3175, v5);
    }
    goto LABEL_2;
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to write to peer transaction log directory: %@\nError: %@\n", "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3178, a1, v5, v36);
  }
  char v7 = 0;
  char v6 = 1;
LABEL_9:

  if (v6)
  {
    uint64_t v8 = 0;
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 136), *(void **)(a1 + 160));
  id v10 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v8, (uint64_t)&v36);
  uint64_t v9 = v10;
  if (v10)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v11)
    {
      char v31 = v7;
      uint64_t v30 = v8;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if (v14 && *(_DWORD *)(v14 + 24) == 22)
          {
            uint64_t v15 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 136), *(void *)(v14 + 56), *(void **)(a1 + 152));
            uint64_t v16 = -[PFUbiquityLocation createFullPath](v14);
            uint64_t v17 = -[PFUbiquityLocation createFullPath]((uint64_t)v15);
            if ([v3 moveItemAtPath:v16 toPath:v17 error:&v36])
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMoved local log: %@ to %@", "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3196, a1, v16, v17);
              }
            }
            else
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError moving local log: %@ to %@\nError: %@", "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3198, a1, v16, v17, v36);
              }
              char v31 = 0;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v11);
      uint64_t v8 = v30;
      char v7 = v31;
    }
  }
  else
  {
    if (!+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      goto LABEL_11;
    }
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError trying to read peer version directory: %@", "-[PFUbiquitySetupAssistant moveLocalLogFilesToUbiquityLocation:]", 3208, a1, v36);
    uint64_t v9 = 0;
  }
LABEL_32:
  if (v7)
  {
    uint64_t v18 = 1;
    goto LABEL_40;
  }
  if (!v36)
  {
    uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    __int16 v26 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315394;
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v39 = 1024;
      int v40 = 3213;
      _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_39;
  }
  if (!a2)
  {
LABEL_39:
    uint64_t v18 = 0;
    goto LABEL_40;
  }
  uint64_t v18 = 0;
  *a2 = v36;
LABEL_40:

  return v18;
}

- (uint64_t)pruneStagingDirectoryForStore:(uint64_t)a1 error:(void *)a2
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    char v5 = (void *)[*(id *)(v4 + 8) objectForKey:*(void *)(a1 + 128)];
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    id v6 = (id)[objc_alloc(NSNumber) initWithInt:0];
  }
  char v7 = +[PFUbiquityLocation createStagingPeerStoreVersionLocationForExportingPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 136), *(void **)(a1 + 152));
  id v8 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v7, (uint64_t)&v31);
  uint64_t v9 = v8;
  __int16 v26 = v7;
  if (!v8)
  {
    id v10 = v7;
    if (v31)
    {
      if (a2)
      {
        uint64_t v16 = 0;
        uint64_t v9 = 0;
        *a2 = v31;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315394;
        long long v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        __int16 v34 = 1024;
        int v35 = 3895;
        _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v16 = 0;
    uint64_t v9 = 0;
    goto LABEL_36;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v7;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (v14 && *(_DWORD *)(v14 + 24) == 26)
        {
          uint64_t v15 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:v14 andLocalPeerID:*(void *)(a1 + 128)];
          if (-[PFUbiquityTransactionLog loadComparisonMetadataWithError:]((uint64_t)v15, &v31)
            && [-[PFUbiquityTransactionLog transactionNumber](v15) compare:v6] != 1)
          {
            if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:]((uint64_t)v15, &v31))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:2])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Moved orphaned log to sync'd directory: %@", "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3873, v15);
              }
            }
            else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to move log to permanent location: %@", "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3875, a1, v31);
            }
          }
          else if (-[PFUbiquityTransactionLog deleteLogFileWithError:]((uint64_t)v15, &v31))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Deleted orphaned log: %@", "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3880, v15);
            }
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:3])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to delete log: %@", "-[PFUbiquitySetupAssistant pruneStagingDirectoryForStore:error:]", 3882, a1, v31);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v11);
    uint64_t v16 = 1;
    id v10 = v26;
  }
  else
  {
    uint64_t v16 = 1;
  }
LABEL_36:

  return v16;
}

- (uint64_t)seedStore:(uint64_t *)a3 error:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  id v6 = (NSPersistentStoreCoordinator *)objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  if (v6
    && (id v6 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v6)) != 0&& (v7 = [a2 type], v8 = *(void *)(a1 + 304), v31 = @"NSReadOnlyPersistentStoreOption", v32[0] = &unk_1ED7E2C98, (v9 = -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v6, "addPersistentStoreWithType:configuration:URL:options:error:", v7, 0, v8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1), &v23)) != 0)&& -[NSPersistentStoreCoordinator migratePersistentStore:toURL:options:withType:error:](v6, "migratePersistentStore:toURL:options:withType:error:", v9,
         [a2 URL],
         [a2 options],
         @"SQLite",
         &v23))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Successfully migrated seed store: %@", "-[PFUbiquitySetupAssistant seedStore:error:]", 3921, v9);
    }
  }
  else
  {
    uint64_t v10 = v23;
    if (v23) {
      goto LABEL_12;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    long long v29 = @"failed to seed store during asynchronous iCloud setup";
    uint64_t v12 = *(void *)(a1 + 304);
    if (!v12) {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v30 = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v10 = [v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:134080 userInfo:v13];
    uint64_t v23 = v10;
    if (v10)
    {
LABEL_12:
      if (a3) {
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 136315394;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        __int16 v27 = 1024;
        int v28 = 3936;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v24;
}

id __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v2;
}

void __74__PFUbiquitySetupAssistant_initializeStoreKnowledgeVectorFromStore_error___block_invoke_2(uint64_t *a1)
{
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Coordinated read finished for ubiquity root url: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke", 1452, a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

intptr_t __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_2(void *a1, void *a2)
{
  if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Initial sync handler called, %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_2", 1472, a2);
  }
  __dmb(0xBu);
  uint64_t v4 = a1[4];
  if (!*(_DWORD *)(v4 + 368))
  {
    if (a2)
    {
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1[5] + 8) + 40), 1u);
      atomic_fetch_add((atomic_uint *volatile)(a1[4] + 368), 1u);
      *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
      uint64_t v4 = a1[4];
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)(v4 + 368), 1u);
    }
  }
  char v5 = *(NSObject **)(v4 + 360);

  return dispatch_semaphore_signal(v5);
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Attempting to download Peers hit a serious error for peers to download %@ with userInfo %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_3", 1544, a2, [a2 userInfo]);
    }
  }
}

void __60__PFUbiquitySetupAssistant_canReadFromUbiquityRootLocation___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Attempting to download root URL (%@) hit a serious error: %@ with userInfo: %@", "-[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]_block_invoke_4", 1575, *(void *)(*(void *)(a1 + 32) + 96), a2, [a2 userInfo]);
    }
  }
}

+ (PFUbiquityBaseline)createBaselineFromMostRecentLocation:(uint64_t)a3 localPeerID:(uint64_t *)a4 error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = self;
  uint64_t v35 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v7) {
    return 0;
  }
  long long v29 = a4;
  uint64_t v8 = 0;
  char v9 = 1;
  uint64_t v10 = *(void *)v32;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(a2);
      }
      uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
      if (-[PFUbiquityLocation fileAtLocationIsUploaded:](v12, (uint64_t)&v35))
      {
        uint64_t v13 = [[PFUbiquityBaseline alloc] initWithBaselineLocation:v12 andLocalPeerID:a3];
        uint64_t v14 = v13;
        if (!v13
          || ![(PFUbiquityBaseline *)v13 loadFileFromLocation:v13->super._currentLocation error:&v35])
        {
          if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to load baseline: %@", "+[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]", 4127, v35);
          }

          goto LABEL_33;
        }
        if (v8)
        {
          metadata = v8->_metadata;
          if (metadata) {
            p_isa = (id *)&metadata->_kv->super.isa;
          }
          else {
            p_isa = 0;
          }
          uint64_t v17 = v14->_metadata;
          if (v17) {
            uint64_t kv = (uint64_t)v17->_kv;
          }
          else {
            uint64_t kv = 0;
          }
          if (!-[PFUbiquityKnowledgeVector isAncestorOfKnowledgeVector:](p_isa, kv)) {
            goto LABEL_17;
          }
        }
        uint64_t v8 = v14;
LABEL_17:
        char v9 = 1;
        goto LABEL_23;
      }
      if (v35)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError checking uploaded status of baseline file: %@", "+[PFUbiquitySetupAssistant createBaselineFromMostRecentLocation:localPeerID:error:]", 4132, v30, v35);
        }
        uint64_t v14 = 0;
        char v9 = 0;
      }
      else
      {
        uint64_t v14 = 0;
      }
LABEL_23:

      ++v11;
    }
    while (v7 != v11);
    uint64_t v19 = [a2 countByEnumeratingWithState:&v31 objects:v40 count:16];
    uint64_t v7 = v19;
    if (v19) {
      continue;
    }
    break;
  }
  if (v9) {
    return v8;
  }
LABEL_33:
  if (v35)
  {
    if (v29) {
      *long long v29 = v35;
    }
  }
  else
  {
    uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
    __int16 v27 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315394;
      uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
      __int16 v38 = 1024;
      int v39 = 4140;
      _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
  }

  return 0;
}

- (void)updateDictionary:(void *)a1 withShortcutSnapshot:(void *)a2
{
  uint64_t v4 = [a2 objectForKey:@"shortcut"];
  uint64_t v5 = [a2 objectForKey:@"phrase"];
  uint64_t v6 = [a2 objectForKey:@"partOfSpeech"];
  uint64_t v7 = [a2 objectForKey:@"timestamp"];
  if (v4 && v5)
  {
    uint64_t v8 = (void *)v7;
    id v9 = (id)[a1 objectForKey:v4];
    if (!v9)
    {
      id v11 = (id)objc_opt_new();
      [a1 setObject:v11 forKey:v4];
      id v9 = v11;
    }
    id v12 = v9;
    uint64_t v10 = [v9 objectForKey:@"timestamp"];
    if (!v10 || [v8 compare:v10] == 1)
    {
      [v12 setObject:v5 forKey:@"phrase"];
      [v12 setObject:v4 forKey:@"shortcut"];
      if (v8) {
        [v12 setObject:v8 forKey:@"timestamp"];
      }
    }
    self;
    if (v6) {
      [v12 setObject:v6 forKey:@"partOfSpeech"];
    }
    else {
      [v12 removeObjectForKey:@"partOfSpeech"];
    }
  }
}

- (void)updateDictionary:(void *)a1 withPhraseLearningSnapshot:(void *)a2
{
  uint64_t v4 = [a2 objectForKey:@"defaultReading"];
  uint64_t v5 = [a2 objectForKey:@"extraInteger1"];
  uint64_t v6 = [a2 objectForKey:@"extraInteger2"];
  uint64_t v7 = [a2 objectForKey:@"extraString1"];
  uint64_t v8 = [a2 objectForKey:@"extraString2"];
  uint64_t v9 = [a2 objectForKey:@"frequency"];
  uint64_t v10 = [a2 objectForKey:@"reading"];
  uint64_t v15 = [a2 objectForKey:@"seed"];
  uint64_t v11 = [a2 objectForKey:@"surface"];
  uint64_t v12 = [a2 objectForKey:@"syllables"];
  if (v10 && v11)
  {
    uint64_t v13 = v12;
    id v14 = (id)[a1 objectForKey:v10];
    if (!v14)
    {
      id v16 = (id)objc_opt_new();
      [a1 setObject:v16 forKey:v10];
      id v14 = v16;
    }
    id v17 = v14;
    [v14 setObject:v10 forKey:@"reading"];
    [v17 setObject:v11 forKey:@"surface"];
    self;
    if (v4) {
      [v17 setObject:v4 forKey:@"defaultReading"];
    }
    else {
      [v17 removeObjectForKey:@"defaultReading"];
    }
    self;
    if (v5) {
      [v17 setObject:v5 forKey:@"extraInteger1"];
    }
    else {
      [v17 removeObjectForKey:@"extraInteger1"];
    }
    self;
    if (v6) {
      [v17 setObject:v6 forKey:@"extraInteger2"];
    }
    else {
      [v17 removeObjectForKey:@"extraInteger2"];
    }
    self;
    if (v7) {
      [v17 setObject:v7 forKey:@"extraString1"];
    }
    else {
      [v17 removeObjectForKey:@"extraString1"];
    }
    self;
    if (v8) {
      [v17 setObject:v8 forKey:@"extraString2"];
    }
    else {
      [v17 removeObjectForKey:@"extraString2"];
    }
    self;
    if (v9) {
      [v17 setObject:v9 forKey:@"frequency"];
    }
    else {
      [v17 removeObjectForKey:@"frequency"];
    }
    self;
    [v17 setObject:v10 forKey:@"reading"];
    self;
    if (v15) {
      [v17 setObject:v15 forKey:@"seed"];
    }
    else {
      [v17 removeObjectForKey:@"seed"];
    }
    self;
    [v17 setObject:v11 forKey:@"surface"];
    self;
    if (v13) {
      [v17 setObject:v13 forKey:@"syllables"];
    }
    else {
      [v17 removeObjectForKey:@"syllables"];
    }
  }
}

void __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (id)[MEMORY[0x1E4F28CB8] defaultManager];
  if ([v5 removeItemAtURL:a3 error:*(void *)(*(void *)(a1 + 48) + 8) + 40]
    && +[PFUbiquityLogging canLogMessageAtLevel:2])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Removed old fork directory: %@", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]_block_invoke", 2282, a3);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if (v11)
        {
          uint64_t v12 = v11[4];
          uint64_t v13 = v11[5];
          uint64_t v14 = v11[6];
          uint64_t v15 = v11[7];
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v12 = 0;
          uint64_t v13 = 0;
          uint64_t v15 = 0;
        }
        id v16 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v12, v13, v14, v15, *(void **)(a1 + 40));
        id v17 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v11);
        uint64_t v18 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v16);
        if (([v5 moveItemAtURL:v17 toURL:v18 error:*(void *)(*(void *)(a1 + 48) + 8) + 40] & 1) == 0)
        {
          if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code] == 4)
          {
            if (objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(v18, "URLByDeletingLastPathComponent"), 1, 0, *(void *)(*(void *)(a1 + 48) + 8) + 40))
            {
              if ([v5 moveItemAtURL:v17 toURL:v18 error:*(void *)(*(void *)(a1 + 48) + 8) + 40])goto LABEL_23; {
              if (+[PFUbiquityLogging canLogMessageAtLevel:0])
              }
              {
                uint64_t v19 = 2297;
                goto LABEL_21;
              }
LABEL_22:
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
              goto LABEL_23;
            }
            if (!+[PFUbiquityLogging canLogMessageAtLevel:0])goto LABEL_22; {
            uint64_t v19 = 2301;
            }
          }
          else
          {
            if (!+[PFUbiquityLogging canLogMessageAtLevel:0])goto LABEL_22; {
            uint64_t v19 = 2305;
            }
          }
LABEL_21:
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error moving log: %@", "-[PFUbiquitySetupAssistant detectAndFixForkedContainer:store:error:]_block_invoke", v19, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
          goto LABEL_22;
        }
LABEL_23:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v20 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v20;
    }
    while (v20);
  }
}

id __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_2(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "persistentStores"), "count");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    return v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

void __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = -[PFUbiquityKnowledgeVector createStoreKnowledgeVectorDictionary](*(void *)(a1 + 40));

  -[NSSQLCore replaceUbiquityKnowledgeVector:](v1, (uint64_t)v2);
}

uint64_t __68__PFUbiquitySetupAssistant_detectAndFixForkedContainer_store_error___block_invoke_4(void *a1, void *a2)
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = (void *)[a2 URLByDeletingLastPathComponent];
  uint64_t v6 = [v5 URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"fork~%@.nosync", *(void *)(a1[4] + 128))];
  uint64_t result = [v4 moveItemAtURL:a2 toURL:v6 error:*(void *)(a1[5] + 8) + 40];
  if (result)
  {
    uint64_t result = [v4 removeItemAtURL:v6 error:*(void *)(a1[5] + 8) + 40];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  }
  return result;
}

uint64_t __48__PFUbiquitySetupAssistant_migrateMetadataRoot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(a3, "URLByDeletingLastPathComponent"), 1, 0, *(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:*(void *)(*(void *)(a1 + 40) + 8) + 40];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

- (uint64_t)tryToReplaceLocalStore:(uint64_t)a3 withStoreSideLoadedByImporter:
{
  uint64_t v272 = *MEMORY[0x1E4F143B8];
  uint64_t v184 = 0;
  v185 = &v184;
  uint64_t v186 = 0x2020000000;
  char v187 = 0;
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x3052000000;
  v181 = __Block_byref_object_copy__65;
  v182 = __Block_byref_object_dispose__65;
  uint64_t v183 = 0;
  long long v143 = objc_msgSend((id)objc_msgSend(a2, "identifier"), "copy");
  uint64_t v4 = v179;
  id v5 = +[PFUbiquityLocation createPeerStoreVersionLocationForPeerID:storeName:andModelVersionHash:withUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 128), *(void *)(a1 + 112), *(void *)(a1 + 136), *(void **)(a1 + 160));
  v263[0] = 0;
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v5, (uint64_t)v263);
  uint64_t v7 = v6;
  if (v6)
  {
    long long v267 = 0u;
    long long v266 = 0u;
    long long v265 = 0u;
    long long v264 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v264 objects:v268 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v265;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v265 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v264 + 1) + 8 * i);
          if (v11 && *(_DWORD *)(v11 + 24) == 22) {
            objc_msgSend(obj, "addObject:");
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v264 objects:v268 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError reading local log directory: %@", "-[PFUbiquitySetupAssistant createSetOfLocalLogLocations:]", 3141, a1, v263[0]);
    }
    if (v263[0])
    {
      v4[5] = v263[0];
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v268 = 136315394;
        v269 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m";
        __int16 v270 = 1024;
        int v271 = 3142;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v268, 0x12u);
      }
    }

    obuint64_t j = 0;
  }

  uint64_t v150 = 0;
  locuint64_t k = (os_unfair_lock_s *)(a1 + 332);
  uint64_t v152 = *MEMORY[0x1E4F281F8];
  do
  {
    os_unfair_lock_lock(lock);
    if (*(unsigned char *)(a1 + 328))
    {
      *(unsigned char *)(a1 + 328) = 0;
      id v20 = *(id *)(a1 + 336);
      long long v21 = *(void **)(a1 + 336);
      *(void *)(a1 + 336) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v22 = v20;
    }
    else
    {
      long long v22 = 0;
      long long v21 = 0;
    }
    os_unfair_lock_unlock(lock);

    [obj unionSet:v22];
    if ([obj count])
    {
      if (a3) {
        long long v23 = *(void **)(a3 + 72);
      }
      else {
        long long v23 = 0;
      }
      long long v144 = v179;
      id v250 = 0;
      uint64_t v244 = 0;
      v245 = &v244;
      uint64_t v246 = 0x3052000000;
      v247 = __Block_byref_object_copy__65;
      v248 = __Block_byref_object_dispose__65;
      uint64_t v249 = 0;
      id v24 = (id)[v23 persistentStoreCoordinator];
      uint64_t v238 = 0;
      v239 = &v238;
      uint64_t v240 = 0x3052000000;
      v241 = __Block_byref_object_copy__65;
      v242 = __Block_byref_object_dispose__65;
      uint64_t v243 = 0;
      long long v148 = v24;
      if (![obj count])
      {
        long long v147 = 0;
        id v164 = 0;
        long long v34 = 0;
        goto LABEL_127;
      }
      uint64_t v25 = [v23 model];
      if (v25) {
        uint64_t v26 = *(void *)(v25 + 32);
      }
      else {
        uint64_t v26 = 0;
      }
      v237[0] = MEMORY[0x1E4F143A8];
      v237[1] = 3221225472;
      v237[2] = __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke;
      v237[3] = &unk_1E544BB50;
      v237[4] = v23;
      v237[5] = v26;
      v237[6] = &v244;
      v237[7] = &v238;
      [v24 performBlockAndWait:v237];
      id v27 = (id)v239[5];
      int v28 = [PFUbiquityKnowledgeVector alloc];
      long long v29 = [(PFUbiquityKnowledgeVector *)v28 initWithStoreKnowledgeVectorDictionary:v239[5]];
      long long v147 = v29;
      if (v29) {
        long long v29 = (id *)[v29[1] objectForKey:*(void *)(a1 + 128)];
      }
      unint64_t v146 = [v29 unsignedIntegerValue];
      id v164 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
      if (!v146)
      {
        long long v34 = 0;
        LOBYTE(v166) = 1;
LABEL_69:
        uint64_t v43 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v160 = (void *)+[PFUbiquityFileCoordinator newFileCoordinatorForUbiquityRootLocation:]((uint64_t)PFUbiquityFileCoordinator, *(void *)(a1 + 152));
        uint64_t v44 = objc_opt_new();
        uint64_t v193 = 0;
        v194 = &v193;
        uint64_t v195 = 0x2020000000;
        char v196 = 0;
        *(void *)stat buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000;
        v253 = __Block_byref_object_copy__65;
        v254 = __Block_byref_object_dispose__65;
        uint64_t v255 = 0;
        long long v189 = 0u;
        long long v190 = 0u;
        long long v191 = 0u;
        long long v192 = 0u;
        uint64_t v45 = [obj countByEnumeratingWithState:&v189 objects:v251 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v190;
          while (2)
          {
            uint64_t v47 = 0;
            do
            {
              if (*(void *)v190 != v46) {
                objc_enumerationMutation(obj);
              }
              uint64_t v48 = *(void **)(*((void *)&v189 + 1) + 8 * v47);
              if (v48)
              {
                uint64_t v49 = v48[4];
                uint64_t v50 = v48[5];
                uint64_t v51 = v48[6];
                uint64_t v52 = v48[7];
              }
              else
              {
                uint64_t v51 = 0;
                uint64_t v49 = 0;
                uint64_t v50 = 0;
                uint64_t v52 = 0;
              }
              uint64_t v53 = +[PFUbiquityLocation createTransactionLogLocationForPeerID:storeName:modelVersionHash:logFilename:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, v49, v50, v51, v52, *(void **)(a1 + 152));
              [v44 addObject:v53];
              uint64_t v54 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v48);
              uint64_t v55 = (void *)-[PFUbiquityLocation createFullURL]((uint64_t)v53);
              v188[0] = MEMORY[0x1E4F143A8];
              v188[1] = 3221225472;
              v188[2] = __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_4;
              v188[3] = &unk_1E544FB70;
              v188[5] = &v193;
              v188[4] = v43;
              v188[6] = buf;
              [v160 coordinateWritingItemAtURL:v54 options:2 writingItemAtURL:v55 options:8 error:&v250 byAccessor:v188];
              if (!*((unsigned char *)v194 + 24))
              {
                LOBYTE(v166) = 0;
                if (*(void *)(*(void *)&buf[8] + 40)) {
                  id v250 = *(id *)(*(void *)&buf[8] + 40);
                }
                goto LABEL_124;
              }

              ++v47;
            }
            while (v45 != v47);
            uint64_t v56 = [obj countByEnumeratingWithState:&v189 objects:v251 count:16];
            uint64_t v45 = v56;
            if (v56) {
              continue;
            }
            break;
          }
        }
        if (v166)
        {
          [obj removeAllObjects];
          [obj unionSet:v44];
        }
LABEL_124:

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v193, 8);
        if ((v166 & 1) == 0) {
          goto LABEL_125;
        }
LABEL_127:
        int v80 = 1;
LABEL_128:
        [*(id *)(a1 + 352) removeAllObjects];

        v245[5] = 0;
        _Block_object_dispose(&v238, 8);
        _Block_object_dispose(&v244, 8);
        if (v80)
        {
          if (a3) {
            uint64_t v81 = *(void *)(a3 + 80);
          }
          else {
            uint64_t v81 = 0;
          }
          -[PFUbiquityRecordsImporterSchedulingContext addPendingLogLocations:](v81, (uint64_t)obj);
          if (-[_PFUbiquityRecordsImporter schedulePendingLogs:error:](a3, 1u, v179 + 5))
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:2])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nImported local logs: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3533, a1, obj);
            }

            obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
          {
            NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError side loading local logs: %@\nError: %@\n", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3537, a1, obj, v179[5]);
          }
        }
        goto LABEL_260;
      }
      long long v235 = 0u;
      long long v236 = 0u;
      long long v233 = 0u;
      long long v234 = 0u;
      uint64_t v30 = [obj countByEnumeratingWithState:&v233 objects:v268 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v234;
        LOBYTE(v166) = 1;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v234 != v31) {
              objc_enumerationMutation(obj);
            }
            long long v33 = [[PFUbiquityTransactionLog alloc] initWithTransactionLogLocation:*(void *)(*((void *)&v233 + 1) + 8 * j) andLocalPeerID:*(void *)(a1 + 128)];
            if (-[PFUbiquityTransactionLog loadImportMetadataWithError:]((uint64_t)v33, &v250)) {
              [v164 addObject:v33];
            }
            else {
              LOBYTE(v166) = 0;
            }
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v233 objects:v268 count:16];
        }
        while (v30);
        if ((v166 & 1) == 0)
        {
          long long v34 = 0;
          goto LABEL_68;
        }
      }
      else
      {
        LOBYTE(v166) = 1;
      }
      [v164 sortUsingComparator:&__block_literal_global_804];
      long long v34 = (id)[v164 objectAtIndex:0];
      if ([-[PFUbiquityTransactionLog transactionNumber](v34) unsignedIntegerValue] <= v146)
      {
        uint64_t v142 = [-[PFUbiquityTransactionLog transactionNumber](v34) unsignedIntegerValue];
        long long v231 = 0u;
        long long v232 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        uint64_t v57 = [v164 countByEnumeratingWithState:&v229 objects:&v264 count:16];
        if (v57)
        {
          uint64_t v157 = *(void *)v230;
          do
          {
            uint64_t v58 = 0;
            uint64_t v155 = v57;
            do
            {
              if (*(void *)v230 != v157) {
                objc_enumerationMutation(v164);
              }
              uint64_t v59 = *(void *)(*((void *)&v229 + 1) + 8 * v58);
              int v166 = -[PFUbiquityTransactionLog loadInsertedObjectsDataWithError:](v59, &v250);
              if (!v166)
              {
                LOBYTE(v166) = 0;
                goto LABEL_144;
              }
              if (v59
                && ((uint64_t v60 = *(void *)(v59 + 24)) == 0 ? (v61 = 0) : (v61 = *(void *)(v60 + 40)),
                    (uint64_t v62 = *(void *)(v59 + 72)) != 0))
              {
                uint64_t v63 = (void *)[*(id *)(v62 + 40) objectForKey:v61];
              }
              else
              {
                uint64_t v63 = 0;
              }
              id v64 = v63;
              uint64_t v65 = v64;
              if (v64) {
                uint64_t v66 = (void *)*((void *)v64 + 11);
              }
              else {
                uint64_t v66 = 0;
              }
              uint64_t v67 = (void *)[v66 allKeys];
              uint64_t v161 = v58;
              long long v227 = 0u;
              long long v228 = 0u;
              long long v225 = 0u;
              long long v226 = 0u;
              uint64_t v68 = [v67 countByEnumeratingWithState:&v225 objects:v263 count:16];
              if (v68)
              {
                uint64_t v69 = *(void *)v226;
                do
                {
                  uint64_t v70 = 0;
                  do
                  {
                    if (*(void *)v226 != v69) {
                      objc_enumerationMutation(v67);
                    }
                    uint64_t v71 = -[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:]((uint64_t)v65, *(void **)(*((void *)&v225 + 1) + 8 * v70));
                    long long v72 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "managedObjectModel"), "entitiesByName");
                    if (v71) {
                      uint64_t v73 = *(void *)(v71 + 16);
                    }
                    else {
                      uint64_t v73 = 0;
                    }
                    uint64_t v74 = [v72 objectForKey:v73];
                    if (v74)
                    {
                      if ((*(unsigned char *)(v74 + 120) & 4) != 0)
                      {
                        __int16 v75 = *(void **)(v74 + 72);
                      }
                      else
                      {
                        do
                        {
                          __int16 v75 = (void *)v74;
                          uint64_t v74 = [(id)v74 superentity];
                        }
                        while (v74);
                      }
                    }
                    else
                    {
                      __int16 v75 = 0;
                    }
                    uint64_t v76 = [v75 name];
                    id v77 = (id)[*(id *)(a1 + 352) objectForKey:v76];
                    if (!v77)
                    {
                      id v77 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                      [*(id *)(a1 + 352) setObject:v77 forKey:v76];
                    }
                    [v77 addObject:v71];

                    ++v70;
                  }
                  while (v70 != v68);
                  uint64_t v78 = [v67 countByEnumeratingWithState:&v225 objects:v263 count:16];
                  uint64_t v68 = v78;
                }
                while (v78);
              }

              uint64_t v58 = v161 + 1;
            }
            while (v161 + 1 != v155);
            uint64_t v79 = [v164 countByEnumeratingWithState:&v229 objects:&v264 count:16];
            uint64_t v57 = v79;
          }
          while (v79);
        }
LABEL_144:
        long long v223 = 0u;
        long long v224 = 0u;
        long long v221 = 0u;
        long long v222 = 0u;
        id v153 = *(id *)(a1 + 352);
        uint64_t v90 = [v153 countByEnumeratingWithState:&v221 objects:v262 count:16];
        if (v90)
        {
          uint64_t v156 = *(void *)v222;
          do
          {
            uint64_t v91 = 0;
            uint64_t v154 = v90;
            do
            {
              if (*(void *)v222 != v156) {
                objc_enumerationMutation(v153);
              }
              uint64_t v92 = *(void *)(*((void *)&v221 + 1) + 8 * v91);
              id v93 = (id)[*(id *)(a1 + 352) objectForKey:v92];
              unint64_t v94 = objc_msgSend((id)objc_msgSend((id)v245[5], "objectForKey:", v92), "integerValue");
              unint64_t v95 = [v93 count] + v94;
              id v96 = (void *)[objc_alloc(NSNumber) initWithInteger:v95];
              [(id)v245[5] setObject:v96 forKey:v92];

              if ([v93 count])
              {
                uint64_t v97 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:copyItems:", objc_msgSend(v93, "allObjects"), 0);
                [v97 sortUsingComparator:&__block_literal_global_806];
                uint64_t v98 = [v97 objectAtIndex:0];
                long long v158 = v97;
                uint64_t v162 = v91;
                if (!v98 || *(void *)(v98 + 56) <= v94)
                {
                  long long v219 = 0u;
                  long long v220 = 0u;
                  long long v217 = 0u;
                  long long v218 = 0u;
                  uint64_t v99 = [v93 countByEnumeratingWithState:&v217 objects:v261 count:16];
                  if (v99)
                  {
                    uint64_t v100 = *(void *)v218;
                    do
                    {
                      uint64_t v101 = 0;
                      do
                      {
                        if (*(void *)v218 != v100) {
                          objc_enumerationMutation(v93);
                        }
                        uint64_t v102 = *(void **)(*((void *)&v217 + 1) + 8 * v101);
                        if (![*(id *)(a1 + 344) objectForKey:v102])
                        {
                          if (v102 && v102[7] > v95)
                          {
                            [*(id *)(a1 + 344) setObject:v102 forKey:v102];
                          }
                          else
                          {
                            uint64_t v103 = [PFUbiquityGlobalObjectID alloc];
                            if (v102)
                            {
                              uint64_t v104 = v102[1];
                              uint64_t v105 = v102[2];
                              uint64_t v106 = v102[4];
                            }
                            else
                            {
                              uint64_t v105 = 0;
                              uint64_t v104 = 0;
                              uint64_t v106 = 0;
                            }
                            uint64_t v107 = [(PFUbiquityGlobalObjectID *)v103 initWithStoreName:v104 entityName:v105 primaryKeyInteger:++v94 andPeerID:v106];
                            [*(id *)(a1 + 344) setObject:v107 forKey:v102];
                          }
                        }
                        ++v101;
                      }
                      while (v99 != v101);
                      uint64_t v108 = [v93 countByEnumeratingWithState:&v217 objects:v261 count:16];
                      uint64_t v99 = v108;
                    }
                    while (v108);
                  }
                }

                uint64_t v90 = v154;
                uint64_t v91 = v162;
              }

              ++v91;
            }
            while (v91 != v90);
            uint64_t v90 = [v153 countByEnumeratingWithState:&v221 objects:v262 count:16];
          }
          while (v90);
        }
        long long v215 = 0u;
        long long v216 = 0u;
        long long v213 = 0u;
        long long v214 = 0u;
        uint64_t v109 = [v164 countByEnumeratingWithState:&v213 objects:v260 count:16];
        if (v109)
        {
          uint64_t v159 = *(void *)v214;
          do
          {
            uint64_t v110 = 0;
            do
            {
              if (*(void *)v214 != v159) {
                objc_enumerationMutation(v164);
              }
              uint64_t v111 = *(void *)(*((void *)&v213 + 1) + 8 * v110);
              if (v111
                && ((uint64_t v112 = *(void *)(v111 + 24)) == 0 ? (v113 = 0) : (v113 = *(void *)(v112 + 40)),
                    (uint64_t v114 = *(void *)(v111 + 72)) != 0))
              {
                uint64_t v115 = [*(id *)(v114 + 40) objectForKey:v113];
              }
              else
              {
                uint64_t v115 = 0;
              }
              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Rewriting save snapshot (%@)\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3360, v111, v115);
              }
              if (v115)
              {
                [*(id *)(v115 + 32) removeAllObjects];
                [*(id *)(v115 + 72) removeAllObjects];
              }
              long long v211 = 0u;
              long long v212 = 0u;
              long long v209 = 0u;
              long long v210 = 0u;
              int v116 = *(void **)(a1 + 344);
              uint64_t v117 = [v116 countByEnumeratingWithState:&v209 objects:v259 count:16];
              uint64_t v163 = v111;
              uint64_t v118 = v109;
              if (v117)
              {
                uint64_t v119 = *(void *)v210;
                do
                {
                  for (uint64_t k = 0; k != v117; ++k)
                  {
                    if (*(void *)v210 != v119) {
                      objc_enumerationMutation(v116);
                    }
                    -[PFUbiquityStoreSaveSnapshot replaceGlobalObjectID:withGlobalObjectID:](v115, *(void *)(*((void *)&v209 + 1) + 8 * k), [*(id *)(a1 + 344) objectForKey:*(void *)(*((void *)&v209 + 1) + 8 * k)]);
                  }
                  uint64_t v117 = [v116 countByEnumeratingWithState:&v209 objects:v259 count:16];
                }
                while (v117);
              }
              -[PFUbiquityStoreSaveSnapshot finishGlobalIDReplacement](v115);
              uint64_t v109 = v118;
              if (v115) {
                uint64_t v121 = *(void **)(v115 + 120);
              }
              else {
                uint64_t v121 = 0;
              }
              uint64_t v122 = [v121 integerValue];
              v124 = (void *)[objc_alloc(NSNumber) initWithInteger:v146 - v142 + 1 + v122];
              if (v115) {
                objc_setProperty_nonatomic((id)v115, v123, v124, 120);
              }

              if (+[PFUbiquityLogging canLogMessageAtLevel:3])
              {
                NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Finished rewriting save snapshot (%@)\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3374, v163, v115);
              }
              if (-[PFUbiquityTransactionLog rewriteToDiskWithError:](v163, (uint64_t *)&v250))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Rewrote log: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3377, a1, v163);
                }
              }
              else
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Error rewriting log: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3379, a1, v250);
                }
                LOBYTE(v166) = 0;
              }
              ++v110;
            }
            while (v110 != v118);
            uint64_t v125 = [v164 countByEnumeratingWithState:&v213 objects:v260 count:16];
            uint64_t v109 = v125;
          }
          while (v125);
        }
        if (v166)
        {
          long long v207 = 0u;
          long long v208 = 0u;
          long long v205 = 0u;
          long long v206 = 0u;
          uint64_t v126 = [v164 countByEnumeratingWithState:&v205 objects:v258 count:16];
          if (!v126) {
            goto LABEL_227;
          }
          uint64_t v127 = *(void *)v206;
          do
          {
            for (uint64_t m = 0; m != v126; ++m)
            {
              if (*(void *)v206 != v127) {
                objc_enumerationMutation(v164);
              }
              uint64_t v129 = *(void *)(*((void *)&v205 + 1) + 8 * m);
              if (v129) {
                *(unsigned char *)(v129 + 20) = 1;
              }
              if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v129, &v250))
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMoved log to temporary location: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3389, a1, v129);
                }
              }
              else
              {
                if (+[PFUbiquityLogging canLogMessageAtLevel:1])
                {
                  NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\n Error moving log: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3391, a1, v250);
                }
                LOBYTE(v166) = 0;
              }
            }
            uint64_t v126 = [v164 countByEnumeratingWithState:&v205 objects:v258 count:16];
          }
          while (v126);
          if (v166)
          {
LABEL_227:
            v130 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
            long long v203 = 0u;
            long long v204 = 0u;
            long long v201 = 0u;
            long long v202 = 0u;
            uint64_t v131 = [obj countByEnumeratingWithState:&v201 objects:v257 count:16];
            if (v131)
            {
              uint64_t v132 = *(void *)v202;
              do
              {
                for (uint64_t n = 0; n != v131; ++n)
                {
                  if (*(void *)v202 != v132) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v134 = *(void *)(*((void *)&v201 + 1) + 8 * n);
                  v135 = -[PFUbiquityLocation createFullPath](v134);
                  if ([v130 removeItemAtPath:v135 error:&v250])
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRemoved old local log: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3404, a1, v134);
                    }
                  }
                  else if (objc_msgSend((id)objc_msgSend(v250, "domain"), "isEqualToString:", v152) {
                         && [v250 code] == 4)
                  }
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:2])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nFile went missing: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3406, a1, v134);
                    }
                  }
                  else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                  {
                    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError deleting old local log: %@\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3408, a1, v134, v250);
                  }
                }
                uint64_t v131 = [obj countByEnumeratingWithState:&v201 objects:v257 count:16];
              }
              while (v131);
            }
            long long v199 = 0u;
            long long v200 = 0u;
            long long v197 = 0u;
            long long v198 = 0u;
            uint64_t v136 = [v164 countByEnumeratingWithState:&v197 objects:v256 count:16];
            if (v136)
            {
              uint64_t v137 = *(void *)v198;
              do
              {
                for (iuint64_t i = 0; ii != v136; ++ii)
                {
                  if (*(void *)v198 != v137) {
                    objc_enumerationMutation(v164);
                  }
                  uint64_t v139 = *(void *)(*((void *)&v197 + 1) + 8 * ii);
                  if (v139) {
                    *(unsigned char *)(v139 + 20) = 0;
                  }
                  if (-[PFUbiquityTransactionLog moveFileToPermanentLocationWithError:](v139, &v250))
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:3])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nMoved log file to local directory: %@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3419, a1, v139);
                    }
                  }
                  else
                  {
                    if (+[PFUbiquityLogging canLogMessageAtLevel:0])
                    {
                      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError moving log file to local directory: %@\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]", 3421, a1, v139, v250);
                    }
                    LOBYTE(v166) = 0;
                  }
                }
                uint64_t v136 = [v164 countByEnumeratingWithState:&v197 objects:v256 count:16];
              }
              while (v136);
            }
          }
        }
      }
LABEL_68:
      if ((v166 & 1) == 0)
      {
LABEL_125:
        if (v250)
        {
          int v80 = 0;
          v144[5] = (uint64_t)v250;
        }
        else
        {
          uint64_t v82 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v82, v83, v84, v85, v86, v87, v88, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PFUbiquitySetupAssistant.m");
          uint64_t v89 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)stat buf = 136315394;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Setup/PF"
                                 "UbiquitySetupAssistant.m";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 3485;
            _os_log_fault_impl(&dword_18AB82000, v89, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
          int v80 = 0;
        }
        goto LABEL_128;
      }
      goto LABEL_69;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v174 = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke;
    v175 = &unk_1E544B778;
    uint64_t v176 = a1;
    uint64_t v177 = a2;
    if (pthread_main_np()
      || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"kbd") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"keyboardservicesd"))
    {
      v174((uint64_t)block);
    }
    else
    {
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    if (*(unsigned char *)(a1 + 328))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Looks like the store was changed in will change, trying again: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3553, a2);
      }
    }
    else
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3])
      {
        uint64_t v35 = a3;
        if (a3) {
          uint64_t v35 = *(void *)(a3 + 72);
        }
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAttempting to replace store: %@ with store: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3555, a1, a2, v35);
      }
      if (a3) {
        uint64_t v36 = *(void **)(a3 + 72);
      }
      else {
        uint64_t v36 = 0;
      }
      uint64_t v37 = [v36 URL];
      if (a3) {
        __int16 v38 = *(void **)(a3 + 72);
      }
      else {
        __int16 v38 = 0;
      }
      uint64_t v39 = [v38 options];
      int v40 = *(void **)(a1 + 16);
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_2;
      v172[3] = &unk_1E544F800;
      v172[4] = a3;
      v172[5] = v143;
      v172[6] = a1;
      v172[7] = v37;
      v172[10] = &v178;
      v172[11] = &v184;
      v172[8] = v39;
      v172[9] = a2;
      [v40 performBlockAndWait:v172];
      id v41 = (id)v179[5];
      if (*((unsigned char *)v185 + 24))
      {
        id v42 = *(id *)(a1 + 16);
        v167[0] = MEMORY[0x1E4F143A8];
        v167[1] = 3221225472;
        v168 = __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_3;
        v169 = &unk_1E544B778;
        uint64_t v170 = a1;
        v171 = a2;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"kbd") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"keyboardservicesd"))
        {
          v168((uint64_t)v167);
        }
        else
        {
          dispatch_async(MEMORY[0x1E4F14428], v167);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:1])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to replace %@ with side loaded store: %@\nError: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]", 3622, a1, *(void *)(a1 + 48), v37, v179[5]);
      }
    }
LABEL_260:
    if (*((unsigned char *)v185 + 24)) {
      break;
    }
    ++v150;
  }
  while (v150 != 100);

  uint64_t v140 = *((unsigned __int8 *)v185 + 24);
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);
  return v140;
}

id __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) createMapOfEntityNameToPKMaxForEntities:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v2 mutableCopy];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[NSSQLCore fetchUbiquityKnowledgeVector](*(void **)(a1 + 32));
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  return v3;
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    uint64_t v3 = 0;
    if (!a3) {
      return [v3 compare:a3];
    }
    goto LABEL_3;
  }
  uint64_t v3 = *(void **)(a2 + 64);
  if (a3) {
LABEL_3:
  }
    a3 = *(void *)(a3 + 64);
  return [v3 compare:a3];
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __70__PFUbiquitySetupAssistant_rewriteTransactionLogs_toMatchStore_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error moving local log: %@\n%@\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]_block_invoke_4", 3450, a2, a3, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
    [*(id *)(a1 + 32) removeItemAtURL:a3 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Tried deleting file: %@\n%@", "-[PFUbiquitySetupAssistant rewriteTransactionLogs:toMatchStore:error:]_block_invoke_4", 3453, a3, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
    uint64_t result = [*(id *)(a1 + 32) moveItemAtURL:a2 toURL:a3 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

uint64_t __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = @"added";
  v8[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  v7[1] = @"removed";
  uint64_t v5 = *(void *)(a1 + 40);
  v8[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1];
  v7[2] = @"NSPersistentStoreUbiquitousTransitionTypeKey";
  v8[2] = [NSNumber numberWithInt:4];
  return objc_msgSend(v2, "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorStoresWillChangeNotification", v3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
}

id __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 72);
  }
  else {
    uint64_t v3 = 0;
  }
  if ((objc_msgSend((id)objc_msgSend(v3, "identifier"), "isEqual:", *(void *)(a1 + 40)) & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 72);
    }
    else {
      uint64_t v5 = 0;
    }
    [v5 setIdentifier:*(void *)(a1 + 40)];
    uint64_t v6 = objc_alloc_init(NSSaveChangesRequest);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 72);
    }
    else {
      uint64_t v8 = 0;
    }
    [v8 executeRequest:v6 withContext:0 error:0];
  }
  if (+[NSSQLCore _replacePersistentStoreAtURL:*(void *)(*(void *)(a1 + 48) + 48) destinationOptions:*(void *)(*(void *)(a1 + 48) + 8) withPersistentStoreFromURL:*(void *)(a1 + 56) sourceOptions:*(void *)(a1 + 64) error:*(void *)(*(void *)(a1 + 80) + 8) + 40])
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nReplaced %@ with %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3577, *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 48), *(void *)(a1 + 56));
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 72), "setURL:", objc_msgSend(*(id *)(a1 + 72), "URL"));
    [*(id *)(a1 + 72) setReadOnly:0];
    if (([*(id *)(a1 + 72) loadMetadata:&v23] & 1) == 0
      && +[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error loading new store metadata after side load: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3583, v23);
    }

    *(void *)(*(void *)(a1 + 48) + 72) = 0;
    if (-[PFUbiquitySetupAssistant initializeStoreKnowledgeVectorFromStore:error:](*(void *)(a1 + 48), *(void **)(a1 + 72)))
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUpdated store knowledge vector to: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3590, *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 72));
      }
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(v10 + 320);
      if (!v11) {
        goto LABEL_43;
      }
      uint64_t v12 = *(void **)(v10 + 72);
      uint64_t v13 = *(void *)(v11 + 88);
      if (v13)
      {
        uint64_t v14 = *(void **)(v13 + 88);
        if (v14)
        {
          objc_setProperty_atomic(v14, v9, v12, 64);
          uint64_t v15 = *(void *)(a1 + 48);
          uint64_t v11 = *(void *)(v15 + 320);
          if (!v11) {
            goto LABEL_43;
          }
          uint64_t v12 = *(void **)(v15 + 72);
        }
      }
      uint64_t v16 = *(void *)(v11 + 88);
      if (!v16
        || (uint64_t v17 = *(void **)(v16 + 120)) == 0
        || (objc_setProperty_nonatomic(v17, v9, v12, 88), (uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 320)) != 0))
      {
        uint64_t v18 = *(void *)(v11 + 88);
        if (v18)
        {
          uint64_t v19 = *(void *)(v18 + 88);
          if (v19)
          {
            uint64_t v20 = *(void *)(v19 + 40);
            goto LABEL_29;
          }
        }
      }
LABEL_43:
      uint64_t v20 = 0;
LABEL_29:
      if (-[PFUbiquityPeerRangeCache refreshPeerRangeCache:](v20))
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3])
        {
          uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 320);
          if (v21)
          {
            uint64_t v21 = *(void *)(v21 + 88);
            if (v21) {
              uint64_t v21 = *(void *)(v21 + 88);
            }
          }
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nRefreshed peer range cache: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3596, *(void *)(a1 + 48), v21);
        }
      }
      else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
      {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nError refreshing peer range cache: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3598, *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      }
      return *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nUnable to reinitialize store knowledge vector: %@", "-[PFUbiquitySetupAssistant tryToReplaceLocalStore:withStoreSideLoadedByImporter:]_block_invoke_2", 3601, *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    }
  }
  return *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
}

void __81__PFUbiquitySetupAssistant_tryToReplaceLocalStore_withStoreSideLoadedByImporter___block_invoke_3(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = @"added";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1];
  v6[1] = @"removed";
  uint64_t v4 = *(void *)(a1 + 40);
  v7[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:1];
  v6[2] = @"NSPersistentStoreUbiquitousTransitionTypeKey";
  v7[2] = [NSNumber numberWithInt:4];
  objc_msgSend(v2, "postNotificationName:object:userInfo:", @"NSPersistentStoreCoordinatorStoresDidChangeNotification", v3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
}

- (void)exportedLog:(id)a3
{
  p_sideLoadLocuint64_t k = (os_unfair_lock_s *)&self->_sideLoadLock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_sideLoadLock);
  self->_gotExportNotificatiouint64_t n = 1;
  -[NSMutableSet addObjectsFromArray:](self->_logLocationsExportedDuringSideLoad, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"PFLogLocationsKey"));

  os_unfair_lock_unlock(p_sideLoadLock);
}

+ (uint64_t)removeUbiquityMetadataFromStore:(uint64_t)a1
{
  self;
  uint64_t v3 = (void *)[a2 _persistentStoreCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PFUbiquitySetupAssistant_removeUbiquityMetadataFromStore___block_invoke;
  v5[3] = &unk_1E544B868;
  v5[4] = a2;
  return [v3 performBlockAndWait:v5];
}

void __60__PFUbiquitySetupAssistant_removeUbiquityMetadataFromStore___block_invoke(uint64_t a1)
{
}

- (void)ubiquityIdentityTokenChanged:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSPersistentStoreUbiquitousContentNameKey");
  if (!v4 || [v4 isEqualToString:self->_ubiquityName])
  {
    self->_abortSetup = 1;
    self->_gotAccountChange = 1;
  }
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  if ((NSPersistentStore *)[a3 object] == self->_store)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nAborting setup because store removed from coordinator. %@", "-[PFUbiquitySetupAssistant coordinatorWillRemoveStore:]", 4179, self, a3);
    }
    self->_abortSetup = 1;
    initialSyncSemaphore = self->_initialSyncSemaphore;
    dispatch_semaphore_signal(initialSyncSemaphore);
  }
}

@end