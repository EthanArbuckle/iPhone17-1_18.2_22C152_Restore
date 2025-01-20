@interface CATransaction
+ (BOOL)BOOLValueForKey:(unsigned int)a3;
+ (BOOL)addCommitHandler:(id)a3 forPhase:(int)a4;
+ (BOOL)animatesFromModelValues;
+ (BOOL)batchWithDefaultServerObserver:(id)a3;
+ (BOOL)defaultDisableRunLoopObserverCommits;
+ (BOOL)disableActions;
+ (BOOL)disableImplicitTransactionMainThreadAssert;
+ (BOOL)disableRunLoopObserverCommits;
+ (BOOL)disableSignPosts;
+ (BOOL)emptyLowLatency;
+ (BOOL)frameStallSkipRequest;
+ (BOOL)lowLatency;
+ (CAMediaTimingFunction)animationTimingFunction;
+ (CFTimeInterval)animationDuration;
+ (double)beginTime;
+ (double)commitTime;
+ (double)earliestAutomaticCommitTime;
+ (double)inputTime;
+ (double)updateDeadline;
+ (id)_implicitAnimationForLayer:(id)a3 keyPath:(id)a4;
+ (id)animator;
+ (id)committingContexts;
+ (id)valueForKey:(NSString *)key;
+ (int)currentPhase;
+ (unint64_t)remoteInputMachTime;
+ (unsigned)currentState;
+ (unsigned)generateSeed;
+ (unsigned)registerBoolKey;
+ (unsigned)startFrameWithReason:(int)a3 beginTime:(double)a4 commitDeadline:(double)a5;
+ (void)activate;
+ (void)activateBackground:(BOOL)a3;
+ (void)assertInactive;
+ (void)batch;
+ (void)commit;
+ (void)completionBlock;
+ (void)enableUpdateCycleSupport;
+ (void)finishFrameWithToken:(unsigned int)a3;
+ (void)flush;
+ (void)flushAsRunLoopObserver;
+ (void)lock;
+ (void)popAnimator;
+ (void)pushAnimator:(id)a3;
+ (void)setAnimatesFromModelValues:(BOOL)a3;
+ (void)setAnimationDuration:(CFTimeInterval)dur;
+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)function;
+ (void)setBeginTime:(double)a3;
+ (void)setBoolValue:(BOOL)a3 forKey:(unsigned int)a4;
+ (void)setCommitHandler:(id)a3;
+ (void)setCommitTime:(double)a3;
+ (void)setCommittingContexts:(id)a3;
+ (void)setCompletionBlock:(void *)block;
+ (void)setDefaultDisableRunLoopObserverCommits:(BOOL)a3;
+ (void)setDisableActions:(BOOL)flag;
+ (void)setDisableImplicitTransactionMainThreadAssert:(BOOL)a3;
+ (void)setDisableRunLoopObserverCommits:(BOOL)a3;
+ (void)setDisableSignPosts:(BOOL)a3;
+ (void)setEarliestAutomaticCommitTime:(double)a3;
+ (void)setEmptyLowLatency:(BOOL)a3;
+ (void)setFrameInputTime:(double)a3 withToken:(unsigned int)a4;
+ (void)setFrameStallSkipRequest:(BOOL)a3;
+ (void)setImplicitTransactionDidBeginHandler:(id)a3;
+ (void)setInputTime:(double)a3;
+ (void)setLowLatency:(BOOL)a3;
+ (void)setPresentationHandler:(id)a3 queue:(id)a4;
+ (void)setRemoteInputMachTime:(unint64_t)a3;
+ (void)setUpdateDeadline:(double)a3;
+ (void)setValue:(id)anObject forKey:(NSString *)key;
+ (void)synchronize;
+ (void)unlock;
@end

@implementation CATransaction

+ (id)_implicitAnimationForLayer:(id)a3 keyPath:(id)a4
{
  v6 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    v6 = CA::Transaction::create(0);
  }
  v7 = (id *)*((void *)v6 + 1);
  if (v7)
  {
    id result = *v7;
    if (*v7)
    {
      v9 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v9();
    }
  }
  else
  {
    return (id)[a3 implicitAnimationForKeyPath:a4];
  }
  return result;
}

+ (void)setCompletionBlock:(void *)block
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t *)CA::Transaction::ensure_compat((CA::Transaction *)a1);
  v13 = 0;
  if (CA::Transaction::get_value(v4[11], 112, (const CGAffineTransform *)5, (CA::Mat4Impl *)&v13)) {
    BOOL v5 = v13 == block;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    v6 = _Block_copy(block);
    v14[0] = v6;
    CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x70, 5, (unsigned __int8 *)v14);
    v7 = (uint64_t *)v4[11];
    uint64_t v9 = *v7;
    v8 = (dispatch_block_t *)v7[1];
    if (v8)
    {
      CA::Transaction::Continuation::unref(v8);
      v7[1] = 0;
    }
    if (v6)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v11 = malloc_type_zone_malloc(malloc_zone, 0x18uLL, 0x8BB15036uLL);
      if (v11)
      {
        if (v9)
        {
          v12 = *(atomic_uint **)(v9 + 8);
          *(_DWORD *)v11 = 0;
          if (v12) {
            atomic_fetch_add(v12, 1u);
          }
        }
        else
        {
          v12 = 0;
        }
        v11[1] = v12;
        v11[2] = v6;
        *(_DWORD *)v11 = 1;
      }
      v7[1] = (uint64_t)v11;
    }
  }
}

