void sub_19C682264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSMapTable *FBSSettingForExtensionSelector(void *a1, const void *a2)
{
  if (!a2)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selector != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSSettingForExtensionSelector_cold_1();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!a1)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSSettingForExtensionSelector_cold_2();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  os_unfair_lock_lock(&__ExtensionLock);
  if (__SelectorsToSettingsMap)
  {
    NSMapGet((NSMapTable *)__SelectorsToSettingsMap, (const void *)[a1 _baseClass]);
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4) {
      v4 = (NSMapTable *)NSMapGet(v4, a2);
    }
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(&__ExtensionLock);

  return v6;
}

void FBSRealizeSubclassExtension(objc_class *a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSRealizeSubclassExtension_cold_1();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
  }
  Class Superclass = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
  if ((Class)objc_opt_class() == Superclass) {
    goto LABEL_51;
  }
  do
  {
    v2 = objc_getAssociatedObject(Superclass, (const void *)_FBSRealizedKey);
    BOOL v3 = v2 == 0;

    if (!v3) {
      break;
    }
    unsigned int outCount = 0;
    v49 = 0;
    Class = object_getClass(Superclass);
    id v5 = 0;
    v49 = class_copyMethodList(Class, &outCount);
    if (!v49 || !outCount) {
      goto LABEL_50;
    }
    unint64_t v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v49[v6];
      if (method_getImplementation(v10) == (IMP)MEMORY[0x1E4FBA8C8]) {
        goto LABEL_28;
      }
      name = (char *)method_getDescription(v10)->name;
      if (name == sel_subclassExtension)
      {
        uint64_t v15 = [(objc_class *)Superclass subclassExtension];
        if (!v15) {
          goto LABEL_28;
        }
        v52[0] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
        goto LABEL_27;
      }
      if (name == sel_subclassExtensions)
      {
        uint64_t v16 = [(objc_class *)Superclass subclassExtensions];
LABEL_27:
        v17 = (void *)v16;

        v9 = v17;
        goto LABEL_28;
      }
      if (name == sel_immutableSubclass)
      {
        v7 = (void *)[(objc_class *)Superclass immutableSubclass];
        if (v7
          && [v7 isSubclassOfClass:[objc_class _mutableClass](Superclass, "_mutableClass")])
        {
          v26 = NSString;
          v27 = NSStringFromClass(Superclass);
          v28 = [v26 stringWithFormat:@"%@ is not immutable", v27];

          v29 = MEMORY[0x1E4F14500];
          id v30 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            [NSString stringWithUTF8String:"void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)"];
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_3();
          }

          [v28 UTF8String];
          _bs_set_crash_log_message();
        }
      }
      else if (name == sel_mutableSubclass)
      {
        v8 = (void *)[(objc_class *)Superclass mutableSubclass];
        if (!v8)
        {
          v21 = NSString;
          v22 = NSStringFromClass(Superclass);
          v23 = [v21 stringWithFormat:@"+[%@ mutableSubclass] returned nil", v22];

          v24 = MEMORY[0x1E4F14500];
          id v25 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            [NSString stringWithUTF8String:"void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)"];
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_5();
          }

          [v23 UTF8String];
          _bs_set_crash_log_message();
        }
        if ([v8 isSubclassOfClass:[objc_class _mutableClass](Superclass, "_mutableClass")] == NO)
        {
          v32 = NSString;
          v33 = NSStringFromClass(Superclass);
          v34 = [v32 stringWithFormat:@"%@ is not mutable", v33];

          v35 = MEMORY[0x1E4F14500];
          id v36 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            [NSString stringWithUTF8String:"void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)"];
            objc_claimAutoreleasedReturnValue();
            FBSRealizeSubclassExtension_cold_7();
          }

          [v34 UTF8String];
          _bs_set_crash_log_message();
        }
      }
      else if (name == sel_settingForProperty_ {
             || name == sel_allSettings
      }
             || name == sel_allSettingsFromProtocol_
             || name == sel_allSettingsFromExtension_)
      {
        v39 = NSString;
        v40 = NSStringFromSelector(name);
        v41 = [v39 stringWithFormat:@"+[FBSSettings %@] may not be overridden.", v40];

        v42 = MEMORY[0x1E4F14500];
        id v43 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          [NSString stringWithUTF8String:"void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)"];
          objc_claimAutoreleasedReturnValue();
          FBSRealizeSubclassExtension_cold_9();
        }

        [v41 UTF8String];
        _bs_set_crash_log_message();
      }
LABEL_28:
      ++v6;
    }
    while (v6 < outCount);
    if (v7 && v8 && v7 != v8)
    {
      [v7 _setCounterpartClass:v8];
      [v8 _setCounterpartClass:v7];
    }
    if (v9)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v5 = v9;
      uint64_t v18 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v5);
            }
            FBSRealizeSettingsExtension((uint64_t)Superclass, *(void **)(*((void *)&v45 + 1) + 8 * i));
          }
          uint64_t v18 = [v5 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v18);
      }
    }
    else
    {
      id v5 = 0;
    }
LABEL_50:
    objc_setAssociatedObject(Superclass, (const void *)_FBSRealizedKey, &unk_1EED3FAD0, 0);
    Class Superclass = class_getSuperclass(Superclass);
    fbs_free((void **)&v49);
  }
  while (Superclass != (Class)objc_opt_class());
LABEL_51:
  os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
}

void sub_19C6852FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

uint64_t FBSDisplayTypeIsValid(unint64_t a1)
{
  return (a1 < 9) & (0x1FBu >> a1);
}

BOOL FBSDisplayOverscanCompensationIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL FBSDisplayConnectionTypeIsValid(unint64_t a1)
{
  return a1 < 4;
}

id FBLogAppDataStore()
{
  if (FBLogAppDataStore_onceToken != -1) {
    dispatch_once(&FBLogAppDataStore_onceToken, &__block_literal_global_7_0);
  }
  v0 = (void *)FBLogAppDataStore___logObj;

  return v0;
}

uint64_t ___realizeSettingsExtension_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 valueForSetting:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

id _lock_getDefaultExtensions(void *a1, void *a2)
{
  id v3 = a1;
  if (objc_opt_class() == a2)
  {
    v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }
  else
  {
    v4 = objc_getAssociatedObject(a2, (const void *)_FBSDefaultExtensionsKey);
    if (!v4)
    {
      Class Superclass = class_getSuperclass((Class)a2);
      uint64_t v6 = _lock_getDefaultExtensions(v3, Superclass);
      if (!v6)
      {
        uint64_t v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensions != nil"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          _lock_getDefaultExtensions_cold_1((uint64_t)v16);
        }
        [v16 UTF8String];
        _bs_set_crash_log_message();
      }
      v4 = (void *)v6;
      unsigned int outCount = 0;
      v17 = class_copyMethodList((Class)a2, &outCount);
      if (outCount)
      {
        uint64_t v7 = 0;
        while (1)
        {
          v8 = v17[v7];
          if (method_getName(v8) == sel_defaultExtensions) {
            break;
          }
          if (++v7 >= (unint64_t)outCount) {
            goto LABEL_14;
          }
        }
        IMP Implementation = method_getImplementation(v8);
        v10 = (void *)MEMORY[0x1E4F1CAA0];
        v11 = ((void (*)(id, char *))Implementation)(v3, sel_defaultExtensions);
        v12 = [v10 orderedSetWithArray:v11];

        if ([v12 count] && ![v12 isSubsetOfOrderedSet:v4])
        {
          v13 = (void *)[v4 mutableCopy];
          [v13 unionOrderedSet:v12];
          uint64_t v14 = [v13 copy];

          v4 = (void *)v14;
        }
      }
LABEL_14:
      objc_setAssociatedObject(a2, (const void *)_FBSDefaultExtensionsKey, v4, (void *)1);
      fbs_free((void **)&v17);
    }
  }

  return v4;
}

void sub_19C687384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

void _flushBulkMethods(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 24))
  {
    v2 = FBLogSceneExtension();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3 && *(_DWORD *)(a1 + 24))
    {
      uint64_t v4 = 4;
      do
      {
        id v5 = FBLogSceneExtension();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 8 * v4));
          v8 = NSStringFromClass(*(Class *)(a1 + 8));
          v9 = NSStringFromClass(*(Class *)a1);
          *(_DWORD *)buf = 138412802;
          id v25 = v7;
          __int16 v26 = 2112;
          id v27 = v8;
          __int16 v28 = 2112;
          v29 = v9;
          _os_log_debug_impl(&dword_19C680000, v5, OS_LOG_TYPE_DEBUG, "registering method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);
        }
        unint64_t v6 = v4 - 3;
        ++v4;
      }
      while (v6 < *(unsigned int *)(a1 + 24));
    }
    unsigned int v23 = 0;
    v10 = (SEL *)class_addMethodsBulk();
    v22 = v10;
    *(_DWORD *)(a1 + 24) = 0;
    if (v10)
    {
      if (v23)
      {
        for (unint64_t i = 0; i < v23; ++i)
        {
          uint64_t v18 = FBLogSceneExtension();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(v22[i]);
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(*(Class *)(a1 + 8));
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            v21 = NSStringFromClass(*(Class *)a1);
            *(_DWORD *)buf = 138412802;
            id v25 = v19;
            __int16 v26 = 2112;
            id v27 = v20;
            __int16 v28 = 2112;
            v29 = v21;
            _os_log_error_impl(&dword_19C680000, v18, OS_LOG_TYPE_ERROR, "unable to register method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);
          }
        }
      }
      v11 = NSString;
      uint64_t v12 = *(void *)(a1 + 16);
      v13 = NSStringFromClass(*(Class *)a1);
      uint64_t v14 = [v11 stringWithFormat:@"unable to add some methods from <%@> to %@", v12, v13];

      uint64_t v15 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [NSString stringWithUTF8String:"void _flushBulkMethods(struct BulkMethodContext *)"];
        objc_claimAutoreleasedReturnValue();
        _flushBulkMethods_cold_2();
      }

      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    fbs_free((void **)&v22);
  }
}

void sub_19C68778C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  fbs_free((void **)va);
  _Unwind_Resume(a1);
}

void fbs_free(void **a1)
{
}

void sub_19C687D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___realizeSettingsExtension_block_invoke_252(uint64_t a1, void *a2)
{
  return [a2 valueForSetting:*(void *)(a1 + 32)];
}

void ___realizeSettingsExtension_block_invoke_277(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!*(void *)(a1 + 48) || (objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[FBSSetting specialCollection](*(os_unfair_lock_s **)(a1 + 32)) == (os_unfair_lock_s *)0x7FFFFFFFFFFFFFFFLL
        && [v6 count])
      {
        if (objc_opt_respondsToSelector()) {
          [v6 firstObject];
        }
        else {
          [v6 anyObject];
        }
        objc_claimAutoreleasedReturnValue();
        objc_opt_respondsToSelector();
        BSSettingFlagForBool();
      }
      BSSettingFlagIsYes();
    }
    uint64_t v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = NSStringFromClass(*(Class *)(a1 + 48));
    v11 = [v7 stringWithFormat:@"value of class %@ is not of expected class %@", v9, v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      ___realizeSettingsExtension_block_invoke_277_cold_2();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, 0, *(void **)(a1 + 32));
}

void FBSSettingsSetValueForSetting(uint64_t a1, void *a2, void *a3)
{
}

id FBSGetDefaultExtensions(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&FBSGetDefaultExtensions___lock);
  Class Class = object_getClass(v1);
  BOOL v3 = _lock_getDefaultExtensions(v1, Class);

  os_unfair_lock_unlock((os_unfair_lock_t)&FBSGetDefaultExtensions___lock);

  return v3;
}

