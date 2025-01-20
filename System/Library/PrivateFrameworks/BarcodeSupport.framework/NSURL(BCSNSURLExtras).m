@interface NSURL(BCSNSURLExtras)
+ (id)_bcs_searchURLWithQuery:()BCSNSURLExtras;
+ (uint64_t)_bcs_URLWithUserTypedString:()BCSNSURLExtras;
- (id)_bcs_displayString;
- (id)_bcs_hostWithoutWwwDot;
- (id)_bcs_localizedDisplayNameForRedirectedSHCURL;
- (id)_bcs_redirectedHealthURLWithOriginalString:()BCSNSURLExtras;
- (uint64_t)_bcs_hasScheme:()BCSNSURLExtras;
- (uint64_t)_bcs_isDataDetectorURL;
- (uint64_t)_bcs_isHTTPFamilyURL;
- (uint64_t)_bcs_isMapsURL;
- (uint64_t)_bcs_isOtpauthMigrationURL;
- (uint64_t)_bcs_isOtpauthURL;
- (uint64_t)_bcs_isRedirectedSHCURL;
- (uint64_t)_bcs_isSHCURL;
- (uint64_t)_bcs_isUPIURL;
- (uint64_t)_bcs_isWalletRemoteRequestURL;
- (void)_bcs_localizedDisplayNameForRedirectedSHCURL;
@end

@implementation NSURL(BCSNSURLExtras)

- (uint64_t)_bcs_isHTTPFamilyURL
{
  v1 = [a1 scheme];
  v2 = [v1 lowercaseString];

  if ([v2 isEqualToString:@"http"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"https"];
  }

  return v3;
}

- (uint64_t)_bcs_isWalletRemoteRequestURL
{
  v1 = [a1 absoluteString];
  uint64_t v2 = objc_msgSend(v1, "safari_hasCaseInsensitivePrefix:", @"https://wallet.apple.com/remoteRequest/?t=");

  return v2;
}

- (uint64_t)_bcs_isMapsURL
{
  uint64_t v2 = [a1 scheme];
  uint64_t v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"maps"])
  {
    uint64_t v4 = 1;
  }
  else if (([v3 isEqualToString:@"http"] & 1) != 0 {
         || [v3 isEqualToString:@"https"])
  }
  {
    v5 = [a1 host];
    v6 = [v5 lowercaseString];
    uint64_t v4 = [v6 isEqualToString:@"maps.apple.com"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)_bcs_isSHCURL
{
  uint64_t v2 = [a1 scheme];
  uint64_t v3 = [v2 lowercaseString];

  uint64_t v4 = validHealthURLPrefixForScheme(v3);
  if (v4)
  {
    v5 = [a1 absoluteString];
    if (objc_msgSend(v5, "safari_hasCaseInsensitivePrefix:", v4)
      && (unint64_t v6 = [v4 length], objc_msgSend(v5, "length") >= v6))
    {
      v8 = [v5 substringFromIndex:v6];
      uint64_t v7 = [v8 hasPrefix:@"/"] ^ 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)_bcs_isRedirectedSHCURL
{
  uint64_t v2 = [a1 absoluteString];
  if (objc_msgSend(v2, "safari_hasCaseInsensitivePrefix:", @"https://redirect.health.apple.com/SMARTHealthCard/"))
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [a1 absoluteString];
    uint64_t v3 = objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", @"https://redirect.health.apple.com/EU-DCC/#");
  }
  return v3;
}

- (uint64_t)_bcs_isUPIURL
{
  return objc_msgSend(a1, "_bcs_hasScheme:", @"upi");
}

- (uint64_t)_bcs_isOtpauthURL
{
  if (objc_msgSend(a1, "_bcs_hasScheme:", @"otpauth")) {
    return 1;
  }
  return objc_msgSend(a1, "_bcs_hasScheme:", @"apple-otpauth");
}

- (uint64_t)_bcs_isOtpauthMigrationURL
{
  if (objc_msgSend(a1, "_bcs_hasScheme:", @"otpauth-migration")) {
    return 1;
  }
  return objc_msgSend(a1, "_bcs_hasScheme:", @"apple-otpauth-migration");
}

- (id)_bcs_displayString
{
  if (objc_msgSend(a1, "_bcs_isHTTPFamilyURL"))
  {
    uint64_t v2 = objc_msgSend(a1, "_lp_simplifiedDisplayString");
    if ((unint64_t)[v2 length] > 0x14)
    {
      uint64_t v4 = objc_msgSend(a1, "_lp_highLevelDomain");
      if ([v4 length])
      {
        objc_msgSend(v4, "_bcs_stringForcingLeftToRightDirection");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v5 = v2;
      }
      id v3 = v5;
    }
    else
    {
      id v3 = v2;
    }
  }
  else
  {
    id v3 = [a1 scheme];
  }
  return v3;
}

- (uint64_t)_bcs_isDataDetectorURL
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 lowercaseString];

  uint64_t v3 = [v2 isEqualToString:@"x-barcode-datadetectors-action"];
  return v3;
}