+ (void)flushAsRunLoopObserver
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2 && **(_DWORD **)(v2 + 104) && (*(unsigned char *)(v2 + 116) & 1) != 0) {
    CA::Transaction::flush_as_runloop_observer((CA::Transaction *)v2, 0);
  }
}

+ (void)finishFrameWithToken:(unsigned int)a3
{
  if (a3)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3) {
      v3 = (CA::Transaction *)CA::Transaction::create(0);
    }
    CA::Transaction::finish_frame(v3);
  }
}

+ (unsigned)currentState
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 104);
  if (!*(_DWORD *)v3) {
    return 0;
  }
  int v4 = *(unsigned __int8 *)(v3 + 204);
  if (v4) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  int v6 = v5 | (2 * v4) & 4;
  if (*(_DWORD *)(v2 + 112)) {
    v6 |= 8u;
  }
  return v6 | (8 * *(unsigned __int8 *)(v2 + 116)) & 0x10;
}

+ (void)activate
{
  uint64_t v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = (CA::Transaction *)CA::Transaction::create(0);
  }
  if (!**((_DWORD **)v2 + 13))
  {
    CA::Transaction::ensure_implicit(v2, 1);
  }
}

+ (BOOL)addCommitHandler:(id)a3 forPhase:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  int v6 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    int v6 = CA::Transaction::create(0);
  }

  return CA::Transaction::add_commit_handler((uint64_t)v6, a3, v4);
}

+ (unsigned)startFrameWithReason:(int)a3 beginTime:(double)a4 commitDeadline:(double)a5
{
  if (a4 == 0.0 || a5 == 0.0) {
    return 0;
  }
  v8 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8) {
    v8 = CA::Transaction::create((CA::Transaction *)a1);
  }
  uint64_t v9 = mach_absolute_time();
  double v10 = CATimeWithHostTime(v9);
  uint64_t v11 = *((void *)v8 + 13);

  return CA::Transaction::start_frame(v11, a3, a4, v10, a5);
}

+ (void)setLowLatency:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  uint64_t v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    uint64_t v3 = (CA::Transaction *)CA::Transaction::create(0);
  }
  CA::Transaction::set_value(v3, (const void *)0x16E, 7, (unsigned __int8 *)&v4);
}

+ (void)setAnimationTimingFunction:(CAMediaTimingFunction *)function
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = function;
  uint64_t v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x20, 2, (unsigned __int8 *)v4);
}

+ (void)setAnimationDuration:(CFTimeInterval)dur
{
  v4[1] = *MEMORY[0x1E4F143B8];
  *(CFTimeInterval *)BOOL v4 = dur;
  uint64_t v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x1F, 18, (unsigned __int8 *)v4);
}

+ (void)setFrameStallSkipRequest:(BOOL)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = a3;
  BOOL v4 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    BOOL v4 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
  }
  unsigned __int8 v6 = 0;
  if (CA::Transaction::get_value(v4[11], 249, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v6)) {
    BOOL v5 = v6 == v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0xF9, 7, (unsigned __int8 *)&v7);
  }
  kdebug_trace();
}

+ (void)setUpdateDeadline:(double)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  *(double *)BOOL v7 = a3;
  BOOL v4 = (uint64_t *)CA::Transaction::ensure_compat((CA::Transaction *)a1);
  double v6 = 0.0;
  if (CA::Transaction::get_value(v4[11], 579, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v6))
  {
    double v5 = v6;
    if (v6 > a3) {
      double v5 = a3;
    }
    *(double *)BOOL v7 = v5;
  }
  CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x243, 18, (unsigned __int8 *)v7);
}

+ (void)setCommitTime:(double)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  *(double *)BOOL v4 = a3;
  int v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x6F, 18, (unsigned __int8 *)v4);
}

+ (void)flush
{
  uint64_t v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    if (**((_DWORD **)v2 + 13)) {
      CA::Transaction::flush(v2);
    }
  }
}

