@interface IMHandleStatusObserverAssertion
- (BOOL)valid;
- (IMHandle)handle;
- (IMHandleStatusObserverAssertion)initWithHandle:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation IMHandleStatusObserverAssertion

- (IMHandleStatusObserverAssertion)initWithHandle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMHandleStatusObserverAssertion;
  v5 = [(IMHandleStatusObserverAssertion *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handle, v4);
    v6->_valid = 1;
  }

  return v6;
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend_handle(self, v7, v8, v9);
      v14 = objc_msgSend_ID(v10, v11, v12, v13);
      int v18 = 134218242;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Status observer %p for handle %@ is being invalidated", (uint8_t *)&v18, 0x16u);
    }
  }
  v15 = objc_msgSend_sharedInstance(IMHandleStatusManager, v3, v4, v5);
  objc_msgSend_invalidateObserver_(v15, v16, (uint64_t)self, v17);

  self->_valid = 0;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend_handle(self, v4, v5, v6);
      v11 = objc_msgSend_ID(v7, v8, v9, v10);
      *(_DWORD *)buf = 134218242;
      v16 = self;
      __int16 v17 = 2112;
      int v18 = v11;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Status observer %p for handle %@ is being deallocated", buf, 0x16u);
    }
  }
  if (self->_valid)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v16 = self;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Status observer %p being dealloced without having been invalidated, this is likely a bug", buf, 0xCu);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C016B4;
    block[3] = &unk_1E5B7ACD0;
    block[4] = self;
    if (qword_1E965EA38 != -1) {
      dispatch_once(&qword_1E965EA38, block);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)IMHandleStatusObserverAssertion;
  [(IMHandleStatusObserverAssertion *)&v13 dealloc];
}

- (IMHandle)handle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handle);

  return (IMHandle *)WeakRetained;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
}

@end