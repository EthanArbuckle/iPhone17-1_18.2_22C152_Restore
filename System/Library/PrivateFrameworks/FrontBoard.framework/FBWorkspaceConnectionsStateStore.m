@interface FBWorkspaceConnectionsStateStore
+ (BOOL)_storeState:(id)a3 toPath:(id)a4 withGeneration:(BOOL)a5 injectedFailure:(int64_t *)a6;
+ (id)_loadStateFromPath:(id)a3 outGeneration:(BOOL *)a4 outExisted:(BOOL *)a5;
+ (void)_unlinkAllForIdentifier:(id)a3;
+ (void)_unlinkShmPath:(id)a3 graceful:(BOOL)a4;
- (FBWorkspaceConnectionsState)state;
- (FBWorkspaceConnectionsStateStore)init;
- (id)_initWithIdentifier:(id)a3;
- (int64_t)_lastUsedBuffer;
- (void)_setFailureModeForNextWrite:(int64_t)a3;
- (void)setState:(id)a3;
@end

@implementation FBWorkspaceConnectionsStateStore

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*v1 + 32), *v2);
    uint64_t v3 = *(void *)(*v1 + 40);
    if (v3 <= 0) { {
      uint64_t v4 = -(-v3 & 3);
    }
    }
    else {
      uint64_t v4 = *(void *)(*v1 + 40) & 3;
    }
    v5 = objc_opt_class();
    uint64_t v6 = 8;
    if (((v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0) { {
      uint64_t v6 = 16;
    }
    }
    if ([v5 _storeState:*v2 toPath:*(void *)(*v1 + v6) withGeneration:(v4 & 0xFFFFFFFFFFFFFFFELL) == 2 injectedFailure:*v1 + 48])
    {
      uint64_t v7 = v4 + 1;
      v8 = FBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) { {
        __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_2();
      }
      }

      *(void *)(*v1 + 40) = v7;
      if (*(void *)(*v1 + 48) == 1)
      {
        *(void *)(*v1 + 48) = 0;
        v9 = FBLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) { {
          __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_1();
        }
        }
      }
      else if (v3)
      {
        v11 = objc_opt_class();
        uint64_t v12 = 8;
        if (((v3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0) { {
          uint64_t v12 = 16;
        }
        }
        [v11 _unlinkShmPath:*(void *)(*v1 + v12) graceful:0];
      }
    }
    else if (v3)
    {
      v10 = FBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) { {
        __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_3(v10);
      }
      }
    }
    else
    {
      uint64_t v13 = *v1;
      if (*(void *)(*v1 + 8) || *(void *)(v13 + 16))
      {
        if (*(unsigned char *)(v13 + 56))
        {
          os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        }
        else
        {
          *(unsigned char *)(v13 + 56) = 1;
          os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        }
        v15 = FBLogCommon();
        if (os_log_type_enabled(v15, v14))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1A62FC000, v15, v14, "failed to write new workspace connections state to shm - are we sandboxed?", v16, 2u);
        }
      }
    }
  }
}

+ (void)_unlinkShmPath:(id)a3 graceful:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:]();
    }
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630A8E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:]();
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630A944);
  }

  *__error() = 0;
  id v6 = v5;
  if (shm_unlink((const char *)[v6 UTF8String]) && !a4)
  {
    uint64_t v7 = __error();
    strerror_r(*v7, __strerrbuf, 0x100uLL);
    v8 = FBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _unlinkShmPath:graceful:]();
    }
    }
  }
}