+ (void)synchronize
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  int v3 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    int v3 = CA::Transaction::create((CA::Transaction *)a1);
  }
  BOOL v4 = (_DWORD *)*((void *)v3 + 13);
  if (*v4 && +[CATransaction(CATransactionPrivate) synchronize]::last_sync_seed == v4[50]) {
    NSLog(&cfstr_CatransactionS.isa, a2);
  }
  memset(v78, 0, sizeof(v78));
  v72 = (CA::Context *)16;
  double v5 = CA::Context::retain_all_contexts(0, v78, (size_t *)&v72, 0, v2);
  double v6 = v72;
  if (!v72) {
    goto LABEL_95;
  }
  BOOL v7 = v5;
  mach_port_name_t name = 0;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v75 = 1065353216;
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::__rehash<true>((uint64_t)&v73, (unint64_t)(float)(unint64_t)v72);
  uint64_t v8 = 0;
  unsigned int v9 = 1;
  while (1)
  {
    double v10 = (pthread_mutex_t *)(v7[v8] + 16);
    pthread_mutex_lock(v10);
    uint64_t v11 = v7[v8];
    unsigned int v12 = *(_DWORD *)(v11 + 128);
    if (v12 > *(_DWORD *)(v11 + 132) && !*(void *)(v11 + 104))
    {
      int v15 = *(_DWORD *)(v11 + 160);
      if (v15)
      {
        if ((*(unsigned char *)(v11 + 241) & 2) == 0) {
          break;
        }
      }
    }
LABEL_10:
    pthread_mutex_unlock(v10);
    uint64_t v8 = v9;
    BOOL v14 = (unint64_t)v6 > v9++;
    if (!v14) {
      goto LABEL_31;
    }
  }
  mach_port_name_t v16 = name;
  if (name - 1 < 0xFFFFFFFE
    || (v17 = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name), mach_port_name_t v16 = name, name - 1 < 0xFFFFFFFE))
  {
    uint64_t v18 = _CASSynchronize(v15, v16, -1, v9, v12, 0, 0);
    if (v18)
    {
      uint64_t v19 = v18;
      if (v18 == 268435459)
      {
        *(unsigned char *)(v7[v8] + 241) |= 2u;
      }
      else if (v18 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      if (x_log_hook_p())
      {
        uint64_t v20 = *(unsigned int *)(v7[v8] + 4);
        uint64_t v67 = v19;
        v68 = mach_error_string(v19);
        uint64_t v66 = v20;
        x_log_();
      }
      else
      {
        v21 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
        {
          int v22 = *(_DWORD *)(v7[v8] + 4);
          v23 = mach_error_string(v19);
          *(_DWORD *)buf = 67109634;
          LODWORD(v77[0]) = v22;
          WORD2(v77[0]) = 1024;
          *(_DWORD *)((char *)v77 + 6) = v19;
          WORD1(v77[1]) = 2080;
          *(void *)((char *)&v77[1] + 4) = v23;
          _os_log_impl(&dword_184668000, v21, OS_LOG_TYPE_ERROR, "Failed to register commit sync (client=0x%x) [0x%x %s]", buf, 0x18u);
        }
      }
    }
    else
    {
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&v73, v9, v9);
    }
    goto LABEL_10;
  }
  uint64_t v24 = v17;
  if (x_log_hook_p())
  {
    uint64_t v25 = *(unsigned int *)(v7[v8] + 4);
    uint64_t v67 = v24;
    v68 = mach_error_string(v24);
    uint64_t v66 = v25;
    x_log_();
  }
  else
  {
    v26 = x_log_category_api;
    if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
    {
      int v27 = *(_DWORD *)(v7[v8] + 4);
      v28 = mach_error_string(v24);
      *(_DWORD *)buf = 67109634;
      LODWORD(v77[0]) = v27;
      WORD2(v77[0]) = 1024;
      *(_DWORD *)((char *)v77 + 6) = v24;
      WORD1(v77[1]) = 2080;
      *(void *)((char *)&v77[1] + 4) = v28;
      _os_log_impl(&dword_184668000, v26, OS_LOG_TYPE_ERROR, "Failed to make reply port for commit sync (client=0x%x) [0x%x %s]", buf, 0x18u);
    }
  }
  pthread_mutex_unlock(v10);