- (id)_bcs_hostWithoutWwwDot
{
  v1 = [MEMORY[0x263F08BA0] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v2 = [v1 host];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 rangeOfString:@"www." options:9] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 substringFromIndex:4];
    }
    unint64_t v6 = v4;
    if ([v4 length])
    {
      id v5 = [v6 lowercaseString];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_bcs_redirectedHealthURLWithOriginalString:()BCSNSURLExtras
{
  id v4 = a3;
  id v5 = [a1 scheme];
  unint64_t v6 = validHealthURLPrefixForScheme(v5);

  if (!v6)
  {
    v13 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [a1 absoluteString];
  v8 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v6, "length"));

  v9 = [a1 scheme];
  uint64_t v10 = [v9 caseInsensitiveCompare:@"shc"];

  if (!v10)
  {
    v14 = NSURL;
    v15 = [@"https://redirect.health.apple.com/SMARTHealthCard/#" stringByAppendingString:v8];
    v13 = [v14 URLWithString:v15];
LABEL_8:

    goto LABEL_9;
  }
  v11 = [a1 scheme];
  uint64_t v12 = [v11 caseInsensitiveCompare:@"hc1"];

  if (!v12)
  {
    v16 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
    v17 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
    v15 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v17];

    v18 = NSURL;
    v19 = [@"https://redirect.health.apple.com/EU-DCC/#" stringByAppendingString:v15];
    v13 = [v18 URLWithString:v19];

    goto LABEL_8;
  }
  v13 = 0;
LABEL_9:

LABEL_10:
  return v13;
}

- (id)_bcs_localizedDisplayNameForRedirectedSHCURL
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v2 = (void *)getHKSignedClinicalDataSourceClass_softClass;
  uint64_t v29 = getHKSignedClinicalDataSourceClass_softClass;
  if (!getHKSignedClinicalDataSourceClass_softClass)
  {
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __getHKSignedClinicalDataSourceClass_block_invoke;
    v24 = &unk_26468ACC8;
    v25 = &v26;
    __getHKSignedClinicalDataSourceClass_block_invoke((uint64_t)&v21);
    uint64_t v2 = (void *)v27[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v26, 8);
  id v4 = [a1 absoluteString];
  id v20 = 0;
  id v5 = [v3 sourceWithQRCodeValue:v4 error:&v20];
  id v6 = v20;

  if (v5)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    uint64_t v7 = (void *)getHKVerifiableHealthRecordsParserClass_softClass;
    uint64_t v29 = getHKVerifiableHealthRecordsParserClass_softClass;
    if (!getHKVerifiableHealthRecordsParserClass_softClass)
    {
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      v23 = __getHKVerifiableHealthRecordsParserClass_block_invoke;
      v24 = &unk_26468ACC8;
      v25 = &v26;
      __getHKVerifiableHealthRecordsParserClass_block_invoke((uint64_t)&v21);
      uint64_t v7 = (void *)v27[3];
    }
    v8 = v7;
    _Block_object_dispose(&v26, 8);
    id v9 = objc_alloc_init(v8);
    id v19 = v6;
    uint64_t v10 = [v9 parseDataSource:v5 options:0 error:&v19];
    id v11 = v19;

    if (v11
      || ([v10 localizedTypeDisplayNames],
          v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 count],
          v14,
          !v15))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[NSURL(BCSNSURLExtras) _bcs_localizedDisplayNameForRedirectedSHCURL]((uint64_t)v11);
      }
    }
    else
    {
      v16 = [v10 localizedTypeDisplayNames];
      uint64_t v17 = [v16 count];

      if (v17 == 1)
      {
        v18 = [v10 localizedTypeDisplayNames];
        uint64_t v12 = [v18 firstObject];

        goto LABEL_10;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[NSURL(BCSNSURLExtras) _bcs_localizedDisplayNameForRedirectedSHCURL](v10);
      }
    }
    uint64_t v12 = 0;
LABEL_10:

    goto LABEL_14;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    [(NSURL(BCSNSURLExtras) *)a1 _bcs_localizedDisplayNameForRedirectedSHCURL];
  }
  uint64_t v12 = 0;
  id v11 = v6;
LABEL_14:

  return v12;
}

+ (id)_bcs_searchURLWithQuery:()BCSNSURLExtras
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 URLQueryAllowedCharacterSet];
  id v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  uint64_t v7 = NSURL;
  v8 = [NSString stringWithFormat:@"x-web-search://?%@", v6];
  id v9 = [v7 URLWithString:v8];

  return v9;
}

+ (uint64_t)_bcs_URLWithUserTypedString:()BCSNSURLExtras
{
  return objc_msgSend(a1, "_lp_URLWithUserTypedString:relativeToURL:", a3, 0);
}

- (uint64_t)_bcs_hasScheme:()BCSNSURLExtras
{
  id v4 = a3;
  id v5 = [a1 scheme];
  uint64_t v6 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v4);

  return v6;
}

- (void)_bcs_localizedDisplayNameForRedirectedSHCURL
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = [a1 localizedTypeDisplayNames];
  int v2 = 138477827;
  id v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSURLAction: obtained multiple HKVerifiableHealthRecordsParsingResult entries: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end