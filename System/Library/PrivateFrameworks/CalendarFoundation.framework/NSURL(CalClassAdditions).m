@interface NSURL(CalClassAdditions)
+ (BOOL)_isValidURI:()CalClassAdditions;
+ (id)URLWithContactIdentifier:()CalClassAdditions;
+ (id)_URLForAddress:()CalClassAdditions scheme:noAddress:;
+ (id)davCompatibleFilenameForFilename:()CalClassAdditions;
+ (uint64_t)URLForMail:()CalClassAdditions;
+ (uint64_t)URLForNoMail;
+ (uint64_t)URLForNoTel;
+ (uint64_t)URLForTel:()CalClassAdditions;
- (BOOL)cal_caseInsensitiveHasScheme:()CalClassAdditions;
- (BOOL)isOnRemoteFileSystem;
- (CFURLRef)initWithCalDirtyString:()CalClassAdditions;
- (id)URLWithUsername:()CalClassAdditions withPassword:;
- (id)cal_emailAddressString;
- (id)cal_hostAfterGoogleRedirects;
- (id)cal_phoneNumberString;
- (id)cal_resourceSpecifierNoLeadingSlashes;
- (id)hostWithoutWWW;
- (id)pathWithoutTrailingRemovingSlash;
- (id)queryParameters;
- (id)serverURL;
- (id)unquotedPassword;
- (uint64_t)_hasDescription:()CalClassAdditions;
- (uint64_t)cal_hasSchemeMailto;
- (uint64_t)cal_hasSchemeTel;
- (uint64_t)cal_isEquivalentToEmailAddress:()CalClassAdditions;
- (uint64_t)cal_isEquivalentToPhoneNumber:()CalClassAdditions;
- (uint64_t)compareToLocalString:()CalClassAdditions;
- (uint64_t)compareToLocalURL:()CalClassAdditions;
- (uint64_t)initWithScheme:()CalClassAdditions host:port:path:;
- (uint64_t)isEqualToURLIgnoringScheme:()CalClassAdditions;
- (uint64_t)isNoMail;
- (uint64_t)isNoTel;
@end

@implementation NSURL(CalClassAdditions)

- (BOOL)isOnRemoteFileSystem
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [a1 path];
  v2 = [v1 stringByDeletingLastPathComponent];

  id v3 = v2;
  memset(&v7, 0, 512);
  int v4 = statfs((const char *)[v3 fileSystemRepresentation], &v7);
  BOOL v5 = (v4 | v7.f_flags & 0x1000) == 0;

  return v5;
}

- (id)pathWithoutTrailingRemovingSlash
{
  v2 = [a1 path];
  if (([v2 hasSuffix:@"/"] & 1) == 0)
  {
    id v3 = [a1 absoluteString];
    int v4 = [v3 hasSuffix:@"/"];

    if (v4)
    {
      uint64_t v5 = [v2 stringByAppendingString:@"/"];

      v2 = (void *)v5;
    }
  }

  return v2;
}

