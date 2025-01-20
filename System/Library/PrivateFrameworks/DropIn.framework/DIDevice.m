@interface DIDevice
+ (BOOL)supportsSecureCoding;
+ (id)stringForDeviceState:(int64_t)a3;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (DIDevice)init;
- (DIDevice)initWithCoder:(id)a3;
- (DIDeviceDelegate)delegate;
- (DIDeviceStateUpdateThrottler)stateUpdateThrottler;
- (DIOneshotTimer)timer;
- (DIXPCConnectionManager)connectionManager;
- (NSDate)stateExpiration;
- (NSRecursiveLock)lock;
- (NSString)name;
- (NSString)stateReason;
- (NSUUID)homeKitHomeIdentifier;
- (NSUUID)homeKitIdentifier;
- (NSUUID)idsIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDeviceDidChange;
- (void)notifyDidUpdateState;
- (void)refreshStateWithCompletionHandler:(id)a3;
- (void)setConnectionManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeKitHomeIdentifier:(id)a3;
- (void)setHomeKitIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsCurrentDevice:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateExpiration:(id)a3;
- (void)setStateReason:(id)a3;
- (void)setTimer:(id)a3;
- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)updateWithDevice:(id)a3 updateState:(BOOL)a4;
@end

@implementation DIDevice

- (DIDevice)init
{
  v13.receiver = self;
  v13.super_class = (Class)DIDevice;
  v2 = [(DIDevice *)&v13 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26FF62CC0;

    v3->_state = 0;
    uint64_t v5 = [MEMORY[0x263EFF910] distantPast];
    stateExpiration = v3->_stateExpiration;
    v3->_stateExpiration = (NSDate *)v5;

    stateReason = v3->_stateReason;
    v3->_stateReason = (NSString *)@"unknown";

    v3->_isCurrentDevice = 0;
    uint64_t v8 = objc_opt_new();
    lock = v3->_lock;
    v3->_lock = (NSRecursiveLock *)v8;

    v10 = [[DIDeviceStateUpdateThrottler alloc] initWithThrottleTimeInterval:10.0];
    stateUpdateThrottler = v3->_stateUpdateThrottler;
    v3->_stateUpdateThrottler = v10;
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  uint64_t v5 = DILogHandleDevice();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = &stru_26FF62CC0;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_24D00D000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DIDevice *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v6 = [(DIDevice *)self homeKitIdentifier];
      v7 = [(DIDevice *)v5 homeKitIdentifier];
      char v8 = [v6 isEqual:v7];
      if (v8) {
        goto LABEL_4;
      }
      v12 = [(DIDevice *)self homeKitIdentifier];
      if (v12)
      {
        BOOL v11 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v14 = [(DIDevice *)v5 homeKitIdentifier];
      if (!v14)
      {
LABEL_4:
        id v9 = [(DIDevice *)self homeKitHomeIdentifier];
        uint64_t v10 = [(DIDevice *)v5 homeKitHomeIdentifier];
        if ([v9 isEqual:v10])
        {

          BOOL v11 = 1;
          if (v8) {
            goto LABEL_19;
          }
        }
        else
        {
          objc_super v13 = [(DIDevice *)self homeKitHomeIdentifier];
          if (v13)
          {

            BOOL v11 = 0;
            if (v8) {
              goto LABEL_19;
            }
          }
          else
          {
            v15 = [(DIDevice *)v5 homeKitHomeIdentifier];
            BOOL v11 = v15 == 0;

            if (v8)
            {
LABEL_19:

              goto LABEL_20;
            }
          }
        }
      }
      else
      {

        BOOL v11 = 0;
      }
      v12 = 0;
      goto LABEL_18;
    }
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void)setStateExpiration:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_stateExpiration, a3);
  [(DIDevice *)self setTimer:0];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  char v8 = [MEMORY[0x263EFF910] now];
  [v8 timeIntervalSince1970];
  double v10 = v9;

  if (v7 > v10)
  {
    [v5 timeIntervalSinceNow];
    double v12 = v11;
    objc_super v13 = [(DIDevice *)self homeKitIdentifier];
    v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)objc_opt_new();
    }
    v16 = v15;

    objc_initWeak(&location, self);
    v17 = [DIOneshotTimer alloc];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __31__DIDevice_setStateExpiration___block_invoke;
    v19[3] = &unk_2652FCA80;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    v18 = [(DIOneshotTimer *)v17 initWithInterval:0 queue:v16 identifier:@"DeviceExpiration" label:v19 handler:v12];
    [(DIDevice *)self setTimer:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

uint64_t __31__DIDevice_setStateExpiration___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];

  v2 = DILogHandleDevice();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v7 = &stru_26FF62CC0;
    _os_log_impl(&dword_24D00D000, v2, OS_LOG_TYPE_DEFAULT, "%@Drop In availability expired: updating state to unavailable.", buf, 0xCu);
  }

  v3 = [*(id *)(a1 + 32) lock];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__DIDevice_setStateExpiration___block_invoke_39;
  v5[3] = &unk_2652FCA58;
  v5[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "di_synchronize:", v5);

  [*(id *)(a1 + 32) notifyDeviceDidChange];
  return [*(id *)(a1 + 32) notifyDidUpdateState];
}