LABEL_31:
  if (*((void *)&v74 + 1))
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    while (2)
    {
      unsigned int v70 = 0;
      *(void *)v69 = 0;
      switch(CA::Render::Context::wait_for_synchronize(name, &v70, &v69[1], v69, v13))
      {
        case 1u:
          v31 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&v73, v70);
          if (v31)
          {
            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(&v73, v31);
            uint64_t v32 = v70 - 1;
            v33 = (pthread_mutex_t *)(v7[v32] + 16);
            pthread_mutex_lock(v33);
            unsigned int v34 = v69[1];
            v35 = (_DWORD *)v7[v32];
            unsigned int v36 = v35[33];
            if (v69[1] > v36)
            {
              v35[33] = v69[1];
              unsigned int v36 = v34;
            }
            if (v69[0] > v35[34]) {
              v35[34] = v69[0];
            }
            if (v36 > v35[32])
            {
              if (x_log_hook_p())
              {
                uint64_t v66 = *(unsigned int *)(v7[v32] + 132);
                uint64_t v67 = *(unsigned int *)(v7[v32] + 128);
                x_log_();
              }
              else
              {
                v60 = x_log_category_api;
                if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
                {
                  int v61 = *(_DWORD *)(v7[v32] + 128);
                  int v62 = *(_DWORD *)(v7[v32] + 132);
                  *(_DWORD *)buf = 67109376;
                  LODWORD(v77[0]) = v62;
                  WORD2(v77[0]) = 1024;
                  *(_DWORD *)((char *)v77 + 6) = v61;
                  _os_log_impl(&dword_184668000, v60, OS_LOG_TYPE_ERROR, "server/client commit_seed mismatch : sync server seed (%u) > client (%u)", buf, 0xEu);
                }
              }
              *(_DWORD *)(v7[v32] + 128) = *(_DWORD *)(v7[v32] + 132);
            }
            pthread_mutex_unlock(v33);
          }
          else
          {
            v49 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"["];
            v50 = (uint64_t *)v74;
            if ((void)v74)
            {
              v51 = @"%u(%u:%x)";
              do
              {
                uint64_t v52 = v7[*((_DWORD *)v50 + 4) - 1];
                uint64_t v67 = *(unsigned int *)(v52 + 12);
                v68 = (char *)*(unsigned int *)(v52 + 4);
                objc_msgSend(v49, "appendFormat:", v51, *((unsigned int *)v50 + 4));
                v50 = (uint64_t *)*v50;
                v51 = @",%u(%u:%x)";
              }
              while (v50);
            }
            uint64_t v29 = (v29 + 1);
            if (v29)
            {
              uint64_t v66 = v29;
              [v49 appendFormat:@"-%u"];
            }
            objc_msgSend(v49, "appendString:", @"]", v66);
            if (x_log_hook_p())
            {
              uint64_t v66 = v70;
              uint64_t v67 = [v49 UTF8String];
              goto LABEL_72;
            }
            uint64_t v57 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              unsigned int v58 = v70;
              uint64_t v59 = [v49 UTF8String];
              *(_DWORD *)buf = 67109378;
              LODWORD(v77[0]) = v58;
              WORD2(v77[0]) = 2080;
              *(void *)((char *)v77 + 6) = v59;
              v44 = v57;
              v45 = "bad index in commit sync reply : %u not in %s";
              uint32_t v48 = 18;
              goto LABEL_62;
            }
          }
          goto LABEL_73;
        case 2u:
          uint64_t v29 = (v29 + 1);
          if (x_log_hook_p()) {
            goto LABEL_72;
          }
          uint64_t v46 = x_log_category_api;
          if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR)) {
            goto LABEL_73;
          }
          *(_WORD *)buf = 0;
          v44 = v46;
          v45 = "dead reply from commit sync";
          goto LABEL_61;
        case 3u:
          uint64_t v29 = (v29 + 1);
          if (x_log_hook_p()) {
            goto LABEL_72;
          }
          uint64_t v43 = x_log_category_api;
          if (!os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR)) {
            goto LABEL_73;
          }
          *(_WORD *)buf = 0;
          v44 = v43;
          v45 = "unrecognized reply from commit sync";
          goto LABEL_61;
        case 4u:
          v37 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"["];
          v38 = (uint64_t *)v74;
          if ((void)v74)
          {
            v39 = @"%u(%u:%x)";
            do
            {
              uint64_t v40 = v7[*((_DWORD *)v38 + 4) - 1];
              objc_msgSend(v37, "appendFormat:", v39, *((unsigned int *)v38 + 4), *(unsigned int *)(v40 + 12), *(unsigned int *)(v40 + 4));
              v38 = (uint64_t *)*v38;
              v39 = @",%u(%u:%x)";
            }
            while (v38);
          }
          if (v29) {
            objc_msgSend(v37, "appendFormat:", @"-%u", v29);
          }
          objc_msgSend(v37, "appendString:", @"]", v66, v67, v68);
          uint64_t v41 = (v30 + 1);
          BOOL v42 = x_log_hook_p();
          if ((int)v30 > 8)
          {
            if (v42)
            {
              uint64_t v66 = [v37 UTF8String];
              x_log_();
            }
            else
            {
              v55 = x_log_category_api;
              if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
              {
                uint64_t v56 = [v37 UTF8String];
                *(_DWORD *)buf = 136315138;
                v77[0] = v56;
                _os_log_impl(&dword_184668000, v55, OS_LOG_TYPE_ERROR, "excessive commit sync wait : %s", buf, 0xCu);
              }
            }
            uint64_t v29 = (v29 + DWORD2(v74));
          }
          else if (v42)
          {
            uint64_t v66 = (v30 + 1);
            uint64_t v67 = [v37 UTF8String];
            x_log_();
          }
          else
          {
            v53 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              uint64_t v54 = [v37 UTF8String];
              *(_DWORD *)buf = 67109378;
              LODWORD(v77[0]) = v30 + 1;
              WORD2(v77[0]) = 2080;
              *(void *)((char *)v77 + 6) = v54;
              _os_log_impl(&dword_184668000, v53, OS_LOG_TYPE_ERROR, "long commit sync wait %i : %s", buf, 0x12u);
            }
          }
          goto LABEL_74;
        default:
          if (x_log_hook_p())
          {
LABEL_72:
            x_log_();
          }
          else
          {
            uint64_t v47 = x_log_category_api;
            if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v44 = v47;
              v45 = "unknown error while waiting for commit sync";
LABEL_61:
              uint32_t v48 = 2;
LABEL_62:
              _os_log_impl(&dword_184668000, v44, OS_LOG_TYPE_ERROR, v45, buf, v48);
            }
          }
LABEL_73:
          uint64_t v41 = v30;
LABEL_74:
          uint64_t v30 = v41;
          if (*((void *)&v74 + 1) <= (unint64_t)v29) {
            break;
          }
          continue;
      }
      break;
    }
  }
  if (name - 1 < 0xFFFFFFFE) {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], name, 1u, -1);
  }
  uint64_t v63 = 0;
  unsigned int v64 = 1;
  do
  {
    CA::Context::unref((CA::Context *)v7[v63], 0);
    uint64_t v63 = v64;
    BOOL v14 = (unint64_t)v6 > v64++;
  }
  while (v14);
  if (v7 != (void *)v78)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v73);
LABEL_95:
  +[CATransaction(CATransactionPrivate) synchronize]::last_sync_seed = *(_DWORD *)(*((void *)v3 + 13) + 200);
}

