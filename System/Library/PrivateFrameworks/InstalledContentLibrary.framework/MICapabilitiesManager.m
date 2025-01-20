@interface MICapabilitiesManager
+ (id)defaultManager;
- (id)checkCapabilities:(id)a3 withOptions:(id)a4 error:(id *)a5;
@end

@implementation MICapabilitiesManager

+ (id)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MICapabilitiesManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, block);
  }
  v2 = (void *)defaultManager_defaultManager_0;
  return v2;
}

uint64_t __39__MICapabilitiesManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (id)checkCapabilities:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v40 = v7;
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = _CreateAndLogError((uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]", 65, @"MIInstallerErrorDomain", 66, 0, 0, @"UIRequiredDeviceCapabilties in Info.plist does not have an array or dictionary value.", v11, v35);
      id v24 = 0;
      v10 = 0;
      id v40 = 0;
      if (!a5) {
        goto LABEL_47;
      }
      goto LABEL_45;
    }
    id v40 = [v7 allKeys];
    v10 = [v7 allValues];
  }
  id v37 = v7;
  v38 = a5;
  v39 = v9;
  if (v8)
  {
    v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
    if (v12
      && (+[MIDaemonConfiguration sharedInstance],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 installationBlacklist],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 containsObject:v12],
          v14,
          v13,
          v15))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        uint64_t v35 = (uint64_t)v12;
        MOLogWrite();
      }
      int v16 = 1;
    }
    else
    {
      int v16 = 0;
    }
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v17 = objc_msgSend(v40, "count", v35);
  if (!v17)
  {
LABEL_34:
    if (v16)
    {
      v45[0] = @"CapabilitiesMatch";
      v45[1] = @"MismatchedCapabilities";
      v9 = v39;
      v46[0] = MEMORY[0x1E4F1CC28];
      v46[1] = v39;
      v45[2] = @"AppBlacklisted";
      v46[2] = MEMORY[0x1E4F1CC38];
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
      v29 = 0;
      id v7 = v37;
      a5 = v38;
      if (!v38) {
        goto LABEL_47;
      }
    }
    else
    {
      v9 = v39;
      a5 = v38;
      if ([v39 count])
      {
        v43[0] = @"CapabilitiesMatch";
        v43[1] = @"MismatchedCapabilities";
        v44[0] = MEMORY[0x1E4F1CC28];
        v44[1] = v39;
        v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = v44;
        v32 = (__CFString **)v43;
        uint64_t v33 = 2;
      }
      else
      {
        v41 = @"CapabilitiesMatch";
        uint64_t v42 = MEMORY[0x1E4F1CC38];
        v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = &v42;
        v32 = &v41;
        uint64_t v33 = 1;
      }
      id v24 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      v29 = 0;
      id v7 = v37;
      if (!v38) {
        goto LABEL_47;
      }
    }
    goto LABEL_45;
  }
  uint64_t v18 = v17;
  uint64_t v19 = 0;
  v20 = (void *)*MEMORY[0x1E4F1CFD0];
  v21 = (const void *)*MEMORY[0x1E4F1CFC8];
  while (1)
  {
    v22 = [v40 objectAtIndexedSubscript:v19];
    objc_opt_class();
    id v23 = v22;
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    v26 = v20;
    if (v10)
    {
      v26 = [v10 objectAtIndexedSubscript:v19];
    }
    if (!v24) {
      break;
    }
    if (v16)
    {
      if (CFEqual(v20, v26)) {
        v27 = v21;
      }
      else {
        v27 = v20;
      }
      [v39 setObject:v27 forKeyedSubscript:v24];
    }
    else
    {
      v28 = (const void *)MGCopyAnswer();
      if (!v28)
      {
        CFRetain(v21);
        v28 = v21;
      }
      if (!CFEqual(v28, v26)) {
        [v39 setObject:v28 forKeyedSubscript:v24];
      }
      CFRelease(v28);
    }

    if (v18 == ++v19) {
      goto LABEL_34;
    }
  }
  v29 = _CreateAndLogError((uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]", 92, @"MIInstallerErrorDomain", 66, 0, 0, @"UIRequiredDeviceCapabilties in Info.plist has a key that is not a string", v25, v36);
  id v7 = v37;
  a5 = v38;
  v9 = v39;
  if (v38)
  {
LABEL_45:
    if (!v24) {
      *a5 = v29;
    }
  }
LABEL_47:

  return v24;
}

@end