@interface AAKeychainManager
+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5;
+ (void)initialize;
+ (void)removePasswordForService:(id)a3 username:(id)a4 accessGroup:(id)a5;
+ (void)setPassword:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6;
@end

@implementation AAKeychainManager

+ (void)initialize
{
  _aa_keychainLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);

  MEMORY[0x1F41817F8]();
}

+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 length] || !objc_msgSend(v8, "length"))
  {
    v17 = 0;
    goto LABEL_23;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  if (v9) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v9);
  }
  CFTypeRef result = 0;
  OSStatus v11 = SecItemCopyMatching(Mutable, &result);
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = result == 0;
  }
  if (v12)
  {
    OSStatus v13 = v11;
    if (v11)
    {
      if (v11 == -25308)
      {
        v14 = _AALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v15 = "SecItemCopyMatching Error: errInteractionNotAllowed - The keychain is inaccessible. It may be locked.";
LABEL_17:
          v18 = v14;
          uint32_t v19 = 2;
LABEL_20:
          _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, v15, buf, v19);
        }
      }
      else
      {
        v14 = _AALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          OSStatus v23 = v13;
          __int16 v24 = 2112;
          id v25 = v7;
          __int16 v26 = 2112;
          id v27 = v8;
          v15 = "SecItemCopyMatching result: %d - keychain item %@ - username %@";
          v18 = v14;
          uint32_t v19 = 28;
          goto LABEL_20;
        }
      }
    }
    else
    {
      v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "SecItemCopyMatching succeeded with empty results";
        goto LABEL_17;
      }
    }

    v17 = 0;
    goto LABEL_22;
  }
  id v16 = [NSString alloc];
  v17 = (void *)[v16 initWithData:result encoding:4];
  CFRelease(result);
LABEL_22:
  CFRelease(Mutable);
LABEL_23:

  return v17;
}

+ (void)setPassword:(id)a3 forServiceName:(id)a4 username:(id)a5 accessGroup:(id)a6
{
  result[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(id)_aa_keychainLock lock];
  if ([v10 length] && objc_msgSend(v9, "length") && objc_msgSend(v11, "length"))
  {
    OSStatus v13 = [v9 dataUsingEncoding:4];
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v11);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v10);
    if (v12) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v12);
    }
    id v16 = [(id)objc_opt_class() passwordForServiceName:v10 username:v11 accessGroup:v12];
    if (!v16)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B570]);
      result[0] = 0;
      OSStatus v23 = v13;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v13);
      OSStatus v17 = SecItemAdd(Mutable, result);
      if (!v17)
      {
LABEL_18:
        CFRelease(Mutable);

        goto LABEL_19;
      }
      OSStatus v18 = v17;
      uint32_t v19 = _AALogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        OSStatus v25 = v18;
        _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "SecItemAdd result: %d", buf, 8u);
      }

      OSStatus v13 = v23;
    }
    if (([v16 isEqualToString:v9] & 1) == 0)
    {
      v20 = CFDictionaryCreateMutable(v14, 0, 0, 0);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3BD38], v13);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B570]);
      OSStatus v21 = SecItemUpdate(Mutable, v20);
      if (v20) {
        CFRelease(v20);
      }
      if (v21)
      {
        v22 = _AALogSystem();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(result[0]) = 67109120;
          HIDWORD(result[0]) = v21;
          _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "SecItemUpdate result: %d", (uint8_t *)result, 8u);
        }
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  [(id)_aa_keychainLock unlock];
}

+ (void)removePasswordForService:(id)a3 username:(id)a4 accessGroup:(id)a5
{
  id value = a3;
  id v7 = a4;
  id v8 = a5;
  [(id)_aa_keychainLock lock];
  if ([value length] && objc_msgSend(v7, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v7);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], value);
    if (v8) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v8);
    }
    SecItemDelete(Mutable);
    CFRelease(Mutable);
  }
  [(id)_aa_keychainLock unlock];
}

@end