@interface NSURL(DAExtensions)
+ (CFURLRef)da_URLWithDirtyString:()DAExtensions;
+ (id)da_URLWithScheme:()DAExtensions host:user:port:uri:;
+ (uint64_t)da_URLWithScheme:()DAExtensions host:port:uri:;
+ (uint64_t)da_classicPortForScheme:()DAExtensions;
- (__CFString)da_rawPath;
- (id)da_pathWithoutTrailingRemovingSlash;
- (id)da_urlByRemovingUsername;
- (id)da_urlBySettingHost:()DAExtensions keepUsername:;
- (id)da_urlBySettingPath:()DAExtensions keepUsername:;
- (id)da_urlBySettingPort:()DAExtensions keepUsername:;
- (id)da_urlBySettingScheme:()DAExtensions keepUsername:;
- (id)da_urlBySettingUsername:()DAExtensions;
- (id)da_urlForLogging;
- (uint64_t)da_isEqualToDAVURL:()DAExtensions;
- (uint64_t)da_urlBySettingHost:()DAExtensions;
- (uint64_t)da_urlBySettingPath:()DAExtensions;
- (uint64_t)da_urlBySettingPort:()DAExtensions;
- (uint64_t)da_urlBySettingScheme:()DAExtensions;
@end

@implementation NSURL(DAExtensions)

