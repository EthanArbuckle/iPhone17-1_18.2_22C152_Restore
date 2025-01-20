@interface OSACrashReport
+ (BOOL)isInLDM;
+ (id)loadBuildInfo:(id)a3;
+ (id)loadStoreInfo:(id)a3 atURL:(id)a4 forPlatform:(unsigned int)a5;
+ (id)parentBundleURLForAppExtensionBundleURL:(id)a3 error:(id)a4;
- (BOOL)_isMTECrash;
- (BOOL)_isMemoryImmutableAtAddress:(unint64_t)a3;
- (BOOL)_isPGMCrashType;
- (BOOL)isActionable;
- (BOOL)isExceptionNonFatal;
- (BOOL)is_beta;
- (BOOL)is_simulated;
- (BOOL)needsUrgentSubmission;
- (BOOL)saveWithOptions:(id)a3;
- (BOOL)shouldEnableUrgentSubmission;
- (BOOL)validKcdataItem:(kcdata_iter)a3 min_size:(unint64_t)a4;
- (NSMutableString)logWritingSignatureFrames;
- (NSString)bundle_id;
- (NSString)coalitionName;
- (NSString)logWritingSignature;
- (NSString)procName;
- (NSString)responsibleProc;
- (NSString)short_vers;
- (OSACrashReport)initWithTask:(unsigned int)a3 exceptionType:(int)a4 thread:(unsigned int)a5 threadId:(unint64_t)a6 threadStateFlavor:(int)a7 threadState:(unsigned int)a8[1296] threadStateCount:(unsigned int)a9;
- (OSAExclaveContainer)exclaveContainer;
- (_CSRange)_getObjCReadOnlyRange:(_CSTypeRef)a3;
- (_CSTypeRef)_getSymbolicator:(BOOL)a3;
- (_VMURange)_regionAtAddress:(unint64_t)a3 immutableCheck:(BOOL *)a4;
- (char)_copyStringFromTask:(unsigned int)a3 atAddress:(unint64_t)a4 maxLength:(unint64_t)a5 immutableCheck:(BOOL *)a6;
- (id)_descriptionForException:(id)a3;
- (id)_extractMallocTraceInfo:(id *)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5;
- (id)_findContainingRegion:(id)a3 address:(unint64_t)a4;
- (id)_findContainingTextSegmentRegion:(id)a3 address:(unint64_t)a4;
- (id)_objcSelectorNameForMessenger:(id)a3;
- (id)_readDataAtAddress:(unint64_t)a3 size:(unint64_t)a4;
- (id)_readIndirectImmutableStringFromSymbol:(const char *)a3 symbolOwner:(_CSTypeRef)a4;
- (id)_readMallocZoneArray:(_CSTypeRef)a3;
- (id)_readMallocZoneArrayFromMemory:(mapped_memory_t *)a3 usingSymbolicator:(_CSTypeRef)a4;
- (id)_readStringAtTaskAddress:(unint64_t)a3 maxLength:(unint64_t)a4 immutableCheck:(BOOL *)a5;
- (id)_symbolicateRegister:(unint64_t)a3 inRange:(_CSRange)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)bls_aggregatePayload:(id *)a3;
- (id)bls_backlightChangeEventPayload:(id *)a3;
- (id)bls_backlightChangeRequestPayload:(id *)a3;
- (id)bls_environmentStateMachinePayload:(id *)a3;
- (id)bls_presentationPayload:(id *)a3;
- (id)bls_transitionPayload:(id *)a3;
- (id)composeFrame:(id)a3 info:(id)a4;
- (id)create_os_fault_section;
- (id)decode_cpuType;
- (id)decode_crashingThreadStateWithSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (id)decode_esr:(unsigned int *)a3 exceptionStateCount:(unsigned int)a4;
- (id)decode_exceptionCodes;
- (id)decode_exceptionType;
- (id)decode_reason;
- (id)decode_reasonBTC;
- (id)decode_reasonBacklightServices;
- (id)decode_reasonCarousel;
- (id)decode_reasonCodeSigning;
- (id)decode_reasonCoreAnimation;
- (id)decode_reasonExec;
- (id)decode_reasonLibSystem;
- (id)decode_reasonLibxpc;
- (id)decode_reasonMetal;
- (id)decode_reasonNamespace;
- (id)decode_reasonPortSpace;
- (id)decode_reasonRosetta;
- (id)decode_reasonSandbox;
- (id)decode_reasonTcc;
- (id)decode_reasonWatchKit;
- (id)decode_reasonWatchdog;
- (id)decode_signal;
- (id)decode_threadState:(unsigned int *)a3 threadStateCount:(unsigned int)a4 threadStateFlavor:(int)a5 threadPort:(unsigned int)a6 exceptionState:(unsigned int)a7[1296] exceptionStateCount:(unsigned int)a8 withSymbolicator:(_CSTypeRef)a9 usingCatalog:(id)a10;
- (id)decode_threadState:(unsigned int)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5;
- (id)decode_ubsanCode:(unsigned __int8)a3;
- (id)decode_versionCodes:(unsigned __int16)a3[4];
- (id)getNotificationInfo;
- (id)getObserverInfo;
- (id)getTrialCache;
- (id)nameFromPid:(int)a3;
- (id)pathFromPid:(int)a3;
- (id)problemType;
- (id)reportNamePrefix;
- (id)safe_encoder:(unsigned int)a3;
- (id)slice_uuid;
- (id)terminationReasonExceptionCode;
- (int)_regionInfoAtAddress:(unint64_t)a3 regionInfo:(vm_region_submap_short_info_64 *)a4 regionAddress:(unint64_t *)a5 regionSize:(unint64_t *)a6;
- (int)exceptionType;
- (int)proc_id;
- (int64_t)codeZeroForGuardException;
- (unint64_t)_findMallocZone:(id)a3 usingSymbolicator:(_CSTypeRef)a4;
- (unint64_t)_objcSelectorAddressForMessenger:(id)a3 memory:(mapped_memory_t *)a4;
- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atAddress:(unint64_t)a4;
- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atSymbol:(_CSTypeRef)a4;
- (unint64_t)crashingAddress;
- (unint64_t)sRouteID;
- (unint64_t)sharedCacheAddress;
- (unsigned)_extractBacktraceInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (unsigned)consecutiveCrashCount;
- (unsigned)throttleTimeout;
- (void)_addASILine:(id)a3 fromOwner:(id)a4 isSafe:(BOOL)a5;
- (void)_extractBinaryImageInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractCrashReporterAnnotationsFromSymbolOwner:(_CSTypeRef)a3 withMemory:(mapped_memory_t *)a4;
- (void)_extractExceptionReasonUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractInfoPlistFromSymbolOwner:(_CSTypeRef)a3;
- (void)_extractLastExceptionBacktraceUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractMemoryErrorReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractPGMLibpasReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractPGMReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractRosettaRuntimeInfo:(_CSTypeRef)a3 withBlock:(id)a4;
- (void)_extractSanitizerReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4;
- (void)_extractVMMap:(_CSTypeRef)a3;
- (void)_extractWorkQueueLimitsFromData:(proc_workqueueinfo *)a3;
- (void)autopsyCorpse;
- (void)autopsyLightweightCorpse:(unint64_t)a3 size:(unint64_t)a4;
- (void)captureDiagInfo:(id)a3;
- (void)checkIfNeedsUrgentSubmission;
- (void)dealloc;
- (void)decode_os_log_fault_payload;
- (void)decode_reasonDyldWithInfo:(id)a3;
- (void)donateToBiome;
- (void)dumpProgramCounterBytes;
- (void)extractThreadStateInfo:(unsigned int)a3;
- (void)finishExtractionUsingCorpse;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)loadBundleInfo;
- (void)parseCorpse:(unint64_t)a3 size:(unint64_t)a4;
- (void)sendToCoreAnalytics;
- (void)sendToMetricKit;
- (void)setApplicationSpecificInformation:(const char *)a3;
- (void)setExclaveContainer:(id)a3;
- (void)setLogWritingSignatureFrames:(id)a3;
- (void)stashStatus:(id)a3 note:(id)a4;
- (void)symbolicateFrame:(unint64_t)a3 adjusted:(unint64_t)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6 andBlock:(id)a7;
- (void)unpackExceptionCodes;
- (void)updateLogWritingSignatureWithSymbol:(id)a3 address:(unint64_t)a4;
- (void)validateProcName;
@end

@implementation OSACrashReport

- (void)stashStatus:(id)a3 note:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  pthread_mutex_lock(&stru_100042D10);
  v8 = (void *)qword_100042F98;
  if (!qword_100042F98)
  {
    uint64_t v9 = objc_opt_new();
    v10 = (void *)qword_100042F98;
    qword_100042F98 = v9;

    v8 = (void *)qword_100042F98;
  }
  v11 = +[NSNumber numberWithInt:self->_proc_id];
  v12 = [v8 objectForKeyedSubscript:v11];

  if (!v12)
  {
    v12 = objc_opt_new();
    v13 = (void *)qword_100042F98;
    v14 = +[NSNumber numberWithInt:self->_proc_id];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
  if (v6 | v7)
  {
    v15 = [v12 objectForKeyedSubscript:@"process"];
    if (!v15)
    {
      CFStringRef procName = (const __CFString *)self->_procName;
      if (!procName) {
        CFStringRef procName = @"<unknown>";
      }
      if (self->_is_full_corpse)
      {
        CFStringRef v17 = @"CORPSE";
      }
      else if (self->_is_lightweight_corpse)
      {
        CFStringRef v17 = @"LWCORPSE";
      }
      else
      {
        CFStringRef v17 = @"OTHER?";
      }
      v15 = +[NSString stringWithFormat:@"Pid %d '%@' %@", self->_proc_id, procName, v17];
      [v12 setObject:v15 forKeyedSubscript:@"process"];
    }
    if (v6)
    {
      [v12 setObject:v6 forKeyedSubscript:@"status"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v56 = v15;
        __int16 v57 = 2114;
        unint64_t v58 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "osa_update: %{public}@: %{public}@", buf, 0x16u);
      }
    }
    if (v7)
    {
      v21 = [v12 objectForKeyedSubscript:@"notes"];
      if (!v21)
      {
        v21 = objc_opt_new();
        [v12 setObject:v21 forKeyedSubscript:@"notes"];
      }
      [v21 addObject:v7];
    }
  }
  else
  {
    ++dword_100042FA8;
    v18 = [v12 objectForKeyedSubscript:@"process"];
    if (v18) {
      objc_storeStrong((id *)&qword_100042FA0, v18);
    }
    v19 = (void *)qword_100042F98;
    v20 = +[NSNumber numberWithInt:self->_proc_id];
    [v19 removeObjectForKey:v20];
  }
  if (qword_100042FB0
    || (qword_100042FB8 = 2 * vm_page_size,
        (qword_100042FB0 = (uint64_t)malloc_type_malloc(2 * vm_page_size, 0xC55BCE72uLL)) != 0))
  {
    v46 = v12;
    unint64_t v47 = v7;
    unint64_t v48 = v6;
    v22 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = (id)qword_100042F98;
    id v23 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = [(id)qword_100042F98 objectForKeyedSubscript:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          v28 = [v27 objectForKeyedSubscript:@"process"];
          v29 = [v27 objectForKeyedSubscript:@"status"];
          CFStringRef v30 = &stru_100035B30;
          if (v29) {
            CFStringRef v30 = v29;
          }
          v31 = +[NSString stringWithFormat:@"%@: %@", v28, v30];
          [v22 addObject:v31];

          v32 = [v27 objectForKeyedSubscript:@"notes"];
          if (v32) {
            [v22 addObjectsFromArray:v32];
          }
        }
        id v24 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v24);
    }

    if (qword_100042FA0)
    {
      v33 = +[NSString stringWithFormat:@"Completed %u, Recent: %@", dword_100042FA8, qword_100042FA0];
      [v22 addObject:v33];
    }
    v34 = [v22 componentsJoinedByString:@"\n"];
    v35 = (char *)qword_100042FB0;
    id v36 = v34;
    v37 = (const char *)[v36 UTF8String];
    strlcpy(v35, v37, qword_100042FB8);
    BOOL v38 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    unint64_t v7 = v47;
    unint64_t v6 = v48;
    v12 = v46;
    if (v38) {
      sub_1000238CC(v38, v39, v40, v41, v42, v43, v44, v45);
    }
    qword_100042F38 = qword_100042FB0;
  }
  pthread_mutex_unlock(&stru_100042D10);
}

- (OSACrashReport)initWithTask:(unsigned int)a3 exceptionType:(int)a4 thread:(unsigned int)a5 threadId:(unint64_t)a6 threadStateFlavor:(int)a7 threadState:(unsigned int)a8[1296] threadStateCount:(unsigned int)a9
{
  uint64_t v12 = *(void *)&a5;
  v32.receiver = self;
  v32.super_class = (Class)OSACrashReport;
  v15 = [(OSACrashReport *)&v32 init];
  if (v15)
  {
    *(CFAbsoluteTime *)&v15->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time] = CFAbsoluteTimeGetCurrent();
    mach_timebase_info info = 0;
    if (!mach_timebase_info(&info) && info.denom)
    {
      LODWORD(v16) = info.numer;
      double v17 = (double)v16 * 0.000000001 / (double)info.denom;
      v15->_awakeSystemUptime = (unint64_t)(v17 * (double)mach_absolute_time());
    }
    v15->_device_lock_state = MKBGetDeviceLockState();
    v15->_device_unlocked_since_boot = MKBDeviceUnlockedSinceBoot();
    v15->_is_full_corpse = 0;
    v15->_is_lightweight_corpse = 0;
    v15->_task = a3;
    v15->_is_driverkit = CSTaskIsDriverKit();
    v18 = (OSAExclaveContainer *)objc_alloc_init((Class)OSAExclaveContainer);
    exclaveContainer = v15->_exclaveContainer;
    v15->_exclaveContainer = v18;

    v15->_threadPortOriginal = v12;
    v15->_threadId = a6;
    v15->_crashedThreadNumber = -1;
    v15->_threadStateFlavor = a7;
    v15->_threadStateCount = a9;
    if (a8 && a9) {
      memcpy(v15->_threadState, a8, 4 * a9);
    }
    uint64_t v20 = objc_opt_new();
    threadPortPedigree = v15->_threadPortPedigree;
    v15->_threadPortPedigree = (NSMutableArray *)v20;

    v22 = v15->_threadPortPedigree;
    if (v12 && a6 == -1)
    {
      +[NSString stringWithFormat:@"init mach STANDARD 0x%x ID(0x%llX)", v12, -1];
    }
    else if (a6 == -1)
    {
      +[NSString stringWithFormat:@"init mach UNEXPECTED 0x%x ID(0x%llX)", v12, -1];
    }
    else
    {
      +[NSString stringWithFormat:@"init mach PROTECTED 0x%x ID(0x%llX)", v12, a6];
    id v23 = };
    [(NSMutableArray *)v22 addObject:v23];

    v15->_exceptionType = a4;
    uint64_t v24 = objc_opt_new();
    applicationSpecificInfo = v15->_applicationSpecificInfo;
    v15->_applicationSpecificInfo = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    applicationSpecificInfoFullSensitive = v15->_applicationSpecificInfoFullSensitive;
    v15->_applicationSpecificInfoFullSensitive = (NSMutableDictionary *)v26;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003334;
    block[3] = &unk_100034E20;
    CFStringRef v30 = v15;
    if (qword_100042FC0 != -1) {
      dispatch_once(&qword_100042FC0, block);
    }
  }
  return v15;
}

- (void)dealloc
{
  exceptionCode = self->_exceptionCode;
  if (exceptionCode) {
    free(exceptionCode);
  }
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot) {
    free(exit_snapshot);
  }
  exit_payload = self->_exit_payload;
  if (exit_payload) {
    free(exit_payload);
  }
  [(OSACrashReport *)self stashStatus:0 note:0];
  v6.receiver = self;
  v6.super_class = (Class)OSACrashReport;
  [(OSACrashReport *)&v6 dealloc];
}

- (void)unpackExceptionCodes
{
  exceptionCode = self->_exceptionCode;
  int64_t v3 = *exceptionCode;
  unsigned int v4 = (*exceptionCode >> 20) & 0xF;
  if (v4) {
    self->_exceptionType = v4;
  }
  self->_signal = BYTE3(v3);
  int64_t *exceptionCode = v3 & 0xFFFFF;
}

- (void)_extractRosettaRuntimeInfo:(_CSTypeRef)a3 withBlock:(id)a4
{
  id v4 = a4;
  if (&_rosetta_get_runtime_location)
  {
    objc_super v6 = +[NSString stringWithUTF8String:rosetta_get_runtime_location()];
    id v7 = v4;
    id v5 = v6;
    CSSymbolicatorForeachSymbolOwnerAtTime();
  }
}

- (void)_extractWorkQueueLimitsFromData:(proc_workqueueinfo *)a3
{
  if ((a3->pwq_state & 3) != 0)
  {
    id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    uint32_t pwq_state = a3->pwq_state;
    if (pwq_state)
    {
      unsigned int v10 = 0;
      size_t v9 = 4;
      sysctlbyname("kern.wq_max_constrained_threads", &v10, &v9, 0, 0);
      id v7 = +[NSNumber numberWithUnsignedInt:v10];
      [v5 setObject:v7 forKeyedSubscript:@"Dispatch Thread Soft Limit"];

      uint32_t pwq_state = a3->pwq_state;
    }
    if ((pwq_state & 2) != 0)
    {
      unsigned int v10 = 0;
      size_t v9 = 4;
      sysctlbyname("kern.wq_max_threads", &v10, &v9, 0, 0);
      v8 = +[NSNumber numberWithUnsignedInt:v10];
      [v5 setObject:v8 forKeyedSubscript:@"Dispatch Thread Hard Limit"];
    }
    if ([v5 count]) {
      objc_storeStrong((id *)&self->_workQueueLimits, v5);
    }
  }
}

- (void)extractThreadStateInfo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_pageinStateCount = &self->_pageinStateCount;
  self->_pageinStateCount = 1;
  uint64_t state = thread_get_state(a3, 27, self->_pageinState, &self->_pageinStateCount);
  if (state)
  {
    id v7 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    v8 = +[NSString stringWithFormat:@"thread_get_state(PAGEIN) returned 0x%x: %s", state, mach_error_string(state)];
    [v7 addObject:v8];

    unsigned int *p_pageinStateCount = 0;
  }
  self->_exceptionStateCount = 4;
  uint64_t v9 = thread_get_state(v3, 7, self->_exceptionState, &self->_exceptionStateCount);
  if (v9)
  {
    unsigned int v10 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    v11 = +[NSString stringWithFormat:@"thread_get_state(EXCEPTION) returned 0x%x: %s", v9, mach_error_string(v9)];
    [v10 addObject:v11];

    self->_exceptionStateCount = 0;
  }
  p_uint64_t threadStateCount = &self->_threadStateCount;
  uint64_t threadStateCount = self->_threadStateCount;
  if (self->_threadPortOriginal != v3 || !threadStateCount)
  {
    threadPortPedigree = self->_threadPortPedigree;
    v15 = +[NSString stringWithFormat:@"getState(0x%x, flavor %d) count %d", v3, self->_threadStateFlavor, threadStateCount];
    [(NSMutableArray *)threadPortPedigree addObject:v15];

    unsigned int *p_threadStateCount = 1296;
    uint64_t v16 = thread_get_state(v3, self->_threadStateFlavor, self->_threadState, &self->_threadStateCount);
    if (v16)
    {
      uint64_t v17 = OBJC_IVAR___OSAReport__notes;
      v18 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      v19 = +[NSString stringWithFormat:@"thread_get_state(FLAVOR) returned 0x%x: %s", v16, mach_error_string(v16)];
      [v18 addObject:v19];

      *(void *)object_addr = 0;
      uint64_t v20 = mach_port_kernel_object(mach_task_self_, v3, &object_addr[1], object_addr);
      v21 = self->_threadPortPedigree;
      v22 = +[NSString stringWithFormat:@"object check returned 0x%x (%s) type %u (expected 1)", v20, mach_error_string(v20), object_addr[1]];
      [(NSMutableArray *)v21 addObject:v22];

      id v23 = +[OSASystemConfiguration sharedInstance];
      LODWORD(v21) = [v23 appleInternal];

      if (v21) {
        [*(id *)&self->OSAReport_opaque[v17] addObjectsFromArray:self->_threadPortPedigree];
      }
      self->_threadStateFlavor = 5;
      unsigned int *p_threadStateCount = 0;
    }
  }
}

- (id)pathFromPid:(int)a3
{
  bzero(buffer, 0x400uLL);
  int v4 = proc_pidpath(a3, buffer, 0x400u);
  if (v4 >= 1)
  {
    buffer[v4] = 0;
LABEL_4:
    id v5 = +[NSString stringWithUTF8String:buffer];
    goto LABEL_5;
  }
  if (v4) {
    goto LABEL_4;
  }
  id v5 = 0;
LABEL_5:

  return v5;
}

- (id)nameFromPid:(int)a3
{
  bzero(buffer, 0x400uLL);
  int v4 = proc_name(a3, buffer, 0x400u);
  int v5 = v4;
  if (v4 >= 1) {
    buffer[v4] = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = "<error>";
    v9[0] = 67109634;
    v9[1] = a3;
    if (v5 > 0) {
      objc_super v6 = buffer;
    }
    __int16 v10 = 1024;
    int v11 = v5;
    __int16 v12 = 2080;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "proc_name(%d) = [%d] %s", (uint8_t *)v9, 0x18u);
  }
  if (v5 < 1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = +[NSString stringWithUTF8String:buffer];
  }

  return v7;
}

- (_CSTypeRef)_getSymbolicator:(BOOL)a3
{
  if (a3) {
    CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
  }
  uint64_t v4 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  unint64_t v6 = v5;
  if (CSIsNull())
  {
    if (_dyld_process_info_create()) {
      _dyld_process_info_release();
    }
    uint64_t v7 = OBJC_IVAR___OSAReport__notes;
    v8 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    uint64_t v9 = +[NSString stringWithFormat:@"Corpse is incomplete (_dyld_process_info_create failed with %d)", 5];
    [v8 addObject:v9];

    [*(id *)&self->OSAReport_opaque[v7] addObject:@"Backtraces may be be unvailable or truncated to only leaf frames, and the binary image list may not be available"];
  }
  unint64_t v10 = v4;
  unint64_t v11 = v6;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (void)validateProcName
{
  CFStringRef procName = self->_procName;
  uint64_t v4 = +[NSCharacterSet characterSetWithRange:](NSCharacterSet, "characterSetWithRange:", 0, 1);
  id v5 = [(NSString *)procName rangeOfCharacterFromSet:v4];

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(NSString *)self->_procName substringToIndex:v5];
    uint64_t v7 = self->_procName;
    self->_CFStringRef procName = v6;
  }
  NSUInteger v8 = [(NSString *)self->_procName length];
  uint64_t v9 = self->_procName;
  if (v8)
  {
    if ([(NSString *)v9 length] < 0x41) {
      return;
    }
    unint64_t v10 = [(NSString *)self->_procName substringToIndex:64];
    uint64_t v9 = self->_procName;
  }
  else
  {
    unint64_t v10 = @"Unknown";
  }
  self->_CFStringRef procName = &v10->isa;
}

- (void)dumpProgramCounterBytes
{
  kern_return_t v27;
  kern_return_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint32_t v36;
  const char *v37;
  NSData *v38;
  NSData *pc_bytes_before;
  NSData *v40;
  NSData *pc_bytes;
  unint64_t v42;
  mach_vm_address_t v43;
  mach_msg_type_number_t dataCnt;
  vm_offset_t data;
  uint8_t buf[4];
  unsigned char v47[24];
  long long v48;
  long long v49;
  long long v50;

  data = 0;
  dataCnt = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  threadStateDecoded = self->_threadStateDecoded;
  if (!threadStateDecoded
    || ([(NSDictionary *)threadStateDecoded objectForKeyedSubscript:@"pc"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_100023948(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return;
  }
  id v5 = [(NSDictionary *)self->_threadStateDecoded objectForKeyedSubscript:@"pc"];
  unint64_t v6 = [v5 objectForKeyedSubscript:@"value"];
  uint64_t v7 = (char *)[v6 unsignedLongValue];

  if ((unint64_t)v7 <= 0xFC0000000 && (unint64_t)v7 >= vm_page_size)
  {
    v49 = 0u;
    long long v50 = 0u;
    unint64_t v48 = 0u;
    if ([(OSACrashReport *)self _regionInfoAtAddress:v7 regionInfo:&v48 regionAddress:&v43 regionSize:&v42])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100023AE8();
      }
      return;
    }
    mach_vm_address_t v19 = v43;
    uint64_t v20 = &v7[-v43];
    if ((unint64_t)v7 < v43)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)unint64_t v47 = v7;
      uint64_t v9 = "Crashing program counter 0x%llx was unmapped";
      goto LABEL_21;
    }
    if ((v48 & 4) == 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)unint64_t v47 = v7;
      uint64_t v9 = "Crashing pc 0x%llx was not executable";
LABEL_21:
      unint64_t v10 = buf;
      goto LABEL_22;
    }
    unint64_t v22 = v42;
    if (v48 == 7 || DWORD1(v49) == 64)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)unint64_t v47 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Crashing pc 0x%llx was JIT", buf, 0xCu);
      }
      mach_vm_size_t v23 = 800;
    }
    else
    {
      mach_vm_size_t v23 = 80;
    }
    unint64_t v24 = v23 >> 1;
    mach_vm_address_t v25 = (mach_vm_address_t)&v7[-(v23 >> 1)];
    unint64_t v26 = v23 + v25 - 1;
    if (v25 - v19 >= v22)
    {
      if ([(OSACrashReport *)self _regionInfoAtAddress:v25 regionInfo:&v48 regionAddress:&v43 regionSize:&v42])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100023A78();
        }
        goto LABEL_34;
      }
      if (v43 > v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)unint64_t v47 = v43;
          *(_WORD *)&v47[8] = 2048;
          *(void *)&v47[10] = v25;
          v35 = "VM region 0x%llx before crashing pc 0x%llx was unmapped";
          id v36 = 22;
LABEL_57:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      if ((v48 & 4) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)unint64_t v47 = v25;
          v35 = "region before crashing pc 0x%llx was not executable";
          id v36 = 12;
          goto LABEL_57;
        }
LABEL_34:
        mach_vm_address_t v25 = v19;
        unint64_t v24 = (unint64_t)v20;
      }
    }
    if (v26 - v19 < v22) {
      goto LABEL_40;
    }
    if ([(OSACrashReport *)self _regionInfoAtAddress:v26 regionInfo:&v48 regionAddress:&v43 regionSize:&v42])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100023A08();
      }
      goto LABEL_39;
    }
    if (v43 <= v26)
    {
      if ((v48 & 4) != 0)
      {
LABEL_40:
        v27 = mach_vm_read(self->_task, v25, v23, &data, &dataCnt);
        if (v27)
        {
          v28 = v27;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)unint64_t v47 = v28;
            *(_WORD *)&v47[4] = 2048;
            *(void *)&v47[6] = v23;
            *(_WORD *)&v47[14] = 2048;
            *(void *)&v47[16] = v25;
            uint64_t v9 = "Error %d reading 0x%zx bytes at 0x%llx from remote task";
            unint64_t v10 = buf;
            uint32_t v21 = 28;
            goto LABEL_23;
          }
        }
        else
        {
          if (v24 <= dataCnt)
          {
            BOOL v38 = +[NSData dataWithBytes:data length:v24];
            pc_bytes_before = self->_pc_bytes_before;
            self->_pc_bytes_before = v38;

            uint64_t v40 = +[NSData dataWithBytes:data + v24 length:dataCnt - v24];
            pc_bytes = self->_pc_bytes;
            self->_pc_bytes = v40;
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100023984((uint64_t)&dataCnt, v24, v29, v30, v31, v32, v33, v34);
          }
          mach_vm_deallocate(mach_task_self_, data, dataCnt);
        }
        return;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)unint64_t v47 = v43;
        *(_WORD *)&v47[8] = 2048;
        *(void *)&v47[10] = v26;
        v37 = "region 0x%llx after crashing pc 0x%llx was not executable";
        goto LABEL_61;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)unint64_t v47 = v43;
      *(_WORD *)&v47[8] = 2048;
      *(void *)&v47[10] = v26;
      v37 = "VM region 0x%llx after crashing pc 0x%llx was unmapped";
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);
    }
LABEL_39:
    mach_vm_size_t v23 = v22 + v19 - v25;
    goto LABEL_40;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v48) = 134217984;
    *(void *)((char *)&v48 + 4) = v7;
    uint64_t v9 = "Invalid crashing program counter 0x%llx could not be dumped";
    unint64_t v10 = (uint8_t *)&v48;
LABEL_22:
    uint32_t v21 = 12;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, v10, v21);
  }
}

- (void)finishExtractionUsingCorpse
{
  [(OSACrashReport *)self stashStatus:@"Extracting" note:0];
  [(OSACrashReport *)self validateProcName];
  id v3 = [objc_alloc((Class)VMUProcInfo) initWithPid:self->_ppid];
  v88 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 name];
    id v5 = (NSString *)[v4 copy];
    parentProcessName = self->_parentProcessName;
    self->_parentProcessName = v5;
  }
  else
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to create NSProcInfo for parent process"];
  }
  if (!self->_parentProcessName)
  {
    uint64_t v7 = [(OSACrashReport *)self nameFromPid:self->_ppid];
    NSUInteger v8 = self->_parentProcessName;
    self->_parentProcessName = v7;
  }
  if (self->_task + 1 >= 2)
  {
    v121[0] = 0;
    if (_dyld_process_info_create())
    {
      self->_platform = _dyld_process_info_get_platform();
      _dyld_process_info_release();
    }
    else
    {
      BOOL v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      uint64_t v12 = +[NSString stringWithFormat:@"_dyld_process_info_create failed with %d", v121[0]];
      [v11 addObject:v12];
    }
    if (dyld_process_create_for_task())
    {
      if (dyld_process_snapshot_create_for_process())
      {
        if (dyld_process_snapshot_get_shared_cache())
        {
          p_sharedCacheBase = &self->_sharedCacheBase;
          self->_sharedCacheBase = dyld_shared_cache_get_base_address();
          unint64_t mapped_size = dyld_shared_cache_get_mapped_size();
          self->_sharedCacheSize = mapped_size;
          if (*p_sharedCacheBase + mapped_size <= *p_sharedCacheBase)
          {
            mach_vm_address_t v19 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
            uint64_t v20 = +[NSString stringWithFormat:@"shared cache base 0x%llX + size 0x%llX overflow", *p_sharedCacheBase, mapped_size];
            [v19 addObject:v20];

            self->_sharedCacheBase = 0;
            self->_sharedCacheSize = 0;
          }
          else
          {
            dyld_shared_cache_copy_uuid();
          }
        }
        else
        {
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"dyld_process_snapshot_get_shared_cache failed"];
        }
        dyld_process_snapshot_dispose();
      }
      else
      {
        uint64_t v17 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
        uint64_t v18 = +[NSString stringWithFormat:@"dyld_process_snapshot_create_for_process failed with %d", v121[0]];
        [v17 addObject:v18];
      }
      dyld_process_dispose();
    }
    else
    {
      uint64_t v15 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      uint64_t v16 = +[NSString stringWithFormat:@"dyld_process_create_for_task failed with %d", v121[0]];
      [v15 addObject:v16];
    }
    get_default[0] = 0;
    mach_msg_type_number_t policy_infoCnt = 1;
    policy_mach_timebase_info info = 0;
    if (!task_policy_get(self->_task, 1u, &policy_info, &policy_infoCnt, get_default)) {
      self->_task_role = policy_info;
    }
    CSSymbolicatorSetForceGlobalSafeMachVMReads();
    id v93 = objc_alloc_init((Class)OSABinaryImageCatalog);
    id v21 = [(OSACrashReport *)self _getSymbolicator:1];
    uint64_t v89 = v22;
    id v90 = v21;
    if (CSIsNull())
    {
      unsigned int name = 0;
    }
    else
    {
      -[OSACrashReport _extractBinaryImageInfoUsingSymbolicator:usingCatalog:](self, "_extractBinaryImageInfoUsingSymbolicator:usingCatalog:", v90, v89, v93);
      -[OSACrashReport _extractVMMap:](self, "_extractVMMap:", v90, v89);
      CSRelease();
      id v23 = [(OSACrashReport *)self _getSymbolicator:0];
      uint64_t v89 = v24;
      id v90 = v23;
      mach_vm_address_t v25 = +[NSMutableString string];
      [(OSACrashReport *)self setLogWritingSignatureFrames:v25];

      unsigned int name = -[OSACrashReport _extractBacktraceInfoUsingSymbolicator:usingCatalog:](self, "_extractBacktraceInfoUsingSymbolicator:usingCatalog:", v90, v89, v93);
      if ([(OSACrashReport *)self _isPGMCrashType])
      {
        -[OSACrashReport _extractPGMReportUsingSymbolicator:usingCatalog:](self, "_extractPGMReportUsingSymbolicator:usingCatalog:", v90, v89, v93);
        -[OSACrashReport _extractPGMLibpasReportUsingSymbolicator:usingCatalog:](self, "_extractPGMLibpasReportUsingSymbolicator:usingCatalog:", v90, v89, v93);
      }
      -[OSACrashReport _extractSanitizerReportUsingSymbolicator:usingCatalog:](self, "_extractSanitizerReportUsingSymbolicator:usingCatalog:", v90, v89, v93);
      -[OSACrashReport _extractMemoryErrorReportUsingSymbolicator:usingCatalog:](self, "_extractMemoryErrorReportUsingSymbolicator:usingCatalog:", v90, v89, v93);
      -[OSACrashReport _extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:](self, "_extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:", v90, v89, v93);
      -[OSACrashReport _extractExceptionReasonUsingSymbolicator:usingCatalog:](self, "_extractExceptionReasonUsingSymbolicator:usingCatalog:", v90, v89, v93);
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obj = self->_exclaveThreadNumbers;
    id v94 = [(NSMutableArray *)obj countByEnumeratingWithState:&v110 objects:v125 count:16];
    if (v94)
    {
      uint64_t v92 = *(void *)v111;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v111 != v92)
          {
            uint64_t v27 = v26;
            objc_enumerationMutation(obj);
            uint64_t v26 = v27;
          }
          uint64_t v95 = v26;
          v97 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:", (int)[*(id *)(*((void *)&v110 + 1) + 8 * v26) intValue]);
          id v28 = [v97 objectForKeyedSubscript:@"frames"];
          v96 = [v97 objectForKeyedSubscript:@"id"];
          if (!v28)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_100023BD4(v123, v96, &v124);
            }
            id v28 = objc_alloc_init((Class)NSMutableArray);
          }
          v29 = [(OSAExclaveContainer *)self->_exclaveContainer getFramesForThread:v96 usingCatalog:v93];
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id v30 = v29;
          id v31 = [v30 countByEnumeratingWithState:&v106 objects:v122 count:16];
          if (v31)
          {
            uint64_t v32 = 0;
            uint64_t v33 = *(void *)v107;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v107 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = [(OSACrashReport *)self composeFrame:*(void *)(*((void *)&v106 + 1) + 8 * i) info:&off_10003CEB8];
                [v28 insertObject:v35 atIndex:(char *)i + v32];
              }
              id v31 = [v30 countByEnumeratingWithState:&v106 objects:v122 count:16];
              v32 += (uint64_t)i;
            }
            while (v31);
          }

          [v97 setObject:v28 forKeyedSubscript:@"frames"];
          id v36 = [(OSAExclaveContainer *)self->_exclaveContainer threadIdToScId];
          v37 = [v36 objectForKeyedSubscript:v96];

          if (v37) {
            [v97 setObject:v37 forKeyedSubscript:@"exclaveScid"];
          }

          uint64_t v26 = v95 + 1;
        }
        while ((id)(v95 + 1) != v94);
        id v94 = [(NSMutableArray *)obj countByEnumeratingWithState:&v110 objects:v125 count:16];
      }
      while (v94);
    }

    if (self->_exceptionType == 1)
    {
      self->_unint64_t crashingAddress = self->_exceptionCode[1];
      id v38 = [objc_alloc((Class)VMUVMRegionIdentifier) initWithTask:self->_task pid:self->_proc_id options:4352];
      uint64_t v39 = [v38 descriptionOfRegionsAroundAddress:self->_crashingAddress options:4096];
      uint64_t v40 = v39;
      if (v39)
      {
        uint64_t v41 = [v39 componentsSeparatedByString:@"\n"];
        uint64_t v42 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
        uint64_t v43 = [v41 filteredArrayUsingPredicate:v42];

        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        vmregion_mach_timebase_info info = self->_vmregion_info;
        self->_vmregion_mach_timebase_info info = v44;
      }
    }
    else if ((self->_cs_status & 0x1000000) != 0 && self->_exceptionStateCount)
    {
      self->_unint64_t crashingAddress = *(void *)self->_exceptionState;
    }
    unint64_t crashingAddress = self->_crashingAddress;
    if (crashingAddress)
    {
      taskImages = self->_taskImages;
      uint64_t v105 = 0;
      id v48 = [v93 searchFrame:crashingAddress in:taskImages regions:0 result:&v105];
    }
    v49 = [v93 reportUsedImagesFullInfoUsingBlock:&stru_100034EA8];
    usedImages = self->_usedImages;
    self->_usedImages = v49;

    long long v51 = &self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    [v93 appendNotesTo:*(void *)v51];

    [(OSAExclaveContainer *)self->_exclaveContainer appendNotesTo:*(void *)v51];
    uint64_t threadPortOriginal = name;
    if (!name) {
      uint64_t threadPortOriginal = self->_threadPortOriginal;
    }
    [(OSACrashReport *)self extractThreadStateInfo:threadPortOriginal];
    -[OSACrashReport decode_crashingThreadStateWithSymbolicator:usingCatalog:](self, "decode_crashingThreadStateWithSymbolicator:usingCatalog:", v90, v89, 0);
    long long v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    threadStateDecoded = self->_threadStateDecoded;
    self->_threadStateDecoded = v53;

    self->_sroute_id = [(OSACrashReport *)self sRouteID];
    [(OSACrashReport *)self checkIfNeedsUrgentSubmission];
    if (name) {
      mach_port_deallocate(mach_task_self_, name);
    }
    if ((CSIsNull() & 1) == 0) {
      CSRelease();
    }
    [(OSACrashReport *)self dumpProgramCounterBytes];
  }
  else
  {
    uint64_t v9 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    unint64_t v10 = +[NSString stringWithFormat:@"Failed to determine task_t for %@[%d], so no last exception, backtraces, binary images, or dyld info", self->_procName, self->_proc_id];
    [v9 addObject:v10];
  }
  if (!sandbox_container_path_for_pid())
  {
    v55 = +[NSString stringWithUTF8String:v121];
    sandboxContainer = self->_sandboxContainer;
    self->_sandboxContainer = v55;
  }
  __int16 v57 = [(OSACrashReport *)self logWritingSignatureFrames];
  id v58 = [v57 length];

  if (v58)
  {
    CFStringRef procName = self->_procName;
    uint64_t exceptionType = self->_exceptionType;
    int64_t v61 = *self->_exceptionCode;
    v62 = [(OSACrashReport *)self logWritingSignatureFrames];
    v63 = +[OSASystemConfiguration sharedInstance];
    v64 = [v63 productNameVersionBuildString];
    v65 = +[NSString stringWithFormat:@"%@ %s 0x%X 0x%qx %@ %@", procName, self->_slice_uuid, exceptionType, v61, v62, v64];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100023B64();
    }
    *(void *)get_default = 0;
    v116 = 0;
    LODWORD(v117) = 0;
    id v66 = v65;
    CC_SHA1([v66 UTF8String], (CC_LONG)objc_msgSend(v66, "length"), (unsigned __int8 *)get_default);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", LOBYTE(get_default[0]), BYTE1(get_default[0]), BYTE2(get_default[0]), HIBYTE(get_default[0]), LOBYTE(get_default[1]), BYTE1(get_default[1]), BYTE2(get_default[1]), HIBYTE(get_default[1]), v116, BYTE1(v116), BYTE2(v116), BYTE3(v116), BYTE4(v116), BYTE5(v116), BYTE6(v116), HIBYTE(v116),
      v117,
      BYTE1(v117),
      BYTE2(v117),
    v67 = BYTE3(v117));
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:v67 forKeyedSubscript:kOSALogOptionSignature];
    objc_storeStrong((id *)&self->_logWritingSignature, v67);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      mach_msg_type_number_t policy_infoCnt = 138412290;
      v120 = v67;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "crash signature: %@", (uint8_t *)&policy_infoCnt, 0xCu);
    }
  }
  exceptionCode = self->_exceptionCode;
  int64_t v69 = *exceptionCode;
  if (self->_exceptionType == 11 && (v69 & 0xE000000000000000) == 0x6000000000000000 && self->_proc_id)
  {
    *(void *)get_default = 0;
    v116 = get_default;
    uint64_t v117 = 0x2020000000;
    char v118 = 0;
    double v70 = (double)(*(_DWORD *)exceptionCode & 0x1FFF);
    if (qword_100043078 != -1)
    {
      double v98 = (double)(*(_DWORD *)exceptionCode & 0x1FFF);
      dispatch_once(&qword_100043078, &stru_100035268);
      double v70 = v98;
    }
    if ((double)dword_100043080 * 0.75 < v70)
    {
      *((unsigned char *)v116 + 24) = 1;
      v71 = +[OSASystemConfiguration sharedInstance];
      unsigned int v72 = [v71 appleInternal];

      if (v72)
      {
        v73 = +[NSMutableDictionary dictionaryWithCapacity:1];
        spewage_diag = self->_spewage_diag;
        self->_spewage_diag = v73;
      }
    }
    if (*((unsigned char *)v116 + 24)) {
      goto LABEL_88;
    }
    id v75 = +[OSASystemConfiguration sharedInstance];
    if (([v75 isComputeController] & 1) == 0)
    {
      v76 = +[OSASystemConfiguration sharedInstance];
      unsigned __int8 v77 = [v76 isComputeNode];

      if (v77)
      {
LABEL_88:
        if (*((unsigned char *)v116 + 24)) {
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:&off_10003D048 forKeyedSubscript:kOSALogOptionPriority];
        }
        else {
          [(OSACrashReport *)self captureDiagInfo:&off_10003D498];
        }
        uint64_t task = self->_task;
        v85 = self->_procPath;
        if (byte_100042FD3)
        {
          if (qword_100043098 != -1) {
            dispatch_once(&qword_100043098, &stru_100035288);
          }
          if (off_100043090) {
            ((void (*)(uint64_t, void, const char *, void, void))off_100043090)(task, 0, [(NSString *)v85 UTF8String], 0, 0);
          }
        }

        _Block_object_dispose(get_default, 8);
        goto LABEL_105;
      }
      if (qword_100042FD8 != -1) {
        dispatch_once(&qword_100042FD8, &stru_100034EC8);
      }
      v78 = +[NSString stringWithFormat:@"ExcResourceDiagInfo_%@", self->_procName];
      v79 = +[NSUserDefaults standardUserDefaults];
      v80 = +[NSDate date];
      v81 = qword_100042FE0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005850;
      block[3] = &unk_100034EF0;
      id v100 = v79;
      id v101 = v78;
      v103 = self;
      v104 = get_default;
      id v102 = v80;
      id v82 = v80;
      id v83 = v78;
      id v75 = v79;
      dispatch_sync(v81, block);
    }
    goto LABEL_88;
  }
  if (v69 == 3238382097)
  {
    [(OSACrashReport *)self captureDiagInfo:&off_10003D4C8];
  }
  else if (v69 == 3134085662)
  {
    [(OSACrashReport *)self captureDiagInfo:&off_10003D4B0];
  }
  else if (self->_abort_cause == 1414810708 || v69 == 1414810708 && self->_is_simulated)
  {
    [(OSACrashReport *)self captureDiagInfo:&off_10003D4E0];
  }
