@interface BCSURLDataParser
+ (id)_canonicalizeMessageURL:(id)a3;
+ (id)parseString:(id)a3;
+ (id)parseURL:(id)a3;
+ (id)parseURL:(id)a3 originalString:(id)a4;
+ (int64_t)_dataTypeForSchemeIfSupportedByDataDetectors:(id)a3;
@end

@implementation BCSURLDataParser

+ (id)parseString:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v5) {
    +[BCSURLDataParser parseString:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if ((unint64_t)[v4 length] < 0xFA1)
  {
    if (objc_msgSend(v4, "_bcs_hasCaseInsensitivePrefix:", @"URL:"))
    {
      BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v14) {
        +[BCSURLDataParser parseString:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
      v22 = [v4 substringFromIndex:4];
      uint64_t v23 = objc_msgSend(v22, "_bcs_trimmedString");

      id v4 = (id)v23;
    }
    v24 = objc_msgSend(NSURL, "_bcs_URLWithUserTypedString:", v4);
    if (v24)
    {
      v13 = [a1 parseURL:v24 originalString:v4];
    }
    else
    {
      BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v25) {
        +[BCSURLDataParser parseString:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BCSURLDataParser parseString:](v4);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)parseURL:(id)a3
{
  return (id)[a1 parseURL:a3 originalString:0];
}

+ (id)parseURL:(id)a3 originalString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "_bcs_isMapsURL"))
  {
    uint64_t v8 = [[BCSParsedURLData alloc] initWithURL:v6 type:6];
    goto LABEL_46;
  }
  uint64_t v9 = [v6 scheme];
  uint64_t v10 = [v9 lowercaseString];

  if (![(__CFString *)v10 length])
  {
    BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v20) {
      +[BCSURLDataParser parseURL:originalString:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
    uint64_t v8 = 0;
    goto LABEL_45;
  }
  if (([(__CFString *)v10 isEqualToString:@"smsto"] & 1) != 0
    || [(__CFString *)v10 isEqualToString:@"sms"])
  {
    uint64_t v11 = [a1 _canonicalizeMessageURL:v6];

    uint64_t v10 = @"sms";
    id v6 = (id)v11;
  }
  if ([(__CFString *)v10 isEqualToString:@"continuitycamera"])
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v12) {
      +[BCSURLDataParser parseURL:originalString:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    uint64_t v8 = [[BCSParsedURLData alloc] initWithURL:v6 type:15];
    goto LABEL_45;
  }
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2050000000;
  uint64_t v28 = (void *)getHMAccessorySetupCoordinatorClass_softClass;
  uint64_t v90 = getHMAccessorySetupCoordinatorClass_softClass;
  if (!getHMAccessorySetupCoordinatorClass_softClass)
  {
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __getHMAccessorySetupCoordinatorClass_block_invoke;
    v86[3] = &unk_26468ACC8;
    v86[4] = &v87;
    __getHMAccessorySetupCoordinatorClass_block_invoke((uint64_t)v86);
    uint64_t v28 = (void *)v88[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v87, 8);
  uint64_t v30 = [v6 absoluteString];
  uint64_t v31 = [v29 communicationProtocolForSetupPayloadURLString:v30];

  if (v31)
  {
    uint64_t v32 = [v31 integerValue];
    if (v32 == 2)
    {
      v63 = NSURL;
      v64 = NSString;
      v65 = [v6 absoluteString];
      v66 = [v64 stringWithFormat:@"com.apple.Home-private://addAccessory?payload=%@", v65];
      v53 = objc_msgSend(v63, "_bcs_URLWithUserTypedString:", v66);

      BOOL v67 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v67) {
        +[BCSURLDataParser parseURL:originalString:].cold.7(v67, v68, v69, v70, v71, v72, v73, v74);
      }
      v54 = [[BCSParsedURLData alloc] initWithURL:v53 type:12];
      goto LABEL_36;
    }
    if (v32 == 1)
    {
      BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v33) {
        +[BCSURLDataParser parseURL:originalString:].cold.6(v33, v34, v35, v36, v37, v38, v39, v40);
      }
      v41 = [BCSParsedURLData alloc];
      id v42 = v6;
      uint64_t v43 = 9;
      goto LABEL_42;
    }
  }
  if (!objc_msgSend(v6, "_bcs_isSHCURL"))
  {
    if (objc_msgSend(v6, "_bcs_isWalletRemoteRequestURL") && _os_feature_enabled_impl())
    {
      v41 = [BCSParsedURLData alloc];
      id v42 = v6;
      uint64_t v43 = 16;
    }
    else if (objc_msgSend(v6, "as_isPasskeyRegistrationURL"))
    {
      BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v55) {
        +[BCSURLDataParser parseURL:originalString:].cold.4(v55, v56, v57, v58, v59, v60, v61, v62);
      }
      v41 = [BCSParsedURLData alloc];
      id v42 = v6;
      uint64_t v43 = 14;
    }
    else if ((objc_msgSend(v6, "as_isPasskeyURL") & 1) != 0 {
           || objc_msgSend(v6, "_bcs_hasScheme:", @"fido"))
    }
    {
      BOOL v75 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v75) {
        +[BCSURLDataParser parseURL:originalString:].cold.5(v75, v76, v77, v78, v79, v80, v81, v82);
      }
      v41 = [BCSParsedURLData alloc];
      id v42 = v6;
      uint64_t v43 = 13;
    }
    else
    {
      uint64_t v85 = [a1 _dataTypeForSchemeIfSupportedByDataDetectors:v10];
      v41 = [BCSParsedURLData alloc];
      id v42 = v6;
      if (!v85)
      {
        uint64_t v83 = [(BCSParsedURLData *)v41 initWithURL:v6];
        goto LABEL_43;
      }
      uint64_t v43 = v85;
    }
LABEL_42:
    uint64_t v83 = [(BCSParsedURLData *)v41 initWithURL:v42 type:v43];
LABEL_43:
    uint64_t v8 = (BCSParsedURLData *)v83;
    goto LABEL_44;
  }
  BOOL v44 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v44) {
    +[BCSURLDataParser parseURL:originalString:](v44, v45, v46, v47, v48, v49, v50, v51);
  }
  v52 = [BCSParsedURLData alloc];
  v53 = objc_msgSend(v6, "_bcs_redirectedHealthURLWithOriginalString:", v7);
  v54 = [(BCSParsedURLData *)v52 initWithURL:v53];
