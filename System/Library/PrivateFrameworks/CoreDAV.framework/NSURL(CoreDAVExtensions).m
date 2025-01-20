@interface NSURL(CoreDAVExtensions)
+ (id)CDVDefaultPortForScheme:()CoreDAVExtensions;
+ (id)CDVURLWithScheme:()CoreDAVExtensions host:port:path:;
+ (id)CDVURLWithScheme:()CoreDAVExtensions user:password:host:port:path:;
- (__CFString)CDVRawPath;
- (id)CDVFileSystemSafePath;
- (id)CDVPassword;
- (id)CDVRawLastPathComponent;
- (id)CDVRawLastPathComponentPreservingEscapes;
- (id)CDVServerURL;
- (id)CDVServerURLWithPath:()CoreDAVExtensions;
- (id)CDVURLByDeletingLastPathComponent;
- (id)CDVURLWithPassword:()CoreDAVExtensions;
- (id)CDVURLWithPath:()CoreDAVExtensions;
- (id)CDVURLWithScheme:()CoreDAVExtensions userandpass:host:port:path:parameters:encodePercents:;
- (id)CDVURLWithUser:()CoreDAVExtensions;
- (id)CDVfixedURLByAppendingPathComponent:()CoreDAVExtensions;
- (uint64_t)CDVIsEqualToURL:()CoreDAVExtensions;
- (uint64_t)CDVIsSafeRedirectForRequestURL:()CoreDAVExtensions;
- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:parameterString:query:fragment:;
- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:query:fragment:;
@end

@implementation NSURL(CoreDAVExtensions)

+ (id)CDVURLWithScheme:()CoreDAVExtensions user:password:host:port:path:
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCDVScheme:v18 user:v17 password:v16 host:v15 port:v14 path:v13 query:0 fragment:0];

  return v19;
}

+ (id)CDVURLWithScheme:()CoreDAVExtensions host:port:path:
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCDVScheme:v12 user:0 password:0 host:v11 port:v10 path:v9 query:0 fragment:0];

  return v13;
}

- (id)CDVURLWithScheme:()CoreDAVExtensions userandpass:host:port:path:parameters:encodePercents:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v15];
  [v21 appendString:@"://"];
  [v21 appendString:v16];
  if (a9)
  {
    uint64_t v22 = [v17 CDVStringByAddingPercentEscapesForHREF];

    id v17 = (id)v22;
  }
  [v21 appendString:v17];
  if (v18) {
    [v21 appendString:v18];
  }
  if (v19)
  {
    if (a9) {
      [v19 CDVStringByAddingPercentEscapesForHREFIncludingPercent];
    }
    else {
    v23 = [v19 CDVStringByAddingPercentEscapesForHREF];
    }
    [v21 appendString:v23];
  }
  [v21 appendString:v20];
  v24 = [NSURL URLWithString:v21];
  v25 = v24;
  if (v24 || (a9 & 1) != 0)
  {
    id v26 = v24;
  }
  else
  {
    LOBYTE(v29) = 1;
    id v26 = [a1 CDVURLWithScheme:v15 userandpass:v16 host:v17 port:v18 path:v19 parameters:v20 encodePercents:v29];
  }
  v27 = v26;

  return v27;
}

- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:parameterString:query:fragment:
{
  return objc_msgSend(a1, "initWithCDVScheme:user:password:host:port:path:query:fragment:");
}