id FBLogSceneClient()
{
  if (FBLogSceneClient_onceToken != -1) {
    dispatch_once(&FBLogSceneClient_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)FBLogSceneClient___logObj;

  return v0;
}

id FBSProcessPrettyDescription(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_6;
  }
  v2 = [v1 identity];
  BOOL v3 = [v1 handle];
  id v4 = v3;
  if (!v2)
  {
    if (v3)
    {
LABEL_8:
      uint64_t v7 = NSString;
      v2 = [v4 name];
      v8 = v2;
      if (!v2)
      {
        v8 = [v4 bundleIdentifier];
      }
      v9 = [v7 stringWithFormat:@"%@:%d", v8, [v4 pid]];
      if (!v2) {

      }
      goto LABEL_15;
    }
LABEL_6:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (id v4 = v1) == 0)
    {
      v9 = [v1 description];
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  id v5 = NSString;
  if (v3) {
    uint64_t v6 = [v3 pid];
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  v9 = [v5 stringWithFormat:@"%@:%d", v2, v6];
LABEL_15:

LABEL_16:

  return v9;
}

void FBSRealizeSceneExtension(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSRealizeSceneExtension_cold_1();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  if (([a1 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@ is not a FBSSceneExtension", a1];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSRealizeSceneExtension_cold_3();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  if (objc_opt_class() == a1)
  {
    id v16 = [NSString stringWithFormat:@"FBSSceneExtension should not be realized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSRealizeSceneExtension_cold_2();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v2 = [a1 settingsExtensions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    while (1)
    {
      if (*(void *)v27 != v5) {
        objc_enumerationMutation(v2);
      }
      if (!--v4)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [a1 clientSettingsExtensions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      if (!--v8)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v31 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [a1 transitionContextExtensions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      if (!--v12)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v30 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __FBSRealizeSceneExtension_block_invoke;
  v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v17[4] = a1;
  os_unfair_lock_lock(&__ExtensionLock);
  __FBSRealizeSceneExtension_block_invoke((uint64_t)v17);
  os_unfair_lock_unlock(&__ExtensionLock);
}

void __FBSRealizeSceneExtension_block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = (void *)__SceneExtensions;
  if (!__SceneExtensions)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)__SceneExtensions;
    __SceneExtensions = v3;

    v2 = (void *)__SceneExtensions;
  }
  if (([v2 containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x19F398F90]();
    [(id)__SceneExtensions addObject:*(void *)(a1 + 32)];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = [*(id *)(a1 + 32) settingsExtensions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          _realizeSettingsExtension();
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v8);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v11 = [*(id *)(a1 + 32) clientSettingsExtensions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_opt_class();
          _realizeSettingsExtension();
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v13);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    id v16 = [*(id *)(a1 + 32) transitionContextExtensions];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_opt_class();
          _realizeSettingsExtension();
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v18);
    }
  }
}

void FBSRealizeSettingsExtension(uint64_t a1, void *a2)
{
  if ([a2 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"![extension isSubclassOfClass:[FBSDerivedSettingsExtension class]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSRealizeSettingsExtension_cold_1();
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
  }
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __FBSRealizeSettingsExtension_block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0lu32l8u40l8;
    v5[4] = a1;
    v5[5] = a2;
    os_unfair_lock_lock(&__ExtensionLock);
    __FBSRealizeSettingsExtension_block_invoke((uint64_t)v5);
    os_unfair_lock_unlock(&__ExtensionLock);
  }
}

void _realizeSettingsExtension()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  aClass Class = v1;
  v2 = (objc_class *)v0;
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&__ExtensionLock);
  v165 = v2;
  Class cls = (Class)[(objc_class *)v2 _baseClass];
  v155 = [__SettingsToExtensionsMap objectForKey:];
  if (([v155 containsObject:aClass] & 1) == 0)
  {
    if (!cls)
    {
      v129 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"baseClass != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _realizeSettingsExtension_cold_1();
      }
      [v129 UTF8String];
      _bs_set_crash_log_message();
    }
    if (([(objc_class *)cls isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      v130 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[baseClass isSubclassOfClass:[FBSSettings class]]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _realizeSettingsExtension_cold_33();
      }
      [v130 UTF8String];
      _bs_set_crash_log_message();
    }
    if (([(objc_class *)aClass isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      v131 = [NSString stringWithFormat:@"%@ is not a valid FBSSettingsExtension", aClass];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _realizeSettingsExtension_cold_32();
      }
      [v131 UTF8String];
      _bs_set_crash_log_message();
    }
    int v173 = [(objc_class *)aClass isSubclassOfClass:objc_opt_class()];
    if (v173)
    {
      if (cls == v2)
      {
        uint64_t v3 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != baseClass"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          _realizeSettingsExtension_cold_2();
        }
        [v3 UTF8String];
        _bs_set_crash_log_message();
      }
    }
    else if (cls != v2)
    {
      v132 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass == baseClass"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _realizeSettingsExtension_cold_31();
      }
      [v132 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!__SettingsToExtensionsMap)
    {
      uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v5 = (void *)__SettingsToExtensionsMap;
      __SettingsToExtensionsMap = v4;

      uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v7 = (void *)__SelectorsToSettingsMap;
      __SelectorsToSettingsMap = v6;

      uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v9 = (void *)__LegacySettingsToSettingsMap;
      __LegacySettingsToSettingsMap = v8;
    }
    uint64_t v10 = v155;
    if (!v155)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
      [(id)__SettingsToExtensionsMap setObject:v10 forKey:cls];
    }
    v155 = v10;
    [v10 addObject:aClass];
    if (v173) {
      Class v11 = v2;
    }
    else {
      Class v11 = cls;
    }
    Class v151 = v11;
    uint64_t v12 = [__SelectorsToSettingsMap objectForKey:];
    uint64_t v13 = [v12 copy];

    table = (NSMapTable *)v13;
    if (!v13) {
      table = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:258 valueOptions:0 capacity:32];
    }
    uint64_t v14 = [(id)__LegacySettingsToSettingsMap objectForKey:cls];
    uint64_t v15 = [v14 copy];

    v156 = (NSMapTable *)v15;
    if (!v15) {
      v156 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:32];
    }
    id v16 = FBLogSceneExtension();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(aClass);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(cls);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_19C680000, v16, OS_LOG_TYPE_DEFAULT, "Realizing settings extension %{public}@ on %{public}@", buf, 0x16u);
    }
    uint64_t v19 = [(objc_class *)aClass BSObjCProtocol];
    v153 = v19;
    if (v19)
    {
      obj = [v19 name];
      uint64_t v20 = _gatherProperties(v153);
      long long v21 = _gatherMethods(v153);
      v166 = (void *)[v21 mutableCopy];

      protocol = [v153 protocol];
      if (protocol) {
        class_addProtocol(cls, protocol);
      }
      bzero(&buf[16], 0xC10uLL);
      *(void *)buf = cls;
      *(void *)&buf[8] = aClass;
      objc_storeStrong((id *)&buf[16], obj);
      long long v204 = 0u;
      long long v203 = 0u;
      long long v202 = 0u;
      long long v201 = 0u;
      id v158 = v20;
      uint64_t v161 = [v158 countByEnumeratingWithState:&v201 objects:v210 count:16];
      if (v161)
      {
        uint64_t v160 = *(void *)v202;
        do
        {
          uint64_t v169 = 0;
          do
          {
            if (*(void *)v202 != v160) {
              objc_enumerationMutation(v158);
            }
            id v22 = *(id *)(*((void *)&v201 + 1) + 8 * v169);
            long long v23 = v22;
            if (v173)
            {
              uint64_t v24 = [v22 copyAsReadWrite];

              long long v23 = (void *)v24;
            }
            else if (([v22 isReadWrite] & 1) == 0)
            {
              v119 = [NSString stringWithFormat:@"property is not readwrite: %@", v23];
              v120 = MEMORY[0x1E4F14500];
              id v121 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
              {
                [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_30();
              }

              [v119 UTF8String];
              _bs_set_crash_log_message();
            }
            int v25 = [v23 isRequired];
            char v163 = [v23 isCopy];
            int v162 = [v23 isWeak];
            if ((v162 & v25) == 1)
            {
              v97 = [NSString stringWithFormat:@"only @optional properties can be weak: %@", v23];
              v98 = MEMORY[0x1E4F14500];
              id v99 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_4();
              }

              [v97 UTF8String];
              _bs_set_crash_log_message();
            }
            aSelectorName = [v23 name];
            long long v26 = [v23 value];
            int v27 = [v26 type];
            v170 = v26;
            int v164 = [v26 isFloatingPoint];
            if (v173)
            {
              long long v28 = [v23 customAttributeForKey:@"#"];
              long long v29 = v28;
              if (v28)
              {
                uint64_t v30 = [v28 integerValue];
                if (!v30)
                {
                  v122 = [NSString stringWithFormat:@"could not convert \"%@\" to an integer", v29];
                  v123 = MEMORY[0x1E4F14500];
                  id v124 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
                  {
                    [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_28();
                  }

                  [v122 UTF8String];
                  _bs_set_crash_log_message();
                }
              }
              else
              {
                uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            else
            {
              uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v27 > 0x5Du)
            {
              if (v27 == 98)
              {
                v100 = [NSString stringWithFormat:@"bitfields are not supported"];
                v101 = MEMORY[0x1E4F14500];
                id v102 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_20();
                }

                [v100 UTF8String];
                _bs_set_crash_log_message();
              }
              if (v27 == 94)
              {
                v110 = [NSString stringWithFormat:@"pointers are not supported"];
                v111 = MEMORY[0x1E4F14500];
                id v112 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_26();
                }

                [v110 UTF8String];
                _bs_set_crash_log_message();
              }
            }
            else
            {
              if (v27 == 91)
              {
                v103 = [NSString stringWithFormat:@"C arrays are not supported"];
                v104 = MEMORY[0x1E4F14500];
                id v105 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_22();
                }

                [v103 UTF8String];
                _bs_set_crash_log_message();
              }
              if (v27 == 40)
              {
                v106 = [NSString stringWithFormat:@"unions are not supported"];
                v107 = MEMORY[0x1E4F14500];
                id v108 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_24();
                }

                [v106 UTF8String];
                _bs_set_crash_log_message();
              }
            }
            if ((v173 & 1) == 0
              && [(NSString *)aSelectorName isEqualToString:@"displayConfigurationRequest"])
            {
              if (NSClassFromString(&cfstr_Uiresponder.isa))
              {
                long long v31 = FBLogSceneExtension();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v206 = 138412290;
                  v207 = obj;
                  _os_log_debug_impl(&dword_19C680000, v31, OS_LOG_TYPE_DEBUG, "Skipping property \"displayConfigurationRequest\" from <%@> because it belongs to <UIApplicationSceneClientSettings>", v206, 0xCu);
                }
LABEL_54:

                long long v32 = [v23 getter];
                [v166 removeObject:v32];

                uint64_t v33 = [v23 setter];
                [v166 removeObject:v33];
                goto LABEL_162;
              }
              v34 = FBLogSceneExtension();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v206 = 138412290;
                v207 = obj;
                _os_log_error_impl(&dword_19C680000, v34, OS_LOG_TYPE_ERROR, "Property \"displayConfigurationRequest\" from <%@> is being defined in a process that does not link UIKit. This probably won't behave correctly.", v206, 0xCu);
              }
            }
            if (v27 == 64)
            {
              v167 = (void *)[v26 objectClass];
              if (v25)
              {
                if (v167) {
                  int v35 = 0;
                }
                else {
                  int v35 = v173;
                }
                if (v35 == 1)
                {
                  uint64_t v36 = [v26 objectProtocols];
                  int v37 = [v36 containsObject:&unk_1EED550E0];

                  if (!v37) {
                    goto LABEL_68;
                  }
                  v167 = objc_opt_class();
                  v38 = FBLogSceneExtension();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v206 = 138412546;
                    v207 = aSelectorName;
                    __int16 v208 = 2112;
                    v209 = obj;
                    _os_log_debug_impl(&dword_19C680000, v38, OS_LOG_TYPE_DEBUG, "Mapping property \"%@\" in <%@> to BSCanonicalOrientationMapResolver", v206, 0x16u);
                  }

                  if (!v167)
                  {
LABEL_68:
                    long long v31 = FBLogSceneExtension();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v206 = 138543618;
                      v207 = aSelectorName;
                      __int16 v208 = 2114;
                      v209 = obj;
                      _os_log_impl(&dword_19C680000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring object property \"%{public}@\" in <%{public}@> because it has no defined class.", v206, 0x16u);
                    }
                    goto LABEL_54;
                  }
                }
                else if (!v167)
                {
                  v126 = [NSString stringWithFormat:@"Object property \"%@\" in <%@> has an unknown class.", aSelectorName, obj];
                  v127 = MEMORY[0x1E4F14500];
                  id v128 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                  {
                    [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_18();
                  }

                  [v126 UTF8String];
                  _bs_set_crash_log_message();
                }
                BOOL v39 = v167 == objc_opt_class()
                   || v167 == objc_opt_class()
                   || v167 == objc_opt_class();
              }
              else
              {
                BOOL v39 = 0;
              }
            }
            else
            {
              BOOL v39 = 0;
              v167 = 0;
            }
            int v159 = _structDisposition(v170);
            uint64_t v40 = +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:]((uint64_t)FBSSetting, aSelectorName, (uint64_t)v165, aClass, v25 ^ 1, v27, v30, v167);
            uint64_t v33 = (void *)v40;
            if ((v25 & v39 & 1) == 0) {
              -[FBSSetting setSpecialCollection:](v40, 0);
            }
            v41 = [v23 getter];
            if (!v41)
            {
              v113 = [NSString stringWithFormat:@"no getter for %@", v23];
              v114 = MEMORY[0x1E4F14500];
              id v115 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_6();
              }

              [v113 UTF8String];
              _bs_set_crash_log_message();
            }
            [v166 removeObjectIdenticalTo:v41];
            v42 = (const void *)[v41 selector];
            id v43 = NSMapGet(table, v42);
            v44 = v43;
            if (v43)
            {
              if (![v43 isEqual:v33])
              {
                v133 = NSString;
                v134 = NSStringFromClass(aClass);
                v135 = [v133 stringWithFormat:@"setting named \"%@\" from \"%@\" already exists as \"%@\"", aSelectorName, v134, v44];

                v136 = MEMORY[0x1E4F14500];
                id v137 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_16();
                }

                [v135 UTF8String];
                _bs_set_crash_log_message();
              }
              id v45 = v44;

              uint64_t v33 = v45;
            }
            else
            {
              long long v46 = [v41 name];
              BOOL v47 = [(NSString *)aSelectorName isEqualToString:v46];

              if (!v47)
              {
                SEL v48 = NSSelectorFromString(aSelectorName);
                if (!v48) {
                  SEL v48 = sel_registerName([(NSString *)aSelectorName UTF8String]);
                }
                NSMapInsert(table, v48, v33);
              }
              NSMapInsert(table, v42, v33);
              if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
                NSMapInsert(v156, (const void *)v30, v33);
              }
            }
            if (v173)
            {
              MethodIMP Implementation = class_getMethodImplementation(v165, (SEL)v42);
              if (MethodImplementation != class_getMethodImplementation(cls, (SEL)v42)) {
                goto LABEL_112;
              }
            }
            else
            {
              v50 = class_getMethodImplementation(aClass, (SEL)v42);
              if (v50 != (void (*)(void))MEMORY[0x1E4FBA8C8]) {
                goto LABEL_106;
              }
            }
            if (v27 == 123)
            {
              uint64_t v51 = [v170 size];
              switch(v159)
              {
                case 3:
                  v52 = v198;
                  v198[0] = MEMORY[0x1E4F143A8];
                  v198[1] = 3221225472;
                  v198[2] = ___realizeSettingsExtension_block_invoke_3;
                  v198[3] = &unk_1E58F4C78;
                  v198[4] = v33;
                  v198[5] = v51;
                  break;
                case 2:
                  v52 = v199;
                  v199[0] = MEMORY[0x1E4F143A8];
                  v199[1] = 3221225472;
                  v199[2] = ___realizeSettingsExtension_block_invoke_2;
                  v199[3] = &unk_1E58F4C50;
                  v199[4] = v33;
                  v199[5] = v51;
                  break;
                case 1:
                  v52 = v200;
                  v200[0] = MEMORY[0x1E4F143A8];
                  v200[1] = 3221225472;
                  v200[2] = ___realizeSettingsExtension_block_invoke;
                  v200[3] = &unk_1E58F4C28;
                  v200[4] = v33;
                  v200[5] = v51;
                  break;
                default:
                  v141 = NSString;
                  v142 = [v170 encoding];
                  v143 = [v141 stringWithFormat:@"Struct property \"%@\" is not a supported format (%@) and must be explicitly synthesized using SYNTHESIZE_STRUCT_PROPERTY()", aSelectorName, v142];

                  v144 = MEMORY[0x1E4F14500];
                  id v145 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
                  {
                    [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                    objc_claimAutoreleasedReturnValue();
                    _realizeSettingsExtension_cold_8();
                  }

                  [v143 UTF8String];
                  _bs_set_crash_log_message();
              }
            }
            else if (v27 == 64)
            {
              v52 = v197;
              v197[0] = MEMORY[0x1E4F143A8];
              v197[1] = 3221225472;
              v197[2] = ___realizeSettingsExtension_block_invoke_252;
              v197[3] = &unk_1E58F4CA0;
              v197[4] = v33;
            }
            else if (v164)
            {
              v52 = v196;
              v196[0] = MEMORY[0x1E4F143A8];
              v196[1] = 3221225472;
              v196[2] = ___realizeSettingsExtension_block_invoke_2_254;
              v196[3] = &unk_1E58F4CC8;
              v196[4] = v33;
            }
            else if (v27 == 35)
            {
              v52 = v194;
              v194[0] = MEMORY[0x1E4F143A8];
              v194[1] = 3221225472;
              v194[2] = ___realizeSettingsExtension_block_invoke_4;
              v194[3] = &unk_1E58F4D18;
              v194[4] = v33;
            }
            else if (v27 == 58)
            {
              v52 = v193;
              v193[0] = MEMORY[0x1E4F143A8];
              v193[1] = 3221225472;
              v193[2] = ___realizeSettingsExtension_block_invoke_5;
              v193[3] = &unk_1E58F4D40;
              v193[4] = v33;
            }
            else if (v27 == 42)
            {
              v52 = v195;
              v195[0] = MEMORY[0x1E4F143A8];
              v195[1] = 3221225472;
              v195[2] = ___realizeSettingsExtension_block_invoke_3_256;
              v195[3] = &unk_1E58F4CF0;
              v195[4] = v33;
            }
            else
            {
              v52 = v192;
              v192[0] = MEMORY[0x1E4F143A8];
              v192[1] = 3221225472;
              v192[2] = ___realizeSettingsExtension_block_invoke_6;
              v192[3] = &unk_1E58F4D68;
              v192[4] = v33;
            }
            v53 = (void *)MEMORY[0x19F3991F0](v52);

            v50 = imp_implementationWithBlock(v53);
LABEL_106:
            char v54 = 0;
            if (v50 && v50 != (void (*)(void))MEMORY[0x1E4FBA8C8])
            {
              id v55 = [v41 encoding];
              v56 = (char *)[v55 UTF8String];

              if (!v173)
              {
                _addBulkMethod((uint64_t)buf, (const char *)v42, v50, v56);
LABEL_112:
                char v54 = 0;
                goto LABEL_113;
              }
              _addMethod(v165, aClass, (SEL)v42, v50, v56, 1);
              v57 = (objc_class *)[(objc_class *)v165 _counterpartClass];
              char v54 = 1;
              if (v57) {
                _addMethod(v57, aClass, (SEL)v42, v50, v56, 1);
              }
            }
LABEL_113:

            v58 = [v23 setter];
            if (!v58)
            {
              v116 = [NSString stringWithFormat:@"no setter for %@", v23];
              v117 = MEMORY[0x1E4F14500];
              id v118 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
              {
                [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                objc_claimAutoreleasedReturnValue();
                _realizeSettingsExtension_cold_10();
              }

              [v116 UTF8String];
              _bs_set_crash_log_message();
            }
            [v166 removeObjectIdenticalTo:v58];
            v59 = (const void *)[v58 selector];
            v60 = NSMapGet(table, v59);
            v61 = v60;
            if (v60)
            {
              if (![v60 isEqual:v33])
              {
                v138 = [NSString stringWithFormat:@"setting named \"%@\" already exists as \"%@\"", aSelectorName, v61];
                v139 = MEMORY[0x1E4F14500];
                id v140 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                  objc_claimAutoreleasedReturnValue();
                  _realizeSettingsExtension_cold_14();
                }

                [v138 UTF8String];
                _bs_set_crash_log_message();
              }
              id v62 = v61;

              uint64_t v33 = v62;
            }
            else
            {
              if (v27 == 123)
              {
                v63 = [(NSString *)aSelectorName stringByAppendingString:@":"];
                SEL v64 = NSSelectorFromString(v63);
                if (!v64) {
                  SEL v64 = sel_registerName([(NSString *)v63 UTF8String]);
                }
                NSMapInsert(table, v64, v33);
              }
              NSMapInsert(table, v59, v33);
            }
            if (!v173)
            {
              v65 = class_getMethodImplementation(aClass, (SEL)v59);
              if (v65 == (void (*)(void))MEMORY[0x1E4FBA8C8])
              {
LABEL_126:
                if (v27 == 123)
                {
                  v66 = [(NSString *)aSelectorName stringByAppendingString:@":"];
                  v67 = NSSelectorFromString(v66);
                  v65 = class_getMethodImplementation(aClass, v67);

                  if (v65 != (void (*)(void))MEMORY[0x1E4FBA8C8])
                  {
                    v68 = 0;
                    goto LABEL_154;
                  }
                  v70 = [v170 encoding];
                  switch(v159)
                  {
                    case 3:
                      v71 = v189;
                      v189[0] = MEMORY[0x1E4F143A8];
                      v189[1] = 3221225472;
                      v189[2] = ___realizeSettingsExtension_block_invoke_3_275;
                      v189[3] = &unk_1E58F4DE0;
                      break;
                    case 2:
                      v71 = v190;
                      v190[0] = MEMORY[0x1E4F143A8];
                      v190[1] = 3221225472;
                      v190[2] = ___realizeSettingsExtension_block_invoke_2_273;
                      v190[3] = &unk_1E58F4DB8;
                      break;
                    case 1:
                      v71 = v191;
                      v191[0] = MEMORY[0x1E4F143A8];
                      v191[1] = 3221225472;
                      v191[2] = ___realizeSettingsExtension_block_invoke_270;
                      v191[3] = &unk_1E58F4D90;
                      break;
                    default:
                      v146 = NSString;
                      v147 = [v170 encoding];
                      v148 = [v146 stringWithFormat:@"Struct property \"%@\" is not a supported format (%@) and must be explicitly synthesized using SYNTHESIZE_STRUCT_PROPERTY()", aSelectorName, v147];

                      v149 = MEMORY[0x1E4F14500];
                      id v150 = MEMORY[0x1E4F14500];
                      if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                      {
                        [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
                        objc_claimAutoreleasedReturnValue();
                        _realizeSettingsExtension_cold_12();
                      }

                      [v148 UTF8String];
                      _bs_set_crash_log_message();
                  }
                  id v72 = v70;
                  v71[4] = v72;
                  v73 = (id *)(v71 + 4);
                  v71[5] = v33;
                  v74 = (id *)(v71 + 5);
                  v68 = (void *)MEMORY[0x19F3991F0](v71);
                }
                else
                {
                  if (v27 == 64)
                  {
                    v184[0] = MEMORY[0x1E4F143A8];
                    v184[1] = 3221225472;
                    v184[2] = ___realizeSettingsExtension_block_invoke_277;
                    v184[3] = &unk_1E58F4E08;
                    v186 = v167;
                    v184[4] = v33;
                    v185 = aSelectorName;
                    char v187 = v163;
                    char v188 = v162;
                    v68 = (void *)MEMORY[0x19F3991F0](v184);

                    v69 = v184;
                  }
                  else if (v27 == 42)
                  {
                    v183[0] = MEMORY[0x1E4F143A8];
                    v183[1] = 3221225472;
                    v183[2] = ___realizeSettingsExtension_block_invoke_290;
                    v183[3] = &unk_1E58F4E30;
                    v183[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v183);
                    v69 = v183;
                  }
                  else if (v164)
                  {
                    v182[0] = MEMORY[0x1E4F143A8];
                    v182[1] = 3221225472;
                    v182[2] = ___realizeSettingsExtension_block_invoke_2_292;
                    v182[3] = &unk_1E58F4E58;
                    v182[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v182);
                    v69 = v182;
                  }
                  else if (v27 == 66)
                  {
                    v179[0] = MEMORY[0x1E4F143A8];
                    v179[1] = 3221225472;
                    v179[2] = ___realizeSettingsExtension_block_invoke_5_298;
                    v179[3] = &unk_1E58F4ED0;
                    v179[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v179);
                    v69 = v179;
                  }
                  else if (v27 == 58)
                  {
                    v180[0] = MEMORY[0x1E4F143A8];
                    v180[1] = 3221225472;
                    v180[2] = ___realizeSettingsExtension_block_invoke_4_296;
                    v180[3] = &unk_1E58F4EA8;
                    v180[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v180);
                    v69 = v180;
                  }
                  else if (v27 == 35)
                  {
                    v181[0] = MEMORY[0x1E4F143A8];
                    v181[1] = 3221225472;
                    v181[2] = ___realizeSettingsExtension_block_invoke_3_294;
                    v181[3] = &unk_1E58F4E80;
                    v181[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v181);
                    v69 = v181;
                  }
                  else
                  {
                    v178[0] = MEMORY[0x1E4F143A8];
                    v178[1] = 3221225472;
                    v178[2] = ___realizeSettingsExtension_block_invoke_6_300;
                    v178[3] = &unk_1E58F4EF8;
                    v178[4] = v33;
                    v68 = (void *)MEMORY[0x19F3991F0](v178);
                    v69 = v178;
                  }
                  id v72 = (id)v69[4];
                }

                if (v68) {
                  v65 = imp_implementationWithBlock(v68);
                }
                else {
                  v65 = (void (*)(void))MEMORY[0x1E4FBA8C8];
                }
LABEL_154:
              }
              if (v65 && v65 != (void (*)(void))MEMORY[0x1E4FBA8C8])
              {
                id v75 = [v58 encoding];
                v76 = (char *)[v75 UTF8String];

                if (v173)
                {
                  _addMethod(v165, aClass, (SEL)v59, v65, v76, 1);
                  v77 = (objc_class *)[(objc_class *)v165 _counterpartClass];
                  if (v77) {
                    _addMethod(v77, aClass, (SEL)v59, v65, v76, 1);
                  }
                }
                else
                {
                  _addBulkMethod((uint64_t)buf, (const char *)v59, v65, v76);
                }
              }
              goto LABEL_161;
            }
            if (v54) {
              goto LABEL_126;
            }
LABEL_161:

LABEL_162:
            ++v169;
          }
          while (v161 != v169);
          uint64_t v78 = [v158 countByEnumeratingWithState:&v201 objects:v210 count:16];
          uint64_t v161 = v78;
        }
        while (v78);
      }

      long long v176 = 0u;
      long long v177 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      id v79 = v166;
      uint64_t v80 = [v79 countByEnumeratingWithState:&v174 objects:v205 count:16];
      if (v80)
      {
        uint64_t v81 = *(void *)v175;
        do
        {
          for (uint64_t i = 0; i != v80; ++i)
          {
            if (*(void *)v175 != v81) {
              objc_enumerationMutation(v79);
            }
            v83 = *(void **)(*((void *)&v174 + 1) + 8 * i);
            InstanceMethod = class_getInstanceMethod(aClass, (SEL)[v83 selector]);
            v85 = InstanceMethod;
            if (InstanceMethod)
            {
              Name = method_getName(InstanceMethod);
              IMP Implementation = method_getImplementation(v85);
              TypeEncoding = (char *)method_getTypeEncoding(v85);
              _addBulkMethod((uint64_t)buf, Name, Implementation, TypeEncoding);
            }
            else
            {
              v89 = FBLogSceneExtension();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                v90 = [v83 name];
                NSStringFromClass(aClass);
                v91 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v206 = 138412546;
                v207 = v90;
                __int16 v208 = 2112;
                v209 = v91;
                _os_log_error_impl(&dword_19C680000, v89, OS_LOG_TYPE_ERROR, "method %@ is not implemented on extension %@; ignoring",
                  v206,
                  0x16u);
              }
            }
          }
          uint64_t v80 = [v79 countByEnumeratingWithState:&v174 objects:v205 count:16];
        }
        while (v80);
      }

      _flushBulkMethods((uint64_t)buf);
      v92 = (void *)__SelectorsToSettingsMap;
      v93 = (void *)[(NSMapTable *)table copy];
      [v92 setObject:v93 forKey:v151];

      v94 = (void *)__LegacySettingsToSettingsMap;
      v95 = (void *)[(NSMapTable *)v156 copy];
      [v94 setObject:v95 forKey:cls];
    }
    else
    {
      obj = FBLogSceneExtension();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEFAULT))
      {
        v96 = NSStringFromClass(aClass);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v96;
        _os_log_impl(&dword_19C680000, obj, OS_LOG_TYPE_DEFAULT, "%{public}@ defines no extension protocol!", buf, 0xCu);
      }
    }
  }
}

void sub_19C692868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _addBulkMethod(uint64_t a1, const char *a2, void (*a3)(void), char *a4)
{
  if ([*(id *)(a1 + 8) isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v8 = *(objc_class **)a1;
    uint64_t v9 = *(objc_class **)(a1 + 8);
    _addMethod(v8, v9, a2, a3, a4, 0);
  }
  else
  {
    uint64_t v10 = *(int *)(a1 + 24);
    int v11 = v10 + 1;
    *(_DWORD *)(a1 + 24) = v10 + 1;
    uint64_t v12 = (void *)(a1 + 8 * v10);
    v12[4] = a2;
    v12[132] = a3;
    v12[260] = a4;
    if (v11 == 128)
    {
      _flushBulkMethods(a1);
    }
  }
}

void sub_19C692DF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FBSSettingForSelector(void *a1, const void *a2)
{
  uint64_t v4 = FBSSettingForExtensionSelector(a1, a2);
  if (!v4)
  {
    uint64_t v4 = FBSSettingForLegacySelector((objc_class *)a1, a2);
  }

  return v4;
}

uint64_t _structDisposition(void *a1)
{
  id v1 = a1;
  if ([v1 isStruct])
  {
    v2 = [v1 structFlattenedMembers];
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:v2];
    if (((unint64_t)[v2 count] < 2) || ([v3 count] != 1))
    {
      uint64_t v6 = 4;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v4 = [v3 anyObject];
    if ([v4 size] == 8)
    {
      int v5 = [v4 type];
      if ([v2 count] != 2)
      {
        uint64_t v7 = [v2 count];
        if (v5 == 100 && v7 == 4) {
          uint64_t v6 = 3;
        }
        else {
          uint64_t v6 = 4;
        }
        goto LABEL_19;
      }
      uint64_t v6 = 1;
      if (v5 == 81 || v5 == 113)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v5 == 100)
      {
        uint64_t v6 = 2;
        goto LABEL_19;
      }
    }
    uint64_t v6 = 4;
    goto LABEL_19;
  }
  uint64_t v6 = 0;
LABEL_21:

  return v6;
}

