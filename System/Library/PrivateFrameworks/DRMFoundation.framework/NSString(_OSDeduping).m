@interface NSString(_OSDeduping)
- (id)_os_dedup;
@end

@implementation NSString(_OSDeduping)

- (id)_os_dedup
{
  if (_os_dedup_onceToken != -1) {
    dispatch_once(&_os_dedup_onceToken, &__block_literal_global);
  }
  id v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_os_dedup_lock);
  v3 = [(id)_os_dedup_set member:v2];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;

    id v2 = v5;
  }
  else
  {
    if ((unint64_t)[(id)_os_dedup_set count] >= 0x80)
    {
      v6 = [MEMORY[0x263EFF9C0] set];
      v7 = (void *)_os_dedup_set;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __34__NSString__OSDeduping___os_dedup__block_invoke_2;
      v10[3] = &unk_2649375A0;
      id v11 = v6;
      id v8 = v6;
      [v7 enumerateObjectsUsingBlock:v10];
      [(id)_os_dedup_set minusSet:v8];
    }
    if ((unint64_t)[(id)_os_dedup_set count] <= 0x7F) {
      [(id)_os_dedup_set addObject:v2];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_dedup_lock);

  return v2;
}

@end