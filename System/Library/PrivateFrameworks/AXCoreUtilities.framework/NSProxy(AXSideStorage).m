@interface NSProxy(AXSideStorage)
- (id)_accessibilityValueForKey:()AXSideStorage;
- (id)_axDictionaryQueue;
- (uint64_t)_accessibilityBoolValueForKey:()AXSideStorage;
- (uint64_t)_accessibilityIntegerValueForKey:()AXSideStorage;
- (uint64_t)_accessibilityRemoveValueForKey:()AXSideStorage;
- (uint64_t)_accessibilitySetRetainedValue:()AXSideStorage forKey:;
- (uint64_t)_accessibilityUnsignedIntegerValueForKey:()AXSideStorage;
- (void)_accessibilitySetAssignedValue:()AXSideStorage forKey:;
- (void)_accessibilitySetBoolValue:()AXSideStorage forKey:;
- (void)_accessibilitySetIntegerValue:()AXSideStorage forKey:;
- (void)_accessibilitySetUnsignedIntegerValue:()AXSideStorage forKey:;
- (void)_accessibilitySetValue:()AXSideStorage forKey:storageMode:;
@end

@implementation NSProxy(AXSideStorage)

- (id)_axDictionaryQueue
{
  if (_axDictionaryQueue_onceToken != -1) {
    dispatch_once(&_axDictionaryQueue_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)_axDictionaryQueue__sDictionaryQueue;
  return v0;
}

- (id)_accessibilityValueForKey:()AXSideStorage
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2;
    v17 = __Block_byref_object_dispose__2;
    id v18 = 0;
    v5 = [a1 _axDictionaryQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__NSProxy_AXSideStorage___accessibilityValueForKey___block_invoke;
    v12[3] = &unk_1E5673030;
    v12[4] = a1;
    v12[5] = &v13;
    dispatch_sync(v5, v12);

    id v6 = (id)v14[5];
    objc_sync_enter(v6);
    v7 = [(id)v14[5] objectForKey:v4];
    objc_sync_exit(v6);

    if ([v7 _axIsWrappedPointer])
    {
      id v8 = [v7 nonretainedObjectValue];
    }
    else
    {
      id v8 = v7;
    }
    v10 = v8;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v9 = AXLogValidations();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NSProxy(AXSideStorage) _accessibilityValueForKey:]((uint64_t)a1, v9);
    }

    v10 = 0;
  }

  return v10;
}

- (uint64_t)_accessibilityBoolValueForKey:()AXSideStorage
{
  v1 = objc_msgSend(a1, "_accessibilityValueForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)_accessibilityIntegerValueForKey:()AXSideStorage
{
  v1 = objc_msgSend(a1, "_accessibilityValueForKey:");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (uint64_t)_accessibilityUnsignedIntegerValueForKey:()AXSideStorage
{
  v1 = objc_msgSend(a1, "_accessibilityValueForKey:");
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)_accessibilitySetValue:()AXSideStorage forKey:storageMode:
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    v10 = [a1 _axDictionaryQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NSProxy_AXSideStorage___accessibilitySetValue_forKey_storageMode___block_invoke;
    block[3] = &unk_1E5672F48;
    v21 = &v22;
    block[4] = a1;
    id v11 = v8;
    id v20 = v11;
    dispatch_sync(v10, block);

    v12 = (void *)v23[5];
    if (v11)
    {
      id v13 = v12;
      objc_sync_enter(v13);
      switch(a5)
      {
        case 0:
LABEL_8:
          [(id)v23[5] setObject:v11 forKeyedSubscript:v9];
          break;
        case 1:
          id v18 = (void *)[v11 copy];
          [(id)v23[5] setObject:v18 forKeyedSubscript:v9];

          break;
        case 2:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Swizzling/AXSideStorage_Implementation.m", (void *)0x6F, (uint64_t)"-[NSProxy(AXSideStorage) _accessibilitySetValue:forKey:storageMode:]", @"value is not a wrapper class: %@", v14, v15, v16, (uint64_t)v11);
          }
          goto LABEL_8;
      }
    }
    else
    {
      if (!v12)
      {
LABEL_16:

        _Block_object_dispose(&v22, 8);
        goto LABEL_17;
      }
      id v13 = v12;
      objc_sync_enter(v13);
      [(id)v23[5] removeObjectForKey:v9];
    }
    objc_sync_exit(v13);

    goto LABEL_16;
  }
  v17 = AXLogValidations();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[NSProxy(AXSideStorage) _accessibilitySetValue:forKey:storageMode:]((uint64_t)v8, (uint64_t)a1, v17);
  }

LABEL_17:
}

- (uint64_t)_accessibilitySetRetainedValue:()AXSideStorage forKey:
{
  return [a1 _accessibilitySetValue:a3 forKey:a4 storageMode:0];
}

- (void)_accessibilitySetBoolValue:()AXSideStorage forKey:
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:a3];
  [a1 _accessibilitySetRetainedValue:v8 forKey:v7];
}

- (void)_accessibilitySetIntegerValue:()AXSideStorage forKey:
{
  id v6 = (objc_class *)NSNumber;
  id v7 = a4;
  id v8 = (id)[[v6 alloc] initWithInteger:a3];
  [a1 _accessibilitySetRetainedValue:v8 forKey:v7];
}

- (void)_accessibilitySetUnsignedIntegerValue:()AXSideStorage forKey:
{
  id v6 = (objc_class *)NSNumber;
  id v7 = a4;
  id v8 = (id)[[v6 alloc] initWithUnsignedInteger:a3];
  [a1 _accessibilitySetRetainedValue:v8 forKey:v7];
}

- (uint64_t)_accessibilityRemoveValueForKey:()AXSideStorage
{
  return [a1 _accessibilitySetValue:0 forKey:a3 storageMode:1];
}

- (void)_accessibilitySetAssignedValue:()AXSideStorage forKey:
{
  id v6 = (void *)MEMORY[0x1E4F29238];
  id v7 = a4;
  id v8 = [v6 valueWithNonretainedObject:a3];
  [v8 _axSetIsWrappedPointer:1];
  [a1 _accessibilitySetValue:v8 forKey:v7 storageMode:2];
}

- (void)_accessibilityValueForKey:()AXSideStorage .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = v4;
  _os_log_error_impl(&dword_18FC6C000, a2, OS_LOG_TYPE_ERROR, "AX Storage Error: Attempting to access a value with a nil key. Self:%{public}@.\nBacktrace:\n%{public}@.", (uint8_t *)&v5, 0x16u);
}

- (void)_accessibilitySetValue:()AXSideStorage forKey:storageMode:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_18FC6C000, a3, OS_LOG_TYPE_ERROR, "AX Storage Error: Attempting to store a value with a nil key. Value:%p.\nSelf:%{public}@.\nBacktrace:\n%{public}@.", (uint8_t *)&v7, 0x20u);
}

@end