@interface ITAttentionAwareIdleTimer
- (BOOL)isEnabled;
- (ITAttentionAwareIdleTimer)init;
- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4;
- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5;
- (ITAttentionAwarenessContext)_context;
- (ITIdleTimerDelegate)delegate;
- (ITIdleTimerDescriptor)descriptor;
- (NSString)description;
- (id)_access_generateConfiguration;
- (id)_configurationWithIdentifier:(id)a3 descriptor:(id)a4 context:(id)a5;
- (id)_initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5 client:(id)a6;
- (id)_timeoutDictionaryForTimeouts:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_access_reconfigureAttentionClientAndReset:(BOOL)a3;
- (void)_prototypeSettingsChanged;
- (void)client:(id)a3 attentionLostTimeoutDidExpire:(id)a4 forContext:(id)a5;
- (void)clientDidReset:(id)a3 forUserAttentionEvent:(id)a4 withContext:(id)a5;
- (void)reset;
- (void)setDescriptor:(id)a3 resettingTimer:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation ITAttentionAwareIdleTimer

- (ITAttentionAwareIdleTimer)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ITAttentionAwareIdleTimer.m" lineNumber:49 description:@"wrong initializer"];

  return 0;
}

- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)BSDispatchQueueCreateWithQualityOfService();
  v9 = [(ITAttentionAwareIdleTimer *)self initWithConfigurationIdentifier:v7 delegate:v6 calloutQueue:v8];

  return v9;
}

- (ITAttentionAwareIdleTimer)initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[ITAttentionAwarenessClient alloc] initWithCalloutQueue:v8];
  v12 = [(ITAttentionAwareIdleTimer *)self _initWithConfigurationIdentifier:v10 delegate:v9 calloutQueue:v8 client:v11];

  return v12;
}

- (id)_initWithConfigurationIdentifier:(id)a3 delegate:(id)a4 calloutQueue:(id)a5 client:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ITAttentionAwareIdleTimer;
  v12 = [(ITAttentionAwareIdleTimer *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_accessLock = 0;
    uint64_t v14 = [v9 copy];
    configurationIdentifier = v13->_configurationIdentifier;
    v13->_configurationIdentifier = (NSString *)v14;

    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_access_client, a6);
    [(ITAttentionAwarenessClient *)v13->_access_client setDelegate:v13];
    uint64_t v16 = +[ITAttentionAwarenessDomain rootSettings];
    settings = v13->_settings;
    v13->_settings = (ITAttentionAwarenessSettings *)v16;

    [(PTSettings *)v13->_settings addKeyObserver:v13];
    [(ITAttentionAwareIdleTimer *)v13 _prototypeSettingsChanged];
  }

  return v13;
}

- (ITIdleTimerDescriptor)descriptor
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = (void *)[(ITIdleTimerDescriptor *)self->_access_descriptor copy];
  os_unfair_recursive_lock_unlock();

  return (ITIdleTimerDescriptor *)v3;
}