LABEL_105:
  [(OSACrashReport *)self stashStatus:@"Capture Complete" note:0];
}

- (void)autopsyCorpse
{
  self->_is_full_corpse = 1;
  mach_vm_address_t kcd_addr_begin = 0;
  mach_vm_size_t v5 = 0;
  if (task_map_corpse_info_64(mach_task_self_, self->_task, &kcd_addr_begin, &v5)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = kcd_addr_begin == 0;
  }
  if (v3 || v5 == 0)
  {
    objc_msgSend(*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes], "addObject:", @"Couldn't map kcdata from kernel", v5);
  }
  else
  {
    -[OSACrashReport parseCorpse:size:](self, "parseCorpse:size:");
    mach_vm_deallocate(mach_task_self_, kcd_addr_begin, v5);
    [(OSACrashReport *)self finishExtractionUsingCorpse];
  }
}

- (void)autopsyLightweightCorpse:(unint64_t)a3 size:(unint64_t)a4
{
  self->_is_lightweight_corpse = 1;
  self->_is_simulated = 1;
  uint64_t v7 = +[NSMutableArray array];
  taskImages = self->_taskImages;
  self->_taskImages = v7;

  [(OSACrashReport *)self parseCorpse:a3 size:a4];

  [(OSACrashReport *)self finishExtractionUsingLightweightCorpse];
}

- (BOOL)validKcdataItem:(kcdata_iter)a3 min_size:(unint64_t)a4
{
  kcdata_item_t item = a3.item;
  signed int type = a3.item->type;
  if ((a3.item->type & 0xFFFFFFF0) == 0x20) {
    signed int type = 17;
  }
  if (type > 2309)
  {
    if (type == 2310)
    {
      uint32_t size = a3.item->size;
      if (size == 112)
      {
        if ((a3.item->flags & 0x8F) == 0)
        {
          uint32_t v8 = 104;
          goto LABEL_21;
        }
        uint32_t size = 112;
      }
      goto LABEL_19;
    }
    if (type == 2312)
    {
      uint32_t size = a3.item->size;
      if (size == 32)
      {
        if ((a3.item->flags & 0x8F) == 0)
        {
          uint32_t v8 = 24;
          goto LABEL_21;
        }
        uint32_t size = 32;
      }
      goto LABEL_19;
    }
  }
  else if (type == 17 || type == 19)
  {
    uint32_t v8 = a3.item->size;
    goto LABEL_21;
  }
  uint32_t size = a3.item->size;
LABEL_19:
  BOOL v10 = size >= (a3.item->flags & 0xF);
  uint32_t v8 = size - (a3.item->flags & 0xF);
  if (!v10) {
    uint32_t v8 = 0;
  }
LABEL_21:
  unint64_t v11 = v8;
  if (v8 < a4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100023C38((int *)item, v11, a4);
  }
  return v11 >= a4;
}

- (void)parseCorpse:(unint64_t)a3 size:(unint64_t)a4
{
  memset(v157, 0, sizeof(v157));
  unint64_t v5 = a4 + a3;
  unint64_t v6 = a3 + 16;
  if (a3 + 16 > a4 + a3) {
    goto LABEL_318;
  }
  uint64_t v7 = (unsigned int *)a3;
  if (v6 + *(unsigned int *)(a3 + 4) > v5) {
    goto LABEL_318;
  }
  int v8 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 & 0xFFFFFFF0) == 0x20) {
    int v8 = 17;
  }
  if (v8 != 1178684999 && v8 != -559025833)
  {
LABEL_318:
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"invalid corpse info provided for EXC_CORPSE_NOTIFY"];
    unint64_t v11 = 0;
    goto LABEL_319;
  }
  unsigned int v153 = 0;
  BOOL v10 = 0;
  unint64_t v11 = 0;
  key = (char *)XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER;
  v149 = (char *)XPC_COALITION_INFO_KEY_NAME;
  do
  {
    uint64_t v12 = v7[1];
    if (v6 + v12 > v5) {
      break;
    }
    int v13 = *v7;
    if (*v7 == -242132755) {
      break;
    }
    if ((v13 & 0xFFFFFFF0) == 0x20) {
      int v13 = 17;
    }
    if (v13 > 2388)
    {
      if (v13 > 2814)
      {
        if (v13 != 2815)
        {
          if (v13 != 4097
            || !-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 20))
          {
            goto LABEL_287;
          }
          int v59 = *v7;
          if ((*v7 & 0xFFFFFFF0) == 0x20) {
            int v59 = 17;
          }
          if (v59 <= 2309)
          {
            if (v59 == 17 || v59 == 19)
            {
              v60 = v10;
              unsigned int v61 = v7[1];
              goto LABEL_309;
            }
LABEL_306:
            unsigned int v126 = v7[1];
            goto LABEL_307;
          }
          if (v59 == 2310)
          {
            unsigned int v126 = v7[1];
            if (v126 != 112) {
              goto LABEL_307;
            }
            if ((v7[2] & 0x8F) != 0)
            {
              unsigned int v126 = 112;
              goto LABEL_307;
            }
            v60 = v10;
            unsigned int v61 = 104;
          }
          else
          {
            if (v59 != 2312) {
              goto LABEL_306;
            }
            unsigned int v126 = v7[1];
            if (v126 != 32)
            {
LABEL_307:
              v60 = v10;
              BOOL v85 = v126 >= (v7[2] & 0xF);
              unsigned int v61 = v126 - (v7[2] & 0xF);
              if (!v85) {
                unsigned int v61 = 0;
              }
              goto LABEL_309;
            }
            if ((v7[2] & 0x8F) != 0)
            {
              unsigned int v126 = 32;
              goto LABEL_307;
            }
            v60 = v10;
            unsigned int v61 = 24;
          }
LABEL_309:
          self->_exit_snapshot_length = v61;
          v131 = (exit_reason_snapshot *)malloc_type_malloc(v61, 0xD87A0F2uLL);
          self->_exit_snapshot = v131;
          if (v131) {
            memcpy(v131, v7 + 4, self->_exit_snapshot_length);
          }
          goto LABEL_286;
        }
        if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4))
        {
          v60 = v10;
          unsigned int v96 = v7[4];
          if (v96)
          {
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"The backtrace is truncated"];
            if ((v96 & 2) != 0) {
              goto LABEL_297;
            }
LABEL_192:
            if ((v96 & 8) == 0) {
              goto LABEL_193;
            }
LABEL_298:
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"This crash report is incomplete"];
            if ((v96 & 4) != 0) {
LABEL_299:
            }
              [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"This crash report may be incomplete because the faulting thread was terminated."];
          }
          else
          {
            if ((v96 & 2) == 0) {
              goto LABEL_192;
            }
LABEL_297:
            [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"The async backtrace is truncated"];
            if ((v96 & 8) != 0) {
              goto LABEL_298;
            }
LABEL_193:
            if ((v96 & 4) != 0) {
              goto LABEL_299;
            }
          }
LABEL_286:
          BOOL v10 = v60;
        }
      }
      else
      {
        switch(v13)
        {
          case 2561:
LABEL_123:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4))
            {
              v60 = v10;
              self->_int proc_id = v7[4];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int proc_id = self->_proc_id;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = proc_id;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Parsing corpse data for pid %d", buf, 8u);
              }
              v63 = sub_1000077DC();
              if (os_signpost_enabled(v63))
              {
                int v64 = self->_proc_id;
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v64;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CorpseReceived", "pid %d enableTelemetry=YES ", buf, 8u);
              }
              goto LABEL_285;
            }
            break;
          case 2562:
LABEL_128:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4))
            {
              unsigned int v39 = v7[4];
              uint64_t v40 = 15792;
              goto LABEL_248;
            }
            break;
          case 2563:
LABEL_132:
            if (!self->_procName)
            {
              v155[0] = 0;
              v155[1] = 0;
              char v156 = 0;
              __memcpy_chk();
              v127 = sub_1000077DC();
              if (os_signpost_enabled(v127))
              {
                int v128 = self->_proc_id;
                *(_DWORD *)buf = 136446466;
                *(void *)&uint8_t buf[4] = v155;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v128;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v127, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CorpseReceived", "process: %{public}s [pid %d] enableTelemetry=YES ", buf, 0x12u);
              }

              v129 = +[NSString stringWithUTF8String:v155];
              CFStringRef procName = self->_procName;
              self->_CFStringRef procName = v129;

              [(OSACrashReport *)self stashStatus:@"Parsing KCData" note:0];
            }
            break;
          case 2564:
LABEL_142:
            if (v13 == 2312)
            {
              if (v12 == 32)
              {
                uint64_t v75 = *((void *)v7 + 1);
                if ((v75 & 0x8F) != 0) {
                  goto LABEL_210;
                }
                goto LABEL_280;
              }
            }
            else if (v13 == 2310 && v12 == 112)
            {
              uint64_t v75 = *((void *)v7 + 1);
              if ((v75 & 0x8F) == 0) {
                goto LABEL_215;
              }
LABEL_210:
              uint64_t v75 = *((void *)v7 + 1);
LABEL_212:
              if (v13 != 2312)
              {
                if (v13 == 2310 && v12 == 112)
                {
LABEL_215:
                  if ((v75 & 0x8F) == 0)
                  {
                    v60 = v10;
                    int v103 = 104;
                    goto LABEL_283;
                  }
                }
LABEL_281:
                v60 = v10;
                int v103 = v12 - (v75 & 0xF);
                if (v12 < (v75 & 0xFu)) {
                  int v103 = 0;
                }
LABEL_283:
                *((unsigned char *)v7 + (v103 - 1) + 16) = 0;
                +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
                v123 = (NSString *)objc_claimAutoreleasedReturnValue();
                procPath = self->_procPath;
                self->_procPath = v123;

                v63 = [(NSString *)self->_procPath lastPathComponent];
                if ([v63 length]) {
                  objc_storeStrong((id *)&self->_procName, v63);
                }
LABEL_285:

                goto LABEL_286;
              }
              if (v12 != 32) {
                goto LABEL_281;
              }
LABEL_280:
              if ((v75 & 0x8F) == 0)
              {
                v60 = v10;
                int v103 = 24;
                goto LABEL_283;
              }
              goto LABEL_281;
            }
            uint64_t v75 = *((void *)v7 + 1);
            if (v12 > (v7[2] & 0xF)) {
              goto LABEL_212;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "proc path string is NULL or malformed", buf, 2u);
            }
            break;
          case 2565:
LABEL_147:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
              break;
            }
            unsigned int v39 = v7[4];
            uint64_t v40 = 15796;
            goto LABEL_248;
          case 2566:
          case 2572:
          case 2573:
          case 2574:
          case 2575:
          case 2576:
          case 2577:
          case 2578:
          case 2579:
          case 2580:
          case 2581:
          case 2582:
          case 2583:
          case 2584:
          case 2585:
          case 2586:
          case 2587:
          case 2588:
          case 2589:
          case 2590:
          case 2591:
          case 2596:
          case 2597:
          case 2598:
          case 2599:
            break;
          case 2567:
LABEL_149:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4))
            {
              unsigned int v76 = v7[4];
              self->_is64Bit = (v76 & 4) != 0;
              uint64_t v77 = 16208;
              int v78 = (v76 >> 17) & 1;
LABEL_229:
              self->OSAReport_opaque[v77] = v78;
            }
            break;
          case 2568:
LABEL_153:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
              break;
            }
            unsigned int v39 = v7[4];
            uint64_t v40 = 96;
            goto LABEL_248;
          case 2569:
LABEL_134:
            uint64_t v70 = *((void *)v7 + 1);
            unsigned int v71 = v70 & 0xF;
            BOOL v85 = v12 >= v71;
            unsigned int v72 = v12 - v71;
            if (!v85) {
              unsigned int v72 = 0;
            }
            self->_exceptionCodeCount = v72 >> 3;
            int v73 = *v7;
            if ((*v7 & 0xFFFFFFF0) == 0x20) {
              int v73 = 17;
            }
            if (v73 <= 2309)
            {
              if (v73 == 17 || v73 == 19)
              {
                unsigned int v74 = v7[1];
                goto LABEL_256;
              }
LABEL_253:
              unsigned int v97 = v7[1];
              goto LABEL_254;
            }
            if (v73 == 2310)
            {
              unsigned int v97 = v7[1];
              if (v97 == 112)
              {
                if ((v70 & 0x8F) == 0)
                {
                  unsigned int v74 = 104;
                  goto LABEL_256;
                }
                unsigned int v97 = 112;
              }
            }
            else
            {
              if (v73 != 2312) {
                goto LABEL_253;
              }
              unsigned int v97 = v7[1];
              if (v97 == 32)
              {
                if ((v70 & 0x8F) == 0)
                {
                  unsigned int v74 = 24;
                  goto LABEL_256;
                }
                unsigned int v97 = 32;
              }
            }
LABEL_254:
            BOOL v85 = v97 >= v71;
            unsigned int v74 = v97 - v71;
            if (!v85) {
              unsigned int v74 = 0;
            }
LABEL_256:
            if (v74 <= 0x10) {
              size_t v116 = 16;
            }
            else {
              size_t v116 = v74;
            }
            uint64_t v117 = (int64_t *)malloc_type_calloc(1uLL, v116, 0x3987521FuLL);
            self->_exceptionCode = v117;
            int v118 = *v7;
            if ((*v7 & 0xFFFFFFF0) == 0x20) {
              int v118 = 17;
            }
            if (v118 <= 2309)
            {
              if (v118 == 17 || v118 == 19)
              {
                unsigned int v119 = v7[1];
                goto LABEL_276;
              }
LABEL_273:
              unsigned int v120 = v7[1];
              uint64_t v121 = *((void *)v7 + 1);
              goto LABEL_274;
            }
            if (v118 == 2310)
            {
              unsigned int v120 = v7[1];
              uint64_t v121 = *((void *)v7 + 1);
              if (v120 == 112)
              {
                if ((v121 & 0x8F) == 0)
                {
                  unsigned int v119 = 104;
                  goto LABEL_276;
                }
                unsigned int v120 = 112;
              }
            }
            else
            {
              if (v118 != 2312) {
                goto LABEL_273;
              }
              unsigned int v120 = v7[1];
              uint64_t v121 = *((void *)v7 + 1);
              if (v120 == 32)
              {
                if ((v121 & 0x8F) == 0)
                {
                  unsigned int v119 = 24;
                  goto LABEL_276;
                }
                unsigned int v120 = 32;
              }
            }
LABEL_274:
            unsigned int v122 = v121 & 0xF;
            BOOL v85 = v120 >= v122;
            unsigned int v119 = v120 - v122;
            if (!v85) {
              unsigned int v119 = 0;
            }
LABEL_276:
            memcpy(v117, v7 + 4, v119);
            if ((self->_exceptionType - 11) >= 2) {
              [(OSACrashReport *)self unpackExceptionCodes];
            }
            break;
          case 2570:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
              break;
            }
            unsigned int v39 = v7[4];
            uint64_t v40 = 0x4000;
            goto LABEL_248;
          case 2571:
LABEL_130:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 96))
            {
              memset(&buf[64], 0, 32);
              memset(&buf[32], 0, 32);
              *(_OWORD *)&buf[16] = 0u;
              long long v65 = *((_OWORD *)v7 + 1);
              long long v66 = *((_OWORD *)v7 + 2);
              long long v67 = *((_OWORD *)v7 + 3);
              long long v68 = *((_OWORD *)v7 + 4);
              long long v69 = *((_OWORD *)v7 + 6);
              *(_OWORD *)&buf[64] = *((_OWORD *)v7 + 5);
              *(_OWORD *)&buf[80] = v69;
              *(_OWORD *)&buf[32] = v67;
              *(_OWORD *)&buf[48] = v68;
              *(_OWORD *)buf = v65;
              *(_OWORD *)&buf[16] = v66;
              uuid_unparse_lower(buf, self->_slice_uuid);
              *(_OWORD *)&self->_proc_start_abstime = *(_OWORD *)&buf[80];
            }
            break;
          case 2592:
LABEL_151:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8))
            {
              unint64_t v79 = *((void *)v7 + 2);
              self->_threadId = v79;
              threadPortPedigree = self->_threadPortPedigree;
              v81 = +[NSString stringWithFormat:@"override via KCDATA ID(0x%llX)", v79];
              [(NSMutableArray *)threadPortPedigree addObject:v81];
            }
            break;
          case 2593:
            unsigned int v84 = v7[2] & 0xF;
            BOOL v85 = v12 >= v84;
            int v86 = v12 - v84;
            if (v86 != 0 && v85)
            {
              if (!v85) {
                int v86 = 0;
              }
              *((unsigned char *)v7 + (v86 - 1) + 16) = 0;
              if (*((unsigned char *)v7 + 16))
              {
                v87 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
                uint64_t v88 = OSASanitizePath();

                unint64_t v11 = (void *)v88;
              }
            }
            break;
          case 2594:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8)) {
              break;
            }
            v60 = v10;
            unint64_t v89 = *((void *)v7 + 2);
            unint64_t v90 = HIDWORD(v89);
            if (HIDWORD(v89) < 0x511)
            {
              *(void *)&self->_threadStateFlavor = v89;
              goto LABEL_286;
            }
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              goto LABEL_286;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v90;
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = 5184;
            v91 = "Unexpected count for TASK_BTINFO_THREAD_STATE %u > %lu";
            goto LABEL_181;
          case 2595:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8)) {
              break;
            }
            v60 = v10;
            unsigned int v92 = v7[5];
            if (v92 < 0x511)
            {
              self->_exceptionStateCount = v92;
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v92;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = 5184;
              v91 = "Unexpected count for TASK_BTINFO_THREAD_EXCEPTION_STATE %u > %lu";
LABEL_181:
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v91, buf, 0x12u);
            }
            goto LABEL_286;
          case 2600:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
              break;
            }
            unsigned int v39 = v7[4];
            uint64_t v40 = 16148;
            goto LABEL_248;
          case 2601:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 24)) {
              break;
            }
            uint64_t v93 = v7[9];
            *(void *)&v157[0] = v7[4];
            *((void *)&v157[1] + 1) = v93;
            long long v94 = *(_OWORD *)(v7 + 5);
            goto LABEL_188;
          case 2602:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 32)) {
              break;
            }
            uint64_t v95 = *((void *)v7 + 5);
            *(void *)&v157[0] = *((void *)v7 + 2);
            *((void *)&v157[1] + 1) = v95;
            long long v94 = *(_OWORD *)(v7 + 6);
LABEL_188:
            *(_OWORD *)((char *)v157 + 8) = v94;
            break;
          default:
            if (v13 != 2389) {
              break;
            }
            v55 = +[NSNumber numberWithUnsignedLongLong:*((void *)v7 + 2)];
            id v82 = +[NSNumber numberWithUnsignedLongLong:*((void *)v7 + 3)];
            [(OSAExclaveContainer *)self->_exclaveContainer setThreadId:v82 withScId:v55];

            goto LABEL_157;
        }
      }
    }
    else
    {
      if (v13 > 2049)
      {
        switch(v13)
        {
          case 2050:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 56)) {
              self->_uniqId = *((void *)v7 + 4);
            }
            goto LABEL_287;
          case 2051:
          case 2052:
          case 2055:
          case 2058:
          case 2060:
          case 2061:
          case 2065:
          case 2067:
          case 2068:
          case 2070:
          case 2073:
            goto LABEL_287;
          case 2053:
            goto LABEL_123;
          case 2054:
            goto LABEL_128;
          case 2056:
            goto LABEL_130;
          case 2057:
            goto LABEL_132;
          case 2059:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 16)) {
              self->_proc_starttime = (timeval)*((_OWORD *)v7 + 1);
            }
            goto LABEL_287;
          case 2062:
            goto LABEL_134;
          case 2063:
            goto LABEL_142;
          case 2064:
            if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
              goto LABEL_287;
            }
            unsigned int v39 = v7[4];
            uint64_t v40 = 160;
            break;
          case 2066:
            goto LABEL_147;
          case 2069:
            goto LABEL_149;
          case 2071:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 16))
            {
              *(_OWORD *)buf = *((_OWORD *)v7 + 1);
              [(OSACrashReport *)self _extractWorkQueueLimitsFromData:buf];
            }
            goto LABEL_287;
          case 2072:
            if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4))
            {
              self->_responsible_pid = v7[4];
              -[OSACrashReport nameFromPid:](self, "nameFromPid:");
              v104 = (NSString *)objc_claimAutoreleasedReturnValue();
              responsibleProc = self->_responsibleProc;
              self->_responsibleProc = v104;
            }
            goto LABEL_287;
          case 2074:
            goto LABEL_151;
          default:
            switch(v13)
            {
              case 2102:
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 640))
                {
                  memset(buf, 0, 512);
                  memcpy(buf, v7 + 4, 0x280uLL);
                  uint64_t v45 = objc_opt_new();
                  if (buf[0])
                  {
                    v46 = +[NSString stringWithUTF8String:buf];
                    [v45 addObject:v46];
                  }
                  if (buf[128])
                  {
                    unint64_t v47 = +[NSString stringWithUTF8String:&buf[128]];
                    [v45 addObject:v47];
                  }
                  if (buf[256])
                  {
                    id v48 = +[NSString stringWithUTF8String:&buf[256]];
                    [v45 addObject:v48];
                  }
                  if (buf[384])
                  {
                    v49 = +[NSString stringWithUTF8String:&buf[384]];
                    [v45 addObject:v49];
                  }
                  if (buf[512])
                  {
                    long long v50 = +[NSString stringWithUTF8String:&buf[512]];
                    [v45 addObject:v50];
                  }
                  long long v51 = [v45 componentsJoinedByString:&stru_100035B30];
                  ktriage_mach_timebase_info info = self->_ktriage_info;
                  self->_ktriage_mach_timebase_info info = v51;
                }
                goto LABEL_287;
              case 2103:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 4)) {
                  goto LABEL_287;
                }
                LOBYTE(v78) = v7[4] != 0;
                uint64_t v77 = 16377;
                goto LABEL_229;
              case 2105:
                unsigned int v39 = v7[4];
                uint64_t v40 = 16388;
                goto LABEL_248;
              case 2106:
                unsigned int v39 = v7[4];
                uint64_t v40 = 16392;
                if (v39 == 0x7FFFFFFF) {
                  unsigned int v39 = 0;
                }
                goto LABEL_248;
              case 2107:
                unsigned int v106 = v7[2] & 0xF;
                BOOL v85 = v12 >= v106;
                unsigned int v107 = v12 - v106;
                if (v85) {
                  size_t v108 = v107;
                }
                else {
                  size_t v108 = 0;
                }
                if (strnlen((const char *)v7 + 16, v108) >= v108) {
                  goto LABEL_287;
                }
                uint64_t v109 = +[NSString stringWithUTF8String:v7 + 4];
                uint64_t v110 = 16312;
                goto LABEL_244;
              case 2108:
                unsigned int v111 = v7[2] & 0xF;
                BOOL v85 = v12 >= v111;
                unsigned int v112 = v12 - v111;
                if (v85) {
                  size_t v113 = v112;
                }
                else {
                  size_t v113 = 0;
                }
                if (strnlen((const char *)v7 + 16, v113) >= v113) {
                  goto LABEL_287;
                }
                uint64_t v109 = +[NSString stringWithUTF8String:v7 + 4];
                uint64_t v110 = 16320;
LABEL_244:
                v114 = *(void **)&self->OSAReport_opaque[v110];
                *(void *)&self->OSAReport_opaque[v110] = v109;

                break;
              case 2109:
                unsigned int v39 = v7[4];
                uint64_t v40 = 16328;
                goto LABEL_248;
              case 2110:
                unsigned int v39 = v7[4];
                uint64_t v40 = 16332;
                goto LABEL_248;
              case 2111:
                goto LABEL_153;
              case 2112:
                unint64_t v115 = *((void *)v7 + 3);
                self->_jit_start_address = *((void *)v7 + 2);
                self->_jit_end_address = v115;
                goto LABEL_287;
              default:
                goto LABEL_287;
            }
            goto LABEL_287;
        }
LABEL_248:
        *(_DWORD *)&self->OSAReport_opaque[v40] = v39;
        goto LABEL_287;
      }
      switch(v13)
      {
        case 17:
          uint64_t v41 = *((void *)v7 + 1);
          if (SHIDWORD(v41) > 2074)
          {
            if (HIDWORD(v41) == 2572 || HIDWORD(v41) == 2075)
            {
              if (v41)
              {
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v7, v5, 8))
                {
                  unint64_t v53 = *((void *)v7 + 2);
                  self->_coalition_id = v53;
                  if (v53)
                  {
                    v54 = (void *)xpc_coalition_copy_info();
                    v55 = v54;
                    if (v54)
                    {
                      if (xpc_get_type(v54) == (xpc_type_t)&_xpc_type_dictionary)
                      {
                        string = xpc_dictionary_get_string(v55, key);
                        if (string || (string = xpc_dictionary_get_string(v55, v149)) != 0)
                        {
                          __int16 v57 = +[NSString stringWithUTF8String:string];
                          coalition_unsigned int name = self->_coalition_name;
                          self->_coalition_unsigned int name = v57;
                        }
                      }
                    }
LABEL_157:
                  }
                }
              }
              break;
            }
LABEL_162:
            if ((HIDWORD(v41) & 0xFFFFFFFE) == 0xA24)
            {
              if (v41 <= sub_100005BAC((uint64_t)v7) >> 3)
              {
                BOOL v10 = (uint64_t *)(v7 + 4);
                unsigned int v153 = v41;
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  unsigned int v132 = sub_100005BAC((uint64_t)v7);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v41;
                  *(_WORD *)&buf[8] = 2048;
                  *(void *)&buf[10] = v132 >> 3;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected count for TASK_BTINFO_BACKTRACE %u > %lu", buf, 0x12u);
                }
                unsigned int v153 = 0;
              }
            }
            break;
          }
          if (HIDWORD(v41) == 48)
          {
            if (v12 / 0x14 >= v41)
            {
              if (v41)
              {
                double v98 = v10;
                unint64_t v101 = 0;
                uint64_t v102 = 20 * *((void *)v7 + 1);
                do
                {
                  [(NSMutableArray *)self->_taskImages addImage:&v7[v101 / 4 + 5] address:v7[v101 / 4 + 4] size:0];
                  v101 += 20;
                }
                while (v102 != v101);
                goto LABEL_207;
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              unsigned int v83 = sub_100005BAC((uint64_t)v7);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v41;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = v83 / 0x14uLL;
              uint64_t v43 = "Unexpected count for TASK_BTINFO_DYLD_LOADINFO %u > %lu";
              goto LABEL_161;
            }
          }
          else
          {
            if (HIDWORD(v41) != 49) {
              goto LABEL_162;
            }
            if (v12 / 0x18 >= v41)
            {
              if (v41)
              {
                double v98 = v10;
                unint64_t v99 = 0;
                uint64_t v100 = 24 * *((void *)v7 + 1);
                do
                {
                  [(NSMutableArray *)self->_taskImages addImage:&v7[v99 / 4 + 6] address:*(void *)&v7[v99 / 4 + 4] size:0];
                  v99 += 24;
                }
                while (v100 != v99);
LABEL_207:
                BOOL v10 = v98;
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              unsigned int v42 = sub_100005BAC((uint64_t)v7);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v41;
              *(_WORD *)&buf[8] = 2048;
              *(void *)&buf[10] = v42 / 0x18uLL;
              uint64_t v43 = "Unexpected count for TASK_BTINFO_DYLD_LOADINFO64 %u > %lu";
LABEL_161:
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v43, buf, 0x12u);
            }
          }
          break;
        case 19:
          if (v7[4] == 2377)
          {
            uint64_t v7 = (unsigned int *)-[OSAExclaveContainer parseKCdata:](self->_exclaveContainer, "parseKCdata:", v7, v5);
            unint64_t v5 = v44;
          }
          break;
        case 56:
          uint64_t v14 = v7 + 4;
          unsigned int v15 = v7[2] & 0xF;
          BOOL v85 = v12 >= v15;
          LODWORD(v16) = v12 - v15;
          uint64_t v16 = v85 ? v16 : 0;
          unint64_t v17 = (unint64_t)v14 + v16;
          uint64_t v18 = v7 + 8;
          if (v7 + 8 <= (_DWORD *)((char *)v14 + v16))
          {
            v151 = v10;
            v152 = v11;
            while (1)
            {
              uint64_t v19 = v14[1];
              if ((unint64_t)v18 + v19 > v17 || (int v20 = *v14, *v14 == -242132755))
              {
LABEL_75:
                BOOL v10 = v151;
                goto LABEL_287;
              }
              if ((v20 & 0xFFFFFFF0) == 0x20) {
                int v20 = 17;
              }
              if (v20 > 4097) {
                break;
              }
              if (v20 == 54)
              {
                if (-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 4)) {
                  self->_terminator_pid = v14[4];
                }
                goto LABEL_74;
              }
              if (v20 != 55)
              {
LABEL_53:
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  if ((*v14 & 0xFFFFFFF0) == 0x20) {
                    int v28 = 17;
                  }
                  else {
                    int v28 = *v14;
                  }
                  int v29 = sub_100005BAC((uint64_t)v14);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v28;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v29;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "unknown nested kcdata type: 0x%x, size: %d", buf, 0xEu);
                }
                goto LABEL_74;
              }
              unsigned int v25 = v14[2] & 0xF;
              if (v19 >= v25) {
                size_t v26 = v19 - (v14[2] & 0xF);
              }
              else {
                size_t v26 = 0;
              }
              if (strnlen((const char *)v14 + 16, v26) < v26 && v19 > v25)
              {
                *((unsigned char *)v14 + (v26 - 1) + 16) = 0;
                uint64_t v36 = +[NSString stringWithUTF8String:v14 + 4];
                uint64_t v37 = 15960;
LABEL_73:
                id v38 = *(void **)&self->OSAReport_opaque[v37];
                *(void *)&self->OSAReport_opaque[v37] = v36;

                unint64_t v11 = v152;
                goto LABEL_74;
              }
              unint64_t v11 = v152;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                uint64_t v24 = "terminator proc string is NULL or malformed";
LABEL_51:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
              }
