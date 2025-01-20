@interface BSXPCServiceConnection
+ (id)_connectionWithIncomingXPCConnection:(void *)a3 endpointDescription:;
+ (id)_invalidationMessageForXPCConnection:(uint64_t)a1;
+ (id)connectionWithConnection:(uint64_t)a1;
+ (id)connectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:;
+ (id)currentContext;
+ (id)nullConnection;
+ (void)_invalidateIncomingXPCConnection:(uint64_t)a1;
- (BOOL)_asyncToConnectionQueueIfEverActivated:(uint64_t)a1;
- (BOOL)_isClientInvalidated;
- (BOOL)_isInvalidated;
- (BOOL)shouldSendMessage:(id)a3;
- (BSXPCServiceConnection)init;
- (NSString)description;
- (id)_eventHandler;
- (id)_initWithContext:(void *)a3 assertionTarget:;
- (id)activeMessageBatch;
- (id)auditToken;
- (id)createMessageWithOptions:(uint64_t)a1;
- (id)peer;
- (os_unfair_lock_s)hasChildren;
- (os_unfair_lock_s)initiatingContext;
- (os_unfair_lock_s)name;
- (uint64_t)_lock_activateNowOrWhenReady:(const os_unfair_lock *)a1;
- (uint64_t)activateNowOrWhenReady:(uint64_t)a1;
- (uint64_t)remoteTargetWithAssertionAttributes:(int)a3 enforcingLaunchConstraints:;
- (unsigned)_stateDump;
- (void)_clientInvalidateExplicitly:(uint64_t)a1;
- (void)_connection_consumeLock_didActivateWithMessage:(void *)a3 fromPeer:;
- (void)_connection_consumeLock_handleError:(int)a3 notYetLocked:;
- (void)_connection_consumeLock_runPendedEventsIfAppropriate;
- (void)_connection_handleInvalidateMessage:(uint64_t)a3 withHandoff:;
- (void)_connection_handleMessage:(void *)a3 fromPeer:(uint64_t)a4 withHandoff:;
- (void)_invalidateChildConnection:(id)a3;
- (void)_lock_associateNewChildConnection:(uint64_t)a1;
- (void)_lock_disconnect;
- (void)_lock_enqueueChildActivateEvent:(uint64_t)a3 forHandoff:;
- (void)_lock_enqueueConnectionEstablishedEvent:(uint64_t)a1;
- (void)_lock_invalidate;
- (void)_makingInterruptCallout;
- (void)_parentDisconnectedWithInterrupt:(uint64_t)a1;
- (void)_setParent:(uint64_t)a1;
- (void)configure:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)sendBarrierBlock:(uint64_t)a1;
- (void)updateAuditTokenFromReplyMessage:(id)a3 fromActivationGeneration:(unsigned int)a4;
@end

@implementation BSXPCServiceConnection

uint64_t __73__BSXPCServiceConnection__connection_handleMessage_fromPeer_withHandoff___block_invoke(void *a1)
{
  return -[BSXPCServiceConnection _connection_handleMessage:fromPeer:withHandoff:](a1[4], a1[5], a1[6], 0);
}

uint64_t __42__BSXPCServiceConnection__lock_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChildConnection:*(void *)(a1 + 40)];
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return;
  }
  [*(id *)(v2 + 56) assertBarrierOnQueue];
  uint64_t v4 = MEMORY[0x19F399FF0](a2);
  if (v4 == MEMORY[0x1E4F14590])
  {
    v5 = [[BSXPCServiceConnectionMessage alloc] initWithMessage:a2];
    if (xpc_dictionary_expects_reply()) {
      v6 = a2;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    v8 = -[BSXPCServiceConnectionMessage messageID](v5);
    v9 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:@"connect"])
      {
        v10 = [(BSXPCCoder *)v5 XPCConnection];
        +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v10);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        [*(id *)(v2 + 56) assertBarrierOnQueue];
        os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
        if (*(unsigned char *)(v2 + 167))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
          v12 = BSServiceXPCLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *(void *)(v2 + 8);
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v13;
            _os_log_impl(&dword_19C754000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring activation message because this connection has been invalidated", buf, 0xCu);
          }
          goto LABEL_37;
        }
        v15 = [(BSXPCServiceConnectionMessage *)v5 childIdentifier];
        v12 = *(id *)(v2 + 144);
        id v38 = [(BSXPCServiceConnectionMessage *)v5 createReply];
        if (!v15)
        {
          v26 = BSServiceXPCLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(v2 + 8);
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v27;
            _os_log_impl(&dword_19C754000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Activation message received.", buf, 0xCu);
          }

          [v38 send];
          v28 = [(BSXPCCoder *)v5 decodeObjectOfClass:objc_opt_class() forKey:@"bsxpc_context"];
          -[BSXPCServiceConnectionEventHandler setInitiatingContext:]((uint64_t)v12, v28);

          -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](v2, v5, obj);
          goto LABEL_36;
        }
        unsigned int v17 = [(BSXPCServiceConnectionMessage *)v5 childIdentifierIsRemotelyDefined];
        if ((([*(id *)(v2 + 176) isRoot] ^ 1 | v17) & 1) == 0)
        {
          v29 = [(BSXPCCoder *)v5 message];
          BSStoreTokenFromMessageToVar();

          v30 = [BSXPCServiceConnection alloc];
          v31 = -[BSXPCServiceConnectionRootContext childContextWithRemoteIdentifier:](*(void **)(v2 + 176), (uint64_t)v15);
          v32 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v30->super.isa, v31, *(void **)(v2 + 168));

          v33 = -[BSXPCServiceConnection _eventHandler]((os_unfair_lock_s *)v32);
          v34 = [(BSXPCCoder *)v5 decodeObjectOfClass:objc_opt_class() forKey:@"bsxpc_context"];
          -[BSXPCServiceConnectionEventHandler setInitiatingContext:]((uint64_t)v33, v34);

          objc_storeStrong(v32 + 4, obj);
          objc_storeStrong(v32 + 5, 0);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __71__BSXPCServiceConnection__connection_handleActivationMessage_fromPeer___block_invoke;
          v41 = &unk_1E58FCB70;
          v35 = v12;
          *(void *)v42 = v35;
          -[BSXPCServiceConnection configure:]((uint64_t)v32, (uint64_t)buf);
          objc_storeStrong(v32 + 15, v38);
          -[BSXPCServiceConnection _lock_associateNewChildConnection:](v2, (uint64_t)v32);
          os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
          -[BSXPCServiceConnectionEventHandler connection:handleConnection:]((uint64_t)v35, (os_unfair_lock_s *)v2, (uint64_t)v32);

LABEL_36:
LABEL_37:

          goto LABEL_38;
        }
        v18 = BSServiceXPCErrorsLog();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v17)
        {
          if (v19)
          {
            uint64_t v20 = *(void *)(v2 + 8);
            *(_DWORD *)buf = 138543618;
            *(void *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v15;
            v21 = "%{public}@ new children must have remotely defined identifiers : %llx";
LABEL_42:
            _os_log_error_impl(&dword_19C754000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
          }
        }
        else if (v19)
        {
          uint64_t v37 = *(void *)(v2 + 8);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v15;
          v21 = "%{public}@ we don't support grandchildren %llx";
          goto LABEL_42;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
        goto LABEL_36;
      }
      if (([v9 isEqualToString:@"invalidate"] & 1) != 0
        || [v9 isEqualToString:@"interrupt"])
      {
        -[BSXPCServiceConnection _connection_handleInvalidateMessage:withHandoff:](v2, v5, (uint64_t)v7);
LABEL_39:

        return;
      }
      v10 = BSServiceXPCErrorsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(v2 + 8);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_error_impl(&dword_19C754000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Ignoring message with unknown messageID : %@", buf, 0x16u);
      }
    }
    else
    {
      v10 = [(BSXPCCoder *)v5 XPCConnection];
      v14 = +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v10);
      -[BSXPCServiceConnection _connection_handleMessage:fromPeer:withHandoff:](v2, v5, v14, (uint64_t)v7);
    }
LABEL_38:

    goto LABEL_39;
  }
  if (v4 != MEMORY[0x1E4F145A8])
  {
    v22 = [NSString stringWithFormat:@"this should never happen. unknown message: %@", a2];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__connection_handleEvent_);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      v41 = (void *)v2;
      *(_WORD *)v42 = 2114;
      *(void *)&v42[2] = @"BSXPCServiceConnection.m";
      __int16 v43 = 1024;
      int v44 = 1044;
      __int16 v45 = 2114;
      v46 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C757B58);
  }

  -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](v2, a2, 1);
}

- (void)_connection_handleMessage:(void *)a3 fromPeer:(uint64_t)a4 withHandoff:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 56) assertBarrierOnQueue];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)(a1 + 167))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    v9 = BSServiceXPCLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v10;
      _os_log_impl(&dword_19C754000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring message because the connection has been invalidated", buf, 0xCu);
    }

    return;
  }
  lock = (os_unfair_lock_s *)(a1 + 16);
  v11 = [(BSXPCServiceConnectionMessage *)a2 childIdentifier];
  if ([*(id *)(a1 + 176) isRoot] && v11)
  {
    uint64_t v28 = a4;
    v29 = a2;
    unsigned int v13 = [(BSXPCServiceConnectionMessage *)a2 childIdentifierIsRemotelyDefined];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v14 = *(id *)(a1 + 88);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v37;
LABEL_10:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(id **)(*((void *)&v36 + 1) + 8 * v17);
        if (v18 && (id v19 = v18[22]) != 0)
        {
          uint64_t v20 = v19;
          if (v13 != (*((unsigned char *)v19 + 24) != 0))
          {
            v21 = (void *)*((void *)v19 + 4);
LABEL_17:
            if (v21 == v11)
            {
              id v23 = v18;

              if (!v18) {
                goto LABEL_29;
              }
              os_unfair_lock_lock(v23 + 4);
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __73__BSXPCServiceConnection__connection_handleMessage_fromPeer_withHandoff___block_invoke;
              v32[3] = &unk_1E58FC508;
              v24 = v23;
              v33 = v24;
              v34 = v29;
              v35 = a3;
              -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v24, v32, v28);
              os_unfair_lock_unlock(v23 + 4);
              v25 = v33;
              goto LABEL_31;
            }
          }
        }
        else
        {
          uint64_t v20 = 0;
          v21 = 0;
          if (v13) {
            goto LABEL_17;
          }
        }

        if (v15 == ++v17)
        {
          uint64_t v22 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
          uint64_t v15 = v22;
          if (v22) {
            goto LABEL_10;
          }
          break;
        }
      }
    }

LABEL_29:
    v25 = BSServiceXPCLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 8);
      uint64_t v27 = @"r";
      *(_DWORD *)buf = 138543874;
      if (v13) {
        uint64_t v27 = &stru_1EED42A98;
      }
      uint64_t v41 = v26;
      __int16 v42 = 2050;
      __int16 v43 = v11;
      __int16 v44 = 2114;
      __int16 v45 = v27;
      _os_log_error_impl(&dword_19C754000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Ignoring connection message because no connection exists for %{public}llx%{public}@", buf, 0x20u);
    }
    v24 = 0;
LABEL_31:

    os_unfair_lock_unlock(lock);
  }
  else
  {
    os_unfair_lock_t locka = (os_unfair_lock_t)*(id *)(a1 + 144);
    -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](a1, a2, a3);
    -[BSXPCServiceConnectionEventHandler connection:handleMessage:]((uint64_t)locka, (os_unfair_lock_s *)a1, (uint64_t)a2);
  }
}

