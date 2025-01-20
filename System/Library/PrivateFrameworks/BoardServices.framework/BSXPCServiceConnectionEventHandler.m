@interface BSXPCServiceConnectionEventHandler
- (BSXPCServiceConnectionEventHandler)init;
- (id)remoteTargetWithHandshake:(void *)a3 assertionAttributes:;
- (uint64_t)encodeInitiatingContext:(uint64_t)result;
- (void)_connectionInvalidated:(void *)a1;
- (void)connection:(uint64_t)a3 handleConnection:;
- (void)connection:(uint64_t)a3 handleMessage:;
- (void)connection:(void *)a3 handleError:;
- (void)connectionActivated:(void *)a1;
- (void)connectionDisconnected:(uint64_t)a1;
- (void)connectionHandleNoMoreChildren:(void *)a1;
- (void)connectionInitialized:(int)a3 withActivationGeneration:(void *)a4 activeXPCConnection:(void *)a5 xpcConnectionTargetQueue:;
- (void)connectionInterruptedFromXPCError:(void *)a1;
- (void)initWithAssertionTarget:(void *)a1;
- (void)setContext:(uint64_t)a1;
- (void)setInitiatingContext:(uint64_t)a1;
- (void)setInterfaceTarget:(uint64_t)a1;
- (void)setTargetDispatchingQueue:(uint64_t)a1;
- (void)setTargetQueue:(uint64_t)a1;
@end

@implementation BSXPCServiceConnectionEventHandler

- (void)connection:(uint64_t)a3 handleMessage:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      v8 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleMessage_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v14 = v9;
        __int16 v15 = 2114;
        v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = a1;
        __int16 v19 = 2114;
        v20 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v21 = 1024;
        int v22 = 310;
        __int16 v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C759B88);
    }
    [v4 assertBarrierOnQueue];
    if (*(void *)(a1 + 136)) {
      v7 = *(os_unfair_lock_s **)(a1 + 136);
    }
    else {
      v7 = a2;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke;
    v12[3] = &unk_1E58FC2A0;
    v12[4] = a2;
    v12[5] = a3;
    v12[6] = a1;
    v12[7] = sel_connection_handleMessage_;
    BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
  }
}

- (void)setInitiatingContext:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

uint64_t __66__BSXPCServiceConnectionEventHandler_connection_handleConnection___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    v2 = BSServiceXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 40);
      int v14 = 138543362;
      id v15 = v12;
      _os_log_error_impl(&dword_19C754000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating incoming connection because there is no event handler", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) _isClientInvalidated])
  {
    v2 = BSServiceXPCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 40);
      int v14 = 138543362;
      id v15 = v13;
      _os_log_error_impl(&dword_19C754000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Invalidating incoming connection because the root has already been invalidated", (uint8_t *)&v14, 0xCu);
    }
LABEL_5:

    return [*(id *)(a1 + 48) invalidate];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
  v7 = BSServiceXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
    {
      id v8 = *(id *)(v5 + 176);
      id v9 = v8;
      if (v8)
      {
        v10 = (void *)*((void *)v8 + 1);
LABEL_13:
        id v11 = v10;
        int v14 = 138543362;
        id v15 = v11;
        _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleConnection:", (uint8_t *)&v14, 0xCu);

        goto LABEL_14;
      }
    }
    else
    {
      id v9 = 0;
    }
    v10 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v5, v4);
}

- (void)connection:(uint64_t)a3 handleConnection:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 160);
    if (!v4)
    {
      id v8 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleConnection_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = a1;
        __int16 v19 = 2114;
        v20 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v21 = 1024;
        int v22 = 278;
        __int16 v23 = 2114;
        v24 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C75A7B8);
    }
    [v4 assertBarrierOnQueue];
    if (*(void *)(a1 + 136)) {
      v7 = *(os_unfair_lock_s **)(a1 + 136);
    }
    else {
      v7 = a2;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__BSXPCServiceConnectionEventHandler_connection_handleConnection___block_invoke;
    v12[3] = &unk_1E58FC508;
    v12[4] = a1;
    v12[5] = a2;
    v12[6] = a3;
    BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
  }
}