- (uint64_t)initWithCDVScheme:()CoreDAVExtensions user:password:host:port:path:query:fragment:
{
  id v16 = a3;
  id v48 = a4;
  id v17 = a5;
  id v18 = v16;
  id v47 = v17;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v46 = a9;
  id v22 = a10;
  if (!v18 || (id v23 = v22, ![v18 length]))
  {
    v38 = (void *)MEMORY[0x263EFF940];
    uint64_t v39 = *MEMORY[0x263EFF4A0];
    v40 = @"The value for 'scheme' should be non-nil and non-empty";
    goto LABEL_26;
  }
  v45 = v23;
  if (!v19 || ![v19 length])
  {
    v38 = (void *)MEMORY[0x263EFF940];
    uint64_t v39 = *MEMORY[0x263EFF4A0];
    v40 = @"The value for 'host' should be non-nil and non-empty";
LABEL_26:
    id v41 = [v38 exceptionWithName:v39 reason:v40 userInfo:0];
    objc_exception_throw(v41);
  }
  v43 = v18;
  v44 = v21;
  if (v20)
  {
    v24 = (void *)[objc_alloc(NSNumber) initWithInteger:0];
    if ([v20 compare:v24] == -1)
    {
      v25 = a1;
      v28 = 0;
    }
    else
    {
      v25 = a1;
      id v26 = [(id)objc_opt_class() CDVDefaultPortForScheme:v18];
      if (v26 && (uint64_t v27 = [v20 unsignedLongValue], v27 == objc_msgSend(v26, "unsignedLongValue"))) {
        v28 = 0;
      }
      else {
        v28 = objc_msgSend([NSString alloc], "initWithFormat:", @":%lu", objc_msgSend(v20, "unsignedLongValue"));
      }
    }
  }
  else
  {
    v25 = a1;
    v28 = 0;
  }
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26C4B7900];
  if (v48)
  {
    v30 = [v48 CDVStringByAddingPercentEscapesForUserOrPassword];
    [v29 appendString:v30];

    if (v47)
    {
      [v29 appendString:@":"];
      v31 = [v47 CDVStringByAddingPercentEscapesForUserOrPassword];
      [v29 appendString:v31];
    }
    [v29 appendString:@"@"];
  }
  v32 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:&stru_26C4B7900];
  v33 = v32;
  if (v46)
  {
    [v32 appendString:@"?"];
    [v33 appendString:v46];
  }
  if (v45)
  {
    [v33 appendString:@"#"];
    [v33 appendString:v45];
  }
  LOBYTE(v42) = 0;
  v34 = [v25 CDVURLWithScheme:v43 userandpass:v29 host:v19 port:v28 path:v21 parameters:v33 encodePercents:v42];
  v35 = [v34 absoluteString];
  uint64_t v36 = [v25 initWithString:v35];

  return v36;
}

+ (id)CDVDefaultPortForScheme:()CoreDAVExtensions
{
  id v3 = a3;
  if ([v3 isEqualToString:@"http"])
  {
    uint64_t v4 = 80;
LABEL_7:
    v5 = [NSNumber numberWithInt:v4];
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"https"])
  {
    uint64_t v4 = 443;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"ftp"])
  {
    uint64_t v4 = 21;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)CDVURLWithUser:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [a1 scheme];
  v7 = [a1 CDVPassword];
  v8 = [a1 host];
  id v9 = [a1 port];
  id v10 = [a1 CDVRawPath];
  id v11 = [a1 query];
  id v12 = [a1 fragment];
  id v13 = (void *)[v5 initWithCDVScheme:v6 user:v4 password:v7 host:v8 port:v9 path:v10 query:v11 fragment:v12];

  return v13;
}

- (id)CDVURLWithPassword:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [a1 scheme];
  v7 = [a1 user];
  v8 = [a1 host];
  id v9 = [a1 port];
  id v10 = [a1 CDVRawPath];
  id v11 = [a1 query];
  id v12 = [a1 fragment];
  id v13 = (void *)[v5 initWithCDVScheme:v6 user:v7 password:v4 host:v8 port:v9 path:v10 query:v11 fragment:v12];

  return v13;
}

- (id)CDVURLWithPath:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [a1 scheme];
  v7 = [a1 user];
  v8 = [a1 CDVPassword];
  id v9 = [a1 host];
  id v10 = [a1 port];
  id v11 = [a1 query];
  id v12 = [a1 fragment];
  id v13 = (void *)[v5 initWithCDVScheme:v6 user:v7 password:v8 host:v9 port:v10 path:v4 query:v11 fragment:v12];

  return v13;
}