+ (BOOL)_storeState:(id)a3 toPath:(id)a4 withGeneration:(BOOL)a5 injectedFailure:(int64_t *)a6
{
  BOOL v7 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  NSClassFromString(&cfstr_Fbworkspacecon_3.isa);
  if (!v12)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]();
    }
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630AFD0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]2();
    }
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630B034);
  }

  id v13 = v11;
  if (!v13)
  {
    if (a6)
    {
LABEL_19:
      BOOL v22 = 0;
      goto LABEL_42;
    }
LABEL_13:
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"failure"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]();
    }
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630AAE4);
  }
  NSClassFromString(&cfstr_Nsstring.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]1();
    }
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630B098);
  }

  if (!a6) { {
    goto LABEL_13;
  }
  }
  *__error() = 0;
  id v14 = v13;
  int v15 = shm_open((const char *)[v14 UTF8String], 2562, 384);
  if (v15 < 0)
  {
    v20 = __error();
    strerror_r(*v20, __strerrbuf, 0x100uLL);
    v21 = FBLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]0();
    }
    }

    goto LABEL_19;
  }
  int v16 = v15;
  unint64_t v17 = [v12 serializedDataLength];
  if (v17 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v44 = [NSString stringWithFormat:@"shmLength out of range"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:]();
    }
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A630B0F0);
  }
  if (*a6 != 2)
  {
    unint64_t v23 = v17;
    size_t v24 = v17 + 1;
    *__error() = 0;
    if (ftruncate(v16, v24))
    {
      v25 = __error();
      strerror_r(*v25, __strerrbuf, 0x100uLL);
      v26 = FBLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) { {
        +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.9();
      }
      }
    }
    else
    {
      if (*a6 == 3)
      {
        *a6 = 0;
        v18 = FBLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) { {
          +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.6();
        }
        }
        goto LABEL_11;
      }
      *__error() = 0;
      v27 = (char *)mmap(0, v24, 2, 1, v16, 0);
      if (v27 != (char *)-1)
      {
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x2020000000;
        v48[3] = 0;
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __86__FBWorkspaceConnectionsStateStore__storeState_toPath_withGeneration_injectedFailure___block_invoke;
        v47[3] = &unk_1E5C4BC48;
        v47[4] = v48;
        v47[5] = v23;
        v46 = v27;
        v47[6] = v27;
        v47[7] = 1;
        uint64_t v28 = [v12 serializeToWriter:v47];
        if (v28 == v23)
        {
          if (*a6 == 4)
          {
            *a6 = 0;
            v29 = FBLogCommon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) { {
              +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.8();
            }
            }

            BOOL v22 = 0;
          }
          else
          {
            if (v7) { {
              char v35 = 3;
            }
            }
            else {
              char v35 = 1;
            }
            char *v46 = v35;
            *__error() = 0;
            if (msync(v46, v24, 16) == -1)
            {
              v36 = __error();
              strerror_r(*v36, __strerrbuf, 0x100uLL);
              v37 = FBLogCommon();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                int v45 = *__error();
                *(_DWORD *)buf = 138412802;
                id v50 = v14;
                __int16 v51 = 1024;
                int v52 = v45;
                __int16 v53 = 2080;
                v54 = __strerrbuf;
                _os_log_error_impl(&dword_1A62FC000, v37, OS_LOG_TYPE_ERROR, "failed to msync %@ : errno=%i (%s)", buf, 0x1Cu);
              }
            }
            BOOL v22 = 1;
          }
        }
        else
        {
          v34 = FBLogCommon();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__strerrbuf = 138412802;
            id v56 = v14;
            __int16 v57 = 2048;
            uint64_t v58 = v28;
            __int16 v59 = 2048;
            unint64_t v60 = v23;
            _os_log_error_impl(&dword_1A62FC000, v34, OS_LOG_TYPE_ERROR, "data length inconsistent in %@ - unlinking : actual=%zi expected=%zu", (uint8_t *)__strerrbuf, 0x20u);
          }

          [a1 _unlinkShmPath:v14 graceful:0];
          BOOL v22 = 0;
        }
        *__error() = 0;
        if (munmap(v46, v24) == -1)
        {
          v38 = __error();
          strerror_r(*v38, __strerrbuf, 0x100uLL);
          v39 = FBLogCommon();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            int v40 = *__error();
            *(_DWORD *)buf = 138412802;
            id v50 = v14;
            __int16 v51 = 1024;
            int v52 = v40;
            __int16 v53 = 2080;
            v54 = __strerrbuf;
            _os_log_error_impl(&dword_1A62FC000, v39, OS_LOG_TYPE_ERROR, "failed to munmap %@ - unlinking : errno=%i (%s)", buf, 0x1Cu);
          }

          [a1 _unlinkShmPath:v14 graceful:0];
        }
        _Block_object_dispose(v48, 8);
        goto LABEL_38;
      }
      v30 = __error();
      strerror_r(*v30, __strerrbuf, 0x100uLL);
      v26 = FBLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) { {
        +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.7();
      }
      }
    }

    [a1 _unlinkShmPath:v14 graceful:0];
    goto LABEL_37;
  }
  *a6 = 0;
  v18 = FBLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) { {
    +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.5();
  }
  }
LABEL_11:

LABEL_37:
  BOOL v22 = 0;
LABEL_38:
  *__error() = 0;
  if (close(v16))
  {
    v31 = __error();
    strerror_r(*v31, __strerrbuf, 0x100uLL);
    v32 = FBLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _storeState:toPath:withGeneration:injectedFailure:].cold.4();
    }
    }
  }
LABEL_42:

  return v22;
}