uint64_t __58__BSXPCServiceConnectionEventHandler_connectionActivated___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 96);
  v3 = BSServiceXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      id v4 = *(id *)(v1 + 176);
      uint64_t v5 = v4;
      if (v4)
      {
        uint64_t v6 = (void *)*((void *)v4 + 1);
LABEL_5:
        id v7 = v6;
        int v9 = 138543362;
        id v10 = v7;
        _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionActivated:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

uint64_t __61__BSXPCServiceConnectionEventHandler_connection_handleError___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 88);
  id v4 = BSServiceXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      id v5 = *(id *)(v1 + 176);
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = (void *)*((void *)v5 + 1);
LABEL_5:
        id v8 = v7;
        int v10 = 138543362;
        id v11 = v8;
        _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleError:", (uint8_t *)&v10, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v1, v2);
}

uint64_t __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[22];
  }
  uint64_t v3 = v2;
  v54 = v3;
  if (![*(id *)(a1 + 32) _isClientInvalidated])
  {
    id v8 = -[BSXPCServiceConnectionMessage _subMessages](*(void **)(a1 + 40));
    v51 = v8;
    uint64_t v53 = [v8 count];
    if (v53)
    {
      int v9 = [*(id *)(a1 + 40) createReply];
      int v10 = (void *)MEMORY[0x1E4F4F6B8];
      uint64_t v11 = [v8 count];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_28;
      v66[3] = &unk_1E58FC498;
      id v12 = v9;
      id v67 = v12;
      id v68 = v54;
      id v4 = [v10 sentinelWithSignalCount:v11 signalHandler:v66];

      uint64_t v3 = v54;
    }
    else
    {
      id v4 = 0;
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    if (v51)
    {
      id v13 = v51;
    }
    else
    {
      uint64_t v77 = *(void *)(a1 + 40);
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    }
    id v14 = v13;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (!v15)
    {
LABEL_66:

      goto LABEL_67;
    }
    uint64_t v58 = *(void *)v63;
    v57 = v14;
LABEL_16:
    uint64_t v59 = v15;
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v63 != v58) {
        objc_enumerationMutation(v14);
      }
      __int16 v17 = *(void **)(*((void *)&v62 + 1) + 8 * v16);
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 80);
      if (!v18)
      {
        int v26 = [v3 isServer];
        v27 = *(void **)(*(void *)(a1 + 48) + 176);
        if (v26) {
          [v27 server];
        }
        else {
        v28 = [v27 client];
        }
        -[BSXPCServiceConnectionMessage selectorName](v17);
        v29 = (NSString *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          uint64_t v31 = [v28 methodForSelector:NSSelectorFromString(v29)];
          v32 = (void *)v31;
          if (*(void *)(*(void *)(a1 + 48) + 56) && v31)
          {
            v33 = (void *)MEMORY[0x19F3998C0]();
            if (v53)
            {
              v34 = BSServiceXPCBatchLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                if (v3) {
                  v46 = (void *)v3[1];
                }
                else {
                  v46 = 0;
                }
                id v47 = v46;
                *(_DWORD *)buf = 138412546;
                id v70 = v47;
                __int16 v71 = 2112;
                uint64_t v72 = (uint64_t)v30;
                _os_log_debug_impl(&dword_19C754000, v34, OS_LOG_TYPE_DEBUG, "%@ invoking batched method %@", buf, 0x16u);
              }
            }
            uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 56);
            v35 = *(void **)(a1 + 32);
            v60[0] = MEMORY[0x1E4F143A8];
            v60[1] = 3221225472;
            v60[2] = __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_31;
            v60[3] = &unk_1E58FC278;
            v61 = v4;
            +[BSXPCServiceConnectionProxy invokeMethod:onTarget:withMessage:forConnection:completion:]((uint64_t)BSXPCServiceConnectionProxy, v32, v55, v17, v35, (uint64_t)v60);

            uint64_t v3 = v54;
          }
          else
          {
            if (v31)
            {
              v37 = BSServiceXPCErrorsLog();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                if (v3) {
                  v38 = (void *)v3[1];
                }
                else {
                  v38 = 0;
                }
                id v39 = v38;
                v40 = [v28 name];
                *(_DWORD *)buf = 138543874;
                id v70 = v39;
                __int16 v71 = 2112;
                uint64_t v72 = (uint64_t)v30;
                __int16 v73 = 2112;
                id v74 = v40;
                _os_log_error_impl(&dword_19C754000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. No interfaceTarget for @selector(%@) in @protocol(%@).", buf, 0x20u);
              }
            }
            else
            {
              v41 = [v28 methods];
              v37 = objc_msgSend(v41, "bs_map:", &__block_literal_global_1);

              v42 = BSServiceXPCErrorsLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                if (v3) {
                  v48 = (void *)v3[1];
                }
                else {
                  v48 = 0;
                }
                id v56 = v48;
                id v49 = [v28 name];
                uint64_t v50 = [v37 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138544130;
                id v70 = v56;
                __int16 v71 = 2112;
                uint64_t v72 = (uint64_t)v30;
                __int16 v73 = 2112;
                id v74 = v49;
                __int16 v75 = 2112;
                v52 = (void *)v50;
                uint64_t v76 = v50;
                _os_log_error_impl(&dword_19C754000, v42, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. No method found for @selector(%@) in @protocol(%@)\n{\n%@\n}.", buf, 0x2Au);
              }
            }

            [v4 signal];
          }
        }
        else
        {
          v36 = BSServiceXPCErrorsLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            if (v3) {
              v43 = (void *)v3[1];
            }
            else {
              v43 = 0;
            }
            id v44 = v43;
            v45 = [v28 name];
            *(_DWORD *)buf = 138543618;
            id v70 = v44;
            __int16 v71 = 2112;
            uint64_t v72 = (uint64_t)v45;
            _os_log_error_impl(&dword_19C754000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Dropping message. Missing selectorName on incoming message in protocol(%@).", buf, 0x16u);
          }
          [v4 signal];
        }

        id v14 = v57;
        uint64_t v25 = v59;
        goto LABEL_48;
      }
      uint64_t v19 = *(void *)(a1 + 32);
      v20 = BSServiceXPCLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        break;
      }
