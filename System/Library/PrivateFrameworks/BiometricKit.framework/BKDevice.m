@interface BKDevice
+ (BKDevice)deviceWithDescriptor:(id)a3 error:(id *)a4;
+ (BOOL)biometryAvailabilityInfo:(int64_t *)a3 fromDeviceInfo:(int64_t)a4 error:(id *)a5;
+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3;
+ (BOOL)extendedLockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5;
+ (BOOL)lockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5;
- (BKDeviceDelegate)delegate;
- (BKDeviceDescriptor)descriptor;
- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (BOOL)biometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (BOOL)deviceHardwareState:(unint64_t *)a3 error:(id *)a4;
- (BOOL)dropAllUnlockTokensWithError:(id *)a3;
- (BOOL)expressModeState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5;
- (BOOL)forceBioLockoutForAllUsersWithError:(id *)a3;
- (BOOL)forceBioLockoutForUser:(unsigned int)a3 error:(id *)a4;
- (BOOL)forceBioLockoutIfLockedForUser:(unsigned int)a3 error:(id *)a4;
- (BOOL)isDelegate;
- (BOOL)removeAllIdentitiesForUser:(unsigned int)a3 error:(id *)a4;
- (BOOL)removeIdentity:(id)a3 error:(id *)a4;
- (BOOL)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 error:(id *)a6;
- (BOOL)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 error:(id *)a5;
- (BOOL)updateIdentity:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)queue;
- (id)accessoriesWithError:(id *)a3;
- (id)accessoryGroupsWithError:(id *)a3;
- (id)connectedAccessoriesWithError:(id *)a3;
- (id)createEnrollOperationWithError:(id *)a3;
- (id)createMatchOperationWithError:(id *)a3;
- (id)createPresenceDetectOperationWithError:(id *)a3;
- (id)dispatchQueue;
- (id)effectiveProtectedConfigurationForUser:(unsigned int)a3 error:(id *)a4;
- (id)freeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5;
- (id)freeIdentityCountForUser:(unsigned int)a3 error:(id *)a4;
- (id)identitiesDatabaseHashForUser:(unsigned int)a3 error:(id *)a4;
- (id)identitiesDatabaseUUIDForUser:(unsigned int)a3 error:(id *)a4;
- (id)identitiesForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5;
- (id)identitiesForUser:(unsigned int)a3 error:(id *)a4;
- (id)identitiesWithError:(id *)a3;
- (id)identityForUUID:(id)a3 error:(id *)a4;
- (id)lastMatchEventWithError:(id *)a3;
- (id)maxIdentityCountWithError:(id *)a3;
- (id)protectedConfigurationForUser:(unsigned int)a3 error:(id *)a4;
- (id)systemProtectedConfigurationWithError:(id *)a3;
- (void)dealloc;
- (void)removeAllIdentitiesForUser:(unsigned int)a3 async:(BOOL)a4 reply:(id)a5;
- (void)removeAllIdentitiesForUser:(unsigned int)a3 reply:(id)a4;
- (void)removeIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5;
- (void)removeIdentity:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 async:(BOOL)a6 reply:(id)a7;
- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 reply:(id)a6;
- (void)setQueue:(id)a3;
- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 async:(BOOL)a5 reply:(id)a6;
- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 reply:(id)a5;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
- (void)updateIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5;
- (void)updateIdentity:(id)a3 reply:(id)a4;
@end

@implementation BKDevice

+ (BOOL)deviceAvailableWithFailure:(BOOL *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136316162;
    v6 = "0";
    __int16 v7 = 2048;
    uint64_t v8 = 0;
    __int16 v9 = 2080;
    v10 = &unk_1B3B370EE;
    __int16 v11 = 2080;
    v12 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v13 = 1024;
    int v14 = 50;
    _os_log_impl(&dword_1B3AF1000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v5, 0x30u);
  }
  return 0;
}

+ (BKDevice)deviceWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v6 = (char *)a3;
  kdebug_trace();
  __int16 v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceWithDescriptor: %@\n", (uint8_t *)&v26, 0xCu);
  }
  if (!v6)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = v7;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    int v26 = 136316162;
    v27 = "descriptor";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    v31 = &unk_1B3B370EE;
    __int16 v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v34 = 1024;
    int v35 = 66;
    goto LABEL_55;
  }
  __int16 v9 = -[BiometricKitXPCClient initWithDeviceType:clientType:]([BiometricKitXPCClient alloc], "initWithDeviceType:clientType:", [v6 type], 2);
  if (!v9)
  {
    if (__osLog) {
      v25 = __osLog;
    }
    else {
      v25 = v7;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    int v26 = 136316162;
    v27 = "client";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    v31 = &unk_1B3B370EE;
    __int16 v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v34 = 1024;
    int v35 = 69;
LABEL_55:
    _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_56:
    v10 = 0;
    goto LABEL_30;
  }
  v10 = v9;
  uint64_t v11 = [v6 type];
  if (v11 == 2)
  {
    v12 = off_1E60677C8;
    if (+[BKDevicePearl deviceAvailableWithFailure:0]) {
      goto LABEL_17;
    }
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v7;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v26 = 136316162;
    v27 = "[BKDevicePearl deviceAvailableWithFailure:((void *)0)]";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    v31 = &unk_1B3B370EE;
    __int16 v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v34 = 1024;
    int v35 = 79;
LABEL_29:
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
LABEL_30:
    setError((id)1, a4);
    goto LABEL_31;
  }
  if (v11 != 1)
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v7;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v26 = 136316162;
    v27 = "0";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    v31 = &unk_1B3B370EE;
    __int16 v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v34 = 1024;
    int v35 = 92;
    goto LABEL_29;
  }
  v12 = off_1E60677D0;
  if (!+[BKDeviceTouchID deviceAvailableWithFailure:0])
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v7;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v26 = 136316162;
    v27 = "[BKDeviceTouchID deviceAvailableWithFailure:((void *)0)]";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2080;
    v31 = &unk_1B3B370EE;
    __int16 v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v34 = 1024;
    int v35 = 73;
    goto LABEL_29;
  }
LABEL_17:
  int v14 = (id *)objc_alloc_init(*v12);
  if (!v14)
  {
LABEL_31:
    if (__osLogTrace) {
      v20 = __osLogTrace;
    }
    else {
      v20 = v7;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      uint64_t v22 = [(BiometricKitXPCClient *)v10 connectionId];
      if (a4) {
        id v23 = *a4;
      }
      else {
        id v23 = 0;
      }
      int v26 = 138412802;
      v27 = 0;
      __int16 v28 = 2048;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "BKDevice::deviceWithDescriptor: -> %@ (_cid %lu) %@\n", (uint8_t *)&v26, 0x20u);
    }
    uint64_t v15 = 0;
    goto LABEL_42;
  }
  uint64_t v15 = v14;
  [(BiometricKitXPCClient *)v10 setDelegate:v14];
  objc_storeStrong(v15 + 1, v10);
  objc_storeStrong(v15 + 4, a3);
  if (__osLogTrace) {
    v16 = __osLogTrace;
  }
  else {
    v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    uint64_t v18 = [(BiometricKitXPCClient *)v10 connectionId];
    if (a4) {
      id v19 = *a4;
    }
    else {
      id v19 = 0;
    }
    int v26 = 138412802;
    v27 = (const char *)v15;
    __int16 v28 = 2048;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceWithDescriptor: -> %@ (_cid %lu) %@\n", (uint8_t *)&v26, 0x20u);
  }
LABEL_42:
  kdebug_trace();

  return (BKDevice *)v15;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(BiometricKitXPCClient *)self->_xpcClient setDelegate:0];
  v3 = self->_xpcClient;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__BKDevice_dealloc__block_invoke;
  block[3] = &unk_1E6067CD8;
  __int16 v9 = v3;
  int v5 = v3;
  dispatch_async(v4, block);

  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKDevice;
  [(BKDevice *)&v7 dealloc];
}

uint64_t __19__BKDevice_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateConnection];
}

- (void)setDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::setDelegate %@\n", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    [(BiometricKitXPCClient *)self->_xpcClient registerDelegate:v4 != 0];
  }
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = v5;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::setDelegate -> void\n", (uint8_t *)&v9, 2u);
  }
}

- (id)dispatchQueue
{
  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }
  return v3;
}

- (id)createEnrollOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createEnrollOperation\n", (uint8_t *)&v16, 2u);
  }
  objc_super v7 = [[BKEnrollOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      uint64_t v8 = __osLogTrace;
    }
    else {
      uint64_t v8 = v5;
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
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    __int16 v13 = __osLog;
  }
  else {
    __int16 v13 = v5;
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
    id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v24 = 1024;
    int v25 = 170;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    int v14 = __osLogTrace;
  }
  else {
    int v14 = v5;
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
    id v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevice::createEnrollOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)createMatchOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createMatchOperation\n", (uint8_t *)&v16, 2u);
  }
  objc_super v7 = [[BKMatchOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      uint64_t v8 = __osLogTrace;
    }
    else {
      uint64_t v8 = v5;
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
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    __int16 v13 = __osLog;
  }
  else {
    __int16 v13 = v5;
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
    id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v24 = 1024;
    int v25 = 191;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    int v14 = __osLogTrace;
  }
  else {
    int v14 = v5;
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
    id v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevice::createMatchOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B3AF1000, v6, OS_LOG_TYPE_DEFAULT, "BKDevice::createPresenceDetectOperation\n", (uint8_t *)&v16, 2u);
  }
  objc_super v7 = [(BKOperation *)[BKPresenceDetectOperation alloc] initWithDevice:self];
  if (v7)
  {
    if (__osLogTrace) {
      uint64_t v8 = __osLogTrace;
    }
    else {
      uint64_t v8 = v5;
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
    id v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }
  if (__osLog) {
    __int16 v13 = __osLog;
  }
  else {
    __int16 v13 = v5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136316162;
    v17 = "pdetOp";
    __int16 v18 = 2048;
    id v19 = 0;
    __int16 v20 = 2080;
    v21 = &unk_1B3B370EE;
    __int16 v22 = 2080;
    id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
    __int16 v24 = 1024;
    int v25 = 212;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
  }
  setError((id)1, a3);
  if (__osLogTrace) {
    int v14 = __osLogTrace;
  }
  else {
    int v14 = v5;
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
    id v10 = v14;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
LABEL_15:
    _os_log_impl(&dword_1B3AF1000, v10, v11, "BKDevice::createPresenceDetectOperation -> %@ %@\n", (uint8_t *)&v16, 0x16u);
  }
LABEL_16:
  kdebug_trace();
  return v7;
}