uint64_t __86__FBWorkspaceConnectionsStateStore__storeState_toPath_withGeneration_injectedFailure___block_invoke(void *a1, const void *a2, size_t a3)
{
  unint64_t v3 = a1[5];
  size_t v4 = v3 - a3;
  if (v3 >= a3 && (size_t v6 = *(void *)(*(void *)(a1[4] + 8) + 24), v6 <= v4))
  {
    size_t v7 = a3;
    memcpy((void *)(a1[6] + a1[7] + v6), a2, a3);
    *(void *)(*(void *)(a1[4] + 8) + 24) += v7;
  }
  else
  {
    *__error() = 14;
    return -1;
  }
  return v7;
}

- (void)setState:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Fbworkspacecon_3.isa);
  if (!v4)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceConnectionsStateStore setState:]();
    }
    }
LABEL_9:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6315E9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceConnectionsStateClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceConnectionsStateStore setState:]();
    }
    }
    goto LABEL_9;
  }

  id v5 = (void *)[v4 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FBWorkspaceConnectionsStateStore_setState___block_invoke;
  block[3] = &unk_1E5C497A0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (FBWorkspaceConnectionsStateStore)init
{
  id v4 = [NSString stringWithFormat:@"init is not allowed on FBWorkspaceConnectionsStateStore"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    size_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    int v16 = @"FBWorkspaceConnectionsStateStore.m";
    __int16 v17 = 1024;
    int v18 = 73;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBWorkspaceConnectionsStateStore *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4 && (NSClassFromString(&cfstr_Nsstring.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceConnectionsStateStore _initWithIdentifier:]();
    }
    }
    [v18 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v22.receiver = self;
    v22.super_class = (Class)FBWorkspaceConnectionsStateStore;
    id v5 = [(FBWorkspaceConnectionsStateStore *)&v22 init];
    if (v5)
    {
      if (v4)
      {
        id v6 = v4;
        if ((unint64_t)[v6 length] < 0x1A)
        {
          id v7 = v6;
        }
        else
        {
          id v7 = [v6 substringToIndex:25];
        }
        id v4 = v7;

        uint64_t v8 = _pathForIdentifierAndBuffer(v4, 0);
        path1 = v5->_path1;
        v5->_path1 = (NSString *)v8;

        uint64_t v10 = _pathForIdentifierAndBuffer(v4, 1);
        path2 = v5->_path2;
        v5->_path2 = (NSString *)v10;
      }
      id v12 = [MEMORY[0x1E4F62820] serial];
      __int16 v13 = [v12 serviceClass:25];
      uint64_t v14 = BSDispatchQueueCreate();
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v14;

      v5->_queue_nextWriteFailure = 0;
      int v16 = v5->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke;
      block[3] = &unk_1E5C497A0;
      v20 = v5;
      id v4 = v4;
      id v21 = v4;
      dispatch_async(v16, block);
    }
    return v5;
  }
  return result;
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke(uint64_t a1)
{
  __int16 v24 = 0;
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [(id)objc_opt_class() _loadStateFromPath:*(void *)(*(void *)(a1 + 32) + 8) outGeneration:(char *)&v24 + 1 outExisted:&v24];
  __int16 v23 = 0;
  uint64_t v3 = [(id)objc_opt_class() _loadStateFromPath:*(void *)(*(void *)v1 + 16) outGeneration:(char *)&v23 + 1 outExisted:&v23];
  id v4 = (void *)v3;
  if (v2 | v3)
  {
    if (v2) { {
      BOOL v5 = v3 == 0;
    }
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (!v3)
      {
LABEL_21:
        int v16 = FBLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl(&dword_1A62FC000, v16, OS_LOG_TYPE_INFO, "restored previous workspace connections state (1)", v21, 2u);
        }

        objc_storeStrong((id *)(*(void *)v1 + 32), (id)v2);
        uint64_t v7 = 3;
        if (!HIBYTE(v24)) { {
          uint64_t v7 = 1;
        }
        }
LABEL_25:
        *(void *)(*(void *)v1 + 40) = v7;
        __int16 v17 = FBLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) { {
          __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_1();
        }
        }

        goto LABEL_31;
      }
    }
    else
    {
      int v11 = HIBYTE(v24);
      int v12 = HIBYTE(v23);
      __int16 v13 = objc_opt_class();
      uint64_t v14 = 16;
      if (v11 == v12) { {
        uint64_t v14 = 8;
      }
      }
      [v13 _unlinkShmPath:*(void *)(*(void *)v1 + v14) graceful:0];
      __int16 v15 = FBLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) { {
        __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_2(v11 == v12, v15);
      }
      }

      if (v11 != v12) { {
        goto LABEL_21;
      }
      }
    }
    id v6 = FBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A62FC000, v6, OS_LOG_TYPE_INFO, "restored previous workspace connections state (2)", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)v1 + 32), v4);
    uint64_t v7 = 4;
    if (!HIBYTE(v23)) { {
      uint64_t v7 = 2;
    }
    }
    goto LABEL_25;
  }
  int v8 = v24 | v23;
  int v9 = FBLogCommon();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) { {
      __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_3();
    }
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1A62FC000, v10, OS_LOG_TYPE_DEFAULT, "no previous workspace connections state - initializing", v20, 2u);
  }

  uint64_t v18 = objc_opt_new();
  __int16 v19 = *(void **)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 32) = v18;

  *(void *)(*(void *)v1 + 40) = 0;