+ (void)batch
{
  CFArrayRef v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  *(unsigned char *)(*((void *)v2 + 13) + 204) |= 0x40u;
}

+ (void)setDisableActions:(BOOL)flag
{
  BOOL v3 = flag;
  BOOL v4 = CA::Transaction::ensure_compat((CA::Transaction *)a1);

  CA::Transaction::set_BOOL_value(v4, v3, 0);
}

+ (BOOL)disableActions
{
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  BOOL v3 = (char *)v2 + 88;
  while (1)
  {
    BOOL v3 = *(char **)v3;
    if (!v3) {
      break;
    }
    if (v3[28]) {
      return v3[24] & 1;
    }
  }
  return 0;
}

+ (double)commitTime
{
  v5[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  v5[0] = 0;
  int value = CA::Transaction::get_value(*((void *)v2 + 11), 111, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  double result = *(double *)v5;
  if (!value) {
    return 0.0;
  }
  return result;
}

+ (void)unlock
{
  CFArrayRef v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);

  CA::Transaction::unlock(v2);
}

+ (void)lock
{
  CFArrayRef v2 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  int v3 = *((_DWORD *)v2 + 25);
  *((_DWORD *)v2 + 25) = v3 + 1;
  if (!v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
}

+ (int)currentPhase
{
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  return *(_DWORD *)(*((void *)v2 + 13) + 56);
}

+ (void)setFrameInputTime:(double)a3 withToken:(unsigned int)a4
{
  if (a4)
  {
    double v5 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5) {
      double v5 = CA::Transaction::create(0);
    }
    uint64_t v6 = *((void *)v5 + 13);
    CA::Transaction::set_frame_input_time(v6, a3);
  }
}

+ (void)enableUpdateCycleSupport
{
  CA::Transaction::_update_cycle_support_enabled = 1;
}

+ (void)commit
{
  CFArrayRef v2 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    if (**((_DWORD **)v2 + 13)) {
      CA::Transaction::pop(v2, a2);
    }
  }
}

+ (void)activateBackground:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    BOOL v4 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)a1);
  }
  if (**((_DWORD **)v4 + 13))
  {
    if (!v3) {
      return;
    }
  }
  else
  {
    CA::Transaction::ensure_implicit(v4, 0);
    if (!v3) {
      return;
    }
  }
  if (pthread_main_np()) {
    [MEMORY[0x1E4F1CA00] raise:@"CATransactionInvalidThread" format:@"May not mark the main thread as a background transaction"];
  }
  *((unsigned char *)v4 + 116) |= 4u;
}

+ (void)setImplicitTransactionDidBeginHandler:(id)a3
{
  BOOL v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    BOOL v4 = CA::Transaction::create((CA::Transaction *)a1);
  }
  double v5 = *(const void **)(*((void *)v4 + 13) + 112);
  if (v5)
  {
    _Block_release(v5);
    *(void *)(*((void *)v4 + 13) + 112) = 0;
  }
  if (a3) {
    *(void *)(*((void *)v4 + 13) + 112) = _Block_copy(a3);
  }
}

+ (id)valueForKey:(NSString *)key
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v4 = CAInternAtom((const __CFString *)key, 0);
  if (!v4) {
    return 0;
  }
  int v5 = v4;
  uint64_t v6 = 0;
  BOOL v7 = transaction_properties;
  while (1)
  {
    int v8 = *v7;
    v7 += 12;
    if (v8 == v4) {
      break;
    }
    if (++v6 == 9)
    {
      unsigned int v9 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (!v9) {
        unsigned int v9 = CA::Transaction::create(0);
      }
      v16[0] = 0;
      if (CA::Transaction::get_value(*((void *)v9 + 11), v5, (const CGAffineTransform *)2, (CA::Mat4Impl *)v16))return (id)v16[0]; {
      else
      }
        return 0;
    }
  }
  uint64_t v11 = &transaction_properties[12 * v6];
  BOOL v14 = (const char *)*((void *)v11 + 4);
  v13 = (const char **)(v11 + 8);
  unsigned int v12 = v14;
  if (!v14)
  {
    unsigned int v12 = sel_registerName(*(const char **)&transaction_properties[12 * v6 + 4]);
    unsigned int *v13 = v12;
  }
  uint64_t v15 = transaction_properties[12 * v6 + 10];

  return CA_valueForKey(a1, v12, v15);
}

+ (void)setDisableRunLoopObserverCommits:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    int v4 = CA::Transaction::create(0);
  }
  if (v3) {
    char v5 = 8;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(*((void *)v4 + 13) + 204) = *(unsigned char *)(*((void *)v4 + 13) + 204) & 0xF7 | v5;
}

+ (void)setDefaultDisableRunLoopObserverCommits:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    int v4 = CA::Transaction::create(0);
  }
  if (v3) {
    char v5 = 16;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(*((void *)v4 + 13) + 204) = *(unsigned char *)(*((void *)v4 + 13) + 204) & 0xEF | v5;
}

