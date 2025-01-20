@interface IMDOffGridAvailabilityTracker
+ (IMDOffGridAvailabilityTracker)sharedTracker;
- (IMDOffGridAvailabilityTracker)init;
- (NSMutableDictionary)trackedHandles;
- (NSTimer)updateTimer;
- (void)_clearTimer;
- (void)_startTimer;
- (void)_updateTracker;
- (void)dealloc;
- (void)setUpdateTimer:(id)a3;
- (void)startTrackingHandle:(id)a3;
- (void)stopTrackingHandle:(id)a3;
@end

@implementation IMDOffGridAvailabilityTracker

+ (IMDOffGridAvailabilityTracker)sharedTracker
{
  if (qword_1EBE2BE90[0] != -1) {
    dispatch_once(qword_1EBE2BE90, &unk_1F3392260);
  }
  v2 = (void *)qword_1EBE2BF30;

  return (IMDOffGridAvailabilityTracker *)v2;
}

- (IMDOffGridAvailabilityTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDOffGridAvailabilityTracker;
  v2 = [(IMDOffGridAvailabilityTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedHandles = v2->_trackedHandles;
    v2->_trackedHandles = v3;
  }
  return v2;
}

- (void)startTrackingHandle:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 ID];
  if ([v5 length])
  {
    objc_super v6 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
    v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412290;
          v13 = v5;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Tracking handle %@", (uint8_t *)&v12, 0xCu);
        }
      }
      v9 = objc_alloc_init(IMDOffGridAvailabilityTrackerRecord);
      [(IMDOffGridAvailabilityTrackerRecord *)v9 setHandle:v4];
      v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:172800.0];
      [(IMDOffGridAvailabilityTrackerRecord *)v9 setExpirationDate:v10];

      v11 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
      [v11 setObject:v9 forKeyedSubscript:v5];

      [(IMDOffGridAvailabilityTracker *)self _startTimer];
    }
  }
}

- (void)stopTrackingHandle:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 ID];
  if ([v5 length])
  {
    objc_super v6 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
    v7 = [v6 objectForKeyedSubscript:v5];

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [v4 ID];
          int v13 = 138412290;
          uint64_t v14 = v9;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Stopping tracking of handle %@", (uint8_t *)&v13, 0xCu);
        }
      }
      v10 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
      [v10 setObject:0 forKeyedSubscript:v5];

      v11 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
      BOOL v12 = [v11 count] == 0;

      if (v12) {
        [(IMDOffGridAvailabilityTracker *)self _clearTimer];
      }
    }
  }
}

- (void)_startTimer
{
  v3 = [(IMDOffGridAvailabilityTracker *)self updateTimer];

  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Starting timer", buf, 2u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v5 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1D9861C88;
    v7[3] = &unk_1E6B73290;
    objc_copyWeak(&v8, (id *)buf);
    objc_super v6 = [v5 scheduledTimerWithTimeInterval:1 repeats:v7 block:600.0];
    [(IMDOffGridAvailabilityTracker *)self setUpdateTimer:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_clearTimer
{
  v3 = [(IMDOffGridAvailabilityTracker *)self updateTimer];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v6 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Invalidating timer", v6, 2u);
      }
    }
    v5 = [(IMDOffGridAvailabilityTracker *)self updateTimer];
    [v5 invalidate];

    [(IMDOffGridAvailabilityTracker *)self setUpdateTimer:0];
  }
}

- (void)dealloc
{
  v3 = [(IMDOffGridAvailabilityTracker *)self updateTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)IMDOffGridAvailabilityTracker;
  [(IMDOffGridAvailabilityTracker *)&v4 dealloc];
}

- (void)_updateTracker
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Updating off grid status tracking", v5, 2u);
    }
  }
  objc_super v4 = [(IMDOffGridAvailabilityTracker *)self trackedHandles];
  [v4 enumerateKeysAndObjectsUsingBlock:&unk_1F3392280];
}

- (NSMutableDictionary)trackedHandles
{
  return self->_trackedHandles;
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_trackedHandles, 0);
}

@end