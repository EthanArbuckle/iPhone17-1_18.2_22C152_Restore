@interface IMCallMonitor
+ (id)sharedInstance;
- (BOOL)isOnCall;
- (BOOL)isOnTelephonyCall;
- (IMCallMonitor)init;
- (NSDate)dateLastCallEnded;
- (void)callObserver:(id)a3 callChanged:(id)a4;
@end

@implementation IMCallMonitor

+ (id)sharedInstance
{
  if (qword_1EB273D08 != -1) {
    dispatch_once(&qword_1EB273D08, &unk_1EE22FD18);
  }
  v2 = (void *)qword_1EB273C68;
  return v2;
}

- (IMCallMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)IMCallMonitor;
  v2 = [(IMCallMonitor *)&v14 init];
  v3 = v2;
  if (v2)
  {
    lastCallDate = v2->_lastCallDate;
    v2->_lastCallDate = 0;

    v3->_wasOnCall = 0;
    callCenter = v3->_callCenter;
    v3->_callCenter = 0;

    v6 = (objc_class *)IMWeakLinkClass();
    if (v6)
    {
      v7 = (CXCallObserver *)objc_alloc_init(v6);
      v8 = v3->_callCenter;
      v3->_callCenter = v7;

      objc_msgSend_setDelegate_queue_(v3->_callCenter, v9, (uint64_t)v3, MEMORY[0x1E4F14428]);
      v3->_wasOnCall = objc_msgSend_isOnCall(v3, v10, v11, v12);
    }
  }
  return v3;
}

- (BOOL)isOnCall
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend_calls(self->_callCenter, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend_hasEnded(*(void **)(*((void *)&v13 + 1) + 8 * i), v6, v7, v8))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)isOnTelephonyCall
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = objc_msgSend_calls(self->_callCenter, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend_hasEnded(v12, v6, v7, v8) & 1) == 0)
        {
          long long v13 = objc_msgSend_providerIdentifier(v12, v6, v7, v8);
          char isEqualToString = objc_msgSend_isEqualToString_(v13, v14, @"com.apple.coretelephony", v15);

          if (isEqualToString)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v18, (uint64_t)v22, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v9;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v25 = a4;
  if (_IMWillLog(@"CallMonitor")) {
    _IMAlwaysLog(0, @"CallMonitor", @"Handling telephony event: call=%@", v7, v8, v9, v10, v11, (char)v25);
  }
  int v12 = objc_msgSend_isOnCall(self, v5, v6, v7);
  if (_IMWillLog(@"CallMonitor"))
  {
    if (self->_wasOnCall) {
      long long v20 = @"YES";
    }
    else {
      long long v20 = @"NO";
    }
    _IMAlwaysLog(0, @"CallMonitor", @"    was on call: %@   is on call: %@", v15, v16, v17, v18, v19, (char)v20);
  }
  if (self->_wasOnCall != v12)
  {
    self->_wasOnCall = v12;
    if ((v12 & 1) == 0)
    {
      long long v21 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      lastCallDate = self->_lastCallDate;
      self->_lastCallDate = v21;
    }
    uint64_t v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v23, v24, @"__kIMCallMonitorCallStatusChanged", 0, 0);
  }
}

- (NSDate)dateLastCallEnded
{
  return self->_lastCallDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCallDate, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end