LABEL_25:

      id v14 = v57;
      (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, v19, v17);
      uint64_t v25 = v59;
      [v4 signal];
LABEL_48:
      if (v25 == ++v16)
      {
        uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (!v15) {
          goto LABEL_66;
        }
        goto LABEL_16;
      }
    }
    if (v19)
    {
      id v21 = *(id *)(v19 + 176);
      int v22 = v21;
      if (v21)
      {
        __int16 v23 = (void *)*((void *)v21 + 1);
LABEL_24:
        id v24 = v23;
        *(_DWORD *)buf = 138543362;
        id v70 = v24;
        _os_log_impl(&dword_19C754000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connection:handleMessage:", buf, 0xCu);

        goto LABEL_25;
      }
    }
    else
    {
      int v22 = 0;
    }
    __int16 v23 = 0;
    goto LABEL_24;
  }
  id v4 = BSServiceXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (v3) {
      id v5 = (void *)v3[1];
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    NSStringFromSelector(*(SEL *)(a1 + 56));
    id v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v70 = v6;
    __int16 v71 = 2080;
    uint64_t v72 = [v7 UTF8String];
    _os_log_error_impl(&dword_19C754000, v4, OS_LOG_TYPE_ERROR, "%{public}@ BLOCKING %s BECAUSE THE CLIENT INVALIDATED THE CONNECTION", buf, 0x16u);
  }
LABEL_67:
}