BOOL FBSSubclassHasBeenIngested(void *a1)
{
  if (!a1)
  {
    int v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSSubclassHasBeenIngested_cold_1();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
  v2 = objc_getAssociatedObject(a1, (const void *)_FBSIngestedKey);
  BOOL v3 = v2 != 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
  return v3;
}

id FBLogSceneExtension()
{
  if (FBLogSceneExtension_onceToken != -1) {
    dispatch_once(&FBLogSceneExtension_onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)FBLogSceneExtension___logObj;

  return v0;
}

id FBSSettingForLegacySelector(objc_class *a1, const void *a2)
{
  Class Superclass = a1;
  if ((objc_class *)[(objc_class *)a1 _baseClass] == a1
    || (Class)[(objc_class *)Superclass _mutableClass] == Superclass)
  {
    uint64_t v7 = 0;
  }
  else
  {
    FBSIngestSubclassProperties((uint64_t)Superclass);
    if ([(objc_class *)Superclass isSubclassOfClass:[(objc_class *)Superclass _mutableClass]]&& [(objc_class *)Superclass _counterpartClass])
    {
      Class Superclass = (Class)[(objc_class *)Superclass _counterpartClass];
    }
    os_unfair_lock_lock(&__ExtensionLock);
    if (__SelectorsToSettingsMap)
    {
      while (Superclass != (Class)objc_opt_class())
      {
        NSMapGet((NSMapTable *)__SelectorsToSettingsMap, Superclass);
        uint64_t v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        int v5 = v4;
        if (v4)
        {
          uint64_t v6 = NSMapGet(v4, a2);
          if (v6)
          {
            uint64_t v7 = v6;

            goto LABEL_13;
          }
        }
        Class Superclass = class_getSuperclass(Superclass);
      }
    }
    uint64_t v7 = 0;
LABEL_13:
    os_unfair_lock_unlock(&__ExtensionLock);
  }

  return v7;
}

void FBSIngestSubclassProperties(uint64_t a1)
{
  if (!a1)
  {
    id v1 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSIngestSubclassProperties_cold_1();
    }
    [v1 UTF8String];
    _bs_set_crash_log_message();
  }
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __FBSIngestSubclassProperties_block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v2[4] = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&__SubclassLock);
  __FBSIngestSubclassProperties_block_invoke((uint64_t)v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&__SubclassLock);
}

void __FBSIngestSubclassProperties_block_invoke(uint64_t a1)
{
  for (uint64_t i = *(objc_class **)(a1 + 32); i != (objc_class *)objc_opt_class(); uint64_t i = class_getSuperclass(i))
  {
    v2 = objc_getAssociatedObject(i, (const void *)_FBSIngestedKey);

    if (v2) {
      break;
    }
    _ingestPropertiesFromSettingsSubclass(i);
    objc_setAssociatedObject(i, (const void *)_FBSIngestedKey, &unk_1EED3FAD0, 0);
  }
}

void __FBSRealizeSettingsExtension_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _baseClass];

  _realizeSettingsExtension();
}

void sub_19C6937E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSMapTable *FBSSettingForLegacySetting(void *a1, const void *a2)
{
  if (a2 == (const void *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"legacySetting != NSNotFound"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSSettingForLegacySetting_cold_1();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!a1)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsClass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSSettingForLegacySetting_cold_2();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  os_unfair_lock_lock(&__ExtensionLock);
  if (__LegacySettingsToSettingsMap)
  {
    uint64_t v4 = NSMapGet((NSMapTable *)__LegacySettingsToSettingsMap, (const void *)[a1 _baseClass]);
    int v5 = v4;
    if (v4) {
      uint64_t v4 = (NSMapTable *)NSMapGet(v4, a2);
    }
  }
  else
  {
    int v5 = 0;
    uint64_t v4 = 0;
  }
  uint64_t v6 = v4;
  os_unfair_lock_unlock(&__ExtensionLock);

  return v6;
}

__CFString *FBSDisplayHDRModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 4)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58F6F80[a1 + 1];
  }

  return v1;
}

__CFString *FBSDisplayGamutDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 3)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58F6F68[a1 + 1];
  }

  return v1;
}

