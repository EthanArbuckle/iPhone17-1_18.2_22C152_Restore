@interface AXSB_SBApplicationSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_updateProcess:(id)a3 withState:(id)a4;
@end

@implementation AXSB_SBApplicationSafeCategory

- (void)_updateProcess:(id)a3 withState:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  buf[0] = 0;
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  v9 = v8;
  v10 = [v8 bundleIdentifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F21248]];

  v12 = [v9 bundleIdentifier];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F212F0]];

  buf[0] = 0;
  v14 = [(AXSB_SBApplicationSafeCategory *)self safeValueForKey:@"_internalProcessState"];
  v15 = __UIAccessibilitySafeClass();

  int v16 = [v15 safeIntForKey:@"taskState"];
  int v17 = [v15 safeIntForKey:@"visibility"];
  v31.receiver = self;
  v31.super_class = (Class)AXSB_SBApplicationSafeCategory;
  [(AXSB_SBApplicationSafeCategory *)&v31 _updateProcess:v6 withState:v7];
  buf[0] = 0;
  v18 = [(AXSB_SBApplicationSafeCategory *)self safeValueForKey:@"_internalProcessState"];
  v19 = __UIAccessibilitySafeClass();

  if (buf[0]) {
    abort();
  }
  int v20 = [v19 safeIntForKey:@"taskState"];
  int v21 = [v19 safeIntForKey:@"visibility"];
  BOOL v23 = v17 != 2 && v21 != 2;
  if (v16 == v20 && v17 == v21) {
    int v25 = 1;
  }
  else {
    int v25 = v11;
  }
  if (((v25 | v13) & 1) == 0 && !v23)
  {
    v26 = [MEMORY[0x263F62AF8] sharedInstance];
    if ([v26 TTYHardwareEnabled])
    {
    }
    else
    {
      v27 = [MEMORY[0x263F62AF8] sharedInstance];
      int v28 = [v27 TTYSoftwareEnabled];

      if (!v28) {
        goto LABEL_24;
      }
    }
    v29 = AXLogRTT();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v9 bundleIdentifier];
      *(_DWORD *)buf = 138412802;
      v33 = v30;
      __int16 v34 = 2112;
      v35 = v15;
      __int16 v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_226EBC000, v29, OS_LOG_TYPE_DEFAULT, "Canceling RTT call prompt display because %@ moved from previous state %@ to new state %@", buf, 0x20u);
    }
    [MEMORY[0x263F62AD0] cancelCallPromptDisplay];
  }
LABEL_24:
}

+ (id)safeCategoryTargetClassName
{
  return @"SBApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end