LABEL_31:
}

- (FBWorkspaceConnectionsState)state
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__8;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__FBWorkspaceConnectionsStateStore_state__block_invoke;
  v5[3] = &unk_1E5C4A3D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (FBWorkspaceConnectionsState *)v3;
}

void __41__FBWorkspaceConnectionsStateStore_state__block_invoke(uint64_t a1)
{
}

- (int64_t)_lastUsedBuffer
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__FBWorkspaceConnectionsStateStore__lastUsedBuffer__block_invoke;
  v5[3] = &unk_1E5C4A3D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__FBWorkspaceConnectionsStateStore__lastUsedBuffer__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)_setFailureModeForNextWrite:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__FBWorkspaceConnectionsStateStore__setFailureModeForNextWrite___block_invoke;
  v4[3] = &unk_1E5C4BBF8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async_and_wait(queue, v4);
}

uint64_t __64__FBWorkspaceConnectionsStateStore__setFailureModeForNextWrite___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

+ (void)_unlinkAllForIdentifier:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _unlinkAllForIdentifier:]();
    }
    }
LABEL_14:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A636886CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _unlinkAllForIdentifier:]();
    }
    }
    goto LABEL_14;
  }

  id v5 = v4;
  if ((unint64_t)[v5 length] < 0x1A)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 substringToIndex:25];
  }
  id v10 = v6;

  uint64_t v7 = _pathForIdentifierAndBuffer(v10, 0);
  [a1 _unlinkShmPath:v7 graceful:1];

  uint64_t v8 = _pathForIdentifierAndBuffer(v10, 1);
  [a1 _unlinkShmPath:v8 graceful:1];
}

+ (id)_loadStateFromPath:(id)a3 outGeneration:(BOOL *)a4 outExisted:(BOOL *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:]0();
      }
      }
      [v31 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6368F10);
    }
  }

  if (!a4)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"outGenerationTwiddle"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:]();
    }
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6368E48);
  }
  if (!a5)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"outExisted"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:]();
    }
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6368EACLL);
  }
  if (!v8)
  {
LABEL_27:
    uint64_t v18 = 0;
    *a5 = 0;
    goto LABEL_28;
  }
  *__error() = 0;
  id v9 = v8;
  int v10 = shm_open((const char *)[v9 UTF8String], 0);
  if (v10 < 0)
  {
    if (*__error() == 2)
    {
      uint64_t v18 = 0;
      goto LABEL_28;
    }
    objc_super v22 = __error();
    strerror_r(*v22, __strerrbuf, 0x100uLL);
    __int16 v23 = FBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.9();
    }
    }

    goto LABEL_27;
  }
  int v11 = v10;
  *a5 = 1;
  unint64_t v12 = +[FBWorkspaceConnectionsState minimumSerializedDataLength];
  if (v12 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = [NSString stringWithFormat:@"shmLength cannot exceed SSIZE_MAX"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:]();
    }
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6368F68);
  }
  unint64_t v13 = v12;
  memset(&v39, 0, sizeof(v39));
  if (fstat(v11, &v39) || v39.st_size <= v13)
  {
    __int16 v19 = FBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.8();
    }
    }
  }
  else
  {
    *__error() = 0;
    uint64_t v14 = (char *)mmap(0, v39.st_size, 1, 1, v11, 0);
    __int16 v15 = v14;
    if (v14 != (char *)-1)
    {
      char v16 = *v14;
      if (*v14)
      {
        v37[3] = 0;
        unint64_t v38 = -1;
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x2020000000;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        stat v34 = v39;
        v33[2] = __80__FBWorkspaceConnectionsStateStore__loadStateFromPath_outGeneration_outExisted___block_invoke;
        v33[3] = &unk_1E5C4BC20;
        v33[4] = v37;
        uint64_t v35 = 1;
        v36 = v14;
        uint64_t v18 = +[FBWorkspaceConnectionsState deserializeLength:&v38 fromReader:v33];
        if (v18 && v38 >= v13 && v38 <= 0x7FFFFFFFFFFFFFFDLL)
        {
          *a4 = (v16 & 2) != 0;
        }
        else
        {
          v26 = FBLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__strerrbuf = 138413058;
            id v41 = v9;
            __int16 v42 = 2048;
            unint64_t v43 = v13;
            __int16 v44 = 2048;
            unint64_t v45 = v38;
            __int16 v46 = 2048;
            off_t v47 = v39.st_size - 1;
            _os_log_error_impl(&dword_1A62FC000, v26, OS_LOG_TYPE_ERROR, "data length inconsistent in %@ - unlinking : min=%zu actual=%zu expected=%llu", (uint8_t *)__strerrbuf, 0x2Au);
          }

          [a1 _unlinkShmPath:v9 graceful:0];
          uint64_t v18 = 0;
        }
        _Block_object_dispose(v37, 8);
      }
      else
      {
        __int16 v17 = FBLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) { {
          +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.7();
        }
        }

        [a1 _unlinkShmPath:v9 graceful:0];
        uint64_t v18 = 0;
      }
      *__error() = 0;
      if (munmap(v15, v39.st_size) == -1)
      {
        v27 = __error();
        strerror_r(*v27, __strerrbuf, 0x100uLL);
        uint64_t v28 = FBLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) { {
          +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.6();
        }
        }

        [a1 _unlinkShmPath:v9 graceful:0];
      }
      goto LABEL_18;
    }
    v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    __int16 v19 = FBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.5();
    }
    }
  }

  [a1 _unlinkShmPath:v9 graceful:0];
  uint64_t v18 = 0;