- (uint64_t)compareToLocalURL:()CalClassAdditions
{
  CFURLRef v4 = a3;
  if (v4)
  {
    CFStringRef v5 = CFURLCopyPath(a1);
    v6 = (__CFString *)CFURLCopyPath(v4);
    statfs v7 = v6;
    if (v6)
    {
      char v8 = [(__CFString *)v6 isEqualToString:v5] ^ 1;
      if (!v5) {
        goto LABEL_5;
      }
    }
    else
    {
      char v8 = v5 != 0;
      if (!v5)
      {
LABEL_5:
        if (v7) {
          CFRelease(v7);
        }
        if (v8) {
          goto LABEL_8;
        }
        v10 = [(__CFURL *)v4 port];
        uint64_t v11 = [(__CFURL *)a1 port];
        v12 = (void *)v11;
        if (v10)
        {
          if (v11 && ([v10 isEqualToNumber:v11] & 1) != 0)
          {
LABEL_12:
            v13 = [(__CFURL *)v4 absoluteString];
            v14 = [v13 removeSlashIfNeeded];

            v15 = [(__CFURL *)a1 absoluteString];
            v16 = [v15 removeSlashIfNeeded];

            if (v14 && v16 && ![v16 caseInsensitiveCompare:v14])
            {
              uint64_t v9 = 1;
LABEL_33:

              goto LABEL_34;
            }
            v17 = [(__CFURL *)v4 host];
            v18 = [(__CFURL *)a1 host];
            if ([v17 isEqualToString:v18]) {
              goto LABEL_24;
            }
            unint64_t v19 = [v17 length];
            unint64_t v20 = [v18 length];
            if (v19 >= v20) {
              v21 = v18;
            }
            else {
              v21 = v17;
            }
            if (v19 >= v20) {
              v22 = v17;
            }
            else {
              v22 = v18;
            }
            id v23 = v21;
            id v24 = v22;
            if ([v23 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
            {
              int v25 = [v24 hasPrefix:v23];

              if (v25)
              {
LABEL_24:
                uint64_t v9 = 1;
LABEL_32:

                goto LABEL_33;
              }
            }
            else
            {
            }
            uint64_t v9 = 0;
            goto LABEL_32;
          }
        }
        else if (!v11)
        {
          goto LABEL_12;
        }
        uint64_t v9 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    CFRelease(v5);
    goto LABEL_5;
  }
LABEL_8:
  uint64_t v9 = 0;
LABEL_35:

  return v9;
}

+ (id)URLWithContactIdentifier:()CalClassAdditions
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  CFURLRef v4 = [NSString stringWithFormat:@"addressbook://%@", a3];
  CFStringRef v5 = [v3 URLWithString:v4];

  return v5;
}

+ (id)davCompatibleFilenameForFilename:()CalClassAdditions
{
  id v3 = a3;
  CFURLRef v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = v3;
  v6 = (unsigned char *)[v5 UTF8String];
  uint64_t v7 = *v6;
  if (*v6)
  {
    char v8 = v6 + 1;
    do
    {
      if ((v7 - 48) < 0xA)
      {
        uint64_t v9 = @"%c";
      }
      else
      {
        uint64_t v9 = @"%c";
        if ((v7 & 0xDF) - 65 >= 0x1A)
        {
          if ((v7 - 33) > 0x3E
            || (uint64_t v9 = @"%c", ((1 << (v7 - 33)) & 0x40000000000033C1) == 0))
          {
            if (v7 == 126) {
              uint64_t v9 = @"%c";
            }
            else {
              uint64_t v9 = @"%02X";
            }
          }
        }
      }
      objc_msgSend(v4, "appendFormat:", v9, v7);
      unsigned int v10 = *v8++;
      uint64_t v7 = v10;
    }
    while (v10);
  }

  return v4;
}

- (CFURLRef)initWithCalDirtyString:()CalClassAdditions
{
  CFURLRef v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  v6 = [v4 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  char v8 = (__CFString *)[v7 mutableCopy];
  [(__CFString *)v8 replaceOccurrencesOfString:@" ", @"%20", 2, 0, [(__CFString *)v8 length] withString options range];
  CFURLRef v9 = CFURLCreateWithString(0, v8, 0);
  if (!v9)
  {
    unsigned int v10 = [(__CFString *)v8 CDVStringByXMLUnquoting];
    CFURLRef v9 = CFURLCreateWithString(0, v10, 0);
    if (!v9)
    {
      uint64_t v11 = v10;
      uint64_t v12 = [(__CFString *)v11 rangeOfString:@"://"];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = 0;
      }
      else
      {
        uint64_t v15 = v12 + v13;
        v16 = [(__CFString *)v11 substringFromIndex:v12 + v13];
        unint64_t v17 = [v16 rangeOfString:@"/"];
        uint64_t v19 = v18;
        unint64_t v20 = [v16 rangeOfString:@"?"];
        if (v19) {
          BOOL v22 = v21 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (v22)
        {
          if (v19)
          {
            uint64_t v23 = v19 + v15 + v17;
          }
          else if (v21)
          {
            uint64_t v23 = v21 + v15 + v20;
          }
          else
          {
            uint64_t v23 = [(__CFString *)v11 length];
          }
        }
        else if (v17 < v20)
        {
          uint64_t v23 = v19 + v15 + v17;
        }
        else
        {
          uint64_t v23 = v21 + v15 + v20;
        }
        v14 = -[__CFString substringWithRange:](v11, "substringWithRange:", 0, v23);
        uint64_t v24 = [(__CFString *)v11 substringFromIndex:v23];

        uint64_t v11 = (__CFString *)v24;
      }
      if ([v14 length] || -[__CFString length](v11, "length"))
      {
        int v25 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
        v26 = [(__CFString *)v11 stringByAddingPercentEncodingWithAllowedCharacters:v25];

        if (v26)
        {
          if (v14)
          {
            v27 = [v14 stringByAppendingString:v26];
            CFURLRef v9 = CFURLCreateWithString(0, v27, 0);
          }
          else
          {
            CFURLRef v9 = CFURLCreateWithString(0, v26, 0);
          }
        }
        else
        {
          CFURLRef v9 = 0;
        }
      }
      else
      {
        CFURLRef v9 = 0;
      }
    }
  }
  v28 = (void *)[a1 initWithString:&stru_1EE0C39E0];

  return v9;
}

- (id)queryParameters
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v1 = [a1 query];
  v2 = [v1 componentsSeparatedByString:@"&"];

  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        CFURLRef v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "length", (void)v15))
        {
          unsigned int v10 = [v9 componentsSeparatedByString:@"="];
          if ([v10 count] == 2)
          {
            uint64_t v11 = [v10 objectAtIndex:0];
            uint64_t v12 = [v10 objectAtIndex:1];
            if (v12) {
              BOOL v13 = v11 == 0;
            }
            else {
              BOOL v13 = 1;
            }
            if (!v13 && [v11 length]) {
              [v3 setObject:v12 forKey:v11];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)URLWithUsername:()CalClassAdditions withPassword:
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToString:&stru_1EE0C39E0])
  {
    if (v7)
    {
      uint64_t v12 = [a1 scheme];
      BOOL v13 = [v12 stringByAppendingString:@"://"];

      v14 = [a1 CDVURLWithUser:0];
      long long v15 = [v14 absoluteString];
      long long v16 = (void *)[v15 mutableCopy];

      if ([v16 hasPrefix:v13])
      {
        long long v17 = [MEMORY[0x1E4F28B88] URLUserAllowedCharacterSet];
        long long v18 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v17];

        uint64_t v19 = [MEMORY[0x1E4F28B88] URLPasswordAllowedCharacterSet];
        uint64_t v20 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v19];

        uint64_t v21 = [NSString stringWithFormat:@"%@:%@@", v18, v20];
        objc_msgSend(v16, "insertString:atIndex:", v21, objc_msgSend(v13, "length"));

        id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithCalDirtyString:v16];
      }
      else
      {
        id v10 = a1;
      }

      goto LABEL_5;
    }
    char v8 = a1;
    id v9 = v6;
  }
  else
  {
    char v8 = a1;
    id v9 = 0;
  }
  id v10 = [v8 CDVURLWithUser:v9];