- (uint64_t)da_isEqualToDAVURL:()DAExtensions
{
  id v5 = a3;
  v6 = [a1 absoluteString];
  v7 = [v5 absoluteString];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v10 = [a1 host];
    v11 = [v5 host];
    if (v10 != v11)
    {
      uint64_t v12 = [a1 host];
      if (!v12) {
        goto LABEL_47;
      }
      v13 = (void *)v12;
      v14 = [a1 host];
      v15 = [v5 host];
      if ([v14 caseInsensitiveCompare:v15])
      {

        goto LABEL_47;
      }
      v44 = v15;
      v45 = v14;
      v46 = v13;
    }
    v16 = [a1 scheme];
    v17 = [v5 scheme];
    if (v16 != v17)
    {
      uint64_t v18 = [a1 scheme];
      if (!v18) {
        goto LABEL_22;
      }
      v19 = [a1 scheme];
      v3 = [v5 scheme];
      if ([v19 caseInsensitiveCompare:v3])
      {
        char v20 = 0;
        goto LABEL_18;
      }
      v40 = v19;
      v41 = (void *)v18;
    }
    v21 = [a1 user];
    uint64_t v22 = [v5 user];
    if (v21 != (void *)v22)
    {
      v23 = (void *)v22;
      v42 = v3;
      v24 = [a1 user];
      v25 = [v5 user];
      char v43 = [v24 isEqualToString:v25];

      if (v16 != v17)
      {
        v19 = v40;
        uint64_t v18 = (uint64_t)v41;
        char v20 = v43;
        v3 = v42;
LABEL_18:

        if (v10 == v11)
        {
        }
        else
        {
        }
        if ((v20 & 1) == 0)
        {
LABEL_39:
          uint64_t v9 = 0;
          goto LABEL_49;
        }
        goto LABEL_36;
      }

      if (v10 == v11)
      {
      }
      else
      {
      }
      if ((v43 & 1) == 0) {
        goto LABEL_39;
      }
LABEL_36:
      v10 = [a1 relativePath];
      v11 = [v5 relativePath];
      v26 = objc_msgSend(v10, "da_appendSlashIfNeeded");
      v27 = objc_msgSend(v11, "da_appendSlashIfNeeded");
      int v28 = [v26 isEqualToString:v27];

      if (v28)
      {
        v29 = [a1 port];
        int v30 = [v29 intValue];

        v31 = [v5 port];
        int v32 = [v31 intValue];

        if (v30 == v32)
        {
          uint64_t v9 = 1;
LABEL_48:

          goto LABEL_49;
        }
        v33 = [a1 scheme];
        char v34 = [v33 isEqualToString:@"http"];

        if (v34)
        {
          int v35 = 80;
        }
        else
        {
          v36 = [a1 scheme];
          int v37 = [v36 isEqualToString:@"https"];

          if (v37) {
            int v35 = 443;
          }
          else {
            int v35 = -1;
          }
        }
        if (!v30 || v30 == v35)
        {
          if (v32) {
            BOOL v39 = v32 == v35;
          }
          else {
            BOOL v39 = 1;
          }
          uint64_t v9 = v39;
          goto LABEL_48;
        }
      }
LABEL_47:
      uint64_t v9 = 0;
      goto LABEL_48;
    }

    if (v16 == v17)
    {

      if (v10 != v11)
      {
      }
      goto LABEL_36;
    }

    LOBYTE(v18) = 1;
LABEL_22:

    if (v10 != v11)
    {
    }
    if ((v18 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_36;
  }
  uint64_t v9 = 1;
LABEL_49:

  return v9;
}

- (id)da_urlBySettingScheme:()DAExtensions keepUsername:
{
  id v26 = a3;
  v6 = [a1 host];
  if (a4 && ([a1 user], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    char v8 = [a1 user];
    uint64_t v9 = [v8 stringByAppendingFormat:@"@%@", v6];

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v24 = NSString;
  v11 = [a1 port];
  uint64_t v12 = &stru_1F231BAB0;
  if (v11)
  {
    v13 = NSString;
    v23 = [a1 port];
    v14 = [v13 stringWithFormat:@":%@", v23];
  }
  else
  {
    v14 = &stru_1F231BAB0;
  }
  v15 = objc_msgSend(a1, "da_rawPath");
  v16 = [a1 query];
  if ([v16 length]) {
    v17 = @"?";
  }
  else {
    v17 = &stru_1F231BAB0;
  }
  uint64_t v18 = [a1 query];
  uint64_t v19 = [v18 length];
  if (v19)
  {
    uint64_t v12 = [a1 query];
  }
  char v20 = [v24 stringWithFormat:@"%@://%@%@%@%@%@", v26, v25, v14, v15, v17, v12];
  v21 = [v10 URLWithString:v20];

  if (v19) {
  if (v11)
  }
  {
  }
  return v21;
}

- (id)da_urlBySettingHost:()DAExtensions keepUsername:
{
  id v6 = a3;
  if (a4 && ([a1 user], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    char v8 = [a1 user];
    uint64_t v9 = [v8 stringByAppendingFormat:@"@%@", v6];

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v24 = NSString;
  id v26 = [a1 scheme];
  v11 = [a1 port];
  uint64_t v12 = &stru_1F231BAB0;
  if (v11)
  {
    v13 = NSString;
    v23 = [a1 port];
    v14 = [v13 stringWithFormat:@":%@", v23];
  }
  else
  {
    v14 = &stru_1F231BAB0;
  }
  v15 = objc_msgSend(a1, "da_rawPath");
  v16 = [a1 query];
  if ([v16 length]) {
    v17 = @"?";
  }
  else {
    v17 = &stru_1F231BAB0;
  }
  uint64_t v18 = [a1 query];
  uint64_t v19 = [v18 length];
  if (v19)
  {
    uint64_t v12 = [a1 query];
  }
  char v20 = [v24 stringWithFormat:@"%@://%@%@%@%@%@", v26, v25, v14, v15, v17, v12];
  v21 = [v10 URLWithString:v20];

  if (v19) {
  if (v11)
  }
  {
  }
  return v21;
}

- (id)da_urlBySettingPort:()DAExtensions keepUsername:
{
  id v6 = a3;
  v23 = [a1 host];
  if (a4)
  {
    v7 = [a1 user];

    if (v7)
    {
      char v8 = [a1 user];
      uint64_t v9 = [v8 stringByAppendingFormat:@"@%@", v23];

      v23 = (void *)v9;
    }
  }
  if (![v6 intValue])
  {

    id v6 = 0;
  }
  v21 = NSString;
  uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [a1 scheme];
  v11 = &stru_1F231BAB0;
  if (v6)
  {
    uint64_t v12 = [NSString stringWithFormat:@":%@", v6];
  }
  else
  {
    uint64_t v12 = &stru_1F231BAB0;
  }
  v13 = objc_msgSend(a1, "da_rawPath");
  v14 = [a1 query];
  if ([v14 length]) {
    v15 = @"?";
  }
  else {
    v15 = &stru_1F231BAB0;
  }
  v16 = [a1 query];
  uint64_t v17 = [v16 length];
  if (v17)
  {
    v11 = [a1 query];
  }
  uint64_t v18 = [v21 stringWithFormat:@"%@://%@%@%@%@%@", v10, v23, v12, v13, v15, v11];
  uint64_t v19 = [v22 URLWithString:v18];

  if (v17) {
  if (v6)
  }

  return v19;
}

- (id)da_urlBySettingPath:()DAExtensions keepUsername:
{
  id v26 = a3;
  id v6 = [a1 host];
  if (a4 && ([a1 user], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    char v8 = [a1 user];
    uint64_t v9 = [v8 stringByAppendingFormat:@"@%@", v6];

    v25 = (void *)v9;
  }
  else
  {
    v25 = v6;
  }
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v24 = NSString;
  v11 = [a1 scheme];
  uint64_t v12 = [a1 port];
  v13 = &stru_1F231BAB0;
  if (v12)
  {
    v14 = NSString;
    v23 = [a1 port];
    v15 = [v14 stringWithFormat:@":%@", v23];
  }
  else
  {
    v15 = &stru_1F231BAB0;
  }
  v16 = [a1 query];
  if ([v16 length]) {
    uint64_t v17 = @"?";
  }
  else {
    uint64_t v17 = &stru_1F231BAB0;
  }
  uint64_t v18 = [a1 query];
  uint64_t v19 = [v18 length];
  if (v19)
  {
    v13 = [a1 query];
  }
  char v20 = [v24 stringWithFormat:@"%@://%@%@%@%@%@", v11, v25, v15, v26, v17, v13];
  v21 = [v10 URLWithString:v20];

  if (v19) {
  if (v12)
  }
  {
  }
  return v21;
}

- (id)da_urlBySettingUsername:()DAExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 host];
  id v6 = (void *)v5;
  v23 = v4;
  if (v4)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@"@%@", v5];

    id v6 = (void *)v7;
  }
  v21 = NSString;
  uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
  v24 = [a1 scheme];
  char v8 = [a1 port];
  uint64_t v9 = &stru_1F231BAB0;
  if (v8)
  {
    v10 = NSString;
    char v20 = [a1 port];
    v11 = [v10 stringWithFormat:@":%@", v20];
  }
  else
  {
    v11 = &stru_1F231BAB0;
  }
  uint64_t v12 = objc_msgSend(a1, "da_rawPath");
  v13 = [a1 query];
  if ([v13 length]) {
    v14 = @"?";
  }
  else {
    v14 = &stru_1F231BAB0;
  }
  v15 = [a1 query];
  uint64_t v16 = [v15 length];
  if (v16)
  {
    uint64_t v9 = [a1 query];
  }
  uint64_t v17 = [v21 stringWithFormat:@"%@://%@%@%@%@%@", v24, v6, v11, v12, v14, v9];
  uint64_t v18 = [v22 URLWithString:v17];

  if (v16) {
  if (v8)
  }
  {
  }
  return v18;
}

- (id)da_urlByRemovingUsername
{
  uint64_t v16 = NSString;
  uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v18 = [a1 scheme];
  v2 = [a1 host];
  v3 = [a1 port];
  id v4 = &stru_1F231BAB0;
  if (v3)
  {
    uint64_t v5 = NSString;
    v15 = [a1 port];
    id v6 = [v5 stringWithFormat:@":%@", v15];
  }
  else
  {
    id v6 = &stru_1F231BAB0;
  }
  uint64_t v7 = objc_msgSend(a1, "da_rawPath");
  char v8 = [a1 query];
  if ([v8 length]) {
    uint64_t v9 = @"?";
  }
  else {
    uint64_t v9 = &stru_1F231BAB0;
  }
  v10 = [a1 query];
  uint64_t v11 = [v10 length];
  if (v11)
  {
    id v4 = [a1 query];
  }
  uint64_t v12 = [v16 stringWithFormat:@"%@://%@%@%@%@%@", v18, v2, v6, v7, v9, v4];
  v13 = [v17 URLWithString:v12];

  if (v11) {
  if (v3)
  }
  {
  }
  return v13;
}

- (id)da_urlForLogging
{
  v2 = DALoggingwithCategory();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    id v4 = a1;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = NSString;
    uint64_t v7 = [a1 scheme];
    char v8 = [a1 host];
    uint64_t v9 = [v6 stringWithFormat:@"%@://%@", v7, v8];
    id v4 = [v5 URLWithString:v9];
  }
  return v4;
}

- (uint64_t)da_urlBySettingScheme:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingScheme:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingHost:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingHost:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingPort:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingPort:keepUsername:", a3, 0);
}

