@interface BSXPCServiceConnectionPeer
+ (id)peerOfConnection:(uint64_t)a1;
+ (void)invalidateConnection:(uint64_t)a1;
- (BSXPCServiceConnectionPeer)init;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation BSXPCServiceConnectionPeer

+ (id)peerOfConnection:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    uint64_t v18 = v3;
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"connection"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_peerOfConnection_);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)v23 = 138544642;
      *(void *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v22;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 2114;
      v27 = @"BSXPCServiceConnectionPeer.m";
      __int16 v28 = 1024;
      int v29 = 57;
      __int16 v30 = 2114;
      v31 = v19;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v23, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7588ECLL);
  }
  uint64_t v4 = BSPIDForXPCConnection();
  if ((int)v4 < 1)
  {
    v8 = BSServiceXPCLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 138412290;
      *(void *)&v23[4] = v2;
      _os_log_error_impl(&dword_19C754000, v8, OS_LOG_TYPE_ERROR, "Unable to create a peer for a connection with no PID: %@", v23, 0xCu);
    }

    id v7 = 0;
  }
  else
  {
    v5 = [NSNumber numberWithInt:v4];
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
    v6 = [(id)qword_1EB27F7E8 objectForKey:v5];
    id v7 = v6;
    if (v6)
    {
      os_unfair_lock_lock(v6 + 2);
      [*((id *)v7 + 2) addObject:v2];
      ++*((void *)v7 + 3);
      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
    }
    else
    {
      v9 = [BSXPCServiceConnectionPeer alloc];
      id v10 = v2;
      if (v9)
      {
        *(void *)v23 = v9;
        *(void *)&v23[8] = BSXPCServiceConnectionPeer;
        id v7 = objc_msgSendSuper2((objc_super *)v23, sel_init);
        if (v7)
        {
          uint64_t v11 = [MEMORY[0x1E4F4F7F8] processHandleForXPCConnection:v10];
          v12 = (void *)*((void *)v7 + 4);
          *((void *)v7 + 4) = v11;

          *((_DWORD *)v7 + 2) = 0;
          uint64_t v13 = [MEMORY[0x1E4F1CA80] setWithObject:v10];
          v14 = (void *)*((void *)v7 + 2);
          *((void *)v7 + 2) = v13;
        }
      }
      else
      {
        id v7 = 0;
      }

      if (qword_1EB27F7E8)
      {
        [(id)qword_1EB27F7E8 setObject:v7 forKey:v5];
      }
      else
      {
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:v5];
        v16 = (void *)qword_1EB27F7E8;
        qword_1EB27F7E8 = v15;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);

  objc_storeStrong((id *)&self->_lock_connections, 0);
}

+ (void)invalidateConnection:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    uint64_t v3 = [NSNumber numberWithInt:BSPIDForXPCConnection()];
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
    uint64_t v4 = [(id)qword_1EB27F7E8 objectForKey:v3];
    v5 = v4;
    if (v4)
    {
      os_unfair_lock_lock(v4 + 2);
      if ([*(id *)&v5[4]._os_unfair_lock_opaque count])
      {
        [*(id *)&v5[4]._os_unfair_lock_opaque removeObject:v2];
        uint64_t v6 = *(void *)&v5[6]._os_unfair_lock_opaque;
        if (![*(id *)&v5[4]._os_unfair_lock_opaque count])
        {
          id v7 = dispatch_get_global_queue(17, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__BSXPCServiceConnectionPeer_invalidateConnection___block_invoke;
          block[3] = &unk_1E58FC470;
          v9 = v5;
          uint64_t v11 = v6;
          id v10 = v3;
          dispatch_async(v7, block);
        }
      }
      os_unfair_lock_unlock(v5 + 2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
  }
}

void __51__BSXPCServiceConnectionPeer_invalidateConnection___block_invoke(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  id v2 = (void *)a1[4];
  if (a1[6] == v2[3])
  {
    uint64_t v3 = [(id)qword_1EB27F7E8 objectForKey:a1[5]];

    if (v2 == v3) {
      [(id)qword_1EB27F7E8 removeObjectForKey:a1[5]];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
}

- (BSXPCServiceConnectionPeer)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on BSXPCServiceConnectionPeer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSXPCServiceConnectionPeer.m";
    __int16 v17 = 1024;
    int v18 = 36;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSXPCServiceConnectionPeer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  return (NSString *)[(BSXPCServiceConnectionPeer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(BSXPCServiceConnectionPeer *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSMutableSet *)self->_lock_connections count];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = [(BSProcessHandle *)self->_processHandle name];
  uint64_t v6 = [(BSProcessHandle *)self->_processHandle bundleIdentifier];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    id v8 = [NSString stringWithFormat:@"%@ (%@)", v5, v6];
  }
  else
  {
    if (v5) {
      int v9 = v5;
    }
    else {
      int v9 = (void *)v6;
    }
    id v8 = v9;
  }
  id v10 = v8;
  id v11 = (id)[v3 appendObject:v8 withName:0];
  id v12 = (id)objc_msgSend(v3, "appendInt:withName:", -[BSProcessHandle pid](self->_processHandle, "pid"), @"pid");
  id v13 = (id)[v3 appendUnsignedInteger:v4 withName:@"count"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(BSXPCServiceConnectionPeer *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(BSXPCServiceConnectionPeer *)self succinctDescriptionBuilder];

  return v3;
}

@end