LABEL_5:

  return v10;
}

- (uint64_t)initWithScheme:()CalClassAdditions host:port:path:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = v12;
  if (!a5)
  {
    id v20 = (id)objc_opt_new();
    [v20 setScheme:v10];
    [v20 setHost:v11];
    [v20 setPath:v13];
    uint64_t v18 = [v20 URL];
    v14 = 0;
    long long v15 = 0;
    long long v17 = 0;
    goto LABEL_9;
  }
  if (([v12 isAbsolutePath] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"path %@ is not absolute.", v13 format];
  }
  v14 = [v10 stringByAddingPercentEscapes];
  long long v15 = [v11 stringByAddingPercentEscapes];
  uint64_t v16 = [v13 standardizedURLPath];
  long long v17 = (void *)v16;
  uint64_t v18 = 0;
  if (v14 && v15 && v16)
  {
    uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"%@://%@:%i%@", v14, v15, a5, v16];
    id v20 = (id)[a1 initWithString:v19];

    a1 = v20;
    uint64_t v18 = (uint64_t)v20;
LABEL_9:
  }
  return v18;
}

- (id)serverURL
{
  v2 = [a1 port];

  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSString;
  uint64_t v5 = [a1 scheme];
  uint64_t v6 = [a1 host];
  id v7 = (void *)v6;
  if (v2)
  {
    char v8 = [a1 port];
    id v9 = [v4 stringWithFormat:@"%@://%@:%@/", v5, v7, v8];
    id v10 = [v3 URLWithString:v9];
  }
  else
  {
    char v8 = [v4 stringWithFormat:@"%@://%@/", v5, v6];
    id v10 = [v3 URLWithString:v8];
  }

  return v10;
}

