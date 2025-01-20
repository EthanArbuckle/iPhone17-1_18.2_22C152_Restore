@interface BKSHIDUISensorService
+ (id)sharedInstance;
- (BKSHIDUISensorCharacteristics)sensorCharacteristics;
- (BKSHIDUISensorService)init;
- (id)requestUISensorMode:(id)a3;
- (id)suppressUISensorChangesForReason:(id)a3;
- (void)_lock_pushCurrentModeToServer;
- (void)proximityDidUnoccludeAfterWake;
@end

@implementation BKSHIDUISensorService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_prevailingMode, 0);
  objc_storeStrong((id *)&self->_suppressionAssertion, 0);
  objc_storeStrong((id *)&self->_modeAssertion, 0);
}

- (void)_lock_pushCurrentModeToServer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (([(BSCompoundAssertion *)self->_suppressionAssertion isActive] & 1) == 0)
  {
    v3 = [(BSCompoundAssertion *)self->_modeAssertion orderedContext];
    v4 = [v3 array];
    v5 = +[BKSHIDUISensorMode _prevailingMode:v4];

    p_lock_prevailingMode = &self->_lock_prevailingMode;
    if (BSEqualObjects())
    {
LABEL_19:

      return;
    }
    if ((unint64_t)[v3 count] < 2)
    {
      v7 = BKLogUISensor();
      BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (!v9) {
          goto LABEL_12;
        }
        *(_DWORD *)buf = 138543362;
        id v18 = v5;
        v10 = "prevailing client request: %{public}@";
        v11 = v7;
        uint32_t v12 = 12;
      }
      else
      {
        if (!v9) {
          goto LABEL_12;
        }
        *(_WORD *)buf = 0;
        v10 = "prevailing client request: none!";
        v11 = v7;
        uint32_t v12 = 2;
      }
      _os_log_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
    else
    {
      v7 = BKLogUISensor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v3];
        *(_DWORD *)buf = 138543618;
        id v18 = v5;
        __int16 v19 = 2114;
        v20 = v8;
        _os_log_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEFAULT, "prevailing client request: %{public}@ all modes:%{public}@", buf, 0x16u);
      }
    }
LABEL_12:

    objc_storeStrong((id *)p_lock_prevailingMode, v5);
    if (v5)
    {
      id v16 = 0;
      v13 = [MEMORY[0x1E4F4F808] encodeObject:v5 error:&v16];
      id v14 = v16;
      if (!v13)
      {
        v13 = BKLogUISensor();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v18 = v14;
          __int16 v19 = 2114;
          v20 = v5;
          _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "error encoding BKSHIDUISensorMode: %{public}@ : %{public}@", buf, 0x16u);
        }
        goto LABEL_18;
      }
    }
    else
    {
      id v14 = 0;
      v13 = 0;
    }
    int v15 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDRequestUISensorMode(v15, [v13 bs_bytesForMIG], [v13 bs_lengthForMIG]);
LABEL_18:

    goto LABEL_19;
  }
}

- (BKSHIDUISensorCharacteristics)sensorCharacteristics
{
  if (sensorCharacteristics_onceToken != -1) {
    dispatch_once(&sensorCharacteristics_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sensorCharacteristics_sCharacteristics;
  return (BKSHIDUISensorCharacteristics *)v2;
}

void __46__BKSHIDUISensorService_sensorCharacteristics__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  unsigned int v9 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  int v1 = _BKSHIDGetUISensorCharacteristics(v0, &v10, &v9);
  if (v1)
  {
    int v2 = v1;
    v3 = BKLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v2;
      _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "Mach IPC error getting UI sensor characteristics: 0x%x", buf, 8u);
    }
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", v10, v9);
    if (v3)
    {
      id v8 = 0;
      uint64_t v4 = [MEMORY[0x1E4F4F808] decodeObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
      id v5 = v8;
      v6 = (void *)sensorCharacteristics_sCharacteristics;
      sensorCharacteristics_sCharacteristics = v4;

      if (!sensorCharacteristics_sCharacteristics)
      {
        v7 = BKLogCommon();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v12 = v5;
          _os_log_error_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_ERROR, "decoding characteristics failed: %{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)proximityDidUnoccludeAfterWake
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDProximityDidUnoccludeAfterScreenWake(v2);
}

- (id)requestUISensorMode:(id)a3
{
  modeAssertion = self->_modeAssertion;
  id v4 = a3;
  id v5 = [v4 reason];
  v6 = [(BSCompoundAssertion *)modeAssertion acquireForReason:v5 withContext:v4];

  return v6;
}

- (id)suppressUISensorChangesForReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_suppressionAssertion acquireForReason:a3];
}

- (BKSHIDUISensorService)init
{
  v17.receiver = self;
  v17.super_class = (Class)BKSHIDUISensorService;
  mach_port_t v2 = [(BKSHIDUISensorService *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (void *)MEMORY[0x1E4F4F6E8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __29__BKSHIDUISensorService_init__block_invoke;
    v15[3] = &unk_1E5440EC8;
    id v5 = v2;
    id v16 = v5;
    uint64_t v6 = [v4 assertionWithIdentifier:@"BKSHIDUISensorMode mode requests" stateDidChangeHandler:v15];
    modeAssertion = v5->_modeAssertion;
    v5->_modeAssertion = (BSCompoundAssertion *)v6;

    id v8 = (void *)MEMORY[0x1E4F4F6E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __29__BKSHIDUISensorService_init__block_invoke_2;
    v13[3] = &unk_1E5440EC8;
    unsigned int v9 = v5;
    id v14 = v9;
    uint64_t v10 = [v8 assertionWithIdentifier:@"BKSHIDUISensorMode suppress mode changes" stateDidChangeHandler:v13];
    suppressionAssertion = v9->_suppressionAssertion;
    v9->_suppressionAssertion = (BSCompoundAssertion *)v10;
  }
  return v3;
}

void __29__BKSHIDUISensorService_init__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_pushCurrentModeToServer");
  mach_port_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock(v2);
}

void __29__BKSHIDUISensorService_init__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_pushCurrentModeToServer");
  mach_port_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock(v2);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_178 != -1) {
    dispatch_once(&sharedInstance_onceToken_178, &__block_literal_global_179);
  }
  mach_port_t v2 = (void *)sharedInstance_service_180;
  return v2;
}

uint64_t __39__BKSHIDUISensorService_sharedInstance__block_invoke()
{
  int v0 = objc_alloc_init(BKSHIDUISensorService);
  uint64_t v1 = sharedInstance_service_180;
  sharedInstance_service_180 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end