@interface CFPrefsWeakObservers
@end

@implementation CFPrefsWeakObservers

uint64_t __36____CFPrefsWeakObservers_addObject___block_invoke(uint64_t result, int a2, CFTypeRef cf2, unsigned char *a4)
{
  if (cf2)
  {
    uint64_t v5 = result;
    result = CFEqual(*(CFTypeRef *)(result + 32), cf2);
    if (result)
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void *__46____CFPrefsWeakObservers_borrowObjects_count___block_invoke(void *result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void *)(*(void *)(result[4] + 8) + 24) >= result[5])
  {
    *a4 = 1;
  }
  else if (a3)
  {
    v4 = result;
    result = a3;
    *(void *)(v4[6] + 8 * (*(void *)(*(void *)(v4[4] + 8) + 24))++) = result;
  }
  return result;
}

uint64_t __46____CFPrefsWeakObservers_mutableCopyWithZone___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

uint64_t __39____CFPrefsWeakObservers_removeObject___block_invoke(uint64_t result, id *a2, CFTypeRef cf2, unsigned char *a4)
{
  if (cf2)
  {
    uint64_t v6 = result;
    result = CFEqual(*(CFTypeRef *)(result + 32), cf2);
    if (result)
    {
      result = (uint64_t)objc_storeWeak(a2, 0);
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(v6 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

void __42____CFPrefsWeakObservers_debugDescription__block_invoke(uint64_t a1, uint64_t a2, __CFString *a3)
{
  v3 = *(__CFString **)(a1 + 32);
  v4 = @"_";
  if (a3) {
    v4 = a3;
  }
  CFStringAppendFormat(v3, 0, @"%@", v4);
}

@end