- (id)unquotedPassword
{
  v1 = [a1 password];
  v2 = [v1 stringByRemovingPercentEncoding];

  return v2;
}

- (uint64_t)compareToLocalString:()CalClassAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  uint64_t v3 = [a1 compareToLocalURL:v2];

  return v3;
}

- (uint64_t)isEqualToURLIgnoringScheme:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 isEqual:v4];
  if (v5)
  {
    uint64_t v6 = 1;
  }
  else if (v4)
  {
    id v7 = __55__NSURL_CalClassAdditions__isEqualToURLIgnoringScheme___block_invoke(v5, a1);
    char v8 = __55__NSURL_CalClassAdditions__isEqualToURLIgnoringScheme___block_invoke((uint64_t)v7, v4);
    if ([v7 length] && objc_msgSend(v8, "length")) {
      uint64_t v6 = [v7 isEqualToString:v8];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)hostWithoutWWW
{
  v1 = [a1 host];
  uint64_t v2 = [@"//" length];
  uint64_t v3 = [@"www." length];
  if ([v1 hasPrefix:@"//"])
  {
    uint64_t v4 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v2, &stru_1EE0C39E0);

    v1 = (void *)v4;
  }
  uint64_t v5 = [v1 lowercaseString];
  int v6 = [v5 hasPrefix:@"www."];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v3, &stru_1EE0C39E0);

    v1 = (void *)v7;
  }

  return v1;
}

- (BOOL)cal_caseInsensitiveHasScheme:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 scheme];
  int v6 = v5;
  if (v5) {
    BOOL v7 = [v5 caseInsensitiveCompare:v4] == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)cal_hasSchemeMailto
{
  return objc_msgSend(a1, "cal_caseInsensitiveHasScheme:", @"mailto");
}

- (uint64_t)cal_hasSchemeTel
{
  return objc_msgSend(a1, "cal_caseInsensitiveHasScheme:", @"tel");
}

- (id)cal_resourceSpecifierNoLeadingSlashes
{
  v1 = [a1 resourceSpecifier];
  if ([v1 hasPrefix:@"//"])
  {
    uint64_t v2 = v1;
    uint64_t v3 = 2;
LABEL_5:
    id v4 = [v2 substringFromIndex:v3];
    goto LABEL_7;
  }
  if ([v1 hasPrefix:@"/"])
  {
    uint64_t v2 = v1;
    uint64_t v3 = 1;
    goto LABEL_5;
  }
  id v4 = v1;
LABEL_7:
  uint64_t v5 = v4;

  return v5;
}

