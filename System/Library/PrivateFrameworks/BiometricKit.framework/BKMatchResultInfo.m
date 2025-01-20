@interface BKMatchResultInfo
- (BKIdentity)identity;
- (BKMatchResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5;
- (BOOL)credentialAdded;
- (BOOL)resultIgnored;
- (BOOL)unlocked;
- (int64_t)lockoutState;
- (void)setCredentialAdded:(BOOL)a3;
- (void)setIdentity:(id)a3;
- (void)setLockoutState:(int64_t)a3;
- (void)setUnlocked:(BOOL)a3;
@end

@implementation BKMatchResultInfo

- (BKMatchResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v8 = (BKMatchResultInfo *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v12 = __osLogTrace;
  }
  else {
    v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKMatchResultInfo::initWithServerIdentity:details:device: %@ %@ %@\n", buf, 0x20u);
  }
  v26.receiver = self;
  v26.super_class = (Class)BKMatchResultInfo;
  v13 = [(BKMatchResultInfo *)&v26 init];
  if (v13)
  {
    if (v8)
    {
      v14 = [[BKIdentity alloc] initWithServerIdentity:v8 device:v10];
      identity = v13->_identity;
      v13->_identity = v14;
    }
    if (v9)
    {
      v16 = [v9 objectForKeyedSubscript:@"BKMatchDetailLockoutState"];
      v17 = v16;
      if (v16) {
        +[BKDevice lockoutState:fromDeviceLockoutState:error:](BKDevice, "lockoutState:fromDeviceLockoutState:error:", &v13->_lockoutState, [v16 integerValue], 0);
      }
      v18 = [v9 objectForKeyedSubscript:@"BKMatchDetailUnlocked"];

      if (v18) {
        v13->_unlocked = [v18 BOOLValue];
      }
      v19 = [v9 objectForKeyedSubscript:@"BKMatchDetailCredentialAdded"];

      if (v19) {
        v13->_credentialAdded = [v19 BOOLValue];
      }
      v20 = [v9 objectForKeyedSubscript:@"BKMatchDetailResultIgnored"];

      if (v20) {
        v13->_resultIgnored = [v20 BOOLValue];
      }
    }
    if (__osLogTrace) {
      v21 = __osLogTrace;
    }
    else {
      v21 = v11;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      v22 = v21;
      os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
      _os_log_impl(&dword_1B3AF1000, v22, v23, "BKMatchResultInfo::initWithServerIdentity:details: -> %@\n", buf, 0xCu);
    }
  }
  else
  {
    if (__osLogTrace) {
      v24 = __osLogTrace;
    }
    else {
      v24 = v11;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = 0;
      v22 = v24;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      goto LABEL_29;
    }
  }

  return v13;
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (int64_t)lockoutState
{
  return self->_lockoutState;
}

- (void)setLockoutState:(int64_t)a3
{
  self->_lockoutState = a3;
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_unlocked = a3;
}

- (BOOL)credentialAdded
{
  return self->_credentialAdded;
}

- (void)setCredentialAdded:(BOOL)a3
{
  self->_credentialAdded = a3;
}

- (BOOL)resultIgnored
{
  return self->_resultIgnored;
}

- (void).cxx_destruct
{
}

@end