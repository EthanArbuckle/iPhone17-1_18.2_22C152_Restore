@interface CSDecodeObject
@end

@implementation CSDecodeObject

void ___CSDecodeObject_block_invoke_4(uint64_t a1, const char *a2, uint64_t a3, long long *a4)
{
  v9 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u);
  uint64_t v6 = *(void *)(a1 + 32);
  long long v10 = *a4;
  uint64_t v11 = *((void *)a4 + 2);
  v7 = _CSDecodeObject(&v10, v6);
  if (v9) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];
  }
}

uint64_t ___CSDecodeObject_block_invoke_3(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  uint64_t v4 = _CSDecodeObject(&v6, v3);
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }

  return MEMORY[0x1F41817F8]();
}

void ___CSDecodeObject_block_invoke(uint64_t a1, const char *a2, uint64_t a3, long long *a4)
{
  BOOL v8 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u);
  uint64_t v6 = *(void *)(a1 + 32);
  long long v9 = *a4;
  uint64_t v10 = *((void *)a4 + 2);
  uint64_t v7 = _CSDecodeObject(&v9, v6);
  if (v7) {
    [*(id *)(a1 + 40) setAttribute:v7 forKey:v8];
  }
}

void ___CSDecodeObject_block_invoke_2(uint64_t a1, const char *a2, uint64_t a3, long long *a4)
{
  uint64_t v6 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u);
  long long v11 = *a4;
  uint64_t v12 = *((void *)a4 + 2);
  if (_MDPlistGetPlistObjectType() == 240)
  {
    long long v11 = *a4;
    uint64_t v12 = *((void *)a4 + 2);
    if (_MDPlistArrayGetCount() == 2)
    {
      long long v11 = *a4;
      uint64_t v12 = *((void *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      unint64_t IntValue = _MDPlistNumberGetIntValue();
      long long v11 = *a4;
      uint64_t v12 = *((void *)a4 + 2);
      _MDPlistArrayGetPlistObjectAtIndex();
      BOOL v8 = _CSDecodeObject(&v10, *(void *)(a1 + 32));
      if (v8)
      {
        long long v9 = [[CSCustomAttributeKey alloc] initWithKeyName:v6 searchable:IntValue & 1 searchableByDefault:(IntValue >> 1) & 1 unique:(IntValue >> 2) & 1 multiValued:(IntValue >> 3) & 1];
        [*(id *)(a1 + 40) setValue:v8 forCustomKey:v9];
      }
    }
  }
}

@end