LABEL_74:
              uint64_t v14 = (_DWORD *)((char *)v18 + v14[1]);
              uint64_t v18 = v14 + 4;
              if ((unint64_t)(v14 + 4) > v17) {
                goto LABEL_75;
              }
            }
            switch(v20)
            {
              case 4098:
                unsigned int v21 = v14[2] & 0xF;
                if (v19 >= v21) {
                  size_t v22 = v19 - (v14[2] & 0xF);
                }
                else {
                  size_t v22 = 0;
                }
                if (strnlen((const char *)v14 + 16, v22) < v22 && v19 > v21)
                {
                  *((unsigned char *)v14 + (v22 - 1) + 16) = 0;
                  uint64_t v36 = +[NSString stringWithUTF8String:v14 + 4];
                  uint64_t v37 = 15952;
                  goto LABEL_73;
                }
                unint64_t v11 = v152;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_74;
                }
                *(_WORD *)buf = 0;
                uint64_t v24 = "exit reason string is NULL or malformed";
                break;
              case 4099:
                unsigned int v30 = v14[2] & 0xF;
                BOOL v85 = v19 >= v30;
                unsigned int v32 = v19 - v30;
                BOOL v31 = v32 != 0 && v85;
                if (!v85) {
                  unsigned int v32 = 0;
                }
                self->_exit_payload_length = v32;
                if (v31)
                {
                  uint64_t v33 = malloc_type_malloc(v32 + 1, 0x5D3125F0uLL);
                  self->_exit_payload = v33;
                  if (v33)
                  {
                    memcpy(v33, v14 + 4, self->_exit_payload_length);
                    *((unsigned char *)self->_exit_payload + self->_exit_payload_length) = 0;
                  }
                }
                goto LABEL_74;
              case 4100:
                goto LABEL_53;
              case 4101:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 8)) {
                  goto LABEL_74;
                }
                uint64_t v34 = *((void *)v14 + 2);
                uint64_t v35 = 16048;
                goto LABEL_68;
              case 4102:
                if (!-[OSACrashReport validKcdataItem:min_size:](self, "validKcdataItem:min_size:", v14, v17, 8)) {
                  goto LABEL_74;
                }
                uint64_t v34 = *((void *)v14 + 2);
                uint64_t v35 = 15880;
LABEL_68:
                *(void *)&self->OSAReport_opaque[v35] = v34;
                goto LABEL_74;
              default:
                if (v20 != 1403128064) {
                  goto LABEL_53;
                }
                goto LABEL_74;
            }
            goto LABEL_51;
          }
          break;
      }
    }
LABEL_287:
    v125 = (char *)v7 + v7[1];
    uint64_t v7 = (unsigned int *)(v125 + 16);
    unint64_t v6 = (unint64_t)(v125 + 32);
  }
  while (v6 <= v5);
  if (self->_is_lightweight_corpse && (int)v153 >= 1)
  {
    id v134 = objc_alloc_init((Class)OSABinaryImageCatalog);
    if (!uuid_is_null((const unsigned __int8 *)v157 + 8)) {
      [v134 targetSharedCache:(char *)v157 + 8 withSlide:*(void *)&v157[0] atBaseAddress:*((void *)&v157[1] + 1)];
    }
    [(NSMutableArray *)self->_taskImages sortByAddressAndSetInferredSizes];
    v135 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    threadInfos = self->_threadInfos;
    self->_threadInfos = v135;

    uint64_t v137 = v153;
    v138 = +[NSMutableArray arrayWithCapacity:v153];
    do
    {
      uint64_t v140 = *v10++;
      uint64_t v139 = v140;
      if (v140)
      {
        v141 = [v134 searchFrame:v139 in:self->_taskImages regions:0 result:0];
        v142 = [(OSACrashReport *)self composeFrame:v141 info:0];
        [v138 addObject:v142];
      }
      --v137;
    }
    while (v137);
    self->_crashedThreadNumber = 0;
    v143 = objc_opt_new();
    [v143 setObject:v138 forKeyedSubscript:@"frames"];
    v144 = +[NSNumber numberWithUnsignedLongLong:self->_threadId];
    [v143 setObject:v144 forKeyedSubscript:@"id"];

    [v143 setObject:v11 forKeyedSubscript:@"name"];
    [(NSMutableArray *)self->_threadInfos addObject:v143];
    v145 = [v134 reportUsedImagesFullInfoUsingBlock:0];
    usedImages = self->_usedImages;
    self->_usedImages = v145;

    -[OSACrashReport decode_crashingThreadStateWithSymbolicator:usingCatalog:](self, "decode_crashingThreadStateWithSymbolicator:usingCatalog:", 0, 0, v134);
    v147 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    threadStateDecoded = self->_threadStateDecoded;
    self->_threadStateDecoded = v147;
  }
LABEL_319:
}

- (id)problemType
{
  if (self->_is_lightweight_corpse) {
    v2 = @"308";
  }
  else {
    v2 = @"309";
  }
  if (self->_exceptionType == 11)
  {
    if ((unint64_t)*self->_exceptionCode >> 61 == 5) {
      return @"327";
    }
    v2 = @"385";
  }
  return v2;
}

- (id)appleCareDetails
{
  BOOL v3 = [(OSACrashReport *)self decode_exceptionCodes];
  uint64_t v4 = [v3 allValues];
  unint64_t v5 = [v4 componentsJoinedByString:@" "];
  unint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"," withString:@"-"];

  CFStringRef procName = self->_procName;
  uint64_t v12 = &off_10003D048;
  int v13 = procName;
  CFStringRef bundle_id = (const __CFString *)self->_bundle_id;
  if (!bundle_id) {
    CFStringRef bundle_id = &stru_100035B30;
  }
  uint64_t v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_is_simulated, v12, v13, bundle_id, v6);
  uint64_t v14 = v9;
  BOOL v10 = +[NSArray arrayWithObjects:&v12 count:5];

  return v10;
}

- (id)reportNamePrefix
{
  int exceptionType = self->_exceptionType;
  if (exceptionType == 12)
  {
    if ((unint64_t)*self->_exceptionCode >> 61 == 3) {
      CFStringRef v4 = @"ExcUserFault_";
    }
    else {
      CFStringRef v4 = &stru_100035B30;
    }
  }
  else
  {
    BOOL v3 = exceptionType == 11;
    CFStringRef v4 = @"ExcResource_";
    if (!v3) {
      CFStringRef v4 = &stru_100035B30;
    }
  }
  return +[NSString stringWithFormat:@"%@%@", v4, self->_procName];
}

- (BOOL)isActionable
{
  BOOL v3 = [(OSACrashReport *)self problemType];
  if (([v3 isEqualToString:@"385"] & 1) != 0
    || ([v3 isEqualToString:@"309"] & 1) != 0
    || [v3 isEqualToString:@"308"])
  {
    if (self->_is_simulated) {
      CFStringRef v4 = @"_sim";
    }
    else {
      CFStringRef v4 = &stru_100035B30;
    }
    unint64_t v5 = +[NSString stringWithFormat:@"%@_%@%@", v3, self->_procName, v4];
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:v5 forKeyedSubscript:kOSALogOptionCountKey];
  }
  exit_snapshot = self->_exit_snapshot;
  BOOL v7 = !exit_snapshot || exit_snapshot->ers_namespace != 7 || exit_snapshot->ers_code != 3;
  if (self->_exceptionType == 11 && (unint64_t)*self->_exceptionCode >> 61 == 3)
  {
    int v8 = +[OSASystemConfiguration sharedInstance];
    if ([v8 appleInternal])
    {
      if (byte_100042FD4) {
        BOOL v7 = 1;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else if (byte_100042FD4)
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)additionalIPSMetadata
{
  CFStringRef procName = self->_procName;
  v30[0] = kOSALogMetadataAppName;
  v30[1] = @"app_name";
  v31[0] = procName;
  v31[1] = procName;
  v30[2] = @"slice_uuid";
  int v29 = [(OSACrashReport *)self slice_uuid];
  v31[2] = v29;
  v30[3] = @"build_version";
  CFStringRef v4 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:kCFBundleVersionKey];
  if (v4)
  {
    CFStringRef v5 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:kCFBundleVersionKey];
  }
  else
  {
    CFStringRef v5 = &stru_100035B30;
  }
  int v28 = (__CFString *)v5;
  v31[3] = v5;
  v30[4] = @"app_version";
  uint64_t v6 = [(OSACrashReport *)self short_vers];
  BOOL v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = &stru_100035B30;
  }
  v31[4] = v8;
  v30[5] = @"is_first_party";
  uint64_t v9 = +[NSNumber numberWithBool:self->_is_first_party];
  v31[5] = v9;
  v30[6] = @"share_with_app_devs";
  BOOL is_simulated = self->_is_simulated;
  if (self->_is_simulated)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v27 = +[OSASystemConfiguration sharedInstance];
    id v11 = [v27 optIn3rdParty];
  }
  uint64_t v12 = +[NSNumber numberWithBool:v11];
  v31[6] = v12;
  v30[7] = kOSALogMetadataIncidentID;
  int v13 = [(OSACrashReport *)self incidentID];
  v31[7] = v13;
  v30[8] = @"platform";
  uint64_t v14 = +[NSNumber numberWithUnsignedInt:self->_platform];
  v31[8] = v14;
  unsigned int v15 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:9];
  id v16 = [v15 mutableCopy];

  if (!is_simulated) {
  if (v4)
  }

  unint64_t v17 = [(OSACrashReport *)self etlKey];

  if (v17)
  {
    uint64_t v18 = [(OSACrashReport *)self etlKey];
    [v16 setObject:v18 forKeyedSubscript:@"etl_key"];
  }
  CFStringRef bundle_id = self->_bundle_id;
  if (bundle_id) {
    [v16 setObject:bundle_id forKeyedSubscript:kOSALogMetadataBundleID];
  }
  if (self->_is_simulated) {
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is_simulated"];
  }
  if (self->_is_beta)
  {
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is_beta"];
    int v20 = [(NSDictionary *)self->_store_info objectForKeyedSubscript:@"storeCohortMetadata"];

    if (v20)
    {
      unsigned int v21 = [(NSDictionary *)self->_store_info objectForKeyedSubscript:@"storeCohortMetadata"];
      [v16 setObject:v21 forKeyedSubscript:@"app_cohort"];
    }
  }
  adam_id = self->_adam_id;
  if (adam_id) {
    [v16 setObject:adam_id forKeyedSubscript:@"adam_id"];
  }
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_namespace == 20 && self->_exit_payload && self->_exit_payload_length == 37)
  {
    uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    [v16 setObject:v24 forKeyedSubscript:@"correlationID"];
  }
  if (self->_sroute_id)
  {
    unsigned int v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [v16 setObject:v25 forKeyedSubscript:@"sroute_id"];
  }

  return v16;
}

- (id)slice_uuid
{
  if (self->_slice_uuid[0]) {
    slice_uuid = self->_slice_uuid;
  }
  else {
    slice_uuid = "";
  }
  return +[NSString stringWithUTF8String:slice_uuid];
}

- (void)_extractLastExceptionBacktraceUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolOwnerGetSymbolWithName();
    if ((CSIsNull() & 1) == 0)
    {
      CFStringRef v8 = [(OSACrashReport *)self _copyStringFromTask:self->_task atAddress:CSSymbolGetRange() maxLength:0 immutableCheck:0];
      if (v8)
      {
        uint64_t v9 = v8;
        size_t v10 = strlen(v8);
        if (v10 && *v9 == 40 && v9[v10 - 1] == 41)
        {
          id v11 = (NSArray *)objc_opt_new();
          uint64_t v12 = v9 + 1;
          while (1)
          {
            int v13 = *(unsigned __int8 *)v12;
            if (v13 == 32) {
              goto LABEL_13;
            }
            if (!*v12 || v13 == 41)
            {
              lastExceptionBacktrace = self->_lastExceptionBacktrace;
              self->_lastExceptionBacktrace = v11;

              break;
            }
            uint64_t v21 = 0;
            int v20 = 0;
            if (!sscanf(v12, "0x%llx%n", &v21, &v20))
            {
LABEL_13:
              ++v12;
            }
            else
            {
              v12 += v20;
              uint64_t v14 = v21;
              v16[0] = _NSConcreteStackBlock;
              v16[1] = 3221225472;
              v16[2] = sub_1000082D4;
              v16[3] = &unk_100034F18;
              unint64_t v17 = v11;
              uint64_t v18 = self;
              uint64_t v19 = v21;
              -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:](self, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:", v14, v14, var0, var1, v7, v16);
            }
          }
        }
        free(v9);
      }
    }
  }
}

- (void)_extractExceptionReasonUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  uint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  uint64_t v7 = v6;
  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolOwnerGetSymbolWithName();
    if ((CSIsNull() & 1) == 0)
    {
      vm_map_read_t task = self->_task;
      vm_address_t Range = CSSymbolGetRange();
      size_t v10 = sub_100008854(task, Range, 0x400uLL);
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = +[NSData dataWithBytes:v10 length:1024];
        free(v11);
        bzero(v43, 0x400uLL);
        int v13 = +[NSData dataWithBytes:v43 length:1024];
        unsigned __int8 v14 = [v12 isEqualToData:v13];

        if ((v14 & 1) == 0)
        {
          id v15 = [objc_alloc((Class)VMUVMRegionIdentifier) initWithTask:self->_task pid:self->_proc_id options:1];
          id v16 = [v15 regions];
          id v17 = objc_alloc_init((Class)OSAOsLogPackParser);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100008998;
          v40[3] = &unk_100034F40;
          v40[4] = self;
          [v17 setPointerPointsToImmutableMemory:v40];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000089A4;
          v38[3] = &unk_100034F68;
          v38[4] = self;
          id v18 = v16;
          id v39 = v18;
          [v17 setModulePathForImmutableMemoryPointer:v38];
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1000089FC;
          v37[3] = &unk_100034F90;
          v37[4] = self;
          [v17 setReadCStringFromTarget:v37];
          uint64_t v19 = [v17 parse:v12];
          if ([v19 count])
          {
            int v20 = [v17 formatString];

            if (v20)
            {
              uint64_t v21 = +[NSSet setWithArray:&off_10003D4F8];
              size_t v22 = [v17 formatStringOriginatingModulePath];

              if (v22)
              {
                uint64_t v36 = v21;
                id v23 = [v17 formatStringOriginatingModulePath];
                unsigned int v24 = [v23 hasPrefix:@"/System/"];

                if (v24)
                {
                  unsigned int v25 = [v17 formatStringOriginatingModulePath];
                  size_t v26 = [v25 lastPathComponent];

                  uint64_t v21 = v36;
                  if ([v36 containsObject:v26])
                  {
                    uint64_t v27 = [v17 filterOutSensitiveStrings:v19];

                    v41[0] = @"composed_message";
                    uint64_t v34 = (void *)v27;
                    uint64_t v35 = [v17 compose:v27];
                    v42[0] = v35;
                    v41[1] = @"format_string";
                    uint64_t v33 = [v17 formatString];
                    v42[1] = v33;
                    v41[2] = @"arguments";
                    int v28 = [v17 extractArguments:v27];
                    v42[2] = v28;
                    v42[3] = @"objc-exception";
                    v41[3] = @"type";
                    v41[4] = @"class";
                    int v29 = -[OSACrashReport _readIndirectImmutableStringFromSymbol:symbolOwner:](self, "_readIndirectImmutableStringFromSymbol:symbolOwner:", "__last_exception_class_name__", SymbolOwnerWithNameAtTime, v7);
                    v42[4] = v29;
                    v41[5] = @"name";
                    unsigned int v30 = -[OSACrashReport _readIndirectImmutableStringFromSymbol:symbolOwner:](self, "_readIndirectImmutableStringFromSymbol:symbolOwner:", "__last_exception_name__", SymbolOwnerWithNameAtTime, v7);
                    v42[5] = v30;
                    BOOL v31 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:6];
                    exceptionReasonDetails = self->_exceptionReasonDetails;
                    self->_exceptionReasonDetails = v31;

                    uint64_t v21 = v36;
                    uint64_t v19 = v34;
                  }
                }
                else
                {
                  uint64_t v21 = v36;
                }
              }
            }
          }
        }
      }
    }
  }
}

- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atSymbol:(_CSTypeRef)a4
{
  return 0;
}

- (unint64_t)_readAddressFromMemory:(mapped_memory_t *)a3 atAddress:(unint64_t)a4
{
  return 0;
}

- (id)_readStringAtTaskAddress:(unint64_t)a3 maxLength:(unint64_t)a4 immutableCheck:(BOOL *)a5
{
  CFStringRef v5 = [(OSACrashReport *)self _copyStringFromTask:self->_task atAddress:a3 maxLength:a4 immutableCheck:a5];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = +[NSString stringWithUTF8String:v5];
    free(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_readIndirectImmutableStringFromSymbol:(const char *)a3 symbolOwner:(_CSTypeRef)a4
{
  CSSymbolOwnerGetSymbolWithName();
  if ((CSIsNull() & 1) != 0
    || (task = self->_task, Range = CSSymbolGetRange(), (uint64_t v7 = sub_100008854(task, Range, 8uLL)) == 0))
  {
    size_t v10 = @"<not available>";
  }
  else
  {
    CFStringRef v8 = v7;
    char v12 = 0;
    uint64_t v9 = [(OSACrashReport *)self _readStringAtTaskAddress:*v7 maxLength:0 immutableCheck:&v12];
    size_t v10 = v9;
    if (!v12)
    {

      size_t v10 = @"<redacted>";
    }
    free(v8);
  }

  return v10;
}

- (char)_copyStringFromTask:(unsigned int)a3 atAddress:(unint64_t)a4 maxLength:(unint64_t)a5 immutableCheck:(BOOL *)a6
{
  id v9 = [(OSACrashReport *)self _regionAtAddress:a4 immutableCheck:a6];
  unint64_t v11 = 2 * vm_page_size;
  if (a5) {
    unint64_t v11 = a5;
  }
  if (v11 + a4 <= (unint64_t)v9 + v10) {
    vm_size_t v12 = v11;
  }
  else {
    vm_size_t v12 = (vm_size_t)v9 + v10 - a4;
  }

  return (char *)sub_100008854(a3, a4, v12);
}

- (int)_regionInfoAtAddress:(unint64_t)a3 regionInfo:(vm_region_submap_short_info_64 *)a4 regionAddress:(unint64_t *)a5 regionSize:(unint64_t *)a6
{
  natural_t nesting_depth = 999999;
  mach_vm_address_t v24 = a3;
  if (a5)
  {
    if (a6)
    {
      mach_msg_type_number_t infoCnt = 12;
      int result = mach_vm_region_recurse(self->_task, &v24, a6, &nesting_depth, &a4->protection, &infoCnt);
      *a5 = v24;
      return result;
    }
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_100023D1C(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_100023CE0(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  return 1;
}

- (_VMURange)_regionAtAddress:(unint64_t)a3 immutableCheck:(BOOL *)a4
{
  memset(v12, 0, sizeof(v12));
  unint64_t v10 = 0;
  unint64_t v11 = a3;
  if ([(OSACrashReport *)self _regionInfoAtAddress:a3 regionInfo:v12 regionAddress:&v11 regionSize:&v10]|| (v12[0] & 1) == 0)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
  }
  if (a4)
  {
    BOOL v7 = 0;
    if ((BYTE4(v12[0]) & 2) == 0)
    {
      unint64_t sharedCacheBase = self->_sharedCacheBase;
      if (v11 >= sharedCacheBase && v10 + v11 <= self->_sharedCacheSize + sharedCacheBase) {
        BOOL v7 = 1;
      }
    }
    *a4 = v7;
  }
  unint64_t v9 = v10;
  unint64_t v8 = v11;
  result.unint64_t var1 = v9;
  result.unint64_t var0 = v8;
  return result;
}

- (BOOL)_isMemoryImmutableAtAddress:(unint64_t)a3
{
  BOOL v4 = 0;
  [(OSACrashReport *)self _regionAtAddress:a3 immutableCheck:&v4];
  return v4;
}

- (id)_readDataAtAddress:(unint64_t)a3 size:(unint64_t)a4
{
  BOOL is64Bit = self->_is64Bit;
  unint64_t v8 = +[NSMutableData dataWithCapacity:a4];
  if (v8)
  {
    if (!is64Bit) {
      a3 = a3;
    }
    for (unint64_t i = a3 + a4; a3 < i; a3 += v13)
    {
      unint64_t v10 = (char *)[(OSACrashReport *)self _regionAtAddress:a3 immutableCheck:0];
      if (!v10) {
        break;
      }
      uint64_t v12 = &v10[v11];
      if (i < (unint64_t)&v10[v11]) {
        uint64_t v12 = (char *)i;
      }
      unint64_t v13 = (unint64_t)&v12[-a3] >= a4 ? a4 : (unint64_t)&v12[-a3];
      data[0] = 0;
      mach_msg_type_number_t dataCnt = 0;
      if (vm_read(self->_task, a3, (vm_size_t)&v12[-a3], data, &dataCnt)) {
        break;
      }
      uint64_t v14 = +[NSData dataWithBytes:data[0] length:dataCnt];
      vm_deallocate(mach_task_self_, data[0], dataCnt);
      if (!v14) {
        break;
      }
      [v8 appendData:v14];
    }
  }
  if ([v8 length]) {
    uint64_t v15 = v8;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (void)_addASILine:(id)a3 fromOwner:(id)a4 isSafe:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    [(NSMutableDictionary *)self->_applicationSpecificInfoFullSensitive addLines:v8 fromOwner:v9];
    if (v5
      || (+[OSASystemConfiguration sharedInstance],
          unint64_t v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 appleInternal],
          v10,
          v11))
    {
      [(NSMutableDictionary *)self->_applicationSpecificInfo addLines:v8 fromOwner:v9];
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v12 = @"sensitive";
      int v13 = 138543874;
      id v14 = v9;
      if (v5) {
        CFStringRef v12 = @"safe";
      }
      __int16 v15 = 2112;
      CFStringRef v16 = v12;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ASI found [%{public}@] (%@) '%{public}@'", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)_extractInfoPlistFromSymbolOwner:(_CSTypeRef)a3
{
  uint64_t Name = CSSymbolOwnerGetName();
  if (Name)
  {
    uint64_t v5 = Name;
    uint64_t v6 = [(OSACrashReport *)self procName];
    BOOL v7 = +[NSString stringWithUTF8String:v5];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      CSSymbolOwnerGetSectionWithName();
      uint64_t Range = CSRegionGetRange();
      unsigned int v11 = [(OSACrashReport *)self _readDataAtAddress:Range size:v10];
      if (v11)
      {
        id v23 = 0;
        CFStringRef v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v23];
        id v13 = v23;
        if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100023D94();
        }
      }
      else
      {
        BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v14) {
          sub_100023D58(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        CFStringRef v12 = 0;
      }
      info_plist = self->_info_plist;
      self->_info_plist = v12;
    }
  }
}

- (void)_extractCrashReporterAnnotationsFromSymbolOwner:(_CSTypeRef)a3 withMemory:(mapped_memory_t *)a4
{
  if (qword_100042FF0 != -1) {
    dispatch_once(&qword_100042FF0, &stru_100034FB0);
  }
  CSSymbolOwnerForeachSection();
}

- (void)_extractBinaryImageInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  id v5 = a4;
  self->_sharedCacheAddress = CSSymbolicatorGetSharedCacheBaseAddress();
  BOOL v7 = +[NSMutableArray array];
  taskImages = self->_taskImages;
  self->_taskImages = v7;

  id v9 = +[NSMutableArray array];
  mapped_memory_cache_for_vm_map_read_t task = create_mapped_memory_cache_for_task();
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_10000996C;
  mach_vm_address_t v24 = &unk_100035028;
  unsigned int v25 = self;
  id v26 = v9;
  uint64_t v27 = mapped_memory_cache_for_task;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  [(NSMutableArray *)self->_taskImages sortByAddressAndSetInferredSizes];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v26;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(v5, "searchFrame:in:result:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v15), "unsignedLongLongValue", (void)v17), self->_taskImages, 0);
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v13);
  }

  if (mapped_memory_cache_for_task) {
    destroy_mapped_memory_cache();
  }
}

- (unint64_t)_objcSelectorAddressForMessenger:(id)a3 memory:(mapped_memory_t *)a4
{
  id v6 = a3;
  id v7 = [v6 rangeOfString:@"stret"];
  id v8 = [v6 rangeOfString:@"fixup"];
  id v9 = [v6 rangeOfString:@"vtable"];

  if (self->_threadStateFlavor != 1 || self->_threadState[0] != 6) {
    return 0;
  }
  if (!self->_isTranslated || self->_cpuType != 16777223) {
    return *(void *)&self->_threadState[4];
  }
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      return *(void *)&self->_threadState[14];
    }
    else {
      return *(void *)&self->_threadState[6];
    }
  }
  else
  {
    uint64_t v11 = *(void *)&self->_threadState[14] + 8;
    return [(OSACrashReport *)self _readAddressFromMemory:a4 atAddress:v11];
  }
}

- (id)_objcSelectorNameForMessenger:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(OSACrashReport *)self _objcSelectorAddressForMessenger:v4 memory:create_mapped_memory_cache_for_task()];
  if (v5)
  {
    if (self->_is64Bit) {
      uint64_t v6 = -86000;
    }
    else {
      uint64_t v6 = 4294881296;
    }
    if (v5 == v6)
    {
      id v7 = @"_ignoredSelector";
    }
    else
    {
      id v7 = [(OSACrashReport *)self _readStringAtTaskAddress:v5 maxLength:0 immutableCheck:0];
    }
  }
  else
  {
    id v7 = 0;
  }
  destroy_mapped_memory_cache();

  return v7;
}

- (void)symbolicateFrame:(unint64_t)a3 adjusted:(unint64_t)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6 andBlock:(id)a7
{
  id v42 = a6;
  id v9 = (void (**)(id, void *, void *, id))a7;
  uint64_t v10 = objc_opt_new();
  if (dword_100042FC8)
  {
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    v49 = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472;
    long long v51 = sub_10000A2E4;
    long long v52 = &unk_100035050;
    unint64_t v54 = a3;
    id v53 = v10;
    CSSymbolOwnerForEachStackFrameAtAddress();
  }
  if ([v10 count])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v11 = [v10 reverseObjectEnumerator];
    id v12 = [v11 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v40 = v10;
      id v14 = 0;
      uint64_t v15 = *(void *)v46;
      do
      {
        id v16 = v11;
        long long v17 = 0;
        long long v18 = v14;
        do
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v16);
          }
          long long v19 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v17);
          long long v20 = [v19 objectAtIndexedSubscript:0];
          id v21 = [v20 unsignedLongLongValue];

          taskImages = self->_taskImages;
          id v44 = v18;
          id v23 = [v42 searchFrame:v21 in:taskImages regions:0 result:&v44];
          id v14 = v44;

          mach_vm_address_t v24 = 0;
          if ((unint64_t)[v19 count] >= 2)
          {
            mach_vm_address_t v24 = [v19 objectAtIndexedSubscript:1];
          }
          v9[2](v9, v23, v24, v14);

          long long v17 = (char *)v17 + 1;
          long long v18 = v14;
        }
        while (v13 != v17);
        uint64_t v11 = v16;
        id v13 = [v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v13);
      uint64_t v10 = v40;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    unsigned int v25 = self->_taskImages;
    rosettaRegions = self->_rosettaRegions;
    id v43 = 0;
    uint64_t v11 = [v42 searchFrame:a3 in:v25 regions:rosettaRegions result:&v43];
    id v27 = v43;
    id v14 = v27;
    int v28 = 0;
    if (self->_isTranslated && v27 != 0)
    {
      unsigned int v30 = [v27 symbolInfo];
      int is_null = uuid_is_null(&v30[OBJC_IVAR___OSASymbolInfo__uuid]);

      if (is_null)
      {
        unsigned int v32 = v11;
        int v28 = objc_opt_new();
        if (self->_isTranslated)
        {
          uint64_t v33 = [v14 symbolInfo];
          uint64_t v34 = [v33 cpuArch];
          unsigned int v35 = [v34 hasPrefix:@"arm"];

          if (v35)
          {
            uint64_t v36 = [v14 symbolInfo];
            uint64_t v37 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3 - (void)[v36 start]);
            [v28 setObject:v37 forKeyedSubscript:@"symbolLocation"];
          }
        }
        id v38 = [v14 symbolInfo];
        id v39 = [v38 name];
        [v28 setObject:v39 forKeyedSubscript:@"region"];

        uint64_t v11 = v32;
      }
      else
      {
        int v28 = 0;
      }
    }
    v9[2](v9, v11, v28, v14);
  }
}

- (id)composeFrame:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [v6 objectAtIndexedSubscript:0];
  [v7 setObject:v8 forKeyedSubscript:@"imageIndex"];

  id v9 = [v6 objectAtIndexedSubscript:1];

  [v7 setObject:v9 forKeyedSubscript:@"imageOffset"];
  if ([v5 count]) {
    [v7 addEntriesFromDictionary:v5];
  }

  return v7;
}

- (unsigned)_extractBacktraceInfoUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v63 = a4;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  int v82 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_10000AEB8;
  v77[3] = &unk_100035078;
  v77[4] = v78;
  unint64_t v61 = var0;
  unint64_t v62 = var1;
  -[OSACrashReport _extractRosettaRuntimeInfo:withBlock:](self, "_extractRosettaRuntimeInfo:withBlock:", var0, var1, v77);
  if (!self->_isTranslated) {
    goto LABEL_11;
  }
  int cpuType = self->_cpuType;
  if (cpuType == 16777228)
  {
    uint64_t v9 = 736;
  }
  else
  {
    if (cpuType != 16777223 || &kThreadContextExceptionPairOffset == 0) {
      goto LABEL_11;
    }
    uint64_t v9 = kThreadContextExceptionPairOffset;
  }
  uint64_t v10 = (unint64_t *)sub_100008854(self->_task, (*(void *)&self->_threadState[38] & 0x7FFFFFFFFFFFFFFFLL) + v9, 0x10uLL);
  if (v10)
  {
    self->_translatedPC = *v10;
    self->_unint64_t x86RIP = v10[1];
    free(v10);
  }
LABEL_11:
  id v12 = [objc_alloc((Class)VMUSampler) initWithPID:self->_proc_id task:self->_task processName:self->_procName is64Bit:self->_is64Bit options:1];
  context = v11;
  id v13 = [v12 sampleAllThreadsOnce];
  if (![v13 count]) {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"[VMUSampler sampleAllThreadsOfTask:withSymbolicator] returned no stacks"];
  }
  id v14 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
  threadInfos = self->_threadInfos;
  self->_threadInfos = v14;

  unint64_t v16 = 0;
  unsigned int v55 = 0;
  unint64_t v53 = -1;
  id v54 = 0;
  v56 = v13;
  id v57 = v12;
  while ((unint64_t)[v13 count] > v16)
  {
    v60 = objc_opt_new();
    long long v17 = [v13 objectAtIndexedSubscript:v16];
    id v18 = [v17 thread];
    *(void *)thread_info_out = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    mach_msg_type_number_t thread_info_outCnt = 6;
    if (thread_info((thread_inspect_t)v18, 4u, thread_info_out, &thread_info_outCnt)) {
      uint64_t v19 = -1;
    }
    else {
      uint64_t v19 = *(void *)thread_info_out;
    }
    if (v19 != -1)
    {
      long long v20 = +[NSNumber numberWithUnsignedLongLong:v19];
      [v60 setObject:v20 forKeyedSubscript:@"id"];

      exclaveContainer = self->_exclaveContainer;
      if (exclaveContainer)
      {
        uint64_t v22 = [(OSAExclaveContainer *)exclaveContainer threadIdToScId];
        id v23 = +[NSNumber numberWithUnsignedLongLong:v19];
        mach_vm_address_t v24 = [v22 objectForKeyedSubscript:v23];

        if (v24)
        {
          exclaveThreadNumbers = self->_exclaveThreadNumbers;
          if (!exclaveThreadNumbers)
          {
            id v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
            id v27 = self->_exclaveThreadNumbers;
            self->_exclaveThreadNumbers = v26;

            exclaveThreadNumbers = self->_exclaveThreadNumbers;
          }
          int v28 = +[NSNumber numberWithInt:v16];
          [(NSMutableArray *)exclaveThreadNumbers addObject:v28];
        }
      }
    }
    if (self->_crashedThreadNumber < 0)
    {
      if ([v17 backtraceLength] > v55)
      {
        unsigned int v55 = [v17 backtraceLength];
        self->_highlightedThreadNumber = v16;
        unint64_t v53 = v19;
        id v54 = v18;
      }
      unint64_t threadId = self->_threadId;
      if (threadId != -1 && v19 == threadId || threadId == -1 && v18 == self->_threadPortOriginal)
      {
        threadPortPedigree = self->_threadPortPedigree;
        BOOL v31 = +[NSString stringWithFormat:@"thread match 0x%x ID(0x%llX)", v18, threadId];
        [(NSMutableArray *)threadPortPedigree addObject:v31];

        self->_crashedThreadNumber = v16;
        *((_DWORD *)v80 + 6) = v18;
        self->_highlightedThreadNumber = -1;
      }
    }
    unsigned int v32 = [v12 threadNameForThread:v18];
    if ([v32 length])
    {
      uint64_t v33 = [v32 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

      uint64_t v34 = OSASanitizePath();
      [v60 setObject:v34 forKeyedSubscript:@"name"];
    }
    else
    {
      uint64_t v33 = (uint64_t)v32;
    }
    int v59 = objc_msgSend(v12, "dispatchQueueNameForSerialNumber:", objc_msgSend(v17, "dispatchQueueSerialNumber"));
    if ([v59 length])
    {
      unsigned int v35 = OSASanitizePath();
      [v60 setObject:v35 forKeyedSubscript:@"queue"];
    }
    id v58 = (void *)v33;
    uint64_t v36 = [v17 backtrace];
    uint64_t v37 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v17 backtraceLength]);
    for (unint64_t i = 0; i < [v17 backtraceLength]; ++i)
    {
      unint64_t x86RIP = v36[i];
      if (self->_isTranslated && x86RIP == self->_translatedPC) {
        unint64_t x86RIP = self->_x86RIP;
      }
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      if (i) {
        BOOL v40 = x86RIP == 0;
      }
      else {
        BOOL v40 = 1;
      }
      uint64_t v41 = !v40;
      v64[2] = sub_10000AF18;
      v64[3] = &unk_1000350A0;
      unint64_t v42 = x86RIP - v41;
      int v70 = i;
      int v71 = v16;
      int v72 = (int)v18;
      v64[4] = self;
      long long v66 = &v79;
      long long v67 = v78;
      uint64_t v68 = v19;
      unint64_t v69 = x86RIP;
      id v65 = v37;
      -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:](self, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:", x86RIP, v42, v61, v62, v63, v64);
    }
    [v60 setObject:v37 forKeyedSubscript:@"frames"];
    id v43 = -[OSACrashReport decode_threadState:withSymbolicator:usingCatalog:](self, "decode_threadState:withSymbolicator:usingCatalog:", v18, v61, v62, v63);
    [v60 setObject:v43 forKeyedSubscript:@"threadState"];

    [(NSMutableArray *)self->_threadInfos addObject:v60];
    ++v16;
    id v13 = v56;
    id v12 = v57;
  }
  mach_port_name_t v44 = *((_DWORD *)v80 + 6);
  if (v44) {
    goto LABEL_52;
  }
  long long v45 = self->_threadPortPedigree;
  long long v46 = +[NSString stringWithFormat:@"override via deepest 0x%x ID(0x%llX)", v54, v53];
  [(NSMutableArray *)v45 addObject:v46];

  self->_unint64_t threadId = v53;
  *((_DWORD *)v80 + 6) = v54;
  mach_port_name_t v44 = v54;
  if (v54)
  {
LABEL_52:
    uint64_t v47 = mach_port_mod_refs(mach_task_self_, v44, 0, 1);
    long long v48 = self->_threadPortPedigree;
    v49 = +[NSString stringWithFormat:@"port retain 0x%x result 0x%x (%s)", *((unsigned int *)v80 + 6), v47, mach_error_string(v47)];
    [(NSMutableArray *)v48 addObject:v49];
  }
  unsigned int v50 = *((_DWORD *)v80 + 6);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(&v79, 8);

  return v50;
}

- (id)_findContainingRegion:(id)a3 address:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_10000B35C;
  v9[3] = &unk_1000350C0;
  v9[4] = a4;
  id v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