- (id)protectedConfigurationForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v18 = 67109376;
    *(_DWORD *)id v19 = v5;
    *(_WORD *)&v19[4] = 2048;
    *(void *)&v19[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::protectedConfigurationForUser: %d (_cid %lu)\n", (uint8_t *)&v18, 0x12u);
  }
  os_log_type_t v11 = [(BiometricKitXPCClient *)self->_xpcClient getProtectedConfigurationForUser:v5];
  if (v11)
  {
    v12 = [[BKUserProtectedConfiguration alloc] initWithDictionary:v11 effective:0];
    if (v12)
    {
      __int16 v13 = v12;
      if (__osLogTrace) {
        int v14 = __osLogTrace;
      }
      else {
        int v14 = v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        *(void *)id v19 = v13;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::protectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (__osLog) {
      id v15 = __osLog;
    }
    else {
      id v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)id v19 = "cfgDict";
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v24 = 1024;
      int v25 = 233;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138543362;
    *(void *)id v19 = 0;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "BKDevice::protectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
  }
  __int16 v13 = 0;
LABEL_25:

  return v13;
}

- (id)effectiveProtectedConfigurationForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v18 = 67109376;
    *(_DWORD *)id v19 = v5;
    *(_WORD *)&v19[4] = 2048;
    *(void *)&v19[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::effectiveProtectedConfigurationForUser: %d (_cid %lu)\n", (uint8_t *)&v18, 0x12u);
  }
  os_log_type_t v11 = [(BiometricKitXPCClient *)self->_xpcClient getProtectedConfigurationForUser:v5];
  if (v11)
  {
    v12 = [[BKUserProtectedConfiguration alloc] initWithDictionary:v11 effective:1];
    if (v12)
    {
      __int16 v13 = v12;
      if (__osLogTrace) {
        int v14 = __osLogTrace;
      }
      else {
        int v14 = v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        *(void *)id v19 = v13;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::effectiveProtectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (__osLog) {
      id v15 = __osLog;
    }
    else {
      id v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)id v19 = "cfgDict";
      *(_WORD *)&v19[8] = 2048;
      *(void *)&v19[10] = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v24 = 1024;
      int v25 = 255;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138543362;
    *(void *)id v19 = 0;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "BKDevice::effectiveProtectedConfigurationForUser: -> %{public}@\n", (uint8_t *)&v18, 0xCu);
  }
  __int16 v13 = 0;
LABEL_25:

  return v13;
}

- (id)systemProtectedConfigurationWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v8 = v6;
    int v16 = 134217984;
    v17 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::systemProtectedConfiguration (_cid %lu)\n", (uint8_t *)&v16, 0xCu);
  }
  id v9 = [(BiometricKitXPCClient *)self->_xpcClient getSystemProtectedConfiguration];
  if (v9)
  {
    id v10 = [[BKSystemProtectedConfiguration alloc] initWithDictionary:v9];
    if (v10)
    {
      os_log_type_t v11 = v10;
      if (__osLogTrace) {
        v12 = __osLogTrace;
      }
      else {
        v12 = v5;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543362;
        v17 = (const char *)v11;
        _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::systemProtectedConfiguration: -> %{public}@\n", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_25;
    }
  }
  else
  {
    if (__osLog) {
      __int16 v13 = __osLog;
    }
    else {
      __int16 v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      v17 = "cfgDict";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2080;
      v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      id v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v24 = 1024;
      int v25 = 277;
      _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    setError((id)1, a3);
  }
  if (__osLogTrace) {
    int v14 = __osLogTrace;
  }
  else {
    int v14 = v5;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138543362;
    v17 = 0;
    _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "BKDevice::systemProtectedConfiguration: -> %{public}@\n", (uint8_t *)&v16, 0xCu);
  }
  os_log_type_t v11 = 0;
LABEL_25:

  return v11;
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 async:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v12 = (char *)a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    __int16 v18 = v16;
    *(_DWORD *)buf = 138544386;
    uint64_t v29 = v12;
    __int16 v30 = 1024;
    *(_DWORD *)v31 = v10;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = v13;
    *(_WORD *)&v31[14] = 1024;
    *(_DWORD *)&v31[16] = v8;
    *(_WORD *)__int16 v32 = 2048;
    *(void *)&v32[2] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: %{public}@ %d %p (async %u, _cid %lu)\n", buf, 0x2Cu);
  }
  if (v12)
  {
    if (v13)
    {
      uint64_t v26 = @"BKOptionAuthWithCredentialSet";
      id v27 = v13;
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    }
    else
    {
      uint64_t v19 = 0;
    }
    __int16 v20 = self->_xpcClient;
    v21 = [v12 dictionary];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72__BKDevice_setProtectedConfiguration_forUser_credentialSet_async_reply___block_invoke;
    v24[3] = &unk_1E6067D28;
    id v25 = v14;
    [(BiometricKitXPCClient *)v20 setProtectedConfiguration:v21 forUser:v10 withOptions:v19 async:v8 withReply:v24];
  }
  else
  {
    if (__osLog) {
      id v23 = __osLog;
    }
    else {
      id v23 = v15;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v29 = "configuration";
      __int16 v30 = 2048;
      *(void *)v31 = 0;
      *(_WORD *)&v31[8] = 2080;
      *(void *)&v31[10] = &unk_1B3B370EE;
      *(_WORD *)&v31[18] = 2080;
      *(void *)__int16 v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      *(_WORD *)&v32[8] = 1024;
      int v33 = 295;
      _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v19 = +[BKErrorHelper errorWithCode:1];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v19);
  }

  if (__osLogTrace) {
    __int16 v22 = __osLogTrace;
  }
  else {
    __int16 v22 = v15;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> void\n", buf, 2u);
  }
}

void __72__BKDevice_setProtectedConfiguration_forUser_credentialSet_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      id v4 = __osLogTrace;
    }
    else {
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      id v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::setProtectedConfiguration:forUser:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_error___block_invoke;
  v14[3] = &unk_1E6068140;
  v14[4] = &v21;
  v14[5] = &v15;
  [(BKDevice *)self setProtectedConfiguration:v10 forUser:v8 credentialSet:v11 async:0 reply:v14];
  if (a6) {
    *a6 = (id) v16[5];
  }
  char v12 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 credentialSet:(id)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke;
  v12[3] = &unk_1E6068190;
  id v13 = v10;
  id v11 = v10;
  [(BKDevice *)self setProtectedConfiguration:a3 forUser:v7 credentialSet:a5 async:1 reply:v12];
}