- (void)setContext:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (void)setInterfaceTarget:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (id)remoteTargetWithHandshake:(void *)a3 assertionAttributes:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = [a3 count];
    uint64_t v7 = v6;
    if (a2 && !v6)
    {
      uint64_t v18 = [NSString stringWithFormat:@"handshake is only supported if there are launching attributes"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_remoteTargetWithHandshake_assertionAttributes_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138544642;
        id v23 = v19;
        __int16 v24 = 2114;
        uint64_t v25 = v21;
        __int16 v26 = 2048;
        uint64_t v27 = a1;
        __int16 v28 = 2114;
        v29 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v30 = 1024;
        int v31 = 202;
        __int16 v32 = 2114;
        v33 = v18;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C763148);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (v7 || (id v12 = *(id *)(a1 + 48)) == 0)
    {
      uint64_t v8 = *(void *)(a1 + 24);
      if (v8)
      {
        id v9 = *(id *)(v8 + 176);
        int v10 = [v9 isServer];
        uint64_t v11 = *(void **)(a1 + 176);
        if (v10) {
          [v11 client];
        }
        else {
        id v13 = [v11 server];
        }

        id v14 = [v13 methods];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          if (v7) {
            uint64_t v16 = a3;
          }
          else {
            uint64_t v16 = 0;
          }
          +[BSXPCServiceConnectionProxy proxyForConnection:handshake:withProtocol:activationGeneration:activeXPCConnection:xpcConnectionTargetQueue:replyQueue:target:attributes:assertionProvider:]((uint64_t)BSXPCServiceConnectionProxy, *(void **)(a1 + 24), a2, v13, *(_DWORD *)(a1 + 20), *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 160), *(void **)(a1 + 8), v16, 0);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          if (!v7) {
            objc_storeStrong((id *)(a1 + 48), v12);
          }
        }
        else
        {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (uint64_t)encodeInitiatingContext:(uint64_t)result
{
  if (result && a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 184);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F4F870]);
      uint64_t v6 = *(void **)(v3 + 184);
      *(void *)(v3 + 184) = v5;

      uint64_t v4 = *(void *)(v3 + 184);
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
    return v7(a2, v4);
  }
  return result;
}

- (void)setTargetQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)connectionInitialized:(int)a3 withActivationGeneration:(void *)a4 activeXPCConnection:(void *)a5 xpcConnectionTargetQueue:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(void *)(a1 + 160))
    {
      int v10 = [NSString stringWithFormat:@"_targetDispatchingQueue cannot be nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionInitialized_withActivationGeneration_activeXPCConnection_xpcConnectionTargetQueue_);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = (objc_class *)objc_opt_class();
        id v13 = NSStringFromClass(v12);
        int v14 = 138544642;
        id v15 = v11;
        __int16 v16 = 2114;
        __int16 v17 = v13;
        __int16 v18 = 2048;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        id v21 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v22 = 1024;
        int v23 = 256;
        __int16 v24 = 2114;
        uint64_t v25 = v10;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C767958);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    objc_storeStrong((id *)(a1 + 24), a2);
    *(_DWORD *)(a1 + 20) = a3;
    objc_storeStrong((id *)(a1 + 32), a4);
    objc_storeStrong((id *)(a1 + 40), a5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)setTargetDispatchingQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (void)connectionActivated:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = (void *)a1[20];
    if (!v3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionActivated_);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        int v14 = v9;
        __int16 v15 = 2048;
        __int16 v16 = a1;
        __int16 v17 = 2114;
        __int16 v18 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v19 = 1024;
        int v20 = 391;
        __int16 v21 = 2114;
        __int16 v22 = v6;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C768A68);
    }
    [v3 assertBarrierOnQueue];
    if (a1[12] && ([(os_unfair_lock_s *)a2 _isClientInvalidated] & 1) == 0)
    {
      if (a1[17]) {
        id v5 = (os_unfair_lock_s *)a1[17];
      }
      else {
        id v5 = a2;
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__BSXPCServiceConnectionEventHandler_connectionActivated___block_invoke;
      v10[3] = &unk_1E58FC4E0;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

- (void)initWithAssertionTarget:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)BSXPCServiceConnectionEventHandler;
  uint64_t v3 = objc_msgSendSuper2(&v9, sel_init);
  if (v3)
  {
    uint64_t v4 = [a2 copy];
    id v5 = (void *)v3[1];
    v3[1] = v4;

    *((_DWORD *)v3 + 4) = 0;
    uint64_t v6 = +[BSServiceQuality utility];
    id v7 = (void *)v3[21];
    v3[21] = v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingContext, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceQuality, 0);
  objc_storeStrong((id *)&self->_targetDispatchingQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_batchingHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_activationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_noMoreChildrenHandler, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_interfaceTarget, 0);
  objc_storeStrong((id *)&self->_lock_remoteTarget, 0);
  objc_storeStrong((id *)&self->_lock_xpcConnectionTargetQueue, 0);
  objc_storeStrong((id *)&self->_lock_activeXPCConnection, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);

  objc_storeStrong((id *)&self->_assertionTarget, 0);
}

