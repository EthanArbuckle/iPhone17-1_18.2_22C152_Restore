@interface NSURLSessionConfiguration(GEOApplicationAuditToken)
- (uint64_t)geo_hasApplicationAttribution:()GEOApplicationAuditToken;
- (void)geo_setApplicationAttribution:()GEOApplicationAuditToken;
@end

@implementation NSURLSessionConfiguration(GEOApplicationAuditToken)

- (uint64_t)geo_hasApplicationAttribution:()GEOApplicationAuditToken
{
  id v4 = a3;
  uint64_t v5 = [v4 backingTokenData];
  uint64_t v6 = [v4 proxiedBundleId];
  if (v6 && [v4 isProxiedExternalBundleId])
  {
    id v7 = (id)*MEMORY[0x1E4F18CE8];
  }
  else
  {
    id v7 = [v4 _secondaryIdentifier];
  }
  v8 = v7;
  v9 = [a1 _sourceApplicationAuditTokenData];

  if (v9)
  {
    if (v5)
    {
      v10 = [a1 _sourceApplicationAuditTokenData];
      char v11 = [(id)v5 isEqualToData:v10];
      goto LABEL_11;
    }
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_18;
  }
  v12 = [a1 _sourceApplicationBundleIdentifier];

  if (!v12)
  {
    if (!(v6 | v5)) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  if (!v6) {
    goto LABEL_15;
  }
  v10 = [a1 _sourceApplicationBundleIdentifier];
  char v11 = [(id)v6 isEqualToString:v10];
LABEL_11:
  char v13 = v11;

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  v14 = [a1 _sourceApplicationSecondaryIdentifier];
  if (v8 == v14)
  {
    uint64_t v16 = 1;
  }
  else
  {
    v15 = [a1 _sourceApplicationSecondaryIdentifier];
    uint64_t v16 = [v8 isEqualToString:v15];
  }
LABEL_18:

  return v16;
}

- (void)geo_setApplicationAttribution:()GEOApplicationAuditToken
{
  id v10 = a3;
  id v4 = [v10 proxiedBundleId];

  if (v4)
  {
    uint64_t v5 = [v10 proxiedBundleId];
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v5);

    if ([v10 isProxiedExternalBundleId]) {
      objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:", *MEMORY[0x1E4F18CE8]);
    }
  }
  else
  {
    uint64_t v6 = [v10 backingTokenData];
    objc_msgSend(a1, "set_sourceApplicationAuditTokenData:", v6);
  }
  id v7 = [a1 _sourceApplicationSecondaryIdentifier];
  if (!v7)
  {
    v8 = [v10 _secondaryIdentifier];

    v9 = v10;
    if (!v8) {
      goto LABEL_9;
    }
    id v7 = [v10 _secondaryIdentifier];
    objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:", v7);
  }

  v9 = v10;
LABEL_9:
}

@end