void __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __66__BKDevice_setProtectedConfiguration_forUser_credentialSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 async:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = (char *)a3;
  id v11 = a4;
  char v12 = (void (**)(id, void, void *))a6;
  id v13 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v14 = __osLogTrace;
  }
  else {
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    int v16 = v14;
    *(_DWORD *)buf = 138544130;
    v38 = v10;
    __int16 v39 = 2048;
    id v40 = v11;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v7;
    *(_WORD *)&v42[4] = 2048;
    *(void *)&v42[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: %{public}@ %p (async %u, _cid %lu)\n", buf, 0x26u);
  }
  if (!v10)
  {
    if (__osLog) {
      __int16 v30 = __osLog;
    }
    else {
      __int16 v30 = v13;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "configuration";
      __int16 v39 = 2048;
      id v40 = 0;
      __int16 v41 = 2080;
      *(void *)v42 = &unk_1B3B370EE;
      *(_WORD *)&v42[8] = 2080;
      *(void *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v43 = 1024;
      int v44 = 356;
      _os_log_impl(&dword_1B3AF1000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    uint64_t v31 = 1;
    goto LABEL_46;
  }
  uint64_t v17 = [v10 unlockTokenMaxLifetime];

  if (v17)
  {
    __int16 v18 = [v10 unlockTokenMaxLifetime];
    int v19 = [v18 intValue];

    if (v19 <= 0)
    {
      if (__osLog) {
        __int16 v32 = __osLog;
      }
      else {
        __int16 v32 = v13;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.unlockTokenMaxLifetime intValue] > 0";
      __int16 v39 = 2048;
      id v40 = 0;
      __int16 v41 = 2080;
      *(void *)v42 = &unk_1B3B370EE;
      *(_WORD *)&v42[8] = 2080;
      *(void *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v43 = 1024;
      int v44 = 361;
      goto LABEL_44;
    }
  }
  id v20 = [v10 bioMatchLifespan];

  if (v20)
  {
    uint64_t v21 = [v10 bioMatchLifespan];
    int v22 = [v21 intValue];

    if (v22 <= 0)
    {
      if (__osLog) {
        __int16 v32 = __osLog;
      }
      else {
        __int16 v32 = v13;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.bioMatchLifespan intValue] > 0";
      __int16 v39 = 2048;
      id v40 = 0;
      __int16 v41 = 2080;
      *(void *)v42 = &unk_1B3B370EE;
      *(_WORD *)&v42[8] = 2080;
      *(void *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v43 = 1024;
      int v44 = 364;
      goto LABEL_44;
    }
  }
  uint64_t v23 = [v10 passcodeInputLifespan];

  if (v23)
  {
    char v24 = [v10 passcodeInputLifespan];
    int v25 = [v24 intValue];

    if (v25 <= 0)
    {
      if (__osLog) {
        __int16 v32 = __osLog;
      }
      else {
        __int16 v32 = v13;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      *(_DWORD *)buf = 136316162;
      v38 = "[configuration.passcodeInputLifespan intValue] > 0";
      __int16 v39 = 2048;
      id v40 = 0;
      __int16 v41 = 2080;
      *(void *)v42 = &unk_1B3B370EE;
      *(_WORD *)&v42[8] = 2080;
      *(void *)&v42[10] = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v43 = 1024;
      int v44 = 367;
LABEL_44:
      _os_log_impl(&dword_1B3AF1000, v32, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_45:
      uint64_t v31 = 3;
LABEL_46:
      uint64_t v26 = +[BKErrorHelper errorWithCode:v31];
      v12[2](v12, 0, v26);
      goto LABEL_17;
    }
  }
  if (v11)
  {
    int v35 = @"BKOptionAuthWithCredentialSet";
    id v36 = v11;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  }
  else
  {
    uint64_t v26 = 0;
  }
  id v27 = self->_xpcClient;
  __int16 v28 = [v10 dictionary];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __70__BKDevice_setSystemProtectedConfiguration_credentialSet_async_reply___block_invoke;
  v33[3] = &unk_1E6067D28;
  uint64_t v34 = v12;
  [(BiometricKitXPCClient *)v27 setSystemProtectedConfiguration:v28 withOptions:v26 async:v7 withReply:v33];

LABEL_17:
  if (__osLogTrace) {
    uint64_t v29 = __osLogTrace;
  }
  else {
    uint64_t v29 = v13;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v29, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> void\n", buf, 2u);
  }
}

void __70__BKDevice_setSystemProtectedConfiguration_credentialSet_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      id v4 = __osLogTrace;
    }
    else {
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (__osLogTrace) {
      id v5 = __osLogTrace;
    }
    else {
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 67109378;
      int v7 = 1;
      __int16 v8 = 2112;
      id v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::setSystemProtectedConfiguration:credentialSet: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_error___block_invoke;
  v12[3] = &unk_1E6068140;
  void v12[4] = &v19;
  v12[5] = &v13;
  [(BKDevice *)self setSystemProtectedConfiguration:v8 credentialSet:v9 async:0 reply:v12];
  if (a5) {
    *a5 = (id) v14[5];
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __64__BKDevice_setSystemProtectedConfiguration_credentialSet_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)setSystemProtectedConfiguration:(id)a3 credentialSet:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke;
  v10[3] = &unk_1E6068190;
  id v11 = v8;
  id v9 = v8;
  [(BKDevice *)self setSystemProtectedConfiguration:a3 credentialSet:a4 async:1 reply:v10];
}

void __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __64__BKDevice_setSystemProtectedConfiguration_credentialSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)bioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    char v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(void *)__int16 v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(void *)&v28[16] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::bioLockoutState:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);
  }
  uint64_t v26 = -1;
  if (a3)
  {
    int v13 = [(BiometricKitXPCClient *)self->_xpcClient getBioLockoutState:&v26 forUser:v6];
    if (v13)
    {
      id v20 = (void *)v13;
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = v9;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 436;
        _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice lockoutState:a3 fromDeviceLockoutState:v26 error:a5])
      {
        if (__osLogTrace) {
          id v14 = __osLogTrace;
        }
        else {
          id v14 = v9;
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        int64_t v15 = *a3;
        if (a5) {
          id v16 = *a5;
        }
        else {
          id v16 = 0;
        }
        *(_DWORD *)buf = 67109634;
        BOOL v17 = 1;
        *(_DWORD *)__int16 v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = v16;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::bioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog) {
        char v22 = __osLog;
      }
      else {
        char v22 = v9;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 439;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v28 = "state";
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(void *)&v28[20] = &unk_1B3B370EE;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v31 = 1024;
      int v32 = 433;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace) {
    uint64_t v23 = __osLogTrace;
  }
  else {
    uint64_t v23 = v9;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      int64_t v24 = *a3;
    }
    else {
      int64_t v24 = 0;
    }
    if (a5) {
      id v25 = *a5;
    }
    else {
      id v25 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(void *)&v28[16] = v25;
    _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "BKDevice::bioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)extendedBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    char v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(void *)__int16 v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(void *)&v28[16] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::extendedBioLockoutState:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);
  }
  uint64_t v26 = -1;
  if (a3)
  {
    int v13 = [(BiometricKitXPCClient *)self->_xpcClient getBioLockoutState:&v26 forUser:v6];
    if (v13)
    {
      id v20 = (void *)v13;
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = v9;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 464;
        _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice extendedLockoutState:a3 fromDeviceLockoutState:v26 error:a5])
      {
        if (__osLogTrace) {
          id v14 = __osLogTrace;
        }
        else {
          id v14 = v9;
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        int64_t v15 = *a3;
        if (a5) {
          id v16 = *a5;
        }
        else {
          id v16 = 0;
        }
        *(_DWORD *)buf = 67109634;
        BOOL v17 = 1;
        *(_DWORD *)__int16 v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = v16;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::extendedBioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog) {
        char v22 = __osLog;
      }
      else {
        char v22 = v9;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)__int16 v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 467;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v28 = "state";
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(void *)&v28[20] = &unk_1B3B370EE;
      __int16 v29 = 2080;
      __int16 v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v31 = 1024;
      int v32 = 461;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace) {
    uint64_t v23 = __osLogTrace;
  }
  else {
    uint64_t v23 = v9;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      int64_t v24 = *a3;
    }
    else {
      int64_t v24 = 0;
    }
    if (a5) {
      id v25 = *a5;
    }
    else {
      id v25 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(void *)&v28[16] = v25;
    _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "BKDevice::extendedBioLockoutState:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)expressModeState:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    char v12 = v10;
    int v25 = 134218496;
    *(void *)uint64_t v26 = a3;
    *(_WORD *)&v26[8] = 1024;
    *(_DWORD *)&v26[10] = v6;
    *(_WORD *)&v26[14] = 2048;
    *(void *)&v26[16] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::expressModeState:forUser: %p %d (_cid %lu)\n", (uint8_t *)&v25, 0x1Cu);
  }
  if (a3)
  {
    int v13 = [(BiometricKitXPCClient *)self->_xpcClient getExpressModeState:a3 forUser:v6];
    if (!v13)
    {
      if (__osLogTrace) {
        id v14 = __osLogTrace;
      }
      else {
        id v14 = v9;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      int64_t v15 = *a3;
      if (a5) {
        id v16 = *a5;
      }
      else {
        id v16 = 0;
      }
      int v25 = 67109634;
      BOOL v17 = 1;
      *(_DWORD *)uint64_t v26 = 1;
      *(_WORD *)&v26[4] = 2048;
      *(void *)&v26[6] = v15;
      *(_WORD *)&v26[14] = 2112;
      *(void *)&v26[16] = v16;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::expressModeState:forUser: -> %d %ld %@\n", (uint8_t *)&v25, 0x1Cu);
      return v17;
    }
    id v20 = (void *)v13;
    if (__osLog) {
      uint64_t v21 = __osLog;
    }
    else {
      uint64_t v21 = v9;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      *(void *)uint64_t v26 = "err == 0 ";
      *(_WORD *)&v26[8] = 2048;
      *(void *)&v26[10] = v20;
      *(_WORD *)&v26[18] = 2080;
      *(void *)&v26[20] = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v29 = 1024;
      int v30 = 491;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setErrorWithOSStatus(v20, a5);
  }
  else
  {
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136316162;
      *(void *)uint64_t v26 = "state";
      *(_WORD *)&v26[8] = 2048;
      *(void *)&v26[10] = 0;
      *(_WORD *)&v26[18] = 2080;
      *(void *)&v26[20] = &unk_1B3B370EE;
      __int16 v27 = 2080;
      __int16 v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v29 = 1024;
      int v30 = 488;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v25, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace) {
    char v22 = __osLogTrace;
  }
  else {
    char v22 = v9;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      int64_t v23 = *a3;
    }
    else {
      int64_t v23 = 0;
    }
    if (a5) {
      id v24 = *a5;
    }
    else {
      id v24 = 0;
    }
    int v25 = 67109634;
    *(_DWORD *)uint64_t v26 = 0;
    *(_WORD *)&v26[4] = 2048;
    *(void *)&v26[6] = v23;
    *(_WORD *)&v26[14] = 2112;
    *(void *)&v26[16] = v24;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "BKDevice::expressModeState:forUser: -> %d %ld %@\n", (uint8_t *)&v25, 0x1Cu);
  }
  return 0;
}

- (id)identitiesDatabaseUUIDForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v19 = 67109376;
    *(_DWORD *)id v20 = v5;
    *(_WORD *)&v20[4] = 2048;
    *(void *)&v20[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesDatabaseUUIDForUser: %d (_cid %lu)\n", (uint8_t *)&v19, 0x12u);
  }
  id v11 = [(BiometricKitXPCClient *)self->_xpcClient getIdentitiesDatabaseUUIDForUser:v5];
  if (v11)
  {
    if (__osLogTrace) {
      char v12 = __osLogTrace;
    }
    else {
      char v12 = v7;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    if (a4) {
      id v13 = *a4;
    }
    else {
      id v13 = 0;
    }
    int v19 = 138412546;
    *(void *)id v20 = v11;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v13;
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    setError((id)1, a4);
    if (__osLogTrace) {
      BOOL v17 = __osLogTrace;
    }
    else {
      BOOL v17 = v7;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0;
    }
    int v19 = 138412546;
    *(void *)id v20 = 0;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v18;
    id v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B3AF1000, v14, v15, "BKDevice::identitiesDatabaseUUIDForUser: -> %@ %@\n", (uint8_t *)&v19, 0x16u);
LABEL_16:
  return v11;
}

- (id)identitiesDatabaseHashForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v19 = 67109376;
    *(_DWORD *)id v20 = v5;
    *(_WORD *)&v20[4] = 2048;
    *(void *)&v20[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesDatabaseHashForUser: %d (_cid %lu)\n", (uint8_t *)&v19, 0x12u);
  }
  id v11 = [(BiometricKitXPCClient *)self->_xpcClient getIdentitiesDatabaseHashForUser:v5];
  if (v11)
  {
    if (__osLogTrace) {
      char v12 = __osLogTrace;
    }
    else {
      char v12 = v7;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    if (a4) {
      id v13 = *a4;
    }
    else {
      id v13 = 0;
    }
    int v19 = 138412546;
    *(void *)id v20 = v11;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v13;
    id v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    setError((id)1, a4);
    if (__osLogTrace) {
      BOOL v17 = __osLogTrace;
    }
    else {
      BOOL v17 = v7;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0;
    }
    int v19 = 138412546;
    *(void *)id v20 = 0;
    *(_WORD *)&v20[8] = 2112;
    *(void *)&v20[10] = v18;
    id v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B3AF1000, v14, v15, "BKDevice::identitiesDatabaseHashForUser: -> %@ %@\n", (uint8_t *)&v19, 0x16u);
LABEL_16:
  return v11;
}

- (BOOL)dropAllUnlockTokensWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v8 = v6;
    int v18 = 134217984;
    *(void *)int v19 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::dropAllUnlockTokens (_cid %lu)\n", (uint8_t *)&v18, 0xCu);
  }
  id v9 = (void *)[(BiometricKitXPCClient *)self->_xpcClient dropUnlockToken];
  if (v9)
  {
    if (__osLog) {
      os_log_type_t v15 = __osLog;
    }
    else {
      os_log_type_t v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)int v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(void *)id v20 = (int)v9;
      *(_WORD *)&v20[8] = 2080;
      uint64_t v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      int64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v24 = 1024;
      int v25 = 551;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v9, a3);
    if (__osLogTrace) {
      id v16 = __osLogTrace;
    }
    else {
      id v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v17 = *a3;
      }
      else {
        id v17 = 0;
      }
      int v18 = 67109634;
      *(_DWORD *)int v19 = 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v9;
      *(_WORD *)id v20 = 2112;
      *(void *)&v20[2] = v17;
      char v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v10 = __osLogTrace;
    }
    else {
      id v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v11 = *a3;
      }
      else {
        id v11 = 0;
      }
      int v18 = 67109634;
      *(_DWORD *)int v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)id v20 = 2112;
      *(void *)&v20[2] = v11;
      char v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v12, v13, "BKDevice::dropAllUnlockTokens -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
    }
  }
  return v9 == 0;
}