- (uint64_t)da_urlBySettingPath:()DAExtensions
{
  return objc_msgSend(a1, "da_urlBySettingPath:keepUsername:", a3, 0);
}

- (__CFString)da_rawPath
{
  v1 = (__CFString *)CFURLCopyPath(a1);
  return v1;
}

- (id)da_pathWithoutTrailingRemovingSlash
{
  v2 = [a1 path];
  if (([v2 hasSuffix:@"/"] & 1) == 0)
  {
    BOOL v3 = [a1 absoluteString];
    int v4 = [v3 hasSuffix:@"/"];

    if (v4)
    {
      uint64_t v5 = [v2 stringByAppendingString:@"/"];

      v2 = (void *)v5;
    }
  }
  return v2;
}

+ (CFURLRef)da_URLWithDirtyString:()DAExtensions
{
  BOOL v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  uint64_t v7 = (__CFString *)[v6 mutableCopy];
  [(__CFString *)v7 replaceOccurrencesOfString:@" ", @"%20", 2, 0, [(__CFString *)v7 length] withString options range];
  CFURLRef v8 = CFURLCreateWithString(0, v7, 0);

  return v8;
}

+ (id)da_URLWithScheme:()DAExtensions host:user:port:uri:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6)
  {
    BOOL v15 = objc_msgSend((id)objc_opt_class(), "da_classicPortForScheme:", v11) == a6;
    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v15 = 1;
  if (v13)
  {
LABEL_3:
    uint64_t v16 = [v13 stringByAppendingFormat:@"@%@", v12];

    id v12 = (id)v16;
  }
LABEL_4:
  uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
  if (v14)
  {
    if (v15) {
      [NSString stringWithFormat:@"%@://%@%@", v11, v12, v14, v22];
    }
    else {
      [NSString stringWithFormat:@"%@://%@:%u%@", v11, v12, a6, v14];
    }
  }
  else if (v15)
  {
    [NSString stringWithFormat:@"%@://%@/", v11, v12, v21, v22];
  }
  else
  {
    [NSString stringWithFormat:@"%@://%@:%u/", v11, v12, a6, v22];
  uint64_t v18 = };
  uint64_t v19 = objc_msgSend(v17, "da_URLWithDirtyString:", v18);

  return v19;
}

+ (uint64_t)da_URLWithScheme:()DAExtensions host:port:uri:
{
  return objc_msgSend(a1, "da_URLWithScheme:host:user:port:uri:", a3, a4, 0, a5, a6);
}

+ (uint64_t)da_classicPortForScheme:()DAExtensions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"http"])
  {
    uint64_t v4 = 80;
  }
  else if ([v3 isEqualToString:@"https"])
  {
    uint64_t v4 = 443;
  }
  else if ([v3 isEqualToString:@"ftp"])
  {
    uint64_t v4 = 21;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end