uint64_t __31__DIDevice_setStateExpiration___block_invoke_39(uint64_t a1)
{
  [*(id *)(a1 + 32) setStateReason:@"Drop In Availability Expired"];
  v2 = *(void **)(a1 + 32);
  return [v2 setState:1];
}

- (unint64_t)hash
{
  v2 = [(DIDevice *)self homeKitIdentifier];
  v3 = [v2 UUIDString];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)description
{
  id v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = [(DIDevice *)self name];
  unint64_t v4 = [(DIDevice *)self homeKitHomeIdentifier];
  id v5 = [(DIDevice *)self homeKitIdentifier];
  double v6 = +[DIDevice stringForDeviceState:[(DIDevice *)self state]];
  double v7 = [(DIDevice *)self stateReason];
  uint64_t v8 = [(DIDevice *)self stateExpiration];
  BOOL v9 = [(DIDevice *)self isCurrentDevice];
  double v10 = [(DIDevice *)self connectionManager];
  double v11 = [(DIDevice *)self delegate];
  double v12 = [v15 stringWithFormat:@"<%@: %p> Nm = %@, HmID = %@, AccID = %@, St = %@, Rsn = %@, Exp: %@, IsCurrDev = %d, ConnMgr = %p, Delegate = %@", v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_opt_new();
  id v5 = [(DIDevice *)self lock];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__DIDevice_copyWithZone___block_invoke;
  v9[3] = &unk_2652FC928;
  id v6 = v4;
  id v10 = v6;
  double v11 = self;
  objc_msgSend(v5, "di_synchronize:", v9);

  id v7 = v6;
  return v7;
}

uint64_t __25__DIDevice_copyWithZone___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) delegate];
  [*(id *)(a1 + 32) setDelegate:v2];

  v3 = [*(id *)(a1 + 40) connectionManager];
  [*(id *)(a1 + 32) setConnectionManager:v3];

  unint64_t v4 = [*(id *)(a1 + 40) name];
  [*(id *)(a1 + 32) setName:v4];

  id v5 = [*(id *)(a1 + 40) homeKitIdentifier];
  [*(id *)(a1 + 32) setHomeKitIdentifier:v5];

  id v6 = [*(id *)(a1 + 40) homeKitHomeIdentifier];
  [*(id *)(a1 + 32) setHomeKitHomeIdentifier:v6];

  id v7 = [*(id *)(a1 + 40) idsIdentifier];
  [*(id *)(a1 + 32) setIdsIdentifier:v7];

  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentDevice:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"));
  objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  uint64_t v8 = [*(id *)(a1 + 40) stateReason];
  [*(id *)(a1 + 32) setStateReason:v8];

  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) stateExpiration];
  return MEMORY[0x270F9A758]();
}

+ (id)stringForDeviceState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    v3 = @"Drop In State Unknown";
  }
  else {
    v3 = off_2652FCB18[a3 - 1];
  }
  return (id)[NSString stringWithFormat:@"(%lu) %@", a3, v3];
}