- (id)CDVPassword
{
  v1 = [a1 password];
  v2 = [v1 stringByRemovingPercentEncoding];

  return v2;
}

- (__CFString)CDVRawPath
{
  v1 = (__CFString *)CFURLCopyPath(a1);
  return v1;
}

- (id)CDVRawLastPathComponent
{
  v2 = [a1 CDVRawPath];
  int v3 = [v2 hasSuffix:@"/"];
  id v4 = [a1 lastPathComponent];
  id v5 = v4;
  if (v3 && ([v4 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@/", v5];

    id v5 = (void *)v6;
  }

  return v5;
}

- (id)CDVRawLastPathComponentPreservingEscapes
{
  v1 = [a1 CDVRawPath];
  v2 = [v1 lastPathComponent];

  return v2;
}

- (id)CDVURLByDeletingLastPathComponent
{
  v2 = [a1 URLByDeletingLastPathComponent];
  int v3 = [v2 absoluteString];
  unint64_t v4 = [v3 length];
  id v5 = [a1 absoluteString];
  unint64_t v6 = [v5 length];

  if (v4 > v6)
  {
    id v7 = a1;

    v2 = v7;
  }
  return v2;
}

- (id)CDVServerURL
{
  uint64_t v2 = [a1 scheme];
  if (v2
    && (int v3 = (void *)v2,
        [a1 host],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = [a1 port];

    unint64_t v6 = NSURL;
    id v7 = NSString;
    v8 = [a1 scheme];
    uint64_t v9 = [a1 host];
    id v10 = (void *)v9;
    if (v5)
    {
      id v11 = [a1 port];
      id v12 = [v7 stringWithFormat:@"%@://%@:%@/", v8, v10, v11];
      id v13 = [v6 URLWithString:v12];
    }
    else
    {
      id v11 = [v7 stringWithFormat:@"%@://%@/", v8, v9];
      id v13 = [v6 URLWithString:v11];
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)CDVServerURLWithPath:()CoreDAVExtensions
{
  id v5 = [a1 host];
  unint64_t v6 = [a1 scheme];
  if (a3)
  {
    id v7 = [a1 CDVRawPath];
  }
  else
  {
    id v7 = &stru_26C4B7900;
  }
  v8 = [a1 port];
  uint64_t v9 = 0;
  if (v5 && v6)
  {
    if (v8) {
      [NSString stringWithFormat:@"%@://%@:%@%@", v6, v5, v8, v7];
    }
    else {
    id v10 = [NSString stringWithFormat:@"%@://%@%@", v6, v5, v7, v12];
    }
    uint64_t v9 = [NSURL URLWithString:v10];
  }
  return v9;
}

- (uint64_t)CDVIsEqualToURL:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = [a1 absoluteString];
  unint64_t v6 = [v4 absoluteString];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = 1;
  }
  else if ([a1 isFileURL] && objc_msgSend(v4, "isFileURL"))
  {
    v8 = [a1 path];
    uint64_t v9 = [v4 path];
    uint64_t v7 = [v8 isEqualToString:v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)CDVFileSystemSafePath
{
  v1 = [a1 absoluteString];
  uint64_t v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @":", @"_", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"@", @"_", 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)CDVfixedURLByAppendingPathComponent:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = [a1 absoluteString];
  unint64_t v6 = [v5 CDVStringByAppendingSlashIfNeeded];

  uint64_t v7 = [v6 stringByAppendingString:v4];

  v8 = [NSURL URLWithString:v7];

  return v8;
}

- (uint64_t)CDVIsSafeRedirectForRequestURL:()CoreDAVExtensions
{
  id v4 = a3;
  id v5 = [v4 scheme];

  if (v5)
  {
    unint64_t v6 = [a1 scheme];
    uint64_t v7 = [v4 scheme];
    uint64_t v8 = [v6 hasPrefix:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end