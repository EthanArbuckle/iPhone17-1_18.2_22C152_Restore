@interface NSDictionary(CKUtilities)
- (id)__ck_bundleIdentifier;
- (id)__ck_localizedAppNameForTranscriptAttribution;
@end

@implementation NSDictionary(CKUtilities)

- (id)__ck_localizedAppNameForTranscriptAttribution
{
  v2 = [a1 objectForKey:*MEMORY[0x1E4F6D3D0]];
  v3 = [a1 objectForKey:*MEMORY[0x1E4F6D3E0]];
  v4 = [v3 componentsSeparatedByString:@":"];
  v5 = [v4 lastObject];

  v6 = [MEMORY[0x1E4F223B8] bundleProxyForIdentifier:v5];
  v7 = [v6 localizedName];

  char v8 = [v5 isEqualToString:*MEMORY[0x1E4F6CC18]];
  v9 = v2;
  if ((v8 & 1) == 0)
  {
    if (IMStringIsEmpty()) {
      v9 = v2;
    }
    else {
      v9 = v7;
    }
  }
  id v10 = v9;

  return v10;
}

- (id)__ck_bundleIdentifier
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F6D3E0]];
  v2 = [v1 componentsSeparatedByString:@":"];
  v3 = [v2 lastObject];

  return v3;
}

@end