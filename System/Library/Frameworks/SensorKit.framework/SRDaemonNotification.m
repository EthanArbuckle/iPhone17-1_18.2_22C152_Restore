@interface SRDaemonNotification
+ (void)initialize;
- (id)initWithSensor:(void *)a1;
- (void)dealloc;
@end

@implementation SRDaemonNotification

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogDaemonNotification = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDaemonNotification");
  }
}

- (id)initWithSensor:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)SRDaemonNotification;
  id v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    *((void *)v3 + 4) = [a2 copy];
    objc_initWeak(&location, v3);
    v4 = (void *)*((void *)v3 + 4);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke;
    v11[3] = &unk_26452E270;
    objc_copyWeak(&v12, &location);
    SRRegisterForDarwinNotification(v4, (int *)v3 + 2, v11);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_5;
    v9[3] = &unk_26452E270;
    objc_copyWeak(&v10, &location);
    SRRegisterForDarwinNotification(@"com.apple.SensorKit.significantTimeChange", (int *)v3 + 3, v9);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_8;
    v7[3] = &unk_26452E270;
    objc_copyWeak(&v8, &location);
    SRRegisterForDarwinNotification(@"com.apple.SensorKit.resetDatastore", (int *)v3 + 4, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  if (self)
  {
    SRUnregisterForNotification((uint64_t)self->_sensorIdentifier, &self->_registrationToken);
    SRUnregisterForNotification(@"com.apple.SensorKit.significantTimeChange", &self->_significantTimeChangeToken);
    SRUnregisterForNotification(@"com.apple.SensorKit.resetDatastore", &self->_resetDatastoreToken);
  }

  self->_sensorIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDaemonNotification;
  [(SRDaemonNotification *)&v3 dealloc];
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    if (Weak) {
      uint64_t v5 = *((void *)Weak + 4);
    }
    else {
      uint64_t v5 = 0;
    }
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@ to re-connect to the daemon", (uint8_t *)&v6, 0xCu);
    if (Weak) {
      goto LABEL_3;
    }
LABEL_8:
    id v3 = 0;
    return [v3 daemonNotificationDaemonDidStart:Weak];
  }
  if (!Weak) {
    goto LABEL_8;
  }
LABEL_3:
  id v3 = objc_loadWeak((id *)Weak + 3);
  return [v3 daemonNotificationDaemonDidStart:Weak];
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_5(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    int v6 = @"com.apple.SensorKit.significantTimeChange";
    _os_log_debug_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@", (uint8_t *)&v5, 0xCu);
    if (Weak) {
      goto LABEL_3;
    }
  }
  else if (Weak)
  {
LABEL_3:
    id v3 = objc_loadWeak(Weak + 3);
    goto LABEL_4;
  }
  id v3 = 0;
LABEL_4:
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [v3 daemonNotificationDaemonDidChangeTimeSignificantly:Weak];
  }
  return result;
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_8(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138543362;
    int v6 = @"com.apple.SensorKit.resetDatastore";
    _os_log_debug_impl(&dword_21FCA3000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@", (uint8_t *)&v5, 0xCu);
    if (Weak) {
      goto LABEL_3;
    }
  }
  else if (Weak)
  {
LABEL_3:
    id v3 = objc_loadWeak(Weak + 3);
    goto LABEL_4;
  }
  id v3 = 0;
LABEL_4:
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [v3 daemonNotificationDaemonDidResetDatastore:Weak];
  }
  return result;
}

- (void).cxx_destruct
{
}

@end