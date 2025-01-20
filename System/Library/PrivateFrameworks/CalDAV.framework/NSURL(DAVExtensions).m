@interface NSURL(DAVExtensions)
+ (id)URLWithDirtyString:()DAVExtensions;
+ (id)URLWithScheme:()DAVExtensions host:port:uri:;
+ (uint64_t)classicPortForScheme:()DAVExtensions;
- (CFURLRef)initWithDirtyString:()DAVExtensions;
- (__CFString)uri;
- (id)URLWithUsername:()DAVExtensions;
- (id)URLWithoutPassword;
- (id)URLWithoutUsername;
- (id)calDAV_leastInfoStringRepresentationRelativeToParentURL:()DAVExtensions;
- (uint64_t)absoluteURLisEqual:()DAVExtensions;
@end

@implementation NSURL(DAVExtensions)

+ (uint64_t)classicPortForScheme:()DAVExtensions
{
  id v3 = a3;
  if ([v3 isEqualToString:DAVHTTPScheme])
  {
    uint64_t v4 = 80;
  }
  else if ([v3 isEqualToString:DAVHTTPSScheme])
  {
    uint64_t v4 = 443;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)URLWithScheme:()DAVExtensions host:port:uri:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = v11;
  if (a5)
  {
    int v13 = [(id)objc_opt_class() classicPortForScheme:v9];
    if (v12)
    {
      if (v13 != a5)
      {
        v14 = NSURL;
        [NSString stringWithFormat:@"%@://%@:%u%@", v9, v10, a5, v12];
        goto LABEL_10;
      }
      goto LABEL_6;
    }
    if (v13 != a5)
    {
      v14 = NSURL;
      [NSString stringWithFormat:@"%@://%@:%u/", v9, v10, a5, v19];
      goto LABEL_10;
    }
  }
  else if (v11)
  {
LABEL_6:
    v14 = NSURL;
    [NSString stringWithFormat:@"%@://%@%@", v9, v10, v12, v19];
    goto LABEL_10;
  }
  v14 = NSURL;
  [NSString stringWithFormat:@"%@://%@/", v9, v10, v18, v19];
  v15 = LABEL_10:;
  v16 = [v14 URLWithDirtyString:v15];

  return v16;
}

+ (id)URLWithDirtyString:()DAVExtensions
{
  id v3 = (objc_class *)NSURL;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDirtyString:v4];

  return v5;
}

