@interface APFPDIWrapper
+ (id)settings;
+ (int)FPDICreateContext:(void *)a3 withAttribute:(void *)a4 initRequest:(void *)a5 initRequestLength:(unsigned int *)a6;
+ (int)FPDIDestroyAllContext;
+ (int)FPDIDestroyAllNonStashedContexts;
+ (int)FPDIDestroyAttribute:(void *)a3;
+ (int)FPDIDestroyContext:(void *)a3;
+ (int)FPDIDestroyData:(void *)a3;
+ (int)FPDIInitAttribute:(void *)a3;
+ (int)FPDIInitContext:(void *)a3 withInitResponse:(void *)a4 initResponseLength:(unsigned int)a5 setupRequest:(void *)a6 setupRequestLength:(unsigned int *)a7;
+ (int)FPDISetHighPrivacyLevelForAttribute:(void *)a3;
+ (int)FPDISetStashingIsEnabled:(BOOL)a3 forAttribute:(void *)a4;
+ (int)FPDISetupContext:(void *)a3 withSetupResponse:(void *)a4 setupResponseLength:(unsigned int)a5;
+ (int)FPDISignWithContext:(void *)a3 message:(char *)a4 messageLength:(unsigned int)a5 rawSignature:(void *)a6 rawSignatureLength:(unsigned int *)a7;
@end

@implementation APFPDIWrapper

+ (id)settings
{
  return +[APSettings settings];
}

+ (int)FPDIInitAttribute:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 failInitAttribute],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 BOOLValue],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    int v8 = -44751;
  }
  else
  {
    int v8 = sub_1D7101A48((uint64_t)a3);
  }
  v9 = objc_msgSend(@"FPDIInitAttribute", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  v10 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v8;
}

+ (int)FPDISetHighPrivacyLevelForAttribute:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 failSetHighPrivacyLevelForAttribute],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 BOOLValue],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    int v8 = -44650;
  }
  else
  {
    int v8 = sub_1D7101C34((uint64_t)a3, 1011340354);
  }
  v9 = objc_msgSend(@"FPDIAttrSetPrivacyLevel", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  v10 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v8;
}

+ (int)FPDISetStashingIsEnabled:(BOOL)a3 forAttribute:(void *)a4
{
  BOOL v5 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v6 = 1903055587;
  }
  else {
    int v6 = 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (v5
    && +[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 failSetStashingIsEnabled],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 BOOLValue],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    int v11 = -44802;
  }
  else
  {
    int v11 = sub_1D7101F1C((uint64_t)a4, v6);
  }
  v12 = objc_msgSend(@"FPDIAttrSetContextStashingPolicy", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  v13 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v11;
}

+ (int)FPDICreateContext:(void *)a3 withAttribute:(void *)a4 initRequest:(void *)a5 initRequestLength:(unsigned int *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        int v11 = objc_claimAutoreleasedReturnValue(),
        [v11 failCreateContext],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 BOOLValue],
        v12,
        v11,
        (v13 & 1) != 0))
  {
    int v14 = -44654;
  }
  else
  {
    sub_1D71CC48C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
    int v14 = v15;
  }
  v16 = objc_msgSend(@"FPDICreate", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  uint64_t v17 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl(&dword_1D70B2000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v14;
}

+ (int)FPDIInitContext:(void *)a3 withInitResponse:(void *)a4 initResponseLength:(unsigned int)a5 setupRequest:(void *)a6 setupRequestLength:(unsigned int *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        char v13 = objc_claimAutoreleasedReturnValue(),
        [v13 failContextInit],
        int v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 BOOLValue],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    int v16 = -44654;
  }
  else
  {
    sub_1D711A5DC((uint64_t)a3, (uint64_t)a4, v9, (uint64_t)a6, (uint64_t)a7);
    int v16 = v17;
  }
  v18 = objc_msgSend(@"FPDIInit", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  v19 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v16;
}

+ (int)FPDISetupContext:(void *)a3 withSetupResponse:(void *)a4 setupResponseLength:(unsigned int)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        char v7 = objc_claimAutoreleasedReturnValue(),
        [v7 failContextInit],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 BOOLValue],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    int v10 = -44654;
  }
  else
  {
    sub_1D71BECBC((uint64_t)a3);
    int v10 = v11;
  }
  v12 = objc_msgSend(@"FPDISetup", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  char v13 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v16 = v12;
    _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v10;
}

+ (int)FPDISignWithContext:(void *)a3 message:(char *)a4 messageLength:(unsigned int)a5 rawSignature:(void *)a6 rawSignatureLength:(unsigned int *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  if (+[APSystemInternal isAppleInternalInstall]
    && (+[APFPDIWrapper settings],
        char v13 = objc_claimAutoreleasedReturnValue(),
        [v13 failSigning],
        int v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 BOOLValue],
        v14,
        v13,
        v15))
  {
    *a6 = 0;
    *a7 = 0;
    int v16 = -44665;
  }
  else
  {
    sub_1D719C5DC((uint64_t)a3, (uint64_t)a4, v9, (uint64_t)a6, (uint64_t)a7);
    int v16 = v17;
  }
  v18 = objc_msgSend(@"FPDISign", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  v19 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v18;
    _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v16;
}

+ (int)FPDIDestroyAttribute:(void *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  int v5 = sub_1D7101850((uint64_t)a3);
  int v6 = objc_msgSend(@"FPDIAttrDestroy", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  char v7 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v5;
}

+ (int)FPDIDestroyData:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  sub_1D71C5F44((uint64_t)a3);
  int v6 = v5;
  char v7 = objc_msgSend(@"FPDIDataDestroy", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  int v8 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v6;
}

+ (int)FPDIDestroyContext:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  sub_1D7181528((uint64_t)a3);
  int v6 = v5;
  char v7 = objc_msgSend(@"FPDIDestroy", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  int v8 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v6;
}

+ (int)FPDIDestroyAllNonStashedContexts
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  sub_1D710BE94(2);
  int v4 = v3;
  int v5 = objc_msgSend(@"FPDIDestroyAllContexts", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  int v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v4;
}

+ (int)FPDIDestroyAllContext
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  sub_1D710BE94(0);
  int v4 = v3;
  int v5 = objc_msgSend(@"FPDIDestroyAllContexts", "stringByAppendingFormat:", @": %.3f", CFAbsoluteTimeGetCurrent() - Current);
  int v6 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v4;
}

@end