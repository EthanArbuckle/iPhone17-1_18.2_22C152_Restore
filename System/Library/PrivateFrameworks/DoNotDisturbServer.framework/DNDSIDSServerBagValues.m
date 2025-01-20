@interface DNDSIDSServerBagValues
+ (BOOL)resolvedActivityUpdateDisabled;
+ (id)_numberForKey:(id)a3;
+ (unint64_t)resolvedActivityUpdateCoalescingSeconds;
+ (unint64_t)resolvedScheduledActivityUpdateFuzzMilliseconds;
+ (void)resolvedScheduledActivityUpdateFuzzMilliseconds;
@end

@implementation DNDSIDSServerBagValues

+ (id)_numberForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F6AB80];
  id v4 = a3;
  v5 = [v3 sharedInstanceForBagType:1];
  v6 = [v5 objectForKey:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (unint64_t)resolvedScheduledActivityUpdateFuzzMilliseconds
{
  v3 = [a1 _numberForKey:@"act-update-fuzz-floor"];
  uint64_t v4 = [a1 _numberForKey:@"act-update-fuzz-ceiling"];
  v5 = (void *)v4;
  if (v3)
  {
    uint64_t v6 = 1000 * [v3 unsignedIntValue];
    if (v5)
    {
LABEL_3:
      uint64_t v7 = 1000 * [v5 unsignedIntValue];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 5000;
    if (v4) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 20000;
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[DNDSIDSServerBagValues resolvedScheduledActivityUpdateFuzzMilliseconds];
  }
  unint64_t v8 = arc4random_uniform((v7 - v6) | 1) + v6;

  return v8;
}

+ (BOOL)resolvedActivityUpdateDisabled
{
  v2 = [a1 _numberForKey:@"act-update-disabled"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (unint64_t)resolvedActivityUpdateCoalescingSeconds
{
  v2 = [a1 _numberForKey:@"act-update-coalescing-interval"];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntValue];
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (void)resolvedScheduledActivityUpdateFuzzMilliseconds
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithUnsignedInt:a1];
  unint64_t v4 = [NSNumber numberWithUnsignedInt:a2];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  unint64_t v8 = v4;
  _os_log_debug_impl(&dword_1D3052000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "generating fuzzable %@ - %@ ms", (uint8_t *)&v5, 0x16u);
}

@end