@interface __NSOperationInternalObserver
+ (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9;
@end

@implementation __NSOperationInternalObserver

+ (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (a3 != @"isFinished" && a3 != @"finished")
  {
    if (a3 == @"isExecuting" || a3 == @"executing")
    {
LABEL_18:
      int v15 = [a4 isExecuting];
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      unsigned int v16 = atomic_load((unsigned __int8 *)a4 + 237);
      if (v16 <= 0xDF && v15 != 0) {
        atomic_store(0xE0u, (unsigned __int8 *)a4 + 237);
      }
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
      goto LABEL_24;
    }
    if (a3 == @"isReady" || a3 == @"ready")
    {
LABEL_90:
      int v46 = [a4 isReady];
      atomic_store(v46, (unsigned __int8 *)a4 + 239);
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      id obja = *((id *)a4 + 4);
      os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
      v47 = obja;
      if (v46 && obja)
      {
        __NSOQSchedule((uint64_t)obja);
        v47 = obja;
      }

      return;
    }
    if ((objc_msgSend(a3, "isEqualToString:", @"isFinished", a4, a5, a6, a7, a8) & 1) == 0
      && ([a3 isEqualToString:@"finished"] & 1) == 0)
    {
      if (([a3 isEqualToString:@"isExecuting"] & 1) != 0
        || ([a3 isEqualToString:@"executing"] & 1) != 0)
      {
        goto LABEL_18;
      }
      if (([a3 isEqualToString:@"isReady"] & 1) == 0
        && ([a3 isEqualToString:@"ready"] & 1) == 0)
      {
        return;
      }
      goto LABEL_90;
    }
  }
  if (![a4 isFinished]) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
  unsigned int v11 = atomic_load((unsigned __int8 *)a4 + 237);
  if (*((void *)a4 + 4) && v11 <= 0xD7)
  {
    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    NSLog((NSString *)@"*** %s %p went isFinished=YES without being started by the queue it is in", Name, a4);
  }
  else if (v11 > 0xEF)
  {
    if (v11 == 244)
    {
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
LABEL_24:
      os_unfair_lock_unlock(v18);
      return;
    }
    goto LABEL_29;
  }
  atomic_store(0xF0u, (unsigned __int8 *)a4 + 237);
LABEL_29:
  v19 = (void *)*((void *)a4 + 6);
  *((void *)a4 + 6) = 0;
  obuint64_t j = v19;
  if ([v19 count]
    && (long long v73 = 0u,
        long long v74 = 0u,
        long long v71 = 0u,
        long long v72 = 0u,
        (uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v70 count:16]) != 0))
  {
    uint64_t v21 = v20;
    v22 = 0;
    uint64_t v23 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v72 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        os_unfair_lock_lock((os_unfair_lock_t)(v25 + 232));
        uint64_t v26 = *(void *)(v25 + 56);
        if (v26 == 1)
        {
          if (!v22) {
            v22 = objc_opt_new();
          }
          [v22 addObject:v25];
        }
        else if (v26 < 2)
        {
          if (v26) {
            __assert_rtn("+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]", "NSOperation.m", 1022, "idown->__unfinished_deps == 0");
          }
          unsigned __int8 v27 = atomic_load((unsigned __int8 *)(v25 + 240));
          if ((v27 & 1) == 0) {
            __assert_rtn("+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]", "NSOperation.m", 1023, "atomic_load(&idown->__isCancelled) == YES");
          }
        }
        else
        {
          *(void *)(v25 + 56) = v26 - 1;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 232));
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v71 objects:v70 count:16];
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }
  atomic_store(0xF4u, (unsigned __int8 *)a4 + 237);
  v48 = (unsigned __int8 *)*((void *)a4 + 4);
  v49 = (char *)a4;
  lock = (os_unfair_lock_s *)((char *)a4 + 232);
  *((void *)a4 + 4) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
  if ([v22 count])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v28 = [v22 countByEnumeratingWithState:&v66 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v67 != v30) {
            objc_enumerationMutation(v22);
          }
          v32 = *(unsigned __int8 **)(*((void *)&v66 + 1) + 8 * j);
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v55 = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke;
          v56 = &__block_descriptor_40_e5_v8__0l;
          v57 = v32 + 8;
          if (atomic_load(v32 + 244))
          {
            [v32 _changeValueForKeys:&_NSOperationReadyKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v54];
          }
          else
          {
            v55((uint64_t)v54);
            +[__NSOperationInternalObserver _observeValueForKeyPath:@"isReady" ofObject:v32 changeKind:0 oldValue:0 newValue:0 indexes:0 context:0];
          }
        }
        uint64_t v29 = [v22 countByEnumeratingWithState:&v66 objects:v65 count:16];
      }
      while (v29);
    }
  }

  pthread_mutex_lock((pthread_mutex_t *)(v49 + 120));
  pthread_cond_broadcast((pthread_cond_t *)(v49 + 184));
  pthread_mutex_unlock((pthread_mutex_t *)(v49 + 120));
  if (qword_1EB1ECBC0 != -1) {
    dispatch_once(&qword_1EB1ECBC0, &__block_literal_global_361);
  }
  os_unfair_lock_lock(lock);
  v34 = (void *)*((void *)v49 + 8);
  if (_MergedGlobals_11) {
    *((void *)v49 + 8) = 0;
  }
  else {
    id v35 = v34;
  }
  os_unfair_lock_unlock(lock);
  if (v34)
  {
    v36 = v49;
    global_queue = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke_2;
    block[3] = &unk_1E51F7EE0;
    block[4] = v49;
    block[5] = v34;
    dispatch_async(global_queue, block);
  }
  if (v49[236]) {
    iop_removeAllDependencies((unsigned __int8 *)v49 + 8, v49);
  }
  if (!v48) {
    goto LABEL_82;
  }
  Class Class = object_getClass(v49);
  uint64_t v39 = 0;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v59 = ____NSOQOpFinished_block_invoke;
  v60 = &unk_1E51F9788;
  v61 = v48;
  v62 = v49;
  char v63 = v11;
  BOOL v64 = Class == (Class)_NSBarrierOperation;
  int v40 = 1;
  do
  {
    while (1)
    {
      int v41 = v40;
      v42 = _NSOperationQueueOperationsAndOperationCountKeys[v39];
      if (v42 == @"operations") {
        break;
      }
      if (v42 == @"operationCount")
      {
        v43 = v48 + 504;
        goto LABEL_75;
      }
      int v40 = 0;
      uint64_t v39 = 1;
      if ((v41 & 1) == 0) {
        goto LABEL_79;
      }
    }
    v43 = v48 + 503;
LABEL_75:
    int v44 = atomic_load(v43);
    BOOL v45 = v44 != 0;
    if (v44) {
      break;
    }
    int v40 = 0;
    uint64_t v39 = 1;
  }
  while (((v41 ^ 1) & 1) == 0);
  if (v45)
  {
    [v48 _changeValueForKeys:_NSOperationQueueOperationsAndOperationCountKeys count:2 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v58];
    goto LABEL_80;
  }
LABEL_79:
  v59((uint64_t)v58);
LABEL_80:
  __NSOQSchedule((uint64_t)v48);
  if (v11 >= 0x48) {

  }
LABEL_82:
}

@end