- (void)setDescriptor:(id)a3 resettingTimer:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  id v7 = [v25 timeouts];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"ITAttentionAwareIdleTimer.m" lineNumber:96 description:@"Descriptor must have at least one timeout."];
  }
  char v9 = [v25 attentionMaintenanceEventMask];
  [v25 attentionSamplingStartDelay];
  [v25 attentionSamplingPeriod];
  uint64_t v11 = v10;
  if (v9 < 0)
  {
    if (!BSFloatGreaterThanFloat() || BSFloatEqualToFloat())
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      v13 = v12;
      uint64_t v24 = v11;
      uint64_t v14 = @"The sampling period: %g must be valid when face detection is enabled.";
      SEL v15 = a2;
      uint64_t v16 = self;
      uint64_t v17 = 103;
      goto LABEL_14;
    }
  }
  else
  {
    if ((BSFloatIsZero() & 1) == 0)
    {
      v23 = [MEMORY[0x263F08690] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"ITAttentionAwareIdleTimer.m", 105, @"Face detection is not enabled, so the sampling period must be zero." object file lineNumber description];
    }
    if ((BSFloatIsZero() & 1) == 0)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      v13 = v12;
      uint64_t v14 = @"Face detection is not enabled, so the sampling delay must be zero.";
      SEL v15 = a2;
      uint64_t v16 = self;
      uint64_t v17 = 106;
LABEL_14:
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, @"ITAttentionAwareIdleTimer.m", v17, v14, v24);
    }
  }
  os_unfair_recursive_lock_lock_with_options();
  v18 = objc_alloc_init(ITAttentionAwarenessContext);
  access_context = self->_access_context;
  self->_access_context = v18;

  v20 = (ITIdleTimerDescriptor *)[v25 copy];
  access_descriptor = self->_access_descriptor;
  self->_access_descriptor = v20;

  [(ITAttentionAwareIdleTimer *)self _access_reconfigureAttentionClientAndReset:v4];
  os_unfair_recursive_lock_unlock();
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_access_descriptor)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ITAttentionAwareIdleTimer.m" lineNumber:122 description:@"Can't reset timer with nil descriptor"];
  }
  BOOL v4 = objc_alloc_init(ITAttentionAwarenessContext);
  access_context = self->_access_context;
  self->_access_context = v4;

  if (![(ITAttentionAwarenessClient *)self->_access_client isEnabled]) {
    [(ITAttentionAwarenessClient *)self->_access_client setEnabled:1];
  }
  [(ITAttentionAwareIdleTimer *)self _access_reconfigureAttentionClientAndReset:1];

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isEnabled
{
  return [(ITAttentionAwarenessClient *)self->_access_client isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
}

- (NSString)description
{
  return (NSString *)[(ITAttentionAwareIdleTimer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(ITAttentionAwareIdleTimer *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(ITAttentionAwareIdleTimer *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(ITAttentionAwareIdleTimer *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_access_descriptor withName:@"descriptor"];

  return v4;
}

- (id)_configurationWithIdentifier:(id)a3 descriptor:(id)a4 context:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 attentionMaintenanceEventMask];
  uint64_t v13 = [v10 attentionRecoveryEventMask];
  id v14 = objc_alloc_init(MEMORY[0x263F28870]);
  v40 = v9;
  [v14 setIdentifier:v9];
  [v14 setEventMask:v12];
  if ((v12 & 0x80) == 0 && (v13 & 0x80) != 0)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2 object:self file:@"ITAttentionAwareIdleTimer.m" lineNumber:190 description:@"Cannot enable face detection for attention recovery exclusive of attention maintenance"];
  }
  else if (!v13)
  {
    goto LABEL_5;
  }
  [v14 setAttentionLostEventMask:v13];
LABEL_5:
  SEL v15 = [v10 timeouts];
  if (![v15 count])
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    v38 = [v15 description];
    [v37 handleFailureInMethod:a2, self, @"ITAttentionAwareIdleTimer.m", 200, @"timeouts: <%@> for descriptor: <%@> must have at least one timeout", v10, v38 object file lineNumber description];
  }
  if ((v12 & 0x80) != 0)
  {
    [v10 attentionSamplingPeriod];
    uint64_t v17 = v16;
    objc_msgSend(v14, "setSamplingInterval:");
    [v10 attentionSamplingStartDelay];
    double v19 = v18;
    if (v18 > 0.0) {
      [v14 setSamplingDelay:v18];
    }
    v20 = ITLogIdleTimer();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v47 = *(__CFString **)&v19;
      __int16 v48 = 2048;
      uint64_t v49 = v17;
      _os_log_impl(&dword_22177B000, v20, OS_LOG_TYPE_INFO, "Setting auto face detection with sampling delay: %g, period: %g", buf, 0x16u);
    }
  }
  v21 = [(ITAttentionAwareIdleTimer *)self _timeoutDictionaryForTimeouts:v15];
  [v14 setTag:v11];
  [v14 setAttentionLostTimeoutDictionary:v21];
  v22 = [v21 allKeys];
  v23 = [v22 firstObject];
  [v23 doubleValue];
  double v25 = v24;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v26 = [v21 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * i) doubleValue];
        if (v31 >= v25) {
          double v25 = v31;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v28);
  }

  double nonSampledAttentionLostTimeout = self->_nonSampledAttentionLostTimeout;
  if (nonSampledAttentionLostTimeout < v25 + 1.0) {
    double nonSampledAttentionLostTimeout = v25 + 1.0;
  }
  [v14 setNonSampledAttentionLostTimeout:nonSampledAttentionLostTimeout];
  [v14 setNonSampledAttentionLostTimeoutEnable:self->_nonSampledAttentionLostTimeoutEnable];
  v33 = ITLogIdleTimer();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    if ([v14 nonSampledAttentionLostTimeoutEnable]) {
      v34 = @"Enabled";
    }
    else {
      v34 = @"Disabled";
    }
    [v14 nonSampledAttentionLostTimeout];
    *(_DWORD *)buf = 138543618;
    v47 = v34;
    __int16 v48 = 2048;
    uint64_t v49 = v35;
    _os_log_impl(&dword_22177B000, v33, OS_LOG_TYPE_INFO, "%{public}@ nonSampled attention lost timeout with: %f seconds", buf, 0x16u);
  }

  return v14;
}