LABEL_36:
  uint64_t v8 = v54;

LABEL_44:
LABEL_45:

LABEL_46:
  return v8;
}

+ (int64_t)_dataTypeForSchemeIfSupportedByDataDetectors:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"tel"] & 1) != 0
    || ([v3 isEqualToString:@"facetime"] & 1) != 0
    || ([v3 isEqualToString:@"facetime-audio"] & 1) != 0)
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"mailto"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"sms"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)_canonicalizeMessageURL:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08BA0];
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = [v4 scheme];

  id v7 = [v6 lowercaseString];
  int v8 = [v7 isEqualToString:@"smsto"];

  if (v8)
  {
    uint64_t v9 = [v5 path];
    uint64_t v10 = [v9 rangeOfString:@":"];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v9 substringToIndex:v10];

      [v5 setPath:v11];
      uint64_t v9 = (void *)v11;
    }
    [v5 setQuery:0];
  }
  [v5 setScheme:@"sms"];
  BOOL v12 = [v5 URL];

  return v12;
}

+ (void)parseString:(void *)a1 .cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = [a1 length];
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSURLDataParser: QR code payload, with %ld characters, is too long", (uint8_t *)&v1, 0xCu);
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseURL:(uint64_t)a3 originalString:(uint64_t)a4 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end