@interface NSFileAccessProcessMonitor
+ (id)sharedInstance;
- (BOOL)processWithPIDIsSuspended:(int)a3;
- (id)_init;
- (void)addProcessManager:(id)a3 forPID:(int)a4;
- (void)dealloc;
- (void)process:(id)a3 receivedUpdate:(id)a4;
- (void)removeProcessManager:(id)a3 forPID:(int)a4;
- (void)updateMonitorPredicate;
@end

@implementation NSFileAccessProcessMonitor

- (void)removeProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(objc_class *)objc_lookUpClass("RBSProcessIdentifier") identifierWithPid:*(void *)&a4];
  os_unfair_lock_lock(&self->_lock);
  v8 = (void *)[(NSMutableDictionary *)self->_pidToProcessManagers objectForKey:v7];
  if (v8)
  {
    v9 = v8;
    int v10 = [v8 containsObject:a3];
    if (v10)
    {
      v11 = _NSFCProcessMonitorLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 67109120;
        v12[1] = a4;
        _os_log_debug_impl(&dword_181795000, v11, OS_LOG_TYPE_DEBUG, "Destroying process monitor for pid %d", (uint8_t *)v12, 8u);
      }
      [v9 removeObject:a3];
    }
    if (![v9 count]) {
      [(NSMutableDictionary *)self->_pidToProcessManagers removeObjectForKey:v7];
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v10) {
      [(NSFileAccessProcessMonitor *)self updateMonitorPredicate];
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1EDC50 != -1) {
    dispatch_once(&qword_1EB1EDC50, v3);
  }
  return (id)qword_1EB1EDC48;
}

- (void)addProcessManager:(id)a3 forPID:(int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(objc_class *)objc_lookUpClass("RBSProcessIdentifier") identifierWithPid:*(void *)&a4];
  os_unfair_lock_lock(&self->_lock);
  v8 = (NSHashTable *)[(NSMutableDictionary *)self->_pidToProcessManagers objectForKey:v7];
  if (!v8)
  {
    v8 = +[NSHashTable weakObjectsHashTable];
    [(NSMutableDictionary *)self->_pidToProcessManagers setObject:v8 forKey:v7];
  }
  if ([(NSHashTable *)v8 containsObject:a3])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v9 = _NSFCProcessMonitorLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10[0] = 67109120;
      v10[1] = a4;
      _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Creating process monitor for pid %d", (uint8_t *)v10, 8u);
    }
    [(NSHashTable *)v8 addObject:a3];
    os_unfair_lock_unlock(&self->_lock);
    [(NSFileAccessProcessMonitor *)self updateMonitorPredicate];
  }
}

- (void)updateMonitorPredicate
{
  v6[5] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = -[objc_class predicateMatchingIdentifiers:](objc_lookUpClass("RBSProcessPredicate"), "predicateMatchingIdentifiers:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSMutableDictionary allKeys](self->_pidToProcessManagers, "allKeys")));
  monitor = self->_monitor;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke;
  v6[3] = &unk_1E51FBAA8;
  v6[4] = v4;
  [(RBSProcessMonitor *)monitor updateConfiguration:v6];
  os_unfair_lock_unlock(p_lock);
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "process:receivedUpdate:");
}

uint64_t __52__NSFileAccessProcessMonitor_updateMonitorPredicate__block_invoke(uint64_t a1, void *a2)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *(void *)(a1 + 32);
  return objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 1));
}

- (void)process:(id)a3 receivedUpdate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "currentState"), "taskState") == 3)
  {
    uint64_t v6 = -[objc_class identifierWithPid:](objc_lookUpClass("RBSProcessIdentifier"), "identifierWithPid:", [a3 pid]);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_pidToProcessManagers, "objectForKey:", v6), "allObjects");
    os_unfair_lock_unlock(p_lock);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v12++) processSuspended];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v10);
    }
  }
}

- (id)_init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDC40 != -1) {
    dispatch_once(&qword_1EB1EDC40, &__block_literal_global_68);
  }
  if (_MergedGlobals_143)
  {
    v8.receiver = self;
    v8.super_class = (Class)NSFileAccessProcessMonitor;
    v3 = [(NSFileAccessProcessMonitor *)&v8 init];
    uint64_t v4 = v3;
    if (v3)
    {
      v3->_lock._os_unfair_lock_opaque = 0;
      v5 = (RBSProcessMonitor *)objc_alloc_init(objc_lookUpClass("RBSProcessMonitor"));
      v4->_monitor = v5;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_2;
      v7[3] = &unk_1E51FBAA8;
      v7[4] = v4;
      [(RBSProcessMonitor *)v5 updateConfiguration:v7];
      v4->_pidToProcessManagers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

Class __35__NSFileAccessProcessMonitor__init__block_invoke()
{
  dlopen("/System/Library/PrivateFrameworks/RunningBoardServices.framework/RunningBoardServices", 256);
  Class result = objc_lookUpClass("RBSProcessMonitor");
  _MergedGlobals_143 = result != 0;
  return result;
}

uint64_t __35__NSFileAccessProcessMonitor__init__block_invoke_2(uint64_t a1, void *a2)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__NSFileAccessProcessMonitor__init__block_invoke_3;
  v4[3] = &unk_1E51FBA80;
  v4[4] = *(void *)(a1 + 32);
  [a2 setUpdateHandler:v4];
  return objc_msgSend(a2, "setStateDescriptor:", -[objc_class descriptor](objc_lookUpClass("RBSProcessStateDescriptor"), "descriptor"));
}

uint64_t __44__NSFileAccessProcessMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _init];
  qword_1EB1EDC48 = result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(RBSProcessMonitor *)self->_monitor invalidate];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessProcessMonitor;
  [(NSFileAccessProcessMonitor *)&v3 dealloc];
}

- (BOOL)processWithPIDIsSuspended:(int)a3
{
  uint64_t v3 = [(objc_class *)objc_lookUpClass("RBSProcessIdentifier") identifierWithPid:*(void *)&a3];
  uint64_t v4 = [(objc_class *)objc_lookUpClass("RBSProcessPredicate") predicateMatchingIdentifier:v3];
  return objc_msgSend((id)objc_msgSend((id)-[objc_class handleForPredicate:error:](objc_lookUpClass("RBSProcessHandle"), "handleForPredicate:error:", v4, 0), "currentState"), "taskState") == 3;
}

@end