- (id)_findContainingTextSegmentRegion:(id)a3 address:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_10000B458;
  v9[3] = &unk_1000350C0;
  v9[4] = a4;
  id v6 = [v5 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

- (id)_readMallocZoneArrayFromMemory:(mapped_memory_t *)a3 usingSymbolicator:(_CSTypeRef)a4
{
  SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime();
  uint64_t v8 = v7;
  CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime();
  if (((CSIsNull() & 1) != 0 || CSIsNull())
    && ((SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime(),
         uint64_t v8 = v9,
         CSSymbolicatorGetSymbolWithNameAtTime(),
         (CSIsNull() & 1) != 0)
     || CSIsNull()))
  {
    uint64_t v10 = +[NSData data];
  }
  else
  {
    id v11 = [(OSACrashReport *)self _readDataAtAddress:CSSymbolGetRange() size:4];
    uint64_t v10 = -[OSACrashReport _readDataAtAddress:size:](self, "_readDataAtAddress:size:", -[OSACrashReport _readAddressFromMemory:atSymbol:](self, "_readAddressFromMemory:atSymbol:", a3, SymbolWithNameFromSymbolOwnerWithNameAtTime, v8), 8 * *(int *)[v11 bytes]);
  }

  return v10;
}

- (id)_readMallocZoneArray:(_CSTypeRef)a3
{
  BOOL v3 = -[OSACrashReport _readMallocZoneArrayFromMemory:usingSymbolicator:](self, "_readMallocZoneArrayFromMemory:usingSymbolicator:", create_mapped_memory_cache_for_task(), a3.var0, a3.var1);
  destroy_mapped_memory_cache();

  return v3;
}

- (unint64_t)_findMallocZone:(id)a3 usingSymbolicator:(_CSTypeRef)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v7 = a3;
  mapped_memory_cache_for_vm_map_read_t task = create_mapped_memory_cache_for_task();
  -[OSACrashReport _readMallocZoneArrayFromMemory:usingSymbolicator:](self, "_readMallocZoneArrayFromMemory:usingSymbolicator:", mapped_memory_cache_for_task, var0, var1);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (unint64_t *)[v9 bytes];
  unint64_t v11 = (unint64_t)[v9 length];
  if (v11 < 8)
  {
LABEL_5:
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v12 = v11 >> 3;
    while (1)
    {
      unint64_t v13 = *v10;
      id v14 = [(OSACrashReport *)self _readStringAtTaskAddress:[(OSACrashReport *)self _readAddressFromMemory:mapped_memory_cache_for_task atAddress:*v10 + 72] maxLength:1024 immutableCheck:0];
      unsigned int v15 = [v14 isEqualToString:v7];

      if (v15) {
        break;
      }
      ++v10;
      if (!--v12) {
        goto LABEL_5;
      }
    }
  }
  destroy_mapped_memory_cache();

  return v13;
}

- (id)_extractMallocTraceInfo:(id *)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v9 = a5;
  uint64_t v19 = +[NSMutableArray arrayWithCapacity:a3->var2];
  if (a3->var2)
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = v9;
      unint64_t v12 = a3->var3[v10];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000BA0C;
      v21[3] = &unk_1000350E8;
      id v22 = v19;
      id v23 = self;
      unint64_t v13 = v12;
      unint64_t v14 = v12;
      id v9 = v11;
      -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:](self, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:", v13, v14, var0, var1, v11, v21);

      ++v10;
    }
    while (v10 < a3->var2);
  }
  v24[0] = @"id";
  unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3->var0, v19);
  v25[0] = v15;
  v24[1] = @"time";
  unint64_t v16 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
  v24[2] = @"frames";
  v25[1] = v16;
  v25[2] = v20;
  long long v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

  return v17;
}

- (BOOL)_isPGMCrashType
{
  return self->_exceptionType == 1 && self->_signal == 10;
}

- (void)_extractPGMReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  id v8 = [objc_alloc((Class)VMUVMRegionIdentifier) initWithTask:self->_task pid:self->_proc_id options:1];
  id v9 = [v8 regions];
  uint64_t v10 = [(OSACrashReport *)self _findContainingRegion:v9 address:self->_exceptionCode[1]];
  id v11 = (void *)v10;
  if (v10 && *(_DWORD *)(v10 + OBJC_IVAR___VMUVMRegion_user_tag) == 13)
  {
    id v23 = v7;
    -[OSACrashReport _readMallocZoneArray:](self, "_readMallocZoneArray:", var0, var1);
    id v12 = objc_claimAutoreleasedReturnValue();
    [v12 bytes];
    unsigned int v25 = v12;
    [v12 length];
    memset(v26, 0, 464);
    if (pgm_extract_report_from_corpse())
    {
      probGuardReport = (__CFString *)self->_probGuardReport;
      self->_probGuardReport = (NSDictionary *)&off_10003CEE0;
      id v7 = v23;
    }
    else
    {
      if (LODWORD(v26[0]))
      {
        id v7 = v23;
        -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", (char *)v26 + 8, var0, var1, v23);
        probGuardReport = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (LODWORD(v26[0]) < 2)
        {
          CFStringRef v14 = @"<unavailable>";
        }
        else
        {
          -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", &v27, var0, var1, v23);
          CFStringRef v14 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        probGuardReport = @"<unavailable>";
        CFStringRef v14 = @"<unavailable>";
        id v7 = v23;
      }
      mach_vm_address_t v24 = (__CFString *)v14;
      v28[0] = @"allocationTrace";
      v28[1] = @"deallocationTrace";
      v29[0] = probGuardReport;
      v29[1] = v14;
      v28[2] = @"errorType";
      id v22 = +[NSString stringWithUTF8String:0];
      v29[2] = v22;
      v28[3] = @"confidence";
      id v21 = +[NSString stringWithUTF8String:0];
      v29[3] = v21;
      v28[4] = @"faultAddress";
      long long v20 = +[NSNumber numberWithUnsignedLong:0];
      v29[4] = v20;
      v28[5] = @"nearestAllocation";
      unsigned int v15 = +[NSNumber numberWithUnsignedLong:0];
      v29[5] = v15;
      v28[6] = @"allocationSize";
      unint64_t v16 = +[NSNumber numberWithUnsignedLong:0];
      v29[6] = v16;
      v28[7] = @"allocationState";
      long long v17 = +[NSString stringWithUTF8String:0];
      v29[7] = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:8];
      uint64_t v19 = self->_probGuardReport;
      self->_probGuardReport = v18;
    }
  }
}

- (void)_extractPGMLibpasReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  mapped_memory_cache_for_vm_map_read_t task = create_mapped_memory_cache_for_task();
  SymbolWithNameFromuint64_t SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime();
  if (!-[OSACrashReport _readAddressFromMemory:atSymbol:](self, "_readAddressFromMemory:atSymbol:", mapped_memory_cache_for_task, SymbolWithNameFromSymbolOwnerWithNameAtTime, v7))
  {
LABEL_4:
    destroy_mapped_memory_cache();
    return;
  }
  if (!&_PASReportCrashExtractResults)
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Could not locate PASReportCrashExtractResults in JavaScriptCore."];
    goto LABEL_4;
  }
  if (PASReportCrashExtractResults())
  {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Extracting libpas PGM metadata failed."];
  }
  else
  {
    v14[0] = @"allocationTrace";
    v14[1] = @"deallocationTrace";
    v15[0] = @"<unknown>";
    v15[1] = @"<unknown>";
    v14[2] = @"errorType";
    id v8 = +[NSString stringWithUTF8String:0];
    v15[2] = v8;
    v14[3] = @"confidence";
    id v9 = +[NSString stringWithUTF8String:0];
    v15[3] = v9;
    v14[4] = @"faultAddress";
    uint64_t v10 = +[NSNumber numberWithUnsignedLong:0];
    v15[4] = v10;
    v15[5] = &off_10003D048;
    v14[5] = @"nearestAllocation";
    v14[6] = @"allocationSize";
    id v11 = +[NSNumber numberWithUnsignedLong:0];
    v14[7] = @"allocationState";
    v15[6] = v11;
    v15[7] = @"unknown";
    id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
    probGuardReport = self->_probGuardReport;
    self->_probGuardReport = v12;
  }
  destroy_mapped_memory_cache();
}

- (BOOL)_isMTECrash
{
  return (self->_exceptionType & 1) != 0 && (unint64_t)(*self->_exceptionCode - 262) < 3;
}

- (void)_extractMemoryErrorReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if ([(OSACrashReport *)self _isMTECrash])
  {
    CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) == 0)
    {
      CSSymbolGetRange();
      memset(v22, 0, 480);
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = sanitizers_diagnose_memory_error();
      if (v8)
      {
        CFStringRef v28 = @"error";
        id v9 = +[NSString stringWithUTF8String:v8];
        int v29 = v9;
        uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        memoryErrorReport = (__CFString *)self->_memoryErrorReport;
        self->_memoryErrorReport = v10;
      }
      else
      {
        id v9 = -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", (char *)v22 + 8, var0, var1, v7);
        if (LOBYTE(v22[0]))
        {
          -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", &v23, var0, var1, v7);
          memoryErrorReport = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          memoryErrorReport = @"<unavailable>";
        }
        v26[0] = @"errorType";
        uint64_t v19 = +[NSString stringWithUTF8String:(void)v20];
        v27[0] = v19;
        v26[1] = @"faultAddress";
        id v12 = +[NSNumber numberWithUnsignedLong:*((void *)&v20 + 1)];
        v27[1] = v12;
        v26[2] = @"blamedAllocation";
        v24[0] = @"address";
        unint64_t v13 = +[NSNumber numberWithUnsignedLong:(void)v21];
        v25[0] = v13;
        v24[1] = @"size";
        CFStringRef v14 = +[NSNumber numberWithUnsignedLong:*((void *)&v21 + 1)];
        v25[1] = v14;
        v24[2] = @"isFreed";
        unsigned int v15 = +[NSNumber numberWithBool:LOBYTE(v22[0])];
        v25[2] = v15;
        void v25[3] = v9;
        void v24[3] = @"allocationTrace";
        v24[4] = @"deallocationTrace";
        v25[4] = memoryErrorReport;
        unint64_t v16 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
        v27[2] = v16;
        long long v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
        id v18 = self->_memoryErrorReport;
        self->_memoryErrorReport = v17;
      }
    }
  }
}

- (void)_extractSanitizerReportUsingSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if (*self->_exceptionCode == 63470
    && [(OSACrashReport *)self _findMallocZone:@"SanitizerMallocZone", var0, var1 usingSymbolicator])
  {
    memset(v15, 0, 496);
    if (sanitizer_diagnose_fault_from_crash_reporter())
    {
      [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"sanitizer_diagnose_fault_from_crash_reporter() failed.  This should never happen!"];
    }
    else
    {
      uint64_t v8 = -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", (char *)v15 + 8, var0, var1, v7);
      id v9 = -[OSACrashReport _extractMallocTraceInfo:withSymbolicator:usingCatalog:](self, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:", &v16, var0, var1, v7);
      v17[0] = @"allocationTrace";
      v17[1] = @"deallocationTrace";
      v18[0] = v8;
      v18[1] = v9;
      v17[2] = @"faultAddress";
      uint64_t v10 = +[NSNumber numberWithUnsignedLong:0];
      v18[2] = v10;
      v17[3] = @"nearestAllocation";
      id v11 = +[NSNumber numberWithUnsignedLong:0];
      v18[3] = v11;
      v17[4] = @"allocationSize";
      id v12 = +[NSNumber numberWithUnsignedLong:*(void *)&v15[0]];
      v18[4] = v12;
      unint64_t v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
      sanitizerReport = self->_sanitizerReport;
      self->_sanitizerReport = v13;
    }
  }
}

- (void)setApplicationSpecificInformation:(const char *)a3
{
  if (a3)
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(OSACrashReport *)self _addASILine:v4 fromOwner:@"internal" isSafe:1];
  }
}

+ (id)parentBundleURLForAppExtensionBundleURL:(id)a3 error:(id)a4
{
  id v10 = a4;
  id v4 = a3;
  id v5 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithURL:v4 error:&v10];

  id v6 = [v5 containingBundleRecord];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 URL];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)loadStoreInfo:(id)a3 atURL:(id)a4 forPlatform:(unsigned int)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_opt_new();
  id v10 = [v8 pathExtension];
  unsigned int v11 = [v10 isEqualToString:@"appex"];

  if (v11)
  {
    id v12 = [(id)objc_opt_class() parentBundleURLForAppExtensionBundleURL:v8 error:0];
    unint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;

      id v8 = v14;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100023E10();
    }
  }
  id v45 = 0;
  id v15 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v8 allowPlaceholder:1 error:&v45];
  id v16 = v45;
  BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v47 = a5;
      *(_WORD *)&v47[4] = 2114;
      *(void *)&v47[6] = v7;
      *(_WORD *)&v47[14] = 2114;
      *(void *)&v47[16] = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "loadStoreInfo [platform %d] %{public}@ from %{public}@", buf, 0x1Cu);
    }
    id v18 = [v15 iTunesMetadata];
    id v19 = [v18 storeItemIdentifier];

    if (v19)
    {
      long long v20 = +[NSNumber numberWithUnsignedLongLong:v19];
      long long v21 = [v20 stringValue];
      [v9 setObject:v21 forKeyedSubscript:@"itemID"];
    }
    id v22 = [v15 deviceIdentifierForVendor];
    uint64_t v23 = [v22 UUIDString];

    if (v23) {
      [v9 setObject:v23 forKeyedSubscript:@"deviceIdentifierForVendor"];
    }
    mach_vm_address_t v24 = [v15 iTunesMetadata];
    id v44 = v16;
    unsigned int v25 = [v24 storeCohortWithError:&v44];
    id v26 = v44;

    if (v25)
    {
      [v9 setObject:v25 forKeyedSubscript:@"storeCohortMetadata"];
    }
    else if (v26 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [v26 localizedDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v47 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to retrieve storeCohort: %@", buf, 0xCu);
    }
    uint64_t v27 = [v15 iTunesMetadata];
    CFStringRef v28 = [v27 variantID];

    if (v28) {
      [v9 setObject:v28 forKeyedSubscript:@"applicationVariant"];
    }
    if ([v15 developerType] != 1) {
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"thirdParty"];
    }
    if ([v15 isBeta])
    {
      [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:@"entitledBeta"];
      int v29 = [v15 iTunesMetadata];
      id v30 = [v29 betaVersionIdentifier];
    }
    else
    {
      int v29 = [v15 iTunesMetadata];
      id v30 = [v29 versionIdentifier];
    }
    id v31 = v30;

    if (v31)
    {
      unsigned int v32 = +[NSNumber numberWithUnsignedLongLong:v31];
      uint64_t v33 = [v32 stringValue];
      [v9 setObject:v33 forKeyedSubscript:@"softwareVersionExternalIdentifier"];
    }
    uint64_t v34 = [v15 iTunesMetadata];
    unsigned int v35 = [v34 distributorInfo];
    uint64_t v36 = [v35 distributorID];

    if (v36)
    {
      uint64_t v37 = +[OSASystemConfiguration sharedInstance];
      id v38 = [v37 getTaskingKey:@"disableDistributorID"];
      unsigned __int8 v39 = [v38 BOOLValue];

      if ((v39 & 1) == 0) {
        [v9 setObject:v36 forKeyedSubscript:@"distributorID"];
      }
    }
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)uint64_t v47 = v8;
      *(_WORD *)&v47[8] = 2114;
      *(void *)&v47[10] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to find store record for '%{public}@': %{public}@", buf, 0x16u);
    }
    id v26 = v16;
  }
  if ([v9 count]) {
    BOOL v40 = v9;
  }
  else {
    BOOL v40 = 0;
  }
  id v41 = v40;

  return v41;
}

+ (id)loadBuildInfo:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023F64();
  }
  id v4 = [v3 URLByAppendingPathComponent:@"Contents"];
  id v5 = [v4 URLByAppendingPathComponent:@"version.plist"];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v5];
    id v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [&off_10003D510 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(&off_10003D510);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          unint64_t v13 = [v6 objectForKeyedSubscript:v12];
          if (v13) {
            [v7 setObject:v13 forKeyedSubscript:v12];
          }
        }
        id v9 = [&off_10003D510 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100023EE0(v7);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100023E98();
    }
    id v7 = 0;
  }
  if ([v7 count]) {
    id v14 = v7;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (void)loadBundleInfo
{
  self->_is_first_party = 1;
  procPath = self->_procPath;
  if (procPath)
  {
    v43[0] = @"CFBundleIdentifier";
    v43[1] = kCFBundleVersionKey;
    v43[2] = @"CFBundleShortVersionString";
    v43[3] = @"DTAppStoreToolsBuild";
    v43[4] = @"LSUIElement";
    v43[5] = @"LSBackgroundOnly";
    v43[6] = @"CFBundlePackageType";
    id v4 = +[NSArray arrayWithObjects:v43 count:7];
    id v40 = 0;
    id v5 = +[OSACrashReport findBundleAtPath:procPath withKeys:v4 bundleURL:&v40];
    id v6 = v40;
    id v7 = v40;
    bundle_mach_timebase_info info = self->_bundle_info;
    self->_bundle_mach_timebase_info info = v5;

    id v9 = self->_bundle_info;
    if (v9)
    {
      uint64_t v10 = [(NSDictionary *)v9 objectForKeyedSubscript:@"CFBundleIdentifier"];
      CFStringRef bundle_id = self->_bundle_id;
      self->_CFStringRef bundle_id = v10;

      if (self->_bundle_id)
      {
        objc_storeStrong((id *)&self->_bundle_url, v6);
        uint64_t v12 = +[OSACrashReport loadStoreInfo:self->_bundle_id atURL:v7 forPlatform:self->_platform];
        store_mach_timebase_info info = self->_store_info;
        self->_store_mach_timebase_info info = v12;

        id v14 = [(NSDictionary *)self->_store_info objectForKeyedSubscript:@"itemID"];
        adam_id = self->_adam_id;
        self->_adam_id = v14;

        id v16 = [(NSDictionary *)self->_store_info objectForKeyedSubscript:@"thirdParty"];
        self->_is_first_party = [v16 BOOLValue] ^ 1;

        long long v17 = [(NSDictionary *)self->_store_info objectForKeyedSubscript:@"entitledBeta"];

        if (v17)
        {
          self->_is_beta = 1;
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:@"beta" forKeyedSubscript:kOSALogOptionRouting];
        }
      }
      long long v18 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:@"LSUIElement"];
      long long v19 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:@"LSBackgroundOnly"];
      long long v20 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:@"CFBundlePackageType"];
      BOOL v21 = (!v18
          || (objc_opt_respondsToSelector() & 1) == 0
          || ([(NSDictionary *)v18 BOOLValue] & 1) == 0)
         && (!v19 || (objc_opt_respondsToSelector() & 1) == 0 || ([v19 BOOLValue] & 1) == 0)
         && (!v20
          || (objc_opt_respondsToSelector() & 1) == 0
          || ([v20 isEqualToString:@"XPC!"] & 1) == 0);
      self->_bundleVisibility = v21;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSDictionary *)self->_bundle_info removeObjectsForKeys:&off_10003D528];
      }
    }
    else
    {
      if (!self->_info_plist) {
        goto LABEL_24;
      }
      id v35 = v7;
      long long v18 = (NSDictionary *)objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v41[0] = kCFBundleVersionKey;
      v41[1] = @"CFBundleShortVersionString";
      CFStringRef v28 = +[NSArray arrayWithObjects:v41 count:2];
      id v29 = [v28 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v37;
        do
        {
          for (unint64_t i = 0; i != v30; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v37 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v34 = -[NSDictionary objectForKeyedSubscript:](self->_info_plist, "objectForKeyedSubscript:", v33, v35);
            [(NSDictionary *)v18 setObject:v34 forKeyedSubscript:v33];
          }
          id v30 = [v28 countByEnumeratingWithState:&v36 objects:v42 count:16];
        }
        while (v30);
      }

      if (![(NSDictionary *)v18 count])
      {
        id v7 = v35;
        goto LABEL_23;
      }
      long long v18 = v18;
      long long v19 = self->_bundle_info;
      self->_bundle_mach_timebase_info info = v18;
      id v7 = v35;
    }

LABEL_23:
LABEL_24:
    id v22 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:@"CFBundleShortVersionString", v35];
    short_vers = self->_short_vers;
    self->_short_vers = v22;

    mach_vm_address_t v24 = [(NSDictionary *)self->_bundle_info objectForKeyedSubscript:kCFBundleVersionKey];
    bundleVersion = self->_bundleVersion;
    self->_bundleVersion = v24;

    id v26 = +[OSACrashReport loadBuildInfo:v7];
    build_mach_timebase_info info = self->_build_info;
    self->_build_mach_timebase_info info = v26;

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100023FD4();
  }
LABEL_25:
  [(OSACrashReport *)self captureLSInfo];
}

- (void)_extractVMMap:(_CSTypeRef)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v6 = [objc_alloc((Class)VMUVMRegionIdentifier) initWithTask:self->_task pid:self->_proc_id options:1];
  id v41 = self;
  if (self->_isTranslated)
  {
    id v40 = v6;
    id v7 = [v6 regions];
    id v8 = (NSMutableArray *)objc_opt_new();
    rosettaRegions = self->_rosettaRegions;
    self->_rosettaRegions = v8;

    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    uint64_t v51 = 0;
    long long v52 = &v51;
    uint64_t v53 = 0x2020000000;
    uint64_t v54 = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10000D93C;
    v50[3] = &unk_100035078;
    v50[4] = &v51;
    -[OSACrashReport _extractRosettaRuntimeInfo:withBlock:](self, "_extractRosettaRuntimeInfo:withBlock:", var0, var1, v50);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = *(void *)v47;
    while (1)
    {
      for (unint64_t i = 0; i != v11; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(char **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v15 = v52[3];
        unint64_t v16 = v15 - (void)[v14 range];
        if (v16 < v17)
        {
          uint64_t v18 = *(unsigned int *)&v14[OBJC_IVAR___VMUVMRegion_object_id];
LABEL_12:

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v19 = v10;
          id v20 = [v19 countByEnumeratingWithState:&v42 objects:v59 count:16];
          if (!v20) {
            goto LABEL_27;
          }
          uint64_t v21 = *(void *)v43;
          while (2)
          {
            uint64_t v22 = 0;
LABEL_15:
            if (*(void *)v43 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(char **)(*((void *)&v42 + 1) + 8 * v22);
            if (*(void *)&v23[OBJC_IVAR___VMUVMRegion_object_id] == v18)
            {
              mach_vm_address_t v24 = v41->_rosettaRegions;
              id v25 = [*(id *)(*((void *)&v42 + 1) + 8 * v22) range];
              [v23 range];
              [(NSMutableArray *)v24 addImageLegacy:uu address:v25 size:v26 name:"Rosetta Runtime Routines" path:0 arch:"arm64e"];
              id v27 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                id v28 = [v23 range];
                [v23 range];
                *(_DWORD *)buf = 134218240;
                id v56 = v28;
                __int16 v57 = 2048;
                uint64_t v58 = v29;
                id v30 = "cached rosetta Runtime region %p + %llu";
                goto LABEL_23;
              }
              goto LABEL_24;
            }
            if (*(_DWORD *)&v23[OBJC_IVAR___VMUVMRegion_user_tag] == 234)
            {
              uint64_t v31 = v41->_rosettaRegions;
              id v32 = [*(id *)(*((void *)&v42 + 1) + 8 * v22) range];
              [v23 range];
              [(NSMutableArray *)v31 addImageLegacy:uu address:v32 size:v33 name:"<translation info unavailable>" path:0 arch:"x86_64"];
              id v34 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
              {
                id v35 = [v23 range];
                [v23 range];
                *(_DWORD *)buf = 134218240;
                id v56 = v35;
                __int16 v57 = 2048;
                uint64_t v58 = v36;
                id v30 = "cached rosetta JIT exec region %p + %llu";
LABEL_23:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v30, buf, 0x16u);
              }
LABEL_24:
            }
            if (v20 == (id)++v22)
            {
              id v20 = [v19 countByEnumeratingWithState:&v42 objects:v59 count:16];
              if (!v20)
              {
LABEL_27:

                _Block_object_dispose(&v51, 8);
                id v6 = v40;
                goto LABEL_28;
              }
              continue;
            }
            goto LABEL_15;
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v46 objects:v60 count:16];
      if (!v11)
      {
LABEL_10:
        uint64_t v18 = 0;
        goto LABEL_12;
      }
    }
  }
LABEL_28:
  long long v37 = v6;
  uint64_t v38 = [v6 descriptionForRegionTotalsWithOptions:1];
  vmSummary = v41->_vmSummary;
  v41->_vmSummary = (NSString *)v38;
}

- (id)_descriptionForException:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString string];
  id v5 = [v3 description];
  [v4 appendString:v5];

  [v4 appendString:@"\n"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v3 callStackReturnAddresses];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v4, "appendFormat:", @"0x%08x\n", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "intValue"));
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)decode_cpuType
{
  uint64_t cpuType = self->_cpuType;
  if (self->_is64Bit && cpuType == 12)
  {
    uint64_t cpuType = 16777228;
    self->_uint64_t cpuType = 16777228;
  }
  return (id)_OSACPUTypeToString(cpuType, a2);
}

- (id)decode_signal
{
  uint64_t signal = self->_signal;
  id v4 = &stru_100035B30;
  switch((int)signal)
  {
    case 0:
      break;
    case 1:
      id v4 = @"SIGHUP";
      break;
    case 2:
      id v4 = @"SIGINT";
      break;
    case 3:
      id v4 = @"SIGQUIT";
      break;
    case 4:
      id v4 = @"SIGILL";
      break;
    case 5:
      id v4 = @"SIGTRAP";
      break;
    case 6:
      id v4 = @"SIGABRT";
      break;
    case 7:
      id v4 = @"SIGEMT";
      break;
    case 8:
      id v4 = @"SIGFPE";
      break;
    case 9:
      if ((self->_cs_status & 0x1000000) != 0) {
        id v5 = @"SIGKILL - CODESIGNING";
      }
      else {
        id v5 = @"SIGKILL";
      }
      id v4 = v5;
      break;
    case 10:
      id v4 = @"SIGBUS";
      break;
    case 11:
      id v4 = @"SIGSEGV";
      break;
    case 12:
      id v4 = @"SIGSYS";
      break;
    case 13:
      id v4 = @"SIGPIPE";
      break;
    case 14:
      id v4 = @"SIGALRM";
      break;
    case 15:
      id v4 = @"SIGTRM";
      break;
    case 16:
      id v4 = @"SIGURG";
      break;
    case 17:
      id v4 = @"SIGSTOP";
      break;
    case 18:
      id v4 = @"SIGTSTP";
      break;
    case 19:
      id v4 = @"SIGCONT";
      break;
    case 20:
      id v4 = @"SIGCHLD";
      break;
    case 21:
      id v4 = @"SIGTTIN";
      break;
    case 22:
      id v4 = @"SIGTTOU";
      break;
    case 23:
      id v4 = @"SIGIO";
      break;
    case 24:
      id v4 = @"SIGXCPU";
      break;
    case 25:
      id v4 = @"SIGXFSZ";
      break;
    case 26:
      id v4 = @"SIGVTALRM";
      break;
    case 27:
      id v4 = @"SIGPROF";
      break;
    case 28:
      id v4 = @"SIGWINCH";
      break;
    case 29:
      id v4 = @"SIGINFO";
      break;
    case 30:
      id v4 = @"SIGUSR1";
      break;
    case 31:
      id v4 = @"SIGUSR2";
      break;
    default:
      id v4 = +[NSString stringWithFormat:@"Signal %d", signal];
      break;
  }

  return v4;
}

- (id)decode_exceptionType
{
  uint64_t exceptionType = self->_exceptionType;
  if ((exceptionType - 1) >= 0xD)
  {
    id v3 = +[NSString stringWithFormat:@"%08X", exceptionType];
  }
  else
  {
    id v3 = *(&off_100035368 + (int)exceptionType - 1);
  }

  return v3;
}

- (void)captureDiagInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[OSASystemConfiguration sharedInstance];
  unsigned int v6 = [v5 appleInternal];
  int v7 = byte_100042FD0;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
    spewage_diag = self->_spewage_diag;
    self->_spewage_diag = v9;

    mach_port_array_t init_port_set = 0;
    mach_msg_type_number_t init_port_setCnt = 0;
    if (qword_100043000 != -1) {
      dispatch_once(&qword_100043000, &stru_100035108);
    }
    id v11 = &selRef_dictionaryWithCapacity_;
    if (dispatch_semaphore_wait((dispatch_semaphore_t)qword_100042FF8, 0))
    {
      long long v12 = self->_spewage_diag;
      long long v13 = [v4 componentsJoinedByString:@", "];
      [(NSMutableDictionary *)v12 setObject:@"concurrent diagnostic collection underway" forKeyedSubscript:v13];

      goto LABEL_41;
    }
    if (mach_ports_lookup(mach_task_self_, &init_port_set, &init_port_setCnt))
    {
      long long v14 = self->_spewage_diag;
      long long v15 = [v4 componentsJoinedByString:@", "];
      [(NSMutableDictionary *)v14 setObject:@"mach_ports_lookup failed" forKeyedSubscript:v15];

LABEL_40:
      dispatch_semaphore_signal((dispatch_semaphore_t)v11[511]);
      goto LABEL_41;
    }
    mach_port_t task = self->_task;
    if (mach_ports_register(mach_task_self_, &task, 1u))
    {
      unint64_t v16 = self->_spewage_diag;
      unint64_t v17 = [v4 componentsJoinedByString:@", "];
      [(NSMutableDictionary *)v16 setObject:@"mach_ports_register failed" forKeyedSubscript:v17];

LABEL_32:
      unint64_t v39 = init_port_setCnt;
      if (init_port_setCnt)
      {
        unint64_t v40 = 0;
        do
        {
          mach_port_name_t v41 = init_port_set[v40];
          if (v41)
          {
            mach_port_deallocate(mach_task_self_, v41);
            unint64_t v39 = init_port_setCnt;
          }
          ++v40;
        }
        while (v40 < v39);
      }
      else
      {
        unint64_t v39 = 0;
      }
      mig_deallocate((vm_address_t)init_port_set, 4 * v39);
      goto LABEL_40;
    }
    int v18 = byte_100042FD1;
    if (byte_100042FD2)
    {
      if ([(NSString *)self->_procName isEqualToString:@"SpringBoard"]
        || [(NSString *)self->_procName isEqualToString:@"CommCenter"]
        || [(NSString *)self->_procName isEqualToString:@"aggregated"]
        || [(NSString *)self->_procName isEqualToString:@"addaily"]
        || (unsigned __int8 v19 = [(NSString *)self->_procName isEqualToString:@"coreduetd"], v18)
        || (v19 & 1) != 0)
      {
LABEL_23:
        if (*self->_exceptionCode == 3134085662) {
          id v20 = "sysmemreset";
        }
        else {
          id v20 = "resource";
        }
        CFStringRef procName = self->_procName;
        uint64_t v22 = OSADateFormat();
        id v23 = +[NSMutableString stringWithFormat:@"/var/mobile/Library/Logs/CrashReporter/MemoryGraph_%@_%@-%s", procName, v22, v20];

        mach_vm_address_t v24 = [(OSACrashReport *)self incidentID];
        id v25 = +[NSString stringWithFormat:@"--outputGraph %@ --nonIPSMemgraphCount %lu --ipsIncidentID %@ --rateLimit --getCorpseFromParent %d", v23, 0, v24, self->_proc_id];

        uint64_t v26 = sub_10000E540((uint64_t)"/usr/bin/leaks", v25, dword_100042FCC, 0);
        self->_spewage_diag_total_length += (unint64_t)[v26 length];
        [(NSMutableDictionary *)self->_spewage_diag setObject:v26 forKeyedSubscript:@"/usr/bin/leaks"];
        id v27 = (char *)[v26 rangeOfString:@"'.*MemoryGraph_.+\\..+'" options:1024];
        if (v27 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"memgraph unable to parse filename from results"];
        }
        else
        {
          uint64_t v29 = objc_msgSend(v26, "substringWithRange:", v27 + 1, v28 - 2);
          p_memgraph_fileunsigned int name = &self->_memgraph_filename;
          uint64_t v31 = *p_memgraph_filename;
          *p_memgraph_fileunsigned int name = (NSString *)v29;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_10002401C((uint64_t)p_memgraph_filename, v32, v33, v34, v35, v36, v37, v38);
          }
        }

LABEL_31:
        mach_ports_register(mach_task_self_, init_port_set, init_port_setCnt);
        goto LABEL_32;
      }
    }
    else if (byte_100042FD1)
    {
      goto LABEL_23;
    }
    id v42 = [v4 count];
    if ([(NSArray *)self->_diagToolExtras count])
    {
      uint64_t v43 = [v4 arrayByAddingObjectsFromArray:self->_diagToolExtras];

      id v4 = (id)v43;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v64 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "diag tools include: %@", buf, 0xCu);
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v23 = v4;
    id v44 = [v23 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v44)
    {
      id v45 = v44;
      id obj = v23;
      unint64_t v46 = 0;
      uint64_t v47 = *(void *)v56;
      do
      {
        for (unint64_t i = 0; i != v45; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v56 != v47) {
            objc_enumerationMutation(obj);
          }
          if (v46 >= (unint64_t)v42)
          {
            CFStringRef v49 = &stru_100035B30;
          }
          else
          {
            if (self->_exceptionType == 11) {
              CFStringRef v49 = @"--excResource";
            }
            else {
              CFStringRef v49 = @"--shortenedOutput";
            }
            ++v46;
          }
          id v50 = *(id *)(*((void *)&v55 + 1) + 8 * i);
          id v51 = [v50 UTF8String];
          long long v52 = +[NSString stringWithFormat:@"%@ --getCorpseFromParent %d", v49, self->_proc_id];
          uint64_t v53 = sub_10000E540((uint64_t)v51, v52, dword_100042FCC, self->_spewage_diag_total_length);

          [(NSMutableDictionary *)self->_spewage_diag setObject:v53 forKeyedSubscript:v50];
          self->_spewage_diag_total_length += (unint64_t)[v53 length];
        }
        id v45 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v45);
      id v23 = obj;
      id v4 = obj;
      id v11 = &selRef_dictionaryWithCapacity_;
    }
    else
    {
      id v4 = v23;
    }
    goto LABEL_31;
  }
LABEL_41:
}

- (int64_t)codeZeroForGuardException
{
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_namespace == 23) {
    p_ers_code = (int64_t *)&exit_snapshot->ers_code;
  }
  else {
    p_ers_code = self->_exceptionCode;
  }
  return *p_ers_code;
}

