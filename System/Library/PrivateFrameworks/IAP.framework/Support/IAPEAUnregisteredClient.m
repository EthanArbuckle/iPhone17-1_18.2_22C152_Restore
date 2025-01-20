@interface IAPEAUnregisteredClient
- (IAPEAUnregisteredClient)initWithBundleId:(id)a3;
- (NSString)bundleId;
- (int)_getProcessIdForUnregisteredClient;
- (void)dealloc;
- (void)releaseProcessAssertion;
- (void)takeProcessAssertion:(id)a3;
@end

@implementation IAPEAUnregisteredClient

- (IAPEAUnregisteredClient)initWithBundleId:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IAPEAUnregisteredClient;
  result = [(IAPEAUnregisteredClient *)&v6 init];
  v5 = result;
  if (!result) {
    return v5;
  }
  if ((((_BYTE)result + 8) & 3) == 0)
  {
    result->_processId = -1;
    result = (IAPEAUnregisteredClient *)[a3 copy];
    if ((((_BYTE)v5 + 16) & 7) == 0)
    {
      v5->_bundleId = (NSString *)&result->super.isa;
      if ((((_BYTE)v5 + 24) & 7) == 0)
      {
        v5->_processAssertion = 0;
        if ((((_BYTE)v5 + 32) & 7) == 0)
        {
          v5->_processAssertionStartTime = 0;
          result = objc_alloc_init(IAPApplicationStateMonitor);
          if (((unint64_t)&v5->_appStateMonitor & 7) == 0)
          {
            v5->_appStateMonitor = (IAPApplicationStateMonitor *)result;
            return v5;
          }
        }
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 16) & 7) != 0
    || (self->_bundleId,
        [(IAPEAUnregisteredClient *)self releaseProcessAssertion],
        (((_BYTE)self + 40) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {

    v3.receiver = self;
    v3.super_class = (Class)IAPEAUnregisteredClient;
    [(IAPEAUnregisteredClient *)&v3 dealloc];
  }
}

- (void)takeProcessAssertion:(id)a3
{
  p_processAssertion = &self->_processAssertion;
  if (((unint64_t)&self->_processAssertion & 7) != 0) {
    goto LABEL_15;
  }
  if (!*p_processAssertion) {
    goto LABEL_9;
  }
  time_t v5 = time(0);
  if (((unint64_t)&self->_processAssertionStartTime & 7) != 0)
  {
LABEL_15:
    __break(0x5516u);
    goto LABEL_16;
  }
  int64_t processAssertionStartTime = self->_processAssertionStartTime;
  BOOL v7 = __OFSUB__(v5, processAssertionStartTime);
  uint64_t v8 = v5 - processAssertionStartTime;
  if (v7)
  {
LABEL_16:
    __break(0x5515u);
    return;
  }
  if (v8 >= 3)
  {
    if (*p_processAssertion)
    {
      if ((((int)self + 16) & 7) == 0)
      {
        sub_1000EE49C(3u, @"renewing process assertion - %s:%s - %d appId=%@ pid=%d", "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m", "-[IAPEAUnregisteredClient takeProcessAssertion:]", 444, self->_bundleId, [(IAPEAUnregisteredClient *)self _getProcessIdForUnregisteredClient]);
        self->_int64_t processAssertionStartTime = 0;
        return;
      }
      goto LABEL_15;
    }
LABEL_9:
    if ((((int)self + 16) & 7) == 0)
    {
      sub_1000EE49C(3u, @"creating process assertion - %s:%s - %d appId=%@ pid=%d", "/Library/Caches/com.apple.xbs/Sources/iapd/common/IAPEAClient.m", "-[IAPEAUnregisteredClient takeProcessAssertion:]", 438, self->_bundleId, [(IAPEAUnregisteredClient *)self _getProcessIdForUnregisteredClient]);
      [(IAPEAUnregisteredClient *)self _getProcessIdForUnregisteredClient];
      self->_processAssertion = (SBSProcessAssertion *)SBSProcessAssertionCreateForPID();
      time_t v9 = time(0);
      if (((unint64_t)&self->_processAssertionStartTime & 7) == 0)
      {
        self->_int64_t processAssertionStartTime = v9;
        return;
      }
    }
    goto LABEL_15;
  }
  sub_1000EE49C(3u, @"using ea process hysteresis");
}

- (void)releaseProcessAssertion
{
  p_processAssertion = (CFTypeRef *)&self->_processAssertion;
  if (((unint64_t)&self->_processAssertion & 7) != 0) {
    goto LABEL_6;
  }
  if (!*p_processAssertion) {
    return;
  }
  CFRelease(*p_processAssertion);
  self->_processAssertion = 0;
  if (((unint64_t)&self->_processAssertionStartTime & 7) != 0)
  {
LABEL_6:
    __break(0x5516u);
    return;
  }
  self->_int64_t processAssertionStartTime = 0;
}

- (int)_getProcessIdForUnregisteredClient
{
  p_processId = &self->_processId;
  if (((unint64_t)&self->_processId & 3) != 0) {
    goto LABEL_9;
  }
  unsigned int v3 = *p_processId;
  if (*p_processId == -1)
  {
    self->_processId = 0;
    if (((unint64_t)&self->_bundleId & 7) == 0)
    {
      if (!self->_bundleId)
      {
        unsigned int v3 = 0;
        goto LABEL_8;
      }
      if (((unint64_t)&self->_appStateMonitor & 7) == 0)
      {
        id v4 = -[IAPApplicationStateMonitor applicationInfoForBundleIDSync:](self->_appStateMonitor, "applicationInfoForBundleIDSync:");
        unsigned int v3 = objc_msgSend(objc_msgSend(v4, "valueForKey:", BKSApplicationStateProcessIDKey), "unsignedIntegerValue");
        int *p_processId = v3;
        goto LABEL_8;
      }
    }
LABEL_9:
    __break(0x5516u);
    return (int)self;
  }
LABEL_8:
  LODWORD(self) = v3;
  return (int)self;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

@end