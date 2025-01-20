@interface DTCompanionControlServiceV2
+ ($E500CE0F53EF55493F587D4F07A80590)sockPuppetSymbols;
+ (void)instantiateServiceWithChannel:(id)a3;
+ (void)registerCapabilities:(id)a3;
+ (void)setSockPuppetSymbols:(id *)a3;
- (id)_launchModeTranslationsMap;
- (id)launchWatchAppForCompanionIdentifier:(id)a3 options:(id)a4;
- (id)terminateWatchAppForCompanionIdentifier:(id)a3 options:(id)a4;
- (id)willInstallWatchAppForCompanionIdentifier:(id)a3;
@end

@implementation DTCompanionControlServiceV2

+ (void)instantiateServiceWithChannel:(id)a3
{
  uint64_t v4 = qword_268707E10;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_268707E10, &unk_26E5154E8);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___DTCompanionControlServiceV2;
  [super instantiateServiceWithChannel:v5];
}

+ (void)setSockPuppetSymbols:(id *)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  long long v4 = *(_OWORD *)&a3->var2;
  xmmword_268707E18 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&qword_268707E28 = v4;
  long long v5 = *(_OWORD *)&a3->var10;
  long long v7 = *(_OWORD *)&a3->var4;
  long long v6 = *(_OWORD *)&a3->var6;
  xmmword_268707E58 = *(_OWORD *)&a3->var8;
  *(_OWORD *)&qword_268707E68 = v5;
  xmmword_268707E38 = v7;
  *(_OWORD *)&qword_268707E48 = v6;
  objc_sync_exit(obj);
}

+ ($E500CE0F53EF55493F587D4F07A80590)sockPuppetSymbols
{
  id obj = a2;
  objc_sync_enter(obj);
  long long v4 = *(_OWORD *)&qword_268707E48;
  *(_OWORD *)&retstr->var4 = xmmword_268707E38;
  *(_OWORD *)&retstr->var6 = v4;
  long long v5 = *(_OWORD *)&qword_268707E68;
  *(_OWORD *)&retstr->var8 = xmmword_268707E58;
  *(_OWORD *)&retstr->var10 = v5;
  long long v6 = *(_OWORD *)&qword_268707E28;
  *(_OWORD *)&retstr->var0 = xmmword_268707E18;
  *(_OWORD *)&retstr->var2 = v6;
  objc_sync_exit(obj);

  return result;
}

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [a1 sockPuppetSymbols];
  if (v5) {
    [v4 publishCapability:DTDefaultCompanionProcessControlServiceIdentifier withVersion:3 forClass:a1];
  }
}

- (id)_launchModeTranslationsMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23088B110;
  block[3] = &unk_264B8D590;
  block[4] = self;
  if (qword_268707E80 != -1) {
    dispatch_once(&qword_268707E80, block);
  }
  return (id)qword_268707E78;
}

- (id)willInstallWatchAppForCompanionIdentifier:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4 || ![v4 length])
  {
    v13 = NSString;
    v14 = NSStringFromSelector(a2);
    v15 = [v13 stringWithFormat:@"Error, Nil or empty bundle identifer: '%@' sent to %@", 0, v14];

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = DTDefaultCompanionProcessControlServiceIdentifier;
    uint64_t v33 = *MEMORY[0x263F08320];
    v34 = v15;
    v18 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v9 = [v16 errorWithDomain:v17 code:-4 userInfo:v18];

    goto LABEL_10;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F38CA8]);
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23088B558;
  block[3] = &unk_264B8D590;
  id v9 = v6;
  id v32 = v9;
  dispatch_after(v7, v8, block);

  v10 = objc_opt_class();
  if (!v10)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    goto LABEL_8;
  }
  [v10 sockPuppetSymbols];
  v11 = (void (*)(void *, void *))*((void *)&v28 + 1);
  if (!*((void *)&v28 + 1))
  {
LABEL_8:
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = DTDefaultCompanionProcessControlServiceIdentifier;
    uint64_t v35 = *MEMORY[0x263F08320];
    v36[0] = @"WatchKit framework symbol not found";
    v21 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v12 = [v19 errorWithDomain:v20 code:-5 userInfo:v21];

    [v9 invokeCompletionWithReturnValue:0 error:v12];
    goto LABEL_9;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_23088B630;
  v23[3] = &unk_264B8DAE8;
  id v24 = v9;
  v11(v5, v23);
  v12 = v24;
LABEL_9:

  v15 = v32;
LABEL_10:

  return v9;
}