void __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([a2 isComplete])
  {
    [*(id *)(a1 + 32) send];
    if ([a2 isFailed])
    {
      uint64_t v4 = BSServiceXPCBatchLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = *(void **)(a1 + 40);
        if (v5) {
          id v5 = (void *)v5[1];
        }
        uint64_t v6 = v5;
        int v7 = 138543362;
        uint64_t v8 = v6;
        _os_log_error_impl(&dword_19C754000, v4, OS_LOG_TYPE_ERROR, "%{public}@ One or more completions for a message batch were not called.", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __61__BSXPCServiceConnectionEventHandler__connectionInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 112);
  uint64_t v4 = BSServiceXPCLog();
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_6;
  }
  if (!v2)
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  id v5 = *(id *)(v2 + 176);
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_10:
    int v7 = 0;
    goto LABEL_5;
  }
  int v7 = (void *)*((void *)v5 + 1);
LABEL_5:
  id v8 = v7;
  int v10 = 138543362;
  id v11 = v8;
  _os_log_impl(&dword_19C754000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionInvalidated:", (uint8_t *)&v10, 0xCu);

LABEL_6:
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    -[BSXPCServiceConnection _clientInvalidateExplicitly:](v9, 0);
  }
}

- (void)connectionDisconnected:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    id v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    uint64_t v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void)connection:(void *)a3 handleError:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = (void *)a1[20];
    if (!v4)
    {
      id v8 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connection_handleError_);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        int v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v14 = v9;
        __int16 v15 = 2114;
        __int16 v16 = v11;
        __int16 v17 = 2048;
        __int16 v18 = a1;
        __int16 v19 = 2114;
        int v20 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v21 = 1024;
        int v22 = 376;
        __int16 v23 = 2114;
        __int16 v24 = v8;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C7715FCLL);
    }
    [v4 assertBarrierOnQueue];
    if (a1[11] && ([(os_unfair_lock_s *)a2 _isClientInvalidated] & 1) == 0)
    {
      if ([a3 isBSServiceConnectionError] && objc_msgSend(a3, "code") == 1) {
        -[BSXPCServiceConnection _makingInterruptCallout](a2);
      }
      if (a1[17]) {
        int v7 = (os_unfair_lock_s *)a1[17];
      }
      else {
        int v7 = a2;
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__BSXPCServiceConnectionEventHandler_connection_handleError___block_invoke;
      v12[3] = &unk_1E58FC508;
      v12[4] = a2;
      v12[5] = a3;
      v12[6] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v7, (uint64_t)v12);
    }
  }
}

- (void)_connectionInvalidated:(void *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = (void *)a1[20];
    if (!v3)
    {
      id v14 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__connectionInvalidated_);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        id v20 = v15;
        __int16 v21 = 2114;
        int v22 = v17;
        __int16 v23 = 2048;
        __int16 v24 = a1;
        __int16 v25 = 2114;
        uint64_t v26 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v27 = 1024;
        int v28 = 433;
        __int16 v29 = 2114;
        __int16 v30 = v14;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C771868);
    }
    [v3 assertBarrierOnQueue];
    if (a1[14] && ([(os_unfair_lock_s *)a2 _isClientInvalidated] & 1) == 0)
    {
      if (a1[17]) {
        id v5 = (os_unfair_lock_s *)a1[17];
      }
      else {
        id v5 = a2;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __61__BSXPCServiceConnectionEventHandler__connectionInvalidated___block_invoke;
      v18[3] = &unk_1E58FC4E0;
      v18[4] = a2;
      v18[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v18);
    }
    uint64_t v6 = (void *)a1[10];
    a1[10] = 0;

    int v7 = (void *)a1[8];
    a1[8] = 0;

    id v8 = (void *)a1[9];
    a1[9] = 0;

    id v9 = (void *)a1[11];
    a1[11] = 0;

    int v10 = (void *)a1[12];
    a1[12] = 0;

    id v11 = (void *)a1[13];
    a1[13] = 0;

    uint64_t v12 = (void *)a1[14];
    a1[14] = 0;

    __int16 v13 = (void *)a1[15];
    a1[15] = 0;
  }
}