- (BOOL)forceBioLockoutForAllUsersWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v8 = v6;
    int v18 = 134217984;
    *(void *)int v19 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForAllUsers (_cid %lu)\n", (uint8_t *)&v18, 0xCu);
  }
  id v9 = (void *)[(BiometricKitXPCClient *)self->_xpcClient forceBioLockoutForUser:0xFFFFFFFFLL withOptions:0];
  if (v9)
  {
    if (__osLog) {
      os_log_type_t v15 = __osLog;
    }
    else {
      os_log_type_t v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)int v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(void *)id v20 = (int)v9;
      *(_WORD *)&v20[8] = 2080;
      uint64_t v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      int64_t v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v24 = 1024;
      int v25 = 573;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v9, a3);
    if (__osLogTrace) {
      id v16 = __osLogTrace;
    }
    else {
      id v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v17 = *a3;
      }
      else {
        id v17 = 0;
      }
      int v18 = 67109634;
      *(_DWORD *)int v19 = 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v9;
      *(_WORD *)id v20 = 2112;
      *(void *)&v20[2] = v17;
      char v12 = v16;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v10 = __osLogTrace;
    }
    else {
      id v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v11 = *a3;
      }
      else {
        id v11 = 0;
      }
      int v18 = 67109634;
      *(_DWORD *)int v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)id v20 = 2112;
      *(void *)&v20[2] = v11;
      char v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v12, v13, "BKDevice::dropAllUnlockTokens -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
    }
  }
  return v9 == 0;
}

- (BOOL)forceBioLockoutForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v21 = 67109376;
    *(_DWORD *)__int16 v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(void *)&v22[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForUser: %d (_cid %lu)\n", (uint8_t *)&v21, 0x12u);
  }
  if (v5 == -1)
  {
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      *(void *)__int16 v22 = "userID != 4294967295U";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = 0;
      *(_WORD *)&v22[18] = 2080;
      int64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v26 = 1024;
      int v27 = 594;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setError((id)1, a4);
    LODWORD(v17) = 0;
  }
  else
  {
    id v11 = (void *)[(BiometricKitXPCClient *)self->_xpcClient forceBioLockoutForUser:v5 withOptions:0];
    if (!v11)
    {
      if (__osLogTrace) {
        char v12 = __osLogTrace;
      }
      else {
        char v12 = v7;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v21 = 67109634;
      BOOL v14 = 1;
      *(_DWORD *)__int16 v22 = 1;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = 0;
      *(_WORD *)&v22[10] = 2112;
      *(void *)&v22[12] = v13;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
      return v14;
    }
    id v17 = v11;
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      *(void *)__int16 v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = (int)v17;
      *(_WORD *)&v22[18] = 2080;
      int64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v26 = 1024;
      int v27 = 597;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v17, a4);
  }
  if (__osLogTrace) {
    int v19 = __osLogTrace;
  }
  else {
    int v19 = v7;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v20 = *a4;
    }
    else {
      id v20 = 0;
    }
    int v21 = 67109634;
    *(_DWORD *)__int16 v22 = 0;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v17;
    *(_WORD *)&v22[10] = 2112;
    *(void *)&v22[12] = v20;
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "BKDevice::forceBioLockoutForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
  }
  return 0;
}

- (BOOL)forceBioLockoutIfLockedForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v21 = 67109376;
    *(_DWORD *)__int16 v22 = v5;
    *(_WORD *)&v22[4] = 2048;
    *(void *)&v22[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutIfLockedForUser: %d (_cid %lu)\n", (uint8_t *)&v21, 0x12u);
  }
  if (v5 == -1)
  {
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      *(void *)__int16 v22 = "userID != 4294967295U";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = 0;
      *(_WORD *)&v22[18] = 2080;
      int64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v26 = 1024;
      int v27 = 618;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setError((id)1, a4);
    LODWORD(v17) = 0;
  }
  else
  {
    id v11 = (void *)[(BiometricKitXPCClient *)self->_xpcClient forceBioLockoutForUser:v5 withOptions:&unk_1F0C52A58];
    if (!v11)
    {
      if (__osLogTrace) {
        char v12 = __osLogTrace;
      }
      else {
        char v12 = v7;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v21 = 67109634;
      BOOL v14 = 1;
      *(_DWORD *)__int16 v22 = 1;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = 0;
      *(_WORD *)&v22[10] = 2112;
      *(void *)&v22[12] = v13;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::forceBioLockoutIfLockedForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
      return v14;
    }
    id v17 = v11;
    if (__osLog) {
      int v18 = __osLog;
    }
    else {
      int v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136316162;
      *(void *)__int16 v22 = "err == 0 ";
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = (int)v17;
      *(_WORD *)&v22[18] = 2080;
      int64_t v23 = &unk_1B3B370EE;
      __int16 v24 = 2080;
      int v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v26 = 1024;
      int v27 = 621;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v21, 0x30u);
    }
    setErrorWithOSStatus(v17, a4);
  }
  if (__osLogTrace) {
    int v19 = __osLogTrace;
  }
  else {
    int v19 = v7;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v20 = *a4;
    }
    else {
      id v20 = 0;
    }
    int v21 = 67109634;
    *(_DWORD *)__int16 v22 = 0;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v17;
    *(_WORD *)&v22[10] = 2112;
    *(void *)&v22[12] = v20;
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "BKDevice::forceBioLockoutIfLockedForUser: -> %d(%{errno}d) %@\n", (uint8_t *)&v21, 0x18u);
  }
  return 0;
}