+ (void)setValue:(id)anObject forKey:(NSString *)key
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = anObject;
  uint64_t v6 = (CA::Transaction *)CAInternAtom((const __CFString *)key, 1);
  BOOL v7 = v6;
  uint64_t v8 = 0;
  unsigned int v9 = transaction_properties;
  while (1)
  {
    int v10 = *v9;
    v9 += 12;
    if (v10 == v6) {
      break;
    }
    if (++v8 == 9)
    {
      uint64_t v11 = CA::Transaction::ensure_compat(v6);
      CA::Transaction::set_value(v11, v7, 2, (unsigned __int8 *)v17);
      return;
    }
  }
  unsigned int v12 = &transaction_properties[12 * v8];
  uint64_t v15 = (const char *)*((void *)v12 + 3);
  BOOL v14 = (const char **)(v12 + 6);
  v13 = v15;
  if (!v15)
  {
    v13 = sel_registerName(*(const char **)&transaction_properties[12 * v8 + 2]);
    *BOOL v14 = v13;
  }
  uint64_t v16 = transaction_properties[12 * v8 + 10];

  CA_setValueForKey(a1, v13, v16, anObject);
}

+ (void)completionBlock
{
  v4[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  v4[0] = 0;
  if (CA::Transaction::get_value(*((void *)v2 + 11), 112, (const CGAffineTransform *)5, (CA::Mat4Impl *)v4))return (void *)v4[0]; {
  else
  }
    return 0;
}

+ (CAMediaTimingFunction)animationTimingFunction
{
  v4[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  v4[0] = 0;
  if (CA::Transaction::get_value(*((void *)v2 + 11), 32, (const CGAffineTransform *)2, (CA::Mat4Impl *)v4))return (CAMediaTimingFunction *)v4[0]; {
  else
  }
    return 0;
}

+ (CFTimeInterval)animationDuration
{
  v5[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    CFArrayRef v2 = CA::Transaction::create(0);
  }
  v5[0] = 0;
  int value = CA::Transaction::get_value(*((void *)v2 + 11), 31, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  CFTimeInterval result = *(double *)v5;
  if (!value) {
    return 0.25;
  }
  return result;
}

+ (BOOL)batchWithDefaultServerObserver:(id)a3
{
  int v4 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  *(unsigned char *)(*((void *)v4 + 13) + 204) |= 0x40u;
  char v5 = *((unsigned char *)v4 + 116);
  if ((v5 & 2) == 0)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *((void *)v4 + 13);
    if (!*(_DWORD *)v7)
    {
      CA::Transaction::ensure_implicit(v4, 1);
      uint64_t v7 = *((void *)v6 + 13);
    }
    int v8 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    uint64_t v9 = *(void *)(v7 + 48);
    int v10 = _Block_copy(a3);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    unsigned int v12 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
    void *v12 = v10;
    v12[1] = v9;
    *(void *)(v7 + 48) = v12;
    CA::Transaction::unlock(v6);
  }
  return (v5 & 2) == 0;
}

+ (void)setCommittingContexts:(id)a3
{
  int v4 = (const void **)(*((void *)CA::Transaction::ensure_compat((CA::Transaction *)a1) + 13) + 120);

  X::CFRef<__CFDictionary const*>::operator=(v4, a3);
}

+ (id)committingContexts
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2) {
    return *(id *)(*(void *)(v2 + 104) + 120);
  }
  else {
    return 0;
  }
}

+ (void)setBoolValue:(BOOL)a3 forKey:(unsigned int)a4
{
  BOOL v5 = a3;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)a1);

  CA::Transaction::set_BOOL_value(v6, v5, a4);
}

+ (BOOL)BOOLValueForKey:(unsigned int)a3
{
  uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v3)
  {
    if (a3 >= 0x20) {
      __assert_rtn("BOOL_value", "CATransactionInternal.mm", 1279, "key < (CHAR_BIT * sizeof (Level::_BOOL_values))");
    }
    int v4 = 1 << a3;
    BOOL v5 = (uint64_t *)(v3 + 88);
    while (1)
    {
      BOOL v5 = (uint64_t *)*v5;
      if (!v5) {
        break;
      }
      if ((*((_DWORD *)v5 + 7) & v4) != 0) {
        return (v5[3] & v4) != 0;
      }
    }
  }
  return 0;
}

+ (unsigned)registerBoolKey
{
  unsigned int v2 = atomic_load((unsigned int *)CA::_BOOL_key);
  if (v2 >= 0x20) {
    __assert_rtn("register_BOOL_key", "CATransactionInternal.mm", 1271, "_BOOL_key < CHAR_BIT * sizeof (Level::_BOOL_values)");
  }
  return atomic_fetch_add(CA::_BOOL_key, 1u);
}

