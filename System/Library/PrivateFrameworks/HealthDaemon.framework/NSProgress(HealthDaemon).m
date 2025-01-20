@interface NSProgress(HealthDaemon)
+ (_HDMirroredProgress)hd_progressMirroringProgress:()HealthDaemon;
+ (id)hk_finishedDiscreteProgressWithTotalUnitCount:()HealthDaemon;
@end

@implementation NSProgress(HealthDaemon)

+ (_HDMirroredProgress)hd_progressMirroringProgress:()HealthDaemon
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [_HDMirroredProgress alloc];
  id v6 = v4;
  if (v5)
  {
    v14.receiver = v5;
    v14.super_class = (Class)_HDMirroredProgress;
    v7 = (_HDMirroredProgress *)objc_msgSendSuper2(&v14, sel_initWithParent_userInfo_, 0, 0);
    v5 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_originalProgress, a3);
      os_unfair_lock_lock(&v5->_lock);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v8 = +[_HDMirroredProgress _KVOKeyPaths]();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            [(NSProgress *)v5->_originalProgress addObserver:v5 forKeyPath:*(void *)(*((void *)&v15 + 1) + 8 * i) options:0 context:_HDProgressMirrorObserverContext];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }

      os_unfair_lock_unlock(&v5->_lock);
      -[_HDMirroredProgress _update]((uint64_t)v5);
    }
  }

  return v5;
}

+ (id)hk_finishedDiscreteProgressWithTotalUnitCount:()HealthDaemon
{
  v0 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:");
  objc_msgSend(v0, "setCompletedUnitCount:", objc_msgSend(v0, "totalUnitCount"));

  return v0;
}

@end