- (void)_connection_consumeLock_runPendedEventsIfAppropriate
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (!*(unsigned char *)(a1 + 160))
  {
    uint64_t v16 = [NSString stringWithFormat:@"we should never get here if we've never set up the connection queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__connection_consumeLock_runPendedEventsIfAppropriate);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v31 = v17;
      __int16 v32 = 2114;
      v33 = v19;
      __int16 v34 = 2048;
      uint64_t v35 = a1;
      __int16 v36 = 2114;
      long long v37 = @"BSXPCServiceConnection.m";
      __int16 v38 = 1024;
      int v39 = 983;
      __int16 v40 = 2114;
      uint64_t v41 = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7591C8);
  }
  [*(id *)(a1 + 56) assertBarrierOnQueue];
  int v3 = *(_DWORD *)(a1 + 28);
  if (!*(unsigned char *)(a1 + 160) || !*(unsigned char *)(a1 + 161))
  {
    id v4 = 0;
    goto LABEL_8;
  }
  id v4 = *(id *)(a1 + 96);
  v5 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = 0;

  if (!*(unsigned char *)(a1 + 163))
  {
LABEL_8:
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = *(id *)(a1 + 104);
  id v7 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = 0;

LABEL_9:
  os_unfair_lock_unlock(v2);
  if ([v4 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * i) + 16))();
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      os_unfair_lock_lock(v2);
      if (!*(unsigned char *)(a1 + 163) || v3 != *(_DWORD *)(a1 + 28))
      {

        id v6 = 0;
      }
      os_unfair_lock_unlock(v2);
    }
  }
  if ([v6 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * j));
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }
  }
}

- (void)_connection_consumeLock_didActivateWithMessage:(void *)a3 fromPeer:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (!*(unsigned char *)(a1 + 160))
    {
      id v7 = [NSString stringWithFormat:@"we should never get here if we've never set up the connection queue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connection_consumeLock_didActivateWithMessage_fromPeer_);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        int v11 = 138544642;
        id v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        v18 = @"BSXPCServiceConnection.m";
        __int16 v19 = 1024;
        int v20 = 1050;
        __int16 v21 = 2114;
        long long v22 = v7;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C759440);
    }
    [*(id *)(a1 + 56) assertBarrierOnQueue];
    *(unsigned char *)(a1 + 163) = 1;
    id v6 = [a2 message];
    BSStoreTokenFromMessageToVar();

    if (!*(void *)(a1 + 32)) {
      objc_storeStrong((id *)(a1 + 32), a3);
    }
    -[BSXPCServiceConnection _connection_consumeLock_runPendedEventsIfAppropriate](a1);
  }
}

- (BOOL)shouldSendMessage:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  if (a3 && self->_configured_batchingHandler && *((unsigned char *)a3 + 60))
  {
    if (![(BSXPCServiceConnectionMessageBatch *)self->_batchLock_batchMessage appendMessage:a3])
    {
      batchLock_batchMessage = self->_batchLock_batchMessage;
      if (batchLock_batchMessage
        && ![(BSXPCServiceConnectionMessageBatch *)batchLock_batchMessage didCommit])
      {
        long long v24 = [NSString stringWithFormat:@"previous batch message was not comitted"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          long long v26 = (objc_class *)objc_opt_class();
          long long v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138544642;
          id v29 = v25;
          __int16 v30 = 2114;
          id v31 = v27;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2114;
          uint64_t v35 = @"BSXPCServiceConnection.m";
          __int16 v36 = 1024;
          int v37 = 510;
          __int16 v38 = 2114;
          int v39 = v24;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v24 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C759934);
      }
      id v7 = -[BSXPCServiceConnectionMessage connection]((char *)a3);
      id v8 = *((id *)a3 + 9);
      +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessageBatch, v7, v8, 0, *((_DWORD *)a3 + 16), self);
      uint64_t v9 = (BSXPCServiceConnectionMessageBatch *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = self->_batchLock_batchMessage;
      self->_batchLock_batchMessage = v9;

      -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)self->_batchLock_batchMessage, self->_configured_connectionQueue);
      [(BSXPCServiceConnectionMessageBatch *)self->_batchLock_batchMessage setBatchHandler:self->_configured_batchingHandler];
      if ([(BSXPCServiceConnectionContext *)self->_context isChild])
      {
        int v11 = self->_context;
        id v12 = v11;
        if (v11) {
          uint64_t isa = (uint64_t)v11[2].super.isa;
        }
        else {
          uint64_t isa = 0;
        }
        -[BSXPCServiceConnectionMessage setChildIdentifier:](self->_batchLock_batchMessage, isa);
        if (v12) {
          BOOL v14 = LOBYTE(v12[1]._proem) != 0;
        }
        else {
          BOOL v14 = 0;
        }
        -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](self->_batchLock_batchMessage, (const char *)v14);
      }
      if (![(BSXPCServiceConnectionMessageBatch *)self->_batchLock_batchMessage appendMessage:a3])
      {
        int v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"batched"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          long long v22 = (objc_class *)objc_opt_class();
          uint64_t v23 = NSStringFromClass(v22);
          *(_DWORD *)buf = 138544642;
          id v29 = v21;
          __int16 v30 = 2114;
          id v31 = v23;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2114;
          uint64_t v35 = @"BSXPCServiceConnection.m";
          __int16 v36 = 1024;
          int v37 = 524;
          __int16 v38 = 2114;
          int v39 = v20;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v20 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C759840);
      }
    }
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  else
  {
    uint64_t v16 = self->_batchLock_batchMessage;
    if (v16)
    {
      if (v16 == a3)
      {
        self->_batchLock_batchMessage = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([(BSXPCServiceConnectionMessageBatch *)self->_batchLock_batchMessage commitWithReason:@"non-batching-message"])
          {
            __int16 v17 = BSServiceXPCBatchLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = -[BSXPCServiceConnectionMessage selectorName](a3);
              *(_DWORD *)buf = 138543362;
              id v29 = v18;
              _os_log_impl(&dword_19C754000, v17, OS_LOG_TYPE_DEFAULT, "force-commit batched message due to non-batching message: %{public}@", buf, 0xCu);
            }
          }
          __int16 v19 = self->_batchLock_batchMessage;
          self->_batchLock_batchMessage = 0;
        }
      }
    }
    os_unfair_recursive_lock_unlock();
    return 1;
  }
}

- (BOOL)_isInvalidated
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_eventHandler
{
  v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)v1[18];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

uint64_t __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_180(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_166(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  [*(id *)(*(void *)(a1 + 32) + 112) sendIfNecessary];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0;

  id v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);

  os_unfair_lock_unlock(v4);
}

uint64_t ____BSXPCServiceConnection_IS_INVOKING_A_MESSAGE_REPLY_BLOCK___block_invoke(void *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[7];
  uint64_t v1 = a1[8];
  int v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = self;
  if (!v1)
  {
    id v12 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"callOutBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
      BOOL v14 = (objc_class *)objc_opt_class();
      LODWORD(buf[0]) = 138544642;
      *(void *)((char *)buf + 4) = v13;
      WORD2(buf[1]) = 2114;
      *(void *)((char *)&buf[1] + 6) = NSStringFromClass(v14);
      HIWORD(buf[2]) = 2048;
      buf[3] = v6;
      LOWORD(v34) = 2114;
      *(void *)((char *)&v34 + 2) = @"BSXPCServiceConnectionProxy.m";
      WORD5(v34) = 1024;
      HIDWORD(v34) = 670;
      LOWORD(v35) = 2114;
      *(void *)((char *)&v35 + 2) = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C75A114);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  memset(buf, 0, sizeof(buf));
  id v7 = (void *)[v3 blockArguments];
  id v8 = v7;
  if (v5)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "lastObject"), "argumentIndex");
    if (v9 != [v8 count] - 1)
    {
      __int16 v15 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[arguments lastObject] argumentIndex] == ([arguments count] - 1)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
        __int16 v17 = (objc_class *)objc_opt_class();
        *(_DWORD *)id v21 = 138544642;
        long long v22 = v16;
        __int16 v23 = 2114;
        long long v24 = NSStringFromClass(v17);
        __int16 v25 = 2048;
        uint64_t v26 = v6;
        __int16 v27 = 2114;
        uint64_t v28 = @"BSXPCServiceConnectionProxy.m";
        __int16 v29 = 1024;
        int v30 = 692;
        __int16 v31 = 2114;
        __int16 v32 = v15;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v21, 0x3Au);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75A1F0);
    }
    buf[objc_msgSend((id)objc_msgSend(v8, "lastObject"), "argumentIndex")] = v5;
  }
  else
  {
    if (!v4)
    {
      v18 = (void *)[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"payload != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = NSStringFromSelector(sel_invokeReplyBlock_blockDescriptor_andPayload_error_forConnection_);
        int v20 = (objc_class *)objc_opt_class();
        *(_DWORD *)id v21 = 138544642;
        long long v22 = v19;
        __int16 v23 = 2114;
        long long v24 = NSStringFromClass(v20);
        __int16 v25 = 2048;
        uint64_t v26 = v6;
        __int16 v27 = 2114;
        uint64_t v28 = @"BSXPCServiceConnectionProxy.m";
        __int16 v29 = 1024;
        int v30 = 677;
        __int16 v31 = 2114;
        __int16 v32 = v18;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v21, 0x3Au);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75A2CCLL);
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F4F870]) initWithMessage:v4];
    +[BSXPCServiceConnectionProxy decodeArguments:outArgs:fromMessage:forConnection:]((uint64_t)BSXPCServiceConnectionProxy, v8, (uint64_t)buf, v10, v2);
  }
  uint64_t result = [v8 count];
  switch(result)
  {
    case 0:
      uint64_t result = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
      break;
    case 1:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, buf[0]);
      break;
    case 2:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(v1 + 16))(v1, buf[0], buf[1]);
      break;
    case 3:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2]);
      break;
    case 4:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3]);
      break;
    case 5:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34);
      break;
    case 6:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((void *)&v34 + 1));
      break;
    case 7:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((void *)&v34 + 1), v35);
      break;
    case 8:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((void *)&v34 + 1), v35, *((void *)&v35 + 1));
      break;
    case 9:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((void *)&v34 + 1), v35, *((void *)&v35 + 1), v36);
      break;
    case 10:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void, void, void, void))(v1 + 16))(v1, buf[0], buf[1], buf[2], buf[3], v34, *((void *)&v34 + 1), v35, *((void *)&v35 + 1), v36, *((void *)&v36 + 1));
      break;
    default:
      return result;
  }
  return result;
}

- (void)_connection_handleInvalidateMessage:(uint64_t)a3 withHandoff:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 56) assertBarrierOnQueue];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)(a1 + 167))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    uint64_t v6 = BSServiceXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v7;
      _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring invalidate because this connection has been invalidated", buf, 0xCu);
    }

    return;
  }
  id v8 = [(BSXPCServiceConnectionMessage *)a2 childIdentifier];
  if ([*(id *)(a1 + 176) isRoot] && v8)
  {
    uint64_t v29 = a3;
    unsigned int v10 = [(BSXPCServiceConnectionMessage *)a2 childIdentifierIsRemotelyDefined];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = *(id *)(a1 + 88);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v35;
LABEL_10:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(id **)(*((void *)&v34 + 1) + 8 * v14);
        if (v15 && (id v16 = v15[22]) != 0)
        {
          __int16 v17 = v16;
          if (v10 != (*((unsigned char *)v16 + 24) != 0))
          {
            v18 = (void *)*((void *)v16 + 4);
LABEL_17:
            if (v18 == v8)
            {
              long long v24 = v15;

              if (!v15) {
                goto LABEL_30;
              }
              os_unfair_lock_lock(v24 + 4);
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __74__BSXPCServiceConnection__connection_handleInvalidateMessage_withHandoff___block_invoke;
              v31[3] = &unk_1E58FC4E0;
              __int16 v25 = v24;
              __int16 v32 = v25;
              v33 = a2;
              -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v25, v31, v29);
              os_unfair_lock_unlock(v24 + 4);
              uint64_t v26 = v32;
              goto LABEL_35;
            }
          }
        }
        else
        {
          __int16 v17 = 0;
          v18 = 0;
          if (v10) {
            goto LABEL_17;
          }
        }

        if (v12 == ++v14)
        {
          uint64_t v19 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
          uint64_t v12 = v19;
          if (v19) {
            goto LABEL_10;
          }
          break;
        }
      }
    }

LABEL_30:
    uint64_t v26 = BSServiceXPCLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 8);
      uint64_t v28 = @"r";
      *(_DWORD *)buf = 138543874;
      if (v10) {
        uint64_t v28 = &stru_1EED42A98;
      }
      uint64_t v39 = v27;
      __int16 v40 = 2050;
      uint64_t v41 = v8;
      __int16 v42 = 2114;
      __int16 v43 = v28;
      _os_log_impl(&dword_19C754000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring invalidation message; no child found for %{public}llx%{public}@",
        buf,
        0x20u);
    }
    __int16 v25 = 0;
