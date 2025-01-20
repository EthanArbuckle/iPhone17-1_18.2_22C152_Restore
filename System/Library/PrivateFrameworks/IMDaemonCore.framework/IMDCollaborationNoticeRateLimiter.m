@interface IMDCollaborationNoticeRateLimiter
+ (id)loadNoticeEventHistory;
+ (id)peristencePath;
+ (int64_t)commentThreshold;
+ (int64_t)defaultThreshold;
+ (int64_t)participantChangeThreshold;
- (BOOL)shouldSendNotice:(id)a3;
- (IMDCollaborationNoticeRateLimiter)init;
- (NSMutableDictionary)noticeEventHistory;
- (OS_dispatch_queue)persistenceQueue;
- (id)dateLastUpdatedForURL:(id)a3;
- (int64_t)thresholdForNoticeType:(int64_t)a3;
- (void)didSendNotice:(id)a3;
- (void)saveNoticeEventHistory;
- (void)setNoticeEventHistory:(id)a3;
- (void)setPersistenceQueue:(id)a3;
@end

@implementation IMDCollaborationNoticeRateLimiter

- (IMDCollaborationNoticeRateLimiter)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMDCollaborationNoticeRateLimiter;
  v2 = [(IMDCollaborationNoticeRateLimiter *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("IMDCollaborationNoticeRateLimiter.persistenceQueue", 0);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[IMDCollaborationNoticeRateLimiter loadNoticeEventHistory];
    noticeEventHistory = v2->_noticeEventHistory;
    v2->_noticeEventHistory = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (BOOL)shouldSendNotice:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:v4];
    v6 = [v5 highlightURL];
    v7 = [v6 absoluteString];

    if (!v7)
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D9904720();
      }

      BOOL v9 = 0;
      goto LABEL_33;
    }
    if (IMGetDomainBoolForKeyWithDefaultValue())
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "RateLimiter: Overriden by kRateLimiterOverride, approved to send.", buf, 2u);
        }
      }
    }
    else
    {
      v11 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
      v12 = [v11 objectForKey:v7];

      if (v12)
      {
        v13 = +[IMDCollaborationNoticeTypeGenerator sharedGenerator];
        uint64_t v14 = [v13 typeForHighlightEvent:v5];

        v15 = [NSNumber numberWithInteger:v14];
        v35 = [v15 stringValue];

        v16 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
        v17 = [v16 objectForKeyedSubscript:v7];
        v18 = [v17 objectForKeyedSubscript:v35];

        if (v18)
        {
          v34 = [MEMORY[0x1E4F1C9C8] date];
          v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          v20 = [v19 components:64 fromDate:v18 toDate:v34 options:0];

          int64_t v21 = [(IMDCollaborationNoticeRateLimiter *)self thresholdForNoticeType:v14];
          uint64_t v22 = [v20 minute];
          BOOL v9 = v22 >= v21;
          if (IMOSLoggingEnabled())
          {
            v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              if (v22 < v21) {
                v24 = @"NO";
              }
              else {
                v24 = @"YES";
              }
              v33 = v20;
              uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "minute", v24));
              [NSNumber numberWithInteger:v21];
              *(_DWORD *)buf = 138413058;
              v37 = v31;
              __int16 v38 = 2112;
              v39 = v35;
              __int16 v40 = 2112;
              uint64_t v41 = v25;
              v43 = __int16 v42 = 2112;
              v32 = (void *)v25;
              v26 = (void *)v43;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "RateLimiter: result=%@ for noticeType: %@, elapsedMinutes: %@ < threshold: %@", buf, 0x2Au);

              v20 = v33;
            }
          }
          if (v22 < v21)
          {
            v27 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
            v28 = [v27 objectForKeyedSubscript:v7];
            [v28 setObject:v34 forKeyedSubscript:@"lastUpdated"];
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v35;
              _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "RateLimiter: noticeType (%@) hasn't been sent before, approved to send.", buf, 0xCu);
            }
          }
          BOOL v9 = 1;
        }

        goto LABEL_33;
      }
    }
    BOOL v9 = 1;
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1D99046A8();
  }
  BOOL v9 = 0;
