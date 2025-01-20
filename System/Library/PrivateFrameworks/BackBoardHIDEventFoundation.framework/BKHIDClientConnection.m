@interface BKHIDClientConnection
+ (id)connectionWithConnection:(__IOHIDEventSystemConnection *)a3;
- (BKHIDClientConnection)initWithConnection:(__IOHIDEventSystemConnection *)a3;
- (BOOL)isEqual:(id)a3;
- (BSProcessDeathWatcher)processDeathWatcher;
- (NSString)bundleID;
- (NSString)description;
- (__IOHIDEventSystemConnection)connection;
- (id)addDisconnectionObserverBlock:(id)a3;
- (int)pid;
- (int64_t)versionedPID;
- (unint64_t)hash;
- (unsigned)task;
- (void)dealloc;
- (void)invalidate;
- (void)setProcessDeathWatcher:(id)a3;
@end

@implementation BKHIDClientConnection

- (__IOHIDEventSystemConnection)connection
{
  return self->_connection;
}

- (int)pid
{
  return self->_pid;
}

+ (id)connectionWithConnection:(__IOHIDEventSystemConnection *)a3
{
  v3 = [[BKHIDClientConnection alloc] initWithConnection:a3];

  return v3;
}

- (BKHIDClientConnection)initWithConnection:(__IOHIDEventSystemConnection *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)BKHIDClientConnection;
  v4 = [(BKHIDClientConnection *)&v24 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (!a3)
  {
    v15 = BKLogHID();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CFDE2000, v15, OS_LOG_TYPE_ERROR, "trying to create a BKHIDClientConnection with a nil connection", buf, 2u);
    }

    goto LABEL_13;
  }
  v4->_lock._os_unfair_lock_opaque = 0;
  uint64_t v6 = IOHIDEventSystemConnectionGetAttribute();
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_task = IOHIDEventSystemConnectionGetTaskNamePort();
  v5->_int pid = [(id)IOHIDEventSystemConnectionGetAttribute() intValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(NSString *)v5->_bundleID length])
  {
    v8 = BKLogHID();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    v11 = "ignoring connection; bundleID is missing (or invalid) from the attributes: %{public}@";
LABEL_22:
    v12 = buf;
    v13 = v8;
    uint32_t v14 = 12;
    goto LABEL_23;
  }
  if (v5->_task + 1 <= 1)
  {
    v8 = BKLogHID();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int pid = v5->_pid;
      v10 = v5->_bundleID;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = pid;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v10;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = a3;
      v11 = "ignoring connection; pid:%d bundleID:%{public}@ doesn't have a valid task port: %{public}@";
      v12 = buf;
      v13 = v8;
      uint32_t v14 = 28;
LABEL_23:
      _os_log_error_impl(&dword_1CFDE2000, v13, OS_LOG_TYPE_ERROR, v11, v12, v14);
    }
LABEL_9:

LABEL_13:
    return 0;
  }
  if (v5->_pid <= 0)
  {
    v8 = BKLogHID();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    v11 = "ignoring connection; pid is missing from the attributes: %{public}@";
    goto LABEL_22;
  }
  memset(buf, 0, 32);
  if ((BSAuditTokenForTask() & 1) == 0)
  {
    v8 = BKLogHID();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v21 = v5->_pid;
    *(_DWORD *)v25 = 67109378;
    *(_DWORD *)&v25[4] = v21;
    *(_WORD *)&v25[8] = 2114;
    *(void *)&v25[10] = a3;
    v11 = "ignoring connection; BSAuditTokenForTask returned NO (expected pid:%d) connection:%{public}@";
    v12 = v25;
    v13 = v8;
    uint32_t v14 = 18;
    goto LABEL_23;
  }
  *(_OWORD *)v25 = *(_OWORD *)buf;
  *(_OWORD *)&v25[16] = *(_OWORD *)&buf[16];
  v5->_versionedPID = BSVersionedPIDForAuditToken();
  int v17 = BSPIDForAuditToken();
  if (v5->_pid != v17)
  {
    int v22 = v17;
    v8 = BKLogHID();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v23 = v5->_pid;
    *(_DWORD *)v25 = 67109634;
    *(_DWORD *)&v25[4] = v22;
    *(_WORD *)&v25[8] = 1024;
    *(_DWORD *)&v25[10] = v23;
    *(_WORD *)&v25[14] = 2114;
    *(void *)&v25[16] = a3;
    v11 = "ignoring connection; audit pid (%d) doesn't match attribute pid (%d): %{public}@";
    v12 = v25;
    v13 = v8;
    uint32_t v14 = 24;
    goto LABEL_23;
  }
  CFRetain(a3);
  v5->_connection = a3;
  v18 = BKLogHID();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = NSStringFromBSVersionedPID();
    v20 = v5->_bundleID;
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = a3;
    _os_log_impl(&dword_1CFDE2000, v18, OS_LOG_TYPE_INFO, "HID connection vpid:%{public}@ bundleID:%{public}@ successfully initialized: %{public}@", buf, 0x20u);
  }
  return v5;
}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (unsigned)task
{
  return self->_task;
}

- (void)dealloc
{
  [(BKHIDClientConnection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKHIDClientConnection;
  [(BKHIDClientConnection *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    connection = self->_connection;
    if (connection)
    {
      CFRelease(connection);
      self->_connection = 0;
    }
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(BSCompoundAssertion *)self->_observerAssertion context];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(BSCompoundAssertion *)self->_observerAssertion invalidate];
    observerAssertion = self->_observerAssertion;
    self->_observerAssertion = 0;

    [(BSProcessDeathWatcher *)self->_processDeathWatcher invalidate];
    processDeathWatcher = self->_processDeathWatcher;
    self->_processDeathWatcher = 0;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendPointer:self->_connection withName:@"IOHIDEventSystemConnectionRef"];
  uint64_t v5 = NSStringFromBSVersionedPID();
  id v6 = (id)[v3 appendObject:v5 withName:@"vpid"];

  id v7 = (id)[v3 appendUnsignedInteger:self->_task withName:@"taskPort" format:1];
  id v8 = (id)[v3 appendObject:self->_bundleID withName:@"bundleID"];
  v9 = [v3 build];

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processDeathWatcher, 0);
  objc_storeStrong((id *)&self->_observerAssertion, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setProcessDeathWatcher:(id)a3
{
}

- (BSProcessDeathWatcher)processDeathWatcher
{
  return self->_processDeathWatcher;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (id)addDisconnectionObserverBlock:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    id v7 = (void *)MEMORY[0x1E4F4F6E8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%p disconnectionObservers", self);
    v9 = [v7 assertionWithIdentifier:v8];
    v10 = self->_observerAssertion;
    self->_observerAssertion = v9;

    observerAssertion = self->_observerAssertion;
  }
  long long v11 = NSString;
  uint64_t v12 = objc_opt_class();
  long long v13 = (void *)MEMORY[0x1D25E04D0](v5);
  long long v14 = [v11 stringWithFormat:@"<%@:%p>", v12, v13];
  v15 = (void *)[v5 copy];

  uint64_t v16 = [(BSCompoundAssertion *)observerAssertion acquireForReason:v14 withContext:v15];

  os_unfair_lock_unlock(p_lock);

  return v16;
}

- (unint64_t)hash
{
  unint64_t result = (unint64_t)self->_connection;
  if (result) {
    return CFHash((CFTypeRef)result);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6 && (connection = self->_connection, uint64_t v9 = [v6 connection], (connection != 0) == (v9 != 0)))
  {
    if ((unint64_t)connection | v9) {
      BOOL v10 = CFEqual(connection, (CFTypeRef)v9) != 0;
    }
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end