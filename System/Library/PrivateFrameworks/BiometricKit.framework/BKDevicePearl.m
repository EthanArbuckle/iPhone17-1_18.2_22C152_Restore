@interface BKDevicePearl
+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3;
- (BOOL)clearIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4;
- (BOOL)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 error:(id *)a5;
- (BOOL)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 error:(id *)a5;
- (BOOL)setTemplate:(id)a3 forIdentity:(id)a4 error:(id *)a5;
- (id)createEnrollOperationWithError:(id *)a3;
- (id)createMatchOperationWithError:(id *)a3;
- (id)createPresenceDetectOperationWithError:(id *)a3;
- (id)periocularMatchStateForUser:(unsigned int)a3 error:(id *)a4;
- (id)periocularMatchStateWithError:(id *)a3;
- (id)queryIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4;
- (id)supportsPeriocularEnrollmentWithError:(id *)a3;
- (int64_t)deviceEventWithStatus:(unsigned int)a3;
- (int64_t)deviceStateWithStatus:(unsigned int)a3;
- (int64_t)pearlState;
- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 identityUUID:(id)a4 removeAll:(BOOL)a5 async:(BOOL)a6 reply:(id)a7;
- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 reply:(id)a5;
- (void)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 reply:(id)a5;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKDevicePearl

- (int64_t)pearlState
{
  int64_t v3 = [(BiometricKitXPCClient *)self->super._xpcClient getDeviceState];
  return [(BKDevicePearl *)self deviceStateWithStatus:v3];
}

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v5 = __osLogTrace;
  }
  else {
    v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::deviceAvailableWithFailure\n", (uint8_t *)&v11, 2u);
  }
  if (isEphemeralMultiUser()) {
    goto LABEL_15;
  }
  char v6 = isFaceIDPlatform();
  if (a3) {
    *a3 = 0;
  }
  if ((v6 & 1) == 0)
  {
LABEL_15:
    if (__osLogTrace) {
      v9 = __osLogTrace;
    }
    else {
      v9 = v4;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = 0;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "BKDevicePearl::deviceAvailableWithFailure -> %d\n", (uint8_t *)&v11, 8u);
    }
    BOOL v8 = 0;
  }
  else
  {
    if (__osLogTrace) {
      v7 = __osLogTrace;
    }
    else {
      v7 = v4;
    }
    BOOL v8 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      int v12 = 1;
      _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::deviceAvailableWithFailure -> %d\n", (uint8_t *)&v11, 8u);
    }
  }
  kdebug_trace();
  return v8;
}

