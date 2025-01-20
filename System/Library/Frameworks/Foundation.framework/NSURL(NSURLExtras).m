@interface NSURL(NSURLExtras)
+ (id)_web_URLWithComponents:()NSURLExtras;
+ (uint64_t)_web_URLWithString:()NSURLExtras relativeToURL:;
- (double)_web_URLComponents;
- (uint64_t)_web_isJavaScriptURL;
- (uint64_t)_web_scriptIfJavaScriptURL;
- (uint64_t)_web_suggestedFilenameWithMIMEType:()NSURLExtras;
@end

@implementation NSURL(NSURLExtras)

+ (uint64_t)_web_URLWithString:()NSURLExtras relativeToURL:
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "_URLWithDataAsString:relativeToURL:");
}

+ (id)_web_URLWithComponents:()NSURLExtras
{
  if (!*(void *)a3
    && !*(void *)(a3 + 8)
    && !*(void *)(a3 + 16)
    && !*(void *)(a3 + 24)
    && *(void *)(a3 + 32) == -1
    && !*(void *)(a3 + 40)
    && !*(void *)(a3 + 48)
    && !*(void *)(a3 + 56))
  {
    return 0;
  }
  if ([*(id *)(a3 + 40) length])
  {
    int v4 = [*(id *)(a3 + 40) characterAtIndex:0];
    id result = 0;
    if (v4 != 47) {
      return result;
    }
    if ([*(id *)(a3 + 40) length] != 1) {
      [*(id *)(a3 + 40) componentsSeparatedByString:@"/"];
    }
  }
  else
  {
    [MEMORY[0x1E4F1C978] arrayWithObject:&stru_1ECA5C228];
  }
  return (id)_CFURLCreateFromComponents();
}

- (double)_web_URLComponents
{
  double v1 = MEMORY[0x1F4188790](a1);
  v3 = v2;
  uint64_t v5 = objc_msgSend(v4, "absoluteURL", v1);
  if (!v5) {
    goto LABEL_12;
  }
  v6 = (void *)v5;
  if (_CFURLCopyComponents())
  {
    id v7 = 0;
    id v8 = 0;
    id v14 = 0;
    id v15 = 0;
    void *v3 = v7;
    v3[1] = 0;
    v3[2] = 0;
    v3[3] = v8;
    v3[4] = 0;
    v3[5] = 0;
    v3[6] = v14;
    v3[7] = v15;
    return result;
  }
  if ((v9 = (void *)[v6 scheme], (objc_msgSend(v9, "isEqualToString:", @"http"))
     || ([v9 isEqualToString:@"https"] & 1) != 0
     || ([v9 isEqualToString:@"file"] & 1) != 0
     || [v9 isEqualToString:@"ftp"])
    && ((v10 = (void *)[v6 absoluteString],
         uint64_t v11 = [v9 length],
         uint64_t v12 = [v10 length],
         v12 > v11)
     && [v10 characterAtIndex:v11] != 47
     || v12 >= v11 + 2 && (++v11, [v10 characterAtIndex:v11] != 47)))
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithString:relativeToURL:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@://%@", v9, objc_msgSend((id)objc_msgSend(v6, "absoluteString"), "substringFromIndex:", v11), 0), 0);
    if (v13)
    {
      objc_msgSend(v13, "_web_URLComponents");
    }
    else
    {
      double result = 0.0;
      *((_OWORD *)v3 + 2) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *(_OWORD *)v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
    }
  }
  else
  {
LABEL_12:
    double result = 0.0;
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    v3[4] = -1;
    v3[5] = 0;
    v3[6] = 0;
    v3[7] = 0;
  }
  return result;
}

- (uint64_t)_web_scriptIfJavaScriptURL
{
  double v1 = (void *)[a1 absoluteString];
  if (!objc_msgSend(v1, "_web_hasCaseInsensitivePrefix:", @"javascript:")) {
    return 0;
  }
  v2 = (void *)[v1 substringFromIndex:11];

  return objc_msgSend(v2, "_web_stringByReplacingValidPercentEscapes_nowarn");
}

- (uint64_t)_web_suggestedFilenameWithMIMEType:()NSURLExtras
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "path"), "lastPathComponent");
  v6 = objc_msgSend(v5, "_web_filenameByFixingIllegalCharacters");
  if ([v6 length] && !objc_msgSend(v5, "isEqualToString:", @"/"))
  {
    id v7 = (void *)[v6 pathExtension];
    if (!a3) {
      return (uint64_t)v6;
    }
  }
  else
  {
    v6 = objc_msgSend((id)objc_msgSend(a1, "_hostString"), "_web_filenameByFixingIllegalCharacters");
    if (![v6 length]) {
      v6 = NSURLLocalizedString("unknown");
    }
    id v7 = 0;
    if (!a3) {
      return (uint64_t)v6;
    }
  }
  if ((([a3 isEqualToString:@"application/tar"] & 1) != 0
     || [a3 isEqualToString:@"application/x-tar"])
    && ([v6 rangeOfString:@".tar" options:1] != 0x7FFFFFFFFFFFFFFFLL
     || [v6 rangeOfString:@".tgz" options:13] != 0x7FFFFFFFFFFFFFFFLL))
  {
    return (uint64_t)v6;
  }
  if ([a3 isEqualToString:@"application/octet-stream"]) {
    return (uint64_t)v6;
  }
  if ([a3 isEqualToString:@"text/plain"]) {
    return (uint64_t)v6;
  }
  id v9 = +[NSURLFileTypeMappings sharedMappings];
  v10 = (void *)[v9 extensionsForMIMEType:a3];
  if ([v7 length])
  {
    if (!v10 || ([v10 containsObject:v7] & 1) != 0) {
      return (uint64_t)v6;
    }
  }
  uint64_t v11 = (void *)[v9 preferredExtensionForMIMEType:a3];
  if (![v11 length]) {
    return (uint64_t)v6;
  }

  return [v6 stringByAppendingPathExtension:v11];
}

- (uint64_t)_web_isJavaScriptURL
{
  double v1 = (void *)[a1 absoluteString];

  return objc_msgSend(v1, "_web_isJavaScriptURL");
}

@end