uint64_t FBSDisplayRotationFromCADisplayRotation(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = getkCADisplayOrientationRotation90();
    char v3 = [v1 isEqualToString:v2];

    if (v3)
    {
      uint64_t v4 = 1;
    }
    else
    {
      int v5 = getkCADisplayOrientationRotation180();
      char v6 = [v1 isEqualToString:v5];

      if (v6)
      {
        uint64_t v4 = 2;
      }
      else
      {
        uint64_t v7 = getkCADisplayOrientationRotation270();
        int v8 = [v1 isEqualToString:v7];

        if (v8) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id getkCADisplayOrientationRotation90()
{
  uint64_t v0 = (void **)getkCADisplayOrientationRotation90SymbolLoc();
  if (!v0) {
    getkCADisplayOrientationRotation90_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayOrientationRotation90SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayOrientationRotation90SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayOrientationRotation90SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation90SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayOrientationRotation90");
    getkCADisplayOrientationRotation90SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C695644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayOrientationRotation270()
{
  uint64_t v0 = (void **)getkCADisplayOrientationRotation270SymbolLoc();
  if (!v0) {
    getkCADisplayOrientationRotation270_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayOrientationRotation270SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayOrientationRotation270SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayOrientationRotation270SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation270SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayOrientationRotation270");
    getkCADisplayOrientationRotation270SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C695768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayOrientationRotation180()
{
  uint64_t v0 = (void **)getkCADisplayOrientationRotation180SymbolLoc();
  if (!v0) {
    getkCADisplayOrientationRotation180_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayOrientationRotation180SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayOrientationRotation180SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayOrientationRotation180SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation180SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayOrientationRotation180");
    getkCADisplayOrientationRotation180SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C69588C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FBSDisplayOverscanCompensationFromCADisplayOverscanAdjustment(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = getkCADisplayScaleContent();
    char v3 = [v1 isEqualToString:v2];

    if (v3)
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v5 = getkCADisplayInsetBounds();
      int v6 = [v1 isEqualToString:v5];

      if (v6) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id getkCADisplayScaleContent()
{
  uint64_t v0 = (void **)getkCADisplayScaleContentSymbolLoc();
  if (!v0) {
    getkCADisplayScaleContent_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayScaleContentSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayScaleContentSymbolLoc_ptr;
  uint64_t v6 = getkCADisplayScaleContentSymbolLoc_ptr;
  if (!getkCADisplayScaleContentSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayScaleContent");
    getkCADisplayScaleContentSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C695A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayInsetBounds()
{
  uint64_t v0 = (void **)getkCADisplayInsetBoundsSymbolLoc();
  if (!v0) {
    getkCADisplayInsetBounds_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayInsetBoundsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayInsetBoundsSymbolLoc_ptr;
  uint64_t v6 = getkCADisplayInsetBoundsSymbolLoc_ptr;
  if (!getkCADisplayInsetBoundsSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayInsetBounds");
    getkCADisplayInsetBoundsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C695B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL FBSDisplayRotationIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL FBSDisplayHDRModeIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL FBSDisplayGamutIsValid(unint64_t a1)
{
  return a1 < 2;
}

uint64_t FBSDisplayHDRModeFromCADisplayHDRMode(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = getkCADisplayModeHDR10();
    char v3 = [v1 isEqualToString:v2];

    if (v3)
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v5 = getkCADisplayModeDolby();
      int v6 = [v1 isEqualToString:v5];

      if (v6) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id getkCADisplayModeHDR10()
{
  uint64_t v0 = (void **)getkCADisplayModeHDR10SymbolLoc();
  if (!v0) {
    getkCADisplayModeHDR10_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayModeHDR10SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayModeHDR10SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayModeHDR10SymbolLoc_ptr;
  if (!getkCADisplayModeHDR10SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayModeHDR10");
    getkCADisplayModeHDR10SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6967C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCADisplayModeDolby()
{
  uint64_t v0 = (void **)getkCADisplayModeDolbySymbolLoc();
  if (!v0) {
    getkCADisplayModeDolby_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayModeDolbySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayModeDolbySymbolLoc_ptr;
  uint64_t v6 = getkCADisplayModeDolbySymbolLoc_ptr;
  if (!getkCADisplayModeDolbySymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayModeDolby");
    getkCADisplayModeDolbySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6968E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *FBSDisplayGamutFromCADisplayGamut(void *result)
{
  if (result)
  {
    id v1 = result;
    v2 = getkCADisplayModeGamutP3();
    unsigned int v3 = [v1 isEqualToString:v2];

    return (void *)v3;
  }
  return result;
}

id getkCADisplayModeGamutP3()
{
  uint64_t v0 = (void **)getkCADisplayModeGamutP3SymbolLoc();
  if (!v0) {
    getkCADisplayModeGamutP3_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCADisplayModeGamutP3SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayModeGamutP3SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayModeGamutP3SymbolLoc_ptr;
  if (!getkCADisplayModeGamutP3SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayModeGamutP3");
    getkCADisplayModeGamutP3SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C696A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C696C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCADisplayClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCADisplayClass_softClass;
  uint64_t v7 = getCADisplayClass_softClass;
  if (!getCADisplayClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C696D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCADisplayClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  Class result = objc_getClass("CADisplay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCADisplayClass_block_invoke_cold_1();
  }
  getCADisplayClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t QuartzCoreLibrary()
{
  id v1 = 0;
  uint64_t result = QuartzCoreLibraryCore();
  if (!result) {
    QuartzCoreLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t QuartzCoreLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = QuartzCoreLibraryCore_frameworkLibrary;
  uint64_t v5 = QuartzCoreLibraryCore_frameworkLibrary;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F7750;
    long long v7 = *(_OWORD *)&off_1E58F7760;
    v3[3] = _sl_dlopen();
    QuartzCoreLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C696EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FBSCreateUnsafeObjectFromData(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 length])
  {
    uint64_t v2 = (void *)MEMORY[0x19F398F90]();
    id v7 = 0;
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v1 error:&v7];
    id v4 = v7;
    if (v3)
    {
      [v3 setRequiresSecureCoding:0];
      uint64_t v5 = [v3 decodeObjectOfClasses:0 forKey:*MEMORY[0x1E4F284E8]];
      [v3 finishDecoding];
    }
    else
    {
      uint64_t v3 = FBLogAppDataStore();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        _FBSCreateUnsafeObjectFromData_cold_1();
      }
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_19C69796C(_Unwind_Exception *a1)
{
}

void sub_19C69832C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__(void *a1)
{
  uint64_t v2 = a1;
  id v1 = (void *)MEMORY[0x19F398F90]();
  v2[2]();
}

void sub_19C699EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 72), 8);
  _Unwind_Resume(a1);
}

uint64_t FBSProcessResourceAllowanceMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_19C69A2EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromProcessResourceType(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return *(&off_1E58F7738 + a1);
  }
}

double FBSProcessResourceTimeIntervalForValue(unint64_t a1)
{
  return (double)a1 / 1000.0;
}

unint64_t FBSProcessResourceValueForTimeInterval(double a1)
{
  if (a1 <= 0.0) {
    return 0;
  }
  else {
    return (unint64_t)(a1 * 1000.0);
  }
}

uint64_t FBSProcessResourceAllowanceGetValue(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_19C69AB40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C69ACB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C69AE98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C69AF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C69AFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C69B114(_Unwind_Exception *exception_object)
{
}

void sub_19C69B298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C69B3BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FBLogWatchdog()
{
  if (FBLogWatchdog_onceToken != -1) {
    dispatch_once(&FBLogWatchdog_onceToken, &__block_literal_global_4_0);
  }
  uint64_t v0 = (void *)FBLogWatchdog___logObj;

  return v0;
}

void sub_19C69BAD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *NSStringFromProcessResourceAllowance(void *a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [off_1E58F44F0 builderWithObject:0];
    id v3 = (id)[v2 appendObject:@"FBSProcessResourceAllowance" withName:0];
    if (*v1 > 2uLL) {
      id v4 = @"(unknown)";
    }
    else {
      id v4 = *(&off_1E58F7738 + *v1);
    }
    id v5 = (id)[v2 appendObject:v4 withName:@"type"];
    unint64_t v6 = v1[1];
    if ((unint64_t)(*v1 - 1) > 1) {
      id v8 = (id)[v2 appendUInt64:v6 withName:@"value"];
    }
    else {
      id v7 = (id)[v2 appendTimeInterval:@"timeValue" withName:0 decomposeUnits:(double)v6 / 1000.0];
    }
    unint64_t v9 = v1[2];
    if (v9)
    {
      if (*v1 == 2) {
        id v10 = (id)[v2 appendTimeInterval:@"refreshInterval" withName:0 decomposeUnits:(double)v9 / 1000.0];
      }
      else {
        id v11 = [v2 appendUInt64:];
      }
    }
    id v1 = [v2 build];
  }

  return v1;
}

void sub_19C69CBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __accessProxiesWithBlock(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v4 = v1;
    os_unfair_lock_lock((os_unfair_lock_t)&__accessProxiesWithBlock___lock);
    if (!__accessProxiesWithBlock___endpointToProxy)
    {
      uint64_t v2 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
      id v3 = (void *)__accessProxiesWithBlock___endpointToProxy;
      __accessProxiesWithBlock___endpointToProxy = v2;
    }
    v4[2]();
    os_unfair_lock_unlock((os_unfair_lock_t)&__accessProxiesWithBlock___lock);
    id v1 = v4;
  }
}

id FBLogCommon()
{
  if (FBLogCommon_onceToken != -1) {
    dispatch_once(&FBLogCommon_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)FBLogCommon___logObj;

  return v0;
}

__CFString *FBSDisplayTypeDescription(uint64_t a1)
{
  uint64_t v2 = @"Main";
  id v3 = @"<<Invalid>>";
  switch(a1)
  {
    case -1:
      break;
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v2 = @"AirPlay";
      goto LABEL_10;
    case 3:
      uint64_t v2 = @"Car";
      goto LABEL_10;
    case 4:
      uint64_t v2 = @"iPodOnly";
      goto LABEL_10;
    case 5:
      uint64_t v2 = @"MusicOnly";
      goto LABEL_10;
    case 6:
      uint64_t v2 = @"CarInstruments";
      goto LABEL_10;
    case 7:
      uint64_t v2 = @"Unknown";
      goto LABEL_10;
    case 8:
      uint64_t v2 = @"Continuity";
LABEL_10:
      id v3 = v2;
      break;
    default:
      [NSString stringWithFormat:@"(%li)", a1];
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

id FBSWorkspaceInitialize(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock(&__sharedInstanceLock);
  if (FBSWorkspaceInitialize_initialized == 1)
  {
    id v8 = [NSString stringWithFormat:@"Cannot invoke FBSWorkspaceInitialize more than once."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      FBSWorkspaceInitialize_cold_1((uint64_t)v8);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  FBSWorkspaceInitialize_initialized = 1;
  uint64_t v2 = -[FBSWorkspace _initWithOptions:]([FBSWorkspace alloc], v1);
  id v3 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v2;

  if (!__sharedInstanceInitializationBlocks)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = (void *)__sharedInstanceInitializationBlocks;
    __sharedInstanceInitializationBlocks = v4;
  }
  if ([v1 _startsInactive]) {
    os_unfair_lock_unlock(&__sharedInstanceLock);
  }
  else {
    -[FBSWorkspace _consumeSharedLock_activateWithAlreadyHeldLock:](__sharedInstance, 1);
  }
  id v6 = (id)__sharedInstance;

  return v6;
}

void *FBSProcessResourceAllowanceIsValid(void *result)
{
  if (result)
  {
    if (*result) {
      return (void *)(result[1] != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

id _gatherMethods(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [v1 inheritedProtocols];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v9 = [v8 name];
        char v10 = [v9 hasPrefix:@"NS"];

        if ((v10 & 1) == 0)
        {
          id v11 = _gatherMethods(v8);
          [v2 addObjectsFromArray:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [v1 methods];
  [v2 addObjectsFromArray:v12];

  uint64_t v13 = [v2 allObjects];

  return v13;
}

id _gatherProperties(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [v1 inheritedProtocols];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v9 = [v8 name];
        char v10 = [v9 hasPrefix:@"NS"];

        if ((v10 & 1) == 0)
        {
          id v11 = _gatherProperties(v8);
          [v2 addObjectsFromArray:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = [v1 properties];
  uint64_t v14 = [v12 setWithArray:v13];

  [v2 minusSet:v14];
  [v2 unionSet:v14];
  long long v15 = [v2 allObjects];

  return v15;
}

void fbs_release(const void **a1)
{
  id v1 = *a1;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x19F3991F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x19F3991F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void ___realizeSettingsExtension_block_invoke_5_298(uint64_t a1, void *a2, int a3)
{
  uint64_t v5 = *(unsigned char **)(a1 + 32);
  id v9 = a2;
  unsigned int v6 = -[FBSSetting isNullPreserving](v5);
  id v7 = (void *)*MEMORY[0x1E4F1CFC8];
  if (!v6) {
    id v7 = 0;
  }
  if (a3) {
    id v8 = (void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    id v8 = v7;
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v9, v8, *(void **)(a1 + 32));
}

void sub_19C6A671C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FBSProcessResourceAllowanceMakeWithRealTimeInterval(void *a1@<X8>, double a2@<D0>)
{
  unint64_t v2 = (unint64_t)(a2 * 1000.0);
  if (a2 <= 0.0) {
    unint64_t v2 = 0;
  }
  *a1 = 1;
  a1[1] = v2;
  a1[2] = 0;
}

void sub_19C6A7250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FBLogSceneExtension_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "SceneExtension");
  uint64_t v1 = FBLogSceneExtension___logObj;
  FBLogSceneExtension___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __FBLogSceneClient_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "SceneClient");
  uint64_t v1 = FBLogSceneClient___logObj;
  FBLogSceneClient___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __FBLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "Common");
  uint64_t v1 = FBLogCommon___logObj;
  FBLogCommon___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19C6A7F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _NSStringFromFBSDisplayLayoutQOS(signed int a1)
{
  if (a1 >= 3)
  {
    uint64_t v1 = [NSString stringWithFormat:@"(%i)", a1];
  }
  else
  {
    uint64_t v1 = (void *)*((void *)&off_1E58F6340 + a1);
  }

  return v1;
}

id FBSOpenApplicationErrorCreate(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if (a1)
  {
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v12 = v11;
    if ((unint64_t)a1 > 0xA) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = off_1E58F5680[(void)a1 - 1];
    }
    [v11 bs_setSafeObject:v13 forKey:*(void *)off_1E58F4408];
    if (v10)
    {
      uint64_t v14 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
      [v12 bs_setSafeObject:v14 forKey:*MEMORY[0x1E4F28588]];
    }
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSOpenApplicationErrorDomain" code:a1 userInfo:v12];
  }

  return a1;
}

void sub_19C6A9C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double ___realizeSettingsExtension_block_invoke_3(uint64_t a1, void *a2)
{
  memset(v5, 0, sizeof(v5));
  id v3 = [a2 valueForSetting:*(void *)(a1 + 32)];
  [v3 getValue:v5 size:*(void *)(a1 + 40)];

  return *(double *)v5;
}

__CFString *NSStringFromFBSSceneInterruptionPolicy(unint64_t a1)
{
  if (a1 >= 4)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E58F5CD8[a1];
  }

  return v1;
}

void sub_19C6AD25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6AEC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t _QOSClassForFBSDisplayLayoutQOS(unsigned int a1)
{
  if (a1 >= 3) {
    return 9;
  }
  else {
    return 4 * a1 + 17;
  }
}

id FBLogInterfaceOrientationObserver()
{
  if (FBLogInterfaceOrientationObserver_onceToken != -1) {
    dispatch_once(&FBLogInterfaceOrientationObserver_onceToken, &__block_literal_global_13);
  }
  os_log_t v0 = (void *)FBLogInterfaceOrientationObserver___logObj;

  return v0;
}

id FBSFrameworkBundle()
{
  if (FBSFrameworkBundle___once != -1) {
    dispatch_once(&FBSFrameworkBundle___once, &__block_literal_global);
  }
  os_log_t v0 = (void *)FBSFrameworkBundle___bundle;

  return v0;
}

uint64_t __FBSFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = FBSFrameworkBundle___bundle;
  FBSFrameworkBundle___bundle = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19C6B3884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _ingestPropertiesFromSettingsSubclass(objc_class *a1)
{
  v145[2] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    v92 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsSubclass != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _ingestPropertiesFromSettingsSubclass_cold_1();
    }
    [v92 UTF8String];
    _bs_set_crash_log_message();
  }
  Class v1 = a1;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&__SubclassLock);
  os_unfair_lock_assert_not_owner(&__ExtensionLock);
  if (!__BaseToSubclassMap)
  {
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v3 = (void *)__BaseToSubclassMap;
    __BaseToSubclassMap = v2;

    uint64_t v4 = (void *)__BaseToSubclassMap;
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    [v4 setObject:v5 forKey:objc_opt_class()];

    unsigned int v6 = (void *)__BaseToSubclassMap;
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [v6 setObject:v7 forKey:objc_opt_class()];

    id v8 = (void *)__BaseToSubclassMap;
    id v9 = [MEMORY[0x1E4F1CA80] set];
    [v8 setObject:v9 forKey:objc_opt_class()];
  }
  uint64_t v10 = [(objc_class *)v1 _baseClass];
  id v11 = [(id)__BaseToSubclassMap objectForKey:v10];
  if (([v11 containsObject:v1] & 1) == 0)
  {
    [v11 addObject:v1];
    uint64_t v12 = [(objc_class *)v1 _mutableClass];
    if ((Class)v10 != v1)
    {
      uint64_t v13 = v12;
      if ((Class)v12 != v1 && v10 != objc_opt_class())
      {
        uint64_t v14 = NSStringFromClass(v1);
        long long v15 = FBLogSceneExtension();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v141 = v14;
          _os_log_impl(&dword_19C680000, v15, OS_LOG_TYPE_DEFAULT, "Ingesting properties from %{public}@...", buf, 0xCu);
        }

        uint64_t v16 = [(objc_class *)v1 _counterpartClass];
        if ([(objc_class *)v1 isSubclassOfClass:v13])
        {
          if (v10 == v13)
          {
            long long v17 = v1;
            goto LABEL_17;
          }
          if (v16)
          {
            long long v17 = (void *)v16;
LABEL_17:
            Class v18 = v1;
            goto LABEL_44;
          }
          uint64_t v22 = [v14 rangeOfString:@"Mutable"];
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v23 = FBLogSceneExtension();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              _ingestPropertiesFromSettingsSubclass_cold_13();
            }

            long long v17 = 0;
            int v24 = 1;
            goto LABEL_47;
          }
          uint64_t v25 = v21;
          long long v26 = NSString;
          int v27 = [v14 substringToIndex:v22];
          long long v28 = [v14 substringFromIndex:v22 + v25];
          long long v19 = [v26 stringWithFormat:@"%@%@", v27, v28];

          Class v29 = NSClassFromString(v19);
          uint64_t v30 = FBLogSceneExtension();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
          if (v29)
          {
            if (v31) {
              _ingestPropertiesFromSettingsSubclass_cold_15();
            }
          }
          else if (v31)
          {
            _ingestPropertiesFromSettingsSubclass_cold_14();
          }
          Class v18 = v1;
        }
        else
        {
          if (v16)
          {
            long long v17 = v1;
            Class v18 = (Class)v16;
            goto LABEL_44;
          }
          long long v19 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
          if (![v14 length]) {
            goto LABEL_28;
          }
          unint64_t v20 = 0;
          while (([(NSString *)v19 characterIsMember:[v14 characterAtIndex:v20]] & 1) == 0)
          {
            if (++v20 >= [v14 length]) {
              goto LABEL_28;
            }
          }
          if (v20 < 2)
          {
LABEL_28:
            Class v18 = 0;
LABEL_42:

            if (!v1)
            {
              long long v17 = 0;
              int v24 = 1;
              goto LABEL_46;
            }
            long long v17 = v1;
LABEL_44:
            if (v17 == (void *)[v17 _baseClass])
            {
              v93 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingsSubclass != [settingsSubclass _baseClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                _ingestPropertiesFromSettingsSubclass_cold_2();
              }
              [v93 UTF8String];
              _bs_set_crash_log_message();
            }
            [v11 addObject:v17];
            int v24 = 0;
LABEL_46:
            Class v1 = v18;
            if (!v18)
            {
LABEL_49:
              v38 = FBLogSceneExtension();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v141 = v14;
                _os_log_impl(&dword_19C680000, v38, OS_LOG_TYPE_DEFAULT, "Unable to determine counterpart class for %{public}@.", buf, 0xCu);
              }

              goto LABEL_153;
            }
LABEL_47:
            if (v1 == (Class)[(objc_class *)v1 _mutableClass])
            {
              v94 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"mutableSubclass != [mutableSubclass _mutableClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                _ingestPropertiesFromSettingsSubclass_cold_3();
              }
              [v94 UTF8String];
              _bs_set_crash_log_message();
            }
            [v11 addObject:v1];
            if (v24) {
              goto LABEL_49;
            }
            if (!v16)
            {
              [v17 _setCounterpartClass:v1];
              [(objc_class *)v1 _setCounterpartClass:v17];
            }
            unsigned int outCount = 0;
            v136 = class_copyPropertyList(v1, &outCount);
            if (outCount)
            {
              uint64_t v119 = NSStringFromClass((Class)v17);

              uint64_t v39 = [NSString stringWithFormat:@"%@[derived]", v119];
              uint64_t v40 = NSProtocolFromString((NSString *)v39);
              v117 = v39;
              LOBYTE(v39) = v40 == 0;

              if ((v39 & 1) == 0)
              {
                v95 = [NSString stringWithFormat:@"a protocol named \"%@\" already exists", v117];
                v96 = MEMORY[0x1E4F14500];
                id v97 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
                  objc_claimAutoreleasedReturnValue();
                  _ingestPropertiesFromSettingsSubclass_cold_12();
                }

                [v95 UTF8String];
                _bs_set_crash_log_message();
              }
              v120 = [off_1E58F4530 protocolWithName:v117];
              id v118 = [(objc_class *)v1 _legacyDescriptionProvider];
              if (!v118)
              {
                v98 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"mutableInstance != nil"];
                id v99 = MEMORY[0x1E4F14500];
                id v100 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                {
                  [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
                  objc_claimAutoreleasedReturnValue();
                  _ingestPropertiesFromSettingsSubclass_cold_6();
                }

                [v98 UTF8String];
                _bs_set_crash_log_message();
              }
              if (outCount)
              {
                unint64_t v41 = 0;
                v110 = (void *)*MEMORY[0x1E4F1CFD0];
                do
                {
                  v42 = v136[v41];
                  id v43 = [NSString bs_stringWithUTF8String:property_getName(v42)];
                  v44 = FBLogSceneExtension();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v141 = v43;
                    _os_log_debug_impl(&dword_19C680000, v44, OS_LOG_TYPE_DEBUG, "Checking property %@...", buf, 0xCu);
                  }

                  if (([v43 isEqualToString:@"hash"] & 1) != 0
                    || ([v43 isEqualToString:@"superclass"] & 1) != 0
                    || ([v43 isEqualToString:@"description"] & 1) != 0
                    || ([v43 isEqualToString:@"debugDescription"] & 1) != 0)
                  {
                    goto LABEL_110;
                  }
                  id v135 = 0;
                  id v45 = [off_1E58F4548 propertyWithProperty:v42 error:&v135];
                  id v46 = v135;
                  v116 = v46;
                  if (v45)
                  {
                    if ([v45 isReadOnly])
                    {
                      BOOL v47 = FBLogSceneExtension();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v141 = v43;
                        _os_log_debug_impl(&dword_19C680000, v47, OS_LOG_TYPE_DEBUG, "Skipping %@ since it is readonly", buf, 0xCu);
                      }
                    }
                    else
                    {
                      v50 = [v45 setter];
                      aSelector = (const char *)[v50 selector];

                      int v115 = [(objc_class *)v1 instancesRespondToSelector:aSelector];
                      if (!v115
                        || ([v45 getter],
                            uint64_t v51 = objc_claimAutoreleasedReturnValue(),
                            char v52 = [v17 instancesRespondToSelector:[v51 selector]],
                            v51,
                            (v52 & 1) != 0))
                      {
                        [v120 addProperty:v45];
                        uint64_t v131 = 0;
                        v132 = &v131;
                        uint64_t v133 = 0x2020000000;
                        char v134 = 0;
                        uint64_t v127 = 0;
                        id v128 = &v127;
                        uint64_t v129 = 0x2020000000;
                        uint64_t v130 = 0;
                        if (v115)
                        {
                          context = (void *)MEMORY[0x19F398F90]();
                          if ((objc_opt_respondsToSelector() & 1) == 0)
                          {
                            v101 = NSString;
                            id v102 = NSStringFromSelector(aSelector);
                            v103 = [v101 stringWithFormat:@"instance doesn't respond to %@", v102];

                            v104 = MEMORY[0x1E4F14500];
                            id v105 = MEMORY[0x1E4F14500];
                            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                            {
                              [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
                              objc_claimAutoreleasedReturnValue();
                              _ingestPropertiesFromSettingsSubclass_cold_10();
                            }

                            [v103 UTF8String];
                            _bs_set_crash_log_message();
                          }
                          v109 = [v45 value];
                          int v53 = [(__CFString *)v109 type];
                          int v55 = v53;
                          uint64_t v56 = (uint64_t)aSelector;
                          switch((char)v53)
                          {
                            case ':':
                              goto LABEL_86;
                            case ';':
                            case '<':
                            case '=':
                            case '>':
                            case 'A':
                              goto LABEL_112;
                            case '?':
                              v76 = [NSString stringWithFormat:@"type cannot be unknown"];
                              v77 = MEMORY[0x1E4F14500];
                              id v78 = MEMORY[0x1E4F14500];
                              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                              {
                                id v79 = [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
                                *(_DWORD *)buf = 138544130;
                                v141 = v79;
                                __int16 v142 = 2114;
                                v143 = @"FBSSceneExtension.m";
                                __int16 v144 = 1024;
                                LODWORD(v145[0]) = 1025;
                                WORD2(v145[0]) = 2114;
                                *(void *)((char *)v145 + 6) = v76;
                                _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
                              }
                              [v76 UTF8String];
                              _bs_set_crash_log_message();
                            case '@':
                              v57 = (objc_class *)[(__CFString *)v109 objectClass];
                              if (v57)
                              {
                                if (v57 == (objc_class *)objc_opt_class())
                                {
                                  id v58 = v110;
                                }
                                else
                                {
                                  +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v57);
                                  id v58 = (id)objc_claimAutoreleasedReturnValue();
                                }
                              }
                              else
                              {
                                v59 = (objc_class *)objc_opt_class();
                                +[FBSObjectProxy proxyForClass:]((uint64_t)FBSObjectProxy, v59);
                                id v58 = (id)objc_claimAutoreleasedReturnValue();
                              }
                              v60 = v58;
                              [v118 aSelector:v58];

                              goto LABEL_90;
                            case 'B':
                              goto LABEL_117;
                            default:
                              if (v53 == 35)
                              {
                                uint64_t v56 = objc_opt_class();
LABEL_86:
                                [v118 aSelector:v56];
                                goto LABEL_90;
                              }
LABEL_112:
                              if ((v53 & 0xFFFFFFFD) == 0x64)
                              {
                                LODWORD(v54) = 1.0;
                                [v118 aSelector:aSelector, v54];
LABEL_90:
                                int v61 = 0;
                                goto LABEL_91;
                              }
                              uint64_t v72 = v53 - 40;
                              if (v72 > 0x3A) {
                                goto LABEL_126;
                              }
                              if (((1 << (v53 - 40)) & 0x448000000000001) != 0)
                              {
                                v73 = FBLogSceneExtension();
                                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  v141 = v43;
                                  __int16 v142 = 1024;
                                  LODWORD(v143) = v55;
                                  _os_log_debug_impl(&dword_19C680000, v73, OS_LOG_TYPE_DEBUG, "Skipping %@ because this type (%d) is not supported", buf, 0x12u);
                                }
                              }
                              else
                              {
                                if (v72 == 2)
                                {
                                  [v118 aSelector:@"scene"];
                                  goto LABEL_90;
                                }
LABEL_126:
                                if (v53 != 123)
                                {
LABEL_117:
                                  [v118 aSelector:1];
                                  goto LABEL_90;
                                }
                                int v74 = _structDisposition(v109);
                                switch(v74)
                                {
                                  case 3:
                                    [v118 aSelector:0.0, 0.0, 1.0, 1.0];
                                    goto LABEL_90;
                                  case 2:
                                    [v118 aSelector:1.0, 1.0];
                                    goto LABEL_90;
                                  case 1:
                                    [v118 aSelector:1, 1];
                                    goto LABEL_90;
                                }
                                id v75 = FBLogSceneExtension();
                                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  v141 = v43;
                                  __int16 v142 = 2112;
                                  v143 = v109;
                                  _os_log_debug_impl(&dword_19C680000, v75, OS_LOG_TYPE_DEBUG, "Skipping %@ because this struct is not supported: %@", buf, 0x16u);
                                }
                              }
                              int v61 = 1;
LABEL_91:
                              id v62 = -[FBSSettings _legacyOtherSettings]((uint64_t)v118);
                              v63 = [v62 allSettings];
                              if ([v63 count] == 1)
                              {
                                v126[0] = MEMORY[0x1E4F143A8];
                                v126[1] = 3221225472;
                                v126[2] = ___ingestPropertiesFromSettingsSubclass_block_invoke;
                                v126[3] = &unk_1E58F4F20;
                                v126[4] = &v127;
                                v126[5] = &v131;
                                [v63 enumerateWithBlock:v126];
                              }
                              else
                              {
                                if ([v63 count])
                                {
                                  SEL v64 = FBLogSceneExtension();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    NSStringFromClass(v1);
                                    v106 = (id)objc_claimAutoreleasedReturnValue();
                                    uint64_t v65 = NSStringFromSelector(aSelector);
                                    *(_DWORD *)buf = 138412546;
                                    v141 = v106;
                                    __int16 v142 = 2112;
                                    aSelectora = (char *)v65;
                                    v143 = (__CFString *)v65;
                                    _os_log_debug_impl(&dword_19C680000, v64, OS_LOG_TYPE_DEBUG, "Calling -[%@ %@] produced multiple settings changes. Ignoring this property.", buf, 0x16u);
                                  }
                                }
                                else if (v61)
                                {
                                  SEL v64 = FBLogSceneExtension();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    uint64_t v66 = [(__CFString *)v109 encoding];
                                    *(_DWORD *)buf = 138543618;
                                    v141 = v43;
                                    __int16 v142 = 2114;
                                    aSelectorb = (char *)v66;
                                    v143 = (__CFString *)v66;
                                    _os_log_debug_impl(&dword_19C680000, v64, OS_LOG_TYPE_DEBUG, "Ignoring property %{public}@ because %{public}@ is not a supported encoding.", buf, 0x16u);
                                  }
                                }
                                else
                                {
                                  SEL v64 = FBLogSceneExtension();
                                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                                  {
                                    NSStringFromClass(v1);
                                    v107 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(aSelector);
                                    aSelectorc = (char *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138412546;
                                    v141 = v107;
                                    __int16 v142 = 2112;
                                    v143 = (__CFString *)aSelectorc;
                                    _os_log_debug_impl(&dword_19C680000, v64, OS_LOG_TYPE_DEBUG, "Calling -[%@ %@] produced no settings changes. Ignoring this property.", buf, 0x16u);
                                  }
                                }
                              }
                              [v62 removeAllSettings];

                              break;
                          }
                        }
                        else
                        {
                          uint64_t v130 = 0x7FFFFFFFFFFFFFFFLL;
                          char v134 = 1;
                        }
                        [v120 removeProperty:v45];
                        if (*((unsigned char *)v132 + 24))
                        {
                          v67 = FBLogSceneExtension();
                          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v71 = "modern";
                            if (v115) {
                              v71 = "legacy";
                            }
                            v141 = v43;
                            __int16 v142 = 2080;
                            v143 = (__CFString *)v71;
                            __int16 v144 = 2112;
                            v145[0] = v117;
                            _os_log_debug_impl(&dword_19C680000, v67, OS_LOG_TYPE_DEBUG, "Adding %@ as a %s property to %@", buf, 0x20u);
                          }

                          if (v115)
                          {
                            v68 = [NSString stringWithFormat:@"%llu", v128[3]];
                            v138 = @"#";
                            v139 = v68;
                            v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
                            uint64_t v70 = [v45 copyAddingCustomAttributes:v69];

                            id v45 = v70;
                          }
                          [v120 addProperty:v45];
                        }
                        _Block_object_dispose(&v127, 8);
                        _Block_object_dispose(&v131, 8);
                        goto LABEL_109;
                      }
                      BOOL v47 = FBLogSceneExtension();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v141 = v43;
                        _os_log_debug_impl(&dword_19C680000, v47, OS_LOG_TYPE_DEBUG, "Skipping %@ since it defines a setter but no getter", buf, 0xCu);
                      }
                    }
                  }
                  else
                  {
                    SEL v48 = v46;
                    id v45 = FBLogSceneExtension();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                    {
                      v49 = [v48 descriptionWithMultilinePrefix:0];
                      *(_DWORD *)buf = 138412546;
                      v141 = v43;
                      __int16 v142 = 2112;
                      v143 = v49;
                      _os_log_debug_impl(&dword_19C680000, v45, OS_LOG_TYPE_DEBUG, "Skipping %@ due to error building property: %@", buf, 0x16u);
                    }
                  }
LABEL_109:

LABEL_110:
                  ++v41;
                }
                while (v41 < outCount);
              }
              uint64_t v80 = [v120 properties];
              BOOL v81 = [v80 count] == 0;

              if (v81)
              {
                v85 = FBLogSceneExtension();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                {
                  v88 = NSStringFromClass(v1);
                  _ingestPropertiesFromSettingsSubclass_cold_7(v88, buf, v85);
                }
              }
              else
              {
                v82 = FBLogSceneExtension();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                {
                  NSStringFromClass(v1);
                  v89 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  v90 = [v120 properties];
                  uint64_t v91 = [v90 count];
                  *(_DWORD *)buf = 138543874;
                  v141 = v117;
                  __int16 v142 = 2114;
                  v143 = v89;
                  __int16 v144 = 2048;
                  v145[0] = v91;
                  _os_log_debug_impl(&dword_19C680000, v82, OS_LOG_TYPE_DEBUG, "Derived protocol <%{public}@> from %{public}@ with %lu properties.", buf, 0x20u);
                }
                v83 = (void *)[v120 copy];
                v84 = +[FBSSettingsExtension extensionForBSObjCProtocol:v83];

                v121[0] = MEMORY[0x1E4F143A8];
                v121[1] = 3221225472;
                v122 = ___ingestPropertiesFromSettingsSubclass_block_invoke_389;
                v123 = &__block_descriptor_48_e5_v8__0lu32l8u40l8;
                id v124 = v17;
                v125 = v84;
                v85 = v121;
                os_unfair_lock_lock(&__ExtensionLock);
                ((void (*))v122)(v85);
                os_unfair_lock_unlock(&__ExtensionLock);
              }

              v86 = v117;
            }
            else
            {
              v86 = FBLogSceneExtension();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
              {
                v87 = NSStringFromClass(v1);
                _ingestPropertiesFromSettingsSubclass_cold_4(v87, buf, v86);
              }
              uint64_t v119 = (uint64_t)v14;
            }

            fbs_free((void **)&v136);
            uint64_t v14 = v119;
LABEL_153:

            goto LABEL_154;
          }
          unint64_t v32 = v20 - 1;
          uint64_t v33 = NSString;
          v34 = [v14 substringToIndex:v20 - 1];
          int v35 = [v14 substringFromIndex:v32];
          uint64_t v30 = [v33 stringWithFormat:@"%@Mutable%@", v34, v35];

          Class v18 = NSClassFromString((NSString *)&v30->isa);
          uint64_t v36 = FBLogSceneExtension();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG);
          if (v18)
          {
            if (v37) {
              _ingestPropertiesFromSettingsSubclass_cold_15();
            }
          }
          else if (v37)
          {
            _ingestPropertiesFromSettingsSubclass_cold_16();
          }

          Class v29 = v1;
        }

        Class v1 = v29;
        goto LABEL_42;
      }
    }
  }
LABEL_154:
}

void sub_19C6B6020()
{
  objc_end_catch();
  _Block_object_dispose(&v1, 8);
  _Block_object_dispose((const void *)(v0 - 232), 8);
  JUMPOUT(0x19C6B60E4);
}

void sub_19C6B6030()
{
}

void sub_19C6B60F0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x19C6B60FCLL);
}

uint64_t FBSSettingsExtensionIsRealized(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock(&__ExtensionLock);
  uint64_t v4 = [(id)__SettingsToExtensionsMap objectForKey:a1];
  uint64_t v5 = [v4 containsObject:a2];
  os_unfair_lock_unlock(&__ExtensionLock);

  return v5;
}

id FBSAllSettings(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  os_unfair_lock_lock(&__ExtensionLock);
  if (__SelectorsToSettingsMap)
  {
    uint64_t v3 = [a1 _baseClass];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = NSAllMapTableKeys((NSMapTable *)__SelectorsToSettingsMap);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v9 isSubclassOfClass:v3])
          {
            NSMapGet((NSMapTable *)__SelectorsToSettingsMap, v9);
            uint64_t v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
            id v11 = v10;
            if (v10)
            {
              uint64_t v12 = NSAllMapTableValues(v10);
            }
            else
            {
              uint64_t v12 = 0;
            }
            [v2 addObjectsFromArray:v12];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  os_unfair_lock_unlock(&__ExtensionLock);

  return v2;
}

id FBSAllSettingsFromProtocol(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v5 = [off_1E58F4550 protocolForProtocol:v3];
  uint64_t v6 = _gatherProperties(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) getter];
        uint64_t v12 = FBSSettingForSelector(a1, (const void *)[v11 selector]);

        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

id FBSSettingNameForSelector(void *a1, const void *a2)
{
  if (a1)
  {
    id v3 = (void *)[a1 _baseClass];
LABEL_3:
    uint64_t v4 = FBSSettingForExtensionSelector(v3, a2);
    uint64_t v5 = -[FBSSetting name]((uint64_t)v4);

    goto LABEL_6;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = FBSSettingForExtensionSelector(v6, a2);
  uint64_t v5 = -[FBSSetting name]((uint64_t)v7);

  if (!v5)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = FBSSettingForExtensionSelector(v8, a2);
    uint64_t v5 = -[FBSSetting name]((uint64_t)v9);

    if (!v5)
    {
      id v3 = objc_opt_class();
      goto LABEL_3;
    }
  }
LABEL_6:

  return v5;
}

uint64_t ___realizeSettingsExtension_block_invoke(uint64_t a1, void *a2)
{
  v5[0] = 0;
  v5[1] = 0;
  id v3 = [a2 valueForSetting:*(void *)(a1 + 32)];
  [v3 getValue:v5 size:*(void *)(a1 + 40)];

  return v5[0];
}

double ___realizeSettingsExtension_block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = 0;
  v5[1] = 0;
  id v3 = [a2 valueForSetting:*(void *)(a1 + 32)];
  [v3 getValue:v5 size:*(void *)(a1 + 40)];

  return *(double *)v5;
}

double ___realizeSettingsExtension_block_invoke_2_254(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 valueForSetting:*(void *)(a1 + 32)];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

uint64_t ___realizeSettingsExtension_block_invoke_3_256(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForSetting:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 UTF8String];

  return v3;
}

uint64_t ___realizeSettingsExtension_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 valueForSetting:*(void *)(a1 + 32)];
}

SEL ___realizeSettingsExtension_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForSetting:*(void *)(a1 + 32)];
  uint64_t v3 = v2;
  if (v2) {
    SEL v4 = NSSelectorFromString(v2);
  }
  else {
    SEL v4 = 0;
  }

  return v4;
}

void _addMethod(objc_class *a1, objc_class *a2, SEL name, IMP imp, char *types, int a6)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    long long v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", imp, types, @"cls"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _addMethod_cold_1();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!a2)
  {
    Class v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", imp, types, @"ext"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _addMethod_cold_2();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!name)
  {
    uint64_t v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", imp, types, @"sel"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _addMethod_cold_3();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!imp)
  {
    unint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", 0, types, @"imp"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _addMethod_cold_4();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!types)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"type"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      _addMethod_cold_5();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!a6)
  {
    BOOL v15 = class_addMethod(a1, name, imp, types);
    long long v16 = FBLogSceneExtension();
    id v11 = v16;
    if (!v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = NSStringFromSelector(name);
        long long v23 = NSStringFromClass(a2);
        int v24 = NSStringFromClass(a1);
        *(_DWORD *)buf = 138412802;
        BOOL v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v23;
        __int16 v34 = 2112;
        int v35 = v24;
        _os_log_error_impl(&dword_19C680000, v11, OS_LOG_TYPE_ERROR, "unable to register method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);
      }
      uint64_t v25 = NSString;
      long long v26 = NSStringFromSelector(name);
      int v27 = NSStringFromClass(a2);
      long long v28 = NSStringFromClass(a1);
      Class v29 = [v25 stringWithFormat:@"unable to register method \"%@\" from extension %@ on class \"%@\"", v26, v27, v28];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _addMethod_cold_6();
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    uint64_t v12 = NSStringFromSelector(name);
    uint64_t v13 = NSStringFromClass(a2);
    long long v14 = NSStringFromClass(a1);
    *(_DWORD *)buf = 138412802;
    BOOL v31 = v12;
    __int16 v32 = 2112;
    uint64_t v33 = v13;
    __int16 v34 = 2112;
    int v35 = v14;
    _os_log_debug_impl(&dword_19C680000, v11, OS_LOG_TYPE_DEBUG, "registered method \"%@\" from extension %@ on class \"%@\"", buf, 0x20u);
    goto LABEL_16;
  }
  uint64_t v10 = class_replaceMethod(a1, name, imp, types);
  if (v10 && v10 != imp)
  {
    id v11 = FBLogSceneExtension();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      return;
    }
    uint64_t v12 = NSStringFromSelector(name);
    uint64_t v13 = NSStringFromClass(a2);
    long long v14 = NSStringFromClass(a1);
    *(_DWORD *)buf = 138543874;
    BOOL v31 = v12;
    __int16 v32 = 2114;
    uint64_t v33 = v13;
    __int16 v34 = 2114;
    int v35 = v14;
    _os_log_error_impl(&dword_19C680000, v11, OS_LOG_TYPE_ERROR, "replaced @selector(%{public}@) from extension %{public}@ that was already implemented on %{public}@.", buf, 0x20u);
LABEL_16:

    goto LABEL_13;
  }
}

void ___realizeSettingsExtension_block_invoke_270(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F29238];
  id v7 = *(id *)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v6 valueWithBytes:&v10 objCType:[v7 UTF8String]];
  -[FBSSettings _setValue:forSetting:]((uint64_t)v8, v9, *(void **)(a1 + 40));
}

void ___realizeSettingsExtension_block_invoke_2_273(uint64_t a1, void *a2, double a3, double a4)
{
  double v10 = a3;
  double v11 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F29238];
  id v7 = *(id *)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v6 valueWithBytes:&v10 objCType:[v7 UTF8String]];
  -[FBSSettings _setValue:forSetting:]((uint64_t)v8, v9, *(void **)(a1 + 40));
}

void ___realizeSettingsExtension_block_invoke_3_275(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v12 = a3;
  double v13 = a4;
  double v14 = a5;
  double v15 = a6;
  id v8 = (void *)MEMORY[0x1E4F29238];
  id v9 = *(id *)(a1 + 32);
  id v10 = a2;
  double v11 = [v8 valueWithBytes:&v12 objCType:[v9 UTF8String]];
  -[FBSSettings _setValue:forSetting:]((uint64_t)v10, v11, *(void **)(a1 + 40));
}

void ___realizeSettingsExtension_block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    a3 = [NSString stringWithUTF8String:a3];
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));
}

void ___realizeSettingsExtension_block_invoke_2_292(uint64_t a1, void *a2, double a3)
{
  id v6 = a2;
  if ((-[FBSSetting isNullPreserving](*(unsigned char **)(a1 + 32)) & 1) == 0) {
    BSFloatIsZero();
  }
  id v5 = [NSNumber numberWithDouble:a3];
  -[FBSSettings _setValue:forSetting:]((uint64_t)v6, v5, *(void **)(a1 + 32));
}

void ___realizeSettingsExtension_block_invoke_3_294(uint64_t a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  if (a3)
  {
    NSStringFromClass(a3);
    a3 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));
}

void ___realizeSettingsExtension_block_invoke_4_296(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  if (a3)
  {
    NSStringFromSelector(a3);
    a3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v5, a3, *(void **)(a1 + 32));
}

void ___realizeSettingsExtension_block_invoke_6_300(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  unsigned int v5 = -[FBSSetting isNullPreserving](*(unsigned char **)(a1 + 32));
  if (a3 || v5)
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  }
  else
  {
    id v6 = 0;
  }
  -[FBSSettings _setValue:forSetting:]((uint64_t)v7, v6, *(void **)(a1 + 32));
}

uint64_t ___ingestPropertiesFromSettingsSubclass_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

void ___ingestPropertiesFromSettingsSubclass_block_invoke_389()
{
}

uint64_t OUTLINED_FUNCTION_1(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2114;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X1>, uint64_t a2@<X2>, __int16 a3@<W8>)
{
  *(_DWORD *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 28) = a3;
  *(void *)(a2 + 30) = a1;
}

void OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 22) = 1024;
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return objc_opt_class();
}