- (void)updateState:(int64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = DILogHandleDevice();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    double v11 = _Block_copy(v9);
    *(_DWORD *)buf = 138413058;
    v27 = &stru_26FF62CC0;
    __int16 v28 = 2048;
    int64_t v29 = a3;
    __int16 v30 = 2112;
    v31 = v11;
    __int16 v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_24D00D000, v10, OS_LOG_TYPE_DEBUG, "%@Requesting state update to %ld. Handler = %@, Device = %@", buf, 0x2Au);
  }
  if ([(DIDevice *)self isCurrentDevice])
  {
    double v12 = [(DIDevice *)self stateUpdateThrottler];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_2;
    v21[3] = &unk_2652FCAD0;
    v21[4] = self;
    id v22 = v9;
    id v13 = v9;
    [v12 handleState:a3 reason:v8 handler:v21];

    id v14 = v22;
  }
  else
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.dropin" code:2 userInfo:0];
    v16 = DILogHandleDevice();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = &stru_26FF62CC0;
      __int16 v28 = 2112;
      int64_t v29 = (int64_t)v15;
      _os_log_impl(&dword_24D00D000, v16, OS_LOG_TYPE_ERROR, "%@Attempting to update state for non-current device %@", buf, 0x16u);
    }

    v17 = [(DIDevice *)self connectionManager];
    v18 = [v17 manager];
    v19 = [v18 clientQueue];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke;
    v23[3] = &unk_2652FC7D0;
    id v24 = v15;
    id v25 = v9;
    id v14 = v15;
    id v20 = v9;
    +[DIUtilities onQueue:v19 block:v23];
  }
}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = DILogHandleDevice();
  id v9 = v8;
  if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      int64_t v29 = &stru_26FF62CC0;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_24D00D000, v9, OS_LOG_TYPE_DEBUG, "%@Throttled State Update Request. Handler = %@", buf, 0x16u);
    }
    double v11 = [*(id *)(a1 + 32) connectionManager];
    double v12 = [v11 manager];
    id v13 = [v12 clientQueue];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_63;
    v26[3] = &unk_2652FCAA8;
    id v27 = *(id *)(a1 + 40);
    +[DIUtilities onQueue:v13 block:v26];

    id v14 = v27;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      int64_t v29 = &stru_26FF62CC0;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_24D00D000, v9, OS_LOG_TYPE_DEFAULT, "%@Allowing State Update Request. Handler = %@", buf, 0x16u);
    }
    v16 = [*(id *)(a1 + 32) connectionManager];
    v17 = [v16 manager];
    v18 = [v17 connection];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_64;
    v24[3] = &unk_2652FC7F8;
    v19 = *(void **)(a1 + 40);
    v24[4] = *(void *)(a1 + 32);
    id v25 = v19;
    id v20 = [v18 remoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_2_67;
    v22[3] = &unk_2652FC7F8;
    v21 = *(void **)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    id v23 = v21;
    [v20 updateState:a2 reason:v7 completionHandler:v22];

    id v14 = v25;
  }
}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = DILogHandleDevice();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = &stru_26FF62CC0;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to update state %@", buf, 0x16u);
  }

  id v5 = [*(id *)(a1 + 32) connectionManager];
  id v6 = [v5 manager];
  id v7 = [v6 clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_65;
  v10[3] = &unk_2652FC7D0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  +[DIUtilities onQueue:v7 block:v10];
}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__DIDevice_updateState_reason_completionHandler___block_invoke_2_67(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = DILogHandleDevice();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = &stru_26FF62CC0;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to update state %@", buf, 0x16u);
    }
  }
  id v5 = [*(id *)(a1 + 32) connectionManager];
  id v6 = [v5 manager];
  id v7 = [v6 clientQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__DIDevice_updateState_reason_completionHandler___block_invoke_68;
  v10[3] = &unk_2652FC7D0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  +[DIUtilities onQueue:v7 block:v10];
}

uint64_t __49__DIDevice_updateState_reason_completionHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)notifyDeviceDidChange
{
  id v3 = [(DIDevice *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(DIDevice *)self connectionManager];
    id v6 = [v5 manager];
    id v7 = [v6 clientQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__DIDevice_notifyDeviceDidChange__block_invoke;
    v8[3] = &unk_2652FCA58;
    v8[4] = self;
    +[DIUtilities onQueue:v7 block:v8];
  }
}

void __33__DIDevice_notifyDeviceDidChange__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 deviceDidChange:*(void *)(a1 + 32)];

  id v3 = DILogHandleDevice();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412546;
    id v6 = &stru_26FF62CC0;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Call delegate device did change %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)notifyDidUpdateState
{
  id v3 = [(DIDevice *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(DIDevice *)self connectionManager];
    id v6 = [v5 manager];
    __int16 v7 = [v6 clientQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__DIDevice_notifyDidUpdateState__block_invoke;
    v8[3] = &unk_2652FCA58;
    v8[4] = self;
    +[DIUtilities onQueue:v7 block:v8];
  }
}

void __32__DIDevice_notifyDidUpdateState__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "device:didUpdateState:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "state"));

  id v3 = DILogHandleDevice();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) state];
    int v5 = 138412546;
    id v6 = &stru_26FF62CC0;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_24D00D000, v3, OS_LOG_TYPE_DEFAULT, "%@Call delegate did update state %ld", (uint8_t *)&v5, 0x16u);
  }
}