- (id)decode_exceptionCodes
{
  id v3 = objc_opt_new();
  id v4 = [(OSACrashReport *)self decode_exceptionType];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  if (self->_signal)
  {
    id v5 = [(OSACrashReport *)self decode_signal];
    [v3 setObject:v5 forKeyedSubscript:@"signal"];
  }
  int exceptionType = self->_exceptionType;
  switch(exceptionType)
  {
    case 12:
      unint64_t v12 = [(OSACrashReport *)self codeZeroForGuardException];
      if (*self->_exceptionCode != v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v13 = *self->_exceptionCode;
        *(_DWORD *)buf = 134218240;
        *(void *)long long v66 = v13;
        *(_WORD *)&v66[8] = 2048;
        *(void *)&v66[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "EXC_GUARD code zero: 0x%llX -> 0x%llX", buf, 0x16u);
      }
      switch(v12 >> 61)
      {
        case 1uLL:
          [v3 setObject:@"GUARD_TYPE_MACH_PORT" forKeyedSubscript:@"subtype"];
          uint64_t v14 = HIDWORD(v12) & 0x1FFFFFFF;
          if ((HIDWORD(v12) & 0x1FFFFFFFu) > 0x7FF)
          {
            if ((HIDWORD(v12) & 0x1FFFFFFFu) < 0x20000)
            {
              if ((HIDWORD(v12) & 0x1FFFFFFFu) >= 0x4000)
              {
                switch(v14)
                {
                  case 0x4000:
                    long long v15 = @"KERN_FAILURE";
                    goto LABEL_138;
                  case 0x8000:
                    long long v15 = @"KERN_RESOURCE";
                    goto LABEL_138;
                  case 0x10000:
                    long long v15 = @"SEND_INVALID_REPLY";
                    goto LABEL_138;
                }
              }
              else
              {
                switch(v14)
                {
                  case 0x800:
                    long long v15 = @"INVALID_ARGUMENT";
                    goto LABEL_138;
                  case 0x1000:
                    long long v15 = @"RIGHT_EXISTS";
                    goto LABEL_138;
                  case 0x2000:
                    long long v15 = @"KERN_NO_SPACE";
                    goto LABEL_138;
                }
              }
            }
            else if ((HIDWORD(v12) & 0x1FFFFFFFu) < 0x100000)
            {
              switch(v14)
              {
                case 0x20000:
                  long long v15 = @"SEND_INVALID_VOUCHER";
                  goto LABEL_138;
                case 0x40000:
                  long long v15 = @"SEND_INVALID_RIGHT";
                  goto LABEL_138;
                case 0x80000:
                  long long v15 = @"RCV_INVALID_NAME";
                  goto LABEL_138;
              }
            }
            else if ((HIDWORD(v12) & 0x1FFFFFFFu) >= 0x400000)
            {
              if (v14 == 0x400000)
              {
                long long v15 = @"ILLEGALMOVE_SOFT";
                goto LABEL_138;
              }
              if (v14 == 0x800000)
              {
                long long v15 = @"REQUIRE_REPLY_PORT_SEMANTICS";
                goto LABEL_138;
              }
            }
            else
            {
              if (v14 == 0x100000)
              {
                long long v15 = @"RCV_GUARDED_DESC";
                goto LABEL_138;
              }
              if (v14 == 0x200000)
              {
                long long v15 = @"OVERDEALLOC_SOFT";
LABEL_138:
                long long v67 = v15;
                unint64_t v46 = +[NSArray arrayWithObjects:&v67 count:1];
                [v3 setObject:v46 forKeyedSubscript:@"violations"];

                uint64_t v47 = +[NSNumber numberWithUnsignedInt:v12];
                [v3 setObject:v47 forKeyedSubscript:@"port"];

                long long v48 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
                [v3 setObject:v48 forKeyedSubscript:@"guardId"];

                if (v12 && v14 == 3) {
                  +[NSString stringWithFormat:@"mach_msg_trap() called with msgh_id %u. The trap is not allowed on this platform.", v12, v57, v58];
                }
                else {
                  +[NSString stringWithFormat:@" %@ on mach port %u (guarded with 0x%016qx)", v15, v12, self->_exceptionCode[1]];
                }
                goto LABEL_142;
              }
            }
          }
          else
          {
            if ((HIDWORD(v12) & 0x1FFFFFFFu) <= 0x1F)
            {
              long long v15 = @"DESTROY";
              switch((int)v14)
              {
                case 1:
                  goto LABEL_138;
                case 2:
                  long long v15 = @"MOD_REFS";
                  break;
                case 3:
                  long long v15 = @"INVALID_OPTIONS";
                  break;
                case 4:
                  long long v15 = @"SET_CONTEXT";
                  break;
                case 5:
                  long long v15 = @"THREAD_SET_STATE";
                  break;
                case 6:
                  long long v15 = @"SET_EXCEPTION_BEHAVIOR";
                  break;
                case 8:
                  long long v15 = @"UNGUARDED";
                  break;
                case 16:
                  long long v15 = @"INCORRECT_GUARD";
                  break;
                default:
                  goto LABEL_136;
              }
              goto LABEL_138;
            }
            if ((HIDWORD(v12) & 0x1FFFFFFFu) > 0xFF)
            {
              switch(v14)
              {
                case 0x100:
                  long long v15 = @"INVALID_RIGHT";
                  goto LABEL_138;
                case 0x200:
                  long long v15 = @"INVALID_NAME";
                  goto LABEL_138;
                case 0x400:
                  long long v15 = @"INVALID_VALUE";
                  goto LABEL_138;
              }
            }
            else
            {
              switch(v14)
              {
                case 0x20:
                  long long v15 = @"ILLEGAL_MOVE";
                  goto LABEL_138;
                case 0x40:
                  long long v15 = @"STRICT_REPLY";
                  goto LABEL_138;
                case 0x80:
                  long long v15 = @"MSG_FILTERED";
                  goto LABEL_138;
              }
            }
          }
LABEL_136:
          long long v15 = +[NSString stringWithFormat:@"Unknown GUARD_TYPE_MACH_PORT flavor %d", HIDWORD(v12) & 0x1FFFFFFF];
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)long long v66 = HIDWORD(v12) & 0x1FFFFFFF;
            *(_WORD *)&v66[4] = 2048;
            *(void *)&v66[6] = v12;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown GUARD_TYPE_MACH_PORT flavor %d in code %lld", buf, 0x12u);
          }
          goto LABEL_138;
        case 2uLL:
          [v3 setObject:@"GUARD_TYPE_FD" forKeyedSubscript:@"subtype"];
          uint64_t v25 = HIDWORD(v12) & 0x1FFFFFFF;
          if ((HIDWORD(v12) & 0x1FFFFFFFu) > 0xF)
          {
            switch(v25)
            {
              case 0x10:
                long long v15 = @"FILEPORT";
                break;
              case 0x20:
                long long v15 = @"MISMATCH";
                break;
              case 0x40:
                long long v15 = @"WRITE";
                break;
              default:
LABEL_93:
                long long v15 = +[NSString stringWithFormat:@"Unknown GUARD_TYPE_FD flavor %d", HIDWORD(v12) & 0x1FFFFFFF];
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)long long v66 = HIDWORD(v12) & 0x1FFFFFFF;
                  *(_WORD *)&v66[4] = 2048;
                  *(void *)&v66[6] = v12;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown GUARD_TYPE_FD flavor %d in code %lld", buf, 0x12u);
                }
                break;
            }
          }
          else
          {
            long long v15 = @"CLOSE";
            switch((int)v25)
            {
              case 1:
                break;
              case 2:
                long long v15 = @"DUP";
                break;
              case 4:
                long long v15 = @"NOCLOEXEC";
                break;
              case 8:
                long long v15 = @"SOCKET_IPC";
                break;
              default:
                goto LABEL_93;
            }
          }
          uint64_t v68 = v15;
          uint64_t v37 = +[NSArray arrayWithObjects:&v68 count:1];
          [v3 setObject:v37 forKeyedSubscript:@"violations"];

          uint64_t v38 = +[NSNumber numberWithUnsignedInt:v12];
          [v3 setObject:v38 forKeyedSubscript:@"fd"];

          unint64_t v39 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
          [v3 setObject:v39 forKeyedSubscript:@"guardId"];

          +[NSString stringWithFormat:@" %@ on file descriptor %u (guarded with 0x%016qx)", v15, v12, self->_exceptionCode[1]];
          goto LABEL_142;
        case 3uLL:
          [v3 setObject:@"GUARD_TYPE_USER" forKeyedSubscript:@"subtype"];
          uint64_t v26 = +[NSNumber numberWithUnsignedInt:v12];
          [v3 setObject:v26 forKeyedSubscript:@"namespc"];

          id v27 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
          [v3 setObject:v27 forKeyedSubscript:@"reason"];

          +[NSString stringWithFormat:@"namespc %u reason_code 0x%016qx", v12, self->_exceptionCode[1], v58];
          goto LABEL_68;
        case 4uLL:
          [v3 setObject:@"GUARD_TYPE_VN" forKeyedSubscript:@"subtype"];
          buf[0] = 0;
          proc_name(v12, buf, 0x400u);
          uint64_t v28 = HIDWORD(v12) & 0x1FFFFFFF;
          if ((HIDWORD(v12) & 0x1FFFFFFFu) > 0xF)
          {
            if ((HIDWORD(v12) & 0x1FFFFFFFu) > 0x3F)
            {
              if (v28 == 64)
              {
                long long v15 = @"VNG_EXCHDATA";
                goto LABEL_112;
              }
              if (v28 == 128)
              {
                long long v15 = @"VNG_PERMISSIONS";
                goto LABEL_112;
              }
            }
            else
            {
              if (v28 == 16)
              {
                long long v15 = @"VNG_TRUNC_OTHER";
                goto LABEL_112;
              }
              if (v28 == 32)
              {
                long long v15 = @"VNG_LINK";
                goto LABEL_112;
              }
            }
LABEL_110:
            long long v15 = +[NSString stringWithFormat:@"Unknown GUARD_TYPE_VN flavor %d", HIDWORD(v12) & 0x1FFFFFFF];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)unint64_t v61 = 67109376;
              int v62 = HIDWORD(v12) & 0x1FFFFFFF;
              __int16 v63 = 2048;
              unint64_t v64 = v12;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown GUARD_TYPE_VN flavor %d in code %lld", v61, 0x12u);
            }
          }
          else
          {
            long long v15 = @"VNG_RENAME_TO";
            switch((int)v28)
            {
              case 1:
                break;
              case 2:
                long long v15 = @"VNG_RENAME_FROM";
                break;
              case 4:
                long long v15 = @"VNG_UNLINK";
                break;
              case 8:
                long long v15 = @"VNG_WRITE_OTHER";
                break;
              default:
                goto LABEL_110;
            }
          }
LABEL_112:
          unint64_t v40 = +[NSMutableString stringWithFormat:@"id=0x%016qx, pid=%u", self->_exceptionCode[1], v12];
          mach_port_name_t v41 = v40;
          if (buf[0])
          {
            [v40 appendFormat:@", process=%s", buf];
            id v42 = +[NSString stringWithUTF8String:buf];
            [v3 setObject:v42 forKeyedSubscript:@"process"];
          }
          [v41 appendFormat:@", flavor=0x%08x", HIDWORD(v12) & 0x1FFFFFFF];
          [v41 appendFormat:@" (%@)", v15];
          v60 = v15;
          uint64_t v43 = +[NSArray arrayWithObjects:&v60 count:1];
          [v3 setObject:v43 forKeyedSubscript:@"flavors"];

          id v44 = +[NSNumber numberWithUnsignedInt:v12];
          [v3 setObject:v44 forKeyedSubscript:@"pid"];

          id v45 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
          [v3 setObject:v45 forKeyedSubscript:@"guardId"];

          [v3 setObject:v41 forKeyedSubscript:@"message"];
LABEL_143:

          goto LABEL_144;
        case 5uLL:
          [v3 setObject:@"GUARD_TYPE_VIRT_MEMORY" forKeyedSubscript:@"subtype"];
          uint64_t v29 = HIDWORD(v12) & 0x1FFFFFFF;
          uint64_t v30 = v29 - 1;
          if (v29 - 1) < 8 && ((0x8Bu >> v30))
          {
            long long v15 = *(&off_1000353D0 + v30);
          }
          else
          {
            long long v15 = +[NSString stringWithFormat:@"Unknown GUARD_TYPE_VIRT_MEMORY flavor %d", HIDWORD(v12) & 0x1FFFFFFF];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)long long v66 = HIDWORD(v12) & 0x1FFFFFFF;
              *(_WORD *)&v66[4] = 2048;
              *(void *)&v66[6] = v12;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown GUARD_TYPE_VIRT_MEMORY flavor %d in code %lld", buf, 0x12u);
            }
          }
          int v59 = v15;
          uint64_t v35 = +[NSArray arrayWithObjects:&v59 count:1];
          [v3 setObject:v35 forKeyedSubscript:@"flavors"];

          uint64_t v36 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
          [v3 setObject:v36 forKeyedSubscript:@"offset"];

          +[NSString stringWithFormat:@"offset=0x%016qx, flavor=0x%08x (%@)", self->_exceptionCode[1], v29, v15];
          CFStringRef v49 = LABEL_142:;
          [v3 setObject:v49 forKeyedSubscript:@"message"];

          goto LABEL_143;
        case 6uLL:
          [v3 setObject:@"GUARD_TYPE_REJECTED_SC" forKeyedSubscript:@"subtype"];
          if (v12)
          {
            uint64_t v31 = +[NSNumber numberWithUnsignedInt:v12];
            [v3 setObject:v31 forKeyedSubscript:@"machTrap"];

            uint64_t v32 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
            [v3 setObject:v32 forKeyedSubscript:@"number"];

            +[NSString stringWithFormat:@"mach_trap %u number 0x%016qx", v12, self->_exceptionCode[1], v58];
          }
          else
          {
            uint64_t v34 = +[NSNumber numberWithLongLong:self->_exceptionCode[1]];
            [v3 setObject:v34 forKeyedSubscript:@"syscall"];

            +[NSString stringWithFormat:@"syscall 0x%016qx", self->_exceptionCode[1], v57, v58];
          }
          goto LABEL_68;
        default:
          mach_vm_address_t v24 = +[NSString stringWithFormat:@"GUARD_TYPE_0x%llX", v12 >> 61];
          [v3 setObject:v24 forKeyedSubscript:@"subtype"];

          +[NSString stringWithFormat:@"unknown guard type (0x%016qx, 0x%016qx)", v12, self->_exceptionCode[1], v58];
LABEL_68:
          uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_69;
      }
    case 11:
      unint64_t v16 = *self->_exceptionCode;
      uint64_t v17 = (v16 >> 58) & 7;
      switch(v16 >> 61)
      {
        case 1uLL:
          if (v17 == 2) {
            CFStringRef v18 = @"CPU_FATAL";
          }
          else {
            CFStringRef v18 = @"CPU";
          }
          [v3 setObject:v18 forKeyedSubscript:@"subtype"];
          +[NSString stringWithFormat:@" (Limit %u%%) Observed %u%% over %u secs", *(_DWORD *)self->_exceptionCode & 0x7F, self->_exceptionCode[1] & 0x7F, *(_DWORD *)self->_exceptionCode >> 7];
          goto LABEL_68;
        case 2uLL:
          [v3 setObject:@"WAKEUPS" forKeyedSubscript:@"subtype"];
          +[NSString stringWithFormat:@" (Limit %u/sec) Observed %u/sec over %u secs", *self->_exceptionCode & 0xFFF, self->_exceptionCode[1] & 0xFFFFF, ((unint64_t)*self->_exceptionCode >> 20) & 0xFFFFF];
          goto LABEL_68;
        case 3uLL:
          [v3 setObject:@"MEMORY" forKeyedSubscript:@"subtype"];
          if (v17 == 1)
          {
            CFStringRef v33 = @" (Limit %u MB) Crossed High Water Mark";
          }
          else
          {
            if (v17 != 2)
            {
              uint64_t v22 = @"Unknown memory exception type";
LABEL_69:
              CFStringRef v23 = @"message";
              goto LABEL_70;
            }
            CFStringRef v33 = @" (Threshold %u MB) Crossed Threshold For Diagnostic Log Generation (this log does not indicate a memory limit violation)";
          }
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, *(_DWORD *)self->_exceptionCode & 0x1FFF, v57, v58);
          goto LABEL_68;
        case 4uLL:
          [v3 setObject:@"IO" forKeyedSubscript:@"subtype"];
          +[NSString stringWithFormat:@" (Limit %u MB) Observed %u MB over %u secs", *(_DWORD *)self->_exceptionCode & 0x7FFF, self->_exceptionCode[1] & 0x7FFF, *(_DWORD *)self->_exceptionCode >> 15];
          goto LABEL_68;
        case 5uLL:
          [v3 setObject:@"THREADS" forKeyedSubscript:@"subtype"];
          +[NSString stringWithFormat:@" (Limit %u threads) Crossed Thread Limit", *(_DWORD *)self->_exceptionCode & 0x7FFF, v57, v58];
          goto LABEL_68;
        case 6uLL:
          [v3 setObject:@"PORTS" forKeyedSubscript:@"subtype"];
          +[NSString stringWithFormat:@" (Limit %u ports) Crossed system-wide per-process Port Limit", *(_DWORD *)self->_exceptionCode & 0xFFFFFF, v57, v58];
          goto LABEL_68;
        default:
          goto LABEL_144;
      }
    case 1:
      exceptionCode = self->_exceptionCode;
      unint64_t v8 = exceptionCode[1];
      self->_unint64_t crashingAddress = v8;
      int64_t v9 = exceptionCode[1];
      uint64_t v10 = sub_10000F96C(*exceptionCode);
      id v11 = (void *)v10;
      if (v8 == v9) {
        +[NSString stringWithFormat:@"%@ at 0x%016qx", v10, self->_exceptionCode[1], v58];
      }
      else {
      id v20 = +[NSString stringWithFormat:@"%@ at 0x%016qx -> 0x%016qx (possible pointer authentication failure)", v10, self->_exceptionCode[1], self->_crashingAddress];
      }
      [v3 setObject:v20 forKeyedSubscript:@"subtype"];

      if (*self->_exceptionCode == 10)
      {
        if (self->_pageinStateCount)
        {
          uint64_t v21 = self->_pageinState[0];
          if (v21)
          {
            uint64_t v22 = +[NSString stringWithFormat:@" FS pagein error: %d %s", v21, strerror(self->_pageinState[0])];
            CFStringRef v23 = @"subtype";
LABEL_70:
            [v3 setObject:v22 forKeyedSubscript:v23];
          }
        }
      }
      break;
    default:
      exit_snapshot = self->_exit_snapshot;
      if (exit_snapshot && exit_snapshot->ers_namespace == 7 && exit_snapshot->ers_code == 3)
      {
        [v3 setObject:@"LAUNCH_HANG" forKeyedSubscript:@"subtype"];
        [v3 setObject:@"The extension took too much time to initialize" forKeyedSubscript:@"message"];
      }
      break;
  }
LABEL_144:
  if (self->_exceptionCodeCount)
  {
    id v50 = +[NSMutableArray array];
    id v51 = +[NSMutableArray array];
    if (self->_exceptionCodeCount)
    {
      unint64_t v52 = 0;
      do
      {
        uint64_t v53 = +[NSNumber numberWithLongLong:self->_exceptionCode[v52]];
        [v50 addObject:v53];

        uint64_t v54 = +[NSString stringWithFormat:@"0x%016qx", self->_exceptionCode[v52]];
        [v51 addObject:v54];

        ++v52;
      }
      while (v52 < self->_exceptionCodeCount);
    }
    [v3 setObject:v50 forKeyedSubscript:@"rawCodes"];
    long long v55 = [v51 componentsJoinedByString:@", "];
    [v3 setObject:v55 forKeyedSubscript:@"codes"];
  }

  return v3;
}

- (id)terminationReasonExceptionCode
{
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot)
  {
    id v3 = +[NSString stringWithFormat:@"0x%llx", exit_snapshot->ers_code];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)decode_reasonNamespace
{
  if (self->_exit_snapshot)
  {
    v7[0] = &off_10003D060;
    v7[1] = &off_10003D078;
    v8[0] = @"JETSAM";
    v8[1] = @"SIGNAL";
    v7[2] = &off_10003D090;
    v7[3] = &off_10003D0A8;
    v8[2] = @"CODESIGNING";
    v8[3] = @"HANGTRACER";
    v7[4] = &off_10003D0C0;
    v7[5] = &off_10003D0D8;
    v8[4] = @"TEST";
    v8[5] = @"DYLD";
    v7[6] = &off_10003D0F0;
    v7[7] = &off_10003D108;
    v8[6] = @"LIBXPC";
    v8[7] = @"OBJC";
    v7[8] = &off_10003D120;
    v7[9] = &off_10003D138;
    v8[8] = @"EXEC";
    v8[9] = @"FRONTBOARD";
    v7[10] = &off_10003D150;
    v7[11] = &off_10003D168;
    v8[10] = @"TCC";
    v8[11] = @"REPORTCRASH";
    v7[12] = &off_10003D180;
    v7[13] = &off_10003D198;
    v8[12] = @"COREANIMATION";
    v8[13] = @"AGGREGATED";
    v7[14] = &off_10003D1B0;
    v7[15] = &off_10003D1C8;
    v8[14] = @"RUNNINGBOARD";
    v8[15] = @"SKYWALK";
    v7[16] = &off_10003D1E0;
    v7[17] = &off_10003D1F8;
    v8[16] = @"SETTINGS";
    v8[17] = @"LIBSYSTEM";
    v7[18] = &off_10003D210;
    v7[19] = &off_10003D228;
    v8[18] = @"FOUNDATION";
    v8[19] = @"WATCHDOG";
    v7[20] = &off_10003D240;
    v7[21] = &off_10003D258;
    v8[20] = @"METAL";
    v8[21] = @"WATCHKIT";
    v7[22] = &off_10003D270;
    v7[23] = &off_10003D288;
    v8[22] = @"GUARD";
    v8[23] = @"ANALYTICS";
    v7[24] = &off_10003D2A0;
    v7[25] = &off_10003D2B8;
    v8[24] = @"SANDBOX";
    v8[25] = @"SECURITY";
    v7[26] = &off_10003D2D0;
    v7[27] = &off_10003D2E8;
    v8[26] = @"ENDPOINTSECURITY";
    v8[27] = @"PAC_EXCEPTION";
    v7[28] = &off_10003D300;
    v7[29] = &off_10003D318;
    v8[28] = @"BLUETOOTH_CHIP";
    v8[29] = @"PORT_SPACE";
    v7[30] = &off_10003D330;
    v7[31] = &off_10003D348;
    v8[30] = @"WEBKIT";
    v8[31] = @"BACKLIGHTSERVICES";
    v7[32] = &off_10003D360;
    v7[33] = &off_10003D378;
    v8[32] = @"ROSETTA";
    v8[33] = @"OS_REASON_AUDIO";
    id v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:34];
    id v4 = +[NSNumber numberWithUnsignedInt:self->_exit_snapshot->ers_namespace];
    id v5 = [v3 objectForKeyedSubscript:v4];

    if (!v5)
    {
      id v5 = +[NSString stringWithFormat:@"<0x%X>", self->_exit_snapshot->ers_namespace];
    }
  }
  else
  {
    id v5 = @"<NO_NS>";
  }

  return v5;
}

- (id)decode_reasonLibSystem
{
  id v3 = objc_opt_new();
  v22[0] = &off_10003D390;
  v22[1] = &off_10003D3A8;
  v23[0] = @"Thread parking or terminating still owning a workloop";
  v23[1] = @"Application Triggered Fault";
  v22[2] = &off_10003D3C0;
  v22[3] = &off_10003D3D8;
  v23[2] = @"Application Triggered Fault";
  v23[3] = @"SecInit Initializer";
  v22[4] = &off_10003D3F0;
  v23[4] = @"PThread Corruption";
  id v4 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:5];
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  unsigned int v6 = [v4 objectForKeyedSubscript:v5];
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  int v7 = objc_opt_new();
  if (self->_workloop_id)
  {
    unint64_t v8 = +[NSString stringWithFormat:@"Workloop: %#llx", self->_workloop_id];
    [v7 addObject:v8];
  }
  if (self->_queue_serial_no)
  {
    int64_t v9 = +[NSString stringWithFormat:@"Dispatch Queue: #%lld", self->_queue_serial_no];
    [v7 addObject:v9];
  }
  uint64_t v10 = +[OSASystemConfiguration sharedInstance];
  if (![v10 appleInternal] || !self->_exit_payload || !self->_exit_payload_length)
  {

    goto LABEL_11;
  }
  uint64_t ers_code = self->_exit_snapshot->ers_code;
  if (ers_code == 2)
  {
  }
  else
  {

    if (ers_code != 5) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = self->_exit_snapshot->ers_code;
  if (v13 == 5)
  {
    [(OSACrashReport *)self decode_os_log_fault_payload];
    id v20 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"message"];

    if (v20)
    {
      uint64_t v21 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"message"];
      [v7 addObject:v21];
    }
  }
  else if (v13 == 2)
  {
    size_t v14 = (4 * self->_exit_payload_length) | 1;
    long long v15 = (char *)malloc_type_malloc(v14, 0x356C8127uLL);
    unint64_t v16 = v15;
    exit_payload = (const char *)self->_exit_payload;
    unsigned int exit_payload_length = self->_exit_payload_length;
    if (!exit_payload[exit_payload_length - 1]) {
      self->_unsigned int exit_payload_length = --exit_payload_length;
    }
    if (v15)
    {
      if (strnvisx(v15, v14, exit_payload, exit_payload_length, 18) != -1)
      {
        unsigned __int8 v19 = +[NSString stringWithUTF8String:v16];
        [v7 addObject:v19];
      }
      free(v16);
    }
  }
LABEL_11:
  if ([v7 count]) {
    [v3 setObject:v7 forKeyedSubscript:@"details"];
  }

  return v3;
}

- (id)decode_reasonCarousel
{
  return &__NSDictionary0__struct;
}

- (void)decode_reasonDyldWithInfo:(id)a3
{
  id v4 = a3;
  v51[0] = &off_10003D060;
  v51[1] = &off_10003D078;
  v52[0] = @"Library missing";
  v52[1] = @"Wrong architecture";
  v51[2] = &off_10003D090;
  v51[3] = &off_10003D0A8;
  v52[2] = @"Wrong version";
  v52[3] = @"Symbol missing";
  v51[4] = &off_10003D0C0;
  v51[5] = &off_10003D0D8;
  v52[4] = @"Code Signature";
  v52[5] = @"Filesystem Sandbox";
  v51[6] = &off_10003D0F0;
  v52[6] = @"Malformed Mach-O";
  id v5 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:7];
  unsigned int v6 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  int v7 = [v5 objectForKeyedSubscript:v6];
  [v4 setObject:v7 forKeyedSubscript:@"indicator"];

  exit_payload = self->_exit_payload;
  if (exit_payload)
  {
    if (self->_exit_payload_length < 0x14)
    {
      [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to extract dyld error info: The size of the data is not what is expected"];
    }
    else
    {
      if (exit_payload[4])
      {
        self->_fatalDyldErrorOnLaunch = 1;
        [v4 setObject:&off_10003D540 forKeyedSubscript:@"details"];
      }
      uint64_t v36 = v5;
      unint64_t v40 = objc_opt_new();
      uint64_t v9 = *((unsigned int *)exit_payload + 2);
      if (v9 && v9 < self->_exit_payload_length)
      {
        uint64_t v10 = &exit_payload[v9];
        id v11 = +[NSString stringWithUTF8String:&exit_payload[v9]];
        unint64_t v12 = OSASanitizePath();
        uint64_t v13 = +[NSString stringWithUTF8String:v10];
        [v40 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v14 = *((unsigned int *)exit_payload + 3);
      if (v14 && v14 < self->_exit_payload_length)
      {
        long long v15 = &exit_payload[v14];
        unint64_t v16 = +[NSString stringWithUTF8String:&exit_payload[v14]];
        uint64_t v17 = OSASanitizePath();
        CFStringRef v18 = +[NSString stringWithUTF8String:v15];
        [v40 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v37 = v4;
      unsigned __int8 v19 = [v4 objectForKeyedSubscript:@"reasons"];
      unint64_t v39 = objc_opt_new();
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = v19;
      id v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v46;
        do
        {
          for (unint64_t i = 0; i != v21; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(obj);
            }
            id v24 = *(id *)(*((void *)&v45 + 1) + 8 * i);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v25 = v40;
            id v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v42;
              do
              {
                uint64_t v29 = 0;
                uint64_t v30 = v24;
                do
                {
                  if (*(void *)v42 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v29);
                  uint64_t v32 = [v25 objectForKeyedSubscript:v31];
                  id v24 = [v30 stringByReplacingOccurrencesOfString:v31 withString:v32];

                  uint64_t v29 = (char *)v29 + 1;
                  uint64_t v30 = v24;
                }
                while (v27 != v29);
                id v27 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
              }
              while (v27);
            }

            [v39 addObject:v24];
          }
          id v21 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v21);
      }

      CFStringRef v33 = +[OSASystemConfiguration sharedInstance];
      unsigned int v34 = [v33 appleInternal];

      if (v34) {
        CFStringRef v35 = @"signatureReasons";
      }
      else {
        CFStringRef v35 = @"reasons";
      }
      id v4 = v37;
      [v37 setObject:v39 forKeyedSubscript:v35];

      id v5 = v36;
    }
  }
}

- (id)decode_versionCodes:(unsigned __int16)a3[4]
{
  id v4 = +[NSNumber numberWithUnsignedShort:*a3];
  v11[0] = v4;
  id v5 = +[NSNumber numberWithUnsignedShort:a3[1]];
  v11[1] = v5;
  unsigned int v6 = +[NSNumber numberWithUnsignedShort:a3[2]];
  v11[2] = v6;
  int v7 = +[NSNumber numberWithUnsignedShort:a3[3]];
  v11[3] = v7;
  unint64_t v8 = +[NSArray arrayWithObjects:v11 count:4];

  uint64_t v9 = [v8 componentsJoinedByString:@"."];

  return v9;
}

- (id)decode_reasonBTC
{
  id v3 = objc_opt_new();
  exit_payload = (char *)self->_exit_payload;
  if (exit_payload)
  {
    if (self->_exit_payload_length < 0x800)
    {
      [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] addObject:@"Failed to extract BTC error info: The size of the data is not what is expected"];
    }
    else
    {
      v114 = (unsigned int *)(exit_payload + 269);
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)exit_payload + 5, out);
      v139[0] = @"bin_id";
      +[NSNumber numberWithUnsignedInt:*(unsigned int *)(exit_payload + 1)];
      id v5 = v117 = exit_payload;
      v140[0] = v5;
      v139[1] = @"uuid";
      unsigned int v6 = +[NSString stringWithUTF8String:out];
      v140[1] = v6;
      v139[2] = @"mac_version";
      int v7 = [(OSACrashReport *)self decode_versionCodes:v117 + 21];
      v140[2] = v7;
      v139[3] = @"phy_version";
      unint64_t v8 = [(OSACrashReport *)self decode_versionCodes:v117 + 29];
      v140[3] = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:4];
      [v3 setObject:v9 forKeyedSubscript:@"sw_version"];

      v137[0] = @"id";
      uint64_t v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 37)];
      v137[1] = @"params";
      v138[0] = v10;
      id v11 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 41)];
      v136[0] = v11;
      unint64_t v12 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 45)];
      v136[1] = v12;
      uint64_t v13 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 49)];
      v136[2] = v13;
      uint64_t v14 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 53)];
      v136[3] = v14;
      long long v15 = +[NSArray arrayWithObjects:v136 count:4];
      v138[1] = v15;
      unint64_t v16 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:2];
      size_t v116 = v3;
      [v3 setObject:v16 forKeyedSubscript:@"reason"];

      uint64_t v17 = objc_opt_new();
      for (uint64_t i = 0; i != 20; i += 4)
      {
        unsigned __int8 v19 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v117[i + 61]];
        [v17 addObject:v19];
      }
      v134[0] = @"pc";
      id v20 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 57)];
      v135[0] = v20;
      unsigned int v107 = v17;
      v135[1] = v17;
      v134[1] = @"lr";
      v134[2] = @"cpsr";
      id v21 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 81)];
      v135[2] = v21;
      v134[3] = @"dfar";
      uint64_t v22 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 85)];
      v135[3] = v22;
      v134[4] = @"dfsr";
      CFStringRef v23 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 89)];
      v135[4] = v23;
      v134[5] = @"ifar";
      id v24 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 93)];
      v135[5] = v24;
      v134[6] = @"ifsr";
      id v25 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 97)];
      v135[6] = v25;
      size_t v113 = +[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:7];

      v132[0] = @"vic0_vicrawintr";
      uint64_t v110 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 101)];
      v133[0] = v110;
      v132[1] = @"vic1_vicrawintr";
      size_t v108 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 105)];
      v133[1] = v108;
      v132[2] = @"vic2_vicrawintr";
      uint64_t v105 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 109)];
      v133[2] = v105;
      v132[3] = @"irq_vic_0";
      uint64_t v102 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 113)];
      v133[3] = v102;
      v132[4] = @"irq_vic_1";
      unint64_t v99 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 117)];
      v133[4] = v99;
      v132[5] = @"irq_vic_2";
      unsigned int v96 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 121)];
      v133[5] = v96;
      v132[6] = @"fiq_vic_0";
      uint64_t v93 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 125)];
      v133[6] = v93;
      v132[7] = @"fiq_vic_1";
      id v26 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 129)];
      v133[7] = v26;
      v132[8] = @"fiq_vic_2";
      id v27 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 133)];
      v133[8] = v27;
      v132[9] = @"vic3_vicrawintr";
      uint64_t v28 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 137)];
      v133[9] = v28;
      v132[10] = @"irq_vic_3";
      uint64_t v29 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 141)];
      v133[10] = v29;
      v132[11] = @"fiq_vic_3";
      uint64_t v30 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 145)];
      v133[11] = v30;
      v132[12] = @"raw_irq_status";
      uint64_t v31 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v117 + 149)];
      v133[12] = v31;
      v132[13] = @"prev_raw_irq_status";
      uint64_t v32 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v117 + 157)];
      v133[13] = v32;
      unsigned int v112 = +[NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:14];

      v130[0] = @"local_bt_clk";
      CFStringRef v33 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 165)];
      v131[0] = v33;
      v130[1] = @"coex_activity_bits";
      unsigned int v34 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 169)];
      v131[1] = v34;
      v130[2] = @"coex_envelop_bits";
      CFStringRef v35 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 173)];
      v131[2] = v35;
      v130[3] = @"top_semaphores_lock_status_hw";
      uint64_t v36 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 177)];
      v131[3] = v36;
      v130[4] = @"top_semaphores_lock_status_fw";
      uint64_t v37 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 181)];
      v131[4] = v37;
      unsigned int v111 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:5];

      uint64_t v38 = objc_opt_new();
      uint64_t v39 = 0;
      unint64_t v40 = v117 + 204;
      do
      {
        v128[0] = @"syndrome";
        long long v41 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v40[v39 - 16]];
        v129[0] = v41;
        v128[1] = @"far";
        long long v42 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v40[v39 - 12]];
        v129[1] = v42;
        v128[2] = @"pc";
        long long v43 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v40[v39 - 8]];
        v129[2] = v43;
        v128[3] = @"lr";
        long long v44 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v40[v39 - 4]];
        v129[3] = v44;
        v128[4] = @"psr";
        long long v45 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v40[v39]];
        v129[4] = v45;
        long long v46 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:5];
        [v38 addObject:v46];

        v39 += 20;
      }
      while (v39 != 60);
      v126[0] = @"registers";
      v124[0] = @"arm";
      v124[1] = @"soc";
      v125[0] = v113;
      v125[1] = v112;
      v124[2] = @"bt";
      v125[2] = v111;
      long long v47 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:3];
      v127[0] = v47;
      v126[1] = @"context";
      long long v48 = +[NSNumber numberWithUnsignedChar:v117[185]];
      v127[1] = v48;
      v126[2] = @"abort_counter";
      CFStringRef v49 = +[NSNumber numberWithUnsignedChar:v117[186]];
      v127[2] = v49;
      v126[3] = @"unhandled_exception_counter";
      id v50 = +[NSNumber numberWithUnsignedChar:v117[187]];
      v127[3] = v50;
      id v51 = v38;
      v127[4] = v38;
      v126[4] = @"unhandled_exception_info";
      v126[5] = @"system_exit_status";
      unint64_t v52 = +[NSNumber numberWithUnsignedChar:v117[248]];
      v127[5] = v52;
      uint64_t v53 = +[NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:6];
      [v116 setObject:v53 forKeyedSubscript:@"trace"];

      uint64_t v54 = objc_opt_new();
      for (uint64_t j = 0; j != 12; j += 4)
      {
        long long v56 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)&v117[j + 283]];
        [v54 addObject:v56];
      }
      unsigned int v106 = v51;
      uint64_t v57 = objc_opt_new();
      for (uint64_t k = 0; k != 6; k += 2)
      {
        int v59 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)&v117[k + 295]];
        [v57 addObject:v59];
      }
      v122[0] = @"rx_header_status";
      int v103 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v117 + 249)];
      v123[0] = v103;
      v122[1] = @"tx_header_status";
      uint64_t v100 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v117 + 253)];
      v123[1] = v100;
      v122[2] = @"sync_valid";
      unsigned int v97 = +[NSNumber numberWithUnsignedChar:v117[255]];
      v123[2] = v97;
      v122[3] = @"hw_machine_sig";
      long long v94 = +[NSNumber numberWithUnsignedChar:v117[256]];
      v123[3] = v94;
      v122[4] = @"general_status";
      v91 = +[NSNumber numberWithUnsignedChar:v117[257]];
      uint8_t v123[4] = v91;
      v122[5] = @"esco_tx_en_state";
      unint64_t v89 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v117 + 129)];
      v123[5] = v89;
      v122[6] = @"sch_current_mrl";
      v87 = +[NSNumber numberWithUnsignedChar:v117[260]];
      v123[6] = v87;
      v122[7] = @"rx_data_type";
      BOOL v85 = +[NSNumber numberWithUnsignedChar:v117[261]];
      v123[7] = v85;
      v122[8] = @"tx_data_type";
      unsigned int v83 = +[NSNumber numberWithUnsignedChar:v117[262]];
      v123[8] = v83;
      v122[9] = @"rx_packet_length";
      uint64_t v81 = +[NSNumber numberWithUnsignedChar:v117[263]];
      v123[9] = v81;
      v122[10] = @"tx_packet_length";
      v80 = +[NSNumber numberWithUnsignedChar:v117[264]];
      v123[10] = v80;
      v122[11] = @"total_rx_tx_length";
      uint64_t v79 = +[NSNumber numberWithUnsignedChar:v117[265]];
      v123[11] = v79;
      v122[12] = @"rx_watchdog_timer_counter";
      int v78 = +[NSNumber numberWithUnsignedChar:v117[266]];
      v123[12] = v78;
      v122[13] = @"rx_watchdog_occured";
      uint64_t v77 = +[NSNumber numberWithUnsignedChar:v117[267]];
      v123[13] = v77;
      v122[14] = @"dbl_buf_index";
      uint64_t v76 = +[NSNumber numberWithUnsignedChar:v117[268]];
      v123[14] = v76;
      v122[15] = @"Block_activity_bitmask";
      uint64_t v75 = +[NSNumber numberWithUnsignedInt:*v114];
      v123[15] = v75;
      v122[16] = @"last_scheduled_btclk";
      v60 = +[NSNumber numberWithUnsignedInt:v114[1]];
      v123[16] = v60;
      v122[17] = @"prev_scheduled_btclk";
      unint64_t v61 = +[NSNumber numberWithUnsignedInt:v114[2]];
      v123[17] = v61;
      v122[18] = @"prev_activity_type";
      int v62 = +[NSNumber numberWithUnsignedChar:v117[281]];
      v123[18] = v62;
      v122[19] = @"prev_virtual_clock_domain";
      __int16 v63 = +[NSNumber numberWithUnsignedChar:v117[282]];
      v123[19] = v63;
      v123[20] = v54;
      v122[20] = @"bt_clk_freeze";
      v122[21] = @"pt_freeze";
      v123[21] = v57;
      v122[22] = @"sm_clk_freeze";
      unint64_t v64 = +[NSNumber numberWithUnsignedInt:v114[8]];
      v123[22] = v64;
      uint64_t v109 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:23];

      id v65 = objc_opt_new();
      for (uint64_t m = 0; m != 256; ++m)
      {
        long long v67 = +[NSNumber numberWithUnsignedChar:v117[m + 315]];
        [v65 addObject:v67];
      }
      v121[0] = v109;
      v120[0] = @"current_frame_status";
      v120[1] = @"max_dram_wakeup_duration";
      unint64_t v115 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v114 + 18)];
      v121[1] = v115;
      v120[2] = @"dram_protection_mode";
      v104 = +[NSNumber numberWithUnsignedChar:v117[307]];
      v121[2] = v104;
      v120[3] = @"dram_access_allowed";
      unint64_t v101 = +[NSNumber numberWithUnsignedChar:v117[308] & 1];
      v121[3] = v101;
      v120[4] = @"dram_is_enable";
      double v98 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 1) & 1];
      v121[4] = v98;
      v120[5] = @"force_dram_awake_bit";
      uint64_t v95 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 2) & 1];
      v121[5] = v95;
      v120[6] = @"etm_etb_enabled";
      unsigned int v92 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 3) & 1];
      v121[6] = v92;
      v120[7] = @"trx_timers_supported";
      unint64_t v90 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 4) & 1];
      v121[7] = v90;
      v120[8] = @"dart_error_occurred";
      uint64_t v88 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 5) & 1];
      v121[8] = v88;
      v120[9] = @"syncrhonous_external_abort_occured";
      int v86 = +[NSNumber numberWithUnsignedChar:(v117[308] >> 6) & 1];
      v121[9] = v86;
      v120[10] = @"init_state";
      unsigned int v84 = +[NSNumber numberWithUnsignedChar:v117[309]];
      v121[10] = v84;
      v120[11] = @"recovery_state";
      int v82 = +[NSNumber numberWithUnsignedChar:v117[310]];
      v121[11] = v82;
      v120[12] = @"sleep_wakeup_state";
      uint64_t v68 = +[NSNumber numberWithUnsignedChar:v117[311]];
      v121[12] = v68;
      v120[13] = @"sleep_go_to_deep_sleep_state";
      unint64_t v69 = +[NSNumber numberWithUnsignedChar:v117[312]];
      v121[13] = v69;
      v120[14] = @"rtkit_assert_state";
      int v70 = +[NSNumber numberWithUnsignedChar:v117[313]];
      v121[14] = v70;
      v120[15] = @"rtkit_power_off_state";
      int v71 = +[NSNumber numberWithUnsignedChar:v117[314]];
      v120[16] = @"bulk_status_block";
      v121[15] = v71;
      v121[16] = v65;
      int v72 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:17];
      id v3 = v116;
      [v116 setObject:v72 forKeyedSubscript:@"debug"];
    }
  }
  CFStringRef v118 = @"btc_info";
  unsigned int v119 = v3;
  int v73 = +[NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];

  return v73;
}

