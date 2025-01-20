@interface NSDate(_DKDeduping)
- (id)dedup;
- (id)dk_dedup;
@end

@implementation NSDate(_DKDeduping)

- (id)dk_dedup
{
  if (dk_dedup_onceToken_8 != -1) {
    dispatch_once(&dk_dedup_onceToken_8, &__block_literal_global_12);
  }
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timeIntervalSinceReferenceDate];
  id v4 = [v2 dateWithTimeIntervalSinceReferenceDate:floor(v3)];
  os_unfair_lock_lock((os_unfair_lock_t)&dk_dedup_lock_10);
  v5 = [(id)dk_dedup_set_9 member:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    if ((unint64_t)[(id)dk_dedup_set_9 count] >= 0x80)
    {
      v8 = [MEMORY[0x1E4F1CA80] set];
      v9 = (void *)dk_dedup_set_9;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __31__NSDate__DKDeduping__dk_dedup__block_invoke_2;
      v12[3] = &unk_1E560FC68;
      id v13 = v8;
      id v10 = v8;
      [v9 enumerateObjectsUsingBlock:v12];
      [(id)dk_dedup_set_9 minusSet:v10];
    }
    id v7 = v4;
    if ((unint64_t)[(id)dk_dedup_set_9 count] <= 0x7F)
    {
      [(id)dk_dedup_set_9 addObject:v4];
      id v7 = v4;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dk_dedup_lock_10);

  return v7;
}

- (id)dedup
{
  v2 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    [(NSString(_DKDeduping) *)v2 dedup];
  }

  id v10 = objc_msgSend(a1, "dk_dedup");
  return v10;
}

@end