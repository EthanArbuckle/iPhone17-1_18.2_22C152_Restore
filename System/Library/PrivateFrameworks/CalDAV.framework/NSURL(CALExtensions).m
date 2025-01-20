@interface NSURL(CALExtensions)
+ (id)davCompatibleFilenameForFilename:()CALExtensions;
+ (id)iDiskSmallNameCompatibleNameForFilename:()CALExtensions;
- (__CFString)pathWithoutDecodingAndRemovingTrailingSlash;
- (id)URLWithUsername:()CALExtensions withPassword:;
- (id)initWithScheme:()CALExtensions host:port:path:;
- (id)pathWithoutTrailingRemovingSlash;
- (id)queryParameters;
- (id)serverURL;
- (id)unquotedPassword;
@end

@implementation NSURL(CALExtensions)

- (id)queryParameters
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v1 = [a1 query];
  v2 = [v1 componentsSeparatedByString:@"&"];

  v3 = [MEMORY[0x263EFF9A0] dictionary];
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
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "length", (void)v15))
        {
          v10 = [v9 componentsSeparatedByString:@"="];
          if ([v10 count] == 2)
          {
            v11 = [v10 objectAtIndex:0];
            v12 = [v10 objectAtIndex:1];
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

- (id)URLWithUsername:()CALExtensions withPassword:
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToString:&stru_26C4CD4C0])
  {
    if (v7)
    {
      v11 = [a1 scheme];
      v12 = [v11 stringByAppendingString:@"://"];

      BOOL v13 = [a1 URLWithoutUsername];
      v14 = [v13 absoluteString];
      long long v15 = (void *)[v14 mutableCopy];

      if ([v15 hasPrefix:v12])
      {
        long long v16 = [MEMORY[0x263F08708] URLUserAllowedCharacterSet];
        long long v17 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v16];

        long long v18 = [MEMORY[0x263F08708] URLPasswordAllowedCharacterSet];
        v19 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v18];

        uint64_t v20 = [NSString stringWithFormat:@"%@:%@@", v17, v19];
        objc_msgSend(v15, "insertString:atIndex:", v20, objc_msgSend(v12, "length"));

        id v9 = [NSURL URLWithDirtyString:v15];
      }
      else
      {
        id v9 = a1;
      }

      goto LABEL_5;
    }
    uint64_t v8 = [a1 URLWithUsername:v6];
  }
  else
  {
    uint64_t v8 = [a1 URLWithoutUsername];
  }
  id v9 = (id)v8;
LABEL_5:

  return v9;
}

+ (id)davCompatibleFilenameForFilename:()CALExtensions
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  id v5 = v3;
  id v6 = (unsigned char *)[v5 UTF8String];
  uint64_t v7 = *v6;
  if (*v6)
  {
    uint64_t v8 = v6 + 1;
    do
    {
      if ((v7 - 48) < 0xA)
      {
        id v9 = @"%c";
      }
      else
      {
        id v9 = @"%c";
        if ((v7 & 0xDF) - 65 >= 0x1A)
        {
          if ((v7 - 33) > 0x3E
            || (id v9 = @"%c", ((1 << (v7 - 33)) & 0x40000000000033C1) == 0))
          {
            if (v7 == 126) {
              id v9 = @"%c";
            }
            else {
              id v9 = @"%02X";
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

+ (id)iDiskSmallNameCompatibleNameForFilename:()CALExtensions
{
  id v4 = a3;
  id v5 = [v4 pathExtension];
  id v6 = [v4 stringByDeletingPathExtension];
  uint64_t v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = [a1 davCompatibleFilenameForFilename:v7];
  if ((unint64_t)[v8 length] < 0x1F)
  {
    unsigned int v10 = v8;
  }
  else
  {
    do
    {
      objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 1, 1);
      id v9 = [v7 stringByAppendingPathExtension:v5];
      unsigned int v10 = [a1 davCompatibleFilenameForFilename:v9];

      uint64_t v8 = v10;
    }
    while ((unint64_t)[v10 length] > 0x1E);
  }
  v11 = [v7 stringByAppendingPathExtension:v5];

  return v11;
}

- (id)initWithScheme:()CALExtensions host:port:path:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  if (([v11 isAbsolutePath] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"path %@ is not absolute.", v11 format];
  }
  BOOL v13 = [v10 stringByAddingPercentEscapes];
  v14 = [v12 stringByAddingPercentEscapes];

  uint64_t v15 = [v11 standardizedURLPath];
  long long v16 = (void *)v15;
  id v17 = 0;
  if (v13 && v14 && v15)
  {
    id v18 = [NSString alloc];
    if (a5) {
      uint64_t v19 = [v18 initWithFormat:@"%@://%@:%i%@", v13, v14, a5, v16];
    }
    else {
      uint64_t v19 = [v18 initWithFormat:@"%@://%@%@", v13, v14, v16, v22];
    }
    uint64_t v20 = (void *)v19;
    a1 = (id)[a1 initWithString:v19];

    id v17 = a1;
  }

  return v17;
}

- (id)unquotedPassword
{
  v1 = [a1 password];
  v2 = [v1 stringByRemovingPercentEncoding];

  return v2;
}

- (id)serverURL
{
  v2 = [a1 port];

  id v3 = NSURL;
  id v4 = NSString;
  id v5 = [a1 scheme];
  uint64_t v6 = [a1 host];
  uint64_t v7 = (void *)v6;
  if (v2)
  {
    uint64_t v8 = [a1 port];
    id v9 = [v4 stringWithFormat:@"%@://%@:%@/", v5, v7, v8];
    id v10 = [v3 URLWithString:v9];
  }
  else
  {
    uint64_t v8 = [v4 stringWithFormat:@"%@://%@/", v5, v6];
    id v10 = [v3 URLWithString:v8];
  }

  return v10;
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

- (__CFString)pathWithoutDecodingAndRemovingTrailingSlash
{
  v1 = (__CFString *)CFURLCopyPath(a1);
  return v1;
}

@end