- (id)decode_reasonTcc
{
  if (self->_terminator_reason)
  {
    id v3 = +[OSASystemConfiguration sharedInstance];
    unsigned __int8 v4 = [v3 appleInternal];

    if (v4) {
      goto LABEL_10;
    }
  }
  if (!self->_exit_payload) {
    goto LABEL_10;
  }
  unsigned int exit_payload_length = self->_exit_payload_length;
  if (!exit_payload_length) {
    goto LABEL_10;
  }
  unsigned int v6 = exit_payload_length >= 0x4F ? 79 : self->_exit_payload_length;
  __memcpy_chk();
  v15[v6] = 0;
  int v7 = +[NSString stringWithUTF8String:v15];
  unint64_t v8 = +[NSString stringWithFormat:@"This app has crashed because it attempted to access privacy-sensitive data without a usage description. The app's Info.plist must contain an %@ key with a string value explaining to the user how the app uses this data.", v7];

  if (v8)
  {
    unint64_t v12 = v8;
    CFStringRef v13 = @"details";
    uint64_t v9 = +[NSArray arrayWithObjects:&v12 count:1];
    uint64_t v14 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  else
  {
LABEL_10:
    uint64_t v10 = &__NSDictionary0__struct;
  }

  return v10;
}

- (id)decode_reasonExec
{
  id v3 = objc_opt_new();
  v8[0] = &off_10003D060;
  v8[1] = &off_10003D078;
  v9[0] = @"Bad Mach-O";
  v9[1] = @"SUGID Failure";
  v8[2] = &off_10003D090;
  v8[3] = &off_10003D0A8;
  _DWORD v9[2] = @"Activation ThreadState";
  v9[3] = @"Stack Allocation";
  v8[4] = &off_10003D0C0;
  v8[5] = &off_10003D0D8;
  v9[4] = @"String Intialization";
  void v9[5] = @"Copyout Strings";
  v8[6] = &off_10003D0F0;
  v8[7] = &off_10003D108;
  v9[6] = @"Copyout DynLinker";
  v9[7] = @"Security Policy";
  v8[8] = &off_10003D120;
  v8[9] = &off_10003D138;
  v9[8] = @"Task Gated";
  v9[9] = @"Fairplay Decryption";
  v8[10] = &off_10003D150;
  v8[11] = &off_10003D168;
  v9[10] = @"Decryption";
  v9[11] = @"This UPX compressed binary contains an invalid Mach-O header and cannot be loaded.";
  v8[12] = &off_10003D180;
  v8[13] = &off_10003D198;
  v9[12] = @"No 32-bit Execution";
  v9[13] = @"Binary with wrong platform";
  v8[14] = &off_10003D1B0;
  v8[15] = &off_10003D1C8;
  v9[14] = @"Main FD Allocation";
  v9[15] = @"Copyout Rosetta";
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:16];
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  unsigned int v6 = [v4 objectForKeyedSubscript:v5];
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  return v3;
}

- (id)decode_reasonCoreAnimation
{
  if (self->_exit_payload && self->_exit_payload_length)
  {
    v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    id v3 = [v2 componentsSeparatedByString:@"\n"];

    unsigned __int8 v4 = [v3 valueForKey:@"stringByTrimmingColumnSensitive"];
    id v5 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
    unsigned int v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else
  {
    unsigned int v6 = 0;
  }
  if ([v6 count])
  {
    CFStringRef v9 = @"details";
    uint64_t v10 = v6;
    int v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    int v7 = &__NSDictionary0__struct;
  }

  return v7;
}

- (id)decode_reasonMetal
{
  if (self->_exit_payload && self->_exit_payload_length)
  {
    v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    id v3 = [v2 componentsSeparatedByString:@"\n"];

    unsigned __int8 v4 = [v3 valueForKey:@"stringByTrimming"];
    id v5 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
    unsigned int v6 = [v4 filteredArrayUsingPredicate:v5];
  }
  else
  {
    unsigned int v6 = 0;
  }
  if ([v6 count])
  {
    CFStringRef v9 = @"details";
    uint64_t v10 = v6;
    int v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    int v7 = &__NSDictionary0__struct;
  }

  return v7;
}

- (id)decode_reasonWatchKit
{
  v2 = objc_opt_new();

  return v2;
}

- (id)decode_reasonWatchdog
{
  id v3 = objc_opt_new();
  CFStringRef v13 = &off_10003D060;
  CFStringRef v14 = @"monitoring timed out for service";
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  unsigned int v6 = [v4 objectForKeyedSubscript:v5];
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  terminator_reason = self->_terminator_reason;
  if (terminator_reason)
  {
    unint64_t v8 = [(NSString *)terminator_reason componentsSeparatedByString:@"\n"];
    CFStringRef v9 = [v8 valueForKey:@"stringByTrimming"];
    uint64_t v10 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
    id v11 = [v9 filteredArrayUsingPredicate:v10];

    if ([v11 count]) {
      [v3 setObject:v11 forKeyedSubscript:@"details"];
    }
  }

  return v3;
}

- (id)decode_reasonLibxpc
{
  uint64_t label = xpc_exit_reason_get_label();
  CFStringRef v6 = @"indicator";
  if (label)
  {
    id v3 = +[NSString stringWithUTF8String:label];
  }
  else
  {
    id v3 = @"<unknown>";
  }
  int v7 = v3;
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  if (label) {

  }
  return v4;
}

- (id)decode_reasonPortSpace
{
  id v3 = objc_opt_new();
  if ((self->_exit_snapshot->ers_code & 0x1C00000000000000) == 0x400000000000000)
  {
    unsigned __int8 v4 = +[NSString stringWithFormat:@"(Limit %u ports) Exceeded system-wide per-process Port Limit", self->_exit_snapshot->ers_code & 0xFFFFFF];
    [v3 setObject:v4 forKeyedSubscript:@"indicator"];
  }

  return v3;
}

- (id)decode_reasonCodeSigning
{
  id v3 = objc_opt_new();
  v8[0] = &off_10003D078;
  v8[1] = &off_10003D090;
  v9[0] = @"Invalid Page";
  v9[1] = @"Task Access Port";
  v8[2] = &off_10003D060;
  v8[3] = &off_10003D0A8;
  _DWORD v9[2] = @"Taskgated Invalid Signature";
  v9[3] = @"Launch Constraint Violation";
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
  id v5 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  CFStringRef v6 = [v4 objectForKeyedSubscript:v5];
  [v3 setObject:v6 forKeyedSubscript:@"indicator"];

  return v3;
}

- (id)decode_reasonSandbox
{
  id v3 = objc_opt_new();
  if (self->_exit_payload && self->_exit_payload_length)
  {
    unsigned __int8 v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    int v7 = v4;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
    [v3 setObject:v5 forKeyedSubscript:@"details"];
  }

  return v3;
}

- (id)decode_reasonRosetta
{
  id v3 = objc_opt_new();
  if (&_rosetta_create_exit_payload_string)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to decode Rosetta abort payload", v19, 2u);
    }
    exit_payload = (char *)self->_exit_payload;
    if (exit_payload)
    {
      p_unsigned int exit_payload_length = &self->_exit_payload_length;
      if (*p_exit_payload_length < 0x800)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100024094((uint64_t)p_exit_payload_length, v11, v12, v13, v14, v15, v16, v17);
        }
      }
      else
      {
        CFStringRef v6 = +[NSString stringWithUTF8String:exit_payload + 1024];
        int v7 = v6;
        if (v6)
        {
          unint64_t v8 = (const char *)[v6 cStringUsingEncoding:4];
          if (v8)
          {
            strlen(v8);
            CFStringRef v9 = +[NSString stringWithUTF8String:rosetta_create_exit_payload_string()];
            id v20 = v9;
            uint64_t v10 = +[NSArray arrayWithObjects:&v20 count:1];
            [v3 setObject:v10 forKeyedSubscript:@"details"];
          }
        }
      }
    }
  }

  return v3;
}

- (id)bls_presentationPayload:(id *)a3
{
  v14[0] = @"isNonNil";
  unsigned __int8 v4 = +[NSNumber numberWithInt:-(*(unsigned char *)a3 & 1)];
  v15[0] = v4;
  v14[1] = @"flipbookContext_wantsTransform";
  id v5 = +[NSNumber numberWithInt:(*(unsigned char *)a3 << 30 >> 31)];
  v15[1] = v5;
  v14[2] = @"flipbookContext_inverted";
  CFStringRef v6 = +[NSNumber numberWithInt:(*(unsigned char *)a3 << 29 >> 31)];
  v15[2] = v6;
  v14[3] = @"num_presentationEntries";
  int v7 = +[NSNumber numberWithUnsignedInt:a3->var3];
  v15[3] = v7;
  v14[4] = @"presentationEntry0_identifier";
  unint64_t v8 = +[NSNumber numberWithUnsignedInt:a3->var4];
  v15[4] = v8;
  v14[5] = @"presentationEntry1_identifier";
  CFStringRef v9 = +[NSNumber numberWithUnsignedInt:a3->var5];
  v15[5] = v9;
  v14[6] = @"presentationEntry2_identifier";
  uint64_t v10 = +[NSNumber numberWithUnsignedInt:a3->var6];
  v15[6] = v10;
  v14[7] = @"presentationEntry3_identifier";
  uint64_t v11 = +[NSNumber numberWithUnsignedInt:a3->var7];
  v15[7] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];

  return v12;
}

- (id)bls_aggregatePayload:(id *)a3
{
  v9[0] = @"displayMode";
  p_unint64_t var1 = &a3->var1;
  id v5 = +[NSNumber numberWithInt:a3->var0];
  v9[1] = @"presentation";
  v10[0] = v5;
  CFStringRef v6 = [(OSACrashReport *)self bls_presentationPayload:p_var1];
  v10[1] = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)bls_transitionPayload:(id *)a3
{
  v11[0] = @"isNonNil";
  unsigned __int8 v4 = +[NSNumber numberWithInt:-(*(unsigned char *)a3 & 1)];
  v12[0] = v4;
  v11[1] = @"environmentIdentifier";
  id v5 = +[NSNumber numberWithUnsignedInt:a3->var1];
  v12[1] = v5;
  v11[2] = @"updatingInitialState";
  CFStringRef v6 = +[NSNumber numberWithInt:-(*((unsigned char *)a3 + 8) & 1)];
  v12[2] = v6;
  v11[3] = @"updatingVisualState";
  int v7 = +[NSNumber numberWithInt:(*((unsigned __int8 *)a3 + 8) << 30 >> 31)];
  _OWORD v12[3] = v7;
  void v11[4] = @"animating";
  unint64_t v8 = +[NSNumber numberWithInt:(*((unsigned __int8 *)a3 + 8) << 29 >> 31)];
  v12[4] = v8;
  CFStringRef v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (id)bls_environmentStateMachinePayload:(id *)a3
{
  v24[0] = @"isNonNil";
  CFStringRef v23 = +[NSNumber numberWithInt:-(*(unsigned char *)a3 & 1)];
  v25[0] = v23;
  v24[1] = @"presentation";
  uint64_t v22 = [(OSACrashReport *)self bls_presentationPayload:&a3->var1];
  v25[1] = v22;
  v24[2] = @"num_updatingVisualStateTransitionStates";
  id v21 = +[NSNumber numberWithUnsignedInt:a3->var2];
  v25[2] = v21;
  void v24[3] = @"updatingVisualStateTransitionState0";
  id v20 = [(OSACrashReport *)self bls_transitionPayload:&a3->var3];
  void v25[3] = v20;
  v24[4] = @"updatingVisualStateTransitionState1";
  unsigned __int8 v19 = [(OSACrashReport *)self bls_transitionPayload:&a3->var4];
  v25[4] = v19;
  void v24[5] = @"updatingVisualStateTransitionState2";
  CFStringRef v18 = [(OSACrashReport *)self bls_transitionPayload:&a3->var5];
  void v25[5] = v18;
  v24[6] = @"updatingVisualStateTransitionState3";
  uint64_t v17 = [(OSACrashReport *)self bls_transitionPayload:&a3->var6];
  v25[6] = v17;
  v24[7] = @"num_updatingDateSpecifierTransitionStates";
  uint64_t v16 = +[NSNumber numberWithUnsignedInt:a3->var7];
  v25[7] = v16;
  v24[8] = @"updatingDateSpecifierTransitionState0";
  id v5 = [(OSACrashReport *)self bls_transitionPayload:&a3->var8];
  v25[8] = v5;
  v24[9] = @"updatingDateSpecifierTransitionState1";
  CFStringRef v6 = [(OSACrashReport *)self bls_transitionPayload:&a3->var9];
  v25[9] = v6;
  v24[10] = @"updatingDateSpecifierTransitionState2";
  int v7 = [(OSACrashReport *)self bls_transitionPayload:&a3->var10];
  v25[10] = v7;
  v24[11] = @"updatingDateSpecifierTransitionState3";
  unint64_t v8 = [(OSACrashReport *)self bls_transitionPayload:&a3->var11];
  v25[11] = v8;
  v24[12] = @"backlightState";
  CFStringRef v9 = +[NSNumber numberWithInt:a3->var12];
  v25[12] = v9;
  v24[13] = @"previousBacklightState";
  uint64_t v10 = +[NSNumber numberWithInt:a3->var13];
  v25[13] = v10;
  v24[14] = @"pendingNotifyBeganUpdatingState";
  uint64_t v11 = +[NSNumber numberWithInt:-(*((unsigned char *)a3 + 140) & 1)];
  v25[14] = v11;
  v24[15] = @"updatingState";
  uint64_t v12 = +[NSNumber numberWithInt:(*((unsigned __int8 *)a3 + 140) << 30 >> 31)];
  v25[15] = v12;
  v24[16] = @"updatingPresentation";
  uint64_t v13 = +[NSNumber numberWithInt:(*((unsigned __int8 *)a3 + 140) << 29 >> 31)];
  v25[16] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:17];

  return v14;
}

- (id)bls_backlightChangeRequestPayload:(id *)a3
{
  if (*(unsigned char *)a3)
  {
    v10[0] = @"requestedActivityState";
    id v5 = +[NSNumber numberWithInt:a3->var1];
    v11[0] = v5;
    v10[1] = @"explanation";
    CFStringRef v6 = +[NSNumber numberWithUnsignedInt:a3->var2];
    v11[1] = v6;
    void v10[2] = @"timestamp";
    int v7 = +[NSNumber numberWithUnsignedLongLong:a3->var3];
    v11[2] = v7;
    v10[3] = @"sourceEvent";
    unint64_t v8 = +[NSNumber numberWithInt:a3->var4];
    v11[3] = v8;
    id v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)bls_backlightChangeEventPayload:(id *)a3
{
  if (*(unsigned char *)a3)
  {
    id v3 = objc_opt_new();
    CFStringRef v6 = +[NSNumber numberWithUnsignedLongLong:a3->var1];
    [v3 setObject:v6 forKeyedSubscript:@"eventID"];

    int v7 = +[NSNumber numberWithInt:a3->var2];
    [v3 setObject:v7 forKeyedSubscript:@"state"];

    unint64_t v8 = +[NSNumber numberWithInt:a3->var3];
    [v3 setObject:v8 forKeyedSubscript:@"previousState"];

    CFStringRef v9 = [(OSACrashReport *)self bls_backlightChangeRequestPayload:&a3->var4];
    [v3 setObject:v9 forKeyedSubscript:@"changeRequest"];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)decode_reasonBacklightServices
{
  id v3 = objc_opt_new();
  v105[0] = &off_10003D060;
  v105[1] = &off_10003D078;
  v106[0] = @"Watchdog Transition State Machine";
  v106[1] = @"Watchdog Display State Machine";
  v105[2] = &off_10003D090;
  v106[2] = @"Assert Critical Operation Completed Mismatched Backlight States";
  unsigned __int8 v4 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  id v5 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];
  CFStringRef v6 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
  int v7 = [v5 objectForKeyedSubscript:v6];
  [v3 setObject:v7 forKeyedSubscript:@"indicator"];

  exit_payload = (unsigned int *)self->_exit_payload;
  if (exit_payload)
  {
    uint64_t ers_code = self->_exit_snapshot->ers_code;
    if (ers_code == 3)
    {
      if (self->_exit_payload_length < 0x290) {
        goto LABEL_29;
      }
      unsigned int v74 = v3;
      v93[0] = @"version";
      uint64_t v32 = +[NSNumber numberWithUnsignedInt:*exit_payload];
      v94[0] = v32;
      v93[1] = @"state";
      CFStringRef v33 = +[NSNumber numberWithInt:exit_payload[1]];
      v94[1] = v33;
      v93[2] = @"target_state";
      unsigned int v34 = +[NSNumber numberWithInt:exit_payload[2]];
      v94[2] = v34;
      CFStringRef v35 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:3];
      id v10 = [v35 mutableCopy];

      uint64_t v77 = v10;
      v80 = v5;
      int v72 = self;
      if (exit_payload[3])
      {
        unsigned int v83 = +[NSMutableArray array];
        if (exit_payload[3])
        {
          unint64_t v36 = 0;
          uint64_t v37 = exit_payload + 6;
          do
          {
            v91[0] = @"version";
            uint64_t v38 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(v37 - 2), v72);
            v92[0] = v38;
            v91[1] = @"state_machine_old_state";
            uint64_t v39 = +[NSNumber numberWithInt:*v37];
            v92[1] = v39;
            v91[2] = @"event_previous_state";
            unint64_t v40 = +[NSNumber numberWithInt:v37[1]];
            v92[2] = v40;
            v91[3] = @"event_new_state";
            long long v41 = +[NSNumber numberWithInt:v37[2]];
            v92[3] = v41;
            v91[4] = @"started_time";
            long long v42 = +[NSNumber numberWithUnsignedLongLong:*((void *)v37 + 2)];
            v92[4] = v42;
            long long v43 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:5];
            [v83 addObject:v43];

            unsigned __int8 v4 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
            ++v36;
            v37 += 8;
          }
          while (v36 < exit_payload[3]);
        }
        id v10 = v77;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", v83, @"perform_event_history", v72);

        id v5 = v80;
        self = v72;
      }
      if (exit_payload[44])
      {
        unsigned int v84 = +[NSMutableArray array];
        if (exit_payload[44])
        {
          unint64_t v44 = 0;
          long long v45 = (uint64_t *)(exit_payload + 52);
          do
          {
            v89[0] = @"version";
            long long v46 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v45 - 6), v72);
            v90[0] = v46;
            v89[1] = @"environment_identifier";
            long long v47 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v45 - 4)];
            v90[1] = v47;
            v89[2] = @"new_state";
            long long v48 = +[NSNumber numberWithInt:*((unsigned int *)v45 - 3)];
            v90[2] = v48;
            v89[3] = @"pending_transition_state_count";
            CFStringRef v49 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v45 - 2)];
            v90[3] = v49;
            v89[4] = @"time";
            uint64_t v50 = *v45;
            v45 += 4;
            id v51 = +[NSNumber numberWithUnsignedLongLong:v50];
            v90[4] = v51;
            unint64_t v52 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:5];
            [v84 addObject:v52];

            unsigned __int8 v4 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
            ++v44;
          }
          while (v44 < exit_payload[44]);
        }
        id v10 = v77;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", v84, @"did_begin_update_history", v72);

        id v5 = v80;
        self = v72;
      }
      if (exit_payload[86])
      {
        BOOL v85 = +[NSMutableArray array];
        if (exit_payload[86])
        {
          unint64_t v53 = 0;
          uint64_t v54 = (uint64_t *)(exit_payload + 94);
          do
          {
            v87[0] = @"version";
            long long v55 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *((unsigned int *)v54 - 6), v72);
            v88[0] = v55;
            v87[1] = @"environment_identifier";
            long long v56 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v54 - 4)];
            v88[1] = v56;
            v87[2] = @"new_state";
            uint64_t v57 = +[NSNumber numberWithInt:*((unsigned int *)v54 - 3)];
            v88[2] = v57;
            v87[3] = @"pending_transition_state_count";
            uint64_t v58 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v54 - 2)];
            v88[3] = v58;
            v87[4] = @"time";
            uint64_t v59 = *v54;
            v54 += 4;
            v60 = +[NSNumber numberWithUnsignedLongLong:v59];
            v88[4] = v60;
            unint64_t v61 = [v4[360] dictionaryWithObjects:v88 forKeys:v87 count:5];
            [v85 addObject:v61];

            unsigned __int8 v4 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
            ++v53;
          }
          while (v53 < exit_payload[86]);
        }
        id v10 = v77;
        objc_msgSend(v77, "setObject:forKeyedSubscript:", v85, @"did_complete_update_history", v72);

        id v5 = v80;
        self = v72;
      }
      int v62 = -[OSACrashReport bls_environmentStateMachinePayload:](self, "bls_environmentStateMachinePayload:", exit_payload + 128, v72);
      [v10 setObject:v62 forKeyedSubscript:@"environmentStateMachine"];

      id v3 = v74;
      [v74 setObject:v10 forKeyedSubscript:@"operation_complete"];
      goto LABEL_28;
    }
    if (ers_code == 2)
    {
      if (self->_exit_payload_length < 0x14) {
        goto LABEL_29;
      }
      v95[0] = @"version";
      uint64_t v78 = +[NSNumber numberWithUnsignedInt:*exit_payload];
      v96[0] = v78;
      v95[1] = @"displayMode";
      int v86 = +[NSNumber numberWithInt:exit_payload[1]];
      v96[1] = v86;
      v95[2] = @"transitioningToDisplayMode";
      uint64_t v75 = +[NSNumber numberWithInt:exit_payload[2]];
      v96[2] = v75;
      v95[3] = @"lastSteadyStateDisplayMode";
      __int16 v63 = +[NSNumber numberWithInt:exit_payload[3]];
      v96[3] = v63;
      v95[4] = @"isFlipbookEnabled";
      +[NSNumber numberWithInt:-(exit_payload[4] & 1)];
      v65 = unint64_t v64 = v3;
      v96[4] = v65;
      v95[5] = @"showingBlankingWindow";
      +[NSNumber numberWithInt:(*((unsigned __int8 *)exit_payload + 16) << 30 >> 31)];
      long long v66 = v81 = v5;
      v96[5] = v66;
      v95[6] = @"backlightFactorOn";
      long long v67 = +[NSNumber numberWithInt:(*((unsigned __int8 *)exit_payload + 16) << 29 >> 31)];
      v96[6] = v67;
      v95[7] = @"isCABlanked";
      uint64_t v68 = +[NSNumber numberWithInt:(*((unsigned __int8 *)exit_payload + 16) << 28 >> 31)];
      v96[7] = v68;
      v95[8] = @"displayIsOff";
      unint64_t v69 = +[NSNumber numberWithInt:(*((unsigned __int8 *)exit_payload + 16) << 27 >> 31)];
      v96[8] = v69;
      int v70 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:9];
      [v64 setObject:v70 forKeyedSubscript:@"display"];

      id v10 = (id)v78;
      id v5 = v81;

      id v3 = v64;
      goto LABEL_28;
    }
    if (ers_code == 1 && self->_exit_payload_length >= 0x178)
    {
      uint64_t v79 = v5;
      int v73 = v3;
      id v10 = (id)objc_opt_new();
      uint64_t v11 = +[NSNumber numberWithUnsignedInt:*exit_payload];
      [v10 setObject:v11 forKeyedSubscript:@"version"];

      uint64_t v12 = [(OSACrashReport *)self bls_aggregatePayload:exit_payload + 1];
      [v10 setObject:v12 forKeyedSubscript:@"currentState"];

      uint64_t v13 = [(OSACrashReport *)self bls_aggregatePayload:exit_payload + 8];
      [v10 setObject:v13 forKeyedSubscript:@"targetState"];

      v103[0] = @"isNonNil";
      int v82 = +[NSNumber numberWithInt:-(exit_payload[16] & 1)];
      v104[0] = v82;
      v103[1] = @"updatedInitialState";
      uint64_t v76 = +[NSNumber numberWithInt:(*((unsigned __int8 *)exit_payload + 64) << 30 >> 31)];
      v104[1] = v76;
      v103[2] = @"triggerEvent_eventID";
      uint64_t v14 = +[NSNumber numberWithUnsignedLongLong:*((void *)exit_payload + 9)];
      v104[2] = v14;
      v103[3] = @"triggerEvent_state";
      uint64_t v15 = +[NSNumber numberWithInt:exit_payload[20]];
      v104[3] = v15;
      v103[4] = @"triggerEvent_previousState";
      +[NSNumber numberWithInt:exit_payload[21]];
      uint64_t v17 = v16 = self;
      v104[4] = v17;
      v103[5] = @"initialSpecifier_presentationDate";
      CFStringRef v18 = +[NSNumber numberWithDouble:*((double *)exit_payload + 11)];
      v104[5] = v18;
      v103[6] = @"initialSpecifier_presentationDate_num_specifiers";
      unsigned __int8 v19 = +[NSNumber numberWithUnsignedInt:exit_payload[24]];
      v104[6] = v19;
      id v20 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:7];
      [v10 setObject:v20 forKeyedSubscript:@"pendingEventToPerform"];

      id v21 = v16;
      CFStringRef v101 = @"isNonNil";
      uint64_t v22 = +[NSNumber numberWithInt:-(exit_payload[26] & 1)];
      uint64_t v102 = v22;
      CFStringRef v23 = +[NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      [v10 setObject:v23 forKeyedSubscript:@"pendingUpdatePresentation"];

      CFStringRef v99 = @"isNonNil";
      id v24 = +[NSNumber numberWithInt:-(exit_payload[27] & 1)];
      uint64_t v100 = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      [v10 setObject:v25 forKeyedSubscript:@"pendingUpdateToSpecifier"];

      v97[0] = @"isNonNil";
      id v26 = +[NSNumber numberWithInt:-(exit_payload[28] & 1)];
      v97[1] = @"displayMode";
      v98[0] = v26;
      id v27 = +[NSNumber numberWithInt:exit_payload[29]];
      v98[1] = v27;
      uint64_t v28 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
      [v10 setObject:v28 forKeyedSubscript:@"pendingUpdateDisplayMode"];

      uint64_t v29 = [(OSACrashReport *)v21 bls_environmentStateMachinePayload:exit_payload + 30];
      [v10 setObject:v29 forKeyedSubscript:@"environmentStateMachine"];

      if (*exit_payload >= 2)
      {
        uint64_t v30 = [(OSACrashReport *)v21 bls_backlightChangeEventPayload:exit_payload + 66];
        [v10 setObject:v30 forKeyedSubscript:@"queuedEventToPerform"];

        uint64_t v31 = [(OSACrashReport *)v21 bls_backlightChangeEventPayload:exit_payload + 80];
        [v10 setObject:v31 forKeyedSubscript:@"pendingPrewarmedEvent"];
      }
      id v3 = v73;
      [v73 setObject:v10 forKeyedSubscript:@"transition"];
      id v5 = v79;
LABEL_28:
    }
  }
LABEL_29:

  return v3;
}

- (void)decode_os_log_fault_payload
{
  if (!self->_new_payload && self->_exit_payload)
  {
    id v3 = (NSMutableDictionary *)objc_opt_new();
    new_payload = self->_new_payload;
    self->_new_payload = v3;

    exit_payload = (unsigned int *)self->_exit_payload;
    CFStringRef v6 = +[OSASystemConfiguration sharedInstance];
    unsigned int v7 = [v6 appleInternal];

    if (v7)
    {
      unint64_t v8 = [(OSACrashReport *)self safe_encoder:exit_payload[4]];
      if (v8)
      {
        [(NSMutableDictionary *)self->_new_payload setObject:v8 forKeyedSubscript:@"message"];
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missing input data for os_log_fault \"message\" string", buf, 2u);
      }
    }
    CFStringRef v9 = [(OSACrashReport *)self safe_encoder:exit_payload[3]];
    if (v9)
    {
      [(NSMutableDictionary *)self->_new_payload setObject:v9 forKeyedSubscript:@"category"];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missing input data for os_log_fault \"category\" string", v12, 2u);
    }
    id v10 = [(OSACrashReport *)self safe_encoder:exit_payload[2]];
    if (v10)
    {
      [(NSMutableDictionary *)self->_new_payload setObject:v10 forKeyedSubscript:@"subsystem"];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missing input data for os_log_fault \"subsystem\" string", v11, 2u);
    }
  }
}

- (id)safe_encoder:(unsigned int)a3
{
  if (!a3)
  {
LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
  unint64_t exit_payload_length = self->_exit_payload_length;
  if (exit_payload_length <= a3) {
    goto LABEL_8;
  }
  uint64_t v13 = a3;
  exit_payload = (const char *)self->_exit_payload;
  CFStringRef v6 = (char *)&exit_payload[a3];
  unsigned int v7 = exit_payload;
  while (*v6)
  {
LABEL_7:
    ++v6;
    LODWORD(exit_payload) = exit_payload + 1;
    if (v6 >= &v7[exit_payload_length]) {
      goto LABEL_8;
    }
  }
  size_t v8 = (exit_payload - v7);
  CFStringRef v9 = (char *)malloc_type_malloc((4 * v8) | 1, 0x74FDD8F7uLL);
  unsigned int v7 = (const char *)self->_exit_payload;
  if (!v9)
  {
    unint64_t exit_payload_length = self->_exit_payload_length;
    goto LABEL_7;
  }
  uint64_t v12 = v9;
  if (strnvisx(v9, (4 * v8) | 1, &v7[v13], v8, 18) == -1)
  {
    free(v12);
    goto LABEL_8;
  }
  id v10 = +[NSString stringWithUTF8String:v12];
  free(v12);
  if (!v10)
  {
LABEL_8:
    AnalyticsSendEventLazy();
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (id)create_os_fault_section
{
  id v3 = objc_opt_new();
  [v3 setObject:self->_procName forKeyedSubscript:@"process"];
  terminator_reason = self->_terminator_reason;
  if (terminator_reason) {
    [v3 setObject:terminator_reason forKeyedSubscript:@"format"];
  }
  [(OSACrashReport *)self decode_os_log_fault_payload];
  id v5 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"message"];

  if (v5)
  {
    CFStringRef v6 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"message"];
    [v3 setObject:v6 forKeyedSubscript:@"message"];
  }
  unsigned int v7 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"category"];
  [v3 setObject:v7 forKeyedSubscript:@"category"];

  size_t v8 = [(NSMutableDictionary *)self->_new_payload objectForKeyedSubscript:@"subsystem"];
  [v3 setObject:v8 forKeyedSubscript:@"subsystem"];

  return v3;
}

- (id)decode_reason
{
  id v3 = objc_opt_new();
  unsigned __int8 v4 = [(OSACrashReport *)self decode_reasonNamespace];
  if (self->_terminator_reason)
  {
    id v5 = +[OSASystemConfiguration sharedInstance];
    if (([v5 appleInternal] & 1) != 0
      || ((uint32_t ers_namespace = self->_exit_snapshot->ers_namespace, ers_namespace <= 0x16)
        ? (BOOL v7 = ((1 << ers_namespace) & 0x700440) == 0)
        : (BOOL v7 = 1),
          !v7))
    {

LABEL_8:
      size_t v8 = [(NSString *)self->_terminator_reason componentsSeparatedByString:@"\n"];
      CFStringRef v9 = [v8 valueForKey:@"stringByTrimming"];
      id v10 = +[NSPredicate predicateWithFormat:@"SELF != ''"];
      uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];
      [v3 setObject:v11 forKeyedSubscript:@"reasons"];

      goto LABEL_9;
    }

    if (ers_namespace == 39) {
      goto LABEL_8;
    }
  }
LABEL_9:
  if (self->_exit_snapshot)
  {
    [v3 setObject:v4 forKeyedSubscript:@"namespace"];
    uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_code];
    [v3 setObject:v12 forKeyedSubscript:@"code"];

    uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:self->_exit_snapshot->ers_flags];
    [v3 setObject:v13 forKeyedSubscript:@"flags"];

    exit_snapshot = self->_exit_snapshot;
    if ((exit_snapshot->ers_flags & 0x10) != 0)
    {
      id v20 = v4;
      AnalyticsSendEventLazy();

      exit_snapshot = self->_exit_snapshot;
    }
    switch(exit_snapshot->ers_namespace)
    {
      case 2u:
        uint64_t v15 = +[NSString stringWithFormat:@"%s", strsignal(exit_snapshot->ers_code)];
        [v3 setObject:v15 forKeyedSubscript:@"indicator"];
        goto LABEL_33;
      case 3u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonCodeSigning];
        goto LABEL_32;
      case 6u:
        [(OSACrashReport *)self decode_reasonDyldWithInfo:v3];
        break;
      case 7u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonLibxpc];
        goto LABEL_32;
      case 9u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonExec];
        goto LABEL_32;
      case 0xAu:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonCarousel];
        goto LABEL_32;
      case 0xBu:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonTcc];
        goto LABEL_32;
      case 0xDu:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonCoreAnimation];
        goto LABEL_32;
      case 0x12u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonLibSystem];
        goto LABEL_32;
      case 0x14u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonWatchdog];
        goto LABEL_32;
      case 0x15u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonMetal];
        goto LABEL_32;
      case 0x16u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonWatchKit];
        goto LABEL_32;
      case 0x19u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonSandbox];
        goto LABEL_32;
      case 0x1Du:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonBTC];
        goto LABEL_32;
      case 0x1Eu:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonPortSpace];
        goto LABEL_32;
      case 0x20u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonBacklightServices];
        goto LABEL_32;
      case 0x22u:
        uint64_t v16 = [(OSACrashReport *)self decode_reasonRosetta];
LABEL_32:
        uint64_t v15 = (void *)v16;
        [v3 addEntriesFromDictionary:v16];
LABEL_33:

        break;
      default:
        break;
    }
  }
  if (self->_terminator_pid)
  {
    uint64_t v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v3 setObject:v17 forKeyedSubscript:@"byPid"];

    terminator_proc = self->_terminator_proc;
    if (terminator_proc) {
      [v3 setObject:terminator_proc forKeyedSubscript:@"byProc"];
    }
  }

  return v3;
}