LABEL_35:

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
  else
  {
    int v20 = BSServiceXPCLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v21;
      _os_log_impl(&dword_19C754000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidation message received.", buf, 0xCu);
    }

    long long v22 = -[BSXPCServiceConnectionMessage messageID](a2);
    int v23 = [v22 isEqualToString:@"interrupt"];

    if (v23)
    {
      -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](a1, MEMORY[0x1E4F14520], 0);
    }
    else
    {
      *(unsigned char *)(a1 + 164) = 1;
      -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:](a1, MEMORY[0x1E4F14528], 0);
    }
  }
}

void __53__BSXPCServiceConnection__invalidateChildConnection___block_invoke(uint64_t a1)
{
}

uint64_t __74__BSXPCServiceConnection__connection_handleInvalidateMessage_withHandoff___block_invoke(uint64_t a1)
{
  return -[BSXPCServiceConnection _connection_handleInvalidateMessage:withHandoff:](*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (BOOL)_isClientInvalidated
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_clientInvalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (uint64_t)remoteTargetWithAssertionAttributes:(int)a3 enforcingLaunchConstraints:
{
  int v3 = (uint64_t *)a1;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    if (*((unsigned char *)v3 + 160))
    {
      if (a3)
      {
        if (*((unsigned char *)v3 + 162))
        {
          if (![a2 count])
          {
            uint64_t v21 = [NSString stringWithFormat:@"empty launch attributes"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_remoteTargetWithAssertionAttributes_enforcingLaunchConstraints_);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              int v23 = (objc_class *)objc_opt_class();
              long long v24 = NSStringFromClass(v23);
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v24;
              *(_WORD *)&buf[22] = 2048;
              int v30 = v3;
              *(_WORD *)__int16 v31 = 2114;
              *(void *)&v31[2] = @"BSXPCServiceConnection.m";
              __int16 v32 = 1024;
              int v33 = 198;
              __int16 v34 = 2114;
              long long v35 = v21;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v21 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C762DD0);
          }
          uint64_t v25 = 0;
          uint64_t v26 = &v25;
          uint64_t v27 = 0x2050000000;
          uint64_t v7 = (void *)getRBSConstraintsAttributeClass_softClass_0;
          uint64_t v28 = getRBSConstraintsAttributeClass_softClass_0;
          if (!getRBSConstraintsAttributeClass_softClass_0)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getRBSConstraintsAttributeClass_block_invoke_0;
            int v30 = (uint64_t *)&unk_1E58FBE80;
            *(void *)__int16 v31 = &v25;
            __getRBSConstraintsAttributeClass_block_invoke_0((uint64_t)buf);
            uint64_t v7 = (void *)v26[3];
          }
          id v8 = v7;
          _Block_object_dispose(&v25, 8);
          uint64_t v9 = objc_msgSend(v8, "attributeWithConstraints:", 7, v25);
          uint64_t v10 = v3[18];
          id v11 = (void *)v3[14];
          uint64_t v12 = [a2 arrayByAddingObject:v9];
          -[BSXPCServiceConnectionEventHandler remoteTargetWithHandshake:assertionAttributes:](v10, v11, v12);
          int v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();

          goto LABEL_17;
        }
      }
      else
      {
        if (*((unsigned char *)v3 + 162)) {
          goto LABEL_15;
        }
        uint64_t v13 = (void *)v3[18];
        if (v13) {
          uint64_t v13 = (void *)v13[22];
        }
        uint64_t v14 = v13;
        uint64_t v15 = [v14 clientMessagingExpectation];

        if (v15 == 1)
        {
LABEL_15:
          if (*((unsigned char *)v3 + 161) && !*((unsigned char *)v3 + 163))
          {
            __int16 v17 = [NSString stringWithFormat:@"cannot send a message before handshake has finished"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel_remoteTargetWithAssertionAttributes_enforcingLaunchConstraints_);
              id v18 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v19 = (objc_class *)objc_opt_class();
              int v20 = NSStringFromClass(v19);
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v18;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v20;
              *(_WORD *)&buf[22] = 2048;
              int v30 = v3;
              *(_WORD *)__int16 v31 = 2114;
              *(void *)&v31[2] = @"BSXPCServiceConnection.m";
              __int16 v32 = 1024;
              int v33 = 208;
              __int16 v34 = 2114;
              long long v35 = v17;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v17 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C762CDCLL);
          }
        }
      }
      -[BSXPCServiceConnectionEventHandler remoteTargetWithHandshake:assertionAttributes:](v3[18], 0, a2);
      int v3 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v3 = 0;
    }
LABEL_17:
    os_unfair_lock_unlock(v6);
  }

  return v3;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_175(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);

  -[BSXPCServiceConnection _connection_consumeLock_runPendedEventsIfAppropriate](v2);
}

- (void)_invalidateChildConnection:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_lock_childConnections containsObject:a3])
  {
    [(NSMutableArray *)self->_lock_childConnections removeObjectIdenticalTo:a3];
    -[BSXPCServiceConnection _setParent:]((uint64_t)a3, 0);
    if (![(NSMutableArray *)self->_lock_childConnections count] && self->_lock_configured)
    {
      uint64_t v6 = self->_lock_eventHandler;
      configured_connectionQueue = self->_configured_connectionQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__BSXPCServiceConnection__invalidateChildConnection___block_invoke;
      v9[3] = &unk_1E58FC4E0;
      uint64_t v10 = v6;
      id v11 = self;
      id v8 = v6;
      [(BSServiceDispatchingQueue *)configured_connectionQueue performAsync:v9];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_associateNewChildConnection:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (!*(unsigned char *)(a1 + 160))
  {
    id v18 = [NSString stringWithFormat:@"Parent connection must be configured before associating children"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      int v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      uint64_t v21 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v37 = v19;
      __int16 v38 = 2114;
      uint64_t v39 = v21;
      __int16 v40 = 2048;
      uint64_t v41 = a1;
      __int16 v42 = 2114;
      __int16 v43 = @"BSXPCServiceConnection.m";
      __int16 v44 = 1024;
      int v45 = 910;
      __int16 v46 = 2114;
      uint64_t v47 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C764314);
  }
  objc_storeStrong((id *)(a2 + 48), *(id *)(a1 + 48));
  if (*(unsigned char *)(a1 + 166))
  {
    id v22 = [NSString stringWithFormat:@"Cannot associate a child connection with an invalidated root connection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      long long v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      uint64_t v25 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v37 = v23;
      __int16 v38 = 2114;
      uint64_t v39 = v25;
      __int16 v40 = 2048;
      uint64_t v41 = a1;
      __int16 v42 = 2114;
      __int16 v43 = @"BSXPCServiceConnection.m";
      __int16 v44 = 1024;
      int v45 = 912;
      __int16 v46 = 2114;
      uint64_t v47 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76440CLL);
  }
  uint64_t v4 = (uint64_t *)*(id *)(a2 + 176);
  if (([v4 isChild] & 1) == 0)
  {
    uint64_t v26 = NSString;
    id v27 = [(id)a2 description];
    uint64_t v28 = objc_msgSend(v26, "stringWithFormat:", @"attempt to add a child connection that wasn't a child : %s", objc_msgSend(v27, "UTF8String"));

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_associateNewChildConnection_);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      int v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      __int16 v31 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v37 = v29;
      __int16 v38 = 2114;
      uint64_t v39 = v31;
      __int16 v40 = 2048;
      uint64_t v41 = a1;
      __int16 v42 = 2114;
      __int16 v43 = @"BSXPCServiceConnection.m";
      __int16 v44 = 1024;
      int v45 = 914;
      __int16 v46 = 2114;
      uint64_t v47 = v28;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C764524);
  }
  int v5 = *(unsigned __int8 *)(a1 + 167);
  uint64_t v6 = BSServiceXPCLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543618;
      id v37 = v8;
      __int16 v38 = 2114;
      uint64_t v39 = v4;
      _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Auto-invalidating new child: %{public}@", buf, 0x16u);
    }

    -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](a2, 0);
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543618;
      id v37 = v9;
      __int16 v38 = 2114;
      uint64_t v39 = v4;
      _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding child: %{public}@", buf, 0x16u);
    }

    uint64_t v10 = *(void **)(a1 + 88);
    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v11;

      uint64_t v10 = *(void **)(a1 + 88);
    }
    if ([v10 containsObject:a2])
    {
      __int16 v32 = [NSString stringWithFormat:@"we are already tracking this child"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_associateNewChildConnection_);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        long long v35 = (uint64_t *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        id v37 = v33;
        __int16 v38 = 2114;
        uint64_t v39 = v35;
        __int16 v40 = 2048;
        uint64_t v41 = a1;
        __int16 v42 = 2114;
        __int16 v43 = @"BSXPCServiceConnection.m";
        __int16 v44 = 1024;
        int v45 = 926;
        __int16 v46 = 2114;
        uint64_t v47 = v32;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C764618);
    }
    [*(id *)(a1 + 88) addObject:a2];
    -[BSXPCServiceConnection _setParent:](a2, (void *)a1);
    uint64_t v13 = +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, *(void **)(a1 + 72));
    uint64_t v14 = v13;
    if (v4) {
      uint64_t v15 = v4[4];
    }
    else {
      uint64_t v15 = 0;
    }
    -[BSXPCServiceConnectionMessage setChildIdentifier:](v13, v15);
    if (v4) {
      BOOL v16 = *((unsigned char *)v4 + 24) != 0;
    }
    else {
      BOOL v16 = 0;
    }
    -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v14, (const char *)v16);
    __int16 v17 = *(void **)(a2 + 128);
    *(void *)(a2 + 128) = v14;
  }
}

- (void)_setParent:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_storeStrong((id *)(a1 + 152), a2);
    os_unfair_lock_unlock(v4);
  }
}

+ (id)_invalidationMessageForXPCConnection:(uint64_t)a1
{
  self;
  int v3 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, a2, 0, 0, 0, 0);
  -[BSXPCServiceConnectionMessage setMessageID:](v3, @"invalidate");

  return v3;
}

