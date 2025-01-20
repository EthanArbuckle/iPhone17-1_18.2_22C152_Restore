@interface BKEnrollResultInfo
- (BKEnrollResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5;
- (BKIdentity)enrolledIdentity;
- (void)setEnrolledIdentity:(id)a3;
@end

@implementation BKEnrollResultInfo

- (BKEnrollResultInfo)initWithServerIdentity:(id)a3 details:(id)a4 device:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = (char *)a3;
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
    v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKEnrollResultInfo::initWithServerIdentity:details:device: %@ %@ %@\n", buf, 0x20u);
  }
  v21.receiver = self;
  v21.super_class = (Class)BKEnrollResultInfo;
  v13 = [(BKEnrollResultInfo *)&v21 init];
  if (!v13)
  {
    if (__osLogTrace) {
      v18 = __osLogTrace;
    }
    else {
      v18 = v11;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = 0;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "BKEnrollResultInfo::initWithServerIdentity:details: -> %@\n", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v14 = v13;
  if (!v8)
  {
    if (__osLog) {
      v20 = __osLog;
    }
    else {
      v20 = v11;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "serverIdentity";
      __int16 v24 = 2048;
      id v25 = 0;
      __int16 v26 = 2080;
      v27 = &unk_1B3B370EE;
      __int16 v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperationDelegate.m";
      __int16 v30 = 1024;
      int v31 = 41;
      _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  v15 = [[BKIdentity alloc] initWithServerIdentity:v8 device:v10];
  enrolledIdentity = v14->_enrolledIdentity;
  v14->_enrolledIdentity = v15;

  if (__osLogTrace) {
    v17 = __osLogTrace;
  }
  else {
    v17 = v11;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = (const char *)v14;
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKEnrollResultInfo::initWithServerIdentity:details: -> %@\n", buf, 0xCu);
  }
LABEL_19:

  return v14;
}

- (BKIdentity)enrolledIdentity
{
  return self->_enrolledIdentity;
}

- (void)setEnrolledIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end