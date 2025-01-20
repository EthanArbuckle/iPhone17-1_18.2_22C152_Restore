@interface BLSHAssertionProxy
- (BLSAssertionDescriptor)descriptor;
- (BLSAssertionIdentifier)identifier;
- (BLSHAssertionProxy)initWithIdentifier:(id)a3 descriptor:(id)a4 remoteTarget:(id)a5;
- (BLSXPCAssertionServiceClientInterface)remoteTarget;
- (BOOL)isAcquired;
- (NSString)description;
- (double)_lock_activeDuration;
- (id)lock_description;
- (os_unfair_lock_s)isValid;
- (unint64_t)acquisitionState;
- (void)invalidate;
- (void)serviceDidAcquire;
- (void)serviceDidCancelWithError:(id)a3;
- (void)serviceDidPause;
- (void)serviceDidResume;
- (void)serviceFailedToAcquireWithError:(id)a3;
- (void)serviceWillCancel;
- (void)setAcquired:(uint64_t)a1;
- (void)setIdentifier:(id)a3;
- (void)setPaused:(uint64_t)a1;
@end

@implementation BLSHAssertionProxy

- (BLSHAssertionProxy)initWithIdentifier:(id)a3 descriptor:(id)a4 remoteTarget:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHAssertionProxy;
  v12 = [(BLSHAssertionProxy *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_descriptor, a4);
    objc_storeStrong((id *)&v13->_remoteTarget, a5);
    v13->_lock_valid = 1;
  }

  return v13;
}

- (os_unfair_lock_s)isValid
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 10;
    os_unfair_lock_lock(a1 + 10);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[11]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_valid = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAcquired
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAcquired:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 45) = a2;
    if (a2)
    {
      *(unsigned char *)(a1 + 47) = 0;
      uint64_t v5 = mach_continuous_time();
      uint64_t v6 = 0;
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v5;
    }
    else
    {
      uint64_t v6 = mach_continuous_time();
    }
    *(void *)(a1 + 32) = v6;
    os_unfair_lock_unlock(v4);
  }
}

- (void)setPaused:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    int v5 = *(unsigned __int8 *)(a1 + 46);
    *(unsigned char *)(a1 + 46) = a2;
    if (*(unsigned char *)(a1 + 45))
    {
      if (v5 == a2)
      {
        uint64_t v6 = bls_assertions_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          [(BLSHAssertionProxy *)a1 setPaused:v6];
        }
      }
      else if (a2)
      {
        *(unsigned char *)(a1 + 47) = 1;
        mach_continuous_time();
        BSTimeDifferenceFromMachTimeToMachTime();
        *(double *)(a1 + 8) = v7 + *(double *)(a1 + 8);
      }
      else
      {
        *(void *)(a1 + 24) = mach_continuous_time();
      }
    }
    os_unfair_lock_unlock(v4);
  }
}

- (double)_lock_activeDuration
{
  if (!a1) {
    return 0.0;
  }
  double v1 = *(double *)(a1 + 8);
  if (*(unsigned char *)(a1 + 45) && !*(unsigned char *)(a1 + 46))
  {
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    return v1 + v2;
  }
  return v1;
}

- (unint64_t)acquisitionState
{
  if ([(BLSHAssertionProxy *)self isAcquired]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)serviceDidAcquire
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    -[BLSHAssertionProxy setAcquired:]((uint64_t)self, 1);
    remoteTarget = self->_remoteTarget;
    identifier = self->_identifier;
    [(BLSXPCAssertionServiceClientInterface *)remoteTarget assertionAcquired:identifier];
  }
}

- (void)serviceFailedToAcquireWithError:(id)a3
{
  id v4 = a3;
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self)) {
    [(BLSXPCAssertionServiceClientInterface *)self->_remoteTarget assertion:self->_identifier failedToAcquireWithError:v4];
  }
}

- (void)serviceWillCancel
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    remoteTarget = self->_remoteTarget;
    identifier = self->_identifier;
    [(BLSXPCAssertionServiceClientInterface *)remoteTarget assertionWillCancel:identifier];
  }
}

- (void)serviceDidCancelWithError:(id)a3
{
  id v4 = a3;
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    -[BLSHAssertionProxy setAcquired:]((uint64_t)self, 0);
    [(BLSXPCAssertionServiceClientInterface *)self->_remoteTarget assertionDidCancel:self->_identifier withError:v4];
  }
}

- (void)serviceDidPause
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    -[BLSHAssertionProxy setPaused:]((uint64_t)self, 1);
    remoteTarget = self->_remoteTarget;
    identifier = self->_identifier;
    [(BLSXPCAssertionServiceClientInterface *)remoteTarget assertionPaused:identifier];
  }
}

- (void)serviceDidResume
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    -[BLSHAssertionProxy setPaused:]((uint64_t)self, 0);
    remoteTarget = self->_remoteTarget;
    identifier = self->_identifier;
    [(BLSXPCAssertionServiceClientInterface *)remoteTarget assertionResumed:identifier];
  }
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = -[BLSHAssertionProxy lock_description](self);
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (id)lock_description
{
  id v1 = a1;
  if (a1)
  {
    double v2 = objc_opt_new();
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    double v7 = __38__BLSHAssertionProxy_lock_description__block_invoke;
    v8 = &unk_2645322D0;
    id v9 = v2;
    id v10 = v1;
    id v3 = v2;
    [v3 appendProem:v1 block:&v5];
    objc_msgSend(v3, "description", v5, v6, v7, v8);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

id __38__BLSHAssertionProxy_lock_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 45) withName:@"isAcquired"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 16))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = BLSShortLoggingStringForMachTime();
    [v4 appendString:v5 withName:@"acquired"];

    double v7 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v6 + 45) || !*(void *)(v6 + 32)) {
      mach_continuous_time();
    }
    BSTimeDifferenceFromMachTimeToMachTime();
    id v8 = (id)objc_msgSend(v7, "appendTimeInterval:withName:decomposeUnits:", @"duration", 1);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v3 + 47))
  {
    id v9 = (id)[*(id *)(a1 + 32) appendTimeInterval:@"activeDuration" withName:1 decomposeUnits:-[BLSHAssertionProxy _lock_activeDuration](v3)];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v3 + 46) withName:@"isPaused" ifEqualTo:1];
  id v11 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"descriptor"];
  id v12 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"identifier" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"remoteTarget"];
}

- (BLSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BLSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (BLSXPCAssertionServiceClientInterface)remoteTarget
{
  return self->_remoteTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPaused:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_21FCFC000, log, OS_LOG_TYPE_ERROR, "%p assertion setPaused:%{BOOL}u when not acquired %{public}@", (uint8_t *)&v3, 0x1Cu);
}

@end