- (void)configure:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v4 = [NSString stringWithFormat:@"API misuse: handler block not specified"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = (objc_class *)objc_opt_class();
        BOOL v7 = NSStringFromClass(v6);
        int v16 = 138544642;
        id v17 = v5;
        __int16 v18 = 2114;
        id v19 = v7;
        __int16 v20 = 2048;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = @"BSXPCServiceConnection.m";
        __int16 v24 = 1024;
        int v25 = 235;
        __int16 v26 = 2114;
        id v27 = v4;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
      }
      [v4 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7654F8);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(unsigned char *)(a1 + 160))
    {
      id v8 = [NSString stringWithFormat:@"API misuse: connection cannot be mutated once activated"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        int v16 = 138544642;
        id v17 = v9;
        __int16 v18 = 2114;
        id v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = @"BSXPCServiceConnection.m";
        __int16 v24 = 1024;
        int v25 = 238;
        __int16 v26 = 2114;
        id v27 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7655F0);
    }
    if (*(unsigned char *)(a1 + 166))
    {
      uint64_t v12 = [NSString stringWithFormat:@"API misuse: connection cannot be mutated once invalidated"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_configure_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        int v16 = 138544642;
        id v17 = v13;
        __int16 v18 = 2114;
        id v19 = v15;
        __int16 v20 = 2048;
        uint64_t v21 = a1;
        __int16 v22 = 2114;
        id v23 = @"BSXPCServiceConnection.m";
        __int16 v24 = 1024;
        int v25 = 239;
        __int16 v26 = 2114;
        id v27 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v16, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7656E8);
    }
    if (*(void *)(a1 + 144)) {
      (*(void (**)(uint64_t))(a2 + 16))(a2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (uint64_t)activateNowOrWhenReady:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (![*(id *)(a1 + 176) isChild])
  {
    id v5 = 0;
    goto LABEL_6;
  }
  id v5 = (os_unfair_lock_s *)*(id *)(a1 + 152);
  if (!v5)
  {
LABEL_6:
    char v6 = 1;
    goto LABEL_7;
  }
  os_unfair_lock_unlock(v4);
  os_unfair_lock_lock(v5 + 4);
  os_unfair_lock_lock(v4);
  char v6 = 0;
LABEL_7:
  uint64_t v7 = -[BSXPCServiceConnection _lock_activateNowOrWhenReady:]((const os_unfair_lock *)a1, a2);
  os_unfair_lock_unlock(v4);
  if ((v6 & 1) == 0) {
    os_unfair_lock_unlock(v5 + 4);
  }

  return v7;
}

- (uint64_t)_lock_activateNowOrWhenReady:(const os_unfair_lock *)a1
{
  uint64_t v2 = (uint64_t)a1;
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v2;
  }
  os_unfair_lock_assert_owner(a1 + 4);
  if ([*(id *)(v2 + 176) isChild])
  {
    uint64_t v4 = (const os_unfair_lock *)*(id *)(v2 + 152);
    id v5 = (id *)v4;
    if (v4)
    {
      os_unfair_lock_assert_owner(v4 + 4);
      char v6 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    id v5 = 0;
  }
  char v6 = 1;
LABEL_7:
  if (!*(unsigned char *)(v2 + 160))
  {
    if (*(unsigned char *)(v2 + 166))
    {
      v110 = [NSString stringWithFormat:@"API misuse: connection cannot be activated once invalidated"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        id v111 = (id)objc_claimAutoreleasedReturnValue();
        v112 = (objc_class *)objc_opt_class();
        v113 = NSStringFromClass(v112);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v111;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v113;
        __int16 v153 = 2048;
        uint64_t v154 = v2;
        __int16 v155 = 2114;
        v156 = @"BSXPCServiceConnection.m";
        __int16 v157 = 1024;
        int v158 = 578;
        __int16 v159 = 2114;
        v160 = v110;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v110 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C766740);
    }
    uint64_t v7 = *(void *)(v2 + 144);
    if (!v7)
    {
      v114 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_eventHandler"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        id v115 = (id)objc_claimAutoreleasedReturnValue();
        v116 = (objc_class *)objc_opt_class();
        v117 = NSStringFromClass(v116);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v115;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v117;
        __int16 v153 = 2048;
        uint64_t v154 = v2;
        __int16 v155 = 2114;
        v156 = @"BSXPCServiceConnection.m";
        __int16 v157 = 1024;
        int v158 = 580;
        __int16 v159 = 2114;
        v160 = v114;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v114 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C766844);
    }
    if (!*(void *)(v7 + 112) && !*(void *)(v7 + 88))
    {
      v126 = [NSString stringWithFormat:@"we must have an error or invalidation handler"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        id v127 = (id)objc_claimAutoreleasedReturnValue();
        v128 = (objc_class *)objc_opt_class();
        v129 = NSStringFromClass(v128);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v127;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v129;
        __int16 v153 = 2048;
        uint64_t v154 = v2;
        __int16 v155 = 2114;
        v156 = @"BSXPCServiceConnection.m";
        __int16 v157 = 1024;
        int v158 = 581;
        __int16 v159 = 2114;
        v160 = v126;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v126 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C766B2CLL);
    }
    *(unsigned char *)(v2 + 160) = 1;
    id v8 = [*(id *)(v2 + 176) endpointDescription];
    id v9 = *(void **)(v2 + 144);
    if (v9) {
      id v9 = (void *)v9[18];
    }
    uint64_t v10 = v9;

    if (v10)
    {
      id v11 = *(void **)(v2 + 144);
      if (v11) {
        id v11 = (void *)v11[18];
      }
      uint64_t v12 = v11;
      uint64_t v13 = [v8 stringByAppendingFormat:@" (%@)", v12];

      id v8 = (void *)v13;
    }
    uint64_t v14 = *(void **)(v2 + 144);
    if (v14) {
      uint64_t v14 = (void *)v14[20];
    }
    uint64_t v15 = v14;
    int v16 = [*(id *)(v2 + 176) isRoot];
    if (v15) {
      int v17 = v16;
    }
    else {
      int v17 = 0;
    }
    if (v17 == 1)
    {
      v118 = [NSString stringWithFormat:@"Root connections may not specify a <BSServiceDispatchingQueue>."];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
        id v119 = (id)objc_claimAutoreleasedReturnValue();
        v120 = (objc_class *)objc_opt_class();
        v121 = NSStringFromClass(v120);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v119;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v121;
        __int16 v153 = 2048;
        uint64_t v154 = v2;
        __int16 v155 = 2114;
        v156 = @"BSXPCServiceConnection.m";
        __int16 v157 = 1024;
        int v158 = 590;
        __int16 v159 = 2114;
        v160 = v118;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v118 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76693CLL);
    }
    if (!v15)
    {
      uint64_t v18 = *(void *)(v2 + 144);
      if (v18 && (id v19 = *(id *)(v18 + 168)) != 0)
      {
        id v20 = v19;
        uint64_t v21 = v20;
      }
      else
      {
        uint64_t v21 = +[BSServiceQuality userInitiated];
        id v20 = 0;
      }

      __int16 v22 = [MEMORY[0x1E4F4F730] serial];
      id v23 = objc_msgSend(v22, "serviceClass:relativePriority:", objc_msgSend(v21, "serviceClass"), objc_msgSend(v21, "relativePriority"));

      __int16 v24 = *(void **)(v2 + 144);
      if (v24) {
        __int16 v24 = (void *)v24[19];
      }
      int v25 = v24;

      if (v25)
      {
        __int16 v26 = *(void **)(v2 + 144);
        if (v26) {
          __int16 v26 = (void *)v26[19];
        }
        id v27 = v26;
        uint64_t v28 = [v23 targetQueue:v27];

        id v23 = (void *)v28;
      }
      id v29 = [NSString stringWithFormat:@"BSXPCCnx:%@", v8];
      int v30 = (void *)BSDispatchQueueCreate();

      if ([*(id *)(v2 + 176) isRoot]) {
        objc_storeStrong((id *)(v2 + 48), v30);
      }
      uint64_t v15 = -[_BSServiceDispatchingQueueImpl initWithQueue:]((id *)[_BSServiceDispatchingQueueImpl alloc], v30);
      -[BSXPCServiceConnectionEventHandler setTargetQueue:](*(void *)(v2 + 144), v30);
      -[BSXPCServiceConnectionEventHandler setTargetDispatchingQueue:](*(void *)(v2 + 144), v15);
    }
    objc_storeStrong((id *)(v2 + 56), v15);
    uint64_t v31 = *(void *)(v2 + 144);
    if (v31) {
      __int16 v32 = *(void **)(v31 + 120);
    }
    else {
      __int16 v32 = 0;
    }
    objc_storeStrong((id *)(v2 + 64), v32);
  }
  if (!*(unsigned char *)(v2 + 161))
  {
    uint64_t v33 = *(void *)(v2 + 144);
    if (v33)
    {
      id v34 = *(id *)(v33 + 144);

      long long v35 = BSServiceXPCLog();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          uint64_t v37 = *(void *)(v2 + 8);
          __int16 v38 = *(void **)(v2 + 144);
          if (v38) {
            __int16 v38 = (void *)v38[18];
          }
          uint64_t v39 = v38;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v39;
          _os_log_impl(&dword_19C754000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Client activate (\"%{public}@\").", buf, 0x16u);
        }
      }
      else if (v36)
      {
        uint64_t v42 = *(void *)(v2 + 8);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_19C754000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Client activate.", buf, 0xCu);
      }

      *(unsigned char *)(v2 + 161) = 1;
      ++*(_DWORD *)(v2 + 28);
    }
    else
    {
      if (!*(unsigned char *)(v2 + 167))
      {
        v122 = [NSString stringWithFormat:@"must be invalidated if there is no event handler"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
          id v123 = (id)objc_claimAutoreleasedReturnValue();
          v124 = (objc_class *)objc_opt_class();
          v125 = NSStringFromClass(v124);
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v123;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v125;
          __int16 v153 = 2048;
          uint64_t v154 = v2;
          __int16 v155 = 2114;
          v156 = @"BSXPCServiceConnection.m";
          __int16 v157 = 1024;
          int v158 = 623;
          __int16 v159 = 2114;
          v160 = v122;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v122 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C766A34);
      }
      __int16 v40 = BSServiceXPCLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = *(void *)(v2 + 8);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_19C754000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring client re-activate after invalidation.", buf, 0xCu);
      }
    }
    if (!*(unsigned char *)(v2 + 167))
    {
      if ([*(id *)(v2 + 176) isRoot])
      {
        if ([*(id *)(v2 + 176) isClient])
        {
          uint64_t v43 = objc_opt_class();
          if (v43 == objc_opt_class())
          {
            v70 = *(void **)(v2 + 56);
            v151[0] = MEMORY[0x1E4F143A8];
            v151[1] = 3221225472;
            v151[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke;
            v151[3] = &unk_1E58FC278;
            v151[4] = v2;
            [v70 performAsync:v151];
          }
          else
          {
            uint64_t v44 = objc_opt_class();
            if (v44 != objc_opt_class())
            {
              v104 = NSString;
              id v105 = [*(id *)(v2 + 176) description];
              v106 = objc_msgSend(v104, "stringWithFormat:", @"unknown root context %s", objc_msgSend(v105, "UTF8String"));

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
                id v107 = (id)objc_claimAutoreleasedReturnValue();
                v108 = (objc_class *)objc_opt_class();
                v109 = NSStringFromClass(v108);
                *(_DWORD *)buf = 138544642;
                *(void *)&uint8_t buf[4] = v107;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v109;
                __int16 v153 = 2048;
                uint64_t v154 = v2;
                __int16 v155 = 2114;
                v156 = @"BSXPCServiceConnection.m";
                __int16 v157 = 1024;
                int v158 = 647;
                __int16 v159 = 2114;
                v160 = v106;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              [v106 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C766648);
            }
            int v45 = *(void **)(v2 + 176);
            if (v45) {
              int v45 = (void *)v45[6];
            }
            __int16 v46 = v45;
            xpc_connection_t v47 = xpc_connection_create_from_endpoint(v46);
            uint64_t v48 = *(void **)(v2 + 80);
            *(void *)(v2 + 80) = v47;

            [*(id *)(v2 + 176) isNonLaunching];
            xpc_connection_set_bs_type();
            uint64_t v49 = *(void *)(v2 + 176);
            if (v49)
            {
              id v50 = *(id *)(v49 + 56);
              v51 = v50;
              if (v50)
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = 0;
                [v50 getUUIDBytes:buf];
                xpc_connection_set_oneshot_instance();
              }
            }
            else
            {
              v51 = 0;
            }
            objc_storeStrong((id *)(v2 + 72), *(id *)(v2 + 80));

            v52 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, *(void **)(v2 + 72), *(void **)(v2 + 48), 0, 0, 0);
            -[BSXPCServiceConnectionMessage setMessageID:](v52, @"connect");
            v53 = -[BSXPCServiceConnectionActivationMessage initWithMessage:]([BSXPCServiceConnectionActivationMessage alloc], v52);
            v54 = *(void **)(v2 + 112);
            *(void *)(v2 + 112) = v53;

            v55 = *(void **)(v2 + 128);
            *(void *)(v2 + 128) = 0;
          }
        }
        else
        {
          if (!*(void *)(v2 + 80))
          {
            v130 = [NSString stringWithFormat:@"server connection must already posess an xpc connection"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
              id v131 = (id)objc_claimAutoreleasedReturnValue();
              v132 = (objc_class *)objc_opt_class();
              v133 = NSStringFromClass(v132);
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v131;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v133;
              __int16 v153 = 2048;
              uint64_t v154 = v2;
              __int16 v155 = 2114;
              v156 = @"BSXPCServiceConnection.m";
              __int16 v157 = 1024;
              int v158 = 660;
              __int16 v159 = 2114;
              v160 = v130;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v130 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C766C24);
          }
          v67 = *(void **)(v2 + 72);
          if (!v67)
          {
            v134 = [NSString stringWithFormat:@"server connection must already posess a last known xpc connection"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
              id v135 = (id)objc_claimAutoreleasedReturnValue();
              v136 = (objc_class *)objc_opt_class();
              v137 = NSStringFromClass(v136);
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v135;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v137;
              __int16 v153 = 2048;
              uint64_t v154 = v2;
              __int16 v155 = 2114;
              v156 = @"BSXPCServiceConnection.m";
              __int16 v157 = 1024;
              int v158 = 661;
              __int16 v159 = 2114;
              v160 = v134;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v134 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C766D1CLL);
          }
          if (!*(void *)(v2 + 128))
          {
            uint64_t v68 = +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, v67);
            v69 = *(void **)(v2 + 128);
            *(void *)(v2 + 128) = v68;
          }
        }
      }
      else
      {
        if (v6)
        {
          *(unsigned char *)(v2 + 162) = 0;
        }
        else
        {
          v150[0] = MEMORY[0x1E4F143A8];
          v150[1] = 3221225472;
          v150[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_166;
          v150[3] = &unk_1E58FCD10;
          v150[4] = v2;
          *(unsigned char *)(v2 + 162) = -[BSXPCServiceConnection _lock_activateNowOrWhenReady:](v5, v150) ^ 1;
          objc_storeStrong((id *)(v2 + 72), v5[9]);
        }
        v56 = *(id *)(v2 + 176);
        v57 = v56;
        if (!v56 || !v56[24])
        {
          v58 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, *(void **)(v2 + 72), *(void **)(v2 + 48), 0, 0, 0);
          -[BSXPCServiceConnectionMessage setMessageID:](v58, @"connect");
          if (v57) {
            uint64_t v59 = v57[4];
          }
          else {
            uint64_t v59 = 0;
          }
          -[BSXPCServiceConnectionMessage setChildIdentifier:](v58, v59);
          if (v57) {
            BOOL v60 = *((unsigned char *)v57 + 24) != 0;
          }
          else {
            BOOL v60 = 0;
          }
          -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v58, (const char *)v60);
          v61 = -[BSXPCServiceConnectionActivationMessage initWithMessage:]([BSXPCServiceConnectionActivationMessage alloc], v58);
          v62 = *(void **)(v2 + 112);
          *(void *)(v2 + 112) = v61;
        }
        if ([v57 isClient] && !*(void *)(v2 + 128))
        {
          uint64_t v63 = +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, *(void **)(v2 + 72));
          v64 = *(void **)(v2 + 128);
          *(void *)(v2 + 128) = v63;

          if (v57) {
            uint64_t v65 = v57[4];
          }
          else {
            uint64_t v65 = 0;
          }
          -[BSXPCServiceConnectionMessage setChildIdentifier:](*(void **)(v2 + 128), v65);
          if (v57) {
            BOOL v66 = *((unsigned char *)v57 + 24) != 0;
          }
          else {
            BOOL v66 = 0;
          }
          -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](*(void **)(v2 + 128), (const char *)v66);
        }
      }
    }
    v71 = *(_xpc_connection_s **)(v2 + 80);
    if (v71)
    {
      xpc_connection_set_target_queue(v71, *(dispatch_queue_t *)(v2 + 48));
      v72 = *(_xpc_connection_s **)(v2 + 80);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2;
      handler[3] = &unk_1E58FCD38;
      handler[4] = v2;
      xpc_connection_set_event_handler(v72, handler);
      if (!xpc_connection_get_context(*(xpc_connection_t *)(v2 + 80)))
      {
        xpc_connection_set_context(*(xpc_connection_t *)(v2 + 80), *(id *)(v2 + 176));
        xpc_connection_set_finalizer_f(*(xpc_connection_t *)(v2 + 80), (xpc_finalizer_t)CFBridgingRelease);
      }
    }
    -[BSXPCServiceConnectionEventHandler connectionInitialized:withActivationGeneration:activeXPCConnection:xpcConnectionTargetQueue:](*(void *)(v2 + 144), (void *)v2, *(_DWORD *)(v2 + 28), *(void **)(v2 + 72), *(void **)(v2 + 48));
    if (*(void *)(v2 + 112))
    {
      id v73 = *(id *)(v2 + 8);
      v74 = (void **)(id)v2;
      int v75 = *(_DWORD *)(v2 + 28);
      -[BSXPCServiceConnectionMessage setReplyQueue:](*(void *)(*(void *)(v2 + 112) + 8), v74[7]);
      v76 = *(void **)(*(void *)(v2 + 112) + 8);
      v77 = *(void **)(v2 + 144);
      if (v77) {
        v77 = (void *)v77[23];
      }
      v78 = v77;
      [v76 encodeObject:v78 forKey:@"bsxpc_context"];

      v79 = *(void **)(*(void *)(v2 + 112) + 8);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_3;
      newValue[3] = &unk_1E58FCD60;
      newValue[4] = v74;
      newValue[5] = v74;
      int v148 = v75;
      id v81 = v73;
      id v147 = v81;
      v82 = v81;
      if (v79)
      {
        objc_setProperty_nonatomic_copy(v79, v80, newValue, 80);
        v82 = v147;
      }
    }
    if (*(void *)(v2 + 120))
    {
      *(unsigned char *)(v2 + 163) = 1;
      v83 = *(void **)(v2 + 56);
      v145[0] = MEMORY[0x1E4F143A8];
      v145[1] = 3221225472;
      v145[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_175;
      v145[3] = &unk_1E58FC278;
      v145[4] = v2;
      [v83 performAsync:v145];
    }
    v84 = *(_xpc_connection_s **)(v2 + 80);
    if (!v84) {
      goto LABEL_109;
    }
    xpc_connection_activate(v84);
    if (xpc_connection_get_bs_type() == 3)
    {
      *(unsigned char *)(v2 + 162) = 1;
    }
    else if (!*(unsigned char *)(v2 + 162))
    {
      goto LABEL_109;
    }
    uint64_t v85 = *(void *)(v2 + 144);
    if (!v85) {
      goto LABEL_108;
    }
    if (!*(unsigned char *)(v85 + 128))
    {
      uint64_t v85 = *(void *)(v85 + 176);
LABEL_108:
      id v86 = (id)v85;
      BOOL v87 = [v86 clientMessagingExpectation] == 1;

      if (!v87)
      {
        v100 = [NSString stringWithFormat:@"non-launching ports can only be used with services that are explicitly non-launching aware or whose interface supports BSServiceInterfaceMessagingExpectationAfterHandshake"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__lock_activateNowOrWhenReady_);
          id v101 = (id)objc_claimAutoreleasedReturnValue();
          v102 = (objc_class *)objc_opt_class();
          v103 = NSStringFromClass(v102);
          *(_DWORD *)buf = 138544642;
          *(void *)&uint8_t buf[4] = v101;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v103;
          __int16 v153 = 2048;
          uint64_t v154 = v2;
          __int16 v155 = 2114;
          v156 = @"BSXPCServiceConnection.m";
          __int16 v157 = 1024;
          int v158 = 761;
          __int16 v159 = 2114;
          v160 = v100;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v100 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C76652CLL);
      }
    }
