@interface HMHome(PredictionCaching)
- (id)cachedPredictions;
- (void)setCachedPredictions:()PredictionCaching;
@end

@implementation HMHome(PredictionCaching)

- (id)cachedPredictions
{
  os_unfair_lock_lock((os_unfair_lock_t)&_cacheLock);
  objc_opt_class();
  v4 = objc_getAssociatedObject(a1, a2);
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&_cacheLock);
  return v6;
}

- (void)setCachedPredictions:()PredictionCaching
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_cacheLock);
  objc_setAssociatedObject(a1, sel_cachedPredictions, v4, (void *)1);

  os_unfair_lock_unlock((os_unfair_lock_t)&_cacheLock);
}

@end