LABEL_34:

  return v9;
}

- (void)didSendNotice:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[IMDCollaborationNoticeDispatcher unarchiveNoticeTransmissionEvent:v4];
    v6 = [v5 highlightURL];
    v7 = [v6 absoluteString];

    if (v7)
    {
      objc_super v8 = +[IMDCollaborationNoticeTypeGenerator sharedGenerator];
      uint64_t v9 = [v8 typeForHighlightEvent:v5];

      v10 = [NSNumber numberWithInteger:v9];
      v11 = [v10 stringValue];

      v12 = [MEMORY[0x1E4F1C9C8] date];
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v23 = 136315906;
          v24 = "-[IMDCollaborationNoticeRateLimiter didSendNotice:]";
          __int16 v25 = 2112;
          v26 = v7;
          __int16 v27 = 2112;
          v28 = v11;
          __int16 v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "%s url: %@, noticeType: %@ => %@", (uint8_t *)&v23, 0x2Au);
        }
      }
      uint64_t v14 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
      v15 = [v14 objectForKey:v7];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        v17 = [MEMORY[0x1E4F1CA60] dictionary];
        v18 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
        [v18 setObject:v17 forKeyedSubscript:v7];
      }
      v19 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
      v20 = [v19 objectForKeyedSubscript:v7];
      [v20 setObject:v12 forKeyedSubscript:@"lastUpdated"];

      int64_t v21 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
      uint64_t v22 = [v21 objectForKeyedSubscript:v7];
      [v22 setObject:v12 forKeyedSubscript:v11];

      [(IMDCollaborationNoticeRateLimiter *)self saveNoticeEventHistory];
    }
    else
    {
      v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1D9904810();
      }
    }
  }
  else
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9904798();
    }
  }
}

- (id)dateLastUpdatedForURL:(id)a3
{
  id v4 = [a3 absoluteString];
  uint64_t v5 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    v7 = [(IMDCollaborationNoticeRateLimiter *)self noticeEventHistory];
    objc_super v8 = [v7 objectForKeyedSubscript:v4];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"lastUpdated"];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)thresholdForNoticeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 2) {
    return MEMORY[0x1F4181798](IMDCollaborationNoticeRateLimiter, sel_participantChangeThreshold);
  }
  if ((unint64_t)(a3 - 2) > 1) {
    return MEMORY[0x1F4181798](IMDCollaborationNoticeRateLimiter, sel_defaultThreshold);
  }
  return MEMORY[0x1F4181798](IMDCollaborationNoticeRateLimiter, sel_commentThreshold);
}

+ (int64_t)defaultThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (int64_t)commentThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (int64_t)participantChangeThreshold
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

+ (id)peristencePath
{
  if (qword_1EBE2BE50 != -1) {
    dispatch_once(&qword_1EBE2BE50, &unk_1F3391B40);
  }
  v2 = (void *)qword_1EBE2BE58;

  return v2;
}

+ (id)loadNoticeEventHistory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  dispatch_queue_t v3 = +[IMDCollaborationNoticeRateLimiter peristencePath];
  char v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    v6 = +[IMDCollaborationNoticeRateLimiter peristencePath];
    v7 = [v5 fileURLWithPath:v6];

    objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v7];
    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          v19 = v8;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Loaded noticeEventHistory: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      id v11 = v8;
    }
    else
    {
      if (v9)
      {
        BOOL v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Loaded empty dictionary, creating a new dictionary.", (uint8_t *)&v18, 2u);
        }
      }
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v15 = v11;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Creating rateLimiter persistence.", (uint8_t *)&v18, 2u);
      }
    }
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = +[IMDCollaborationNoticeRateLimiter peristencePath];
    [v13 createFileAtPath:v14 contents:0 attributes:0];

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  return v15;
}

- (void)saveNoticeEventHistory
{
  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97EE3A8;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_sync(persistenceQueue, block);
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
}

- (NSMutableDictionary)noticeEventHistory
{
  return self->_noticeEventHistory;
}

- (void)setNoticeEventHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeEventHistory, 0);

  objc_storeStrong((id *)&self->_persistenceQueue, 0);
}

@end