- (id)identityForUUID:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (char *)a3;
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v10 = v8;
    int v20 = 138412546;
    int v21 = v6;
    __int16 v22 = 2048;
    uint64_t v23 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::identityForUUID: %@ (_cid %lu)\n", (uint8_t *)&v20, 0x16u);
  }
  id v11 = [(BiometricKitXPCClient *)self->_xpcClient getIdentityFromUUID:v6];
  if (v11)
  {
    char v12 = [[BKIdentity alloc] initWithServerIdentity:v11 device:self];
    if (v12)
    {
      id v13 = v12;
      if (__osLogTrace) {
        BOOL v14 = __osLogTrace;
      }
      else {
        BOOL v14 = v7;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          id v15 = *a4;
        }
        else {
          id v15 = 0;
        }
        int v20 = 138412546;
        int v21 = (const char *)v13;
        __int16 v22 = 2112;
        uint64_t v23 = (uint64_t)v15;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::identityForUUID: -> %@ %@\n", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_31;
    }
  }
  else
  {
    if (__osLog) {
      id v16 = __osLog;
    }
    else {
      id v16 = v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      int v21 = "serverIdentity";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2080;
      int v25 = &unk_1B3B370EE;
      __int16 v26 = 2080;
      int v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v28 = 1024;
      int v29 = 643;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace) {
    id v17 = __osLogTrace;
  }
  else {
    id v17 = v7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0;
    }
    int v20 = 138412546;
    int v21 = 0;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v18;
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "BKDevice::identityForUUID: -> %@ %@\n", (uint8_t *)&v20, 0x16u);
  }
  id v13 = 0;
LABEL_31:

  return v13;
}

- (void)updateIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v13 = v11;
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: %@ (async %u, _cid %lu)\n", buf, 0x1Cu);
  }
  BOOL v14 = self->_xpcClient;
  id v15 = [v8 serverIdentity];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__BKDevice_updateIdentity_async_reply___block_invoke;
  v18[3] = &unk_1E6067D28;
  id v16 = v9;
  id v19 = v16;
  [(BiometricKitXPCClient *)v14 updateIdentity:v15 withOptions:0 async:v6 withReply:v18];

  if (__osLogTrace) {
    id v17 = __osLogTrace;
  }
  else {
    id v17 = v10;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: -> void\n", buf, 2u);
  }
}

void __39__BKDevice_updateIdentity_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      id v4 = __osLogTrace;
    }
    else {
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevice::updateIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
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
      id v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::updateIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)updateIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  BOOL v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__BKDevice_updateIdentity_error___block_invoke;
  v9[3] = &unk_1E6068140;
  v9[4] = &v16;
  v9[5] = &v10;
  [(BKDevice *)self updateIdentity:v6 async:0 reply:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v7 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __33__BKDevice_updateIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)updateIdentity:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__BKDevice_updateIdentity_reply___block_invoke;
  v8[3] = &unk_1E6068190;
  id v9 = v6;
  id v7 = v6;
  [(BKDevice *)self updateIdentity:a3 async:1 reply:v8];
}

void __33__BKDevice_updateIdentity_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BKDevice_updateIdentity_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__BKDevice_updateIdentity_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeIdentity:(id)a3 async:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v13 = v11;
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: %@ (async %u, _cid %lu)\n", buf, 0x1Cu);
  }
  BOOL v14 = self->_xpcClient;
  id v15 = [v8 serverIdentity];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__BKDevice_removeIdentity_async_reply___block_invoke;
  v18[3] = &unk_1E6067D28;
  id v16 = v9;
  id v19 = v16;
  [(BiometricKitXPCClient *)v14 removeIdentity:v15 withOptions:0 async:v6 withReply:v18];

  if (__osLogTrace) {
    id v17 = __osLogTrace;
  }
  else {
    id v17 = v10;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: -> void\n", buf, 2u);
  }
}

void __39__BKDevice_removeIdentity_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      id v4 = __osLogTrace;
    }
    else {
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevice::removeIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (__osLogTrace) {
      id v5 = __osLogTrace;
    }
    else {
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 67109378;
      int v7 = 1;
      __int16 v8 = 2112;
      id v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::removeIdentity: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  BOOL v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__BKDevice_removeIdentity_error___block_invoke;
  v9[3] = &unk_1E6068140;
  v9[4] = &v16;
  v9[5] = &v10;
  [(BKDevice *)self removeIdentity:v6 async:0 reply:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v7 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __33__BKDevice_removeIdentity_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeIdentity:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__BKDevice_removeIdentity_reply___block_invoke;
  v8[3] = &unk_1E6068190;
  id v9 = v6;
  id v7 = v6;
  [(BKDevice *)self removeIdentity:a3 async:1 reply:v8];
}

void __33__BKDevice_removeIdentity_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BKDevice_removeIdentity_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__BKDevice_removeIdentity_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 async:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v10 = __osLogTrace;
  }
  else {
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    char v12 = v10;
    *(_DWORD *)buf = 67109632;
    int v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: %d (async %u, _cid %lu)\n", buf, 0x18u);
  }
  id v13 = self->_xpcClient;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__BKDevice_removeAllIdentitiesForUser_async_reply___block_invoke;
  v16[3] = &unk_1E6067D28;
  id v14 = v8;
  id v17 = v14;
  [(BiometricKitXPCClient *)v13 removeAllIdentitiesForUser:v6 withOptions:0 async:v5 withReply:v16];
  if (__osLogTrace) {
    id v15 = __osLogTrace;
  }
  else {
    id v15 = v9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: -> void\n", buf, 2u);
  }
}

void __51__BKDevice_removeAllIdentitiesForUser_async_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[BKErrorHelper errorWithOSStatus:a2];
    if (__osLogTrace) {
      id v4 = __osLogTrace;
    }
    else {
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 67109378;
      int v7 = 0;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B3AF1000, v4, OS_LOG_TYPE_ERROR, "BKDevice::removeAllIdentitiesForUser: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (__osLogTrace) {
      BOOL v5 = __osLogTrace;
    }
    else {
      BOOL v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 67109378;
      int v7 = 1;
      __int16 v8 = 2112;
      id v9 = 0;
      _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKDevice::removeAllIdentitiesForUser: -> reply(%d, %@)\n", (uint8_t *)&v6, 0x12u);
    }
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeAllIdentitiesForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  char v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__BKDevice_removeAllIdentitiesForUser_error___block_invoke;
  v7[3] = &unk_1E6068140;
  v7[4] = &v14;
  v7[5] = &v8;
  [(BKDevice *)self removeAllIdentitiesForUser:*(void *)&a3 async:0 reply:v7];
  if (a4) {
    *a4 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __45__BKDevice_removeAllIdentitiesForUser_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke;
  v8[3] = &unk_1E6068190;
  id v9 = v6;
  id v7 = v6;
  [(BKDevice *)self removeAllIdentitiesForUser:v4 async:1 reply:v8];
}

void __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke_2;
  block[3] = &unk_1E6068168;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __45__BKDevice_removeAllIdentitiesForUser_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)identitiesWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v5 = __osLogTrace;
  }
  else {
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::identities (_cid %lu)\n", buf, 0xCu);
  }
  id v9 = [(BiometricKitXPCClient *)self->_xpcClient identities:0];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [[BKIdentity alloc] initWithServerIdentity:*(void *)(*((void *)&v28 + 1) + 8 * i) device:self];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    if (v10)
    {
      if (__osLogTrace) {
        char v17 = __osLogTrace;
      }
      else {
        char v17 = v4;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v17;
        uint64_t v19 = [v10 count];
        __int16 v20 = a3;
        if (a3) {
          __int16 v20 = *a3;
        }
        *(_DWORD *)buf = 134218498;
        uint64_t v34 = (const char *)v19;
        __int16 v35 = 2114;
        id v36 = v10;
        __int16 v37 = 2112;
        v38 = v20;
        _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKDevice::identities -> %lu: %{public}@ %@\n", buf, 0x20u);
      }
      goto LABEL_36;
    }
  }
  else
  {
    if (__osLog) {
      BOOL v21 = __osLog;
    }
    else {
      BOOL v21 = v4;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v34 = "serverIdentities";
      __int16 v35 = 2048;
      id v36 = 0;
      __int16 v37 = 2080;
      v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      id v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v41 = 1024;
      int v42 = 830;
      _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a3);
  }
  if (__osLogTrace) {
    __int16 v22 = __osLogTrace;
  }
  else {
    __int16 v22 = v4;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = v22;
    uint64_t v24 = [0 count];
    uint64_t v25 = a3;
    if (a3) {
      uint64_t v25 = *a3;
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v34 = (const char *)v24;
    __int16 v35 = 2114;
    id v36 = 0;
    __int16 v37 = 2112;
    v38 = v25;
    _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "BKDevice::identities -> %lu: %{public}@ %@\n", buf, 0x20u);
  }
  id v10 = 0;
LABEL_36:

  return v10;
}