__CFString *NSStringFromFBSApplicationTrustState(unint64_t a1)
{
  if (a1 >= 0xB)
  {
    [NSString stringWithFormat:@"Unknown (%d)", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E58F4F40[a1];
  }

  return v1;
}

void sub_19C6B7FEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19C6B85D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_19C6BBC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6BC000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6BC354(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

id FBSLogApplicationLibrary()
{
  if (FBSLogApplicationLibrary_onceToken != -1) {
    dispatch_once(&FBSLogApplicationLibrary_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)FBSLogApplicationLibrary___logObj;

  return v0;
}

uint64_t __FBSLogApplicationLibrary_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "default");
  uint64_t v1 = FBSLogApplicationLibrary___logObj;
  FBSLogApplicationLibrary___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id FBSLogApplicationLibraryObserver()
{
  if (FBSLogApplicationLibraryObserver_onceToken != -1) {
    dispatch_once(&FBSLogApplicationLibraryObserver_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)FBSLogApplicationLibraryObserver___logObj;

  return v0;
}

uint64_t __FBSLogApplicationLibraryObserver_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "observer");
  uint64_t v1 = FBSLogApplicationLibraryObserver___logObj;
  FBSLogApplicationLibraryObserver___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id FBSLogApplicationPlaceholder()
{
  if (FBSLogApplicationPlaceholder_onceToken != -1) {
    dispatch_once(&FBSLogApplicationPlaceholder_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)FBSLogApplicationPlaceholder___logObj;

  return v0;
}

uint64_t __FBSLogApplicationPlaceholder_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.frontboard.ApplicationLibrary", "placeholder");
  uint64_t v1 = FBSLogApplicationPlaceholder___logObj;
  FBSLogApplicationPlaceholder___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t UIKitServicesLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = UIKitServicesLibraryCore_frameworkLibrary;
  uint64_t v5 = UIKitServicesLibraryCore_frameworkLibrary;
  if (!UIKitServicesLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F5478;
    long long v7 = *(_OWORD *)&off_1E58F5488;
    v3[3] = _sl_dlopen();
    UIKitServicesLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6BDDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitServicesLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  UIKitServicesLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getUISApplicationStateClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2050000000;
  uint64_t v0 = (void *)getUISApplicationStateClass_softClass;
  uint64_t v6 = getUISApplicationStateClass_softClass;
  if (!getUISApplicationStateClass_softClass)
  {
    UIKitServicesLibraryCore();
    v4[3] = (uint64_t)objc_getClass("UISApplicationState");
    getUISApplicationStateClass_softClass Class = v4[3];
    uint64_t v0 = (void *)v4[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v3, 8);

  return v1;
}

void sub_19C6BDF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUISApplicationStateClass_block_invoke(uint64_t a1)
{
  UIKitServicesLibraryCore();
  Class result = objc_getClass("UISApplicationState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUISApplicationStateClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{
}

__CFString *FBSOpenApplicationErrorCodeToString(unint64_t a1)
{
  if (a1 > 0xA) {
    return 0;
  }
  else {
    return off_1E58F56D0[a1];
  }
}

__CFString *FBSOpenApplicationServiceErrorCodeToString(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E58F5728[a1];
  }
}

__CFString *NSStringFromFBSApplicationPlaceholderAction(unint64_t a1)
{
  if (a1 > 8) {
    return @"(unknown)";
  }
  else {
    return off_1E58F58C0[a1];
  }
}

void sub_19C6BF964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19C6C00E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL FBSInstallTypeIsCloudDemoted(uint64_t a1)
{
  return (unint64_t)(a1 - 7) < 3;
}

uint64_t FBSStringForInstallType(uint64_t a1)
{
  return [NSString NSStringFromLSInstallType:a1];
}

uint64_t FBSStringForInstallState(uint64_t a1)
{
  return [NSString NSStringFromLSInstallState:a1];
}

uint64_t FBSStringForInstallPhase(uint64_t a1)
{
  return [NSString NSStringFromLSInstallPhase:a1];
}

id FBSWorkspaceErrorCreate(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a1;
  id v12 = a3;
  double v13 = [MEMORY[0x1E4F1CA60] dictionary];
  double v14 = NSStringFromFBSWorkspaceErrorCode(a2);
  if (v14) {
    [v13 setObject:v14 forKey:*(void *)off_1E58F4408];
  }
  if (v11) {
    [v13 setObject:v11 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v12)
  {
    double v15 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
    [v13 setObject:v15 forKey:*MEMORY[0x1E4F28588]];
  }
  long long v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSWorkspaceErrorDomain" code:a2 userInfo:v13];

  return v16;
}

__CFString *NSStringFromFBSWorkspaceErrorCode(unint64_t a1)
{
  if (a1 >= 4)
  {
    [NSString stringWithFormat:@"(unknown - %ld)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58F5A68[a1];
  }

  return v1;
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_19C6C4A50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

__CFString *FBSApplicationTerminationReasonDescription(unint64_t a1)
{
  if (a1 > 9) {
    return @"<unknown termination reason>";
  }
  else {
    return off_1E58F5AA0[a1];
  }
}

__CFString *FBSApplicationTerminationGroupDescription(uint64_t a1)
{
  id v1 = @"<unknown>";
  if (a1 == 1) {
    id v1 = @"all applications";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"foreground applications";
  }
}

uint64_t FBSApplicationTerminationReasonIsGraceful(unint64_t a1)
{
  return (a1 < 0xA) & (0x24Au >> a1);
}

__CFString *NSStringFromFBSOpenApplicationLaunchIntent(unint64_t a1)
{
  if (a1 > 4) {
    return @"(unknown)";
  }
  else {
    return off_1E58F5C60[a1];
  }
}

__CFString *NSStringFromFBSSceneActivityMode(uint64_t a1)
{
  uint64_t v1 = (int)a1 + 3;
  if v1 < 0xB && ((0x40Fu >> v1))
  {
    uint64_t v2 = off_1E58F5CF8[v1];
  }
  else
  {
    [NSString stringWithFormat:@"(invalid - %d)", a1];
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

__CFString *NSStringFromFBSSceneJetsamMode(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"support";
    }
    else
    {
      [NSString stringWithFormat:@"(invalid - %d)", a1];
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"default";
  }
  return v2;
}

__CFString *FBSProcessExceptionCodeDescription(uint64_t a1)
{
  uint64_t v1 = @"Force Quit";
  if (a1 != 4227595259) {
    uint64_t v1 = 0;
  }
  if (a1 == 3735943697) {
    uint64_t v2 = @"User Initiated Quit";
  }
  else {
    uint64_t v2 = v1;
  }
  uint64_t v3 = @"Resource Exclusion";
  if (a1 != 3735883980) {
    uint64_t v3 = 0;
  }
  if (a1 == 3221229823) {
    uint64_t v4 = @"Thermal Pressure";
  }
  else {
    uint64_t v4 = v3;
  }
  if (a1 <= 3735943696) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v2;
  }
  uint64_t v6 = @"(none)";
  long long v7 = @"Watchdog Violation";
  if (a1 != 2343432205) {
    long long v7 = 0;
  }
  if (a1 == 732775916) {
    uint64_t v8 = @"Security Violation";
  }
  else {
    uint64_t v8 = v7;
  }
  if (a1) {
    uint64_t v6 = v8;
  }
  if (a1 <= 3221229822) {
    return v6;
  }
  else {
    return v5;
  }
}

void sub_19C6C80E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C6C838C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_19C6C8708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C6C8894(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SecurityLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = SecurityLibraryCore_frameworkLibrary;
  uint64_t v5 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F5DE8;
    long long v7 = *(_OWORD *)&off_1E58F5DF8;
    v3[3] = _sl_dlopen();
    SecurityLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6C8E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SecurityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  SecurityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SecurityLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = SecurityLibraryCore();
  if (!result) {
    SecurityLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getSecCertificateCreateWithDataSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSecCertificateCreateWithDataSymbolLoc_ptr;
  uint64_t v6 = getSecCertificateCreateWithDataSymbolLoc_ptr;
  if (!getSecCertificateCreateWithDataSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SecurityLibrary();
    v4[3] = (uint64_t)dlsym(v1, "SecCertificateCreateWithData");
    getSecCertificateCreateWithDataSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6C901C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSecCertificateCreateWithDataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecCertificateCreateWithData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecCertificateCreateWithDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_SecCertificateCreateWithData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))getSecCertificateCreateWithDataSymbolLoc();
  if (!v4) {
    soft_SecCertificateCreateWithData_cold_1();
  }

  return v4(a1, a2);
}

uint64_t getSecCertificateCopySubjectSummarySymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getSecCertificateCopySubjectSummarySymbolLoc_ptr;
  uint64_t v6 = getSecCertificateCopySubjectSummarySymbolLoc_ptr;
  if (!getSecCertificateCopySubjectSummarySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)SecurityLibrary();
    v4[3] = (uint64_t)dlsym(v1, "SecCertificateCopySubjectSummary");
    getSecCertificateCopySubjectSummarySymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6C91A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSecCertificateCopySubjectSummarySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SecurityLibrary();
  uint64_t result = dlsym(v2, "SecCertificateCopySubjectSummary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSecCertificateCopySubjectSummarySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_SecCertificateCopySubjectSummary(uint64_t a1)
{
  SecCertificateCopySubjectSummarySymbolLoc = (uint64_t (*)(uint64_t))getSecCertificateCopySubjectSummarySymbolLoc();
  if (!SecCertificateCopySubjectSummarySymbolLoc) {
    soft_SecCertificateCopySubjectSummary_cold_1();
  }

  return SecCertificateCopySubjectSummarySymbolLoc(a1);
}

id __displayBuilderError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA60];
    id v11 = a2;
    id v12 = [v10 dictionary];
    double v13 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];

    [v12 setObject:v13 forKey:*MEMORY[0x1E4F28588]];
  }
  else
  {
    id v12 = 0;
  }
  double v14 = (void *)MEMORY[0x1E4F28C58];
  double v15 = (objc_class *)objc_opt_class();
  long long v16 = NSStringFromClass(v15);
  long long v17 = [v14 errorWithDomain:v16 code:a1 userInfo:v12];

  return v17;
}

void FBSSetServiceFacilityManager(void *a1)
{
  id v2 = a1;
  if ((id)__manager != v2)
  {
    id v3 = v2;
    objc_storeStrong((id *)&__manager, a1);
    id v2 = v3;
  }
}

id FBSGetServiceFacilityManager()
{
  return (id)__manager;
}

void sub_19C6CD934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6CDC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6CECC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C6CEED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C6CEF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

__CFString *NSStringFromFBSApplicationLibraryLogStep(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD) {
    return @"Uninstall";
  }
  else {
    return off_1E58F5FB8[a1 - 1];
  }
}

void FBSApplicationLibraryLogTransactionSetEnabled()
{
  _transactionLogEnabled = 1;
}

uint64_t FBSApplicationLibraryLogTransactionEnabled()
{
  return _transactionLogEnabled;
}

void sub_19C6CFD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6D1AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C6D2B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19C6D3D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FBLogWatchdog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "Watchdog");
  uint64_t v1 = FBLogWatchdog___logObj;
  FBLogWatchdog___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __FBLogAppDataStore_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "AppDataStore");
  uint64_t v1 = FBLogAppDataStore___logObj;
  FBLogAppDataStore___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id FBLogAppLaunch()
{
  if (FBLogAppLaunch_onceToken != -1) {
    dispatch_once(&FBLogAppLaunch_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)FBLogAppLaunch___logObj;

  return v0;
}

uint64_t __FBLogAppLaunch_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "AppLaunch");
  uint64_t v1 = FBLogAppLaunch___logObj;
  FBLogAppLaunch___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __FBLogInterfaceOrientationObserver_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FrontBoard", "InterfaceOrientationObserver");
  uint64_t v1 = FBLogInterfaceOrientationObserver___logObj;
  FBLogInterfaceOrientationObserver___logObj = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_19C6D558C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

__CFString *FBSProcessSchedulingPolicyDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_1E58F6910[a1];
  }
}

__CFString *FBSProcessGraphicsPolicyDescription(uint64_t a1)
{
  uint64_t v1 = @"(unknown)";
  if (a1 == 1) {
    uint64_t v1 = @"full";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"none";
  }
}

__CFString *FBSProcessJetsamPolicyDescription(uint64_t a1)
{
  uint64_t v1 = @"(unknown)";
  if (a1 == 1) {
    uint64_t v1 = @"foreground";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"default";
  }
}

__CFString *FBSSceneEventSourceDescription(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E58F6948[a1];
  }
}

uint64_t InstallCoordinationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = InstallCoordinationLibraryCore_frameworkLibrary;
  uint64_t v5 = InstallCoordinationLibraryCore_frameworkLibrary;
  if (!InstallCoordinationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F6970;
    long long v7 = *(_OWORD *)&off_1E58F6980;
    v3[3] = _sl_dlopen();
    InstallCoordinationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6DA410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __InstallCoordinationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  InstallCoordinationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t InstallCoordinationLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = InstallCoordinationLibraryCore();
  if (!result) {
    InstallCoordinationLibrary_cold_1(&v1);
  }
  return result;
}

id getIXAppInstallCoordinatorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIXAppInstallCoordinatorClass_softClass;
  uint64_t v7 = getIXAppInstallCoordinatorClass_softClass;
  if (!getIXAppInstallCoordinatorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIXAppInstallCoordinatorClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getIXAppInstallCoordinatorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DA5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXAppInstallCoordinatorClass_block_invoke(uint64_t a1)
{
  InstallCoordinationLibrary();
  Class result = objc_getClass("IXAppInstallCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIXAppInstallCoordinatorClass_block_invoke_cold_1();
  }
  getIXAppInstallCoordinatorClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIXUninstallOptionsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIXUninstallOptionsClass_softClass;
  uint64_t v7 = getIXUninstallOptionsClass_softClass;
  if (!getIXUninstallOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIXUninstallOptionsClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getIXUninstallOptionsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DA714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXUninstallOptionsClass_block_invoke(uint64_t a1)
{
  InstallCoordinationLibrary();
  Class result = objc_getClass("IXUninstallOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIXUninstallOptionsClass_block_invoke_cold_1();
  }
  getIXUninstallOptionsClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getIXApplicationIdentityClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIXApplicationIdentityClass_softClass;
  uint64_t v7 = getIXApplicationIdentityClass_softClass;
  if (!getIXApplicationIdentityClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIXApplicationIdentityClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getIXApplicationIdentityClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DA850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIXApplicationIdentityClass_block_invoke(uint64_t a1)
{
  InstallCoordinationLibrary();
  Class result = objc_getClass("IXApplicationIdentity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIXApplicationIdentityClass_block_invoke_cold_1();
  }
  getIXApplicationIdentityClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getIXStringForUninstallDispositionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIXStringForUninstallDispositionSymbolLoc_ptr;
  uint64_t v6 = getIXStringForUninstallDispositionSymbolLoc_ptr;
  if (!getIXStringForUninstallDispositionSymbolLoc_ptr)
  {
    id v1 = (void *)InstallCoordinationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "IXStringForUninstallDisposition");
    getIXStringForUninstallDispositionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6DA998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIXStringForUninstallDispositionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)InstallCoordinationLibrary();
  Class result = dlsym(v2, "IXStringForUninstallDisposition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIXStringForUninstallDispositionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_IXStringForUninstallDisposition(uint64_t a1)
{
  IXStringForUninstallDispositionSymbolLoc = (uint64_t (*)(uint64_t))getIXStringForUninstallDispositionSymbolLoc();
  if (!IXStringForUninstallDispositionSymbolLoc) {
    soft_IXStringForUninstallDisposition_cold_1();
  }

  return IXStringForUninstallDispositionSymbolLoc(a1);
}

uint64_t EmbeddedDataResetLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = EmbeddedDataResetLibraryCore_frameworkLibrary;
  uint64_t v5 = EmbeddedDataResetLibraryCore_frameworkLibrary;
  if (!EmbeddedDataResetLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F69B0;
    long long v7 = *(_OWORD *)&off_1E58F69C0;
    v3[3] = _sl_dlopen();
    EmbeddedDataResetLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6DAC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __EmbeddedDataResetLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  EmbeddedDataResetLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t EmbeddedDataResetLibrary()
{
  id v1 = 0;
  uint64_t result = EmbeddedDataResetLibraryCore();
  if (!result) {
    EmbeddedDataResetLibrary_cold_1(&v1);
  }
  return result;
}

id getDDRResetServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDRResetServiceClass_softClass;
  uint64_t v7 = getDDRResetServiceClass_softClass;
  if (!getDDRResetServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetServiceClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getDDRResetServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DAE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetServiceClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetServiceClass_block_invoke_cold_1();
  }
  getDDRResetServiceClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDRResetRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDRResetRequestClass_softClass;
  uint64_t v7 = getDDRResetRequestClass_softClass;
  if (!getDDRResetRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetRequestClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getDDRResetRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DAF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetRequestClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetRequestClass_block_invoke_cold_1();
  }
  getDDRResetRequestClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getDDRResetOptionsClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDDRResetOptionsClass_softClass;
  uint64_t v7 = getDDRResetOptionsClass_softClass;
  if (!getDDRResetOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDDRResetOptionsClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getDDRResetOptionsClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DB0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDDRResetOptionsClass_block_invoke(uint64_t a1)
{
  EmbeddedDataResetLibrary();
  Class result = objc_getClass("DDRResetOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDDRResetOptionsClass_block_invoke_cold_1();
  }
  getDDRResetOptionsClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id FBSSceneSnapshotErrorForCode(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = @"invalid parameters";
  switch(a1)
  {
    case 0:
      goto LABEL_7;
    case 1:
      goto LABEL_6;
    case 2:
      uint64_t v3 = @"the request was denied";
      goto LABEL_6;
    case 3:
      uint64_t v3 = @"the request was canceled";
      goto LABEL_6;
    case 4:
      uint64_t v3 = @"an unrelated condition or state was not satisfied";
      goto LABEL_6;
    default:
      uint64_t v3 = @"an unknown error occurred";
LABEL_6:
      uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = *MEMORY[0x1E4F28588];
      v8[0] = *MEMORY[0x1E4F28568];
      v8[1] = v5;
      v9[0] = @"an error occurred during a scene snapshotting operation";
      v9[1] = v3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
      uint64_t v2 = [v4 errorWithDomain:@"FBSSceneSnapshotErrorDomain" code:a1 userInfo:v6];

LABEL_7:
      return v2;
  }
}

id FBSSceneSnapshotActionResponseForErrorCode(uint64_t a1)
{
  id v1 = FBSSceneSnapshotErrorForCode(a1);
  uint64_t v2 = [off_1E58F44C0 responseForError:v1];

  return v2;
}

void sub_19C6DC6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ManagedConfigurationLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  uint64_t v5 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F6AE8;
    long long v7 = *(_OWORD *)&off_1E58F6AF8;
    v3[3] = _sl_dlopen();
    ManagedConfigurationLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6DCA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ManagedConfigurationLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  id v1 = 0;
  uint64_t result = ManagedConfigurationLibraryCore();
  if (!result) {
    ManagedConfigurationLibrary_cold_1(&v1);
  }
  return result;
}

id getMCProfileConnectionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6DCC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMCProfileConnectionClass_block_invoke_cold_1();
  }
  getMCProfileConnectionClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getMCManagedAppsChangedNotificationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMCManagedAppsChangedNotificationSymbolLoc_ptr;
  uint64_t v6 = getMCManagedAppsChangedNotificationSymbolLoc_ptr;
  if (!getMCManagedAppsChangedNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)ManagedConfigurationLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MCManagedAppsChangedNotification");
    getMCManagedAppsChangedNotificationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6DCD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMCManagedAppsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ManagedConfigurationLibrary();
  Class result = dlsym(v2, "MCManagedAppsChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCManagedAppsChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getMCManagedAppsChangedNotification()
{
  MCManagedAppsChangedNotificationSymbolLoc = (void **)getMCManagedAppsChangedNotificationSymbolLoc();
  if (!MCManagedAppsChangedNotificationSymbolLoc) {
    getMCManagedAppsChangedNotification_cold_1();
  }
  id v1 = *MCManagedAppsChangedNotificationSymbolLoc;

  return v1;
}

uint64_t _handleProfilesChangedNotification(uint64_t a1, void *a2)
{
  return [a2 _reloadProfiles];
}

void sub_19C6DD8C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  fbs_release((const void **)va);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBSApplicationPlaceholderProgressState(unint64_t a1)
{
  if (a1 > 6) {
    return @"(unknown)";
  }
  else {
    return (__CFString *)*((void *)&off_1E58F6B58 + a1);
  }
}

__CFString *FBSApplicationLibraryErrorCodeDescription(unint64_t a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return off_1E58F6E90[a1];
  }
}

void sub_19C6DFDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19C6E1538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
}

uint64_t _proxyPassesInclusionFilter(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (v6 && (v6[2](v6, v5) & 1) == 0)
  {
    uint64_t v9 = [v5 bundleIdentifier];
    if ([v7 containsObject:v9]) {
      uint64_t v8 = [v5 fbs_isLaunchProhibited] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = [v5 fbs_isLaunchProhibited] ^ 1;
  }

  return v8;
}

uint64_t _proxyPassesIdentityFilter(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = a3;
  id v10 = a4;
  if (v9 && (v9[2](v9, v7, v8) & 1) == 0)
  {
    id v12 = [v8 bundleIdentifier];
    if ([v10 containsObject:v12]) {
      uint64_t v11 = [v8 fbs_isLaunchProhibited] ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = [v8 fbs_isLaunchProhibited] ^ 1;
  }

  return v11;
}

void sub_19C6E6F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t _addResultToArrayCreatingArrayIfNecessary(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    id v5 = *a1;
    id v7 = v4;
    if (!*a1)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *a1 = v5;
    }
    id v3 = (id)[v5 addObject:v7];
    id v4 = v7;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

void sub_19C6E7F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_19C6E891C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_19C6E8F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 144), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromFBSSceneLayerType(unint64_t a1)
{
  if (a1 >= 3)
  {
    [NSString stringWithFormat:@"(undefined: %ld)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58F6EE8[a1];
  }

  return v1;
}

__CFString *NSStringFromFBSSceneLayerAlignment(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"display";
    }
    else
    {
      [NSString stringWithFormat:@"(%li)", a1];
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"scene";
  }
  return v2;
}

__CFString *FBSDisplayTypeName(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_1E58F6F00[a1];
  }
}

__CFString *FBSDisplayOverscanCompensationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 4)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E58F6F48[a1 + 1];
  }

  return v1;
}

id FBSDisplayOverscanCompensationToCADisplayOverscanAdjustment(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = getkCADisplayInsetBounds();
  }
  else if (a1 == 1)
  {
    uint64_t v1 = getkCADisplayScaleContent();
  }
  else if (a1)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = getkCADisplayNone();
  }

  return v1;
}

id FBSDisplayGamutToCADisplayGamut(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = getkCADisplayModeGamutP3();
  }
  else if (a1)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = getkCADisplayModeGamutSRGB();
  }

  return v1;
}

id FBSDisplayHDRModeToCADisplayHDRMode(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v1 = getkCADisplayModeDolby();
  }
  else if (a1 == 1)
  {
    uint64_t v1 = getkCADisplayModeHDR10();
  }
  else if (a1)
  {
    uint64_t v1 = 0;
  }
  else
  {
    uint64_t v1 = getkCADisplayModeSDR();
  }

  return v1;
}

__CFString *FBSDisplayRotationDescription(unint64_t a1)
{
  if (a1 >= 4)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E58F6FA0[a1];
  }

  return v1;
}

double FBSDisplayRotationRadians(uint64_t a1)
{
  double result = 0.0;
  if ((unint64_t)(a1 - 1) <= 2) {
    return dbl_19C722C98[a1 - 1];
  }
  return result;
}

void FBSDisplayRotationFromRadians()
{
}

id FBSDisplayRotationToCADisplayRotation(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v1 = getkCADisplayOrientationRotation90();
      break;
    case 2:
      uint64_t v1 = getkCADisplayOrientationRotation180();
      break;
    case 3:
      uint64_t v1 = getkCADisplayOrientationRotation270();
      break;
    default:
      uint64_t v1 = getkCADisplayOrientationRotation0();
      break;
  }

  return v1;
}

__CFString *FBSDisplayConnectionTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 5)
  {
    [NSString stringWithFormat:@"(%li)", a1];
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E58F6FC0[a1 + 1];
  }

  return v1;
}

void sub_19C6EC400(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromDiagnosticReportType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_1E58F6FE8[a1];
  }
}

void sub_19C6EDA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6EDC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19C6EE320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_19C6F059C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C6F07A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C6F0910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6F0B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6F2F0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19C6F365C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1)
{
  return MEMORY[0x1F40E7228](v2, v1, a1);
}

void sub_19C6F77B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t libmisLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = libmisLibraryCore_frameworkLibrary;
  uint64_t v5 = libmisLibraryCore_frameworkLibrary;
  if (!libmisLibraryCore_frameworkLibrary)
  {
    long long v6 = xmmword_1E58F75E8;
    uint64_t v7 = 0;
    v3[3] = _sl_dlopen();
    libmisLibraryCore_frameworkLibrary = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_19C6F87C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libmisLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libmisLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libmisLibrary()
{
  uint64_t v1 = 0;
  uint64_t result = libmisLibraryCore();
  if (!result) {
    libmisLibrary_cold_1(&v1);
  }
  return result;
}

uint64_t getMISQueryBlacklistForBundleSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISQueryBlacklistForBundleSymbolLoc_ptr;
  uint64_t v6 = getMISQueryBlacklistForBundleSymbolLoc_ptr;
  if (!getMISQueryBlacklistForBundleSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISQueryBlacklistForBundle");
    getMISQueryBlacklistForBundleSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F89A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISQueryBlacklistForBundleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISQueryBlacklistForBundle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISQueryBlacklistForBundleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISQueryBlacklistForBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  MISQueryBlacklistForBundleSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))getMISQueryBlacklistForBundleSymbolLoc();
  if (!MISQueryBlacklistForBundleSymbolLoc) {
    soft_MISQueryBlacklistForBundle_cold_1();
  }

  return MISQueryBlacklistForBundleSymbolLoc(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t getMISQueryBlacklistForCdHashSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISQueryBlacklistForCdHashSymbolLoc_ptr;
  uint64_t v6 = getMISQueryBlacklistForCdHashSymbolLoc_ptr;
  if (!getMISQueryBlacklistForCdHashSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISQueryBlacklistForCdHash");
    getMISQueryBlacklistForCdHashSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F8B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISQueryBlacklistForCdHashSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISQueryBlacklistForCdHash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISQueryBlacklistForCdHashSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISQueryBlacklistForCdHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MISQueryBlacklistForCdHashSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))getMISQueryBlacklistForCdHashSymbolLoc();
  if (!MISQueryBlacklistForCdHashSymbolLoc) {
    soft_MISQueryBlacklistForCdHash_cold_1();
  }

  return MISQueryBlacklistForCdHashSymbolLoc(a1, a2, a3, a4, a5);
}