- (id)cal_emailAddressString
{
  if (objc_msgSend(a1, "cal_hasSchemeMailto"))
  {
    uint64_t v2 = objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)cal_phoneNumberString
{
  if (objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    uint64_t v2 = objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)cal_isEquivalentToEmailAddress:()CalClassAdditions
{
  id v4 = a3;
  if (v4 && objc_msgSend(a1, "cal_hasSchemeMailto"))
  {
    uint64_t v5 = [v4 stringRemovingMailto];

    int v6 = objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    uint64_t v7 = [v6 isEqualToString:v5];

    id v4 = (id)v5;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)cal_isEquivalentToPhoneNumber:()CalClassAdditions
{
  id v4 = a3;
  if (v4 && objc_msgSend(a1, "cal_hasSchemeTel"))
  {
    uint64_t v5 = [v4 stringRemovingTel];

    int v6 = objc_msgSend(a1, "cal_resourceSpecifierNoLeadingSlashes");
    uint64_t v7 = [v6 isEqualToString:v5];

    id v4 = (id)v5;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (uint64_t)URLForMail:()CalClassAdditions
{
  return [a1 _URLForAddress:a3 scheme:@"mailto" noAddress:@"invalid:nomail"];
}

+ (uint64_t)URLForTel:()CalClassAdditions
{
  return [a1 _URLForAddress:a3 scheme:@"tel" noAddress:@"invalid:notel"];
}

+ (id)_URLForAddress:()CalClassAdditions scheme:noAddress:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    if (([a1 _isValidURI:v8] & 1) == 0)
    {
      if ([v9 isEqualToString:@"mailto"]
        && ([v8 rangeOfString:@"@"], v11)
        || [v9 isEqualToString:@"tel"]
        && objc_msgSend(v8, "cal_isPhoneNumber"))
      {
        id v12 = [v8 trimWhiteSpace];
        BOOL v13 = NSString;
        v14 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
        long long v15 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v14];
        id v16 = [v13 stringWithFormat:@"%@:%@", v9, v15];

        id v8 = v12;
      }
      else
      {
        id v16 = v10;
      }

      id v8 = v16;
    }
    long long v17 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

+ (BOOL)_isValidURI:()CalClassAdditions
{
  id v3 = a3;
  if ([v3 hasPrefix:@"/"])
  {
    BOOL v4 = 1;
  }
  else
  {
    [v3 rangeOfString:@":"];
    BOOL v4 = v5 != 0;
  }

  return v4;
}

+ (uint64_t)URLForNoMail
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"invalid:nomail"];
}

+ (uint64_t)URLForNoTel
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"invalid:notel"];
}

- (uint64_t)isNoMail
{
  return [a1 _hasDescription:@"invalid:nomail"];
}

- (uint64_t)isNoTel
{
  return [a1 _hasDescription:@"invalid:notel"];
}

- (uint64_t)_hasDescription:()CalClassAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 description];
  int v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  char v7 = [v5 isEqualToString:v4];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v6 description];
    uint64_t v8 = [v5 isEqualToString:v9];
  }
  return v8;
}

- (id)cal_hostAfterGoogleRedirects
{
  uint64_t v2 = [a1 host];
  if (![v2 hasSuffixCaseInsensitive:@".google.com"]) {
    goto LABEL_9;
  }
  id v3 = [a1 query];
  if (![v3 hasPrefix:@"q="]) {
    goto LABEL_8;
  }
  id v4 = [a1 path];
  int v5 = [v4 isEqualToString:@"/url"];

  if (v5)
  {
    int v6 = [a1 query];
    id v3 = [v6 substringFromIndex:objc_msgSend(@"q=", "length")];

    char v7 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = objc_msgSend(v7, "cal_hostAfterGoogleRedirects");
      if (v9)
      {
        id v10 = (id)v9;

        goto LABEL_10;
      }
    }

LABEL_8:
  }
LABEL_9:
  id v10 = v2;
LABEL_10:

  return v10;
}

@end