- (id)identitiesForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v7 = __osLogTrace;
  }
  else {
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v9 = v7;
    uint64_t v10 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v36 = v4;
    *(_WORD *)&v36[4] = 2048;
    *(void *)&v36[6] = v10;
    _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser: %d (_cid %lu)\n", buf, 0x12u);
  }
  id v11 = self->_xpcClient;
  uint64_t v43 = @"BKFilterUserID";
  uint64_t v12 = [NSNumber numberWithUnsignedInt:v4];
  v44[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  uint64_t v14 = [(BiometricKitXPCClient *)v11 identities:v13];

  if (v14)
  {
    id v15 = v6;
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = [[BKIdentity alloc] initWithServerIdentity:*(void *)(*((void *)&v30 + 1) + 8 * i) device:self];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v19);
    }

    id v6 = v15;
    if (v16)
    {
      if (__osLogTrace) {
        uint64_t v23 = __osLogTrace;
      }
      else {
        uint64_t v23 = v15;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = a4;
        if (a4) {
          uint64_t v24 = *a4;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)id v36 = v16;
        *(_WORD *)&v36[8] = 2112;
        *(void *)&v36[10] = v24;
        _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v25 = __osLog;
    }
    else {
      uint64_t v25 = v6;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)id v36 = "serverIdentities";
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = 0;
      __int16 v37 = 2080;
      v38 = &unk_1B3B370EE;
      __int16 v39 = 2080;
      id v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v41 = 1024;
      int v42 = 856;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace) {
    uint64_t v26 = __osLogTrace;
  }
  else {
    uint64_t v26 = v6;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = a4;
    if (a4) {
      int v27 = *a4;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)id v36 = 0;
    *(_WORD *)&v36[8] = 2112;
    *(void *)&v36[10] = v27;
    _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "BKDevice::identitiesForUser: -> %@ %@\n", buf, 0x16u);
  }
  uint64_t v16 = 0;
LABEL_36:

  return v16;
}

- (id)maxIdentityCountWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v6 = __osLogTrace;
  }
  else {
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v8 = v6;
    int v20 = 134217984;
    uint64_t v21 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::maxIdentityCount (_cid %lu)\n", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[BiometricKitXPCClient getMaxIdentityCount:](self->_xpcClient, "getMaxIdentityCount:", 0));
  uint64_t v10 = (void *)v9;
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = v5;
  }
  if (v9)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    uint64_t v12 = v11;
    uint64_t v13 = [v10 integerValue];
    if (a3) {
      id v14 = *a3;
    }
    else {
      id v14 = 0;
    }
    int v20 = 134218242;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    id v23 = v14;
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v12 = v11;
    uint64_t v15 = [0 integerValue];
    if (a3) {
      id v16 = *a3;
    }
    else {
      id v16 = 0;
    }
    int v20 = 134218242;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    id v23 = v16;
    id v17 = v12;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B3AF1000, v17, v18, "BKDevice::maxIdentityCount -> %ld %@\n", (uint8_t *)&v20, 0x16u);

LABEL_21:
  return v10;
}

- (id)freeIdentityCountForUser:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v10 = v8;
    int v22 = 67109376;
    *(_DWORD *)id v23 = v5;
    *(_WORD *)&v23[4] = 2048;
    *(void *)&v23[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser: %d (_cid %lu)\n", (uint8_t *)&v22, 0x12u);
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[BiometricKitXPCClient getFreeIdentityCount:forUser:](self->_xpcClient, "getFreeIdentityCount:forUser:", 0, v5));
  uint64_t v12 = (void *)v11;
  if (__osLogTrace) {
    uint64_t v13 = __osLogTrace;
  }
  else {
    uint64_t v13 = v7;
  }
  if (v11)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    id v14 = v13;
    uint64_t v15 = [v12 integerValue];
    if (a4) {
      id v16 = *a4;
    }
    else {
      id v16 = 0;
    }
    int v22 = 134218242;
    *(void *)id v23 = v15;
    *(_WORD *)&v23[8] = 2112;
    *(void *)&v23[10] = v16;
    uint64_t v19 = v14;
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    id v14 = v13;
    uint64_t v17 = [0 integerValue];
    if (a4) {
      id v18 = *a4;
    }
    else {
      id v18 = 0;
    }
    int v22 = 134218242;
    *(void *)id v23 = v17;
    *(_WORD *)&v23[8] = 2112;
    *(void *)&v23[10] = v18;
    uint64_t v19 = v14;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B3AF1000, v19, v20, "BKDevice::freeIdentityCountForUser: -> %ld %@\n", (uint8_t *)&v22, 0x16u);

LABEL_21:
  return v12;
}

- (BOOL)biometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v10 = __osLogTrace;
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v12 = v10;
    *(_DWORD *)buf = 134218496;
    *(void *)long long v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v6;
    *(_WORD *)&v28[14] = 2048;
    *(void *)&v28[16] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::biometryAvailability:forUser: %p %d (_cid %lu)\n", buf, 0x1Cu);
  }
  uint64_t v26 = 0;
  if (a3)
  {
    int v13 = [(BiometricKitXPCClient *)self->_xpcClient getBiometryAvailability:&v26 forUser:v6];
    if (v13)
    {
      os_log_type_t v20 = (void *)v13;
      if (__osLog) {
        uint64_t v21 = __osLog;
      }
      else {
        uint64_t v21 = v9;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)long long v28 = "err == 0 ";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = v20;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        long long v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 921;
        _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      setErrorWithOSStatus(v20, a5);
    }
    else
    {
      if (+[BKDevice biometryAvailabilityInfo:a3 fromDeviceInfo:v26 error:a5])
      {
        if (__osLogTrace) {
          id v14 = __osLogTrace;
        }
        else {
          id v14 = v9;
        }
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        int64_t v15 = *a3;
        if (a5) {
          id v16 = *a5;
        }
        else {
          id v16 = 0;
        }
        *(_DWORD *)buf = 67109634;
        BOOL v17 = 1;
        *(_DWORD *)long long v28 = 1;
        *(_WORD *)&v28[4] = 2048;
        *(void *)&v28[6] = v15;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = v16;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::biometryAvailability:forUser: -> %d %ld %@\n", buf, 0x1Cu);
        return v17;
      }
      if (__osLog) {
        int v22 = __osLog;
      }
      else {
        int v22 = v9;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)long long v28 = "result";
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = 0;
        *(_WORD *)&v28[18] = 2080;
        *(void *)&v28[20] = &unk_1B3B370EE;
        __int16 v29 = 2080;
        long long v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v31 = 1024;
        int v32 = 924;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
  }
  else
  {
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v9;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)long long v28 = "info";
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = 0;
      *(_WORD *)&v28[18] = 2080;
      *(void *)&v28[20] = &unk_1B3B370EE;
      __int16 v29 = 2080;
      long long v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v31 = 1024;
      int v32 = 918;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace) {
    id v23 = __osLogTrace;
  }
  else {
    id v23 = v9;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      int64_t v24 = *a3;
    }
    else {
      int64_t v24 = 0;
    }
    if (a5) {
      id v25 = *a5;
    }
    else {
      id v25 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)long long v28 = 0;
    *(_WORD *)&v28[4] = 2048;
    *(void *)&v28[6] = v24;
    *(_WORD *)&v28[14] = 2112;
    *(void *)&v28[16] = v25;
    _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "BKDevice::biometryAvailability:forUser: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (id)lastMatchEventWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v6 = __osLogTrace;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 134217984;
    int64_t v24 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKDevice::lastMatchEventWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_xpcClient;
  id v22 = 0;
  int v10 = [(BiometricKitXPCClient *)v9 getLastMatchEvent:&v22];
  id v11 = v22;
  if (v10)
  {
    BOOL v17 = (void *)v10;
    if (__osLog) {
      id v18 = __osLog;
    }
    else {
      id v18 = v5;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int64_t v24 = "err == 0 ";
      __int16 v25 = 2048;
      id v26 = v17;
      __int16 v27 = 2080;
      long long v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      long long v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v31 = 1024;
      int v32 = 947;
      _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v17, a3);
  }
  else
  {
    uint64_t v12 = +[BKMatchEvent matchEventWithDictionary:v11 device:self error:a3];
    if (v12)
    {
      int v13 = (char *)v12;
      if (__osLogTrace) {
        id v14 = __osLogTrace;
      }
      else {
        id v14 = v5;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          id v15 = *a3;
        }
        else {
          id v15 = 0;
        }
        *(_DWORD *)buf = 138412546;
        int64_t v24 = v13;
        __int16 v25 = 2112;
        id v26 = v15;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKDevice::lastMatchEventWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_16;
    }
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v5;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      int64_t v24 = "matchEvent";
      __int16 v25 = 2048;
      id v26 = 0;
      __int16 v27 = 2080;
      long long v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      long long v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v31 = 1024;
      int v32 = 950;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  if (__osLogTrace) {
    os_log_type_t v20 = __osLogTrace;
  }
  else {
    os_log_type_t v20 = v5;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v21 = *a3;
    }
    else {
      id v21 = 0;
    }
    *(_DWORD *)buf = 138412546;
    int64_t v24 = 0;
    __int16 v25 = 2112;
    id v26 = v21;
    _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "BKDevice::lastMatchEventWithError: -> %@ %@\n", buf, 0x16u);
  }
  int v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)deviceHardwareState:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v8 = __osLogTrace;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    int v10 = v8;
    *(_DWORD *)buf = 134218240;
    *(void *)__int16 v25 = a3;
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceHardwareState: %p (_cid %lu)\n", buf, 0x16u);
  }
  unsigned int v23 = 0;
  if (a3)
  {
    int v11 = [(BiometricKitXPCClient *)self->_xpcClient getDeviceHardwareState:&v23];
    if (!v11)
    {
      if (v23 < 3) {
        *a3 = v23;
      }
      if (__osLogTrace) {
        uint64_t v12 = __osLogTrace;
      }
      else {
        uint64_t v12 = v7;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      unint64_t v13 = *a3;
      if (a4) {
        id v14 = *a4;
      }
      else {
        id v14 = 0;
      }
      *(_DWORD *)buf = 67109634;
      BOOL v15 = 1;
      *(_DWORD *)__int16 v25 = 1;
      *(_WORD *)&v25[4] = 2048;
      *(void *)&v25[6] = v13;
      *(_WORD *)&v25[14] = 2112;
      *(void *)&v25[16] = v14;
      _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::deviceHardwareState: -> %d %ld %@\n", buf, 0x1Cu);
      return v15;
    }
    id v18 = (void *)v11;
    if (__osLog) {
      uint64_t v19 = __osLog;
    }
    else {
      uint64_t v19 = v7;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v25 = "err == 0 ";
      *(_WORD *)&v25[8] = 2048;
      *(void *)&v25[10] = v18;
      *(_WORD *)&v25[18] = 2080;
      *(void *)&v25[20] = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v28 = 1024;
      int v29 = 973;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v18, a4);
  }
  else
  {
    if (__osLog) {
      BOOL v17 = __osLog;
    }
    else {
      BOOL v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v25 = "outState";
      *(_WORD *)&v25[8] = 2048;
      *(void *)&v25[10] = 0;
      *(_WORD *)&v25[18] = 2080;
      *(void *)&v25[20] = &unk_1B3B370EE;
      __int16 v26 = 2080;
      __int16 v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v28 = 1024;
      int v29 = 970;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a4);
  }
  if (__osLogTrace) {
    os_log_type_t v20 = __osLogTrace;
  }
  else {
    os_log_type_t v20 = v7;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      unint64_t v21 = *a3;
    }
    else {
      unint64_t v21 = 0;
    }
    if (a4) {
      id v22 = *a4;
    }
    else {
      id v22 = 0;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v25 = 0;
    *(_WORD *)&v25[4] = 2048;
    *(void *)&v25[6] = v21;
    *(_WORD *)&v25[14] = 2112;
    *(void *)&v25[16] = v22;
    _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "BKDevice::deviceHardwareState: -> %d %ld %@\n", buf, 0x1Cu);
  }
  return 0;
}