LABEL_109:
    if (([*(id *)(v2 + 176) isRoot] & 1) != 0 || !*(unsigned char *)(v2 + 162))
    {
      [*(id *)(v2 + 112) sendIfNecessary];
      v88 = *(void **)(v2 + 112);
      *(void *)(v2 + 112) = 0;
    }
    [*(id *)(v2 + 120) send];
    v89 = *(void **)(v2 + 120);
    *(void *)(v2 + 120) = 0;

    id v90 = *(id *)(v2 + 144);
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_179;
    v142[3] = &unk_1E58FCD88;
    id v143 = v90;
    uint64_t v144 = a2;
    v142[4] = v2;
    id v91 = v90;
    -[BSXPCServiceConnection _lock_enqueueConnectionEstablishedEvent:](v2, v142);

    goto LABEL_113;
  }
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_180;
  v141[3] = &unk_1E58FCC20;
  v141[4] = v2;
  v141[5] = a2;
  -[BSXPCServiceConnection _lock_enqueueConnectionEstablishedEvent:](v2, v141);
LABEL_113:
  if (*(unsigned char *)(v2 + 167))
  {
    id v92 = *(id *)(v2 + 144);
    v93 = v92;
    if (v92)
    {
      v94 = *(void **)(v2 + 56);
      v138[0] = MEMORY[0x1E4F143A8];
      v138[1] = 3221225472;
      v138[2] = __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2_181;
      v138[3] = &unk_1E58FC4E0;
      id v139 = v92;
      uint64_t v140 = v2;
      [v94 performAsync:v138];
    }
    v95 = *(void **)(v2 + 144);
    *(void *)(v2 + 144) = 0;

    v96 = *(void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;

    v97 = *(void **)(v2 + 96);
    *(void *)(v2 + 96) = 0;

    v98 = *(void **)(v2 + 104);
    *(void *)(v2 + 104) = 0;
  }
  uint64_t v2 = *(unsigned char *)(v2 + 162) == 0;

  return v2;
}

- (void)_lock_enqueueChildActivateEvent:(uint64_t)a3 forHandoff:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      int v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_enqueueChildActivateEvent_forHandoff_);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v25 = v17;
        __int16 v26 = 2114;
        id v27 = v19;
        __int16 v28 = 2048;
        uint64_t v29 = a1;
        __int16 v30 = 2114;
        uint64_t v31 = @"BSXPCServiceConnection.m";
        __int16 v32 = 1024;
        int v33 = 938;
        __int16 v34 = 2114;
        long long v35 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7672F0);
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (([*(id *)(a1 + 176) isChild] & 1) == 0)
    {
      id v20 = [NSString stringWithFormat:@"may only be called on children"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__lock_enqueueChildActivateEvent_forHandoff_);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138544642;
        id v25 = v21;
        __int16 v26 = 2114;
        id v27 = v23;
        __int16 v28 = 2048;
        uint64_t v29 = a1;
        __int16 v30 = 2114;
        uint64_t v31 = @"BSXPCServiceConnection.m";
        __int16 v32 = 1024;
        int v33 = 941;
        __int16 v34 = 2114;
        long long v35 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7673E4);
    }
    if (*(unsigned char *)(a1 + 167))
    {
      char v6 = BSServiceXPCLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        id v25 = v7;
        _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping child activate event because we have been invalidated.", buf, 0xCu);
      }
    }
    else if (*(unsigned char *)(a1 + 160) && *(unsigned char *)(a1 + 161))
    {
      id v8 = *(void **)(a1 + 56);
      if (a3)
      {
        [v8 performAsync:a2 withHandoff:a3];
      }
      else
      {
        [v8 performAsync:a2];
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 96);
      if (!v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v11 = *(void **)(a1 + 96);
        *(void *)(a1 + 96) = v10;

        id v9 = *(void **)(a1 + 96);
      }
      uint64_t v12 = (void *)[a2 copy];
      uint64_t v13 = (void *)MEMORY[0x19F399B00]();
      [v9 addObject:v13];

      uint64_t v14 = BSServiceXPCLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        id v25 = v15;
        _os_log_impl(&dword_19C754000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Pending event until connection activated.", buf, 0xCu);
      }
    }
  }
}

- (void)_lock_enqueueConnectionEstablishedEvent:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__lock_enqueueConnectionEstablishedEvent_);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = v17;
      __int16 v22 = 2048;
      uint64_t v23 = a1;
      __int16 v24 = 2114;
      id v25 = @"BSXPCServiceConnection.m";
      __int16 v26 = 1024;
      int v27 = 963;
      __int16 v28 = 2114;
      uint64_t v29 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76771CLL);
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
  if (*(unsigned char *)(a1 + 167))
  {
    uint64_t v4 = BSServiceXPCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      id v19 = v5;
      _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping established event because we have been invalidated.", buf, 0xCu);
    }
  }
  else if (*(unsigned char *)(a1 + 160) && *(unsigned char *)(a1 + 163))
  {
    char v6 = *(void **)(a1 + 56);
    [v6 performAsync:a2];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 104);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v9 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v8;

      uint64_t v7 = *(void **)(a1 + 104);
    }
    id v10 = (void *)[a2 copy];
    id v11 = (void *)MEMORY[0x19F399B00]();
    [v7 addObject:v11];

    uint64_t v12 = BSServiceXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl(&dword_19C754000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Pending event until connection established.", buf, 0xCu);
    }
  }
}