- (id)createEnrollOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [[BKEnrollPearlOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      BOOL v8 = __osLogTrace;
    }
    else {
      BOOL v8 = v5;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    if (a3) {
      id v9 = *a3;
    }
    else {
      id v9 = 0;
    }
    int v16 = 138412546;
    v17 = (const char *)v7;
    __int16 v18 = 2112;
    id v19 = v9;
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    uint64_t v13 = __osLog;
  }
  else {
    uint64_t v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    v17 = "enrollOp";
    __int16 v18 = 2048;
    id v19 = 0;
    __int16 v20 = 2080;
    v21 = &unk_1B3B370EE;
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v24 = 1024;
    int v25 = 1355;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    v14 = __osLogTrace;
  }
  else {
    v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v15 = *a3;
    }
    else {
      id v15 = 0;
    }
    int v16 = 138412546;
    v17 = 0;
    __int16 v18 = 2112;
    id v19 = v15;
    v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevicePearl::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)createMatchOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [(BKMatchOperation *)[BKMatchPearlOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      BOOL v8 = __osLogTrace;
    }
    else {
      BOOL v8 = v5;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    if (a3) {
      id v9 = *a3;
    }
    else {
      id v9 = 0;
    }
    int v16 = 138412546;
    v17 = (const char *)v7;
    __int16 v18 = 2112;
    id v19 = v9;
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    uint64_t v13 = __osLog;
  }
  else {
    uint64_t v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    v17 = "matchOp";
    __int16 v18 = 2048;
    id v19 = 0;
    __int16 v20 = 2080;
    v21 = &unk_1B3B370EE;
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v24 = 1024;
    int v25 = 1376;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    v14 = __osLogTrace;
  }
  else {
    v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v15 = *a3;
    }
    else {
      id v15 = 0;
    }
    int v16 = 138412546;
    v17 = 0;
    __int16 v18 = 2112;
    id v19 = v15;
    v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevicePearl::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [[BKFaceDetectOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      BOOL v8 = __osLogTrace;
    }
    else {
      BOOL v8 = v5;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    if (a3) {
      id v9 = *a3;
    }
    else {
      id v9 = 0;
    }
    int v16 = 138412546;
    v17 = (const char *)v7;
    __int16 v18 = 2112;
    id v19 = v9;
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    uint64_t v13 = __osLog;
  }
  else {
    uint64_t v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    v17 = "fdetOp";
    __int16 v18 = 2048;
    id v19 = 0;
    __int16 v20 = 2080;
    v21 = &unk_1B3B370EE;
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v24 = 1024;
    int v25 = 1397;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    v14 = __osLogTrace;
  }
  else {
    v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v15 = *a3;
    }
    else {
      id v15 = 0;
    }
    int v16 = 138412546;
    v17 = 0;
    __int16 v18 = 2112;
    id v19 = v15;
    v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevicePearl::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)queryIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    BOOL v8 = __osLogTrace;
  }
  else {
    BOOL v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v23 = v5;
    *(_WORD *)&v23[4] = 2048;
    *(void *)&v23[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::queryIdentityMigrationFailureForUser: %u (_cid %lu)\n", buf, 0x12u);
  }
  unsigned __int8 v21 = 0;
  int v11 = [(BiometricKitXPCClient *)self->super._xpcClient queryIdentityMigrationFailureForUser:v5 failed:&v21 clear:0];
  if (v11)
  {
    int v16 = (void *)v11;
    if (__osLog) {
      v17 = __osLog;
    }
    else {
      v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)v23 = "err == 0 ";
      *(_WORD *)&v23[8] = 2048;
      *(void *)&v23[10] = v16;
      __int16 v24 = 2080;
      int v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v28 = 1024;
      int v29 = 1419;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v16, a4);
  }
  else
  {
    uint64_t v12 = [NSNumber numberWithBool:v21];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      if (__osLogTrace) {
        v14 = __osLogTrace;
      }
      else {
        v14 = v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          id v15 = *a4;
        }
        else {
          id v15 = 0;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)v23 = v13;
        *(_WORD *)&v23[8] = 2112;
        *(void *)&v23[10] = v15;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::queryIdentityMigrationFailureForUser -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  if (__osLogTrace) {
    __int16 v18 = __osLogTrace;
  }
  else {
    __int16 v18 = v7;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v19 = *a4;
    }
    else {
      id v19 = 0;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v23 = 0;
    *(_WORD *)&v23[8] = 2112;
    *(void *)&v23[10] = v19;
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "BKDevicePearl::queryIdentityMigrationFailureForUser -> %@ %@\n", buf, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_31:
  return v13;
}

- (BOOL)clearIdentityMigrationFailureForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    BOOL v8 = __osLogTrace;
  }
  else {
    BOOL v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    int v21 = 67109376;
    *(_DWORD *)__int16 v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(void *)&v22[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::clearIdentityMigrationFailureForUser: %u (_cid %lu)\n", (uint8_t *)&v21, 0x12u);
  }
  int v11 = [(BiometricKitXPCClient *)self->super._xpcClient queryIdentityMigrationFailureForUser:v5 failed:0 clear:1];
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    if (__osLog) {
      __int16 v18 = __osLog;
    }
    else {
      __int16 v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      *(void *)__int16 v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v12;
      __int16 v23 = 2080;
      __int16 v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v27 = 1024;
      int v28 = 1440;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v12, a4);
    if (__osLogTrace) {
      id v19 = __osLogTrace;
    }
    else {
      id v19 = v7;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v20 = *a4;
      }
      else {
        id v20 = 0;
      }
      int v21 = 67109378;
      *(_DWORD *)__int16 v22 = 0;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v20;
      id v15 = v19;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      uint64_t v13 = __osLogTrace;
    }
    else {
      uint64_t v13 = v7;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v14 = *a4;
      }
      else {
        id v14 = 0;
      }
      int v21 = 67109378;
      *(_DWORD *)__int16 v22 = 1;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v14;
      id v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v15, v16, "BKDevicePearl::clearIdentityMigrationFailureForUser -> %d %@\n", (uint8_t *)&v21, 0x12u);
    }
  }
  return v12 == 0;
}

- (id)supportsPeriocularEnrollmentWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    BOOL v8 = v6;
    *(_DWORD *)buf = 134217984;
    int v21 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::supportsPeriocularEnrollmentWithError (_cid %lu)\n", buf, 0xCu);
  }
  unsigned __int8 v19 = 0;
  int v9 = [(BiometricKitXPCClient *)self->super._xpcClient isPeriocularEnrollmentSupported:&v19];
  if (v9)
  {
    id v14 = (void *)v9;
    if (__osLog) {
      id v15 = __osLog;
    }
    else {
      id v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v21 = "err == 0 ";
      __int16 v22 = 2048;
      id v23 = v14;
      __int16 v24 = 2080;
      __int16 v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v28 = 1024;
      int v29 = 1464;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v14, a3);
  }
  else
  {
    uint64_t v10 = [NSNumber numberWithBool:v19];
    if (v10)
    {
      int v11 = (char *)v10;
      if (__osLogTrace) {
        uint64_t v12 = __osLogTrace;
      }
      else {
        uint64_t v12 = v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          id v13 = *a3;
        }
        else {
          id v13 = 0;
        }
        *(_DWORD *)buf = 138412546;
        int v21 = v11;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::supportsPeriocularEnrollmentWithError -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  if (__osLogTrace) {
    os_log_type_t v16 = __osLogTrace;
  }
  else {
    os_log_type_t v16 = v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v17 = *a3;
    }
    else {
      id v17 = 0;
    }
    *(_DWORD *)buf = 138412546;
    int v21 = 0;
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "BKDevicePearl::supportsPeriocularEnrollmentWithError -> %@ %@\n", buf, 0x16u);
  }
  int v11 = 0;
LABEL_31:
  return v11;
}

