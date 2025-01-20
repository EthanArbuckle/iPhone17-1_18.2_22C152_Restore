@interface IMTypingTimer
+ (BOOL)shouldAdjustTimeoutIntervalForBeginDate;
- (BOOL)isValid;
- (IMHandle)handle;
- (IMTypingTimer)initWithHandle:(id)a3 beginDate:(id)a4 timeoutInterval:(double)a5 delegate:(id)a6;
- (IMTypingTimerDelegate)delegate;
- (NSDate)beginDate;
- (NSTimer)timer;
- (double)timeoutInterval;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerCallback;
- (void)triggerTimeout;
@end

@implementation IMTypingTimer

+ (BOOL)shouldAdjustTimeoutIntervalForBeginDate
{
  return 1;
}

- (IMTypingTimer)initWithHandle:(id)a3 beginDate:(id)a4 timeoutInterval:(double)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)IMTypingTimer;
  v14 = [(IMTypingTimer *)&v40 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_handle, a3);
    p_beginDate = (void **)&v15->_beginDate;
    objc_storeStrong((id *)&v15->_beginDate, a4);
    v15->_timeoutInterval = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    if (objc_msgSend_shouldAdjustTimeoutIntervalForBeginDate(IMTypingTimer, v17, v18, v19)
      && *p_beginDate)
    {
      v23 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v20, v21, v22);
      v27 = v23;
      if (v23)
      {
        objc_msgSend_timeIntervalSinceReferenceDate(v23, v24, v25, v26);
        double v29 = v28;
        objc_msgSend_timeIntervalSinceReferenceDate(*p_beginDate, v30, v31, v32);
        a5 = a5 - (v29 - v33);
      }
    }
    if (a5 <= 0.0)
    {
      objc_msgSend_triggerTimeout(v15, v20, v21, v22);
    }
    else
    {
      uint64_t v34 = objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(MEMORY[0x1E4F1CB00], v20, (uint64_t)v15, (uint64_t)sel_timerCallback, 0, 0, a5);
      timer = v15->_timer;
      v15->_timer = (NSTimer *)v34;

      objc_msgSend_setTolerance_(v15->_timer, v36, v37, v38, 5.0);
    }
  }

  return v15;
}

- (void)timerCallback
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isValid(self, a2, v2, v3))
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v12 = objc_msgSend_handle(self, v9, v10, v11);
        int v16 = 138412290;
        v17 = v12;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Timer callback was called for valid typing timeout with handle %@", (uint8_t *)&v16, 0xCu);
      }
    }
    objc_msgSend_invalidate(self, v5, v6, v7);
    objc_msgSend_triggerTimeout(self, v13, v14, v15);
  }
}

- (void)triggerTimeout
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend_handle(self, v7, v8, v9);
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Triggering typing timeout for handle %@", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v11 = objc_msgSend_delegate(self, v3, v4, v5);
  objc_msgSend_typingTimeoutDidTriggerWithTimer_(v11, v12, (uint64_t)self, v13);
}

- (void)invalidate
{
  uint64_t v5 = objc_msgSend_timer(self, a2, v2, v3);
  objc_msgSend_invalidate(v5, v6, v7, v8);

  MEMORY[0x1F4181798](self, sel_setTimer_, 0, v9);
}

- (BOOL)isValid
{
  uint64_t v4 = objc_msgSend_timer(self, a2, v2, v3);
  char isValid = objc_msgSend_isValid(v4, v5, v6, v7);

  return isValid;
}

- (IMTypingTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMTypingTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMHandle)handle
{
  return self->_handle;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end