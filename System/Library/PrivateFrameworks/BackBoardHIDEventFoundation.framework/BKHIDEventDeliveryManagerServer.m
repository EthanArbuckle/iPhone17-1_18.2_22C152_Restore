@interface BKHIDEventDeliveryManagerServer
- (BKHIDEventDeliveryManagerServer)initWithDeliveryManager:(id)a3 ruleChangeAuthority:(id)a4;
- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3;
- (id)deliveryGraphDescription;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)selectDeferringTargetForPredicate:(id)a3;
- (void)submitRuleChanges:(id)a3;
@end

@implementation BKHIDEventDeliveryManagerServer

- (void)submitRuleChanges:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F50BA0] currentContext];
  v6 = [v5 remoteToken];

  if (!v6 || [v6 isInvalid])
  {
    v7 = BKLogEventDelivery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v35 = 138543362;
      v36 = v6;
      _os_log_error_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_ERROR, "invalid remote audit token: %{public}@", (uint8_t *)&v35, 0xCu);
    }

    goto LABEL_59;
  }
  uint64_t v8 = [v6 pid];
  if ((int)v8 > 0)
  {
    uint64_t v9 = [(BKHIDEventDeliveryManagerServerRuleChangeAuthority *)self->_ruleChangeAuthority permittedRuleChangeMaskForAuditToken:v6];
    uint64_t v10 = [v4 contentsMask];
    int v11 = v10;
    char v12 = v10 & v9;
    if ((v10 & v9) != v10)
    {
      v13 = BKLogEventDelivery();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v34 = BSProcessDescriptionForPID();
        int v35 = 138543874;
        v36 = v34;
        __int16 v37 = 1024;
        int v38 = v11;
        __int16 v39 = 1024;
        int v40 = v9;
        _os_log_error_impl(&dword_1CFDE2000, v13, OS_LOG_TYPE_ERROR, "process %{public}@ tried to make unauthorized changes (%X allowed:%X) -- ignoring", (uint8_t *)&v35, 0x18u);
      }
      LOBYTE(v11) = v12;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v15 = v4;
    v16 = v15;
    if (v11)
    {
      v18 = [v15 discreteDispatchingRules];
      if (v18)
      {
        [(BKHIDEventDeliveryManager *)self->_deliveryManager setDispatchingRoots:v18 forClientWithPID:v8];
      }
      else
      {
        v19 = BKLogEventDelivery();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v35 = 67109120;
          LODWORD(v36) = v8;
          _os_log_error_impl(&dword_1CFDE2000, v19, OS_LOG_TYPE_ERROR, "missing dispatch roots from pid:%d", (uint8_t *)&v35, 8u);
        }
      }
      if ((v11 & 4) == 0)
      {
LABEL_13:
        if ((v11 & 2) == 0) {
          goto LABEL_36;
        }
        goto LABEL_30;
      }
    }
    else if ((v11 & 4) == 0)
    {
      goto LABEL_13;
    }
    v20 = [v16 keyCommandDispatchingRules];
    if (v20)
    {
      [(BKHIDEventDeliveryManager *)self->_deliveryManager setKeyCommandRoots:v20 forClientWithPID:v8];
    }
    else
    {
      v21 = BKLogEventDelivery();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v35 = 67109120;
        LODWORD(v36) = v8;
        _os_log_error_impl(&dword_1CFDE2000, v21, OS_LOG_TYPE_ERROR, "missing key command roots from pid:%d", (uint8_t *)&v35, 8u);
      }
    }
    if ((v11 & 2) == 0)
    {
LABEL_36:
      if ((v11 & 8) != 0)
      {
        v24 = (void *)MEMORY[0x1E4F1CAD0];
        v25 = [v16 keyCommandsRegistrations];
        v26 = [v24 setWithArray:v25];

        if (v26)
        {
          [(BKHIDEventDeliveryManager *)self->_deliveryManager setKeyCommandsRegistrations:v26 forClientWithPID:v8];
        }
        else
        {
          v27 = BKLogEventDelivery();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            int v35 = 67109120;
            LODWORD(v36) = v8;
            _os_log_error_impl(&dword_1CFDE2000, v27, OS_LOG_TYPE_ERROR, "missing key commands registration from pid:%d", (uint8_t *)&v35, 8u);
          }
        }
        if ((v11 & 0x10) == 0)
        {
LABEL_38:
          if ((v11 & 0x20) == 0)
          {
LABEL_58:

            os_unfair_lock_unlock(p_lock);
            goto LABEL_59;
          }
LABEL_52:
          v32 = [v16 activeUIResponders];
          if (v32)
          {
            [(BKHIDEventDeliveryManager *)self->_deliveryManager setActiveUIResponders:v32 forClientWithPID:v8];
          }
          else
          {
            v33 = BKLogEventDelivery();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              int v35 = 67109120;
              LODWORD(v36) = v8;
              _os_log_error_impl(&dword_1CFDE2000, v33, OS_LOG_TYPE_ERROR, "missing buffering predicates from pid:%d", (uint8_t *)&v35, 8u);
            }
          }
          goto LABEL_58;
        }
      }
      else if ((v11 & 0x10) == 0)
      {
        goto LABEL_38;
      }
      v28 = (void *)MEMORY[0x1E4F1CAD0];
      v29 = [v16 bufferingPredicates];
      v30 = [v28 setWithArray:v29];

      if (v30)
      {
        [(BKHIDEventDeliveryManager *)self->_deliveryManager setEventBufferingPredicates:v30 forClientWithPID:v8];
      }
      else
      {
        v31 = BKLogEventDelivery();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v35 = 67109120;
          LODWORD(v36) = v8;
          _os_log_error_impl(&dword_1CFDE2000, v31, OS_LOG_TYPE_ERROR, "missing buffering predicates from pid:%d", (uint8_t *)&v35, 8u);
        }
      }
      if ((v11 & 0x20) == 0) {
        goto LABEL_58;
      }
      goto LABEL_52;
    }