- (id)periocularMatchStateWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    char v6 = __osLogTrace;
  }
  else {
    char v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    BOOL v8 = v6;
    *(_DWORD *)buf = 134217984;
    int v21 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateWithError (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v19 = 0;
  int v9 = [(BiometricKitXPCClient *)self->super._xpcClient getPeriocularMatchState:0xFFFFFFFFLL state:&v19];
  if (v9)
  {
    id v14 = (void *)v9;
    if (__osLog) {
      id v15 = __osLog;
    }
    else {
      id v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int v21 = "err == 0 ";
      __int16 v22 = 2048;
      id v23 = v14;
      __int16 v24 = 2080;
      __int16 v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v28 = 1024;
      int v29 = 1486;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v14, a3);
  }
  else
  {
    uint64_t v10 = [NSNumber numberWithInteger:v19 & 0x3F];
    if (v10)
    {
      int v11 = (char *)v10;
      if (__osLogTrace) {
        uint64_t v12 = __osLogTrace;
      }
      else {
        uint64_t v12 = v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          id v13 = *a3;
        }
        else {
          id v13 = 0;
        }
        *(_DWORD *)buf = 138412546;
        int v21 = v11;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateWithError -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  if (__osLogTrace) {
    os_log_type_t v16 = __osLogTrace;
  }
  else {
    os_log_type_t v16 = v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v17 = *a3;
    }
    else {
      id v17 = 0;
    }
    *(_DWORD *)buf = 138412546;
    int v21 = 0;
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "BKDevicePearl::periocularMatchStateWithError -> %@ %@\n", buf, 0x16u);
  }
  int v11 = 0;
LABEL_31:
  return v11;
}

- (id)periocularMatchStateForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    BOOL v8 = __osLogTrace;
  }
  else {
    BOOL v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)__int16 v24 = v5;
    *(_WORD *)&v24[4] = 2048;
    *(void *)&v24[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateForUser %u (_cid %lu)\n", buf, 0x12u);
  }
  uint64_t v22 = 0;
  if (v5 == -1)
  {
    if (__osLog) {
      os_log_type_t v16 = __osLog;
    }
    else {
      os_log_type_t v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v24 = "userID != 4294967295U";
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = 0;
      __int16 v25 = 2080;
      __int16 v26 = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v29 = 1024;
      int v30 = 1507;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  else
  {
    int v11 = [(BiometricKitXPCClient *)self->super._xpcClient getPeriocularMatchState:v5 state:&v22];
    if (v11)
    {
      id v17 = (void *)v11;
      if (__osLog) {
        __int16 v18 = __osLog;
      }
      else {
        __int16 v18 = v7;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v24 = "err == 0 ";
        *(_WORD *)&v24[8] = 2048;
        *(void *)&v24[10] = v17;
        __int16 v25 = 2080;
        __int16 v26 = &unk_1B3B370EE;
        __int16 v27 = 2080;
        __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
        __int16 v29 = 1024;
        int v30 = 1510;
        _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v17, a4);
    }
    else
    {
      uint64_t v12 = [NSNumber numberWithInteger:v22 & 0x3F];
      if (v12)
      {
        id v13 = (void *)v12;
        if (__osLogTrace) {
          id v14 = __osLogTrace;
        }
        else {
          id v14 = v7;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          if (a4) {
            id v15 = *a4;
          }
          else {
            id v15 = 0;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)__int16 v24 = v13;
          *(_WORD *)&v24[8] = 2112;
          *(void *)&v24[10] = v15;
          _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::periocularMatchStateForUser -> %@ %@\n", buf, 0x16u);
        }
        goto LABEL_38;
      }
    }
  }
  if (__osLogTrace) {
    uint64_t v19 = __osLogTrace;
  }
  else {
    uint64_t v19 = v7;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v20 = *a4;
    }
    else {
      id v20 = 0;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2112;
    *(void *)&v24[10] = v20;
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "BKDevicePearl::periocularMatchStateForUser -> %@ %@\n", buf, 0x16u);
  }
  id v13 = 0;
LABEL_38:
  return v13;
}

- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 identityUUID:(id)a4 removeAll:(BOOL)a5 async:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  id v14 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v15 = __osLogTrace;
  }
  else {
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    id v17 = v15;
    *(_DWORD *)buf = 67110146;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 1024;
    BOOL v30 = v9;
    __int16 v31 = 1024;
    BOOL v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsForUser:%u identityUUID:%@ removeAll:%u (async %u, _cid %lu)\n", buf, 0x28u);
  }
  __int16 v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [NSNumber numberWithUnsignedInt:v10];
  [v18 setObject:v19 forKeyedSubscript:@"BKRemovePOTemplatesIdentityUserID"];

  if (v12) {
    [v18 setObject:v12 forKeyedSubscript:@"BKRemovePOTemplatesIdentityUUID"];
  }
  if (v9) {
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"BKRemovePOTemplatesRemoveAll"];
  }
  id v20 = self->super._xpcClient;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__BKDevicePearl_removePeriocularEnrollmentsForUser_identityUUID_removeAll_async_reply___block_invoke;
  v23[3] = &unk_1E6067D28;
  id v21 = v13;
  id v24 = v21;
  [(BiometricKitXPCClient *)v20 removePeriocularTemplatesWithOptions:v18 async:v8 withReply:v23];
  if (__osLogTrace) {
    uint64_t v22 = __osLogTrace;
  }
  else {
    uint64_t v22 = v14;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsForUser: -> void\n", buf, 2u);
  }
}

