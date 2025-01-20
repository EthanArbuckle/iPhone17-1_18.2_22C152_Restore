@interface NSXPCInterface(HealthKit)
- (id)_cachedSetForArrayOfClass:()HealthKit;
- (id)hk_setArrayOfClass:()HealthKit forSelector:argumentIndex:ofReply:;
- (id)hk_setSetOfClass:()HealthKit forSelector:argumentIndex:ofReply:;
@end

@implementation NSXPCInterface(HealthKit)

- (id)hk_setArrayOfClass:()HealthKit forSelector:argumentIndex:ofReply:
{
  v10 = objc_msgSend(a1, "_cachedSetForArrayOfClass:");
  [a1 setClasses:v10 forSelector:a4 argumentIndex:a5 ofReply:a6];

  return v10;
}

- (id)hk_setSetOfClass:()HealthKit forSelector:argumentIndex:ofReply:
{
  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a3, 0);
  [a1 setClasses:v10 forSelector:a4 argumentIndex:a5 ofReply:a6];

  return v10;
}

- (id)_cachedSetForArrayOfClass:()HealthKit
{
  os_unfair_lock_lock((os_unfair_lock_t)&_cachedSetForArrayOfClass__lock);
  v4 = (void *)_cachedSetForArrayOfClass__cache;
  if (!_cachedSetForArrayOfClass__cache)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v6 = (void *)_cachedSetForArrayOfClass__cache;
    _cachedSetForArrayOfClass__cache = v5;

    v4 = (void *)_cachedSetForArrayOfClass__cache;
  }
  v7 = [v4 objectForKey:a3];
  if (!v7)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a3, 0);
    [(id)_cachedSetForArrayOfClass__cache setObject:v7 forKey:a3];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_cachedSetForArrayOfClass__lock);

  return v7;
}

@end