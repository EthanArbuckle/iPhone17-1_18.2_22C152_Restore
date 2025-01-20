@interface IMDCKRampManager
+ (id)sharedInstance;
- (IMDCKRampManager)init;
- (NSTimer)retryTimer;
- (OS_dispatch_queue)ckQueue;
- (id)_CKUtilitiesSharedInstance;
- (id)_rampUpRecordID;
- (void)_fetchLatestRampStateFromCK:(id)a3;
- (void)_performRampCheckWithRetryAfter:(double)a3 recordFetchedCompletionBlock:(id)a4;
- (void)_persistRampFetchServerError:(BOOL)a3;
- (void)_scheduleOperation:(id)a3;
- (void)_writeRampStatePromoted:(BOOL)a3 hadServerError:(BOOL)a4;
- (void)cachedRampState:(id)a3;
- (void)dealloc;
- (void)fetchLatestRampStateFromCK:(id)a3;
- (void)setRetryTimer:(id)a3;
@end

@implementation IMDCKRampManager

+ (id)sharedInstance
{
  if (qword_1EBE2B890 != -1) {
    dispatch_once(&qword_1EBE2B890, &unk_1F3391780);
  }
  v2 = (void *)qword_1EBE2B9C8;

  return v2;
}

- (IMDCKRampManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDCKRampManager;
  v2 = [(IMDCKRampManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.Messages.IMDCKRampManager", 0);
    ckQueue = v2->_ckQueue;
    v2->_ckQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [(IMDCKRampManager *)self retryTimer];

  if (v3)
  {
    v4 = [(IMDCKRampManager *)self retryTimer];
    [v4 invalidate];

    [(IMDCKRampManager *)self setRetryTimer:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)IMDCKRampManager;
  [(IMDCKRampManager *)&v5 dealloc];
}

- (id)_CKUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance];
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (id)_rampUpRecordID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"metadata_zone"];
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [v2 zoneID];
  id v5 = (void *)[v3 initWithRecordName:@"metadata_rampstate_v3" zoneID:v4];

  return v5;
}

- (void)_fetchLatestRampStateFromCK:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v5 setAllowsCellularAccess:1];
  [v5 setQualityOfService:17];
  id v6 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  v7 = [(IMDCKRampManager *)self _rampUpRecordID];
  v8 = IMSingleObjectArray();
  v9 = (void *)[v6 initWithRecordIDs:v8];

  [v9 setDesiredKeys:&unk_1F33C6018];
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v9 operationID];
      v12 = [v9 desiredKeys];
      *(_DWORD *)buf = 138412546;
      id v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Starting ramp operation %@ Desired keys %@", buf, 0x16u);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v13 setName:@"Sync.fetch.RampState"];
  [v9 setGroup:v13];
  [v9 setConfiguration:v5];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = sub_1D97B2CDC;
  v20 = &unk_1E6B73B00;
  v21 = self;
  id v14 = v4;
  id v22 = v14;
  [v9 setFetchRecordsCompletionBlock:&v17];
  objc_msgSend(v9, "setPerRecordCompletionBlock:", &unk_1F33917A0, v17, v18, v19, v20, v21);
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [v9 operationID];
      *(_DWORD *)buf = 138412290;
      id v24 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Attempting to fetch ramp state from CloudKit with operation %@", buf, 0xCu);
    }
  }
  [(IMDCKRampManager *)self _scheduleOperation:v9];
}

- (void)_writeRampStatePromoted:(BOOL)a3 hadServerError:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [NSNumber numberWithBool:v5];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F6D0B8]];

  v8 = [NSNumber numberWithBool:v4];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F6D0C0]];

  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = @"NO";
      if (v5) {
        id v11 = @"YES";
      }
      else {
        id v11 = @"NO";
      }
      if (v4) {
        v10 = @"YES";
      }
      int v12 = 138412546;
      id v13 = v11;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Writing cachedRampState featurePromoted(%@) fetchHadServerError(%@)", (uint8_t *)&v12, 0x16u);
    }
  }
  IMSetDomainValueForKey();
}

- (void)_persistRampFetchServerError:(BOOL)a3
{
  BOOL v3 = a3;
  IMGetCachedDomainValueForKey();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = (void *)[v6 mutableCopy];
  BOOL v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F6D0C0]];

  IMSetDomainValueForKey();
}

- (void)_performRampCheckWithRetryAfter:(double)a3 recordFetchedCompletionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(IMDCKRampManager *)self retryTimer];
  char v8 = [v7 isValid];

  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(IMDCKRampManager *)self retryTimer];
        int v12 = [v11 fireDate];
        *(_DWORD *)buf = 138412290;
        double v24 = *(double *)&v12;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Not setting up new retryAfter, last one is firing at %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v9)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v24 = a3;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "scheduling new timer with retryAfter %f", buf, 0xCu);
      }
    }
    __int16 v14 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = sub_1D97B35F4;
    v20 = &unk_1E6B765E8;
    v21 = self;
    id v22 = v6;
    v15 = [v14 timerWithTimeInterval:0 repeats:&v17 block:a3];
    -[IMDCKRampManager setRetryTimer:](self, "setRetryTimer:", v15, v17, v18, v19, v20, v21);
    uint64_t v16 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v16 addTimer:v15 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)fetchLatestRampStateFromCK:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v6 = [v5 isUnderFirstDataProtectionLock];

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not Requesting ramp state. Is under first unlock.", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97B3908;
    block[3] = &unk_1E6B731C8;
    int v9 = &v16;
    id v16 = v4;
    id v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v7)
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Request to fetch ramp state", buf, 2u);
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D97B3928;
    v13[3] = &unk_1E6B76638;
    int v9 = &v14;
    v13[4] = self;
    id v14 = v4;
    id v12 = v4;
    [(IMDCKRampManager *)self cachedRampState:v13];
  }
}

- (void)cachedRampState:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void (**)(id, uint64_t, uint64_t))a3;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"RampStateOverride", (CFStringRef)*MEMORY[0x1E4F6CF00], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int v6 = IMGetCachedDomainValueForKey();
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6D0B8]];
    uint64_t v8 = [v7 BOOLValue];

    int v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6D0C0]];
    uint64_t v10 = [v9 BOOLValue];

    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = @"NO";
        if (v8) {
          id v13 = @"YES";
        }
        else {
          id v13 = @"NO";
        }
        if (v10) {
          id v12 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v13;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "cachedRampState featurePromoted(%@) fetchHadServerError(%@)", buf, 0x16u);
      }
    }
    if (v3) {
      v3[2](v3, v8, v10);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Defaults override, returning YES", buf, 2u);
      }
    }
    if (v3) {
      v3[2](v3, 1, 0);
    }
  }
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (NSTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);

  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end