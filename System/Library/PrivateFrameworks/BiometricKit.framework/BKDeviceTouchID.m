@interface BKDeviceTouchID
+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3;
- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4;
- (id)createEnrollOperationWithError:(id *)a3;
- (id)createExtendEnrollTouchIDOperationWithError:(id *)a3;
- (id)createMatchOperationWithError:(id *)a3;
- (id)createPresenceDetectOperationWithError:(id *)a3;
@end

@implementation BKDeviceTouchID

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::deviceAvailableWithFailure\n", buf, 2u);
  }
  BOOL v11 = 0;
  if (isEphemeralMultiUser()) {
    goto LABEL_15;
  }
  char v6 = isTouchIDPlatformWithFailure(&v11);
  if (a3) {
    *a3 = v11;
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
      *(_DWORD *)buf = 67109376;
      int v13 = 0;
      __int16 v14 = 1024;
      BOOL v15 = v11;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "BKDeviceTouchID::deviceAvailableWithFailure -> %d (%u)\n", buf, 0xEu);
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
      *(_DWORD *)buf = 67109376;
      int v13 = 1;
      __int16 v14 = 1024;
      BOOL v15 = v11;
      _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::deviceAvailableWithFailure -> %d (%u)\n", buf, 0xEu);
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
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [[BKEnrollTouchIDOperation alloc] initWithDevice:self];
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
    int v13 = __osLog;
  }
  else {
    int v13 = v5;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v24 = 1024;
    int v25 = 420;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    __int16 v14 = __osLogTrace;
  }
  else {
    __int16 v14 = v5;
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
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDeviceTouchID::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)createExtendEnrollTouchIDOperationWithError:(id *)a3
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
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createExtendEnrollTouchIDOperationWithError\n", (uint8_t *)&v16, 2u);
  }
  v7 = [(BKOperation *)[BKExtendEnrollTouchIDOperation alloc] initWithDevice:self];
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
    int v13 = __osLog;
  }
  else {
    int v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    v17 = "extEnrollOp";
    __int16 v18 = 2048;
    id v19 = 0;
    __int16 v20 = 2080;
    v21 = &unk_1B3B370EE;
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v24 = 1024;
    int v25 = 441;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    __int16 v14 = __osLogTrace;
  }
  else {
    __int16 v14 = v5;
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
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDeviceTouchID::createExtendEnrollTouchIDOperationWithError -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [(BKMatchOperation *)[BKMatchTouchIDOperation alloc] initWithDevice:self];
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
    int v13 = __osLog;
  }
  else {
    int v13 = v5;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v24 = 1024;
    int v25 = 462;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    __int16 v14 = __osLogTrace;
  }
  else {
    __int16 v14 = v5;
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
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDeviceTouchID::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
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
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  v7 = [(BKOperation *)[BKFingerDetectOperation alloc] initWithDevice:self];
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
    int v13 = __osLog;
  }
  else {
    int v13 = v5;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v24 = 1024;
    int v25 = 483;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    __int16 v14 = __osLogTrace;
  }
  else {
    __int16 v14 = v5;
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
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDeviceTouchID::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (BOOL)enableBackgroundFingerDetection:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
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
    int v20 = 67109376;
    *(_DWORD *)v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDeviceTouchID::enableBackgroundFingerDetection: %d (_cid %lu)\n", (uint8_t *)&v20, 0x12u);
  }
  os_log_type_t v11 = (void *)[(BiometricKitXPCClient *)self->super._xpcClient enableBackgroundFdet:v5];
  if (v11)
  {
    if (__osLog) {
      v17 = __osLog;
    }
    else {
      v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      *(void *)v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = (int)v11;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      __int16 v25 = 1024;
      int v26 = 505;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setErrorWithOSStatus(v11, a4);
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
      int v20 = 67109634;
      *(_DWORD *)v21 = 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v11;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v19;
      __int16 v14 = v18;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      v12 = __osLogTrace;
    }
    else {
      v12 = v7;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v20 = 67109634;
      *(_DWORD *)v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = 0;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v13;
      __int16 v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v14, v15, "BKDeviceTouchID::enableBackgroundFingerDetection: -> %d %{errno}d %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  kdebug_trace();
  return v11 == 0;
}

@end