uint64_t getMISAppApprovalStateSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISAppApprovalStateSymbolLoc_ptr;
  uint64_t v6 = getMISAppApprovalStateSymbolLoc_ptr;
  if (!getMISAppApprovalStateSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISAppApprovalState");
    getMISAppApprovalStateSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F8D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISAppApprovalStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISAppApprovalState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISAppApprovalStateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISAppApprovalState(uint64_t a1, uint64_t a2)
{
  MISAppApprovalStateSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISAppApprovalStateSymbolLoc();
  if (!MISAppApprovalStateSymbolLoc) {
    soft_MISAppApprovalState_cold_1();
  }

  return MISAppApprovalStateSymbolLoc(a1, a2);
}

uint64_t getMISValidateUPPSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISValidateUPPSymbolLoc_ptr;
  uint64_t v6 = getMISValidateUPPSymbolLoc_ptr;
  if (!getMISValidateUPPSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISValidateUPP");
    getMISValidateUPPSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F8EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISValidateUPPSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISValidateUPP");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISValidateUPPSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void soft_MISValidateUPP(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  MISValidateUPPSymbolLoc = (void (*)(uint64_t, id, id))getMISValidateUPPSymbolLoc();
  if (!MISValidateUPPSymbolLoc) {
    soft_MISValidateUPP_cold_1();
  }
  MISValidateUPPSymbolLoc(a1, v7, v5);
}

uint64_t getMISCopyErrorStringForErrorCodeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISCopyErrorStringForErrorCodeSymbolLoc_ptr;
  uint64_t v6 = getMISCopyErrorStringForErrorCodeSymbolLoc_ptr;
  if (!getMISCopyErrorStringForErrorCodeSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISCopyErrorStringForErrorCode");
    getMISCopyErrorStringForErrorCodeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISCopyErrorStringForErrorCodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISCopyErrorStringForErrorCode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISCopyErrorStringForErrorCodeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISCopyErrorStringForErrorCode(uint64_t a1)
{
  MISCopyErrorStringForErrorCodeSymbolLoc = (uint64_t (*)(uint64_t))getMISCopyErrorStringForErrorCodeSymbolLoc();
  if (!MISCopyErrorStringForErrorCodeSymbolLoc) {
    soft_MISCopyErrorStringForErrorCode_cold_1();
  }

  return MISCopyErrorStringForErrorCodeSymbolLoc(a1);
}

uint64_t getMISValidateSignatureAndCopyInfoSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISValidateSignatureAndCopyInfoSymbolLoc_ptr;
  uint64_t v6 = getMISValidateSignatureAndCopyInfoSymbolLoc_ptr;
  if (!getMISValidateSignatureAndCopyInfoSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISValidateSignatureAndCopyInfo");
    getMISValidateSignatureAndCopyInfoSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F91E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISValidateSignatureAndCopyInfoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISValidateSignatureAndCopyInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISValidateSignatureAndCopyInfoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISValidateSignatureAndCopyInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MISValidateSignatureAndCopyInfoSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getMISValidateSignatureAndCopyInfoSymbolLoc();
  if (!MISValidateSignatureAndCopyInfoSymbolLoc) {
    soft_MISValidateSignatureAndCopyInfo_cold_1();
  }

  return MISValidateSignatureAndCopyInfoSymbolLoc(a1, a2, a3);
}

uint64_t getMISValidationCopySignatureVersionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISValidationCopySignatureVersionSymbolLoc_ptr;
  uint64_t v6 = getMISValidationCopySignatureVersionSymbolLoc_ptr;
  if (!getMISValidationCopySignatureVersionSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISValidationCopySignatureVersion");
    getMISValidationCopySignatureVersionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISValidationCopySignatureVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISValidationCopySignatureVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISValidationCopySignatureVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISValidationCopySignatureVersion(uint64_t a1, uint64_t a2)
{
  MISValidationCopySignatureVersionSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISValidationCopySignatureVersionSymbolLoc();
  if (!MISValidationCopySignatureVersionSymbolLoc) {
    soft_MISValidationCopySignatureVersion_cold_1();
  }

  return MISValidationCopySignatureVersionSymbolLoc(a1, a2);
}

uint64_t getkMISValidationOptionUnauthoritativeLaunchSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr;
  uint64_t v6 = getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr;
  if (!getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISValidationOptionUnauthoritativeLaunch");
    getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISValidationOptionUnauthoritativeLaunch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISValidationOptionUnauthoritativeLaunchSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISValidationOptionUnauthoritativeLaunch()
{
  uint64_t v0 = getkMISValidationOptionUnauthoritativeLaunchSymbolLoc();
  if (!v0) {
    getkMISValidationOptionUnauthoritativeLaunch_cold_1();
  }
  return *(void *)v0;
}

uint64_t getkMISValidationOptionAuthoritativeLaunchSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr;
  uint64_t v6 = getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr;
  if (!getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISValidationOptionAuthoritativeLaunch");
    getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISValidationOptionAuthoritativeLaunchSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISValidationOptionAuthoritativeLaunch");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISValidationOptionAuthoritativeLaunchSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISValidationOptionAuthoritativeLaunch()
{
  uint64_t v0 = getkMISValidationOptionAuthoritativeLaunchSymbolLoc();
  if (!v0) {
    getkMISValidationOptionAuthoritativeLaunch_cold_1();
  }
  return *(void *)v0;
}

uint64_t getkMISValidationOptionOnlineAuthorizationSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr;
  uint64_t v6 = getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr;
  if (!getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISValidationOptionOnlineAuthorization");
    getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F97D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISValidationOptionOnlineAuthorizationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISValidationOptionOnlineAuthorization");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISValidationOptionOnlineAuthorizationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISValidationOptionOnlineAuthorization()
{
  uint64_t v0 = getkMISValidationOptionOnlineAuthorizationSymbolLoc();
  if (!v0) {
    getkMISValidationOptionOnlineAuthorization_cold_1();
  }
  return *(void *)v0;
}

uint64_t getkMISValidationOptionOnlineCheckTypeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr;
  uint64_t v6 = getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr;
  if (!getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISValidationOptionOnlineCheckType");
    getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F993C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISValidationOptionOnlineCheckTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISValidationOptionOnlineCheckType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISValidationOptionOnlineCheckTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISValidationOptionOnlineCheckType()
{
  uint64_t v0 = getkMISValidationOptionOnlineCheckTypeSymbolLoc();
  if (!v0) {
    getkMISValidationOptionOnlineCheckType_cold_1();
  }
  return *(void *)v0;
}

uint64_t getkMISMinSupportedSignatureVersionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISMinSupportedSignatureVersionSymbolLoc_ptr;
  uint64_t v6 = getkMISMinSupportedSignatureVersionSymbolLoc_ptr;
  if (!getkMISMinSupportedSignatureVersionSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISMinSupportedSignatureVersion");
    getkMISMinSupportedSignatureVersionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISMinSupportedSignatureVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISMinSupportedSignatureVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISMinSupportedSignatureVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISMinSupportedSignatureVersion()
{
  uint64_t v0 = (unsigned int *)getkMISMinSupportedSignatureVersionSymbolLoc();
  if (!v0) {
    getkMISMinSupportedSignatureVersion_cold_1();
  }
  return *v0;
}

uint64_t getkMISFutureMinSupportedSignatureVersionSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr;
  uint64_t v6 = getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr;
  if (!getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISFutureMinSupportedSignatureVersion");
    getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISFutureMinSupportedSignatureVersionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISFutureMinSupportedSignatureVersion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISFutureMinSupportedSignatureVersionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISFutureMinSupportedSignatureVersion()
{
  uint64_t v0 = (unsigned int *)getkMISFutureMinSupportedSignatureVersionSymbolLoc();
  if (!v0) {
    getkMISFutureMinSupportedSignatureVersion_cold_1();
  }
  return *v0;
}

uint64_t getkMISValidationOptionHintMainExecutablePathSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr;
  uint64_t v6 = getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr;
  if (!getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kMISValidationOptionHintMainExecutablePath");
    getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkMISValidationOptionHintMainExecutablePathSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "kMISValidationOptionHintMainExecutablePath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkMISValidationOptionHintMainExecutablePathSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkMISValidationOptionHintMainExecutablePath()
{
  uint64_t v0 = getkMISValidationOptionHintMainExecutablePathSymbolLoc();
  if (!v0) {
    getkMISValidationOptionHintMainExecutablePath_cold_1();
  }
  return *(void *)v0;
}

uint64_t getMISEnumerateInstalledProvisioningProfilesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr;
  uint64_t v6 = getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr;
  if (!getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISEnumerateInstalledProvisioningProfiles");
    getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6F9ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISEnumerateInstalledProvisioningProfilesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISEnumerateInstalledProvisioningProfiles");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISEnumerateInstalledProvisioningProfilesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISEnumerateInstalledProvisioningProfiles(uint64_t a1, void *a2)
{
  id v3 = a2;
  MISEnumerateInstalledProvisioningProfilesSymbolLoc = (uint64_t (*)(uint64_t, id))getMISEnumerateInstalledProvisioningProfilesSymbolLoc();
  if (!MISEnumerateInstalledProvisioningProfilesSymbolLoc) {
    soft_MISEnumerateInstalledProvisioningProfiles_cold_1();
  }
  uint64_t v5 = MISEnumerateInstalledProvisioningProfilesSymbolLoc(a1, v3);

  return v5;
}

uint64_t getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileGetDeveloperCertificates");
    getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileGetDeveloperCertificates");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileGetDeveloperCertificates(uint64_t a1)
{
  DeveloperCertificatesSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetDeveloperCertificatesSymbolLoc();
  if (!DeveloperCertificatesSymbolLoc) {
    soft_MISProvisioningProfileGetDeveloperCertificates_cold_1();
  }

  return DeveloperCertificatesSymbolLoc(a1);
}

uint64_t getMISProfileGetValueSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProfileGetValueSymbolLoc_ptr;
  uint64_t v6 = getMISProfileGetValueSymbolLoc_ptr;
  if (!getMISProfileGetValueSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProfileGetValue");
    getMISProfileGetValueSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProfileGetValueSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProfileGetValue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProfileGetValueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProfileGetValue(uint64_t a1, uint64_t a2)
{
  ValueSymbolLoc = (uint64_t (*)(uint64_t, uint64_t))getMISProfileGetValueSymbolLoc();
  if (!ValueSymbolLoc) {
    soft_MISProfileGetValue_cold_1();
  }

  return ValueSymbolLoc(a1, a2);
}

uint64_t getMISProvisioningProfileGetEntitlementsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileGetEntitlements");
    getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileGetEntitlementsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileGetEntitlements");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileGetEntitlementsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileGetEntitlements(uint64_t a1)
{
  EntitlementsSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetEntitlementsSymbolLoc();
  if (!EntitlementsSymbolLoc) {
    soft_MISProvisioningProfileGetEntitlements_cold_1();
  }

  return EntitlementsSymbolLoc(a1);
}

uint64_t getMISProvisioningProfileGetExpirationDateSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileGetExpirationDate");
    getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileGetExpirationDateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileGetExpirationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileGetExpirationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileGetExpirationDate(uint64_t a1)
{
  ExpirationDateSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetExpirationDateSymbolLoc();
  if (!ExpirationDateSymbolLoc) {
    soft_MISProvisioningProfileGetExpirationDate_cold_1();
  }

  return ExpirationDateSymbolLoc(a1);
}

uint64_t getMISProvisioningProfileGetUUIDSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileGetUUIDSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileGetUUIDSymbolLoc_ptr;
  if (!getMISProvisioningProfileGetUUIDSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileGetUUID");
    getMISProvisioningProfileGetUUIDSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileGetUUIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileGetUUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileGetUUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileGetUUID(uint64_t a1)
{
  UUIDSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileGetUUIDSymbolLoc();
  if (!UUIDSymbolLoc) {
    soft_MISProvisioningProfileGetUUID_cold_1();
  }

  return UUIDSymbolLoc(a1);
}

uint64_t getMISProvisioningProfileGrantsEntitlementSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr;
  if (!getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileGrantsEntitlement");
    getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileGrantsEntitlementSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileGrantsEntitlement");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileGrantsEntitlementSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileGrantsEntitlement(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MISProvisioningProfileGrantsEntitlementSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getMISProvisioningProfileGrantsEntitlementSymbolLoc();
  if (!MISProvisioningProfileGrantsEntitlementSymbolLoc) {
    soft_MISProvisioningProfileGrantsEntitlement_cold_1();
  }

  return MISProvisioningProfileGrantsEntitlementSymbolLoc(a1, a2, a3);
}

uint64_t getMISProvisioningProfileIsAppleInternalProfileSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr;
  if (!getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileIsAppleInternalProfile");
    getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FA994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileIsAppleInternalProfile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileIsAppleInternalProfileSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileIsAppleInternalProfile(uint64_t a1)
{
  IsAppleInternalProfileSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileIsAppleInternalProfileSymbolLoc();
  if (!IsAppleInternalProfileSymbolLoc) {
    soft_MISProvisioningProfileIsAppleInternalProfile_cold_1();
  }

  return IsAppleInternalProfileSymbolLoc(a1);
}

uint64_t getMISProvisioningProfileProvisionsAllDevicesSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr;
  uint64_t v6 = getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr;
  if (!getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)libmisLibrary();
    v4[3] = (uint64_t)dlsym(v1, "MISProvisioningProfileProvisionsAllDevices");
    getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FAB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libmisLibrary();
  uint64_t result = dlsym(v2, "MISProvisioningProfileProvisionsAllDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMISProvisioningProfileProvisionsAllDevicesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_MISProvisioningProfileProvisionsAllDevices(uint64_t a1)
{
  MISProvisioningProfileProvisionsAllDevicesSymbolLoc = (uint64_t (*)(uint64_t))getMISProvisioningProfileProvisionsAllDevicesSymbolLoc();
  if (!MISProvisioningProfileProvisionsAllDevicesSymbolLoc) {
    soft_MISProvisioningProfileProvisionsAllDevices_cold_1();
  }

  return MISProvisioningProfileProvisionsAllDevicesSymbolLoc(a1);
}

id getMISLaunchWarningDatabaseClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMISLaunchWarningDatabaseClass_softClass;
  uint64_t v7 = getMISLaunchWarningDatabaseClass_softClass;
  if (!getMISLaunchWarningDatabaseClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMISLaunchWarningDatabaseClass_block_invoke;
    v3[3] = &unk_1E58F54C8;
    v3[4] = &v4;
    __getMISLaunchWarningDatabaseClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_19C6FAC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMISLaunchWarningDatabaseClass_block_invoke(uint64_t a1)
{
  libmisLibrary();
  Class result = objc_getClass("MISLaunchWarningDatabase");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getMISLaunchWarningDatabaseClass_block_invoke_cold_1();
  }
  getMISLaunchWarningDatabaseClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19C6FAF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6FBD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19C6FC620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

BOOL FBSProcessResourceTypeIsTimeInterval(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t FBSProcessResourceAllowanceMakeWithValue@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  a3[2] = 0;
  return result;
}

uint64_t FBSProcessResourceAllowanceMakeWithTimeInterval@<X0>(uint64_t result@<X0>, void *a2@<X8>, double a3@<D0>)
{
  unint64_t v3 = (unint64_t)(a3 * 1000.0);
  if (a3 <= 0.0) {
    unint64_t v3 = 0;
  }
  *a2 = result;
  a2[1] = v3;
  a2[2] = 0;
  return result;
}

void FBSProcessResourceAllowanceMakeWithScheduledTimeInterval(void *a1@<X8>, double a2@<D0>)
{
  unint64_t v2 = (unint64_t)(a2 * 1000.0);
  if (a2 <= 0.0) {
    unint64_t v2 = 0;
  }
  *a1 = 2;
  a1[1] = v2;
  a1[2] = 0;
}

int8x16_t FBSProcessResourceAllowanceMakeWithScheduledTimeIntervalAndRefreshInterval@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>)
{
  a2.f64[1] = a3;
  *(void *)a1 = 2;
  int8x16_t result = vandq_s8((int8x16_t)vcvtq_u64_f64(vmulq_f64(a2, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL))), (int8x16_t)vcgtzq_f64(a2));
  *(int8x16_t *)(a1 + 8) = result;
  return result;
}

double FBSProcessResourceAllowanceScale@<D0>(void *a1@<X0>, void *a2@<X8>, double a3@<D0>)
{
  double result = (double)(unint64_t)a1[1] * a3;
  *a2 = *a1;
  a2[1] = (unint64_t)result;
  a2[2] = a1[2];
  return result;
}

double FBSProcessResourceAllowanceExtend@<D0>(void *a1@<X0>, void *a2@<X8>, double a3@<D0>)
{
  double result = (double)(unint64_t)a1[1] + a3;
  *a2 = *a1;
  a2[1] = (unint64_t)result;
  a2[2] = a1[2];
  return result;
}

uint64_t FBSProcessResourceAllowanceGetType(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t FBSProcessResourceAllowanceValue(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

id NSStringFromProcessResourceValue(uint64_t a1, unint64_t a2)
{
  if ((unint64_t)(a1 - 1) > 1) {
    [NSString stringWithFormat:@"%llu", a2];
  }
  else {
  unint64_t v2 = [NSString stringWithFormat:@"%.3fs", (double)a2 / 1000.0];
  }

  return v2;
}

uint64_t __QuartzCoreLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  QuartzCoreLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkCADisplayNoneSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayNoneSymbolLoc_ptr;
  uint64_t v6 = getkCADisplayNoneSymbolLoc_ptr;
  if (!getkCADisplayNoneSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayNone");
    getkCADisplayNoneSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FDB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCADisplayNoneSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCADisplayNone()
{
  uint64_t v0 = (void **)getkCADisplayNoneSymbolLoc();
  if (!v0) {
    getkCADisplayNone_cold_1();
  }
  id v1 = *v0;

  return v1;
}

void *__getkCADisplayScaleContentSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayScaleContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayScaleContentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCADisplayInsetBoundsSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayInsetBounds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayInsetBoundsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkCADisplayOrientationRotation0SymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayOrientationRotation0SymbolLoc_ptr;
  uint64_t v6 = getkCADisplayOrientationRotation0SymbolLoc_ptr;
  if (!getkCADisplayOrientationRotation0SymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayOrientationRotation0");
    getkCADisplayOrientationRotation0SymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FDD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCADisplayOrientationRotation0SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayOrientationRotation0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayOrientationRotation0SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCADisplayOrientationRotation0()
{
  uint64_t v0 = (void **)getkCADisplayOrientationRotation0SymbolLoc();
  if (!v0) {
    getkCADisplayOrientationRotation0_cold_1();
  }
  id v1 = *v0;

  return v1;
}

void *__getkCADisplayOrientationRotation90SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayOrientationRotation90");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayOrientationRotation90SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCADisplayOrientationRotation180SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayOrientationRotation180");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayOrientationRotation180SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCADisplayOrientationRotation270SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayOrientationRotation270");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayOrientationRotation270SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkCADisplayModeGamutSRGBSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayModeGamutSRGBSymbolLoc_ptr;
  uint64_t v6 = getkCADisplayModeGamutSRGBSymbolLoc_ptr;
  if (!getkCADisplayModeGamutSRGBSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayModeGamutSRGB");
    getkCADisplayModeGamutSRGBSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FDF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCADisplayModeGamutSRGBSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayModeGamutSRGB");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayModeGamutSRGBSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCADisplayModeGamutSRGB()
{
  uint64_t v0 = (void **)getkCADisplayModeGamutSRGBSymbolLoc();
  if (!v0) {
    getkCADisplayModeGamutSRGB_cold_1();
  }
  id v1 = *v0;

  return v1;
}

void *__getkCADisplayModeGamutP3SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayModeGamutP3");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayModeGamutP3SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkCADisplayModeSDRSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCADisplayModeSDRSymbolLoc_ptr;
  uint64_t v6 = getkCADisplayModeSDRSymbolLoc_ptr;
  if (!getkCADisplayModeSDRSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCADisplayModeSDR");
    getkCADisplayModeSDRSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCADisplayModeSDRSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayModeSDR");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayModeSDRSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCADisplayModeSDR()
{
  uint64_t v0 = (void **)getkCADisplayModeSDRSymbolLoc();
  if (!v0) {
    getkCADisplayModeSDR_cold_1();
  }
  id v1 = *v0;

  return v1;
}

void *__getkCADisplayModeHDR10SymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayModeHDR10");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayModeHDR10SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCADisplayModeDolbySymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCADisplayModeDolby");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCADisplayModeDolbySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkCASnapshotContextIdSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotContextIdSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotContextIdSymbolLoc_ptr;
  if (!getkCASnapshotContextIdSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotContextId");
    getkCASnapshotContextIdSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotContextIdSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotContextId");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotContextIdSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotContextId()
{
  uint64_t v0 = (void **)getkCASnapshotContextIdSymbolLoc();
  if (!v0) {
    getkCASnapshotContextId_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotContextListSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotContextListSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotContextListSymbolLoc_ptr;
  if (!getkCASnapshotContextListSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotContextList");
    getkCASnapshotContextListSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotContextListSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotContextList");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotContextListSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotContextList()
{
  uint64_t v0 = (void **)getkCASnapshotContextListSymbolLoc();
  if (!v0) {
    getkCASnapshotContextList_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotDisplayNameSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotDisplayNameSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotDisplayNameSymbolLoc_ptr;
  if (!getkCASnapshotDisplayNameSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotDisplayName");
    getkCASnapshotDisplayNameSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotDisplayNameSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotDisplayName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotDisplayNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotDisplayName()
{
  uint64_t v0 = (void **)getkCASnapshotDisplayNameSymbolLoc();
  if (!v0) {
    getkCASnapshotDisplayName_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotFormatOpaqueSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotFormatOpaqueSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotFormatOpaqueSymbolLoc_ptr;
  if (!getkCASnapshotFormatOpaqueSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotFormatOpaque");
    getkCASnapshotFormatOpaqueSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotFormatOpaqueSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotFormatOpaque");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotFormatOpaqueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotFormatOpaque()
{
  uint64_t v0 = (void **)getkCASnapshotFormatOpaqueSymbolLoc();
  if (!v0) {
    getkCASnapshotFormatOpaque_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotFormatWideGamutSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotFormatWideGamutSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotFormatWideGamutSymbolLoc_ptr;
  if (!getkCASnapshotFormatWideGamutSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotFormatWideGamut");
    getkCASnapshotFormatWideGamutSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FE940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotFormatWideGamutSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotFormatWideGamut");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotFormatWideGamutSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotFormatWideGamut()
{
  uint64_t v0 = (void **)getkCASnapshotFormatWideGamutSymbolLoc();
  if (!v0) {
    getkCASnapshotFormatWideGamut_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotModeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotModeSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotModeSymbolLoc_ptr;
  if (!getkCASnapshotModeSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotMode");
    getkCASnapshotModeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FEAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotModeSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotMode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotModeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotMode()
{
  uint64_t v0 = (void **)getkCASnapshotModeSymbolLoc();
  if (!v0) {
    getkCASnapshotMode_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotModeIncludeContextListSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotModeIncludeContextListSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotModeIncludeContextListSymbolLoc_ptr;
  if (!getkCASnapshotModeIncludeContextListSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotModeIncludeContextList");
    getkCASnapshotModeIncludeContextListSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FEC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotModeIncludeContextListSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotModeIncludeContextList");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotModeIncludeContextListSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotModeIncludeContextList()
{
  uint64_t v0 = (void **)getkCASnapshotModeIncludeContextListSymbolLoc();
  if (!v0) {
    getkCASnapshotModeIncludeContextList_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotOriginXSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotOriginXSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotOriginXSymbolLoc_ptr;
  if (!getkCASnapshotOriginXSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotOriginX");
    getkCASnapshotOriginXSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FED9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotOriginXSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotOriginX");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotOriginXSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotOriginX()
{
  uint64_t v0 = (void **)getkCASnapshotOriginXSymbolLoc();
  if (!v0) {
    getkCASnapshotOriginX_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotOriginYSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotOriginYSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotOriginYSymbolLoc_ptr;
  if (!getkCASnapshotOriginYSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotOriginY");
    getkCASnapshotOriginYSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FEF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotOriginYSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotOriginY");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotOriginYSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotOriginY()
{
  uint64_t v0 = (void **)getkCASnapshotOriginYSymbolLoc();
  if (!v0) {
    getkCASnapshotOriginY_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotSizeHeightSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotSizeHeightSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotSizeHeightSymbolLoc_ptr;
  if (!getkCASnapshotSizeHeightSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotSizeHeight");
    getkCASnapshotSizeHeightSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FF084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotSizeHeightSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotSizeHeight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotSizeHeightSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotSizeHeight()
{
  uint64_t v0 = (void **)getkCASnapshotSizeHeightSymbolLoc();
  if (!v0) {
    getkCASnapshotSizeHeight_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotSizeWidthSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotSizeWidthSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotSizeWidthSymbolLoc_ptr;
  if (!getkCASnapshotSizeWidthSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotSizeWidth");
    getkCASnapshotSizeWidthSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FF1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotSizeWidthSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotSizeWidth");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotSizeWidthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotSizeWidth()
{
  uint64_t v0 = (void **)getkCASnapshotSizeWidthSymbolLoc();
  if (!v0) {
    getkCASnapshotSizeWidth_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotTransformSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotTransformSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotTransformSymbolLoc_ptr;
  if (!getkCASnapshotTransformSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotTransform");
    getkCASnapshotTransformSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FF36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotTransformSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotTransformSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotTransform()
{
  uint64_t v0 = (void **)getkCASnapshotTransformSymbolLoc();
  if (!v0) {
    getkCASnapshotTransform_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getkCASnapshotMapCacheAttributeSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getkCASnapshotMapCacheAttributeSymbolLoc_ptr;
  uint64_t v6 = getkCASnapshotMapCacheAttributeSymbolLoc_ptr;
  if (!getkCASnapshotMapCacheAttributeSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "kCASnapshotMapCacheAttribute");
    getkCASnapshotMapCacheAttributeSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FF4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCASnapshotMapCacheAttributeSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "kCASnapshotMapCacheAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCASnapshotMapCacheAttributeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getkCASnapshotMapCacheAttribute()
{
  uint64_t v0 = (void **)getkCASnapshotMapCacheAttributeSymbolLoc();
  if (!v0) {
    getkCASnapshotMapCacheAttribute_cold_1();
  }
  id v1 = *v0;

  return v1;
}

uint64_t getCARenderServerCreateSnapshotsSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getCARenderServerCreateSnapshotsSymbolLoc_ptr;
  uint64_t v6 = getCARenderServerCreateSnapshotsSymbolLoc_ptr;
  if (!getCARenderServerCreateSnapshotsSymbolLoc_ptr)
  {
    id v1 = (void *)QuartzCoreLibrary();
    v4[3] = (uint64_t)dlsym(v1, "CARenderServerCreateSnapshots");
    getCARenderServerCreateSnapshotsSymbolLoc_ptr = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19C6FF654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCARenderServerCreateSnapshotsSymbolLoc_block_invoke(uint64_t a1)
{
  unint64_t v2 = (void *)QuartzCoreLibrary();
  uint64_t result = dlsym(v2, "CARenderServerCreateSnapshots");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCARenderServerCreateSnapshotsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t soft_CARenderServerCreateSnapshots(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  SnapshotsSymbolLoc = (uint64_t (*)(uint64_t, uint64_t, uint64_t, id))getCARenderServerCreateSnapshotsSymbolLoc();
  if (!SnapshotsSymbolLoc) {
    soft_CARenderServerCreateSnapshots_cold_1();
  }
  uint64_t v9 = SnapshotsSymbolLoc(a1, a2, a3, v7);

  return v9;
}

__CFString *FBSDisplayAttachmentDescription(uint64_t a1)
{
  if (a1 >= 5)
  {
    [NSString stringWithFormat:@"(%i)", a1];
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E58F7878[(int)a1];
  }

  return v1;
}

void FBSSettingForExtensionSelector_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"FBSSetting * _Nullable FBSSettingForExtensionSelector(__unsafe_unretained Class _Nonnull, SEL _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSSettingForExtensionSelector_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"FBSSetting * _Nullable FBSSettingForExtensionSelector(__unsafe_unretained Class _Nonnull, SEL _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSettingsExtension_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSRealizeSettingsExtension(__unsafe_unretained Class _Nonnull, __unsafe_unretained FBSSettingsExtensionType _Nonnull)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSceneExtension_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSceneExtension_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSceneExtension_cold_3()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSRealizeSceneExtension(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _realizeSettingsExtension_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _realizeSettingsExtension_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _realizeSettingsExtension_cold_4()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_6()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_8()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_10()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_12()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_14()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_16()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_18()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_20()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_22()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_24()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_26()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_28()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_30()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _realizeSettingsExtension_cold_31()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _realizeSettingsExtension_cold_32()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _realizeSettingsExtension_cold_33()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSubclassExtension_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSRealizeSubclassExtension(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSRealizeSubclassExtension_cold_3()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void FBSRealizeSubclassExtension_cold_5()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void FBSRealizeSubclassExtension_cold_7()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void FBSRealizeSubclassExtension_cold_9()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void FBSIngestSubclassProperties_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void FBSIngestSubclassProperties(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _ingestPropertiesFromSettingsSubclass_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _ingestPropertiesFromSettingsSubclass_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _ingestPropertiesFromSettingsSubclass_cold_3()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _ingestPropertiesFromSettingsSubclass(__unsafe_unretained Class)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _ingestPropertiesFromSettingsSubclass_cold_4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_19C680000, log, OS_LOG_TYPE_DEBUG, "Ignoring %{public}@ since it defines no properties.", buf, 0xCu);
}

void _ingestPropertiesFromSettingsSubclass_cold_6()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _ingestPropertiesFromSettingsSubclass_cold_7(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_19C680000, log, OS_LOG_TYPE_DEBUG, "Ignoring %{public}@ as we found no valid properties on the class.", buf, 0xCu);
}

void _ingestPropertiesFromSettingsSubclass_cold_10()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _ingestPropertiesFromSettingsSubclass_cold_12()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void _ingestPropertiesFromSettingsSubclass_cold_13()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_16(&dword_19C680000, v0, v1, "Unable to derive immutable class from %{public}@. Please implement +[%{public}@ immutableSubclass]", v2);
}

void _ingestPropertiesFromSettingsSubclass_cold_14()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_16(&dword_19C680000, v0, v1, "Found no immutable variant of %{public}@. Please implement +[%{public}@ immutableSubclass].", v2);
}

void _ingestPropertiesFromSettingsSubclass_cold_15()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16(&dword_19C680000, v0, (uint64_t)v0, "Derived %{public}@ from %{public}@.", v1);
}

void _ingestPropertiesFromSettingsSubclass_cold_16()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_16(&dword_19C680000, v0, v1, "Found no mutable variant of %{public}@. Please implement +[%{public}@ mutableSubclass].", v2);
}

void FBSSubclassHasBeenIngested_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"BOOL FBSSubclassHasBeenIngested(__unsafe_unretained Class _Nonnull)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSSettingForLegacySetting_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"FBSSetting * _Nullable FBSSettingForLegacySetting(__unsafe_unretained Class _Nonnull, NSUInteger)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void FBSSettingForLegacySetting_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"FBSSetting * _Nullable FBSSettingForLegacySetting(__unsafe_unretained Class _Nonnull, NSUInteger)"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_1()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_3()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_4()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_5()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _addMethod_cold_6()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _addMethod(__unsafe_unretained Class, __unsafe_unretained Class, SEL, IMP, const char *, BOOL)"]
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void ___realizeSettingsExtension_block_invoke_277_cold_1()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  BSSettingFlagIsYes();
}

void ___realizeSettingsExtension_block_invoke_277_cold_2()
{
  uint64_t v0 = [NSString stringWithUTF8String:"void _realizeSettingsExtension(__unsafe_unretained Class, __unsafe_unretained Class)_block_invoke"];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_19C680000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

void _flushBulkMethods_cold_2()
{
  OUTLINED_FUNCTION_9();
  uint64_t v4 = OUTLINED_FUNCTION_1(v1, 5.8384e-34, v2, v3);
  OUTLINED_FUNCTION_6(v4, v5, v6);
  OUTLINED_FUNCTION_5(v7, v8, v9);
  OUTLINED_FUNCTION_4(&dword_19C680000, MEMORY[0x1E4F14500], v10, "failure in %{public}@ (%{public}@:%i) : %{public}@", v11);
}

void FBSWorkspaceInitialize_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"FBSWorkspace * _Nonnull FBSWorkspaceInitialize(FBSWorkspaceInitializationOptions *__strong _Nonnull)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"FBSWorkspace.m";
  __int16 v7 = 1024;
  int v8 = 210;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

void SecurityLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *SecurityLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"SecuritySoftLinking.m" lineNumber:13 description:@"%s", *a1];

  __break(1u);
}

void soft_SecCertificateCreateWithData_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"SecCertificateRef soft_SecCertificateCreateWithData(CFAllocatorRef, CFDataRef)"];
  [v0 handleFailureInFunction:v1 file:@"SecuritySoftLinking.m" lineNumber:14 description:@"%s", dlerror()];

  __break(1u);
}

void soft_SecCertificateCopySubjectSummary_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef soft_SecCertificateCopySubjectSummary(SecCertificateRef)"];
  [v0 handleFailureInFunction:v1 file:@"SecuritySoftLinking.m" lineNumber:15 description:@"%s", dlerror()];

  __break(1u);
}

void _FBSCreateUnsafeObjectFromData_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "id _FBSCreateUnsafeObjectFromData(NSData *__strong)";
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(&dword_19C680000, v0, OS_LOG_TYPE_ERROR, "%s the unarchiver failed to instantiate with error %{public}@", (uint8_t *)&v1, 0x16u);
}

void _FBSCreateUnsafeObjectFromData_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_19C680000, v0, OS_LOG_TYPE_ERROR, "Caught exception during decoding of data: %{public}@", v1, 0xCu);
}

void InstallCoordinationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *InstallCoordinationLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"InstallCoordinationSoftLinking.m" lineNumber:13 description:@"%s", *a1];

  __break(1u);
}

void __getIXAppInstallCoordinatorClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getIXAppInstallCoordinatorClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"InstallCoordinationSoftLinking.m" lineNumber:14 description:@"Unable to find class %s" arguments:("IXAppInstallCoordinator")];

  __break(1u);
}

void __getIXUninstallOptionsClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getIXUninstallOptionsClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"InstallCoordinationSoftLinking.m" lineNumber:15 description:@"Unable to find class %s" arguments:v1];

  __break(1u);
}

void __getIXApplicationIdentityClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getIXApplicationIdentityClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"InstallCoordinationSoftLinking.m" lineNumber:16 description:@"Unable to find class %s" arguments:v1];

  __break(1u);
}

void soft_IXStringForUninstallDisposition_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"NSString *soft_IXStringForUninstallDisposition(IXUninstallDisposition)"];
  [v0 handleFailureInFunction:v1 file:@"InstallCoordinationSoftLinking.m" lineNumber:17 description:@"%s", dlerror()];

  __break(1u);
}

void EmbeddedDataResetLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *EmbeddedDataResetLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"EmbeddedDataResetSoftLinking.m" lineNumber:13 description:@"%s", *a1];

  __break(1u);
}

void __getDDRResetServiceClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetServiceClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"EmbeddedDataResetSoftLinking.m" lineNumber:14 description:@"Unable to find class %s", "DDRResetService"];

  __break(1u);
}

void __getDDRResetRequestClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetRequestClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"EmbeddedDataResetSoftLinking.m" lineNumber:15 description:@"Unable to find class %s", "DDRResetRequest"];

  __break(1u);
}

void __getDDRResetOptionsClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getDDRResetOptionsClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"EmbeddedDataResetSoftLinking.m" lineNumber:16 description:@"Unable to find class %s" arguments:v1];

  __break(1u);
}

void _lock_getDefaultExtensions_cold_1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"NSOrderedSet *_lock_getDefaultExtensions(FBSSceneSpecification *__strong, __unsafe_unretained Class)"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"FBSSceneSpecification.m";
  __int16 v7 = 1024;
  int v8 = 31;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

void ManagedConfigurationLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *ManagedConfigurationLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"ManagedConfigurationSoftLinking.m" lineNumber:13 description:@"%s", *a1];

  __break(1u);
}

void __getMCProfileConnectionClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getMCProfileConnectionClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"ManagedConfigurationSoftLinking.m" lineNumber:14 description:@"Unable to find class %s", "MCProfileConnection"];

  __break(1u);
}

void getMCManagedAppsChangedNotification_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (MCManagedAppsChangedNotification) (*)(void))0)()) getMCManagedAppsChangedNotification(void)"];
  [v0 handleFailureInFunction:v1 file:@"ManagedConfigurationSoftLinking.m" lineNumber:15 description:@"%s", dlerror()];

  __break(1u);
}

void libmisLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *libmisLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"libmisSoftLinking.m" lineNumber:13 description:@"%s", *a1];

  __break(1u);
}

void soft_MISQueryBlacklistForBundle_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"_Bool soft_MISQueryBlacklistForBundle(CFStringRef _Nonnull, off_t, _Bool, struct MISBlacklistFlags * _Nullable, CFDataRef  _Nullable * _Nullable, MISBlacklistHashType * _Nullable, CFDictionaryRef  _Nullable const)"]
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:16 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISQueryBlacklistForCdHash_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"_Bool soft_MISQueryBlacklistForCdHash(CFDataRef  _Nonnull const, MISBlacklistHashType, _Bool, struct MISBlacklistFlags * _Nullable, CFDictionaryRef  _Nullable const)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:17 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISAppApprovalState_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"MISState soft_MISAppApprovalState(CFStringRef, CFDictionaryRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:18 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISValidateUPP_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"void soft_MISValidateUPP(CFStringRef, __strong dispatch_queue_t, void (^__strong)(MISState, int64_t))"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:19 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISCopyErrorStringForErrorCode_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFStringRef soft_MISCopyErrorStringForErrorCode(MISError)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:20 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISValidateSignatureAndCopyInfo_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"MISError soft_MISValidateSignatureAndCopyInfo(CFStringRef, CFDictionaryRef, CFDictionaryRef *)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:21 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISValidationCopySignatureVersion_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"MISError soft_MISValidationCopySignatureVersion(CFStringRef, CFNumberRef *)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:25 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISValidationOptionUnauthoritativeLaunch_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISValidationOptionUnauthoritativeLaunch) (*)(void))0)()) getkMISValidationOptionUnauthoritativeLaunch(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:26 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISValidationOptionAuthoritativeLaunch_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISValidationOptionAuthoritativeLaunch) (*)(void))0)()) getkMISValidationOptionAuthoritativeLaunch(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:27 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISValidationOptionOnlineAuthorization_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISValidationOptionOnlineAuthorization) (*)(void))0)()) getkMISValidationOptionOnlineAuthorization(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:28 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISValidationOptionOnlineCheckType_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISValidationOptionOnlineCheckType) (*)(void))0)()) getkMISValidationOptionOnlineCheckType(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:29 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISMinSupportedSignatureVersion_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISMinSupportedSignatureVersion) (*)(void))0)()) getkMISMinSupportedSignatureVersion(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:30 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISFutureMinSupportedSignatureVersion_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISFutureMinSupportedSignatureVersion) (*)(void))0)()) getkMISFutureMinSupportedSignatureVersion(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:31 description:@"%s", dlerror()];

  __break(1u);
}

