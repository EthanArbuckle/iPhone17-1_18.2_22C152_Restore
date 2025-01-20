@interface FEFocusEnvironmentPreferenceEnumerationContext
@end

@implementation FEFocusEnvironmentPreferenceEnumerationContext

void __92___FEFocusEnvironmentPreferenceEnumerationContext_initWithFocusEnvironment_enumerationMode___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(v6, sel_allowsWeakReference)) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  if (v8)
  {
    v9 = _FEFocusEnvironmentEffectivePreferredFocusEnvironments(v6, 0);
    [*(id *)(a1 + 32) setObject:v9 forKey:v6];
    if ((unint64_t)[v9 count] > 1
      || ([v9 firstObject], id v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 != v6))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }
  else
  {
    v11 = logger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_24F3F0000, v11, OS_LOG_TYPE_FAULT, "Trying to enumerate a focus hierarchy with a focus environment that is in the process of deallocating. This should never happen.", v12, 2u);
    }

    *a3 = 1;
  }
}

@end