+ (void)assertInactive
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    if (*(_DWORD *)v3)
    {
      if (!CA::Transaction::_debug_transactions)
      {
        if (x_log_hook_p())
        {
          x_log_();
          abort();
        }
        int v4 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184668000, v4, OS_LOG_TYPE_DEFAULT, "CoreAnimation: warning, encountered thread with uncommitted CATransaction; set CA_DEBUG_TRANSACTIONS=1 in en"
            "vironment to log backtraces, or set CA_ASSERT_MAIN_THREAD_TRANSACTIONS=1 to abort when an implicit transacti"
            "on isn't created on a main thread.\n",
            buf,
            2u);
        }
        abort();
      }
      x_log_begin();
      if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        BOOL v5 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184668000, v5, OS_LOG_TYPE_DEFAULT, "CoreAnimation: warning, encountered thread with uncommitted CATransaction; created by:\n",
            buf,
            2u);
        }
      }
      uint64_t v6 = backtrace_symbols(*(void *const **)(v3 + 240), *(unsigned __int16 *)(v3 + 206));
      if (v6)
      {
        uint64_t v7 = v6;
        memset(buf, 0, 24);
        if (*(_WORD *)(v3 + 206))
        {
          unint64_t v8 = 0;
          do
          {
            if (x_log_hook_p())
            {
              x_log_();
            }
            else
            {
              uint64_t v9 = x_log_category_api;
              if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
              {
                int v10 = v7[v8];
                *(_DWORD *)v26 = 136315138;
                int v27 = v10;
                _os_log_impl(&dword_184668000, v9, OS_LOG_TYPE_DEFAULT, "%s\n", v26, 0xCu);
              }
            }
            size_t v11 = strlen(v7[v8]);
            x_stream_write((uint64_t)buf, v7[v8], v11);
            x_stream_write((uint64_t)buf, "\n", 1uLL);
            ++v8;
          }
          while (v8 < *(unsigned __int16 *)(v3 + 206));
        }
        free(v7);
        unsigned int v12 = x_stream_finish((uint64_t)buf);
        if (v12)
        {
          v13 = (char *)v12;
          x_log_crash("%s", v12);
          free(v13);
        }
        else
        {
          x_log_crash(0);
        }
      }
      uint64_t v24 = (void **)x_stream_pop_(0);
      BOOL v14 = x_stream_get(v24);
      for (int i = 0; ; i += v21)
      {
        uint64_t v16 = 0;
        uint64_t v17 = &v14[i];
        int v18 = -1;
        while (1)
        {
          if (v17[v16] == 10)
          {
            int v18 = v16;
            goto LABEL_31;
          }
          if (!v17[v16]) {
            break;
          }
LABEL_31:
          ++v16;
          unsigned int v19 = 32512;
          if (v16 == 32512) {
            goto LABEL_32;
          }
        }
        unsigned int v19 = v16;
LABEL_32:
        if (v18 <= -1 || v17[v19] == 0) {
          int v21 = v19;
        }
        else {
          int v21 = v18 + 1;
        }
        if (v21 <= 0)
        {
          x_log_end_free_(v24);
          abort();
        }
        if (x_log_hook_p())
        {
          x_log_();
        }
        else
        {
          int v22 = x_log_category_api;
          if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            if (i) {
              v23 = "continued...\n";
            }
            else {
              v23 = "";
            }
            *(void *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 1040;
            *(_DWORD *)&buf[14] = v21;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = &v14[i];
            _os_log_impl(&dword_184668000, v22, OS_LOG_TYPE_DEFAULT, "%s%.*s", buf, 0x1Cu);
          }
        }
      }
    }
  }
}

+ (unsigned)generateSeed
{
  uint64_t v2 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
  }
  uint64_t v3 = v2[13];
  if (!*(_DWORD *)v3)
  {
    CA::Transaction::ensure_implicit((CA::Transaction *)v2, 1);
    uint64_t v3 = v2[13];
  }
  *(unsigned char *)(v3 + 204) |= 4u;
  uint64_t v4 = mach_absolute_time();
  double v5 = CATimeWithHostTime(v4);
  CA::Transaction::set_frame_begin_time(v2[13], v5);
  unsigned int v6 = *(_DWORD *)(v2[13] + 200);
  getpid();
  kdebug_trace();
  return v6;
}

+ (void)setEmptyLowLatency:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  uint64_t v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    uint64_t v3 = (CA::Transaction *)CA::Transaction::create(0);
  }
  CA::Transaction::set_value(v3, (const void *)0xD3, 7, (unsigned __int8 *)&v4);
}

+ (BOOL)emptyLowLatency
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 0;
  }
  char v5 = 0;
  char value = CA::Transaction::get_value(*(void *)(v2 + 88), 211, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v5);
  BOOL result = v5 != 0;
  if ((value & 1) == 0) {
    return 0;
  }
  return result;
}

+ (BOOL)lowLatency
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 0;
  }
  char v5 = 0;
  char value = CA::Transaction::get_value(*(void *)(v2 + 88), 366, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v5);
  BOOL result = v5 != 0;
  if ((value & 1) == 0) {
    return 0;
  }
  return result;
}

+ (void)setBeginTime:(double)a3
{
  BOOL v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    BOOL v4 = CA::Transaction::create(0);
  }
  uint64_t v5 = *((void *)v4 + 13);

  CA::Transaction::set_frame_begin_time(v5, a3);
}

+ (double)beginTime
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 1.79769313e308;
  }
  double result = *(double *)(*(void *)(v2 + 104) + 176);
  if (result == 0.0) {
    return 1.79769313e308;
  }
  return result;
}

+ (void)setRemoteInputMachTime:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  if (a3)
  {
    BOOL v4 = *(uint64_t **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v4) {
      BOOL v4 = (uint64_t *)CA::Transaction::create((CA::Transaction *)a1);
    }
    unint64_t v6 = -1;
    if (CA::Transaction::get_value(v4[11], 465, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)&v6)) {
      BOOL v5 = v6 > a3;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      CA::Transaction::set_value((CA::Transaction *)v4, (const void *)0x1D1, 16, (unsigned __int8 *)v7);
    }
  }
}