void __71__BSXPCServiceConnection__connection_handleActivationMessage_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 32);
  if (v3) {
    int v3 = (void *)v3[21];
  }
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v7 = v4;
    uint64_t v5 = [v4 copy];
    char v6 = *(void **)(a2 + 168);
    *(void *)(a2 + 168) = v5;

    uint64_t v4 = v7;
  }
}

- (os_unfair_lock_s)name
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    int v3 = *(void **)&v1[36]._os_unfair_lock_opaque;
    if (v3) {
      int v3 = (void *)v3[18];
    }
    uint64_t v1 = v3;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_179(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = BSServiceXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19C754000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Established.", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
  -[BSXPCServiceConnectionEventHandler connectionActivated:](*(void **)(a1 + 40), *(os_unfair_lock_s **)(a1 + 32));
}

- (void)updateAuditTokenFromReplyMessage:(id)a3 fromActivationGeneration:(unsigned int)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_activated && self->_lock_activationGeneration == a4)
  {
    id v8 = [a3 message];
    BSStoreTokenFromMessageToVar();
  }

  os_unfair_lock_unlock(p_lock);
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v6 + 161) && *(_DWORD *)(a1 + 56) == *(_DWORD *)(v6 + 28))
    {
      uint64_t v7 = [a2 XPCConnection];
      +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, v7);
      id v8 = (id *)objc_claimAutoreleasedReturnValue();

      id v9 = BSServiceXPCLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (!v10)
      {
LABEL_22:
        -[BSXPCServiceConnection _connection_consumeLock_didActivateWithMessage:fromPeer:](*(void *)(a1 + 32), a2, v8);

        return;
      }
      if (v8)
      {
        id v11 = v8[4];
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = NSString;
          uint64_t v14 = [v11 name];
          id v15 = v14;
          if (!v14)
          {
            uint64_t v16 = [v12 bundleIdentifier];
            uint64_t v3 = (void *)v16;
            if (v16) {
              id v15 = (__CFString *)v16;
            }
            else {
              id v15 = @"?";
            }
          }
          id v17 = [v13 stringWithFormat:@"%@:%d", v15, objc_msgSend(v12, "pid")];
          if (!v14) {

          }
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      id v17 = 0;
LABEL_19:
      __int16 v20 = BSServiceXPCLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v21;
        __int16 v24 = 2114;
        id v25 = v17;
        _os_log_impl(&dword_19C754000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Got activation reply from server %{public}@", buf, 0x16u);
      }

      goto LABEL_22;
    }
    uint64_t v18 = BSServiceXPCLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v19;
      _os_log_impl(&dword_19C754000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Dropping activation reply because it is out of date", buf, 0xCu);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  }
}

- (id)activeMessageBatch
{
  uint64_t v1 = a1;
  if (a1)
  {
    os_unfair_recursive_lock_lock_with_options();
    uint64_t v1 = (id *)v1[17];
    os_unfair_recursive_lock_unlock();
  }

  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteAssertionTarget, 0);
  objc_storeStrong((id *)&self->_lock_parent, 0);
  objc_storeStrong((id *)&self->_lock_eventHandler, 0);
  objc_storeStrong((id *)&self->_batchLock_batchMessage, 0);
  objc_storeStrong((id *)&self->_lock_invalidationMessage, 0);
  objc_storeStrong((id *)&self->_lock_activationReply, 0);
  objc_storeStrong((id *)&self->_lock_activationMessage, 0);
  objc_storeStrong((id *)&self->_lock_connectionEstablishedEvents, 0);
  objc_storeStrong((id *)&self->_lock_connectionActivatedEvents, 0);
  objc_storeStrong((id *)&self->_lock_childConnections, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_lock_lastKnownConnection, 0);
  objc_storeStrong(&self->_configured_batchingHandler, 0);
  objc_storeStrong((id *)&self->_configured_connectionQueue, 0);
  objc_storeStrong((id *)&self->_configured_underlyingTargetQueue, 0);
  objc_storeStrong((id *)&self->_lock_auditToken, 0);
  objc_storeStrong((id *)&self->_lock_peer, 0);

  objc_storeStrong((id *)&self->_proem, 0);
}

- (id)auditToken
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v1 = (id *)v1[5];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (id)peer
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

+ (id)_connectionWithIncomingXPCConnection:(void *)a3 endpointDescription:
{
  self;
  int v5 = +[BSXPCServiceConnectionPeer peerOfConnection:]((uint64_t)BSXPCServiceConnectionPeer, a2);
  BSStoreTokenFromXPCConnectionToVar();
  uint64_t v6 = [0 pid];
  if ((int)v6 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [getRBSTargetClass() targetWithPid:v6];
  }
  id v8 = [BSXPCServiceConnection alloc];
  id v9 = +[BSXPCServiceConnectionRootServerContext uniqueServerContextWithEndpointDescription:]((uint64_t)BSXPCServiceConnectionRootServerContext, a3);
  BOOL v10 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v8->super.isa, v9, v7);

  objc_storeStrong(v10 + 9, a2);
  objc_storeStrong(v10 + 10, a2);
  objc_storeStrong(v10 + 4, v5);
  objc_storeStrong(v10 + 5, 0);
  uint64_t v11 = +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
  id v12 = v10[16];
  v10[16] = (id)v11;

  return v10;
}

+ (id)connectionWithConnection:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  id v4 = a2;
  NSClassFromString(&cfstr_Bsxpcserviceco.isa);
  if (!v4)
  {
    BOOL v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v23 = v11;
      __int16 v24 = 2114;
      id v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = v3;
      __int16 v28 = 2114;
      uint64_t v29 = @"BSXPCServiceConnection.m";
      __int16 v30 = 1024;
      int v31 = 143;
      __int16 v32 = 2114;
      int v33 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76AD38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSXPCServiceConnectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v23 = v15;
      __int16 v24 = 2114;
      id v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = v3;
      __int16 v28 = 2114;
      uint64_t v29 = @"BSXPCServiceConnection.m";
      __int16 v30 = 1024;
      int v31 = 143;
      __int16 v32 = 2114;
      int v33 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76AE38);
  }

  id v5 = *((id *)v4 + 22);
  if (([v5 isRoot] & 1) == 0)
  {
    uint64_t v18 = [NSString stringWithFormat:@"this connection (%@) is not a valid type for a parent connection", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithConnection_);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v23 = v19;
      __int16 v24 = 2114;
      id v25 = v21;
      __int16 v26 = 2048;
      uint64_t v27 = v3;
      __int16 v28 = 2114;
      uint64_t v29 = @"BSXPCServiceConnection.m";
      __int16 v30 = 1024;
      int v31 = 145;
      __int16 v32 = 2114;
      int v33 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76AF30);
  }
  uint64_t v6 = [BSXPCServiceConnection alloc];
  uint64_t v7 = -[BSXPCServiceConnectionRootContext uniqueChildContext]((atomic_ullong *)v5);
  id v8 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v6->super.isa, v7, *((void **)v4 + 21));

  os_unfair_lock_lock((os_unfair_lock_t)v4 + 4);
  -[BSXPCServiceConnection _lock_associateNewChildConnection:]((uint64_t)v4, (uint64_t)v8);
  os_unfair_lock_unlock((os_unfair_lock_t)v4 + 4);

  return v8;
}

- (id)_initWithContext:(void *)a3 assertionTarget:
{
  uint64_t v3 = a1;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      id v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"context"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithContext_assertionTarget_);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = (objc_class *)objc_opt_class();
        __int16 v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544642;
        id v23 = v18;
        __int16 v24 = 2114;
        id v25 = v20;
        __int16 v26 = 2048;
        uint64_t v27 = v3;
        __int16 v28 = 2114;
        uint64_t v29 = @"BSXPCServiceConnection.m";
        __int16 v30 = 1024;
        int v31 = 101;
        __int16 v32 = 2114;
        int v33 = v17;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76B26CLL);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSXPCServiceConnection;
    uint64_t v6 = (id *)objc_msgSendSuper2(&v21, sel_init);
    uint64_t v3 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 22, a2);
      uint64_t v7 = [a3 copy];
      id v8 = v3[21];
      v3[21] = (id)v7;

      id v9 = v3[22];
      if (v9) {
        BOOL v10 = (void *)v9[1];
      }
      else {
        BOOL v10 = 0;
      }
      objc_storeStrong(v3 + 1, v10);
      v3[2] = 0;
      *((_DWORD *)v3 + 6) = 0;
      id v11 = -[BSXPCServiceConnectionEventHandler initWithAssertionTarget:]([BSXPCServiceConnectionEventHandler alloc], v3[21]);
      id v12 = v3[18];
      v3[18] = v11;

      uint64_t v13 = BSServiceXPCLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = v3[1];
        id v15 = [v3[22] endpointDescription];
        *(_DWORD *)buf = 138543618;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_19C754000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Alloc %@", buf, 0x16u);
      }
    }
  }
  return v3;
}

+ (id)connectionWithEndpoint:(void *)a3 oneshot:(BOOL)a4 nonLaunching:(uint64_t)a5 targetPID:(void *)a6 description:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = self;
  if (!a2)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"endpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = (objc_class *)objc_opt_class();
      objc_super v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v31 = v19;
      __int16 v32 = 2114;
      int v33 = v21;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = @"BSXPCServiceConnection.m";
      __int16 v38 = 1024;
      int v39 = 130;
      __int16 v40 = 2114;
      uint64_t v41 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76BFDCLL);
  }
  id v12 = a6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v12)
  {
    __int16 v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      id v31 = v23;
      __int16 v32 = 2114;
      int v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = @"BSXPCServiceConnection.m";
      __int16 v38 = 1024;
      int v39 = 131;
      __int16 v40 = 2114;
      uint64_t v41 = v22;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76C0DCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_connectionWithEndpoint_oneshot_nonLaunching_targetPID_description_);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      id v31 = v27;
      __int16 v32 = 2114;
      int v33 = v29;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = @"BSXPCServiceConnection.m";
      __int16 v38 = 1024;
      int v39 = 131;
      __int16 v40 = 2114;
      uint64_t v41 = v26;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76C1DCLL);
  }

  if ((int)a5 < 1) {
    [getRBSTargetClass() targetWithEndpoint:a2];
  }
  else {
  uint64_t v13 = [getRBSTargetClass() targetWithPid:a5];
  }
  id v14 = [BSXPCServiceConnection alloc];
  id v15 = +[BSXPCServiceConnectionRootClientEndpointContext uniqueClientContextWithEndpoint:oneshot:nonLaunching:description:]((uint64_t)BSXPCServiceConnectionRootClientEndpointContext, a2, a3, a4, v12);
  uint64_t v16 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v14->super.isa, v15, v13);

  return v16;
}

+ (id)currentContext
{
  self;
  v0 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v1 = [v0 threadDictionary];
  uint64_t v2 = [v1 objectForKey:@"BSXPCCurrentContext"];

  return v2;
}

- (os_unfair_lock_s)initiatingContext
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v3 = *(void **)&v1[36]._os_unfair_lock_opaque;
    if (v3) {
      uint64_t v3 = (void *)v3[23];
    }
    uint64_t v1 = v3;
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)invalidate
{
}

- (void)_connection_consumeLock_handleError:(int)a3 notYetLocked:
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = (os_unfair_lock_s *)(a1 + 16);
    uint64_t v6 = (os_unfair_lock *)(a1 + 16);
    if (a3) {
      os_unfair_lock_lock(v6);
    }
    else {
      os_unfair_lock_assert_owner(v6);
    }
    if (!*(unsigned char *)(a1 + 160))
    {
      uint64_t v43 = [NSString stringWithFormat:@"we should never get here if we've never set up the connection queue"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connection_consumeLock_handleError_notYetLocked_);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        int v45 = (objc_class *)objc_opt_class();
        __int16 v46 = NSStringFromClass(v45);
        *(_DWORD *)buf = 138544642;
        id v60 = v44;
        __int16 v61 = 2114;
        id v62 = v46;
        __int16 v63 = 2048;
        uint64_t v64 = a1;
        __int16 v65 = 2114;
        BOOL v66 = @"BSXPCServiceConnection.m";
        __int16 v67 = 1024;
        int v68 = 1200;
        __int16 v69 = 2114;
        v70 = v43;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v43 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C770698);
    }
    [*(id *)(a1 + 56) assertBarrierOnQueue];
    if (*(unsigned char *)(a1 + 167))
    {
      os_unfair_lock_unlock(v5);
      uint64_t v7 = BSServiceXPCLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        id v60 = v8;
        _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring error received because the connection was invalidated", buf, 0xCu);
      }
