@interface IMDaemonCoreSpotlightManager
+ (IMDaemonCoreSpotlightManager)sharedManager;
- (BOOL)_deferXPCActivity:(id)a3;
- (BOOL)_deviceConditionsAllowsSpotlightIndexingForActivity:(id)a3;
- (BOOL)_needsDeferredIndexing;
- (BOOL)_needsReindexingDueToVersionMismatch;
- (BOOL)_shouldDeferXPCActivity:(id)a3;
- (IMDSpotlightDaemonClient)indexingDelegate;
- (id)_currentClientState;
- (id)_newSpotlightBatchIndexingXPCCriteria;
- (id)spotlightIndexQueue;
- (int64_t)_batchIndexingIntervalBagValue;
- (int64_t)_currentSpotlightVersion;
- (int64_t)_expectedSpotlightVersion;
- (void)_checkSpotlightClientStateForReindexIfNeeded;
- (void)_checkSpotlightClientStateForReindexIfNeededWithAttempts:(int64_t)a3;
- (void)_indexNextBatchIfNecessaryForActivity:(id)a3;
- (void)_reindexPaused;
- (void)_reindexResumed;
- (void)registerForCoreSpotlightIndexing;
- (void)registerForCoreSpotlightMigration;
- (void)setIndexingDelegate:(id)a3;
@end

@implementation IMDaemonCoreSpotlightManager

+ (IMDaemonCoreSpotlightManager)sharedManager
{
  if (qword_1EBE2BE70 != -1) {
    dispatch_once(&qword_1EBE2BE70, &unk_1F3390A20);
  }
  v2 = (void *)qword_1EBE2BE80;

  return (IMDaemonCoreSpotlightManager *)v2;
}

- (int64_t)_batchIndexingIntervalBagValue
{
  return IMBagIntValueWithDefault();
}

- (id)spotlightIndexQueue
{
  v2 = (void *)qword_1EBE2BFE8;
  if (!qword_1EBE2BFE8)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("IMDCoreSpotlightProcessingQueue", v3);
    v5 = (void *)qword_1EBE2BFE8;
    qword_1EBE2BFE8 = (uint64_t)v4;

    v2 = (void *)qword_1EBE2BFE8;
  }

  return v2;
}

- (void)_reindexResumed
{
  v3 = [MEMORY[0x1E4F6BF88] sharedNotifier];

  if (v3)
  {
    id v5 = [MEMORY[0x1E4F6BF88] sharedNotifier];
    dispatch_queue_t v4 = [(IMDaemonCoreSpotlightManager *)self _currentClientState];
    [MEMORY[0x1E4F6E700] reindexReason];
    [v5 reindexResumedWithState:v4 reason:IMCoreSpotlightIndexReasonFromReindexReason()];
  }
}

- (void)_reindexPaused
{
  v3 = [MEMORY[0x1E4F6BF88] sharedNotifier];

  if (v3)
  {
    id v5 = [MEMORY[0x1E4F6BF88] sharedNotifier];
    dispatch_queue_t v4 = [(IMDaemonCoreSpotlightManager *)self _currentClientState];
    [MEMORY[0x1E4F6E700] reindexReason];
    [v5 reindexPausedWithState:v4 reason:IMCoreSpotlightIndexReasonFromReindexReason()];
  }
}

- (void)registerForCoreSpotlightIndexing
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Setting up xpc activity handler for Core Spotlight indexing or donation", buf, 2u);
    }
  }
  IMRegisterSADAwareXPCActivity();
  dispatch_queue_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isSpotlightDaemonDelegateEnabled];

  if (v5)
  {
    v6 = objc_alloc_init(IMDSpotlightDaemonClient);
    [(IMDaemonCoreSpotlightManager *)self setIndexingDelegate:v6];

    v7 = [(IMDaemonCoreSpotlightManager *)self indexingDelegate];
    SpotlightDaemonClientRegister();

    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Initialized Spotlight daemon client", buf, 2u);
      }
    }
  }
}

- (void)registerForCoreSpotlightMigration
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142A8], 1);
  IMRegisterSADAwareXPCActivity();
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_queue_t v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Registered migration spotlight activity", v4, 2u);
    }
  }
}

- (id)_newSpotlightBatchIndexingXPCCriteria
{
  int64_t v2 = [(IMDaemonCoreSpotlightManager *)self _batchIndexingIntervalBagValue];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], v2);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14338], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14320], 1);
  dispatch_queue_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isIntensiveSpotlightCPUEnabled];

  if (v5) {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14168], 1);
  }
  v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isIntensiveSpotlightMemoryEnabled];

  if (v7) {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14250], 1);
  }
  v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isIntensiveSpotlightDiskEnabled];

  if (v9) {
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14188], 1);
  }
  return v3;
}