void __87__BKDevicePearl_removePeriocularEnrollmentsForUser_identityUUID_removeAll_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int64_t v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      v4 = __osLogTrace;
    }
    else {
      v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      BOOL v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevicePearl::removePeriocularEnrollmentsFromIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (__osLogTrace) {
      uint64_t v5 = __osLogTrace;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 67109378;
      int v7 = 1;
      __int16 v8 = 2112;
      BOOL v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::removePeriocularEnrollmentsFromIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    int64_t v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__3;
  __int16 v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  uint64_t v9 = [v8 userID];
  uint64_t v10 = [v8 uuid];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_error___block_invoke;
  v13[3] = &unk_1E6068140;
  v13[4] = &v20;
  v13[5] = &v14;
  [(BKDevicePearl *)self removePeriocularEnrollmentsForUser:v9 identityUUID:v10 removeAll:v6 async:0 reply:v13];

  if (a5) {
    *a5 = (id) v15[5];
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removePeriocularEnrollmentsFromIdentity:(id)a3 removeAll:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 userID];
  char v11 = [v9 uuid];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke;
  v13[3] = &unk_1E6068190;
  id v14 = v8;
  id v12 = v8;
  [(BKDevicePearl *)self removePeriocularEnrollmentsForUser:v10 identityUUID:v11 removeAll:v5 async:1 reply:v13];
}

void __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __73__BKDevicePearl_removePeriocularEnrollmentsFromIdentity_removeAll_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = __Block_byref_object_copy__3;
  id v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_error___block_invoke;
  v8[3] = &unk_1E6068140;
  v8[4] = &v15;
  v8[5] = &v9;
  [(BKDevicePearl *)self removePeriocularEnrollmentsForUser:*(void *)&a3 identityUUID:0 removeAll:a4 async:0 reply:v8];
  if (a5) {
    *a5 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removePeriocularEnrollmentsForUser:(unsigned int)a3 removeAll:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke;
  v10[3] = &unk_1E6068190;
  id v11 = v8;
  id v9 = v8;
  [(BKDevicePearl *)self removePeriocularEnrollmentsForUser:v6 identityUUID:0 removeAll:v5 async:1 reply:v10];
}

void __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __68__BKDevicePearl_removePeriocularEnrollmentsForUser_removeAll_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)setTemplate:(id)a3 forIdentity:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    id v13 = v11;
    int v25 = 134217984;
    *(void *)int v26 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::setTemplate (_cid %lu)\n", (uint8_t *)&v25, 0xCu);
  }
  id v14 = self->super._xpcClient;
  uint64_t v15 = [v9 serverIdentity];
  int v16 = [(BiometricKitXPCClient *)v14 setTemplate:v8 forIdentity:v15];

  if (v16)
  {
    if (__osLog) {
      uint64_t v22 = __osLog;
    }
    else {
      uint64_t v22 = v10;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      *(void *)int v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(void *)&v26[10] = v16;
      __int16 v27 = 2080;
      id v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      BOOL v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v31 = 1024;
      int v32 = 1635;
      _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setErrorWithOSStatus((id)v16, a5);
    if (__osLogTrace) {
      char v23 = __osLogTrace;
    }
    else {
      char v23 = v10;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        id v24 = *a5;
      }
      else {
        id v24 = 0;
      }
      int v25 = 67109378;
      *(_DWORD *)int v26 = 0;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v24;
      id v19 = v23;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      uint64_t v17 = __osLogTrace;
    }
    else {
      uint64_t v17 = v10;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (a5) {
        id v18 = *a5;
      }
      else {
        id v18 = 0;
      }
      int v25 = 67109378;
      *(_DWORD *)int v26 = 1;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v18;
      id v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v19, v20, "BKDevicePearl::setTemplate -> %d %@\n", (uint8_t *)&v25, 0x12u);
    }
  }

  return v16 == 0;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v24 = v4;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::statusMessage: %u\n", buf, 8u);
  }
  char v8 = v4 + 13;
  if ((v4 - 1011) > 0x3B)
  {
LABEL_12:
    if ((v4 - 1001) >= 0xA) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  if (((1 << v8) & 0x8800000000003C0) == 0)
  {
    if (((1 << v8) & 0x1F) != 0)
    {
      int64_t v9 = [(BKDevicePearl *)self deviceStateWithStatus:v4];
      if (!v9) {
        goto LABEL_17;
      }
      int64_t v10 = v9;
      id v11 = [(BKDevice *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_17;
      }
      id v13 = [(BKDevice *)self dispatchQueue];
      id v14 = v13;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __38__BKDevicePearl_statusMessage_client___block_invoke_2;
      v21[3] = &unk_1E6067BF8;
      v21[4] = self;
      v21[5] = v10;
      uint64_t v15 = v21;
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_13:
  int64_t v16 = [(BKDevicePearl *)self deviceEventWithStatus:v4];
  if (!v16) {
    goto LABEL_17;
  }
  int64_t v17 = v16;
  id v18 = [(BKDevice *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0) {
    goto LABEL_17;
  }
  id v13 = [(BKDevice *)self dispatchQueue];
  id v14 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__BKDevicePearl_statusMessage_client___block_invoke;
  block[3] = &unk_1E6067BF8;
  void block[4] = self;
  block[5] = v17;
  uint64_t v15 = block;
LABEL_16:
  dispatch_async(v13, v15);

LABEL_17:
  if (__osLogTrace) {
    os_log_type_t v20 = __osLogTrace;
  }
  else {
    os_log_type_t v20 = v6;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_DEFAULT, "BKDevicePearl::statusMessage: -> void\n", buf, 2u);
  }
}

void __38__BKDevicePearl_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 device:*(void *)(a1 + 32) pearlEventOccurred:*(void *)(a1 + 40)];
}

void __38__BKDevicePearl_statusMessage_client___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 device:*(void *)(a1 + 32) pearlStateChanged:*(void *)(a1 + 40)];
}