LABEL_29:

      return;
    }
    if (*(unsigned char *)(a1 + 164))
    {
      id v9 = BSServiceXPCLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v25 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        id v60 = v25;
        _os_log_error_impl(&dword_19C754000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Invalidated by remote connection.", buf, 0xCu);
      }

      uint64_t v10 = BSServiceConnectionErrorCreate(2uLL, a2, @"Invalidated by an external connection");
      goto LABEL_13;
    }
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      if ([*(id *)(a1 + 176) isServer])
      {
        __int16 v22 = BSServiceXPCLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v39 = *(void **)(a1 + 8);
          *(_DWORD *)buf = 138543362;
          id v60 = v39;
          _os_log_error_impl(&dword_19C754000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted but that's not possible on a server.", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v23 = *(void *)(a1 + 144);
        if (v23 && (*(void *)(v23 + 104) || *(void *)(v23 + 88)))
        {
          __int16 v24 = BSServiceXPCLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            id v60 = v41;
            _os_log_error_impl(&dword_19C754000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted.", buf, 0xCu);
          }

          uint64_t v7 = BSServiceConnectionErrorCreate(1uLL, MEMORY[0x1E4F14520], 0);
          int v11 = 1;
          goto LABEL_14;
        }
        __int16 v22 = BSServiceXPCLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          xpc_connection_t v47 = *(void **)(a1 + 8);
          *(_DWORD *)buf = 138543362;
          id v60 = v47;
          _os_log_error_impl(&dword_19C754000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection interrupted but there's no handler for it so sending invalidate instead.", buf, 0xCu);
        }
      }
    }
    else
    {
      if (a2 != (void *)MEMORY[0x1E4F14528])
      {
        id v19 = (void *)MEMORY[0x1E4F14550];
        __int16 v20 = BSServiceXPCLog();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        if (a2 == v19)
        {
          if (v21)
          {
            uint64_t v42 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            id v60 = v42;
            _os_log_error_impl(&dword_19C754000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Termination imminent.", buf, 0xCu);
          }

          uint64_t v10 = BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E4F14550], 0);
          goto LABEL_13;
        }
        if (!v21) {
          goto LABEL_35;
        }
        v52 = v5;
        __int16 v26 = *(void **)(a1 + 8);
        id v27 = (const char *)*MEMORY[0x1E4F14530];
        id v28 = a2;
        if (!v27)
        {
          uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v49 = objc_msgSend(NSString, "stringWithUTF8String:", "xpc_object_t  _Nullable BSXPCDictionaryGetValue(xpc_object_t  _Nullable __strong, const char * _Nonnull, xpc_type_t _Nullable)");
          [v48 handleFailureInFunction:v49 file:@"BSXPCObjectUtilities.h" lineNumber:50 description:@"key must not be nil"];
        }
        id v29 = v28;
        __int16 v30 = v29;
        if (v29
          && (uint64_t v31 = MEMORY[0x19F399FF0](v29), v32 = MEMORY[0x1E4F14590],
                                              v30,
                                              v30,
                                              v31 == v32))
        {
          xpc_dictionary_get_value(v30, v27);
          id v33 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v34 = v33;
          if (v33)
          {
            uint64_t v35 = MEMORY[0x19F399FF0](v33);
            uint64_t v36 = MEMORY[0x1E4F145F0];

            if (v35 == v36) {
              uint64_t v37 = v34;
            }
            else {
              uint64_t v37 = 0;
            }
            goto LABEL_65;
          }
        }
        else
        {
          __int16 v34 = 0;
        }
        uint64_t v37 = 0;
LABEL_65:
        id v40 = v37;

        *(_DWORD *)buf = 138543618;
        id v60 = v26;
        __int16 v61 = 2112;
        id v62 = v40;
        _os_log_error_impl(&dword_19C754000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Unknown: %@.", buf, 0x16u);

        id v5 = v52;
LABEL_35:

        uint64_t v10 = BSServiceConnectionErrorCreate(2uLL, a2, 0);
LABEL_13:
        uint64_t v7 = v10;
        int v11 = 0;
LABEL_14:
        id v12 = *(id *)(a1 + 144);
        [*(id *)(a1 + 128) invalidate];
        uint64_t v13 = *(void **)(a1 + 128);
        *(void *)(a1 + 128) = 0;

        if (v11)
        {
          -[BSXPCServiceConnection _lock_disconnect](a1);
          id v50 = v12;
          v51 = v5;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v14 = *(id *)(a1 + 88);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v55;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v55 != v16) {
                  objc_enumerationMutation(v14);
                }
                id v18 = *(os_unfair_lock_s **)(*((void *)&v54 + 1) + 8 * i);
                os_unfair_lock_lock(v18 + 4);
                v53[0] = MEMORY[0x1E4F143A8];
                v53[1] = 3221225472;
                v53[2] = __75__BSXPCServiceConnection__connection_consumeLock_handleError_notYetLocked___block_invoke;
                v53[3] = &unk_1E58FC278;
                v53[4] = v18;
                -[BSXPCServiceConnection _lock_enqueueChildActivateEvent:forHandoff:]((uint64_t)v18, v53, 0);
                os_unfair_lock_unlock(v18 + 4);
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v58 count:16];
            }
            while (v15);
          }

          id v5 = v51;
          id v12 = v50;
        }
        else
        {
          -[BSXPCServiceConnection _lock_invalidate](a1);
        }
        os_unfair_lock_unlock(v5);
        -[BSXPCServiceConnectionEventHandler connection:handleError:](v12, (os_unfair_lock_s *)a1, v7);
        if (v11)
        {
          -[BSXPCServiceConnectionEventHandler connectionInterruptedFromXPCError:](v12, (os_unfair_lock_s *)a1);
        }
        else if (v12)
        {
          -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v12, (os_unfair_lock_s *)a1);
        }

        goto LABEL_29;
      }
      __int16 v22 = BSServiceXPCLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = *(void **)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        id v60 = v38;
        _os_log_error_impl(&dword_19C754000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Error received: Connection invalidated.", buf, 0xCu);
      }
    }

    uint64_t v10 = BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E4F14528], 0);
    goto LABEL_13;
  }
}

- (void)_clientInvalidateExplicitly:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (*(unsigned char *)(a1 + 165))
    {
      if (a2 && !*(unsigned char *)(a1 + 166))
      {
        id v5 = BSServiceXPCLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(a1 + 8);
          int v13 = 138543362;
          uint64_t v14 = v6;
          _os_log_impl(&dword_19C754000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Trailing client invalidation explicitly signaled.", (uint8_t *)&v13, 0xCu);
        }

        *(unsigned char *)(a1 + 166) = 1;
      }
    }
    else
    {
      uint64_t v7 = BSServiceXPCLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 8);
        int v13 = 138543618;
        uint64_t v14 = v8;
        __int16 v15 = 1024;
        int v16 = a2;
        _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Client invalidation signaled. (explicit=%{BOOL}i)", (uint8_t *)&v13, 0x12u);
      }

      *(unsigned char *)(a1 + 165) = 1;
      *(unsigned char *)(a1 + 166) = a2;
      -[BSXPCServiceConnection _lock_invalidate](a1);
      id v9 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;

      uint64_t v10 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;

      int v11 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = 0;

      id v12 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_lock_invalidate
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 167))
  {
    uint64_t v2 = BSServiceXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v3;
      _os_log_impl(&dword_19C754000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating.", buf, 0xCu);
    }

    *(unsigned char *)(a1 + 167) = 1;
    id v4 = *(void **)(a1 + 144);
    if (v4) {
      id v4 = (void *)v4[21];
    }
    id v5 = v4;
    unsigned int v6 = [v5 serviceClass];

    id v7 = *(id *)(a1 + 152);
    if (v7)
    {
      uint64_t v8 = dispatch_get_global_queue(v6, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__BSXPCServiceConnection__lock_invalidate__block_invoke;
      block[3] = &unk_1E58FC4E0;
      id v25 = v7;
      uint64_t v26 = a1;
      dispatch_async(v8, block);
    }
    if (*(void *)(a1 + 128))
    {
      id v9 = BSServiceXPCLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v10;
        _os_log_impl(&dword_19C754000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Sending invalidation message", buf, 0xCu);
      }

      [*(id *)(a1 + 128) send];
      int v11 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;
    }
    if ([*(id *)(a1 + 88) count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = *(id *)(a1 + 88);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(void *)(*((void *)&v20 + 1) + 8 * v15++), 0);
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
        }
        while (v13);
      }
    }
    -[BSXPCServiceConnection _lock_disconnect](a1);
    int v16 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = 0;

    uint64_t v17 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    if (*(unsigned char *)(a1 + 160))
    {
      id v18 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;

      id v19 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;
    }
  }
}

- (void)_lock_disconnect
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 161))
  {
    uint64_t v2 = BSServiceXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v3;
      _os_log_impl(&dword_19C754000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Disconnecting.", buf, 0xCu);
    }
  }
  id v4 = (_xpc_connection_s *)*(id *)(a1 + 80);
  id v5 = v4;
  if (v4)
  {
    xpc_connection_set_event_handler(v4, &__block_literal_global_183);
    xpc_connection_activate(v5);
    barrier[0] = MEMORY[0x1E4F143A8];
    barrier[1] = 3221225472;
    barrier[2] = __42__BSXPCServiceConnection__lock_disconnect__block_invoke_2;
    barrier[3] = &unk_1E58FC278;
    uint64_t v14 = v5;
    xpc_connection_send_barrier(v14, barrier);
    unsigned int v6 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;
  }
  -[BSXPCServiceConnectionEventHandler connectionDisconnected:](*(void *)(a1 + 144));
  id v7 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = 0;

  uint64_t v8 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = 0;

  *(unsigned char *)(a1 + 161) = 0;
  *(unsigned char *)(a1 + 163) = 0;
  if ([*(id *)(a1 + 176) isClient])
  {
    id v9 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
  [*(id *)(a1 + 112) invalidate];
  uint64_t v10 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = 0;

  int v11 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = 0;

  os_unfair_recursive_lock_lock_with_options();
  [*(id *)(a1 + 136) commitWithReason:@"disconnect"];
  id v12 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = 0;

  os_unfair_recursive_lock_unlock();
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = BSServiceXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    proem = self->_proem;
    id v5 = [(BSXPCServiceConnectionContext *)self->_context endpointDescription];
    *(_DWORD *)buf = 138543618;
    uint64_t v8 = proem;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Dealloc %@", buf, 0x16u);
  }
  BSClearTokenVar();
  v6.receiver = self;
  v6.super_class = (Class)BSXPCServiceConnection;
  [(BSXPCServiceConnection *)&v6 dealloc];
}