- (id)accessoryGroupsWithError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    v38 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoryGroupsWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_xpcClient;
  id v35 = 0;
  int v10 = [(BiometricKitXPCClient *)v9 listAccessories:&v35];
  id v11 = v35;
  if (v10)
  {
    int64_t v24 = (void *)v10;
    if (__osLog) {
      __int16 v25 = __osLog;
    }
    else {
      __int16 v25 = v4;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v38 = "err == 0 ";
      __int16 v39 = 2048;
      id v40 = v24;
      __int16 v41 = 2080;
      int v42 = &unk_1B3B370EE;
      __int16 v43 = 2080;
      int v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v45 = 1024;
      int v46 = 1003;
      _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v24, a3);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v19 = [BKAccessoryGroup alloc];
          os_log_type_t v20 = [v18 group];
          unint64_t v21 = [(BKAccessoryGroup *)v19 initWithServerAccessoryGroup:v20 device:self];
          [v12 addObject:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }

    uint64_t v4 = MEMORY[0x1E4F14500];
    if (v12)
    {
      if (__osLogTrace) {
        id v22 = __osLogTrace;
      }
      else {
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = a3;
        if (a3) {
          unsigned int v23 = *a3;
        }
        *(_DWORD *)buf = 138412546;
        v38 = (const char *)v12;
        __int16 v39 = 2112;
        id v40 = v23;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoryGroupsWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  if (__osLogTrace) {
    __int16 v26 = __osLogTrace;
  }
  else {
    __int16 v26 = v4;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = a3;
    if (a3) {
      __int16 v27 = *a3;
    }
    *(_DWORD *)buf = 138412546;
    v38 = 0;
    __int16 v39 = 2112;
    id v40 = v27;
    _os_log_impl(&dword_1B3AF1000, v26, OS_LOG_TYPE_ERROR, "BKDevice::accessoryGroupsWithError: -> %@ %@\n", buf, 0x16u);
  }
  uint64_t v12 = 0;
LABEL_36:
  __int16 v28 = [v12 allObjects];

  return v28;
}

- (id)accessoriesWithError:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    id v35 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoriesWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_xpcClient;
  id v32 = 0;
  int v10 = [(BiometricKitXPCClient *)v9 listAccessories:&v32];
  id v11 = v32;
  if (v10)
  {
    id v22 = (void *)v10;
    if (__osLog) {
      unsigned int v23 = __osLog;
    }
    else {
      unsigned int v23 = v4;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v35 = "err == 0 ";
      __int16 v36 = 2048;
      __int16 v37 = v22;
      __int16 v38 = 2080;
      __int16 v39 = &unk_1B3B370EE;
      __int16 v40 = 2080;
      __int16 v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v42 = 1024;
      int v43 = 1029;
      _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v22, a3);
  }
  else
  {
    uint64_t v12 = v4;
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [[BKAccessory alloc] initWithServerAccessory:*(void *)(*((void *)&v28 + 1) + 8 * i) device:self];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v16);
    }

    uint64_t v4 = v12;
    if (v13)
    {
      if (__osLogTrace) {
        os_log_type_t v20 = __osLogTrace;
      }
      else {
        os_log_type_t v20 = v12;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v21 = a3;
        if (a3) {
          unint64_t v21 = *a3;
        }
        *(_DWORD *)buf = 138412546;
        id v35 = (const char *)v13;
        __int16 v36 = 2112;
        __int16 v37 = v21;
        _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_DEFAULT, "BKDevice::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_36;
    }
  }
  if (__osLogTrace) {
    int64_t v24 = __osLogTrace;
  }
  else {
    int64_t v24 = v4;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __int16 v25 = a3;
    if (a3) {
      __int16 v25 = *a3;
    }
    *(_DWORD *)buf = 138412546;
    id v35 = 0;
    __int16 v36 = 2112;
    __int16 v37 = v25;
    _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "BKDevice::accessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  id v13 = 0;
LABEL_36:

  return v13;
}

- (id)connectedAccessoriesWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v7 = v5;
    uint64_t v8 = [(BiometricKitXPCClient *)xpcClient connectionId];
    *(_DWORD *)buf = 134217984;
    __int16 v36 = (const char *)v8;
    _os_log_impl(&dword_1B3AF1000, v7, OS_LOG_TYPE_DEFAULT, "BKDevice::connectedAccessoriesWithError: (_cid %lu)\n", buf, 0xCu);
  }
  uint64_t v9 = self->_xpcClient;
  id v33 = 0;
  int v10 = [(BiometricKitXPCClient *)v9 listAccessories:&v33];
  id v11 = v33;
  if (v10)
  {
    unsigned int v23 = (void *)v10;
    if (__osLog) {
      int64_t v24 = __osLog;
    }
    else {
      int64_t v24 = v4;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      __int16 v36 = "err == 0 ";
      __int16 v37 = 2048;
      __int16 v38 = v23;
      __int16 v39 = 2080;
      __int16 v40 = &unk_1B3B370EE;
      __int16 v41 = 2080;
      __int16 v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v43 = 1024;
      int v44 = 1055;
      _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus(v23, a3);
  }
  else
  {
    uint64_t v12 = v4;
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (([v19 flags] & 2) != 0)
          {
            os_log_type_t v20 = [[BKAccessory alloc] initWithServerAccessory:v19 device:self];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v16);
    }

    uint64_t v4 = v12;
    if (v13)
    {
      if (__osLogTrace) {
        unint64_t v21 = __osLogTrace;
      }
      else {
        unint64_t v21 = v12;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = a3;
        if (a3) {
          id v22 = *a3;
        }
        *(_DWORD *)buf = 138412546;
        __int16 v36 = (const char *)v13;
        __int16 v37 = 2112;
        __int16 v38 = v22;
        _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_DEFAULT, "BKDevice::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  if (__osLogTrace) {
    __int16 v25 = __osLogTrace;
  }
  else {
    __int16 v25 = v4;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = a3;
    if (a3) {
      __int16 v26 = *a3;
    }
    *(_DWORD *)buf = 138412546;
    __int16 v36 = 0;
    __int16 v37 = 2112;
    __int16 v38 = v26;
    _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "BKDevice::connectedAccessoriesWithError: -> %@ %@\n", buf, 0x16u);
  }
  id v13 = 0;
LABEL_38:

  return v13;
}

