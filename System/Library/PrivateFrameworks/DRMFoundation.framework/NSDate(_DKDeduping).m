@interface NSDate(_DKDeduping)
- (id)_os_dedup;
@end

@implementation NSDate(_DKDeduping)

- (id)_os_dedup
{
  if (_os_dedup_onceToken_9 != -1) {
    dispatch_once(&_os_dedup_onceToken_9, &__block_literal_global_13);
  }
  v2 = (void *)MEMORY[0x263EFF910];
  [a1 timeIntervalSinceReferenceDate];
  id v4 = [v2 dateWithTimeIntervalSinceReferenceDate:floor(v3)];
  os_unfair_lock_lock((os_unfair_lock_t)&_os_dedup_lock_11);
  v5 = [(id)_os_dedup_set_10 member:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if ((unint64_t)[(id)_os_dedup_set_10 count] >= 0x80)
    {
      v8 = [MEMORY[0x263EFF9C0] set];
      v9 = (void *)_os_dedup_set_10;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __32__NSDate__DKDeduping___os_dedup__block_invoke_2;
      v12[3] = &unk_2649375A0;
      id v13 = v8;
      id v10 = v8;
      [v9 enumerateObjectsUsingBlock:v12];
      [(id)_os_dedup_set_10 minusSet:v10];
    }
    id v7 = v4;
    if ((unint64_t)[(id)_os_dedup_set_10 count] <= 0x7F)
    {
      [(id)_os_dedup_set_10 addObject:v4];
      id v7 = v4;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_dedup_lock_11);

  return v7;
}

@end