- (void)_indexNextBatchIfNecessaryForActivity:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Index next batch request received", buf, 2u);
    }
  }
  if ([MEMORY[0x1E4F6E700] skipIndexing])
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = [MEMORY[0x1E4F6E700] skipIndexing];
        v8 = @"NO";
        if (v7) {
          v8 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Skipping indexing next batch since skipIndexing is set to %@", buf, 0xCu);
      }
    }
  }
  else
  {
    dispatch_group_t v9 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D96DF9A0;
    aBlock[3] = &unk_1E6B73218;
    aBlock[4] = self;
    v10 = v9;
    v26 = v10;
    v11 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D96DFACC;
    v23[3] = &unk_1E6B73268;
    v24 = v10;
    v12 = v10;
    v13 = _Block_copy(v23);
    dispatch_group_enter(v12);
    v14 = [(IMDaemonCoreSpotlightManager *)self spotlightIndexQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D96DFBE8;
    block[3] = &unk_1E6B73F28;
    id v21 = v11;
    id v22 = v13;
    id v15 = v13;
    id v16 = v11;
    dispatch_async(v14, block);

    v17 = [(IMDaemonCoreSpotlightManager *)self spotlightIndexQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1D96DFD1C;
    v18[3] = &unk_1E6B73218;
    v18[4] = self;
    id v19 = v4;
    dispatch_group_notify(v12, v17, v18);
  }
}

- (BOOL)_deviceConditionsAllowsSpotlightIndexingForActivity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(IMDaemonCoreSpotlightManager *)self _shouldDeferXPCActivity:v4];
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = @"NO";
        if (v5) {
          int v7 = @"YES";
        }
        int v15 = 136315394;
        id v16 = "-[IMDaemonCoreSpotlightManager _deviceConditionsAllowsSpotlightIndexingForActivity:]";
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%s xpc_activity_should_defer should defer %@", (uint8_t *)&v15, 0x16u);
      }
    }
    if (!v5)
    {
      v12 = [MEMORY[0x1E4F28F80] processInfo];
      int v13 = [v12 isLowPowerModeEnabled];

      if (!v13)
      {
        BOOL v10 = 1;
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315138;
          id v16 = "-[IMDaemonCoreSpotlightManager _deviceConditionsAllowsSpotlightIndexingForActivity:]";
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "%s deferring activity due to LPM", (uint8_t *)&v15, 0xCu);
        }
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", (uint8_t *)&v15, 2u);
    }
  }
  if (![(IMDaemonCoreSpotlightManager *)self _deferXPCActivity:v4]
    && IMOSLoggingEnabled())
  {
    dispatch_group_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", (uint8_t *)&v15, 2u);
    }
  }
  BOOL v10 = 0;
LABEL_19:

  return v10;
}

- (BOOL)_needsReindexingDueToVersionMismatch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = [(IMDaemonCoreSpotlightManager *)self _currentClientState];
  char v4 = [v3 needsReindex];
  BOOL v5 = [(IMDaemonCoreSpotlightManager *)self _needsDeferredIndexing];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v3 indexRevision];
      uint64_t v8 = [MEMORY[0x1E4F6EA40] _latestIndexRevision];
      dispatch_group_t v9 = @"NO";
      int v11 = 134218498;
      uint64_t v12 = v7;
      if (v5) {
        dispatch_group_t v9 = @"YES";
      }
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Current index version %lld expected %lld. Needs Deferred Indexing %@", (uint8_t *)&v11, 0x20u);
    }
  }
  return v5 | v4;
}

- (id)_currentClientState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_group_t v9 = sub_1D96E058C;
  BOOL v10 = sub_1D96E059C;
  id v11 = 0;
  int64_t v2 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D96E05A4;
  v5[3] = &unk_1E6B73F50;
  v5[4] = &v6;
  [v2 fetchSpotlightClientStateWithCompletion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)_currentSpotlightVersion
{
  int64_t v2 = [(IMDaemonCoreSpotlightManager *)self _currentClientState];
  int64_t v3 = [v2 indexRevision];

  return v3;
}

- (int64_t)_expectedSpotlightVersion
{
  return [MEMORY[0x1E4F6EA40] _latestIndexRevision];
}

- (BOOL)_needsDeferredIndexing
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F6E700], sel_needsDeferredIndexing);
}

- (void)_checkSpotlightClientStateForReindexIfNeededWithAttempts:(int64_t)a3
{
  if (a3 >= 5)
  {
    int64_t v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1D98FEB28(v3);
    }
LABEL_4:

    return;
  }
  if ([MEMORY[0x1E4F6E700] needsIndexing])
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "CS already needs reindexing, not checking client state", buf, 2u);
      }
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F6BF48] database];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1D96E07E0;
    v6[3] = &unk_1E6B73F78;
    v6[4] = self;
    [v5 validateSpotlightClientStateWithCompletion:v6];
  }
}

- (void)_checkSpotlightClientStateForReindexIfNeeded
{
}

- (BOOL)_shouldDeferXPCActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (BOOL)_deferXPCActivity:(id)a3
{
  return a3 && xpc_activity_set_state((xpc_activity_t)a3, 3);
}

- (IMDSpotlightDaemonClient)indexingDelegate
{
  return self->_indexingDelegate;
}

- (void)setIndexingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end