- (id)_access_generateConfiguration
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_accessLock);
  configurationIdentifier = self->_configurationIdentifier;
  access_descriptor = self->_access_descriptor;
  access_context = self->_access_context;

  return [(ITAttentionAwareIdleTimer *)self _configurationWithIdentifier:configurationIdentifier descriptor:access_descriptor context:access_context];
}

- (void)_access_reconfigureAttentionClientAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_accessLock);
  id v5 = [(ITAttentionAwareIdleTimer *)self _access_generateConfiguration];
  [(ITAttentionAwarenessClient *)self->_access_client setConfiguration:v5 shouldReset:v3];
  [(ITAttentionAwarenessClient *)self->_access_client setEnabled:1];
  id v6 = ITLogIdleTimer();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_22177B000, v6, OS_LOG_TYPE_DEFAULT, "<%p> - reconfigure attention client with configuration:%{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)_timeoutDictionaryForTimeouts:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "identifier", (void)v15));
        uint64_t v12 = NSNumber;
        [v10 duration];
        uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
        [v4 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_prototypeSettingsChanged
{
  [(ITAttentionAwarenessSettings *)self->_settings nonSampledAttentionLostTimeout];
  self->_double nonSampledAttentionLostTimeout = v3;
  self->_nonSampledAttentionLostTimeoutEnable = [(ITAttentionAwarenessSettings *)self->_settings nonSampledAttentionLostTimeoutEnable];
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(id)a4 forContext:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_accessLock);
  os_unfair_recursive_lock_lock_with_options();
  int v8 = [v7 isEqual:self->_access_context];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained idleTimer:self attentionLostTimeoutDidExpire:v10];
  }
  os_unfair_recursive_lock_unlock();
}

- (void)clientDidReset:(id)a3 forUserAttentionEvent:(id)a4 withContext:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_accessLock);
  os_unfair_recursive_lock_lock_with_options();
  int v8 = [v7 isEqual:self->_access_context];

  if (v8)
  {
    [v13 timestamp];
    double v10 = v9;
    uint64_t v11 = [v13 eventMask];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained idleTimerDidReset:self forUserAttention:v11 at:v10];
  }
  os_unfair_recursive_lock_unlock();
}

- (ITAttentionAwarenessContext)_context
{
  os_unfair_recursive_lock_lock_with_options();
  double v3 = self->_access_context;
  os_unfair_recursive_lock_unlock();

  return v3;
}

- (ITIdleTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ITIdleTimerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_access_context, 0);
  objc_storeStrong((id *)&self->_access_descriptor, 0);
  objc_storeStrong((id *)&self->_access_client, 0);

  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

@end