- (id)launchWatchAppForCompanionIdentifier:(id)a3 options:(id)a4
{
  v85[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKeyedSubscript:@"IDEDebugLogging"];

  if (v9)
  {
    v10 = NSStringFromSelector(a2);
    NSLog(&cfstr_Dtcompanioncon.isa, v10, v7);
  }
  if (v7)
  {
    v11 = [v8 objectForKeyedSubscript:DTProcessControlServiceOption_KillExistingKey[0]];
    char v12 = [v11 isEqualToNumber:MEMORY[0x263EFFA80]];

    if (v12)
    {
      id v13 = 0;
      goto LABEL_51;
    }
    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v18 = [v8 objectForKeyedSubscript:@"IDEWatchLaunchMode"];
    if (v18)
    {
      v19 = [(DTCompanionControlServiceV2 *)self _launchModeTranslationsMap];
      uint64_t v20 = [v19 objectForKeyedSubscript:v18];

      v21 = objc_opt_class();
      if (v21)
      {
        [v21 sockPuppetSymbols];
        if (v20 && (void)v76 && *(void *)v76) {
          [v17 setObject:v20 forKeyedSubscript:v20];
        }
      }
      else
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
      }
    }
    v22 = objc_opt_class();
    if (v22)
    {
      [v22 sockPuppetSymbols];
      v23 = (void *)v72;
    }
    else
    {
      v23 = 0;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
    }
    v47 = (void *)v18;
    id v24 = [v8 objectForKeyedSubscript:@"IDEWatchLaunchNotificationType-Static"];
    if ([v24 isEqualToNumber:MEMORY[0x263EFFA88]] && v23)
    {
      uint64_t v25 = *v23;

      if (v25) {
        [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v23];
      }
    }
    else
    {
    }
    long long v26 = [v8 objectForKeyedSubscript:@"IDEWatchNotificationPayload"];
    long long v27 = objc_opt_class();
    if (v27)
    {
      [v27 sockPuppetSymbols];
      if (v26 && *((void *)&v66 + 1) && **((void **)&v66 + 1)) {
        [v17 setObject:v26 forKeyedSubscript:v26];
      }
    }
    else
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
    }
    long long v28 = [v8 objectForKeyedSubscript:@"IDEWatchExeptionProcessAssertionDisabled"];
    long long v29 = v28;
    if (!v28 || ([v28 BOOLValue] & 1) == 0)
    {
      long long v30 = objc_opt_class();
      if (v30)
      {
        [v30 sockPuppetSymbols];
        if ((void)v61 && *(void *)v61) {
          [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:];
        }
      }
      else
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
      }
    }
    uint64_t v31 = [v8 objectForKeyedSubscript:@"IDEWatchLaunchEnvironment"];
    id v32 = (void *)v31;
    if (v31) {
      uint64_t v33 = v31;
    }
    else {
      uint64_t v33 = MEMORY[0x263EFFA78];
    }
    [v17 setObject:v33 forKeyedSubscript:@"SPXcodeSupportAppLaunchEnvironmentKey"];

    uint64_t v34 = [v8 objectForKeyedSubscript:@"IDEWatchLaunchArguments"];
    uint64_t v35 = (void *)v34;
    if (v34) {
      uint64_t v36 = v34;
    }
    else {
      uint64_t v36 = MEMORY[0x263EFFA68];
    }
    [v17 setObject:v36 forKeyedSubscript:@"SPXcodeSupportAppLaunchArgumentsKey"];

    id v37 = objc_alloc_init(MEMORY[0x263F38CA8]);
    dispatch_time_t v38 = dispatch_time(0, 305000000000);
    v39 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23088BC54;
    block[3] = &unk_264B8D590;
    id v13 = v37;
    id v57 = v13;
    dispatch_after(v38, v39, block);

    if (v9) {
      NSLog(&cfstr_Dtcompanioncon_0.isa, v17);
    }
    v40 = objc_opt_class();
    if (v40)
    {
      [v40 sockPuppetSymbols];
      v41 = (void (*)(id, void *, void *))v54;
      if ((void)v54)
      {
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = sub_23088BD2C;
        v48[3] = &unk_264B8DB10;
        id v49 = v13;
        v41(v7, v17, v48);
        v42 = v49;
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
    }
    v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = DTDefaultCompanionProcessControlServiceIdentifier;
    uint64_t v82 = *MEMORY[0x263F08320];
    v83 = @"WatchKit framework symbol not found";
    v45 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v42 = [v43 errorWithDomain:v44 code:-5 userInfo:v45];

    [v13 invokeCompletionWithReturnValue:0 error:v42];
    goto LABEL_49;
  }
  v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = DTDefaultCompanionProcessControlServiceIdentifier;
  uint64_t v16 = *MEMORY[0x263F08338];
  v84[0] = *MEMORY[0x263F08320];
  v84[1] = v16;
  v85[0] = @"Failed to launch Watch App for companion. No bundle identifier provided.";
  v85[1] = @"bundleIdentifier cannot be nil.";
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
  id v13 = [v14 errorWithDomain:v15 code:-1 userInfo:v17];
LABEL_50:

LABEL_51:
  return v13;
}

- (id)terminateWatchAppForCompanionIdentifier:(id)a3 options:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F38CA8]);
  id v6 = objc_opt_class();
  if (v6)
  {
    [v6 sockPuppetSymbols];
    id v7 = (void (*)(id, void *))*((void *)&v19 + 1);
    if (*((void *)&v19 + 1))
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = sub_23088BED4;
      v13[3] = &unk_264B8DAE8;
      id v14 = v5;
      v7(v4, v13);
      id v8 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  id v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = DTDefaultCompanionProcessControlServiceIdentifier;
  uint64_t v21 = *MEMORY[0x263F08320];
  v22[0] = @"WatchKit framework symbol not found";
  v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v8 = [v9 errorWithDomain:v10 code:-5 userInfo:v11];

  [v5 invokeCompletionWithReturnValue:0 error:v8];
LABEL_6:

  return v5;
}

@end