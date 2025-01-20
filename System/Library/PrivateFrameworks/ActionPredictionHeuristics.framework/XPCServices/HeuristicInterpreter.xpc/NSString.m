@interface NSString
- (BOOL)atx_isCreditCardNumber;
- (BOOL)atx_isSSN;
- (id)atx_appNameFromBundleID;
- (id)atx_dataDetectors;
- (id)atx_phoneNumberFromTelURLString;
@end

@implementation NSString

- (BOOL)atx_isSSN
{
  if ((id)[(NSString *)self length] == (id)9 || (id)[(NSString *)self length] == (id)11)
  {
    if ((id)[(NSString *)self length] == (id)9)
    {
      v3 = self;
LABEL_5:
      v4 = v3;
LABEL_12:
      v6 = +[NSCharacterSet decimalDigitCharacterSet];
      v7 = [v6 invertedSet];
      BOOL v5 = [(NSString *)v4 rangeOfCharacterFromSet:v7] == (id)0x7FFFFFFFFFFFFFFFLL;

      return v5;
    }
    if ((id)[(NSString *)self length] != (id)11)
    {
      v4 = 0;
      goto LABEL_12;
    }
    if ([(NSString *)self characterAtIndex:3] == 45
      && [(NSString *)self characterAtIndex:6] == 45)
    {
      v3 = [(NSString *)self stringByReplacingOccurrencesOfString:@"-" withString:&stru_100025C48];
      goto LABEL_5;
    }
  }
  return 0;
}

- (BOOL)atx_isCreditCardNumber
{
  v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@" " withString:&stru_100025C48];
  v3 = +[NSCharacterSet decimalDigitCharacterSet];
  v4 = [v3 invertedSet];
  id v5 = [v2 rangeOfCharacterFromSet:v4];

  v6 = (char *)[v2 length];
  BOOL v7 = (unint64_t)(v6 - 15) < 2 || v5 != (id)0x7FFFFFFFFFFFFFFFLL;
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL || !v7)
  {
    BOOL v9 = 0;
  }
  else
  {
    int v10 = (int)v6;
    v11 = [v2 UTF8String];
    if (v10 < 1)
    {
      BOOL v9 = 1;
    }
    else
    {
      int v12 = 0;
      unint64_t v13 = v10 + 1;
      do
      {
        LOBYTE(v14) = v11[(v13 - 2)] - 48;
        if ((((v13 - 2) ^ v10) & 1) == 0)
        {
          signed int v14 = (char)(2 * v14);
          if (v14 >= 10) {
            signed int v14 = v14 - 10 * (v14 / 0xAu) + v14 / 0xAu;
          }
        }
        v12 += (char)v14;
        --v13;
      }
      while (v13 > 1);
      HIDWORD(v15) = -858993459 * v12 + 429496728;
      LODWORD(v15) = HIDWORD(v15);
      BOOL v9 = (v15 >> 1) < 0x19999999;
    }
  }

  return v9;
}

- (id)atx_dataDetectors
{
  if (![(NSString *)self length])
  {
LABEL_11:
    v8 = &__NSArray0__struct;
    goto LABEL_18;
  }
  v3 = sub_100002EBC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000193BC((uint64_t)self, v3);
  }

  uint64_t v12 = 0;
  uint64_t v4 = DDScannerCreate();
  if (!v4)
  {
    BOOL v9 = sub_100002EBC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000192B8(&v12, v9);
    }

    goto LABEL_11;
  }
  id v5 = (const void *)v4;
  if (!DDScannerScanString())
  {
    int v10 = sub_100002EBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100019334(v10);
    }
    goto LABEL_16;
  }
  CFArrayRef v6 = (const __CFArray *)DDScannerCopyResultsWithOptions();
  if (!v6)
  {
    int v10 = sub_100002EBC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100019378(v10);
    }
LABEL_16:

    v8 = 0;
    goto LABEL_17;
  }
  CFArrayRef v7 = v6;
  v8 = sub_100018898(v6, (const __CFString *)self, 0);
  CFRelease(v7);
LABEL_17:
  CFRelease(v5);
LABEL_18:

  return v8;
}

- (id)atx_phoneNumberFromTelURLString
{
  v2 = self;
  if ([(NSString *)v2 hasPrefix:@"tel://"])
  {
    uint64_t v3 = 6;
  }
  else
  {
    if (![(NSString *)v2 hasPrefix:@"tel:"]) {
      goto LABEL_6;
    }
    uint64_t v3 = 4;
  }
  uint64_t v4 = [(NSString *)v2 substringFromIndex:v3];

  v2 = (NSString *)v4;
LABEL_6:
  id v5 = [(NSString *)v2 stringByReplacingOccurrencesOfString:@"p" withString:@","];

  CFArrayRef v6 = [v5 stringByReplacingOccurrencesOfString:@"w" withString:@";"];

  id v7 = [v6 rangeOfString:@";" options:2];
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    id v9 = v7;
    v8 = [v6 substringFromIndex:v7];
    uint64_t v10 = [v6 substringToIndex:v9];

    CFArrayRef v6 = (void *)v10;
  }
  v11 = [v6 stringByRemovingPercentEncoding];

  if (v8)
  {
    uint64_t v12 = (char *)[v8 rangeOfString:@";ext=" options:2];
    if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      signed int v14 = [v8 stringByRemovingPercentEncoding];
      unint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"p" withString:@","];

      v16 = [v15 stringByReplacingOccurrencesOfString:@"w" withString:@";"];

      uint64_t v17 = [v11 stringByAppendingString:v16];

      v11 = (void *)v17;
    }
    else
    {
      v18 = &v12[v13];
      v19 = (char *)objc_msgSend(v8, "rangeOfString:options:range:", @";",
                      2,
                      v18,
                      (unsigned char *)[v8 length] - v18);
      if (v19 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        [v8 substringFromIndex:v18];
      }
      else {
      v20 = objc_msgSend(v8, "substringWithRange:", v18, v19 - v18);
      }
      v21 = [v20 stringByRemovingPercentEncoding];

      v25[0] = v11;
      v25[1] = v21;
      v22 = +[NSArray arrayWithObjects:v25 count:2];
      uint64_t v23 = [v22 componentsJoinedByString:@","];

      v11 = (void *)v23;
    }
  }

  return v11;
}

- (id)atx_appNameFromBundleID
{
  if ([(NSString *)self isEqualToString:@"com.apple.Pasteboard.pbutil"])
  {
    uint64_t v3 = @"pbutil";
  }
  else
  {
    uint64_t v4 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned __int8 v5 = [v4 applicationIsInstalled:self];

    if (v5)
    {
      CFArrayRef v6 = +[ATXApplicationRecord localizedNameForBundle:self];
      id v7 = v6;
      if (v6)
      {
        id v7 = v6;
        uint64_t v3 = (__CFString *)v7;
      }
      else
      {
        v8 = sub_100002EBC();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          v11 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "LSApplicationRecord cannot find localizedName for bundleID even though it is installed: %@", (uint8_t *)&v10, 0xCu);
        }

        uint64_t v3 = 0;
      }
    }
    else
    {
      id v7 = sub_100002EBC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        v11 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "bundleID has no installed application: %@", (uint8_t *)&v10, 0xCu);
      }
      uint64_t v3 = 0;
    }
  }

  return v3;
}

@end