LABEL_30:
    v22 = [v16 deferringRules];
    if (v22)
    {
      [(BKHIDEventDeliveryManager *)self->_deliveryManager setDeferringRules:v22 forClientWithPID:v8];
    }
    else
    {
      v23 = BKLogEventDelivery();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v35 = 67109120;
        LODWORD(v36) = v8;
        _os_log_error_impl(&dword_1CFDE2000, v23, OS_LOG_TYPE_ERROR, "missing deferring rules from pid:%d", (uint8_t *)&v35, 8u);
      }
    }
    goto LABEL_36;
  }
  v17 = BKLogEventDelivery();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v35 = 67109120;
    LODWORD(v36) = v8;
    _os_log_error_impl(&dword_1CFDE2000, v17, OS_LOG_TYPE_ERROR, "invalid remote pid: %d", (uint8_t *)&v35, 8u);
  }

LABEL_59:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleChangeAuthority, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_resolutionsByPID, 0);
  objc_storeStrong((id *)&self->_observerPIDs, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F50BA0] currentContext];
  v6 = [v5 remoteToken];

  if (!v6 || [v6 isInvalid])
  {
    v7 = BKLogEventDelivery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      char v12 = v6;
      _os_log_error_impl(&dword_1CFDE2000, v7, OS_LOG_TYPE_ERROR, "invalid remote audit token: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    goto LABEL_6;
  }
  if (![v6 hasEntitlement:@"com.apple.backboardd.eventResolution"])
  {
LABEL_6:
    uint64_t v8 = &stru_1F267F920;
    goto LABEL_7;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(BKHIDEventDeliveryManager *)self->_deliveryManager connectionDescriptionForDeferringRuleIdentity:v4];
  os_unfair_lock_unlock(p_lock);
LABEL_7:

  return v8;
}

- (id)deliveryGraphDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F50BA0] currentContext];
  id v4 = [v3 remoteToken];

  if (!v4 || [v4 isInvalid])
  {
    v5 = BKLogEventDelivery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      uint64_t v10 = v4;
      _os_log_error_impl(&dword_1CFDE2000, v5, OS_LOG_TYPE_ERROR, "invalid remote audit token: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    goto LABEL_6;
  }
  if (![v4 hasEntitlement:@"com.apple.backboardd.eventResolution"])
  {
LABEL_6:
    v6 = &stru_1F267F920;
    goto LABEL_7;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(BKHIDEventDeliveryManager *)self->_deliveryManager deliveryGraphDescription];
  os_unfair_lock_unlock(p_lock);
LABEL_7:

  return v6;
}

- (void)selectDeferringTargetForPredicate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F50BA0] currentContext];
  v6 = [v5 remoteToken];

  if (!v6 || [v6 isInvalid])
  {
    v7 = BKLogEventDelivery();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    int v12 = 138543362;
    uint64_t v13 = v6;
    int v9 = "invalid remote audit token: %{public}@";
    uint64_t v10 = v7;
    uint32_t v11 = 12;
LABEL_11:
    _os_log_error_impl(&dword_1CFDE2000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, v11);
    goto LABEL_4;
  }
  uint64_t v8 = [v6 pid];
  if ((int)v8 > 0)
  {
    os_unfair_lock_lock(&self->_lock);
    [(BKHIDEventDeliveryManager *)self->_deliveryManager selectDeferringPredicate:v4 forClientWithPID:v8];
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  v7 = BKLogEventDelivery();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v12 = 67109120;
    LODWORD(v13) = v8;
    int v9 = "invalid remote pid: %d";
    uint64_t v10 = v7;
    uint32_t v11 = 8;
    goto LABEL_11;
  }
LABEL_4:

LABEL_5:
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "pid", a3);
  deliveryManager = self->_deliveryManager;

  [(BKHIDEventDeliveryManager *)deliveryManager processDidTerminate:v5];
}

- (BKHIDEventDeliveryManagerServer)initWithDeliveryManager:(id)a3 ruleChangeAuthority:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKHIDEventDeliveryManagerServer;
  int v9 = [(BKHIDEventDeliveryManagerServer *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_deliveryManager, a3);
    objc_storeStrong((id *)&v10->_ruleChangeAuthority, a4);
    uint32_t v11 = [BKHIDDomainServiceServer alloc];
    uint64_t v12 = *MEMORY[0x1E4F4F1F8];
    uint64_t v13 = BKLogEventDelivery();
    uint64_t v14 = [(BKHIDDomainServiceServer *)v11 initWithDelegate:v10 serverTarget:v10 serverProtocol:&unk_1F26894F8 clientProtocol:&unk_1F268BAA8 serviceName:v12 queue:0 log:v13 entitlement:0];
    server = v10->_server;
    v10->_server = (BKHIDDomainServiceServer *)v14;

    [(BKHIDDomainServiceServer *)v10->_server activate];
  }

  return v10;
}

@end