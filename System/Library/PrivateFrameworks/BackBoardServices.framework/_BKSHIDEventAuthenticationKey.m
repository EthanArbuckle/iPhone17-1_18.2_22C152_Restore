@interface _BKSHIDEventAuthenticationKey
- (uint64_t)_context;
@end

@implementation _BKSHIDEventAuthenticationKey

- (void).cxx_destruct
{
}

- (uint64_t)_context
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (atomic_exchange((atomic_uchar *volatile)(a1 + 400), 1u)) {
    return a1 + 16;
  }
  if (![*(id *)(a1 + 8) length])
  {
    v4 = [NSString stringWithFormat:@"truncated data"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(sel__context);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      int v8 = 138544642;
      v9 = v5;
      __int16 v10 = 2114;
      v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      v15 = @"_BKSHIDEventAuthenticationKey.m";
      __int16 v16 = 1024;
      int v17 = 49;
      __int16 v18 = 2114;
      v19 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA47C64);
  }
  uint64_t v2 = a1 + 16;
  CCHmacInit((CCHmacContext *)(a1 + 16), 2u, (const void *)[*(id *)(a1 + 8) bytes], objc_msgSend(*(id *)(a1 + 8), "length"));
  return v2;
}

@end