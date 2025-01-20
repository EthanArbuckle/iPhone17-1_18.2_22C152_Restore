@interface NSURL(GSExtensions)
- (id)gs_URLByUpdatingPathExtensionWithPathOrURL:()GSExtensions;
- (id)gs_issueExtension:()GSExtensions error:;
- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions;
@end

@implementation NSURL(GSExtensions)

- (id)gs_issueExtension:()GSExtensions error:
{
  v6 = [a1 path];
  v7 = objc_msgSend(v6, "gs_issueExtension:error:", a3, a4);

  return v7;
}

- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions
{
  v4 = [a1 path];
  long long v5 = a3[1];
  v8[0] = *a3;
  v8[1] = v5;
  v6 = objc_msgSend(v4, "gs_issueReadExtensionIfNeededForAuditToken:", v8);

  return v6;
}

- (id)gs_URLByUpdatingPathExtensionWithPathOrURL:()GSExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 pathExtension];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1F37C0AE8;
  }
  v8 = v7;

  v9 = [v4 pathExtension];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = &stru_1F37C0AE8;
  }
  v11 = v10;

  if ([(__CFString *)v11 caseInsensitiveCompare:v8])
  {
    id v12 = [a1 URLByDeletingPathExtension];
    if ([(__CFString *)v11 length])
    {
      uint64_t v13 = [v12 URLByAppendingPathExtension:v11];

      id v12 = (id)v13;
    }
  }
  else
  {
    id v12 = a1;
  }

  return v12;
}

@end