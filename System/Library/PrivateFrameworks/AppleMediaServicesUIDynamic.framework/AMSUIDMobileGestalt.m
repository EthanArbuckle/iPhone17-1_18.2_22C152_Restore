@interface AMSUIDMobileGestalt
+ (BOOL)hasCapabilities:(id)a3;
+ (BOOL)hasHEVCDecoding;
+ (BOOL)hasSystemTelephonyOfAnyKind;
+ (BOOL)hasVenice;
+ (BOOL)isTouchIDSupported;
+ (BOOL)wapiCapability;
+ (NSString)activePairedSystemVersion;
+ (NSString)deviceClass;
+ (NSString)productType;
@end

@implementation AMSUIDMobileGestalt

+ (NSString)deviceClass
{
  return (NSString *)MEMORY[0x1F417CE38](@"DeviceClass", a2);
}

+ (BOOL)hasHEVCDecoding
{
  return MEMORY[0x1F417CE00](@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return MEMORY[0x1F417CE00](@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return MEMORY[0x1F417CE00](@"venice", a2);
}

+ (BOOL)isTouchIDSupported
{
  return MEMORY[0x1F417CE00](@"touch-id", a2);
}

+ (NSString)productType
{
  return (NSString *)MEMORY[0x1F417CE38](@"ProductType", a2);
}

+ (BOOL)wapiCapability
{
  return MEMORY[0x1F417CE00](@"wapi", a2);
}

+ (NSString)activePairedSystemVersion
{
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  }
  v2 = (void *)qword_1EA150BD8;

  return (NSString *)v2;
}

void __48__AMSUIDMobileGestalt_activePairedSystemVersion__block_invoke()
{
  v0 = [MEMORY[0x1E4F79EF0] sharedInstance];
  id v4 = [v0 getActivePairedDevice];

  v1 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F79E60]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  v3 = (void *)qword_1EA150BD8;
  qword_1EA150BD8 = (uint64_t)v2;
}

+ (BOOL)hasCapabilities:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v24;
    v8 = (const void *)*MEMORY[0x1E4F1CFD0];
    *(void *)&long long v5 = 138544130;
    long long v21 = v5;
    uint64_t v22 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", &stru_1F1AB35C0, v21) & 1) == 0)
        {
          v11 = (const void *)MGCopyAnswerWithError();
          v12 = v11;
          if (v11)
          {
            CFRelease(v11);
          }
          else
          {
            v13 = [MEMORY[0x1E4F4DCE8] sharedConfig];
            if (!v13)
            {
              v13 = [MEMORY[0x1E4F4DCE8] sharedConfig];
            }
            v14 = [v13 OSLogObject];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v15 = v3;
              v16 = v8;
              uint64_t v17 = objc_opt_class();
              v18 = AMSLogKey();
              *(_DWORD *)buf = v21;
              uint64_t v28 = v17;
              v8 = v16;
              id v3 = v15;
              uint64_t v7 = v22;
              __int16 v29 = 2114;
              v30 = v18;
              __int16 v31 = 2114;
              v32 = v10;
              __int16 v33 = 1026;
              int v34 = 0;
              _os_log_impl(&dword_1BF3A0000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain capability: %{public}@, %{public}d", buf, 0x26u);
            }
          }
          if (v12 != v8)
          {
            BOOL v19 = 0;
            goto LABEL_19;
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_19:

  return v19;
}

@end