LABEL_18:
  *__error() = 0;
  if (close(v11))
  {
    v20 = __error();
    strerror_r(*v20, __strerrbuf, 0x100uLL);
    id v21 = FBLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsStateStore _loadStateFromPath:outGeneration:outExisted:].cold.4();
    }
    }
  }
LABEL_28:

  return v18;
}

size_t __80__FBWorkspaceConnectionsStateStore__loadStateFromPath_outGeneration_outExisted___block_invoke(void *a1, void *__dst, size_t a3)
{
  uint64_t v3 = a1[23];
  size_t v4 = a1[17] - v3;
  BOOL v5 = v4 >= a3;
  size_t v6 = v4 - a3;
  if (v5 && (size_t v8 = *(void *)(*(void *)(a1[4] + 8) + 24), v8 <= v6))
  {
    size_t v9 = a3;
    memcpy(__dst, (const void *)(a1[24] + v3 + v8), a3);
    *(void *)(*(void *)(a1[4] + 8) + 24) += v9;
  }
  else
  {
    *__error() = 14;
    return -1;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path1, 0);
}

- (void)_initWithIdentifier:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  _os_log_debug_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_DEBUG, "previous workspace connections = %@", v1, 0xCu);
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_2(char a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a1) { {
    int v2 = 2;
  }
  }
  else {
    int v2 = 1;
  }
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "previous workspace connections state wasn't clean - resolving latest (%i)", (uint8_t *)v3, 8u);
}

void __56__FBWorkspaceConnectionsStateStore__initWithIdentifier___block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  _os_log_fault_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_FAULT, "all previous workspace connections states are bad : %@", v1, 0xCu);
}

- (void)setState:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  _os_log_error_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_ERROR, "simulating failure to purge old buffer : %@", v1, 0xCu);
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14_0();
  _os_log_debug_impl(&dword_1A62FC000, v0, OS_LOG_TYPE_DEBUG, "stored new workspace connections = %@", v1, 0xCu);
}

void __45__FBWorkspaceConnectionsStateStore_setState___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_fault_impl(&dword_1A62FC000, log, OS_LOG_TYPE_FAULT, "workspace connections state desynced with shm", v1, 2u);
}

+ (void)_unlinkAllForIdentifier:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.4()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to close read of %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.5()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to mmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.6()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to munmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.7()
{
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.8()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A62FC000, v1, OS_LOG_TYPE_ERROR, "invalid size of %@ - unlinking : size=%lli", v2, 0x16u);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.9()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to read %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_loadStateFromPath:outGeneration:outExisted:.cold.10()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_unlinkShmPath:graceful:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_unlinkShmPath:graceful:.cold.2()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to unlink %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.4()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to close write of %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.5()
{
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.6()
{
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.7()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to mmap %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.8()
{
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.9()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to set the size of %@ - unlinking : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.10()
{
  OUTLINED_FUNCTION_5_1(&dword_1A62FC000, v0, v1, "failed to create %@ : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.11()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_storeState:toPath:withGeneration:injectedFailure:.cold.12()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end