- (int64_t)deviceEventWithStatus:(unsigned int)a3
{
  int64_t result = 0;
  switch(a3)
  {
    case 0x3E9u:
      int64_t result = 1;
      break;
    case 0x3EAu:
      int64_t result = 2;
      break;
    case 0x3EBu:
      int64_t result = 3;
      break;
    case 0x3ECu:
      int64_t result = 4;
      break;
    case 0x3EDu:
      int64_t result = 5;
      break;
    case 0x3EEu:
      int64_t result = 6;
      break;
    case 0x3EFu:
      int64_t result = 7;
      break;
    case 0x3F0u:
      int64_t result = 8;
      break;
    case 0x3F1u:
      int64_t result = 9;
      break;
    case 0x3F2u:
      int64_t result = 10;
      break;
    case 0x3F3u:
    case 0x3F4u:
    case 0x3F5u:
    case 0x3F6u:
    case 0x3F7u:
    case 0x3F8u:
      return result;
    case 0x3F9u:
      int64_t result = 13;
      break;
    case 0x3FAu:
      int64_t result = 14;
      break;
    case 0x3FBu:
      int64_t result = 15;
      break;
    case 0x3FCu:
      int64_t result = 16;
      break;
    default:
      int64_t v4 = 11;
      if (a3 != 1070) {
        int64_t v4 = 0;
      }
      if (a3 == 1066) {
        int64_t result = 12;
      }
      else {
        int64_t result = v4;
      }
      break;
  }
  return result;
}

- (int64_t)deviceStateWithStatus:(unsigned int)a3
{
  uint64_t v3 = a3 - 1011;
  if (v3 < 5) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

@end