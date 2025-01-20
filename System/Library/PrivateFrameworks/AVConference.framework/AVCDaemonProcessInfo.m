@interface AVCDaemonProcessInfo
+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenWithError:(SEL)a3;
+ (id)getDaemonProcessInfo;
@end

@implementation AVCDaemonProcessInfo

+ (id)getDaemonProcessInfo
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[AVConferenceXPCClient AVConferenceXPCClientSingleton];
  v4 = @"vcGetDaemonProcessInfoUniquePid";
  v5[0] = [MEMORY[0x1E4F1CA98] null];
  return (id)objc_msgSend(v2, "sendMessageSync:arguments:xpcArguments:", "vcGetDaemonProcessInfo", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1), 0);
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenWithError:(SEL)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = +[AVConferenceXPCClient AVConferenceXPCClientSingleton];
  v12 = @"vcDaemonProcessInfoAuditToken";
  v13[0] = [MEMORY[0x1E4F1CA98] null];
  v7 = objc_msgSend(v6, "sendMessageSync:arguments:xpcArguments:", "vcGetDaemonProcessInfo", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), 0);
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)retstr->var0 = v8;
  *(_OWORD *)&retstr->var0[4] = v8;
  v9 = objc_msgSend(v7, "objectForKeyedSubscript:", @"ERROR", VCUtil_AuditTokenForCurrentProcess(retstr));
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)[v7 objectForKeyedSubscript:@"vcDaemonProcessInfoAuditToken"];
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = result == 0;
  }
  if (!v11) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result getBytes:retstr length:32];
  }
  if (a4) {
    *a4 = v9;
  }
  return result;
}

@end