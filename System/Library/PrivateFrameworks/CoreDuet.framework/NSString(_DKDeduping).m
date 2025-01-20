@interface NSString(_DKDeduping)
- (id)dedup;
- (id)dk_dedup;
- (void)dedup;
@end

@implementation NSString(_DKDeduping)

- (id)dk_dedup
{
  if (dk_dedup_onceToken != -1) {
    dispatch_once(&dk_dedup_onceToken, &__block_literal_global_54);
  }
  id v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&dk_dedup_lock);
  v3 = [(id)dk_dedup_set member:v2];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;

    id v2 = v5;
  }
  else if ((unint64_t)[(id)dk_dedup_set count] <= 0x7F)
  {
    [(id)dk_dedup_set addObject:v2];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dk_dedup_lock);

  return v2;
}

- (id)dedup
{
  id v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    [(NSString(_DKDeduping) *)v2 dedup];
  }

  v10 = objc_msgSend(a1, "dk_dedup");
  return v10;
}

- (void)dedup
{
}

@end