void getkMISValidationOptionHintMainExecutablePath_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kMISValidationOptionHintMainExecutablePath) (*)(void))0)()) getkMISValidationOptionHintMainExecutablePath(void)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:32 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISEnumerateInstalledProvisioningProfiles_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"MISError soft_MISEnumerateInstalledProvisioningProfiles(CFOptionFlags, _Bool (^__strong)(MISProfileRef))"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:35 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileGetDeveloperCertificates_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFArrayRef soft_MISProvisioningProfileGetDeveloperCertificates(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:36 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProfileGetValue_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFTypeRef soft_MISProfileGetValue(MISProfileRef, CFStringRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:37 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileGetEntitlements_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFDictionaryRef soft_MISProvisioningProfileGetEntitlements(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:38 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileGetExpirationDate_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFDateRef soft_MISProvisioningProfileGetExpirationDate(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:39 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileGetUUID_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFStringRef soft_MISProvisioningProfileGetUUID(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:40 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileGrantsEntitlement_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Boolean soft_MISProvisioningProfileGrantsEntitlement(MISProfileRef, CFStringRef, CFTypeRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:41 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileIsAppleInternalProfile_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Boolean soft_MISProvisioningProfileIsAppleInternalProfile(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:43 description:@"%s", dlerror()];

  __break(1u);
}

void soft_MISProvisioningProfileProvisionsAllDevices_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Boolean soft_MISProvisioningProfileProvisionsAllDevices(MISProfileRef)"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:44 description:@"%s", dlerror()];

  __break(1u);
}

void __getMISLaunchWarningDatabaseClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getMISLaunchWarningDatabaseClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"libmisSoftLinking.m" lineNumber:47 description:@"Unable to find class %s", "MISLaunchWarningDatabase"];

  __break(1u);
}

void QuartzCoreLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"QuartzCoreSoftLinking.m" lineNumber:11 description:@"%s", *a1];

  __break(1u);
}

void __getCADisplayClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getCADisplayClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:12 description:@"Unable to find class %s", "CADisplay"];

  __break(1u);
}

void getkCADisplayNone_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayNone) (*)(void))0)()) getkCADisplayNone(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:13 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayScaleContent_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayScaleContent) (*)(void))0)()) getkCADisplayScaleContent(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:14 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayInsetBounds_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayInsetBounds) (*)(void))0)()) getkCADisplayInsetBounds(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:15 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayOrientationRotation0_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayOrientationRotation0) (*)(void))0)()) getkCADisplayOrientationRotation0(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:16 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayOrientationRotation90_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayOrientationRotation90) (*)(void))0)()) getkCADisplayOrientationRotation90(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:17 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayOrientationRotation180_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayOrientationRotation180) (*)(void))0)()) getkCADisplayOrientationRotation180(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:18 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayOrientationRotation270_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayOrientationRotation270) (*)(void))0)()) getkCADisplayOrientationRotation270(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:19 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayModeGamutSRGB_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayModeGamutSRGB) (*)(void))0)()) getkCADisplayModeGamutSRGB(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:20 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayModeGamutP3_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayModeGamutP3) (*)(void))0)()) getkCADisplayModeGamutP3(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:21 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayModeSDR_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayModeSDR) (*)(void))0)()) getkCADisplayModeSDR(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:22 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayModeHDR10_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayModeHDR10) (*)(void))0)()) getkCADisplayModeHDR10(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:23 description:@"%s", dlerror()];

  __break(1u);
}

void getkCADisplayModeDolby_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCADisplayModeDolby) (*)(void))0)()) getkCADisplayModeDolby(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:24 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotContextId_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotContextId) (*)(void))0)()) getkCASnapshotContextId(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:29 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotContextList_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotContextList) (*)(void))0)()) getkCASnapshotContextList(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:30 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotDisplayName_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotDisplayName) (*)(void))0)()) getkCASnapshotDisplayName(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:31 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotFormatOpaque_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotFormatOpaque) (*)(void))0)()) getkCASnapshotFormatOpaque(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:32 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotFormatWideGamut_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotFormatWideGamut) (*)(void))0)()) getkCASnapshotFormatWideGamut(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:33 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotMode_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotMode) (*)(void))0)()) getkCASnapshotMode(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:34 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotModeIncludeContextList_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotModeIncludeContextList) (*)(void))0)()) getkCASnapshotModeIncludeContextList(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:35 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotOriginX_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotOriginX) (*)(void))0)()) getkCASnapshotOriginX(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:36 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotOriginY_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotOriginY) (*)(void))0)()) getkCASnapshotOriginY(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:37 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotSizeHeight_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotSizeHeight) (*)(void))0)()) getkCASnapshotSizeHeight(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:38 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotSizeWidth_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotSizeWidth) (*)(void))0)()) getkCASnapshotSizeWidth(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:39 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotTransform_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotTransform) (*)(void))0)()) getkCASnapshotTransform(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:40 description:@"%s", dlerror()];

  __break(1u);
}

void getkCASnapshotMapCacheAttribute_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"typeof (((typeof (kCASnapshotMapCacheAttribute) (*)(void))0)()) getkCASnapshotMapCacheAttribute(void)"];
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:42 description:@"%s", dlerror()];

  __break(1u);
}

void soft_CARenderServerCreateSnapshots_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"_Bool soft_CARenderServerCreateSnapshots(mach_port_t, IOSurfaceRef *, IOSurfaceRef *, NSDictionary *__strong)"]
  [v0 handleFailureInFunction:v1 file:@"QuartzCoreSoftLinking.m" lineNumber:49 description:@"%s", dlerror()];

  __break(1u);
}

uint64_t BKLogDisplay()
{
  return MEMORY[0x1F410BD98]();
}

uint64_t BKSDisplayServicesGetExternalDisplayScale()
{
  return MEMORY[0x1F410BE08]();
}

void BSAtomicGetFlag()
{
  while (1)
    ;
}

void BSAtomicSetFlag()
{
  while (1)
    ;
}

void BSContinuousMachTimeNow()
{
  while (1)
    ;
}

void BSCreateDeserializedArrayFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary()
{
  while (1)
    ;
}

void BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateDeserializedCFValueFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateDeserializedSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateDeserializedStringFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSCreateSerializedBSXPCEncodableObject()
{
  while (1)
    ;
}

void BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeCFValueFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeCGRectFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeCGRectFromXPCObject()
{
  while (1)
    ;
}

void BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeCGSizeFromXPCObject()
{
  while (1)
    ;
}

void BSDeserializeDataFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDeserializeStringFromXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSDispatchBlockCreateWithCurrentQualityOfService()
{
  while (1)
    ;
}

void BSDispatchMain()
{
  while (1)
    ;
}

void BSDispatchQueueAssert()
{
  while (1)
    ;
}

void BSDispatchQueueAssertMain()
{
  while (1)
    ;
}

void BSDispatchQueueAssertNot()
{
  while (1)
    ;
}

void BSDispatchQueueCreate()
{
  while (1)
    ;
}

void BSDispatchQueueCreateSerial()
{
  while (1)
    ;
}

void BSDispatchQueueCreateSerialWithQoS()
{
  while (1)
    ;
}

void BSDispatchQueueCreateWithQualityOfService()
{
  while (1)
    ;
}

void BSEqualBools()
{
  while (1)
    ;
}

void BSEqualObjects()
{
  while (1)
    ;
}

void BSEqualStrings()
{
  while (1)
    ;
}

void BSFloatEqualToFloat()
{
  while (1)
    ;
}

void BSFloatGreaterThanFloat()
{
  while (1)
    ;
}

void BSFloatGreaterThanOrEqualToFloat()
{
  while (1)
    ;
}

void BSFloatIsOne()
{
  while (1)
    ;
}

void BSFloatIsZero()
{
  while (1)
    ;
}

void BSFloatLessThanFloat()
{
  while (1)
    ;
}

void BSFloatLessThanOrEqualToFloat()
{
  while (1)
    ;
}

void BSInterfaceOrientationDescription()
{
  while (1)
    ;
}

void BSInterfaceOrientationIsLandscape()
{
  while (1)
    ;
}

void BSLogAddStateCaptureBlockWithTitle()
{
  while (1)
    ;
}

void BSModificationDateForPath()
{
  while (1)
    ;
}

void BSNSStringFromCGRect()
{
  while (1)
    ;
}

void BSNSStringFromCGSize()
{
  while (1)
    ;
}

void BSObjCClassCreate()
{
  while (1)
    ;
}

void BSOrientationRotationDirectionDescription()
{
  while (1)
    ;
}

void BSRectEqualToRect()
{
  while (1)
    ;
}

void BSRectFromValue()
{
  while (1)
    ;
}

void BSRectGetCenter()
{
  while (1)
    ;
}

void BSRectWithSize()
{
  while (1)
    ;
}

void BSSelfTaskHasEntitlement()
{
  while (1)
    ;
}

void BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeArrayToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeBSXPCEncodableObjectToXPCDictionary()
{
  while (1)
    ;
}

void BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeCFValueToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeCGFloatToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeCGRectToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeCGSizeToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeDataToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeDoubleToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeSetOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSerializeStringToXPCDictionaryWithKey()
{
  while (1)
    ;
}

void BSSettingFlagForBool()
{
  while (1)
    ;
}

void BSSettingFlagIfYes()
{
  while (1)
    ;
}

void BSSettingFlagIsYes()
{
  while (1)
    ;
}

void BSSettingForKey()
{
  while (1)
    ;
}

void BSSettingsDiffIsEmpty()
{
  while (1)
    ;
}

void BSSettingsEqualToSettings()
{
  while (1)
    ;
}

void BSSettingsIsEmpty()
{
  while (1)
    ;
}

void BSSizeEqualToSize()
{
  while (1)
    ;
}

void BSSizeFromValue()
{
  while (1)
    ;
}

void BSStringFromBOOL()
{
  while (1)
    ;
}

void BSValueWithRect()
{
  while (1)
    ;
}

void BSValueWithSize()
{
  while (1)
    ;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x1F40E71E8](namestr);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _BSIsInternalInstall()
{
  while (1)
    ;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSValue()
{
  return MEMORY[0x1F40D94F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _bs_set_crash_log_message()
{
  while (1)
    ;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

uint64_t class_addMethodsBulk()
{
  return MEMORY[0x1F41814D0]();
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814D8](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x1F4181578](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1F40CBE68]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1F41815F0](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

[a1 a2];
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

[super objc_msgSendSuper2:a1, a2, ...];
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1F40CEF18]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}