- (void)updateWithDevice:(id)a3 updateState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  __int16 v7 = DILogHandleDevice();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = &stru_26FF62CC0;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    id v20 = v6;
    _os_log_impl(&dword_24D00D000, v7, OS_LOG_TYPE_DEFAULT, "%@Update device:\n%@\n\nWith other device:\n%@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  id v20 = 0;
  uint64_t v8 = [(DIDevice *)self lock];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __41__DIDevice_updateWithDevice_updateState___block_invoke;
  id v14 = &unk_2652FCAF8;
  __int16 v15 = self;
  id v9 = v6;
  BOOL v18 = v4;
  id v16 = v9;
  uint64_t v17 = buf;
  objc_msgSend(v8, "di_synchronize:", &v11);

  [(DIDevice *)self notifyDeviceDidChange];
  if (v4)
  {
    uint64_t v10 = *(void *)(*(void *)&buf[8] + 24);
    if (v10 != [(DIDevice *)self state]) {
      [(DIDevice *)self notifyDidUpdateState];
    }
  }

  _Block_object_dispose(buf, 8);
}

void __41__DIDevice_updateWithDevice_updateState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) name];
  [*(id *)(a1 + 32) setName:v2];

  id v3 = [*(id *)(a1 + 40) homeKitIdentifier];
  [*(id *)(a1 + 32) setHomeKitIdentifier:v3];

  BOOL v4 = [*(id *)(a1 + 40) homeKitHomeIdentifier];
  [*(id *)(a1 + 32) setHomeKitHomeIdentifier:v4];

  int v5 = [*(id *)(a1 + 40) idsIdentifier];
  [*(id *)(a1 + 32) setIdsIdentifier:v5];

  objc_msgSend(*(id *)(a1 + 32), "setIsCurrentDevice:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"));
  if (*(unsigned char *)(a1 + 56))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) state];
    objc_msgSend(*(id *)(a1 + 32), "setState:", objc_msgSend(*(id *)(a1 + 40), "state"));
    id v6 = [*(id *)(a1 + 40) stateReason];
    [*(id *)(a1 + 32) setStateReason:v6];

    id v7 = [*(id *)(a1 + 40) stateExpiration];
    [*(id *)(a1 + 32) setStateExpiration:v7];
  }
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(DIDevice *)self connectionManager];
  id v6 = [v5 manager];
  id v7 = [v6 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke;
  v13[3] = &unk_2652FC7F8;
  v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_2652FC7F8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 requestStateForDevice:self completionHandler:v11];
}

void __46__DIDevice_refreshStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DILogHandleDevice();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    __int16 v15 = &stru_26FF62CC0;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_24D00D000, v4, OS_LOG_TYPE_ERROR, "%@Failed to request state for device %@, error = %@", buf, 0x20u);
  }

  id v6 = [*(id *)(a1 + 32) connectionManager];
  id v7 = [v6 manager];
  id v8 = [v7 clientQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_74;
  v11[3] = &unk_2652FC7D0;
  id v9 = *(id *)(a1 + 40);
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  +[DIUtilities onQueue:v8 block:v11];
}

uint64_t __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DILogHandleDevice();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = &stru_26FF62CC0;
      __int16 v22 = 2112;
      id v23 = v3;
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      id v7 = "%@Failed to refresh state for device. Error = %@, Device = %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 32;
LABEL_6:
      _os_log_impl(&dword_24D00D000, v8, v9, v7, buf, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = &stru_26FF62CC0;
    __int16 v22 = 2112;
    id v23 = v11;
    id v7 = "%@Refreshed state for device %@";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 22;
    goto LABEL_6;
  }

  id v12 = [*(id *)(a1 + 32) connectionManager];
  id v13 = [v12 manager];
  id v14 = [v13 clientQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_75;
  v17[3] = &unk_2652FC7D0;
  id v15 = *(id *)(a1 + 40);
  id v18 = v3;
  id v19 = v15;
  id v16 = v3;
  +[DIUtilities onQueue:v14 block:v17];
}

