@interface IMDaemonListener
- (BOOL)_hidingDisconnect;
- (BOOL)hasPostedSetupComplete;
- (BOOL)isHoldingChatMessages;
- (BOOL)isSetupComplete;
- (BOOL)shouldHoldChatMessages;
- (NSArray)allServices;
- (NSDictionary)persistentProperties;
- (NSDictionary)properties;
- (NSMutableDictionary)_contexts;
- (NSString)myStatusMessage;
- (id)_stampForContext:(id)a3;
- (id)serviceWithName:(id)a3;
- (id)valueOfPersistentProperty:(id)a3;
- (id)valueOfProperty:(id)a3;
- (unint64_t)myStatus;
- (unint64_t)vcCapabilities;
- (unsigned)myIdleTime;
- (void)_noteDisconnected;
- (void)_resetPostedSetupCompleted;
- (void)_setHidingDisconnect:(BOOL)a3;
- (void)_setStamp:(id)a3 forContext:(id)a4;
- (void)addHandler:(id)a3;
- (void)holdChatMessages;
- (void)releaseHeldChatMessages;
- (void)removeHandler:(id)a3;
@end

@implementation IMDaemonListener

- (NSDictionary)properties
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)valueOfProperty:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (NSDictionary)persistentProperties
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)valueOfPersistentProperty:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (void)addHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (void)removeHandler:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (unint64_t)myStatus
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)myStatusMessage
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unsigned)myIdleTime
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unint64_t)vcCapabilities
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)holdChatMessages
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)releaseHeldChatMessages
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)shouldHoldChatMessages
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isHoldingChatMessages
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isSetupComplete
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)hasPostedSetupComplete
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSArray)allServices
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_noteDisconnected
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)serviceWithName:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (void)_setStamp:(id)a3 forContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v7, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (id)_stampForContext:(id)a3
{
  id v3 = a3;
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

- (void)_resetPostedSetupCompleted
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSMutableDictionary)_contexts
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)_hidingDisconnect
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)_setHidingDisconnect:(BOOL)a3
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Not yet implemented", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end