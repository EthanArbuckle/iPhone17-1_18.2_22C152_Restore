@interface BSSecTask
+ (id)_taskForAuditToken:(uint64_t)a1;
+ (id)secTaskForAuditToken:(uint64_t)a1;
+ (id)secTaskForCurrentProcess;
- (id)valueForEntitlement:(uint64_t)a1;
- (os_unfair_lock_s)representsPlatformBinary;
- (uint64_t)BOOLForEntitlement:(uint64_t)a1;
- (void)dealloc;
@end

@implementation BSSecTask

- (uint64_t)BOOLForEntitlement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = -[BSSecTask valueForEntitlement:](a1, v3);
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v5 = [v4 BOOLValue];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)valueForEntitlement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    a1 = BSSecTaskCopyEntitlementValue(*(__SecTask **)(a1 + 8), v3);
    os_unfair_lock_unlock(v4);
  }

  return (id)a1;
}

+ (id)secTaskForAuditToken:(uint64_t)a1
{
  self;
  long long v3 = a2[1];
  v6[0] = *a2;
  v6[1] = v3;
  v4 = +[BSSecTask _taskForAuditToken:]((uint64_t)BSSecTask, v6);
  return v4;
}

+ (id)_taskForAuditToken:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self;
  long long v3 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v3;
  uint64_t v4 = BSVersionedPIDForAuditToken(&token);
  if (v4 == -1)
  {
    id v15 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_26);
    uint64_t v5 = [NSNumber numberWithLongLong:v4];
    v6 = [(id)qword_1EB21B280 objectForKey:v5];
    if (!v6)
    {
      v7 = [BSSecTask alloc];
      long long v8 = a2[1];
      *(_OWORD *)v21.val = *a2;
      *(_OWORD *)&v21.val[4] = v8;
      if (v7)
      {
        v20.receiver = v7;
        v20.super_class = (Class)BSSecTask;
        id v9 = objc_msgSendSuper2(&v20, sel_init);
        v6 = v9;
        if (v9)
        {
          *((_DWORD *)v9 + 4) = 0;
          audit_token_t token = v21;
          *((void *)v9 + 1) = SecTaskCreateWithAuditToken(0, &token);
        }
      }
      else
      {
        v6 = 0;
      }
      v10 = (void *)qword_1EB21B280;
      if (!qword_1EB21B280)
      {
        uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
        v12 = (void *)qword_1EB21B280;
        qword_1EB21B280 = v11;

        v10 = (void *)qword_1EB21B280;
      }
      [v10 setObject:v6 forKey:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_26);
    dispatch_time_t v13 = dispatch_time(0, 1000000000);
    v14 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__BSSecTask__taskForAuditToken___block_invoke;
    block[3] = &unk_1E54457C8;
    id v15 = v6;
    id v18 = v15;
    dispatch_after(v13, v14, block);
  }
  return v15;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_taskRef = self->_lock_taskRef;
  if (lock_taskRef) {
    CFRelease(lock_taskRef);
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BSSecTask;
  [(BSSecTask *)&v5 dealloc];
}

+ (id)secTaskForCurrentProcess
{
  self;
  if (qword_1EB21B270 != -1) {
    dispatch_once(&qword_1EB21B270, &__block_literal_global_23);
  }
  v0 = (void *)qword_1EB21B278;
  return v0;
}

void __37__BSSecTask_secTaskForCurrentProcess__block_invoke()
{
  BSAuditTokenForCurrentProcess(v2);
  uint64_t v0 = +[BSSecTask _taskForAuditToken:]((uint64_t)BSSecTask, v2);
  v1 = (void *)qword_1EB21B278;
  qword_1EB21B278 = v0;
}

- (os_unfair_lock_s)representsPlatformBinary
{
  if (result)
  {
    v1 = result;
    v2 = result + 4;
    os_unfair_lock_lock(result + 4);
    LODWORD(v1) = SecTaskGetCodeSignStatus(*(SecTaskRef *)&v1[2]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)((v1 & 0xC000001) == 67108865);
  }
  return result;
}

@end