+ (unint64_t)remoteInputMachTime
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2
    && (v4[0] = 0,
        (CA::Transaction::get_value(*(void *)(v2 + 88), 465, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)v4) & 1) != 0))
  {
    return v4[0];
  }
  else
  {
    return 0;
  }
}

+ (BOOL)frameStallSkipRequest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    return 0;
  }
  char v5 = 0;
  char value = CA::Transaction::get_value(*(void *)(v2 + 88), 249, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v5);
  BOOL result = v5 != 0;
  if ((value & 1) == 0) {
    return 0;
  }
  return result;
}

+ (void)setInputTime:(double)a3
{
  if (a3 != 0.0)
  {
    char v5 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v5) {
      char v5 = CA::Transaction::create(0);
    }
    uint64_t v6 = *((void *)v5 + 13);
    CA::Transaction::set_frame_input_time(v6, a3);
  }
}

+ (double)inputTime
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v2) {
    return *(double *)(*(void *)(v2 + 104) + 192);
  }
  else {
    return 0.0;
  }
}

+ (BOOL)defaultDisableRunLoopObserverCommits
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  return (*(unsigned __int8 *)(*((void *)v2 + 13) + 204) >> 4) & 1;
}

+ (BOOL)disableRunLoopObserverCommits
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  return (*(unsigned __int8 *)(*((void *)v2 + 13) + 204) >> 3) & 1;
}

+ (void)setEarliestAutomaticCommitTime:(double)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  *(double *)BOOL v4 = a3;
  uint64_t v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0xC0, 18, (unsigned __int8 *)v4);
}

+ (double)earliestAutomaticCommitTime
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  v5[0] = 0;
  int value = CA::Transaction::get_value(*((void *)v2 + 11), 192, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  double result = *(double *)v5;
  if (!value) {
    return 0.0;
  }
  return result;
}

+ (double)updateDeadline
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  v5[0] = 0;
  int value = CA::Transaction::get_value(*((void *)v2 + 11), 579, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v5);
  double result = *(double *)v5;
  if (!value) {
    return 0.0;
  }
  return result;
}

+ (void)setDisableSignPosts:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *((void *)CA::Transaction::ensure_compat((CA::Transaction *)a1) + 13);
  if (v3) {
    char v5 = 32;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 204) = *(unsigned char *)(v4 + 204) & 0xDF | v5;
}

+ (BOOL)disableSignPosts
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  return (*(unsigned __int8 *)(*((void *)v2 + 13) + 204) >> 5) & 1;
}

+ (void)setAnimatesFromModelValues:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  BOOL v3 = CA::Transaction::ensure_compat((CA::Transaction *)a1);
  CA::Transaction::set_value(v3, (const void *)0x1D, 7, (unsigned __int8 *)&v4);
}

+ (BOOL)animatesFromModelValues
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  char v4 = 0;
  BOOL result = CA::Transaction::get_value(*((void *)v2 + 11), 29, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v4);
  if (!v4) {
    return 0;
  }
  return result;
}

+ (void)setDisableImplicitTransactionMainThreadAssert:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v4 || (char v4 = CA::Transaction::create(0)) != 0)
  {
    if (v3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)v4 + 116) = *((unsigned char *)v4 + 116) & 0xF7 | v5;
  }
}

+ (BOOL)disableImplicitTransactionMainThreadAssert
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  return (*((unsigned __int8 *)v2 + 116) >> 3) & 1;
}

+ (void)setPresentationHandler:(id)a3 queue:(id)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  if (a3) {
    a3 = _Block_copy(a3);
  }
  if (CA::Transaction::presentation_handler) {
    _Block_release((const void *)CA::Transaction::presentation_handler);
  }
  if (CA::Transaction::presentation_handler_queue) {
    dispatch_release((dispatch_object_t)CA::Transaction::presentation_handler_queue);
  }
  CA::Transaction::presentation_handler = (uint64_t)a3;
  CA::Transaction::presentation_handler_queue = (uint64_t)a4;

  os_unfair_lock_unlock((os_unfair_lock_t)&CA::Transaction::presentation_handler_lock);
}

+ (void)setCommitHandler:(id)a3
{
}

+ (id)animator
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create(0);
  }
  BOOL v3 = (id *)*((void *)v2 + 1);
  if (v3) {
    return *v3;
  }
  else {
    return &__block_literal_global_19570;
  }
}

uint64_t __47__CATransaction_CATransactionPrivate__animator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "implicitAnimationForKeyPath:");
}

+ (void)popAnimator
{
  uint64_t v2 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v2) {
    uint64_t v2 = CA::Transaction::create((CA::Transaction *)a1);
  }
  BOOL v3 = (const void **)*((void *)v2 + 1);
  if (v3)
  {
    if (*v3)
    {
      _Block_release(*v3);
      BOOL v3 = (const void **)*((void *)v2 + 1);
    }
    *((void *)v2 + 1) = x_list_remove_head(v3);
  }
}

+ (void)pushAnimator:(id)a3
{
  id v3 = a3;
  char v4 = *(_OWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
  {
    char v4 = CA::Transaction::create((CA::Transaction *)a1);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a3) {
LABEL_3:
  }
    id v3 = _Block_copy(v3);
LABEL_4:
  uint64_t v5 = *((void *)v4 + 1);
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  uint64_t v7 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
  void *v7 = v3;
  v7[1] = v5;
  *((void *)v4 + 1) = v7;
}

@end