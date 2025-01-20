@interface SCNCommonProfileProgramGenerator
+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4;
- (SCNCommonProfileProgramGenerator)init;
- (__C3DFXProgram)programWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6;
- (int)profile;
- (void)dealloc;
- (void)emptyShaderCache;
- (void)profile;
- (void)releaseProgramForResource:(id)a3;
@end

@implementation SCNCommonProfileProgramGenerator

+ (id)generatorWithProfile:(int)a3 allowingHotReload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(a1);
  if (!s_registry[(int)v5])
  {
    if (v5) {
      s_registry[(int)v5] = (uint64_t)[[SCNCommonProfileProgramGeneratorGL alloc] initWithProfile:v5];
    }
    else {
      s_registry[0] = (uint64_t)[[SCNCommonProfileProgramGeneratorMetal alloc] initAllowingHotReload:v4];
    }
  }
  objc_sync_exit(a1);
  return (id)s_registry[(int)v5];
}

- (SCNCommonProfileProgramGenerator)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCNCommonProfileProgramGenerator;
  v2 = [(SCNCommonProfileProgramGenerator *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_programMutex._os_unfair_lock_opaque = 0;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    v2->_shaders = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v3->_trackedResourcesToHashcode = CFDictionaryCreateMutable(v4, 0, 0, v5);
    uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
    C3DNotificationCenterAddObserver(SharedInstance, v3, (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))__HandleProfileWillDieNotification, @"kC3DNotificationProfileWillDie", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (__C3DFXProgram)programWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 trackedResource:(id)a5 introspectionDataPtr:(void *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t HashCode = C3DProgramHashCodeGetHashCode((uint64_t)a3);
  if (HashCode)
  {
    CFStringRef v12 = (const __CFString *)HashCode;
    p_programMutex = &self->_programMutex;
    os_unfair_lock_lock(&self->_programMutex);
    Value = (CFSetRef *)CFDictionaryGetValue(self->_shaders, v12);
    if (Value)
    {
      v15 = Value;
      int v16 = CFSetContainsValue(Value[2], a5);
      BOOL v17 = v16 == 0;
      if (!v16) {
        CFSetAddValue(v15[2], a5);
      }
      v18 = (__C3DFXProgram *)v15[1];
    }
    else
    {
      v27 = (void *)MEMORY[0x210535ED0]();
      kdebug_trace();
      v18 = (__C3DFXProgram *)[(SCNCommonProfileProgramGenerator *)self _newProgramWithHashCode:a3 engineContext:a4 introspectionDataPtr:a6];
      kdebug_trace();
      if (!v18)
      {
        CFStringRef v31 = CFCopyDescription(a3);
        v32 = scn_default_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 138412546;
          CFStringRef v35 = v12;
          __int16 v36 = 2112;
          CFStringRef v37 = v31;
          _os_log_impl(&dword_20B249000, v32, OS_LOG_TYPE_DEFAULT, "Warning: Failed to create program for hashcode %@: %@", (uint8_t *)&v34, 0x16u);
        }
        CFRelease(v31);
        v18 = 0;
        goto LABEL_21;
      }
      C3DEntitySetName((uint64_t)v18, v12);
      v28 = objc_alloc_init(SCNCommonProfileProgramCache);
      v28->_program = (__C3DFXProgram *)CFRetain(v18);
      CFSetAddValue(v28->_owners, a5);
      CFDictionarySetValue(self->_shaders, v12, v28);

      CFRelease(v18);
      BOOL v17 = 1;
    }
    if (v17 && v18 != 0)
    {
      Mutable = (void *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a5);
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
        CFDictionarySetValue(self->_trackedResourcesToHashcode, a5, Mutable);
        CFRelease(Mutable);
      }
      CFArrayAppendValue((CFMutableArrayRef)Mutable, v12);
    }
LABEL_21:
    os_unfair_lock_unlock(p_programMutex);
    return v18;
  }
  v19 = scn_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[SCNCommonProfileProgramGenerator programWithHashCode:engineContext:trackedResource:introspectionDataPtr:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
  return 0;
}

- (void)dealloc
{
  uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
  C3DNotificationCenterRemoveObserver(SharedInstance, self, @"kC3DNotificationProfileWillDie", 0);
  shaders = self->_shaders;
  if (shaders)
  {
    CFRelease(shaders);
    self->_shaders = 0;
  }
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;
  if (trackedResourcesToHashcode)
  {
    CFRelease(trackedResourcesToHashcode);
    self->_trackedResourcesToHashcode = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNCommonProfileProgramGenerator;
  [(SCNCommonProfileProgramGenerator *)&v6 dealloc];
}

- (int)profile
{
  v2 = scn_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[SCNCommonProfileProgramGenerator profile](v2);
  }
  return -1;
}

- (void)emptyShaderCache
{
  CFDictionaryRemoveAllValues(self->_shaders);
  trackedResourcesToHashcode = self->_trackedResourcesToHashcode;

  CFDictionaryRemoveAllValues(trackedResourcesToHashcode);
}

- (void)releaseProgramForResource:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCNCommonProfileProgramGenerator releaseProgramForResource:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  os_unfair_lock_lock(&self->_programMutex);
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(self->_trackedResourcesToHashcode, a3);
  if (Value)
  {
    CFArrayRef v14 = Value;
    CFIndex Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      CFIndex v16 = Count;
      for (CFIndex i = 0; i != v16; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
        v19 = (CFMutableSetRef *)CFDictionaryGetValue(self->_shaders, ValueAtIndex);
        if (v19)
        {
          uint64_t v20 = v19;
          CFSetRemoveValue(v19[2], a3);
          if (!CFSetGetCount(v20[2])) {
            CFDictionaryRemoveValue(self->_shaders, ValueAtIndex);
          }
        }
        else if ((releaseProgramForResource__done & 1) == 0)
        {
          releaseProgramForResource__done = 1;
          uint64_t v21 = scn_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            [(SCNCommonProfileProgramGenerator *)&buf releaseProgramForResource:v21];
          }
        }
      }
    }
  }
  CFDictionaryRemoveValue(self->_trackedResourcesToHashcode, a3);
  os_unfair_lock_unlock(&self->_programMutex);
}

- (void)profile
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid CommonProfile generator", v1, 2u);
}

- (void)programWithHashCode:(uint64_t)a3 engineContext:(uint64_t)a4 trackedResource:(uint64_t)a5 introspectionDataPtr:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)releaseProgramForResource:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DCommonProfileProgramReleaseHashCode can't find cache for tracked resource", buf, 2u);
}

- (void)releaseProgramForResource:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end