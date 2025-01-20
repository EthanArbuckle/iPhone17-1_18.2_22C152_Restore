@interface NSDate
- (id)dk_localtimeString;
@end

@implementation NSDate

uint64_t __42__NSDate__DKAdditions__timeSinceMidnight___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v1 = timeSinceMidnight__calendar;
  timeSinceMidnight__calendar = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)dk_localtimeString
{
  if (a1)
  {
    v2 = a1;
    if (dk_localtimeString_initialized != -1) {
      dispatch_once(&dk_localtimeString_initialized, &__block_literal_global_52);
    }
    a1 = [(id)dk_localtimeString_formatter stringFromDate:v2];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __44__NSDate__DKSyncLogging__dk_localtimeString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)dk_localtimeString_formatter;
  dk_localtimeString_formatter = (uint64_t)v0;

  [(id)dk_localtimeString_formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS zzz"];
  v2 = (void *)dk_localtimeString_formatter;
  id v3 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v3];
}

void __31__NSDate__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28BD0] set];
  uint64_t v1 = (void *)dk_dedup_set_9;
  dk_dedup_set_9 = v0;

  dk_dedup_lock_10 = 0;
}

void __31__NSDate__DKDeduping__dk_dedup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)objc_msgSend((id)dk_dedup_set_9, "countForObject:") <= 2) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end