uint64_t __46__DIDevice_refreshStateWithCompletionHandler___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DIDevice *)self lock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__DIDevice_encodeWithCoder___block_invoke;
  v7[3] = &unk_2652FC928;
  id v8 = v4;
  os_log_type_t v9 = self;
  id v6 = v4;
  objc_msgSend(v5, "di_synchronize:", v7);
}

void __28__DIDevice_encodeWithCoder___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) name];
  [v2 encodeObject:v3 forKey:@"Name"];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) homeKitIdentifier];
  [v4 encodeObject:v5 forKey:@"HomeKitIdentifier"];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) homeKitHomeIdentifier];
  [v6 encodeObject:v7 forKey:@"HomeKitHomeIdentifier"];

  id v8 = *(void **)(a1 + 32);
  os_log_type_t v9 = [*(id *)(a1 + 40) idsIdentifier];
  [v8 encodeObject:v9 forKey:@"IDSIdentifier"];

  objc_msgSend(*(id *)(a1 + 32), "encodeBool:forKey:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice"), @"IsCurrentDevice");
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", objc_msgSend(*(id *)(a1 + 40), "state"), @"State");
  uint32_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) stateReason];
  [v10 encodeObject:v11 forKey:@"StateReason"];

  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) stateExpiration];
  [v12 encodeObject:v13 forKey:@"StateExpiration"];
}

- (DIDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DIDevice *)self init];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  if (v6)
  {
    objc_storeStrong((id *)&v5->_name, v6);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StateExpiration"];
    if (v7)
    {
      id v8 = v7;
      objc_storeStrong((id *)&v5->_stateExpiration, v7);
      os_log_type_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StateReason"];
      if (v9)
      {
        stateReason = v5->_stateReason;
        v5->_stateReason = v9;
        uint64_t v11 = v9;

        uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeKitIdentifier"];
        homeKitIdentifier = v5->_homeKitIdentifier;
        v5->_homeKitIdentifier = (NSUUID *)v12;

        uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeKitHomeIdentifier"];
        homeKitHomeIdentifier = v5->_homeKitHomeIdentifier;
        v5->_homeKitHomeIdentifier = (NSUUID *)v14;

        uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IDSIdentifier"];
        idsIdentifier = v5->_idsIdentifier;
        v5->_idsIdentifier = (NSUUID *)v16;

        v5->_isCurrentDevice = [v4 decodeBoolForKey:@"IsCurrentDevice"];
        v5->_state = [v4 decodeIntegerForKey:@"State"];

LABEL_6:
        id v6 = v5;
        goto LABEL_9;
      }
    }
    id v6 = 0;
  }
LABEL_9:

  return v6;
}

- (DIDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DIDeviceDelegate *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)homeKitIdentifier
{
  return self->_homeKitIdentifier;
}

- (void)setHomeKitIdentifier:(id)a3
{
}

- (NSUUID)homeKitHomeIdentifier
{
  return self->_homeKitHomeIdentifier;
}

- (void)setHomeKitHomeIdentifier:(id)a3
{
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(id)a3
{
}

- (NSDate)stateExpiration
{
  return self->_stateExpiration;
}

- (BOOL)isCurrentDevice
{
  return self->_isCurrentDevice;
}

- (void)setIsCurrentDevice:(BOOL)a3
{
  self->_isCurrentDevice = a3;
}

- (DIXPCConnectionManager)connectionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionManager);
  return (DIXPCConnectionManager *)WeakRetained;
}

- (void)setConnectionManager:(id)a3
{
}

- (DIOneshotTimer)timer
{
  return (DIOneshotTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTimer:(id)a3
{
}

- (DIDeviceStateUpdateThrottler)stateUpdateThrottler
{
  return self->_stateUpdateThrottler;
}

- (NSRecursiveLock)lock
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_stateUpdateThrottler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_stateExpiration, 0);
  objc_storeStrong((id *)&self->_stateReason, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end