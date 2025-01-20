@interface HIDPreferencesLocal
- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5;
- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5;
- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5;
@end

@implementation HIDPreferencesLocal

- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v11 = (__CFString *)a3;
  id v12 = a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Key:%@ Value:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetValue(v11, v12, v15, v13, v14);
}

- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v11 = (__CFString *)a3;
  id v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  v15 = (void (**)(id, void *))a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Key:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  int v17 = (void *)CFPreferencesCopyValue(v11, v14, v12, v13);
  v18 = _IOHIDLogCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesLocal copy:user:host:domain:reply:]();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (__CFString *)a5;
  v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_227443000, v10, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Synchronize User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSynchronize(v9, v7, v8);
}

- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFArrayRef v11 = (const __CFArray *)a3;
  id v12 = (__CFString *)a4;
  __int16 v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  __int16 v15 = (void (**)(id, CFDictionaryRef))a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    CFArrayRef v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Multiple Keys:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  CFDictionaryRef v17 = CFPreferencesCopyMultiple(v11, v14, v12, v13);
  v18 = _IOHIDLogCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesLocal copy:user:host:domain:reply:]();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v11 = (const __CFDictionary *)a3;
  CFArrayRef v12 = (const __CFArray *)a4;
  __int16 v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  __int16 v15 = (__CFString *)a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    CFDictionaryRef v18 = v11;
    __int16 v19 = 2112;
    CFArrayRef v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Multiple KeysToSet:%@ KeysToRemove:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetMultiple(v11, v12, v15, v13, v14);
}

- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5
{
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  v9 = (void (**)(id, void *))a5;
  v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesLocal copyDomain:domain:reply:]();
  }

  CFDictionaryRef v11 = (void *)CFPreferencesCopyAppValue(v7, v8);
  CFArrayRef v12 = _IOHIDLogCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesLocal copy:user:host:domain:reply:]();
  }

  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a3;
  id v8 = a4;
  v9 = (__CFString *)a5;
  v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    CFArrayRef v12 = v7;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_debug_impl(&dword_227443000, v10, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Set Domain Value Key:%@ Domain:%@ Value : %@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSetAppValue(v7, v8, v9);
}

- (void)copy:user:host:domain:reply:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_227443000, v0, v1, "HIDPReferencesLocal CFPreference value %@\n", v2, v3, v4, v5, v6);
}

- (void)copyDomain:domain:reply:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_227443000, v1, OS_LOG_TYPE_DEBUG, "HIDPReferencesLocal Copy Domain Value Key:%@ Domain:%@\n", v2, 0x16u);
}

@end