- (CFURLRef)initWithDirtyString:()DAVExtensions
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  v6 = [v4 whitespaceAndNewlineCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];

  v8 = (__CFString *)[v7 mutableCopy];
  [(__CFString *)v8 replaceOccurrencesOfString:@" ", @"%20", 2, 0, [(__CFString *)v8 length] withString options range];
  CFURLRef v9 = CFURLCreateWithString(0, v8, 0);
  if (!v9)
  {
    id v10 = [(__CFString *)v8 stringByXMLUnquoting];
    CFURLRef v9 = CFURLCreateWithString(0, v10, 0);
    if (!v9)
    {
      id v11 = v10;
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

        id v11 = (__CFString *)v24;
      }
      if ([v14 length] || -[__CFString length](v11, "length"))
      {
        if (initWithDirtyString__onceToken != -1) {
          dispatch_once(&initWithDirtyString__onceToken, &__block_literal_global_76);
        }
        v25 = [(__CFString *)v11 stringByAddingPercentEncodingWithAllowedCharacters:initWithDirtyString__allowedCharacterSet];
        if (v25)
        {
          if (v14)
          {
            v26 = [v14 stringByAppendingString:v25];
            CFURLRef v9 = CFURLCreateWithString(0, v26, 0);
          }
          else
          {
            CFURLRef v9 = CFURLCreateWithString(0, v25, 0);
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
  v27 = (void *)[a1 initWithString:&stru_26C4CD4C0];

  return v9;
}

- (__CFString)uri
{
  v2 = [a1 query];
  id v3 = (__CFString *)CFURLCopyPath((CFURLRef)a1);
  id v4 = v3;
  if (v3)
  {
    if (v2)
    {
      id v5 = NSString;
      v6 = [(__CFString *)v3 stringByURLQuoting];
      v7 = [v5 stringWithFormat:@"%@?%@", v6, v2];
    }
    else
    {
      v7 = v3;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)URLWithUsername:()DAVExtensions
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ![v4 isEqualToString:&stru_26C4CD4C0])
  {
    v7 = [a1 scheme];
    v8 = [v7 stringByAppendingString:@"://"];

    CFURLRef v9 = [a1 absoluteString];
    id v10 = (void *)[v9 mutableCopy];

    if ([v10 hasPrefix:v8])
    {
      id v11 = [MEMORY[0x263F08708] URLUserAllowedCharacterSet];
      uint64_t v12 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v11];

      uint64_t v13 = [v12 stringByAppendingString:@"@"];
      objc_msgSend(v10, "insertString:atIndex:", v13, objc_msgSend(v8, "length"));

      id v6 = [NSURL URLWithDirtyString:v10];
    }
    else
    {
      id v6 = a1;
    }
  }
  else
  {
    id v6 = [a1 URLWithoutUsername];
  }

  return v6;
}

- (id)URLWithoutUsername
{
  v2 = [a1 user];

  if (v2)
  {
    id v3 = NSURL;
    id v4 = [a1 scheme];
    id v5 = [a1 host];
    id v6 = [a1 port];
    uint64_t v7 = [v6 intValue];
    v8 = [a1 uri];
    id v9 = [v3 URLWithScheme:v4 host:v5 port:v7 uri:v8];
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (id)URLWithoutPassword
{
  v2 = [a1 user];
  if (v2)
  {
    id v3 = [a1 URLWithoutUsername];
    id v4 = [v3 URLWithUsername:v2];
  }
  else
  {
    id v4 = a1;
  }

  return v4;
}

- (uint64_t)absoluteURLisEqual:()DAVExtensions
{
  id v4 = a3;
  id v5 = [a1 absoluteString];
  id v6 = [v5 appendSlashIfNeeded];
  uint64_t v7 = [v4 absoluteString];

  v8 = [v7 appendSlashIfNeeded];
  uint64_t v9 = [v6 isEqualToString:v8];

  return v9;
}

- (id)calDAV_leastInfoStringRepresentationRelativeToParentURL:()DAVExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 scheme];
  uint64_t v6 = [v4 scheme];
  uint64_t v7 = [a1 host];
  uint64_t v8 = [v4 host];
  uint64_t v9 = [a1 user];
  uint64_t v10 = [v4 user];
  id v11 = [a1 port];
  if (v11)
  {
    uint64_t v12 = [a1 port];
    int v23 = [v12 intValue];
  }
  else
  {
    int v23 = [NSURL classicPortForScheme:v5];
  }

  uint64_t v13 = [v4 port];
  if (v13)
  {
    [v4 port];
    uint64_t v15 = v14 = v5;
    int v22 = [v15 intValue];

    uint64_t v5 = v14;
  }
  else
  {
    int v22 = [NSURL classicPortForScheme:v6];
  }

  v16 = (void *)v7;
  if ((!(v5 | v6) || v6 && [(id)v5 isEqualToString:v6])
    && (!(v7 | v8) || v8 && [(id)v7 isEqualToString:v8]))
  {
    if (v9 | v10)
    {
      if (v10)
      {
        if (![(id)v9 isEqualToString:v10] || v23 != v22)
        {
LABEL_22:
          if ([(id)v9 isEqualToString:v10]) {
            goto LABEL_23;
          }
          goto LABEL_25;
        }
LABEL_19:
        [a1 absoluteURL];
        uint64_t v18 = v17 = v5;
        uint64_t v19 = [v18 CDVRawPath];
LABEL_24:
        unint64_t v20 = (void *)v19;

        uint64_t v5 = v17;
        goto LABEL_26;
      }
    }
    else if (v23 == v22)
    {
      goto LABEL_19;
    }
  }
  if (!(v9 | v10))
  {
LABEL_23:
    [a1 URLWithoutUsername];
    uint64_t v18 = v17 = v5;
    uint64_t v19 = [v18 absoluteString];
    goto LABEL_24;
  }
  if (v10) {
    goto LABEL_22;
  }
LABEL_25:
  unint64_t v20 = [a1 absoluteString];
LABEL_26:

  return v20;
}

@end