- (void)connectionHandleNoMoreChildren:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = (void *)a1[20];
    if (!v3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionHandleNoMoreChildren_);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        id v14 = v9;
        __int16 v15 = 2048;
        __int16 v16 = a1;
        __int16 v17 = 2114;
        __int16 v18 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v19 = 1024;
        int v20 = 298;
        __int16 v21 = 2114;
        int v22 = v6;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C777094);
    }
    [v3 assertBarrierOnQueue];
    if (a1[9] && ([(os_unfair_lock_s *)a2 _isClientInvalidated] & 1) == 0)
    {
      if (a1[17]) {
        id v5 = (os_unfair_lock_s *)a1[17];
      }
      else {
        id v5 = a2;
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69__BSXPCServiceConnectionEventHandler_connectionHandleNoMoreChildren___block_invoke;
      v10[3] = &unk_1E58FC4E0;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

uint64_t __69__BSXPCServiceConnectionEventHandler_connectionHandleNoMoreChildren___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 72);
  uint64_t v3 = BSServiceXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      id v4 = *(id *)(v1 + 176);
      id v5 = v4;
      if (v4)
      {
        uint64_t v6 = (void *)*((void *)v4 + 1);
LABEL_5:
        id v7 = v6;
        int v9 = 138543362;
        id v10 = v7;
        _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionHandleNoMoreChildren:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

- (BSXPCServiceConnectionEventHandler)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BSXPCServiceConnectionEventHandler"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BSXPCServiceConnectionEventHandler.m";
    __int16 v17 = 1024;
    int v18 = 109;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSXPCServiceConnectionEventHandler *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id __63__BSXPCServiceConnectionEventHandler_connection_handleMessage___block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v3 = NSStringFromSelector((SEL)[a2 selector]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [a2 name];
    id v5 = [@"name:" stringByAppendingString:v6];
  }

  return v5;
}

- (void)connectionInterruptedFromXPCError:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = (void *)a1[20];
    if (!v3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"targetDispatchingQueue must be set"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_connectionInterruptedFromXPCError_);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        id v14 = v9;
        __int16 v15 = 2048;
        __int16 v16 = a1;
        __int16 v17 = 2114;
        int v18 = @"BSXPCServiceConnectionEventHandler.m";
        __int16 v19 = 1024;
        int v20 = 403;
        __int16 v21 = 2114;
        int v22 = v6;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78407CLL);
    }
    [v3 assertBarrierOnQueue];
    if (a1[13] && ([(os_unfair_lock_s *)a2 _isClientInvalidated] & 1) == 0)
    {
      -[BSXPCServiceConnection _makingInterruptCallout](a2);
      if (a1[17]) {
        id v5 = (os_unfair_lock_s *)a1[17];
      }
      else {
        id v5 = a2;
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __72__BSXPCServiceConnectionEventHandler_connectionInterruptedFromXPCError___block_invoke;
      v10[3] = &unk_1E58FC4E0;
      v10[4] = a2;
      v10[5] = a1;
      BSXPCServiceConnectionExecuteCallOut(a2, v5, (uint64_t)v10);
    }
  }
}

uint64_t __72__BSXPCServiceConnectionEventHandler_connectionInterruptedFromXPCError___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 104);
  uint64_t v3 = BSServiceXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (v1)
    {
      id v4 = *(id *)(v1 + 176);
      id v5 = v4;
      if (v4)
      {
        uint64_t v6 = (void *)*((void *)v4 + 1);
LABEL_5:
        id v7 = v6;
        int v9 = 138543362;
        id v10 = v7;
        _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ [callout] connectionInterrupted:", (uint8_t *)&v9, 0xCu);

        goto LABEL_6;
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v6 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);
}

@end