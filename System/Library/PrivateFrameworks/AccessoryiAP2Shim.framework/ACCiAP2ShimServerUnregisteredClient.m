@interface ACCiAP2ShimServerUnregisteredClient
- (ACCiAP2ShimServerUnregisteredClient)initWithBundleId:(id)a3;
- (NSString)bundleId;
- (SBSProcessAssertion)processAssertion;
- (id)_applicationInfoForBundleIDSync:(id)a3;
- (int)_getProcessId;
- (int)processId;
- (int64_t)processAssertionStartTime;
- (void)releaseProcessAssertion;
- (void)takeProcessAssertion:(id)a3;
@end

@implementation ACCiAP2ShimServerUnregisteredClient

- (ACCiAP2ShimServerUnregisteredClient)initWithBundleId:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACCiAP2ShimServerUnregisteredClient;
  return [(ACCiAP2ShimServerUnregisteredClient *)&v4 init];
}

- (void)takeProcessAssertion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_processAssertion)
  {
LABEL_7:
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
      }
      v10 = &_os_log_internal;
      id v7 = &_os_log_internal;
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      bundleId = self->_bundleId;
      int v15 = 138412546;
      v16 = bundleId;
      __int16 v17 = 1024;
      int v18 = [(ACCiAP2ShimServerUnregisteredClient *)self _getProcessId];
      _os_log_impl(&dword_223B61000, v10, OS_LOG_TYPE_INFO, "[#ServerClient] creating process assertion - appId=%@ pid=%d", (uint8_t *)&v15, 0x12u);
    }

    [(ACCiAP2ShimServerUnregisteredClient *)self _getProcessId];
    self->_processAssertion = (SBSProcessAssertion *)SBSProcessAssertionCreateForPID();
    self->_processAssertionStartTime = time(0);
    goto LABEL_35;
  }
  if (time(0) - self->_processAssertionStartTime >= 3)
  {
    if (self->_processAssertion)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
        }
        v5 = &_os_log_internal;
        id v13 = &_os_log_internal;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v14 = self->_bundleId;
        int v15 = 138412546;
        v16 = v14;
        __int16 v17 = 1024;
        int v18 = [(ACCiAP2ShimServerUnregisteredClient *)self _getProcessId];
        _os_log_impl(&dword_223B61000, v5, OS_LOG_TYPE_INFO, "[#ServerClient] renewing process assertion - appId=%@ pid=%d", (uint8_t *)&v15, 0x12u);
      }

      self->_processAssertionStartTime = 0;
      goto LABEL_35;
    }
    goto LABEL_7;
  }
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:]();
    }
    v12 = &_os_log_internal;
    id v9 = &_os_log_internal;
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_223B61000, v12, OS_LOG_TYPE_INFO, "[#ServerClient] using ea process hysteresis", (uint8_t *)&v15, 2u);
  }

LABEL_35:
}

- (void)releaseProcessAssertion
{
  p_processAssertion = &self->_processAssertion;
  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    CFRelease(processAssertion);
    *p_processAssertion = 0;
    p_processAssertion[1] = 0;
  }
}

- (id)_applicationInfoForBundleIDSync:(id)a3
{
  id v3 = a3;
  id v4 = _getApplicationStateMonitor();
  v5 = [v4 applicationInfoForApplication:v3];

  return v5;
}

- (int)_getProcessId
{
  int result = self->_processId;
  if (result == -1)
  {
    self->_processId = 0;
    if (self->_bundleId)
    {
      id v4 = -[ACCiAP2ShimServerUnregisteredClient _applicationInfoForBundleIDSync:](self, "_applicationInfoForBundleIDSync:");
      v5 = [v4 valueForKey:*MEMORY[0x263F297D0]];
      int v6 = [v5 unsignedIntegerValue];

      self->_processId = v6;
      return self->_processId;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int)processId
{
  return self->_processId;
}

- (SBSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (int64_t)processAssertionStartTime
{
  return self->_processAssertionStartTime;
}

- (void).cxx_destruct
{
}

- (void)takeProcessAssertion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_223B61000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end