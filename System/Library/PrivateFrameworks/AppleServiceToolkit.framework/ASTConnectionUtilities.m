@interface ASTConnectionUtilities
+ (BOOL)didEncounterNetworkDisconnectionError:(id)a3;
+ (BOOL)isGzipEnabled;
+ (BOOL)isValidResponse:(id)a3;
+ (BOOL)relaxTimeouts;
+ (BOOL)trustIsValidWithProtectionSpace:(id)a3 rootOfTrust:(unint64_t)a4;
+ (BOOL)useChunkedTransferEncoding;
+ (id)MD5HeaderValueForTask:(id)a3;
+ (id)getServerLoggingSelection;
+ (unint64_t)allowCellularSizeThreshold;
@end

@implementation ASTConnectionUtilities

+ (BOOL)didEncounterNetworkDisconnectionError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    BOOL v5 = [v3 code] == -1009
  }
      || [v4 code] == -1005
      || [v4 code] == -1004
      || [v4 code] == -1001;
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isValidResponse:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 objectForKeyedSubscript:@"code"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char isKindOfClass = [v5 isEqualToString:@"NoError"];
    }
    else {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  v7 = [v3 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_26F0B5850];
    char isKindOfClass = [v8 containsObject:v7];
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"suites"];
  if (v9)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  v10 = [v3 objectForKeyedSubscript:@"diagnosticEventId"];
  if (v10)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  uint64_t v21 = [v3 objectForKeyedSubscript:@"archived"];
  char v11 = (v21 != 0) | isKindOfClass;
  v12 = [v3 objectForKeyedSubscript:@"messages"];
  v13 = [v3 objectForKeyedSubscript:@"options"];
  uint64_t v14 = [v3 objectForKeyedSubscript:@"images"];
  v15 = (void *)v14;
  if (v12 && v13 && v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
    }
    else
    {
      char v11 = 0;
    }
  }
  v16 = (void *)v9;
  v23 = v4;
  v17 = objc_msgSend(v3, "objectForKeyedSubscript:", @"suiteName", v21);
  uint64_t v18 = [v3 objectForKeyedSubscript:@"components"];
  v19 = (void *)v18;
  if (v17 && v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11 & 1;
}

+ (BOOL)relaxTimeouts
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  v2 = (void *)CFPreferencesCopyAppValue(@"RelaxTimeouts", @"com.apple.AppleServiceToolkit");
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)getServerLoggingSelection
{
  if (getServerLoggingSelection_onceToken != -1) {
    dispatch_once(&getServerLoggingSelection_onceToken, &__block_literal_global_2);
  }
  if (getServerLoggingSelection_selection) {
    v2 = (void *)getServerLoggingSelection_selection;
  }
  else {
    v2 = &unk_26F0B5868;
  }

  return v2;
}

uint64_t __51__ASTConnectionUtilities_getServerLoggingSelection__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  getServerLoggingSelection_selection = (uint64_t)CFPreferencesCopyAppValue(@"ServerLogging", @"com.apple.AppleServiceToolkit");

  return MEMORY[0x270F9A758]();
}

+ (id)MD5HeaderValueForTask:(id)a3
{
  char v3 = [a3 response];
  v4 = [v3 allHeaderFields];
  BOOL v5 = [v4 objectForKeyedSubscript:@"AST-file-MD5"];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"AST-file-MD5"];
  }
  else
  {
    v7 = [v4 objectForKeyedSubscript:@"Etag"];

    if (v7)
    {
      v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\""];
      uint64_t v9 = [v4 objectForKeyedSubscript:@"Etag"];
      v6 = [v9 stringByTrimmingCharactersInSet:v8];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isGzipEnabled
{
  if (isGzipEnabled_onceToken != -1) {
    dispatch_once(&isGzipEnabled_onceToken, &__block_literal_global_41);
  }
  return isGzipEnabled_gzipEnabled;
}

uint64_t __39__ASTConnectionUtilities_isGzipEnabled__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"GZIPEnabled", @"com.apple.AppleServiceToolkit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = !v1;
  isGzipEnabled_gzipEnabled = v2;
  return result;
}

+ (BOOL)useChunkedTransferEncoding
{
  if (useChunkedTransferEncoding_onceToken != -1) {
    dispatch_once(&useChunkedTransferEncoding_onceToken, &__block_literal_global_43);
  }
  return useChunkedTransferEncoding__useChunkedTransferEncoding;
}

uint64_t __52__ASTConnectionUtilities_useChunkedTransferEncoding__block_invoke()
{
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"UseChunkedTransferEncoding", @"com.apple.AppleServiceToolkit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = !v1;
  useChunkedTransferEncoding__useChunkedTransferEncoding = v2;
  return result;
}

+ (unint64_t)allowCellularSizeThreshold
{
  if (allowCellularSizeThreshold_onceToken != -1) {
    dispatch_once(&allowCellularSizeThreshold_onceToken, &__block_literal_global_45);
  }
  return allowCellularSizeThreshold__allowCellularSizeThreshold;
}

CFIndex __52__ASTConnectionUtilities_allowCellularSizeThreshold__block_invoke()
{
  allowCellularSizeThreshold__allowCellularSizeThreshold = -1;
  CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"AllowCellularData", @"com.apple.AppleServiceToolkit", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((result & 0x8000000000000000) == 0) {
      allowCellularSizeThreshold__allowCellularSizeThreshold = result;
    }
  }
  return result;
}

+ (BOOL)trustIsValidWithProtectionSpace:(id)a3 rootOfTrust:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v12 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.5(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_9;
  }
  uint64_t v7 = [v5 serverTrust];
  if (!v7)
  {
LABEL_9:
    v20 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:].cold.4(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v8 = 0;
    int v28 = 0;
LABEL_13:
    v29 = ASTLogHandleForCategory(1);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:](v29, v30, v31, v32, v33, v34, v35, v36);
    }

    OSStatus v11 = 0;
    if (!v28) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v8 = (__SecTrust *)v7;
  if (a4 - 4 > 0xFFFFFFFFFFFFFFFDLL
    || ([v6 host],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        AppleAST2Service = (const void *)SecPolicyCreateAppleAST2Service(),
        v9,
        !AppleAST2Service))
  {
    int v28 = 1;
    goto LABEL_13;
  }
  OSStatus v11 = SecTrustSetPolicies(v8, AppleAST2Service);
  CFRelease(AppleAST2Service);
LABEL_16:
  if (!v11)
  {
    CFErrorRef error = 0;
    LODWORD(v8) = SecTrustEvaluateWithError(v8, &error);
    CFErrorRef v37 = error;
    v38 = ASTLogHandleForCategory(1);
    v39 = v38;
    if (v8)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_23CA80000, v39, OS_LOG_TYPE_DEFAULT, "SecTrust cert is trusted", v41, 2u);
      }
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:]((uint64_t)v37, v39);
    }

    goto LABEL_26;
  }
LABEL_20:
  ASTLogHandleForCategory(1);
  v8 = (__SecTrust *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    +[ASTConnectionUtilities trustIsValidWithProtectionSpace:rootOfTrust:](v11, v8);
  }

  LOBYTE(v8) = 0;
LABEL_26:

  return (char)v8;
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a1 rootOfTrust:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "SecTrust cert is not trusted: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)trustIsValidWithProtectionSpace:(int)a1 rootOfTrust:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_23CA80000, a2, OS_LOG_TYPE_ERROR, "SecTrustSetAnchorCertificates failed: %d", (uint8_t *)v2, 8u);
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)trustIsValidWithProtectionSpace:(uint64_t)a3 rootOfTrust:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end