@interface NSURL(DAKeychainAddition)
- (__CFString)uri;
- (id)URLByRemovingLastPathComponent;
- (id)URLWithUsername:()DAKeychainAddition;
- (id)URLWithUsername:()DAKeychainAddition withPassword:;
- (id)URLWithoutUsername;
@end

@implementation NSURL(DAKeychainAddition)

- (__CFString)uri
{
  v2 = [a1 query];
  v3 = (__CFString *)CFURLCopyPath((CFURLRef)a1);
  v4 = v3;
  if (v3)
  {
    if (v2)
    {
      v5 = NSString;
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

- (id)URLWithoutUsername
{
  v2 = [a1 user];

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = [a1 scheme];
    v5 = [a1 host];
    v6 = [a1 port];
    uint64_t v7 = [v6 intValue];
    v8 = [a1 uri];
    objc_msgSend(v3, "da_URLWithScheme:host:port:uri:", v4, v5, v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (id)URLByRemovingLastPathComponent
{
  v2 = [a1 scheme];
  v3 = [a1 user];
  v4 = [a1 password];
  v5 = [a1 host];
  v6 = [a1 path];
  if ([v6 isEqualToString:@"/"])
  {
    uint64_t v7 = &stru_1F231BAB0;
  }
  else
  {
    uint64_t v7 = [v6 stringByDeletingLastPathComponent];
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "da_URLWithScheme:host:port:uri:", v2, v5, 0, v7);
  id v9 = [v8 URLWithUsername:v3 withPassword:v4];

  return v9;
}

- (id)URLWithUsername:()DAKeychainAddition withPassword:
{
  v6 = a3;
  uint64_t v7 = a4;
  if (v6 && ![(__CFString *)v6 isEqualToString:&stru_1F231BAB0])
  {
    if (v7)
    {
      v11 = [a1 scheme];
      v12 = [v11 stringByAppendingString:@"://"];

      v13 = [a1 URLWithoutUsername];
      v14 = [v13 absoluteString];
      v15 = (void *)[v14 mutableCopy];

      if ([v15 hasPrefix:v12])
      {
        v16 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v6, &stru_1F231BAB0, @"?@/|:", 0x8000100u);
        v17 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v7, &stru_1F231BAB0, @"?@/|:", 0x8000100u);
        v18 = [NSString stringWithFormat:@"%@:%@@", v16, v17];
        objc_msgSend(v15, "insertString:atIndex:", v18, objc_msgSend(v12, "length"));

        objc_msgSend(MEMORY[0x1E4F1CB10], "da_URLWithDirtyString:", v15);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
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

- (id)URLWithUsername:()DAKeychainAddition
{
  v4 = a3;
  v5 = v4;
  if (v4 && ![(__CFString *)v4 isEqualToString:&stru_1F231BAB0])
  {
    uint64_t v7 = [a1 scheme];
    uint64_t v8 = [v7 stringByAppendingString:@"://"];

    id v9 = [a1 absoluteString];
    v10 = (void *)[v9 mutableCopy];

    if ([v10 hasPrefix:v8])
    {
      v11 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v5, &stru_1F231BAB0, @"?@/|:", 0x8000100u);
      v12 = [(__CFString *)v11 stringByAppendingString:@"@"];
      objc_msgSend(v10, "insertString:atIndex:", v12, objc_msgSend(v8, "length"));

      objc_msgSend(MEMORY[0x1E4F1CB10], "da_URLWithDirtyString:", v10);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
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

@end