@interface CUTTelephonyManager
+ (id)sharedInstance;
- (BOOL)disableFastDormancy;
- (BOOL)registered;
- (CUTTelephonyManager)init;
- (NSMutableSet)disableFastDormancyTokens;
- (NSRecursiveLock)lock;
- (__CTServerConnection)_serverConnection;
- (void)__adjustFastDormancyTokens;
- (void)_adjustFastDormancyTokens;
- (void)_setFastDormancySuspended:(BOOL)a3;
- (void)_suspendDormancyAssertion;
- (void)addFastDormancyDisableToken:(id)a3;
- (void)dealloc;
- (void)removeFastDormancyDisableToken:(id)a3;
- (void)setDisableFastDormancyTokens:(id)a3;
- (void)setLock:(id)a3;
- (void)setRegistered:(BOOL)a3;
- (void)set_serverConnection:(__CTServerConnection *)a3;
- (void)set_suspendDormancyAssertion:(void *)a3;
@end

@implementation CUTTelephonyManager

+ (id)sharedInstance
{
  if (qword_1E95CDEB8 != -1) {
    dispatch_once(&qword_1E95CDEB8, &unk_1EF6C42C0);
  }
  if (qword_1E95CDEA8 != -1) {
    dispatch_once(&qword_1E95CDEA8, &unk_1EF6C4380);
  }
  if (qword_1E95CDEB0 != -1) {
    dispatch_once(&qword_1E95CDEB0, &unk_1EF6C4400);
  }
  v2 = (void *)qword_1E95CDEC0;
  return v2;
}

- (CUTTelephonyManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CUTTelephonyManager;
  v2 = [(CUTTelephonyManager *)&v7 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = +[CUTWiFiManager sharedInstance];
    [v5 addDelegate:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->_lock lock];
  [(NSMutableSet *)self->_disableFastDormancyTokens removeAllObjects];
  [(CUTTelephonyManager *)self _adjustFastDormancyTokens];
  [(NSRecursiveLock *)self->_lock unlock];
  v3.receiver = self;
  v3.super_class = (Class)CUTTelephonyManager;
  [(CUTTelephonyManager *)&v3 dealloc];
}

- (void)_setFastDormancySuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    serverConnection = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    self->_serverConnection = serverConnection;
  }
  suspendDormancyAssertion = self->_suspendDormancyAssertion;
  if (!v3)
  {
    if (!suspendDormancyAssertion) {
      return;
    }
    CFRelease(self->_suspendDormancyAssertion);
    self->_suspendDormancyAssertion = 0;
    v9 = +[CUTLog network];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3554000, v9, OS_LOG_TYPE_DEFAULT, "Fast dormancy suspension removed", buf, 2u);
    }
    goto LABEL_21;
  }
  if (suspendDormancyAssertion) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = serverConnection == 0;
  }
  if (!v7)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      v9 = CFBundleGetIdentifier(MainBundle);
    }
    else
    {
      v9 = 0;
    }
    v10 = (void *)[[NSString alloc] initWithFormat:@"%@.cuttelephonymanager", v9];
    unint64_t v11 = _CTServerConnectionDormancySuspendAssertionCreate();
    int v12 = v11;
    unint64_t v13 = HIDWORD(v11);
    v14 = +[CUTLog network];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v22 = v12;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = v13;
        v16 = "Could not suspend fast dormancy: (%i, %i).";
        v17 = v14;
        uint32_t v18 = 14;
LABEL_19:
        _os_log_impl(&dword_1A3554000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      v20 = self->_suspendDormancyAssertion;
      v19 = self->_serverConnection;
      *(_DWORD *)buf = 134218498;
      *(void *)v22 = v19;
      *(_WORD *)&v22[8] = 2112;
      v23 = v10;
      __int16 v24 = 2048;
      v25 = v20;
      v16 = "Fast dormancy suspended with ctServerConnection %p, name %@, assertion %p";
      v17 = v14;
      uint32_t v18 = 32;
      goto LABEL_19;
    }

LABEL_21:
  }
}

- (void)__adjustFastDormancyTokens
{
  [(CUTTelephonyManager *)self disableFastDormancy];
  MEMORY[0x1F4181798](self, sel__setFastDormancySuspended_);
}

- (void)_adjustFastDormancyTokens
{
  [(NSRecursiveLock *)self->_lock lock];
  if ((byte_1E95CDEA0 & 1) == 0)
  {
    byte_1E95CDEA0 = 1;
    dispatch_time_t v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A355D7C0;
    block[3] = &unk_1E5AFED50;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)disableFastDormancy
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(NSMutableSet *)self->_disableFastDormancyTokens count] != 0;
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)addFastDormancyDisableToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSRecursiveLock *)self->_lock lock];
    disableFastDormancyTokens = self->_disableFastDormancyTokens;
    if (!disableFastDormancyTokens)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      BOOL v7 = self->_disableFastDormancyTokens;
      self->_disableFastDormancyTokens = v6;

      disableFastDormancyTokens = self->_disableFastDormancyTokens;
    }
    [(NSMutableSet *)disableFastDormancyTokens addObject:v4];
    v8 = +[CUTLog network];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_disableFastDormancyTokens;
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      unint64_t v13 = v9;
      _os_log_impl(&dword_1A3554000, v8, OS_LOG_TYPE_DEFAULT, "Client token: %@ being added to fast dormancy clients (%@)", (uint8_t *)&v10, 0x16u);
    }

    [(NSRecursiveLock *)self->_lock unlock];
    [(CUTTelephonyManager *)self _adjustFastDormancyTokens];
  }
}

- (void)removeFastDormancyDisableToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[CUTLog network];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      disableFastDormancyTokens = self->_disableFastDormancyTokens;
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      int v10 = disableFastDormancyTokens;
      _os_log_impl(&dword_1A3554000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %@ being removed from fast dormancy clients (%@)", (uint8_t *)&v7, 0x16u);
    }

    [(NSRecursiveLock *)self->_lock lock];
    [(NSMutableSet *)self->_disableFastDormancyTokens removeObject:v4];
    [(NSRecursiveLock *)self->_lock unlock];
    [(CUTTelephonyManager *)self _adjustFastDormancyTokens];
  }
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableSet)disableFastDormancyTokens
{
  return self->_disableFastDormancyTokens;
}

- (void)setDisableFastDormancyTokens:(id)a3
{
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void)_suspendDormancyAssertion
{
  return self->_suspendDormancyAssertion;
}

- (void)set_suspendDormancyAssertion:(void *)a3
{
  self->_suspendDormancyAssertion = a3;
}

- (__CTServerConnection)_serverConnection
{
  return self->_serverConnection;
}

- (void)set_serverConnection:(__CTServerConnection *)a3
{
  self->_serverConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableFastDormancyTokens, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end