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
  return (NSString *)_MGGetStringAnswer(@"DeviceClass", a2);
}

+ (BOOL)hasHEVCDecoding
{
  return _MGGetBoolAnswer(@"N8lZxRgC7lfdRS3dRLn+Ag", a2);
}

+ (BOOL)hasSystemTelephonyOfAnyKind
{
  return _MGGetBoolAnswer(@"any-telephony", a2);
}

+ (BOOL)hasVenice
{
  return _MGGetBoolAnswer(@"venice", a2);
}

+ (BOOL)isTouchIDSupported
{
  return _MGGetBoolAnswer(@"touch-id", a2);
}

+ (NSString)productType
{
  return (NSString *)_MGGetStringAnswer(@"ProductType", a2);
}

+ (BOOL)wapiCapability
{
  return _MGGetBoolAnswer(@"wapi", a2);
}

+ (NSString)activePairedSystemVersion
{
  if (qword_BEA50 != -1) {
    dispatch_once(&qword_BEA50, &stru_AE290);
  }
  v2 = (void *)qword_BEA58;

  return (NSString *)v2;
}

+ (BOOL)hasCapabilities:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v24;
    CFBooleanRef v8 = kCFBooleanTrue;
    *(void *)&long long v5 = 138544130;
    long long v21 = v5;
    uint64_t v22 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", &stru_B2B88, v21) & 1) == 0)
        {
          CFBooleanRef v11 = (const __CFBoolean *)MGCopyAnswerWithError();
          CFBooleanRef v12 = v11;
          if (v11)
          {
            CFRelease(v11);
          }
          else
          {
            v13 = +[AMSLogConfig sharedConfig];
            if (!v13)
            {
              v13 = +[AMSLogConfig sharedConfig];
            }
            v14 = [v13 OSLogObject];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v15 = v3;
              CFBooleanRef v16 = v8;
              uint64_t v17 = objc_opt_class();
              v18 = AMSLogKey();
              *(_DWORD *)buf = v21;
              uint64_t v28 = v17;
              CFBooleanRef v8 = v16;
              id v3 = v15;
              uint64_t v7 = v22;
              __int16 v29 = 2114;
              v30 = v18;
              __int16 v31 = 2114;
              v32 = v10;
              __int16 v33 = 1026;
              int v34 = 0;
              _os_log_impl(&def_41A10, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain capability: %{public}@, %{public}d", buf, 0x26u);
            }
          }
          if (v12 != v8)
          {
            BOOL v19 = 0;
            goto LABEL_19;
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v23 objects:v35 count:16];
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