- (id)decode_ubsanCode:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v4 = a3;
  id v5 = +[NSString stringWithFormat:@"unknown (0x%02x)", a3];
  if ((unint64_t)[&off_10003D558 count] <= v3)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [&off_10003D558 objectAtIndexedSubscript:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (id)decode_esr:(unsigned int *)a3 exceptionStateCount:(unsigned int)a4
{
  if (a4)
  {
    id v6 = objc_opt_new();
    BOOL v7 = v6;
    unint64_t v8 = a3[2];
    switch(v8 >> 26)
    {
      case ' ':
      case '!':
        [v6 setString:@"(Instruction Abort)"];
        if ((v8 & 0x1000000) == 0) {
          goto LABEL_11;
        }
        goto LABEL_13;
      case '""':
        CFStringRef v11 = @"(PC alignment)";
        goto LABEL_23;
      case '#':
        goto LABEL_18;
      case '$':
      case '%':
        [v6 setString:@"(Data Abort)"];
        if ((v8 & 0x1000000) != 0)
        {
LABEL_13:
          CFStringRef v10 = @" No valid info";
          goto LABEL_19;
        }
        [v7 appendFormat:*(&off_100035410 + ((v8 >> 22) & 3))];
        if ((v8 & 0x40) != 0) {
          CFStringRef v9 = @" write";
        }
        else {
          CFStringRef v9 = @" read";
        }
        [v7 appendFormat:v9];
LABEL_11:
        switch(v8 & 0x2F)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
            goto LABEL_18;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            CFStringRef v10 = @" Translation fault";
            goto LABEL_19;
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
            CFStringRef v10 = @" Access flag fault";
            goto LABEL_19;
          case 0xDuLL:
          case 0xEuLL:
          case 0xFuLL:
            CFStringRef v10 = @" Permission fault";
            goto LABEL_19;
          case 0x21uLL:
            CFStringRef v10 = @" Alignment fault";
            goto LABEL_19;
          default:
            goto LABEL_24;
        }
        break;
      case '&':
        CFStringRef v11 = @"(Stack alignment)";
LABEL_23:
        [v6 setString:v11];
        break;
      default:
        if (v8 >> 26 != 60)
        {
LABEL_18:
          CFStringRef v10 = @" Address size fault";
LABEL_19:
          objc_msgSend(v7, "appendFormat:", v10, v14);
          break;
        }
        [v6 setString:@"(Breakpoint)"];
        if ((v8 & 0xFFFC) == 0xC470)
        {
          [v7 appendFormat:@" pointer authentication trap"];
          switch(v8 & 3)
          {
            case 1uLL:
              CFStringRef v10 = @" IB";
              break;
            case 2uLL:
              CFStringRef v10 = @" DA";
              break;
            case 3uLL:
              CFStringRef v10 = @" DB";
              break;
            default:
              CFStringRef v10 = @" IA";
              break;
          }
          goto LABEL_19;
        }
        if ((v8 & 0x1FFFF) == 0x5519)
        {
          CFStringRef v10 = @" -fbounds-safety trap";
          goto LABEL_19;
        }
        if ((v8 & 0x1FF00) == 0x5500)
        {
          uint64_t v13 = [(OSACrashReport *)self decode_ubsanCode:v8];
          [v7 appendFormat:@" UBSAN %@", v13];
        }
        else
        {
          objc_msgSend(v7, "appendFormat:", @" brk %d", v8 & 0x1FFFFFF);
        }
        break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_24:

  return v7;
}

- (id)decode_threadState:(unsigned int *)a3 threadStateCount:(unsigned int)a4 threadStateFlavor:(int)a5 threadPort:(unsigned int)a6 exceptionState:(unsigned int)a7[1296] exceptionStateCount:(unsigned int)a8 withSymbolicator:(_CSTypeRef)a9 usingCatalog:(id)a10
{
  uint64_t v10 = *(void *)&a5;
  id v14 = a10;
  id v15 = -[OSACrashReport _getObjCReadOnlyRange:](self, "_getObjCReadOnlyRange:", a9.var0, a9.var1);
  uint64_t v17 = 0;
  if (!a4 || v10 == 5) {
    goto LABEL_35;
  }
  id v18 = v15;
  uint64_t v19 = v16;
  id v20 = objc_opt_new();
  uint64_t v17 = v20;
  if (v10 != 6)
  {
    if (v10 != 1) {
      goto LABEL_33;
    }
    a3 += 2;
  }
  unsigned int v21 = a3[67];
  uint64_t v22 = *((void *)a3 + 32);
  if ((v21 & 1) == 0) {
    uint64_t v22 = *((void *)a3 + 32);
  }
  *((void *)a3 + 32) = v22;
  uint64_t v23 = *((void *)a3 + 30);
  if ((v21 & 3) == 0) {
    uint64_t v23 = *((void *)a3 + 30);
  }
  *((void *)a3 + 30) = v23;
  if ((v21 & 1) == 0) {
    *((void *)a3 + 31) = *((void *)a3 + 31);
  }
  *((void *)a3 + 29) = *((void *)a3 + 29);
  BOOL isTranslated = self->_isTranslated;
  a3[67] = v21 & 0xFFFFFFF2 | 1;
  BOOL v85 = v20;
  if (isTranslated && self->_cpuType == 16777223 && !self->_isCrashInRosettaRuntime)
  {
    [v20 setObject:@"x86_THREAD_STATE" forKeyedSubscript:@"flavor"];
    unint64_t v53 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *(void *)a3, v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v53 forKeyedSubscript:@"rax"];

    uint64_t v54 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 3), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v54 forKeyedSubscript:@"rbx"];

    long long v55 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 1), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v55 forKeyedSubscript:@"rcx"];

    long long v56 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 2), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v56 forKeyedSubscript:@"rdx"];

    uint64_t v57 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 7), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v57 forKeyedSubscript:@"rdi"];

    uint64_t v58 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 6), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v58 forKeyedSubscript:@"rsi"];

    uint64_t v59 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 5), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v59 forKeyedSubscript:@"rbp"];

    v60 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 4), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v60 forKeyedSubscript:@"rsp"];

    unint64_t v61 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 8), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v61 forKeyedSubscript:@"r8"];

    int v62 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 9), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v62 forKeyedSubscript:@"r9"];

    __int16 v63 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 10), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v63 forKeyedSubscript:@"r10"];

    unint64_t v64 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 11), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v64 forKeyedSubscript:@"r11"];

    id v65 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 12), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v65 forKeyedSubscript:@"r12"];

    long long v66 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 13), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v66 forKeyedSubscript:@"r13"];

    long long v67 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 14), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v67 forKeyedSubscript:@"r14"];

    uint64_t v68 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *((void *)a3 + 15), v18, v19, a9.var0, a9.var1, v14);
    [v17 setObject:v68 forKeyedSubscript:@"r15"];

    uint64_t v69 = *((void *)a3 + 32);
    if (!v69 || (a3[67] & 1) != 0)
    {
      int v70 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
      int v71 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }
    else
    {
      int v70 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
      int v71 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }
    if (v69 == self->_translatedPC)
    {
      CFStringRef v114 = @"value";
      uint64_t v76 = [v71[366] numberWithUnsignedLongLong:self->_x86RIP];
      unint64_t v115 = v76;
      uint64_t v77 = [v70[360] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      [v17 setObject:v77 forKeyedSubscript:@"rip"];
    }
    if (&_rosetta_get_rflags)
    {
      CFStringRef v112 = @"value";
      uint64_t v78 = [v71[366] numberWithUnsignedLongLong:rosetta_get_rflags()];
      size_t v113 = v78;
      uint64_t v79 = [v70[360] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      [v17 setObject:v79 forKeyedSubscript:@"rflags"];
    }
    v110[0] = @"tmp0";
    CFStringRef v108 = @"value";
    id v25 = [v71[366] numberWithUnsignedLongLong:*((void *)a3 + 22)];
    uint64_t v109 = v25;
    id v49 = [v70[360] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
    v111[0] = v49;
    v110[1] = @"tmp1";
    CFStringRef v106 = @"value";
    uint64_t v50 = [v71[366] numberWithUnsignedLongLong:*((void *)a3 + 23)];
    unsigned int v107 = v50;
    v80 = [v70[360] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v111[1] = v80;
    v110[2] = @"tmp2";
    CFStringRef v104 = @"value";
    uint64_t v81 = [v71[366] numberWithUnsignedLongLong:*((void *)a3 + 24)];
    uint64_t v105 = v81;
    int v82 = [v70[360] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    v111[2] = v82;
    unsigned int v83 = [v70[360] dictionaryWithObjects:v111 forKeys:v110 count:3];
    [v85 setObject:v83 forKeyedSubscript:@"rosetta"];

    uint64_t v17 = v85;
  }
  else
  {
    uint64_t v84 = v10;
    [v20 setObject:@"ARM_THREAD_STATE64" forKeyedSubscript:@"flavor"];
    id v25 = objc_opt_new();
    for (uint64_t i = 0; i != 58; i += 2)
    {
      id v27 = -[OSACrashReport _symbolicateRegister:inRange:withSymbolicator:usingCatalog:](self, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:", *(void *)&a3[i], v18, v19, a9.var0, a9.var1, v14);
      [v25 addObject:v27];
    }
    uint64_t v17 = v85;
    [v85 setObject:v25 forKeyedSubscript:@"x"];
    CFStringRef v102 = @"value";
    if (*((void *)a3 + 29)) {
      uint64_t v28 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }
    else {
      uint64_t v28 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }
    uint64_t v29 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
    int v103 = v29;
    uint64_t v30 = [v28[360] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    [v85 setObject:v30 forKeyedSubscript:@"fp"];

    if (self->_isTranslated && self->_cpuType == 16777228 && !self->_isCrashInRosettaRuntime)
    {
      int v72 = sub_100008854(self->_task, *((void *)a3 + 18) + 320, 8uLL);
      uint64_t v31 = v28;
      if (v72)
      {
        int v73 = v72;
        CFStringRef v100 = @"value";
        unsigned int v74 = +[NSNumber numberWithUnsignedLongLong:*v72];
        CFStringRef v101 = v74;
        uint64_t v75 = [v28[360] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        [v85 setObject:v75 forKeyedSubscript:@"lr"];

        uint64_t v17 = v85;
        free(v73);
      }
    }
    else
    {
      CFStringRef v98 = @"value";
      uint64_t v31 = v28;
      uint64_t v32 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
      CFStringRef v99 = v32;
      CFStringRef v33 = [v28[360] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      [v85 setObject:v33 forKeyedSubscript:@"lr"];
    }
    unint64_t v34 = *((void *)a3 + 31);
    if (HIWORD(v34))
    {
      CFStringRef v35 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      unint64_t v36 = +[NSString stringWithFormat:@"SP register contains suspicious bits (0x%llX)", v34];
      [v35 addObject:v36];

      uint64_t v17 = v85;
    }
    CFStringRef v96 = @"value";
    uint64_t v37 = +[NSNumber numberWithUnsignedLongLong:v34];
    unsigned int v97 = v37;
    uint64_t v38 = [v31[360] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    [v17 setObject:v38 forKeyedSubscript:@"sp"];

    CFStringRef v94 = @"value";
    uint64_t v39 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
    uint64_t v95 = v39;
    unint64_t v40 = [v31[360] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    [v17 setObject:v40 forKeyedSubscript:@"pc"];

    CFStringRef v92 = @"value";
    long long v41 = +[NSNumber numberWithUnsignedInt:a3[66]];
    uint64_t v93 = v41;
    long long v42 = [v31[360] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    [v17 setObject:v42 forKeyedSubscript:@"cpsr"];

    if (!a8)
    {
      uint64_t v10 = v84;
      goto LABEL_32;
    }
    uint64_t v43 = a7[2];
    uint64_t v44 = *(void *)a7;
    CFStringRef v90 = @"value";
    long long v45 = +[NSNumber numberWithUnsignedLongLong:v44];
    v91 = v45;
    long long v46 = [v31[360] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    [v17 setObject:v46 forKeyedSubscript:@"far"];

    CFStringRef v88 = @"value";
    long long v47 = +[NSNumber numberWithUnsignedInt:v43];
    unint64_t v89 = v47;
    long long v48 = [v31[360] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
    id v49 = [v48 mutableCopy];

    uint64_t v50 = [(OSACrashReport *)self decode_esr:a7 exceptionStateCount:a8];
    if ([v50 length]) {
      [v49 setObject:v50 forKeyedSubscript:@"description"];
    }
    [v17 setObject:v49 forKeyedSubscript:@"esr"];
    uint64_t v10 = v84;
  }

LABEL_32:
LABEL_33:
  if (!v17)
  {
    id v51 = +[NSString stringWithFormat:@"%d", v10];
    [0 setObject:v51 forKeyedSubscript:@"flavor"];
  }
LABEL_35:

  return v17;
}

- (id)decode_crashingThreadStateWithSymbolicator:(_CSTypeRef)a3 usingCatalog:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v7 = a4;
  if (self->_crashedThreadNumber < 0
    || (unint64_t)[(NSMutableArray *)self->_threadInfos count] <= self->_crashedThreadNumber)
  {
    CFStringRef v9 = 0;
  }
  else
  {
    unint64_t v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:");
    CFStringRef v9 = [v8 objectForKeyedSubscript:@"threadState"];

    if (![v9 count])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Falling back to fetching thread state from stored values", buf, 2u);
      }
      uint64_t v10 = -[OSACrashReport decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:](self, "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:", self->_threadState, self->_threadStateCount, self->_threadStateFlavor, self->_threadPortOriginal, self->_exceptionState, self->_exceptionStateCount, var0, var1, v7);

      CFStringRef v9 = (void *)v10;
    }
    CFStringRef v11 = [(NSMutableArray *)self->_threadInfos objectAtIndexedSubscript:self->_crashedThreadNumber];
    id v12 = [v11 objectForKeyedSubscript:@"frames"];

    if (![v12 count]) {
      goto LABEL_12;
    }
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    usedImages = self->_usedImages;
    id v15 = [v13 objectForKeyedSubscript:@"imageIndex"];
    uint64_t v16 = -[NSArray objectAtIndex:](usedImages, "objectAtIndex:", (int)[v15 intValue]);

    uint64_t v17 = [v16 objectForKeyedSubscript:@"base"];
    id v18 = (char *)[v17 longLongValue];
    uint64_t v19 = [v13 objectForKeyedSubscript:@"imageOffset"];
    id v20 = [v19 longLongValue];

    if (v9)
    {
      unsigned int v21 = &v18[(void)v20];
      if (&v18[(void)v20])
      {
        uint64_t v22 = [v9 objectForKeyedSubscript:@"pc"];
        uint64_t v23 = [v22 objectForKeyedSubscript:@"value"];
        id v24 = (char *)[v23 longLongValue];

        id v25 = [v9 objectForKeyedSubscript:@"pc"];
        id v12 = [v25 mutableCopy];

        id v26 = +[NSNumber numberWithInt:v21 == v24];
        [v12 setObject:v26 forKeyedSubscript:@"matchesCrashFrame"];

        [v9 setObject:v12 forKeyedSubscript:@"pc"];
        if (v21 != v24)
        {
          id v27 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
          uint64_t v28 = +[NSString stringWithFormat:@"%s register does not match crashing frame (0x%llX vs 0x%llX)", "PC", v24, v21];
          [v27 addObject:v28];
        }
LABEL_12:
      }
    }
  }

  return v9;
}

- (id)decode_threadState:(unsigned int)a3 withSymbolicator:(_CSTypeRef)a4 usingCatalog:(id)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  uint64_t v7 = *(void *)&a3;
  id v9 = a5;
  mach_msg_type_number_t old_stateCnt = 68;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)old_uint64_t state = 0u;
  *(void *)uint64_t v17 = 0;
  uint64_t v18 = 0;
  mach_msg_type_number_t v16 = 4;
  uint64_t state = thread_get_state(v7, 6, old_state, &old_stateCnt);
  if (state)
  {
    CFStringRef v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    +[NSString stringWithFormat:@"thread_get_state(THREAD) returned 0x%x: %s", state, mach_error_string(state)];
    uint64_t v13 = LABEL_5:;
    [v11 addObject:v13];

    id v14 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = thread_get_state(v7, 7, v17, &v16);
  if (v12)
  {
    CFStringRef v11 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
    +[NSString stringWithFormat:@"thread_get_state(EXCEPTION) returned 0x%x: %s", v12, mach_error_string(v12)];
    goto LABEL_5;
  }
  id v14 = -[OSACrashReport decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:](self, "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:", old_state, old_stateCnt, 6, v7, v17, v16, var0, var1, v9);
LABEL_6:

  return v14;
}

- (id)_symbolicateRegister:(unint64_t)a3 inRange:(_CSRange)a4 withSymbolicator:(_CSTypeRef)a5 usingCatalog:(id)a6
{
  unint64_t var1 = a5.var1;
  unint64_t var0 = a5.var0;
  unint64_t v8 = a4.var1;
  unint64_t v9 = a4.var0;
  id v12 = a6;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_1000162F4;
  long long v23 = sub_100016304;
  CFStringRef v25 = @"value";
  uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:a3];
  long long v26 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  id v24 = [v14 mutableCopy];

  if (a3 - v9 < v8)
  {
    id v15 = [(OSACrashReport *)self _readStringAtTaskAddress:a3 maxLength:0 immutableCheck:0];
    [(id)v20[5] setObject:v15 forKeyedSubscript:@"objc-selector"];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001630C;
  v18[3] = &unk_1000351B8;
  v18[4] = &v19;
  -[OSACrashReport symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:](self, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:", a3, a3, var0, var1, v12, v18);
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (_CSRange)_getObjCReadOnlyRange:(_CSTypeRef)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v12 = &unk_100032966;
  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) == 0)
    {
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x2020000000;
      char v8 = 0;
      CSSymbolOwnerForeachSegment();
      _Block_object_dispose(v7, 8);
    }
  }
  unint64_t v3 = v10[4];
  unint64_t v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  unint64_t v5 = v3;
  unint64_t v6 = v4;
  result.unint64_t var1 = v6;
  result.unint64_t var0 = v5;
  return result;
}

- (BOOL)isExceptionNonFatal
{
  int exceptionType = self->_exceptionType;
  if (exceptionType == 12) {
    return (unint64_t)*self->_exceptionCode >> 61 == 3;
  }
  if (exceptionType != 11 || self->_exit_snapshot) {
    return 0;
  }
  unint64_t v4 = *self->_exceptionCode;
  return v4 >> 61 != 1 || (v4 & 0x1C00000000000000) != 0x800000000000000;
}

- (id)getTrialCache
{
  if (qword_100043018 != -1) {
    dispatch_once(&qword_100043018, &stru_1000351D8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000166B0;
  block[3] = &unk_100034E20;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_100043010, block);
  return (id)qword_100043008;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  unint64_t v5 = (void (**)(id, void *))a4;
  [(OSACrashReport *)self stashStatus:@"Persisting" note:0];
  unint64_t v6 = +[OSASystemConfiguration sharedInstance];
  unsigned int v198 = [v6 appleInternal];

  v332[0] = @"incident";
  v196 = [(OSACrashReport *)self incidentID];
  v333[0] = v196;
  v333[1] = &off_10003D078;
  v332[1] = @"version";
  v332[2] = @"deployVersion";
  v333[2] = &off_10003D408;
  v332[3] = @"modelCode";
  v194 = +[OSASystemConfiguration sharedInstance];
  v192 = [v194 modelCode];
  v333[3] = v192;
  v332[4] = @"pid";
  v190 = +[NSNumber numberWithInt:self->_proc_id];
  v333[4] = v190;
  v332[5] = @"cpuType";
  v189 = [(OSACrashReport *)self decode_cpuType];
  v333[5] = v189;
  v332[6] = @"translated";
  v188 = +[NSNumber numberWithBool:self->_isTranslated];
  v333[6] = v188;
  v332[7] = @"procRole";
  uint64_t task_role = self->_task_role;
  if (task_role > 7) {
    CFStringRef v8 = @"unknown";
  }
  else {
    CFStringRef v8 = *(&off_100035430 + task_role);
  }
  v333[7] = v8;
  v332[8] = @"coalitionID";
  v187 = +[NSNumber numberWithUnsignedLongLong:self->_coalition_id];
  v333[8] = v187;
  v332[9] = @"osVersion";
  v331[0] = &__kCFBooleanTrue;
  v330[0] = @"isEmbedded";
  v330[1] = @"train";
  v186 = +[OSASystemConfiguration sharedInstance];
  v185 = [v186 osTrain];
  v331[1] = v185;
  v330[2] = @"build";
  v184 = +[OSASystemConfiguration sharedInstance];
  v183 = [v184 buildVersion];
  v331[2] = v183;
  v330[3] = @"releaseType";
  v182 = +[OSASystemConfiguration sharedInstance];
  uint64_t v9 = [v182 releaseType];
  v331[3] = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v331 forKeys:v330 count:4];
  v333[9] = v10;
  v332[10] = @"captureTime";
  uint64_t v11 = OSADateFormat();
  v333[10] = v11;
  v332[11] = @"uptime";
  id v12 = [(id)objc_opt_class() reduceToTwoSigFigures:self->_awakeSystemUptime];
  v333[11] = v12;
  v332[12] = @"userID";
  uint64_t v13 = +[NSNumber numberWithUnsignedInt:self->_uid];
  v333[12] = v13;
  v332[13] = @"codeSigningMonitor";
  uint64_t v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [(id)objc_opt_class() codeSigningMonitor]);
  v333[13] = v14;
  id v15 = +[NSDictionary dictionaryWithObjects:v333 forKeys:v332 count:14];
  v5[2](v5, v15);

  id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  uint64_t v17 = [(OSACrashReport *)self problemType];
  uint64_t v18 = +[OSALog commonFieldsForBody:v17];
  v5[2](v5, v18);

  if (self->_proc_starttime.tv_sec >= 1)
  {
    CFStringRef v328 = @"procLaunch";
    uint64_t v19 = OSADateFormat();
    v329 = v19;
    long long v20 = +[NSDictionary dictionaryWithObjects:&v329 forKeys:&v328 count:1];
    v5[2](v5, v20);
  }
  if (self->_proc_start_abstime)
  {
    CFStringRef v326 = @"procStartAbsTime";
    uint64_t v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    v327 = v21;
    long long v22 = +[NSDictionary dictionaryWithObjects:&v327 forKeys:&v326 count:1];
    v5[2](v5, v22);
  }
  if (self->_proc_exit_abstime)
  {
    CFStringRef v324 = @"procExitAbsTime";
    long long v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    v325 = v23;
    id v24 = +[NSDictionary dictionaryWithObjects:&v325 forKeys:&v324 count:1];
    v5[2](v5, v24);
  }
  if ([(NSString *)self->_procName length])
  {
    CFStringRef v322 = @"procName";
    CFStringRef procName = self->_procName;
    CFStringRef v25 = +[NSDictionary dictionaryWithObjects:&procName forKeys:&v322 count:1];
    v5[2](v5, v25);
  }
  if ([(NSString *)self->_procPath length])
  {
    long long v26 = self->_procPath;
    CFStringRef v320 = @"procPath";
    v321 = v26;
    long long v27 = +[NSDictionary dictionaryWithObjects:&v321 forKeys:&v320 count:1];
    v5[2](v5, v27);
  }
  if ([(NSDictionary *)self->_bundle_info count])
  {
    CFStringRef v318 = @"bundleInfo";
    bundle_mach_timebase_info info = self->_bundle_info;
    long long v28 = +[NSDictionary dictionaryWithObjects:&bundle_info forKeys:&v318 count:1];
    v5[2](v5, v28);
  }
  if ([(NSDictionary *)self->_build_info count])
  {
    CFStringRef v316 = @"buildInfo";
    build_mach_timebase_info info = self->_build_info;
    long long v29 = +[NSDictionary dictionaryWithObjects:&build_info forKeys:&v316 count:1];
    v5[2](v5, v29);
  }
  if ([(NSDictionary *)self->_store_info count])
  {
    CFStringRef v314 = @"storeInfo";
    store_mach_timebase_info info = self->_store_info;
    long long v30 = +[NSDictionary dictionaryWithObjects:&store_info forKeys:&v314 count:1];
    v5[2](v5, v30);
  }
  if ([(NSString *)self->_parentProcessName length])
  {
    CFStringRef v312 = @"parentProc";
    parentProcessuint64_t Name = self->_parentProcessName;
    long long v31 = +[NSDictionary dictionaryWithObjects:&parentProcessName forKeys:&v312 count:1];
    v5[2](v5, v31);
  }
  if (self->_ppid)
  {
    CFStringRef v310 = @"parentPid";
    long long v32 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    v311 = v32;
    long long v33 = +[NSDictionary dictionaryWithObjects:&v311 forKeys:&v310 count:1];
    v5[2](v5, v33);
  }
  if ([(NSString *)self->_coalition_name length])
  {
    CFStringRef v308 = @"coalitionName";
    coalition_unsigned int name = self->_coalition_name;
    long long v34 = +[NSDictionary dictionaryWithObjects:&coalition_name forKeys:&v308 count:1];
    v5[2](v5, v34);
  }
  if (self->_is_beta)
  {
    v5[2](v5, &off_10003CF58);
  }
  else
  {
    CFStringRef v306 = @"crashReporterKey";
    long long v35 = +[OSASystemConfiguration sharedInstance];
    unint64_t v36 = [v35 crashReporterKey];
    v307 = v36;
    uint64_t v37 = +[NSDictionary dictionaryWithObjects:&v307 forKeys:&v306 count:1];
    v5[2](v5, v37);
  }
  if ([(id)objc_opt_class() isInLDM]) {
    v5[2](v5, &off_10003CF80);
  }
  uint64_t v38 = +[NSProcessInfo processInfo];
  unsigned int v39 = [v38 isLowPowerModeEnabled];

  if (v39) {
    v5[2](v5, &off_10003CFA8);
  }
  unint64_t v40 = [(OSACrashReport *)self problemType];
  unsigned int v41 = [v40 isEqualToString:@"309"];

  if (v41)
  {
    long long v42 = +[GenerativeModelsState getGMAvailability];
    if ([v42 count])
    {
      CFStringRef v304 = @"appleIntelligenceStatus";
      v305 = v42;
      uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v305 forKeys:&v304 count:1];
      v5[2](v5, v43);
    }
  }
  device_lock_uint64_t state = self->_device_lock_state;
  if ((device_lock_state & 0x80000000) == 0 && device_lock_state != 3)
  {
    int device_unlocked_since_boot = self->_device_unlocked_since_boot;
    if ((device_unlocked_since_boot & 0x80000000) == 0)
    {
      CFStringRef v302 = @"wasUnlockedSinceBoot";
      long long v46 = +[NSNumber numberWithInt:device_unlocked_since_boot != 0];
      v303 = v46;
      long long v47 = +[NSDictionary dictionaryWithObjects:&v303 forKeys:&v302 count:1];
      v5[2](v5, v47);

      device_lock_uint64_t state = self->_device_lock_state;
    }
    CFStringRef v300 = @"isLocked";
    long long v48 = +[NSNumber numberWithInt:device_lock_state == 1];
    v301 = v48;
    id v49 = +[NSDictionary dictionaryWithObjects:&v301 forKeys:&v300 count:1];
    v5[2](v5, v49);
  }
  if (v198)
  {
    uint64_t v50 = (void *)MGCopyAnswer();
    v299[0] = v50;
    v298[0] = @"codeName";
    v298[1] = @"systemID";
    id v51 = +[OSASystemConfiguration sharedInstance];
    unint64_t v52 = [v51 systemId];
    v299[1] = v52;
    unint64_t v53 = +[NSDictionary dictionaryWithObjects:v299 forKeys:v298 count:2];
    v5[2](v5, v53);

    uint64_t v54 = +[OSASystemConfiguration sharedInstance];
    long long v55 = [v54 automatedDeviceGroup];

    if (v55)
    {
      CFStringRef v296 = @"AutomatedDeviceGroup";
      v297 = v55;
      long long v56 = +[NSDictionary dictionaryWithObjects:&v297 forKeys:&v296 count:1];
      v5[2](v5, v56);
    }
  }
  int responsible_pid = self->_responsible_pid;
  if (responsible_pid && responsible_pid != self->_proc_id)
  {
    if (self->_responsibleProc)
    {
      v294[0] = @"responsiblePid";
      uint64_t v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v294[1] = @"responsibleProc";
      responsibleProc = self->_responsibleProc;
      v295[0] = v58;
      v295[1] = responsibleProc;
      v60 = (void **)v295;
      unint64_t v61 = (const __CFString **)v294;
      uint64_t v62 = 2;
    }
    else
    {
      CFStringRef v292 = @"responsiblePid";
      uint64_t v58 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v293 = v58;
      v60 = &v293;
      unint64_t v61 = &v292;
      uint64_t v62 = 1;
    }
    __int16 v63 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v61 count:v62];
    v5[2](v5, v63);
  }
  if (self->_consecutiveCrashCount)
  {
    CFStringRef v290 = @"consecutiveCrashCount";
    unint64_t v64 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    v291 = v64;
    id v65 = +[NSDictionary dictionaryWithObjects:&v291 forKeys:&v290 count:1];
    v5[2](v5, v65);
  }
  if (self->_throttleTimeout)
  {
    CFStringRef v288 = @"throttleTimeout";
    long long v66 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    v289 = v66;
    long long v67 = +[NSDictionary dictionaryWithObjects:&v289 forKeys:&v288 count:1];
    v5[2](v5, v67);
  }
  cs_signing_id = self->_cs_signing_id;
  if (cs_signing_id)
  {
    CFStringRef v286 = @"codeSigningID";
    v287 = cs_signing_id;
    uint64_t v69 = +[NSDictionary dictionaryWithObjects:&v287 forKeys:&v286 count:1];
    v5[2](v5, v69);
  }
  cs_team_id = self->_cs_team_id;
  if (cs_team_id)
  {
    CFStringRef v284 = @"codeSigningTeamID";
    v285 = cs_team_id;
    int v71 = +[NSDictionary dictionaryWithObjects:&v285 forKeys:&v284 count:1];
    v5[2](v5, v71);
  }
  if (self->_cs_status)
  {
    CFStringRef v282 = @"codeSigningFlags";
    int v72 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    v283 = v72;
    int v73 = +[NSDictionary dictionaryWithObjects:&v283 forKeys:&v282 count:1];
    v5[2](v5, v73);
  }
  CFStringRef v280 = @"codeSigningValidationCategory";
  unsigned int v74 = +[NSNumber numberWithUnsignedInt:self->_cs_validation_category];
  v281 = v74;
  uint64_t v75 = +[NSDictionary dictionaryWithObjects:&v281 forKeys:&v280 count:1];
  v5[2](v5, v75);

  CFStringRef v278 = @"codeSigningTrustLevel";
  uint64_t v76 = +[NSNumber numberWithUnsignedInt:self->_cs_trust_level];
  v279 = v76;
  uint64_t v77 = +[NSDictionary dictionaryWithObjects:&v279 forKeys:&v278 count:1];
  v5[2](v5, v77);

  if (self->_pc_bytes)
  {
    v276[0] = @"beforePC";
    uint64_t v78 = [(NSData *)self->_pc_bytes_before base64EncodedStringWithOptions:0];
    v277[0] = v78;
    v276[1] = @"atPC";
    uint64_t v79 = [(NSData *)self->_pc_bytes base64EncodedStringWithOptions:0];
    v277[1] = v79;
    v80 = +[NSDictionary dictionaryWithObjects:v277 forKeys:v276 count:2];

    CFStringRef v274 = @"instructionByteStream";
    v275 = v80;
    uint64_t v81 = +[NSDictionary dictionaryWithObjects:&v275 forKeys:&v274 count:1];
    v5[2](v5, v81);
  }
  uint64_t v82 = [(id)objc_opt_class() bootSessionUUID];
  unsigned int v83 = (void *)v82;
  if (v82)
  {
    CFStringRef v272 = @"bootSessionUUID";
    uint64_t v273 = v82;
    uint64_t v84 = +[NSDictionary dictionaryWithObjects:&v273 forKeys:&v272 count:1];
    v5[2](v5, v84);
  }
  v195 = v83;
  if (self->_jit_start_address && self->_jit_end_address)
  {
    CFStringRef v270 = @"jitStartAddress";
    BOOL v85 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    v271 = v85;
    int v86 = +[NSDictionary dictionaryWithObjects:&v271 forKeys:&v270 count:1];
    v5[2](v5, v86);

    CFStringRef v268 = @"jitEndAddress";
    v87 = +[NSNumber numberWithUnsignedLongLong:self->_jit_end_address];
    v269 = v87;
    CFStringRef v88 = +[NSDictionary dictionaryWithObjects:&v269 forKeys:&v268 count:1];
    v5[2](v5, v88);
  }
  if (![(NSString *)self->_procName isEqualToString:@"CommCenter"])
  {
    uint64_t v89 = MGCopyAnswer();
    CFStringRef v90 = (void *)v89;
    if (v89)
    {
      CFStringRef v266 = @"basebandVersion";
      uint64_t v267 = v89;
      v91 = +[NSDictionary dictionaryWithObjects:&v267 forKeys:&v266 count:1];
      v5[2](v5, v91);
    }
  }
  vmregion_mach_timebase_info info = self->_vmregion_info;
  if (vmregion_info)
  {
    CFStringRef v264 = @"vmRegionInfo";
    v265 = vmregion_info;
    uint64_t v93 = +[NSDictionary dictionaryWithObjects:&v265 forKeys:&v264 count:1];
    v5[2](v5, v93);
  }
  uint64_t v191 = 16033;
  if (self->_is_lightweight_corpse)
  {
    v5[2](v5, &off_10003CFD0);
  }
  else if (self->_is_simulated)
  {
    v5[2](v5, &off_10003CFF8);
    caller_unsigned int name = self->_caller_name;
    if (caller_name)
    {
      CFStringRef v262 = @"simulatedCaller";
      v263 = caller_name;
      unsigned int v132 = +[NSDictionary dictionaryWithObjects:&v263 forKeys:&v262 count:1];
      v5[2](v5, v132);
    }
  }
  else if ([(OSACrashReport *)self isExceptionNonFatal])
  {
    v5[2](v5, &off_10003D020);
  }
  CFStringRef v260 = @"exception";
  CFStringRef v94 = [(OSACrashReport *)self decode_exceptionCodes];
  v261 = v94;
  uint64_t v95 = +[NSDictionary dictionaryWithObjects:&v261 forKeys:&v260 count:1];
  v5[2](v5, v95);

  CFStringRef v96 = [(OSACrashReport *)self decode_reason];
  if ([v96 count])
  {
    CFStringRef v258 = @"termination";
    v259 = v96;
    unsigned int v97 = +[NSDictionary dictionaryWithObjects:&v259 forKeys:&v258 count:1];
    v5[2](v5, v97);

    CFStringRef v98 = [v96 objectForKeyedSubscript:@"reasons"];
    if (![v98 count])
    {
      uint64_t v99 = [v96 objectForKeyedSubscript:@"details"];

      CFStringRef v98 = (void *)v99;
    }
    if ([v98 count])
    {
      CFStringRef v100 = [v98 componentsJoinedByString:@"\n"];
      mxTerminationReason = self->_mxTerminationReason;
      self->_mxTerminationReason = v100;
    }
  }
  exit_snapshot = self->_exit_snapshot;
  if (exit_snapshot && exit_snapshot->ers_code == 5)
  {
    int v103 = [(OSACrashReport *)self create_os_fault_section];
    if ([v103 count])
    {
      CFStringRef v256 = @"os_fault";
      v257 = v103;
      CFStringRef v104 = +[NSDictionary dictionaryWithObjects:&v257 forKeys:&v256 count:1];
      v5[2](v5, v104);
    }
  }
  if ([(NSString *)self->_ktriage_info length])
  {
    CFStringRef v254 = @"ktriageinfo";
    ktriage_mach_timebase_info info = self->_ktriage_info;
    uint64_t v105 = +[NSDictionary dictionaryWithObjects:&ktriage_info forKeys:&v254 count:1];
    v5[2](v5, v105);
  }
  CFStringRef v106 = self->_vmregion_info;
  if (v106)
  {
    CFStringRef v252 = @"vmregioninfo";
    v253 = v106;
    unsigned int v107 = +[NSDictionary dictionaryWithObjects:&v253 forKeys:&v252 count:1];
    v5[2](v5, v107);
  }
  if ([(NSMutableDictionary *)self->_applicationSpecificInfo count])
  {
    CFStringRef v250 = @"asi";
    applicationSpecificInfo = self->_applicationSpecificInfo;
    CFStringRef v108 = +[NSDictionary dictionaryWithObjects:&applicationSpecificInfo forKeys:&v250 count:1];
    v5[2](v5, v108);
  }
  if ([(NSDictionary *)self->_exceptionReasonDetails count])
  {
    CFStringRef v248 = @"exceptionReason";
    exceptionReasonDetails = self->_exceptionReasonDetails;
    uint64_t v109 = +[NSDictionary dictionaryWithObjects:&exceptionReasonDetails forKeys:&v248 count:1];
    v5[2](v5, v109);
  }
  if ([(NSDictionary *)self->_workQueueLimits count])
  {
    workQueueLimits = self->_workQueueLimits;
    v246[0] = @"workQueueLimits";
    v246[1] = &off_10003D420;
    v247[0] = workQueueLimits;
    v247[1] = &off_10003D060;
    unsigned int v111 = +[NSDictionary dictionaryWithObjects:v247 forKeys:v246 count:2];
    v5[2](v5, v111);
  }
  v193 = v96;
  if ([(NSArray *)self->_lastExceptionBacktrace count])
  {
    CFStringRef v244 = @"lastExceptionBacktrace";
    lastExceptionBacktrace = self->_lastExceptionBacktrace;
    CFStringRef v112 = +[NSDictionary dictionaryWithObjects:&lastExceptionBacktrace forKeys:&v244 count:1];
    v5[2](v5, v112);
  }
  if ([(NSMutableArray *)self->_threadInfos count])
  {
    if ((self->_crashedThreadNumber & 0x80000000) == 0)
    {
      CFStringRef v242 = @"faultingThread";
      size_t v113 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v243 = v113;
      CFStringRef v114 = +[NSDictionary dictionaryWithObjects:&v243 forKeys:&v242 count:1];
      v5[2](v5, v114);

      unint64_t v115 = [(NSMutableArray *)self->_threadInfos objectAtIndexedSubscript:self->_crashedThreadNumber];
      [v115 setObject:&__kCFBooleanTrue forKeyedSubscript:@"triggered"];
      [v115 setObject:self->_threadStateDecoded forKeyedSubscript:@"threadState"];
    }
    CFStringRef v240 = @"threads";
    threadInfos = self->_threadInfos;
    size_t v116 = +[NSDictionary dictionaryWithObjects:&threadInfos forKeys:&v240 count:1];
    v5[2](v5, v116);
  }
  if ([(NSArray *)self->_usedImages count])
  {
    usedImages = self->_usedImages;
    v238[0] = @"usedImages";
    v238[1] = &off_10003D420;
    v239[0] = usedImages;
    v239[1] = &off_10003D060;
    CFStringRef v118 = +[NSDictionary dictionaryWithObjects:v239 forKeys:v238 count:2];
    v5[2](v5, v118);
  }
  if (self->_sharedCacheBase)
  {
    memset(out, 0, 37);
    uuid_unparse_lower(self->_sharedCacheUuid, out);
    v235[0] = @"sharedCache";
    v233[0] = @"base";
    unsigned int v119 = +[NSNumber numberWithUnsignedLongLong:self->_sharedCacheBase];
    v234[0] = v119;
    v233[1] = @"size";
    unsigned int v120 = +[NSNumber numberWithUnsignedLongLong:self->_sharedCacheSize];
    v234[1] = v120;
    v233[2] = @"uuid";
    uint64_t v121 = +[NSString stringWithUTF8String:out];
    v234[2] = v121;
    unsigned int v122 = +[NSDictionary dictionaryWithObjects:v234 forKeys:v233 count:3];
    v235[1] = &off_10003D420;
    v236[0] = v122;
    v236[1] = &off_10003D060;
    v123 = +[NSDictionary dictionaryWithObjects:v236 forKeys:v235 count:2];
    v5[2](v5, v123);

    id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  }
  uint64_t v124 = objc_opt_new();
  if (self->_crashedThreadNumber < 0)
  {
    if (self->_highlightedThreadNumber < 0) {
      goto LABEL_120;
    }
    v125 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v124 setObject:v125 forKeyedSubscript:@"threadHighlighted"];
  }
  else
  {
    v125 = objc_opt_new();
    unsigned int v126 = [(NSMutableArray *)self->_threadInfos objectAtIndexedSubscript:self->_crashedThreadNumber];
    v127 = [v126 objectForKeyedSubscript:@"name"];

    if (v127)
    {
      int v128 = [v126 objectForKeyedSubscript:@"name"];
      [v125 setObject:v128 forKeyedSubscript:@"name"];
    }
    v129 = [v126 objectForKeyedSubscript:@"queue"];

    if (v129)
    {
      v130 = [v126 objectForKeyedSubscript:@"queue"];
      [v125 setObject:v130 forKeyedSubscript:@"queue"];
    }
    [v124 setObject:v125 forKeyedSubscript:@"threadTriggered"];

    id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
  }

LABEL_120:
  vmSummary = self->_vmSummary;
  if (vmSummary)
  {
    CFStringRef v231 = @"vmSummary";
    v232 = vmSummary;
    id v134 = [v16[360] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
    v5[2](v5, v134);
  }
  probGuardReport = self->_probGuardReport;
  if (probGuardReport)
  {
    CFStringRef v229 = @"probGuardReport";
    v230 = probGuardReport;
    v136 = [v16[360] dictionaryWithObjects:&v230 forKeys:&v229 count:1];
    v5[2](v5, v136);
  }
  memoryErrorReport = self->_memoryErrorReport;
  if (memoryErrorReport)
  {
    CFStringRef v227 = @"memoryErrorReport";
    v228 = memoryErrorReport;
    v138 = [v16[360] dictionaryWithObjects:&v228 forKeys:&v227 count:1];
    v5[2](v5, v138);
  }
  sanitizerReport = self->_sanitizerReport;
  if (sanitizerReport)
  {
    CFStringRef v225 = @"quarantineReport";
    v226 = sanitizerReport;
    uint64_t v140 = [v16[360] dictionaryWithObjects:&v226 forKeys:&v225 count:1];
    v5[2](v5, v140);
  }
  if ([v124 count])
  {
    v223[0] = @"legacyInfo";
    v223[1] = &off_10003D420;
    v224[0] = v124;
    v224[1] = &off_10003D060;
    v141 = [v16[360] dictionaryWithObjects:v224 forKeys:v223 count:2];
    v5[2](v5, v141);
  }
  logWritingSignature = self->_logWritingSignature;
  if (logWritingSignature)
  {
    CFStringRef v221 = @"logWritingSignature";
    v222 = logWritingSignature;
    v143 = [v16[360] dictionaryWithObjects:&v222 forKeys:&v221 count:1];
    v5[2](v5, v143);
  }
  v144 = [(OSACrashReport *)self getTrialCache];
  v145 = v144;
  if (v144)
  {
    v146 = [v144 dictionaryWithValuesForKeys:&off_10003D588];
    v147 = [v145 objectForKeyedSubscript:@"errors"];
    if ([v146 count])
    {
      v219[0] = @"trialInfo";
      v219[1] = &off_10003D420;
      v220[0] = v146;
      v220[1] = &off_10003D060;
      v148 = +[NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:2];
      v5[2](v5, v148);
    }
    else
    {
      if (![v147 count])
      {
LABEL_138:

        id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
        goto LABEL_139;
      }
      v149 = *(void **)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes];
      v148 = [v147 componentsJoinedByString:@"; "];
      v150 = +[NSString stringWithFormat:@"Unable to retrieve Trial info: %@", v148];
      [v149 addObject:v150];
    }
    goto LABEL_138;
  }
LABEL_139:
  if (!v198) {
    goto LABEL_185;
  }
  if ((!self->_is_simulated || self->_is_lightweight_corpse) && self->_exceptionType != 11)
  {
    if (byte_100042FD5 || [(NSString *)self->_procName isEqualToString:@"ReportCrash"])
    {
LABEL_176:
      goto LABEL_177;
    }
    v152 = +[NSPredicate predicateWithFormat:@"(processID == 0) AND (senderImagePath CONTAINS '/Sandbox')"];
    v218[0] = v152;
    unsigned int v153 = +[NSPredicate predicateWithFormat:@"subsystem == 'com.apple.sandbox.reporting'"];
    v218[1] = v153;
    uint64_t v154 = +[NSArray arrayWithObjects:v218 count:2];

    if (self->_signal == 6)
    {
      v155 = [&__NSArray0__struct arrayByAddingObject:@"hangtracerd"];
    }
    else
    {
      v155 = &__NSArray0__struct;
    }
    if ([(NSString *)self->_procName isEqualToString:@"wifid"])
    {
      CFStringRef v156 = @"kernel";
    }
    else
    {
      if (![(NSString *)self->_procName isEqualToString:@"Camera"])
      {
        if ([(NSString *)self->_procName isEqualToString:@"SpringBoard"])
        {
          CFStringRef v156 = @"backboardd";
          goto LABEL_163;
        }
        if ([(NSString *)self->_procName isEqualToString:@"backboardd"])
        {
          CFStringRef v156 = @"SpringBoard";
          goto LABEL_163;
        }
        if ([(NSString *)self->_procName isEqualToString:@"tzd"])
        {
          CFStringRef v156 = @"mobileassetd";
          goto LABEL_163;
        }
        if ([(NSString *)self->_procName isEqualToString:@"Carousel"]
          || [(NSString *)self->_procName isEqualToString:@"nanotimekitd"])
        {
          CFStringRef v156 = @"assetsd";
          goto LABEL_163;
        }
        if (![(NSString *)self->_procName isEqualToString:@"com.apple.photos.ImageConversionService"]&& ![(NSString *)self->_procName isEqualToString:@"com.apple.photos.VideoConversionService"])
        {
          if ([(NSString *)self->_procName isEqualToString:@"mediaserverd"])
          {
            v181 = &off_10003D5A0;
          }
          else if ([(NSString *)self->_procName isEqualToString:@"audiomxd"])
          {
            v181 = &off_10003D5B8;
          }
          else if ([(NSString *)self->_procName isEqualToString:@"mediaplaybackd"])
          {
            v181 = &off_10003D5D0;
          }
          else if ([(NSString *)self->_procName isEqualToString:@"mediaparserd"])
          {
            v181 = &off_10003D5E8;
          }
          else if ([(NSString *)self->_procName isEqualToString:@"videocodecd"])
          {
            v181 = &off_10003D600;
          }
          else
          {
            if (![(NSString *)self->_procName isEqualToString:@"airplayd"])
            {
              if (![(NSString *)self->_procName isEqualToString:@"zprint"]) {
                goto LABEL_165;
              }
              v158 = v155;
              uint64_t v157 = [v155 arrayByAddingObject:@"kernel"];
LABEL_164:
              v155 = (void *)v157;

LABEL_165:
              if (self->_is_driverkit)
              {
                v159 = &off_10003D630;
              }
              else
              {
                v160 = +[NSNumber numberWithInt:self->_proc_id];
                v217 = v160;
                v159 = +[NSArray arrayWithObjects:&v217 count:1];
              }
              v197 = v155;
              v161 = [(OSACrashReport *)self getSyslogForPids:v159 andOptionalSenders:v155 additionalPredicates:v154];
              v162 = v161;
              v215[0] = @"filteredLog";
              v199 = (void *)v154;
              if (v161)
              {
                if ([v161 count])
                {
                  uint64_t v191 = [v162 reverseObjectEnumerator];
                  v163 = [(id)v191 allObjects];
                  int v164 = 1;
                }
                else
                {
                  int v164 = 0;
                  v163 = &off_10003D660;
                }
              }
              else
              {
                int v164 = 0;
                v163 = &off_10003D648;
              }
              v215[1] = &off_10003D420;
              v216[0] = v163;
              v216[1] = &off_10003D060;
              v165 = +[NSDictionary dictionaryWithObjects:v216 forKeys:v215 count:2];
              v5[2](v5, v165);

              if (v164)
              {
              }
              id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
              goto LABEL_176;
            }
            v181 = &off_10003D618;
          }
          v158 = v155;
          uint64_t v157 = [v155 arrayByAddingObjectsFromArray:v181];
          goto LABEL_164;
        }
      }
      CFStringRef v156 = @"mediaserverd";
    }
LABEL_163:
    uint64_t v157 = [v155 arrayByAddingObject:v156];
    v158 = v155;
    goto LABEL_164;
  }
LABEL_177:
  if (self->_proc_id && ([(NSMutableDictionary *)self->_spewage_diag count] || self->_memgraph_filename))
  {
    v213 = &off_10003D438;
    CFStringRef v214 = @"diagnosticOutput";
    v166 = [v16[360] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    v5[2](v5, v166);

    if ([(NSMutableDictionary *)self->_spewage_diag count]) {
      v5[2](v5, self->_spewage_diag);
    }
    memgraph_fileunsigned int name = self->_memgraph_filename;
    if (memgraph_filename)
    {
      CFStringRef v211 = @"memgraph/vmmap";
      v168 = sub_10000E540((uint64_t)"/usr/bin/vmmap", memgraph_filename, dword_100042FCC, 0);
      v210 = v168;
      v169 = +[NSArray arrayWithObjects:&v210 count:1];
      v212 = v169;
      v170 = [v16[360] dictionaryWithObjects:&v212 forKeys:&v211 count:1];
      v5[2](v5, v170);

      CFStringRef v208 = @"memgraph/heap";
      v171 = sub_10000E540((uint64_t)"/usr/bin/heap", self->_memgraph_filename, dword_100042FCC, 0);
      v207 = v171;
      v172 = +[NSArray arrayWithObjects:&v207 count:1];
      v209 = v172;
      v173 = +[NSDictionary dictionaryWithObjects:&v209 forKeys:&v208 count:1];
      v5[2](v5, v173);

      CFStringRef v205 = @"memgraph/leaks";
      v174 = sub_10000E540((uint64_t)"/usr/bin/leaks", self->_memgraph_filename, dword_100042FCC, 0);
      v204 = v174;
      v175 = +[NSArray arrayWithObjects:&v204 count:1];
      v206 = v175;
      v176 = +[NSDictionary dictionaryWithObjects:&v206 forKeys:&v205 count:1];
      v5[2](v5, v176);

      id v16 = &_s13CoreAnalytics0B14QueryValuesFor9argumentsSo13OS_xpc_object_pSo5NSSetC_tF_ptr;
    }
    v202 = &off_10003D450;
    CFStringRef v203 = &stru_100035B30;
    v177 = [v16[360] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
    v5[2](v5, v177);
  }
LABEL_185:
  uint64_t v178 = OBJC_IVAR___OSAReport__notes;
  if ([*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__notes] count])
  {
    uint64_t v179 = *(void *)&self->OSAReport_opaque[v178];
    v200[0] = @"reportNotes";
    v200[1] = &off_10003D420;
    v201[0] = v179;
    v201[1] = &off_10003D060;
    v180 = [v16[360] dictionaryWithObjects:v201 forKeys:v200 count:2];
    v5[2](v5, v180);
  }
}

- (BOOL)saveWithOptions:(id)a3
{
  id v4 = a3;
  if ([(OSACrashReport *)self needsUrgentSubmission]) {
    [*(id *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__logWritingOptions] setObject:&__kCFBooleanTrue forKeyedSubscript:kOSALogOptionUrgent];
  }
  v7.receiver = self;
  v7.super_class = (Class)OSACrashReport;
  BOOL v5 = [(OSACrashReport *)&v7 saveWithOptions:v4];
  if (!self->_is_simulated) {
    [(OSACrashReport *)self sendToMetricKit];
  }

  return v5;
}

- (BOOL)needsUrgentSubmission
{
  return self->_is_beta || self->_needsUrgentSubmission;
}

- (void)checkIfNeedsUrgentSubmission
{
  unint64_t v3 = +[OSASystemConfiguration sharedInstance];
  id v4 = [v3 getTaskingKey:@"disableUrgentSubmission"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    BOOL v7 = 0;
    if (v6)
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Urgent submission has been disabled", v8, 2u);
      BOOL v7 = 0;
    }
  }
  else
  {
    if (!self->_sroute_id) {
      return;
    }
    BOOL v7 = 1;
  }
  self->_needsUrgentSubmission = v7;
}

- (id)getNotificationInfo
{
  unint64_t v3 = objc_opt_new();
  objc_msgSend(v3, "setUrgentSubmission:", -[OSACrashReport needsUrgentSubmission](self, "needsUrgentSubmission"));
  [v3 setBundleVersion:self->_bundleVersion];
  [v3 setIsBeta:self->_is_beta];
  if (!self->_is_simulated) {
    goto LABEL_22;
  }
  exit_snapshot = self->_exit_snapshot;
  if (!exit_snapshot || exit_snapshot->ers_namespace != 18 || self->_crashedThreadNumber < 0) {
    goto LABEL_22;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v19 = long long v26 = 0u;
  id obj = [v19 objectForKeyedSubscript:@"frames"];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v5) {
    goto LABEL_21;
  }
  id v6 = v5;
  int v20 = 0;
  uint64_t v7 = *(void *)v24;
  int v22 = -1;
  while (2)
  {
    CFStringRef v8 = 0;
    int v9 = v20;
    v20 += (int)v6;
    do
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(obj);
      }
      int v10 = v9 + v8;
      uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v8);
      id v12 = [v11 objectForKeyedSubscript:@"imageIndex"];
      signed int v13 = [v12 intValue];

      if (v9 + v8 == 1)
      {
        int v22 = v13;
        goto LABEL_17;
      }
      if (v10)
      {
        if (v10 > 6) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v14 = [v11 objectForKeyedSubscript:@"symbol"];
        unsigned __int8 v15 = [@"os_fault_with_payload" isEqualToString:v14];

        if (v15) {
          goto LABEL_17;
        }
      }
      if (v13 != v22)
      {
        id v16 = [(NSArray *)self->_usedImages objectAtIndex:v13];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"name"];
        [v3 setFaultingImage:v17];

        goto LABEL_21;
      }
LABEL_17:
      CFStringRef v8 = (char *)v8 + 1;
    }
    while (v6 != v8);
    id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_21:

LABEL_22:

  return v3;
}

- (id)getObserverInfo
{
  unint64_t v3 = objc_opt_new();
  lastExceptionBacktrace = self->_lastExceptionBacktrace;
  if (lastExceptionBacktrace && [(NSArray *)lastExceptionBacktrace count])
  {
    [v3 setObject:self->_lastExceptionBacktrace forKeyedSubscript:@"frames"];
  }
  else if ((self->_crashedThreadNumber & 0x80000000) == 0)
  {
    id v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_threadInfos, "objectAtIndexedSubscript:");
    id v6 = [v5 objectForKeyedSubscript:@"frames"];
    [v3 setObject:v6 forKeyedSubscript:@"frames"];
  }
  [v3 setObject:self->_usedImages forKeyedSubscript:@"images"];
  uint64_t v7 = +[NSNumber numberWithInt:self->_proc_id];
  [v3 setObject:v7 forKeyedSubscript:@"pid"];

  [v3 setObject:self->_procName forKeyedSubscript:@"name"];
  CFStringRef v8 = +[NSNumber numberWithDouble:*(double *)&self->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]];
  [v3 setObject:v8 forKeyedSubscript:@"time"];

  if ([(NSMutableDictionary *)self->_applicationSpecificInfoFullSensitive count]) {
    [v3 setObject:self->_applicationSpecificInfoFullSensitive forKeyedSubscript:@"asi"];
  }
  int v9 = +[NSNumber numberWithBool:self->_is_simulated];
  [v3 setObject:v9 forKeyedSubscript:@"isSimulated"];

  return v3;
}

- (void)sendToMetricKit
{
  v2 = self;
  unsigned int v74 = [(OSACrashReport *)self problemType];
  if (![v74 isEqualToString:@"309"] || !v2->_bundle_id)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    CFStringRef procName = v2->_procName;
    CFStringRef bundle_id = v2->_bundle_id;
    *(_DWORD *)buf = 138543874;
    CFStringRef v102 = procName;
    __int16 v103 = 2114;
    CFStringRef v104 = v74;
    __int16 v105 = 2114;
    CFStringRef v106 = bundle_id;
    unint64_t v53 = "no MetricKit for process %{public}@ type %{public}@ bundleId %{public}@";
    uint32_t v54 = 32;
LABEL_47:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v53, buf, v54);
    goto LABEL_63;
  }
  if (qword_100043070 != -1) {
    dispatch_once(&qword_100043070, &stru_100035248);
  }
  if (!qword_100043020
    || !qword_100043028
    || !qword_100043030
    || !qword_100043038
    || !qword_100043040
    || !qword_100043048
    || !qword_100043050
    || !qword_100043058
    || !qword_100043060
    || !qword_100043068)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_63;
    }
    *(_WORD *)buf = 0;
    unint64_t v53 = "failed to dynamically load MetricKit classes";
    uint32_t v54 = 2;
    goto LABEL_47;
  }
  int v73 = v2->_bundle_id;
  if (objc_msgSend((id)qword_100043020, "isMetricKitClient:"))
  {
    uint64_t v76 = objc_opt_new();
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obj = v2->_threadInfos;
    int v86 = v2;
    id v78 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v114 count:16];
    if (v78)
    {
      uint64_t v77 = *(void *)v98;
      do
      {
        uint64_t v3 = 0;
        do
        {
          if (*(void *)v98 != v77) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v97 + 1) + 8 * v3);
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          v80 = v4;
          uint64_t v82 = v3;
          id v5 = [v4 objectForKeyedSubscript:@"frames"];
          id v6 = [v5 reverseObjectEnumerator];

          id v84 = v6;
          id v89 = [v6 countByEnumeratingWithState:&v93 objects:v113 count:16];
          if (v89)
          {
            uint64_t v91 = 0;
            id v7 = 0;
            uint64_t v87 = *(void *)v94;
            do
            {
              CFStringRef v8 = 0;
              int v9 = v7;
              do
              {
                if (*(void *)v94 != v87) {
                  objc_enumerationMutation(v84);
                }
                int v10 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v8);
                uint64_t v11 = [v10 objectForKeyedSubscript:@"imageIndex"];
                signed int v12 = [v11 intValue];

                signed int v13 = [v10 objectForKeyedSubscript:@"imageOffset"];
                uint64_t v14 = (char *)[v13 longLongValue];

                unsigned __int8 v15 = [(NSArray *)v2->_usedImages objectAtIndex:v12];
                id v16 = [v15 objectForKeyedSubscript:@"base"];
                id v17 = [v16 longLongValue];

                id v18 = objc_alloc((Class)qword_100043030);
                uint64_t v19 = [v15 objectForKeyedSubscript:@"name"];
                id v20 = objc_alloc((Class)NSUUID);
                uint64_t v21 = [v15 objectForKeyedSubscript:@"uuid"];
                id v22 = [v20 initWithUUIDString:v21];
                long long v23 = +[NSNumber numberWithUnsignedLongLong:&v14[(void)v17]];
                long long v24 = +[NSNumber numberWithUnsignedLongLong:v14];
                if (v9)
                {
                  CFStringRef v112 = v9;
                  uint64_t v25 = +[NSArray arrayWithObjects:&v112 count:1];
                }
                else
                {
                  uint64_t v25 = objc_opt_new();
                }
                long long v26 = (void *)v25;
                id v7 = [v18 initWithBinaryName:v19 binaryUUID:v22 address:v23 binaryOffset:v24 sampleCount:&off_10003D060 withDepth:(char *)v8 + v91 subFrameArray:v25];

                CFStringRef v8 = (char *)v8 + 1;
                int v9 = v7;
                v2 = v86;
              }
              while (v89 != v8);
              id v89 = [v84 countByEnumeratingWithState:&v93 objects:v113 count:16];
              v91 += (uint64_t)v8;
            }
            while (v89);
          }
          else
          {
            id v7 = 0;
          }

          id v27 = objc_alloc((Class)qword_100043028);
          if (v7)
          {
            id v111 = v7;
            uint64_t v28 = +[NSArray arrayWithObjects:&v111 count:1];
          }
          else
          {
            uint64_t v28 = objc_opt_new();
          }
          long long v29 = (void *)v28;
          long long v30 = [v80 objectForKeyedSubscript:@"triggered"];
          id v31 = objc_msgSend(v27, "initWithTopCallStackFrames:isAttributedThread:", v29, objc_msgSend(v30, "BOOLValue"));

          if (v31) {
            [v76 addObject:v31];
          }

          uint64_t v3 = v82 + 1;
        }
        while ((id)(v82 + 1) != v78);
        id v78 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v114 count:16];
      }
      while (v78);
    }

    long long v32 = +[OSASystemConfiguration sharedInstance];
    uint64_t v33 = [(NSDictionary *)v2->_bundle_info objectForKeyedSubscript:kCFBundleVersionKey];
    CFStringRef v92 = [(NSDictionary *)v2->_bundle_info objectForKeyedSubscript:@"CFBundleShortVersionString"];
    id v34 = objc_alloc((Class)qword_100043038);
    long long v35 = [v32 buildVersion];
    unsigned int v83 = v32;
    unint64_t v36 = [v32 modelCode];
    CFStringRef v37 = &stru_100035B30;
    uint64_t v81 = (void *)v33;
    if (v33) {
      CFStringRef v38 = (const __CFString *)v33;
    }
    else {
      CFStringRef v38 = &stru_100035B30;
    }
    id v88 = [v34 initWithRegionFormat:&stru_100035B30 osVersion:v35 deviceType:v36 appBuildVersion:v38 bundleID:v2->_bundle_id];

    unsigned int v39 = (void *)qword_100043020;
    uint64_t proc_id = v2->_proc_id;
    unsigned int v41 = v2->_bundle_id;
    uint64_t v79 = OBJC_IVAR___OSAReport__capture_time;
    long long v42 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&v2->OSAReport_opaque[OBJC_IVAR___OSAReport__capture_time]];
    CFStringRef v90 = [v39 getSignpostDataforPid:proc_id forClient:v41 andEventTimestamp:v42];

    if (v2->_exceptionReasonDetails)
    {
      id v43 = objc_alloc((Class)qword_100043068);
      uint64_t v44 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"composed_message"];
      long long v45 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"format_string"];
      long long v46 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"arguments"];
      long long v47 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"type"];
      long long v48 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"class"];
      id v49 = [(NSDictionary *)v2->_exceptionReasonDetails objectForKeyedSubscript:@"name"];
      id v50 = [v43 initWithComposedMessage:v44 formatString:v45 arguments:v46 type:v47 className:v48 exceptionName:v49];

      v2 = v86;
      CFStringRef v37 = &stru_100035B30;
    }
    else
    {
      id v50 = 0;
    }
    id v55 = objc_alloc((Class)qword_100043048);
    uint64_t v56 = v2->_proc_id;
    mxTerminationReason = v2->_mxTerminationReason;
    vmregion_mach_timebase_info info = v2->_vmregion_info;
    if (v92) {
      CFStringRef v37 = v92;
    }
    uint64_t v59 = +[NSNumber numberWithInt:v2->_exceptionType];
    v60 = +[NSNumber numberWithLongLong:*v2->_exceptionCode];
    unint64_t v61 = +[NSNumber numberWithInt:v2->_signal];
    id v62 = [objc_alloc((Class)qword_100043040) initWithThreadArray:v76 aggregatedByProcess:0];
    id v85 = v50;
    id v63 = [v55 initWithMetaData:v88 applicationVersion:v37 signpostData:v90 pid:v56 terminationReason:mxTerminationReason applicationSpecificInfo:0 virtualMemoryRegionInfo:vmregion_info exceptionType:v59 exceptionCode:v60 exceptionReason:v50 signal:v61 stackTrace:v62];

    BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v63)
    {
      long long v66 = v81;
      id v65 = v83;
      if (v64)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sending MXCrashDiagnostic to MetricKit", buf, 2u);
      }
      long long v67 = [(id)qword_100043058 sharedManager];
      uint64_t v109 = v73;
      id v68 = objc_alloc((Class)qword_100043050);
      CFStringRef v107 = @"crashDiagnostic";
      id v108 = v63;
      uint64_t v69 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      id v70 = [v68 initPayloadDataWithDiagnostics:v69];
      id v110 = v70;
      int v71 = +[NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
      int v72 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&v86->OSAReport_opaque[v79]];
      [v67 sendDiagnostic:v71 forDate:v72 andSourceID:5];
    }
    else
    {
      long long v66 = v81;
      id v65 = v83;
      if (v64)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create MXCrashDiagnostic", buf, 2u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v102 = v73;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@ is not a MetricKit client", buf, 0xCu);
  }

LABEL_63:
}

- (void)donateToBiome
{
  if (objc_opt_class()
    && objc_opt_class()
    && objc_opt_class()
    && ![(OSACrashReport *)self is_simulated]
    && [(OSACrashReport *)self exceptionType] != 11)
  {
    id v29 = [(OSACrashReport *)self decode_exceptionCodes];
    id v3 = objc_alloc((Class)BMProcessCrashException);
    id v4 = [v29 objectForKeyedSubscript:@"codes"];
    id v5 = [v29 objectForKeyedSubscript:@"type"];
    id v6 = [v29 objectForKeyedSubscript:@"signal"];
    id v7 = [v29 objectForKeyedSubscript:@"subtype"];
    id v27 = [v3 initWithCodes:v4 type:v5 signal:v6 subtype:v7];

    id v8 = objc_alloc((Class)BMProcessCrashTerminationReason);
    int v9 = [(OSACrashReport *)self terminationReasonExceptionCode];
    int v10 = [(OSACrashReport *)self decode_reasonNamespace];
    id v28 = [v8 initWithCode:v9 namespaceName:v10];

    id v26 = objc_alloc((Class)BMProcessCrash);
    uint64_t v11 = [(OSACrashReport *)self incidentID];
    signed int v12 = [(OSACrashReport *)self procName];
    signed int v13 = [(OSACrashReport *)self bundle_id];
    uint64_t v14 = [(OSACrashReport *)self short_vers];
    bundleVersion = self->_bundleVersion;
    id v16 = [(OSACrashReport *)self responsibleProc];
    id v17 = [(OSACrashReport *)self coalitionName];
    id v18 = +[NSNumber numberWithBool:self->_is_first_party];
    uint64_t v19 = +[NSNumber numberWithBool:self->_is_beta];
    id v20 = [v26 initWithIncidentID:v11 processName:v12 bundleID:v13 appVersion:v14 bundleVersion:bundleVersion exception:v27 terminationReason:v28 responsibleApp:v16 coalitionName:v17 isFirstParty:v18 isBeta:v19];

    uint64_t v21 = BiomeLibrary();
    id v22 = [v21 OSAnalytics];
    long long v23 = [v22 Stability];
    long long v24 = [v23 Crash];
    uint64_t v25 = [v24 source];
    [v25 sendEvent:v20];
  }
}

- (void)sendToCoreAnalytics
{
  id v4 = [(OSACrashReport *)self problemType];
  if ([v4 isEqualToString:@"309"])
  {
    if (self->_consecutiveCrashCount)
    {
    }
    else
    {
      unsigned int throttleTimeout = self->_throttleTimeout;

      if (!throttleTimeout) {
        return;
      }
    }
    AnalyticsSendEventLazy();
  }
  else
  {
  }
}

+ (BOOL)isInLDM
{
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    id v3 = +[LockdownModeManager shared];
    unsigned __int8 v4 = [v3 enabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (unint64_t)sRouteID
{
  if (self->_probGuardReport) {
    return 1;
  }
  if (self->_memoryErrorReport) {
    return 15;
  }
  if (self->_sanitizerReport) {
    return 11;
  }
  if (!self->_exceptionStateCount
    || ((v4 = self->_exceptionState[2], v5 = v4 & 0xFC01FFFF, unsigned int v6 = v4 & 0xFC01FF00, v5 != -268413671)
      ? (unint64_t result = 2)
      : (unint64_t result = 14),
        v6 != -268413696))
  {
    exit_snapshot = self->_exit_snapshot;
    if (exit_snapshot && exit_snapshot->ers_code == 3367907150)
    {
      return 2;
    }
    else
    {
      id v8 = [(NSMutableDictionary *)self->_applicationSpecificInfo objectForKeyedSubscript:@"libsystem_c.dylib"];
      unsigned __int8 v9 = [v8 containsObject:@"detected buffer overflow"];

      if (v9) {
        return 3;
      }
      int v10 = [(NSMutableDictionary *)self->_applicationSpecificInfo objectForKeyedSubscript:@"libsystem_c.dylib"];
      unsigned __int8 v11 = [v10 containsObject:@"detected source and destination buffer overlap"];

      if (v11)
      {
        return 3;
      }
      else
      {
        signed int v12 = [(NSMutableDictionary *)self->_applicationSpecificInfo objectForKeyedSubscript:@"libsystem_c.dylib"];
        unsigned __int8 v13 = [v12 containsObject:@"stack buffer overflow"];

        if (v13)
        {
          return 4;
        }
        else if (self->_exceptionType == 12 {
               && (unint64_t)[(OSACrashReport *)self codeZeroForGuardException] >> 61 == 1)
        }
        {
          return 12;
        }
        else
        {
          uint64_t v14 = self->_exit_snapshot;
          if (v14 && (v14->ers_flags & 0x1000) != 0)
          {
            return 13;
          }
          else if ([(OSACrashReport *)self shouldEnableUrgentSubmission])
          {
            return 16;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (NSString)coalitionName
{
  return self->_coalition_name;
}

- (int)proc_id
{
  return self->_proc_id;
}

- (NSString)procName
{
  return self->_procName;
}

- (NSString)bundle_id
{
  return self->_bundle_id;
}

- (NSString)short_vers
{
  return self->_short_vers;
}

- (NSString)responsibleProc
{
  return self->_responsibleProc;
}

- (BOOL)is_beta
{
  return self->_is_beta;
}

- (BOOL)is_simulated
{
  return self->_is_simulated;
}

- (int)exceptionType
{
  return self->_exceptionType;
}

- (unint64_t)crashingAddress
{
  return self->_crashingAddress;
}

- (unint64_t)sharedCacheAddress
{
  return self->_sharedCacheAddress;
}

- (NSString)logWritingSignature
{
  return self->_logWritingSignature;
}

- (NSMutableString)logWritingSignatureFrames
{
  return (NSMutableString *)objc_getProperty(self, a2, 16456, 1);
}

- (void)setLogWritingSignatureFrames:(id)a3
{
}

- (unsigned)consecutiveCrashCount
{
  return self->_consecutiveCrashCount;
}

- (unsigned)throttleTimeout
{
  return self->_throttleTimeout;
}

- (OSAExclaveContainer)exclaveContainer
{
  return self->_exclaveContainer;
}

- (void)setExclaveContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveContainer, 0);
  objc_storeStrong((id *)&self->_logWritingSignatureFrames, 0);
  objc_storeStrong((id *)&self->_logWritingSignature, 0);
  objc_storeStrong((id *)&self->_responsibleProc, 0);
  objc_storeStrong((id *)&self->_short_vers, 0);
  objc_storeStrong((id *)&self->_bundle_id, 0);
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_exclaveThreadNumbers, 0);
  objc_storeStrong((id *)&self->_pc_bytes, 0);
  objc_storeStrong((id *)&self->_pc_bytes_before, 0);
  objc_storeStrong((id *)&self->_cs_team_id, 0);
  objc_storeStrong((id *)&self->_cs_signing_id, 0);
  objc_storeStrong((id *)&self->_new_payload, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_threadPortPedigree, 0);
  objc_storeStrong((id *)&self->_memoryErrorReport, 0);
  objc_storeStrong((id *)&self->_exceptionReasonDetails, 0);
  objc_storeStrong((id *)&self->_mxTerminationReason, 0);
  objc_storeStrong((id *)&self->_rosettaRegions, 0);
  objc_storeStrong((id *)&self->_vmSummary, 0);
  objc_storeStrong((id *)&self->_sleepWakeUUID, 0);
  objc_storeStrong((id *)&self->_sandboxContainer, 0);
  objc_storeStrong((id *)&self->_suspected3rdPartyPlugin, 0);
  objc_storeStrong((id *)&self->_lsDisplayName, 0);
  objc_storeStrong((id *)&self->_lsAppType, 0);
  objc_storeStrong((id *)&self->_adam_id, 0);
  objc_storeStrong((id *)&self->_bundle_url, 0);
  objc_storeStrong((id *)&self->_store_info, 0);
  objc_storeStrong((id *)&self->_build_info, 0);
  objc_storeStrong((id *)&self->_info_plist, 0);
  objc_storeStrong((id *)&self->_bundle_info, 0);
  objc_storeStrong((id *)&self->_workQueueLimits, 0);
  objc_storeStrong((id *)&self->_sanitizerReport, 0);
  objc_storeStrong((id *)&self->_probGuardReport, 0);
  objc_storeStrong((id *)&self->_diagToolExtras, 0);
  objc_storeStrong((id *)&self->_vmregion_info, 0);
  objc_storeStrong((id *)&self->_ktriage_info, 0);
  objc_storeStrong((id *)&self->_caller_name, 0);
  objc_storeStrong((id *)&self->_terminator_proc, 0);
  objc_storeStrong((id *)&self->_terminator_reason, 0);
  objc_storeStrong((id *)&self->_spewage_diag, 0);
  objc_storeStrong((id *)&self->_memgraph_filename, 0);
  objc_storeStrong((id *)&self->_coalition_name, 0);
  objc_storeStrong((id *)&self->_lastExceptionBacktrace, 0);
  objc_storeStrong((id *)&self->_parentProcessName, 0);
  objc_storeStrong((id *)&self->_threadStateDecoded, 0);
  objc_storeStrong((id *)&self->_extraInfo, 0);
  objc_storeStrong((id *)&self->_applicationSpecificInfoFullSensitive, 0);
  objc_storeStrong((id *)&self->_applicationSpecificInfo, 0);
  objc_storeStrong((id *)&self->_threadInfos, 0);
  objc_storeStrong((id *)&self->_usedImages, 0);
  objc_storeStrong((id *)&self->_taskImages, 0);

  objc_storeStrong((id *)&self->_procPath, 0);
}

- (BOOL)shouldEnableUrgentSubmission
{
  uint64_t v2 = self;
  char v3 = sub_10002287C();

  return v3 & 1;
}

- (void)updateLogWritingSignatureWithSymbol:(id)a3 address:(unint64_t)a4
{
  id v7 = a3;
  id v8 = self;
  sub_1000236A0(a3, a4);
}

@end