- (id)createMessageWithOptions:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(unsigned char *)(a1 + 160))
    {
      id v12 = [NSString stringWithFormat:@"can't create a message on %@ before calling activate the first time", *(void *)(a1 + 8)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_createMessageWithOptions_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v21 = v13;
        __int16 v22 = 2114;
        long long v23 = v15;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        id v27 = @"BSXPCServiceConnection.m";
        __int16 v28 = 1024;
        int v29 = 268;
        __int16 v30 = 2114;
        uint64_t v31 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C778514);
    }
    if (*(unsigned char *)(a1 + 162) && *(unsigned char *)(a1 + 161) && !(*(unsigned __int8 *)(a1 + 163) | a2 & 1))
    {
      uint64_t v16 = [NSString stringWithFormat:@"cannot create a message before handshake has finished"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_createMessageWithOptions_);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        *(_DWORD *)buf = 138544642;
        id v21 = v17;
        id v19 = v22 = 2114;
        long long v23 = v19;
        __int16 v24 = 2048;
        uint64_t v25 = a1;
        __int16 v26 = 2114;
        id v27 = @"BSXPCServiceConnection.m";
        __int16 v28 = 1024;
        int v29 = 271;
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C778608);
    }
    if (*(unsigned char *)(a1 + 167)) {
      id v5 = 0;
    }
    else {
      id v5 = *(void **)(a1 + 72);
    }
    objc_super v6 = +[BSXPCServiceConnectionMessage messageWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)BSXPCServiceConnectionMessage, v5, *(void **)(a1 + 48), *(void **)(a1 + 112), *(_DWORD *)(a1 + 28), (void *)a1);
    if ([*(id *)(a1 + 176) isChild])
    {
      uint64_t v7 = *(void *)(a1 + 176);
      if (v7) {
        uint64_t v8 = *(void *)(v7 + 32);
      }
      else {
        uint64_t v8 = 0;
      }
      -[BSXPCServiceConnectionMessage setChildIdentifier:](v6, v8);
      uint64_t v9 = *(void *)(a1 + 176);
      if (v9) {
        BOOL v10 = *(unsigned __int8 *)(v9 + 24) != 0;
      }
      else {
        BOOL v10 = 0;
      }
      -[BSXPCServiceConnectionMessage setChildIdentifierIsRemotelyDefined:](v6, (const char *)v10);
    }
    -[BSXPCServiceConnectionMessage setReplyQueue:]((uint64_t)v6, *(void **)(a1 + 56));
    os_unfair_lock_unlock(v4);
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

void __42__BSXPCServiceConnection__lock_disconnect__block_invoke_2(uint64_t a1)
{
  +[BSXPCServiceConnectionPeer invalidateConnection:]((uint64_t)BSXPCServiceConnectionPeer, *(void **)(a1 + 32));
  uint64_t v2 = *(_xpc_connection_s **)(a1 + 32);

  xpc_connection_cancel(v2);
}

- (BOOL)_asyncToConnectionQueueIfEverActivated:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(unsigned char *)(a1 + 160)) {
    id v5 = *(void **)(a1 + 56);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  os_unfair_lock_unlock(v4);
  BOOL v7 = v6 != 0;
  if (v6) {
    [v6 performAsync:a2];
  }

  return v7;
}

- (BSXPCServiceConnection)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BSXPCServiceConnection"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BSXPCServiceConnection.m";
    __int16 v17 = 1024;
    int v18 = 96;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  uint64_t result = (BSXPCServiceConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)nullConnection
{
  self;
  v0 = [BSXPCServiceConnection alloc];
  uint64_t v1 = +[BSXPCServiceConnectionNullContext nullContext]();
  uint64_t v2 = -[BSXPCServiceConnection _initWithContext:assertionTarget:]((id *)&v0->super.isa, v1, 0);

  return v2;
}

- (os_unfair_lock_s)hasChildren
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    uint64_t v1 = (os_unfair_lock_s *)([*(id *)&v1[22]._os_unfair_lock_opaque count] != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)sendBarrierBlock:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_sendBarrierBlock_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v10 = (objc_class *)objc_opt_class();
        __int16 v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v20 = v9;
        __int16 v21 = 2114;
        __int16 v22 = v11;
        __int16 v23 = 2048;
        uint64_t v24 = a1;
        __int16 v25 = 2114;
        __int16 v26 = @"BSXPCServiceConnection.m";
        __int16 v27 = 1024;
        int v28 = 288;
        __int16 v29 = 2114;
        __int16 v30 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C798ED0);
    }
    os_unfair_recursive_lock_lock_with_options();
    [*(id *)(a1 + 136) commitWithReason:@"send-barrier"];
    id v4 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(unsigned char *)(a1 + 160))
    {
      id v12 = [NSString stringWithFormat:@"can't use a sendBarrier on %@ before calling activate the first time", *(void *)(a1 + 8)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_sendBarrierBlock_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        id v20 = v13;
        __int16 v21 = 2114;
        __int16 v22 = v15;
        __int16 v23 = 2048;
        uint64_t v24 = a1;
        __int16 v25 = 2114;
        __int16 v26 = @"BSXPCServiceConnection.m";
        __int16 v27 = 1024;
        int v28 = 296;
        __int16 v29 = 2114;
        __int16 v30 = v12;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C798FD0);
    }
    id v5 = *(_xpc_connection_s **)(a1 + 72);
    if (v5)
    {
      xpc_connection_send_barrier(v5, a2);
    }
    else
    {
      id v6 = *(id *)(a1 + 56);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __43__BSXPCServiceConnection_sendBarrierBlock___block_invoke;
      v16[3] = &unk_1E58FCB28;
      id v17 = v6;
      int v18 = a2;
      id v7 = v6;
      [v7 performAsync:v16];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

uint64_t __43__BSXPCServiceConnection_sendBarrierBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) assertBarrierOnQueue];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

+ (void)_invalidateIncomingXPCConnection:(uint64_t)a1
{
  self;
  uint64_t v3 = +[BSXPCServiceConnection _invalidationMessageForXPCConnection:]((uint64_t)BSXPCServiceConnection, a2);
  xpc_connection_set_event_handler((xpc_connection_t)a2, &__block_literal_global_7);
  xpc_connection_activate((xpc_connection_t)a2);
  [v3 send];
  barrier[0] = MEMORY[0x1E4F143A8];
  barrier[1] = 3221225472;
  barrier[2] = __59__BSXPCServiceConnection__invalidateIncomingXPCConnection___block_invoke_2;
  barrier[3] = &unk_1E58FC278;
  void barrier[4] = a2;
  xpc_connection_send_barrier((xpc_connection_t)a2, barrier);
}

void __59__BSXPCServiceConnection__invalidateIncomingXPCConnection___block_invoke_2(uint64_t a1)
{
}

- (void)_parentDisconnectedWithInterrupt:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      if (([*(id *)(a1 + 176) isServer] & 1) == 0)
      {
        id v20 = [NSString stringWithFormat:@"parent interrupt is only supported on server connections"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__parentDisconnectedWithInterrupt_);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          __int16 v22 = (objc_class *)objc_opt_class();
          __int16 v23 = NSStringFromClass(v22);
          *(_DWORD *)buf = 138544642;
          id v33 = v21;
          __int16 v34 = 2114;
          uint64_t v35 = v23;
          __int16 v36 = 2048;
          uint64_t v37 = a1;
          __int16 v38 = 2114;
          int v39 = @"BSXPCServiceConnection.m";
          __int16 v40 = 1024;
          int v41 = 377;
          __int16 v42 = 2114;
          uint64_t v43 = v20;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v20 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C799574);
      }
      id v4 = BSServiceXPCLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        if (*(unsigned char *)(a1 + 167))
        {
LABEL_34:
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
          return;
        }
        *(unsigned char *)(a1 + 164) = 1;
        if (!*(void *)(a1 + 128) || ![*(id *)(a1 + 176) isRoot])
        {
LABEL_19:
          id v12 = *(void **)(a1 + 128);
          *(void *)(a1 + 128) = 0;

          if ([*(id *)(a1 + 88) count])
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v13 = *(id *)(a1 + 88);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v28 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  -[BSXPCServiceConnection _parentDisconnectedWithInterrupt:](*(void *)(*((void *)&v27 + 1) + 8 * i), a2);
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
              }
              while (v14);
            }
          }
          if (*(unsigned char *)(a1 + 160)) {
            id v17 = *(void **)(a1 + 144);
          }
          else {
            id v17 = 0;
          }
          id v18 = v17;
          -[BSXPCServiceConnection _lock_invalidate](a1);
          if (v18)
          {
            __int16 v19 = *(void **)(a1 + 56);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __59__BSXPCServiceConnection__parentDisconnectedWithInterrupt___block_invoke;
            v24[3] = &unk_1E58FC4E0;
            id v25 = v18;
            uint64_t v26 = a1;
            [v19 performAsync:v24];
          }
          goto LABEL_34;
        }
        if (a2)
        {
          -[BSXPCServiceConnectionMessage setMessageID:](*(void **)(a1 + 128), @"interrupt");
          uint64_t v8 = BSServiceXPCLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            id v33 = v9;
            id v10 = "%{public}@ Sending interruption message";
LABEL_17:
            _os_log_impl(&dword_19C754000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
          }
        }
        else
        {
          uint64_t v8 = BSServiceXPCLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v11 = *(void **)(a1 + 8);
            *(_DWORD *)buf = 138543362;
            id v33 = v11;
            id v10 = "%{public}@ Sending invalidation message";
            goto LABEL_17;
          }
        }

        [*(id *)(a1 + 128) send];
        goto LABEL_19;
      }
      id v5 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      id v33 = v5;
      id v6 = "%{public}@ Parent simulated interrupt";
    }
    else
    {
      id v4 = BSServiceXPCLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      id v7 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138543362;
      id v33 = v7;
      id v6 = "%{public}@ Parent invalidated";
    }
    _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    goto LABEL_9;
  }
}

void __59__BSXPCServiceConnection__parentDisconnectedWithInterrupt___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(os_unfair_lock_s **)(a1 + 40);
  id v4 = BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E4F14528], 0);
  -[BSXPCServiceConnectionEventHandler connection:handleError:](v2, v3, v4);

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = *(os_unfair_lock_s **)(a1 + 40);
    -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v5, v6);
  }
}

- (void)_makingInterruptCallout
{
  if (a1)
  {
    uint64_t v1 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    BSClearTokenVar();
    os_unfair_lock_unlock(v1);
  }
}

- (unsigned)_stateDump
{
  uint64_t v1 = (unsigned __int8 *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    [NSString stringWithFormat:@"<%@: p=<%@:%p> ch=%lu c=%i a=%i w=%i e=%i ri=%i ci=%i cie=%i i=%i>", *((void *)v1 + 22), objc_opt_class(), *((void *)v1 + 19), objc_msgSend(*((id *)v1 + 11), "count"), v1[160], v1[161], v1[162], v1[163], v1[164], v1[165], v1[166], v1[167]];
    uint64_t v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke(uint64_t a1)
{
}

void __55__BSXPCServiceConnection__lock_activateNowOrWhenReady___block_invoke_2_181(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(os_unfair_lock_s **)(a1 + 40);
  id v4 = BSServiceConnectionErrorCreate(2uLL, MEMORY[0x1E4F14528], 0);
  -[BSXPCServiceConnectionEventHandler connection:handleError:](v2, v3, v4);

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = *(os_unfair_lock_s **)(a1 + 40);
    -[BSXPCServiceConnectionEventHandler _connectionInvalidated:](v5, v6);
  }
}

uint64_t __75__BSXPCServiceConnection__connection_consumeLock_handleError_notYetLocked___block_invoke()
{
  return -[BSXPCServiceConnection _connection_consumeLock_handleError:notYetLocked:]();
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_peer = self->_lock_peer;
  if (lock_peer) {
    lock_peer = (BSXPCServiceConnectionPeer *)lock_peer->_processHandle;
  }
  id v5 = lock_peer;
  os_unfair_lock_unlock(p_lock);
  id v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  context = self->_context;
  if (context) {
    context = (BSXPCServiceConnectionContext *)context->_proem;
  }
  uint64_t v8 = NSString;
  id v9 = context;
  id v10 = [(BSXPCServiceConnectionContext *)self->_context endpointDescription];
  __int16 v11 = [v8 stringWithFormat:@"%@ (%@)", v9, v10];
  [v6 appendString:v11 withName:0];

  if (v5)
  {
    id v12 = NSString;
    id v9 = [(BSXPCServiceConnectionPeer *)v5 name];
    BOOL v13 = v9 == 0;
    uint64_t v14 = (__CFString *)v9;
    if (!v9)
    {
      uint64_t v15 = [(BSXPCServiceConnectionPeer *)v5 bundleIdentifier];
      id v10 = (void *)v15;
      if (v15) {
        uint64_t v14 = (__CFString *)v15;
      }
      else {
        uint64_t v14 = @"?";
      }
    }
    uint64_t v16 = [v12 stringWithFormat:@"%@:%d", v14, -[BSXPCServiceConnectionPeer pid](v5, "pid")];
  }
  else
  {
    BOOL v13 = 0;
    uint64_t v16 = @"TBD";
  }
  [v6 appendString:v16 withName:@"peer"];
  if (v5) {

  }
  if (v13) {
  if (v5)
  }

  id v17 = [v6 build];

  return (NSString *)v17;
}

@end