- (id)identitiesForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5
{
  uint64_t v5 = *(void *)&a3;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v9 = __osLogTrace;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    id v11 = v9;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v42 = v5;
    *(_WORD *)&v42[4] = 2112;
    *(void *)&v42[6] = v7;
    *(_WORD *)&v42[14] = 2048;
    *(void *)&v42[16] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser:accessoryGroup: %d %@ (_cid %lu)\n", buf, 0x1Cu);
  }
  uint64_t v12 = self->_xpcClient;
  uint64_t v47 = @"BKFilterUserID";
  id v13 = [NSNumber numberWithUnsignedInt:v5];
  v48[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  uint64_t v15 = [(BiometricKitXPCClient *)v12 identities:v14];

  if (v15)
  {
    uint64_t v16 = self;
    [MEMORY[0x1E4F1CA48] array];
    long long v34 = v15;
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          unsigned int v23 = [v22 accessory];
          int64_t v24 = [v23 group];
          int v25 = [v7 isEqualToServerAccessoryGroup:v24];

          if (v25)
          {
            __int16 v26 = [[BKIdentity alloc] initWithServerIdentity:v22 device:v16];
            [v35 addObject:v26];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v19);
    }

    uint64_t v15 = v34;
    uint64_t v8 = MEMORY[0x1E4F14500];
    if (v35)
    {
      if (__osLogTrace) {
        __int16 v27 = __osLogTrace;
      }
      else {
        __int16 v27 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = a5;
        if (a5) {
          long long v28 = *a5;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v42 = v35;
        *(_WORD *)&v42[8] = 2112;
        *(void *)&v42[10] = v28;
        _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_DEFAULT, "BKDevice::identitiesForUser:accessoryGroup: -> %@ %@\n", buf, 0x16u);
      }
      goto LABEL_38;
    }
  }
  else
  {
    if (__osLog) {
      long long v29 = __osLog;
    }
    else {
      long long v29 = v8;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v42 = "serverIdentities";
      *(_WORD *)&v42[8] = 2048;
      *(void *)&v42[10] = 0;
      *(_WORD *)&unsigned char v42[18] = 2080;
      *(void *)&v42[20] = &unk_1B3B370EE;
      __int16 v43 = 2080;
      int v44 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v45 = 1024;
      int v46 = 1082;
      _os_log_impl(&dword_1B3AF1000, v29, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a5);
  }
  if (__osLogTrace) {
    long long v30 = __osLogTrace;
  }
  else {
    long long v30 = v8;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    long long v31 = a5;
    if (a5) {
      long long v31 = *a5;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)__int16 v42 = 0;
    *(_WORD *)&v42[8] = 2112;
    *(void *)&v42[10] = v31;
    _os_log_impl(&dword_1B3AF1000, v30, OS_LOG_TYPE_ERROR, "BKDevice::identitiesForUser:accessoryGroup: -> %@ %@\n", buf, 0x16u);
  }
  id v35 = 0;
LABEL_38:

  return v35;
}

- (id)freeIdentityCountForUser:(unsigned int)a3 accessoryGroup:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    int v10 = __osLogTrace;
  }
  else {
    int v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    uint64_t v12 = v10;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)long long v30 = v6;
    *(_WORD *)&v30[4] = 2048;
    *(void *)&v30[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser:accessoryGroup: %d (_cid %lu)\n", buf, 0x12u);
  }
  uint64_t v28 = 0;
  id v13 = self->_xpcClient;
  id v14 = [v8 serverAccessoryGroup];
  int v15 = [(BiometricKitXPCClient *)v13 getFreeIdentityCount:&v28 forUser:v6 accessoryGroup:v14];

  if (v15)
  {
    if (__osLog) {
      id v22 = __osLog;
    }
    else {
      id v22 = v9;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)long long v30 = "err == 0 ";
      *(_WORD *)&v30[8] = 2048;
      *(void *)&v30[10] = v15;
      __int16 v31 = 2080;
      long long v32 = &unk_1B3B370EE;
      __int16 v33 = 2080;
      long long v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v35 = 1024;
      int v36 = 1110;
      _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setErrorWithOSStatus((id)v15, a5);
  }
  else
  {
    uint64_t v16 = [NSNumber numberWithInteger:v28];
    if (v16)
    {
      id v17 = (void *)v16;
      if (__osLogTrace) {
        uint64_t v18 = __osLogTrace;
      }
      else {
        uint64_t v18 = v9;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v18;
        uint64_t v20 = [v17 integerValue];
        if (a5) {
          id v21 = *a5;
        }
        else {
          id v21 = 0;
        }
        *(_DWORD *)buf = 134218242;
        *(void *)long long v30 = v20;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v21;
        _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_DEFAULT, "BKDevice::freeIdentityCountForUser:accessoryGroup: -> %ld %@\n", buf, 0x16u);
      }
      goto LABEL_31;
    }
  }
  if (__osLogTrace) {
    unsigned int v23 = __osLogTrace;
  }
  else {
    unsigned int v23 = v9;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int64_t v24 = v23;
    uint64_t v25 = [0 integerValue];
    if (a5) {
      id v26 = *a5;
    }
    else {
      id v26 = 0;
    }
    *(_DWORD *)buf = 134218242;
    *(void *)long long v30 = v25;
    *(_WORD *)&v30[8] = 2112;
    *(void *)&v30[10] = v26;
    _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_ERROR, "BKDevice::freeIdentityCountForUser:accessoryGroup: -> %ld %@\n", buf, 0x16u);
  }
  id v17 = 0;
LABEL_31:

  return v17;
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v6 == 500)
  {
    uint64_t v9 = [(BKDevice *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = +[BKMatchEvent matchEventWithDictionary:v8 device:self error:0];
      if (v11)
      {
        if (__osLog) {
          uint64_t v12 = __osLog;
        }
        else {
          uint64_t v12 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          id v14 = [(BKDevice *)self delegate];
          int v15 = [(BKDevice *)self delegate];
          *(_DWORD *)buf = 134218754;
          uint64_t v20 = v14;
          __int16 v21 = 2112;
          id v22 = v15;
          __int16 v23 = 1024;
          int v24 = [v11 result];
          __int16 v25 = 2048;
          uint64_t v26 = [v11 timeStamp];
          _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKDevice::statusMessage: %p(%@) matchEventOccurred: result=%u, timeStamp=%llu\n", buf, 0x26u);
        }
        uint64_t v16 = [(BKDevice *)self dispatchQueue];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __41__BKDevice_statusMessage_details_client___block_invoke;
        v17[3] = &unk_1E6068040;
        v17[4] = self;
        id v18 = v11;
        dispatch_async(v16, v17);
      }
    }
  }
  else
  {
    [(BKDevice *)self statusMessage:v6 client:a5];
  }
}

void __41__BKDevice_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 device:*(void *)(a1 + 32) matchEventOccurred:*(void *)(a1 + 40)];
}

- (BOOL)isDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

+ (BOOL)lockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((a4 & 0x40) != 0)
    {
      int64_t v6 = 6;
    }
    else if ((a4 & 0x100) != 0)
    {
      int64_t v6 = 7;
    }
    else if ((a4 & 0x10) != 0)
    {
      int64_t v6 = 2;
    }
    else if ((a4 & 2) != 0)
    {
      int64_t v6 = 3;
    }
    else if ((a4 & 4) != 0)
    {
      int64_t v6 = 4;
    }
    else if ((a4 & 8) != 0)
    {
      int64_t v6 = 1;
    }
    else if ((a4 & 0x800) != 0)
    {
      int64_t v6 = 8;
    }
    else
    {
      int64_t v6 = 5;
    }
    *a3 = v6;
  }
  else
  {
    if (__osLog) {
      uint64_t v9 = __osLog;
    }
    else {
      uint64_t v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136316162;
      id v11 = "state";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      int v15 = &unk_1B3B370EE;
      __int16 v16 = 2080;
      id v17 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v18 = 1024;
      int v19 = 1244;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v10, 0x30u);
    }
    setError((id)1, a5);
  }
  return a3 != 0;
}

+ (BOOL)extendedLockoutState:(int64_t *)a3 fromDeviceLockoutState:(int64_t)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v6 = a4 & 6 | ((unint64_t)a4 >> 2) & 0x40 | ((unint64_t)a4 >> 3) & 8 | ((unint64_t)a4 >> 4) & 1;
    *a3 = v6;
    uint64_t v7 = v6;
    if ((a4 & 8) == 0)
    {
      uint64_t v7 = v6 | 0x10;
      *a3 = v6 | 0x10;
      if ((a4 & 0x800) != 0)
      {
        uint64_t v7 = v6 | 0x90;
        *a3 = v6 | 0x90;
      }
    }
    if ((a4 & 0x200) == 0) {
      *a3 = v7 | 0x20;
    }
  }
  else
  {
    if (__osLog) {
      int v10 = __osLog;
    }
    else {
      int v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136316162;
      __int16 v12 = "state";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = &unk_1B3B370EE;
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
      __int16 v19 = 1024;
      int v20 = 1293;
      _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    }
    setError((id)1, a5);
  }
  return a3 != 0;
}

+ (BOOL)biometryAvailabilityInfo:(int64_t *)a3 fromDeviceInfo:(int64_t)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    switch(a4)
    {
      case 3:
        int64_t v7 = 3;
        break;
      case 2:
        int64_t v7 = 2;
        break;
      case 1:
        BOOL result = 1;
        *a3 = 1;
        return result;
      default:
        if (__osLog) {
          id v8 = __osLog;
        }
        else {
          id v8 = MEMORY[0x1E4F14500];
        }
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        int v9 = 136316162;
        int v10 = "0";
        __int16 v11 = 2048;
        uint64_t v12 = 0;
        __int16 v13 = 2080;
        uint64_t v14 = &unk_1B3B370EE;
        __int16 v15 = 2080;
        __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
        __int16 v17 = 1024;
        int v18 = 1349;
        goto LABEL_14;
    }
    *a3 = v7;
    return 1;
  }
  if (__osLog) {
    id v8 = __osLog;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  int v9 = 136316162;
  int v10 = "info";
  __int16 v11 = 2048;
  uint64_t v12 = 0;
  __int16 v13 = 2080;
  uint64_t v14 = &unk_1B3B370EE;
  __int16 v15 = 2080;
  __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevice.m";
  __int16 v17 = 1024;
  int v18 = 1342;
LABEL_14:
  _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v9, 0x30u);
LABEL_15:
  setError((id)1, a5);
  return 0;
}

- (BKDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BKDeviceDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKDeviceDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end