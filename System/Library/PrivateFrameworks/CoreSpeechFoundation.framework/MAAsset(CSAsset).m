@interface MAAsset(CSAsset)
- (BOOL)_isDownloaded;
- (BOOL)canBePurged;
- (BOOL)isCSAssetInstalled;
- (BOOL)isDownloading;
- (BOOL)isLatestCompareTo:()CSAsset;
- (BOOL)isPremium;
- (id)_compatibilityVersion;
- (id)_footprint;
- (id)_version;
- (id)getCSAssetOfType:()CSAsset;
- (id)path;
@end

@implementation MAAsset(CSAsset)

- (BOOL)_isDownloaded
{
  return (unint64_t)([a1 state] - 5) < 2;
}

- (BOOL)isLatestCompareTo:()CSAsset
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v5 = [a1 attributes];
  uint64_t v6 = *MEMORY[0x1E4F77F20];
  v7 = [v5 objectForKey:*MEMORY[0x1E4F77F20]];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 attributes];
  v10 = [v9 objectForKey:v6];
  uint64_t v11 = [v10 integerValue];

  if (v8 < v11) {
    goto LABEL_8;
  }
  if (v8 != v11)
  {
LABEL_7:
    BOOL v12 = 1;
    goto LABEL_9;
  }
  if (![a1 isPremium])
  {
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  if (![v4 isPremium]) {
    goto LABEL_7;
  }
  BOOL v12 = [a1 state] == 5;
LABEL_9:

  return v12;
}

- (BOOL)canBePurged
{
  return [a1 state] == 2 || objc_msgSend(a1, "state") == 3 || objc_msgSend(a1, "state") == 6;
}

- (BOOL)isCSAssetInstalled
{
  return [a1 state] == 2
      || [a1 state] == 3
      || [a1 state] == 5
      || [a1 state] == 6;
}

- (BOOL)isDownloading
{
  return [a1 state] == 4;
}

- (id)path
{
  v1 = [a1 getLocalUrl];
  v2 = [v1 path];

  return v2;
}

- (BOOL)isPremium
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:@"Footprint"];

  BOOL v3 = v2 && ([v2 isEqualToString:@"Premium"] & 1) != 0;
  return v3;
}

- (id)_compatibilityVersion
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:*MEMORY[0x1E4F77F18]];

  return v2;
}

- (id)_version
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:*MEMORY[0x1E4F77F20]];

  return v2;
}

- (id)_footprint
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:@"Footprint"];

  return v2;
}

- (id)getCSAssetOfType:()CSAsset
{
  v5 = [a1 getLocalUrl];
  uint64_t v6 = [v5 path];

  v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = [a1 _compatibilityVersion];
  v9 = [v8 stringValue];
  [v7 appendString:v9];

  if (v7)
  {
    v10 = [a1 _version];

    if (v10)
    {
      uint64_t v11 = [a1 _version];
      BOOL v12 = [v11 stringValue];
      [v7 appendFormat:@".%@", v12];
    }
    v13 = [a1 _footprint];

    if (v13)
    {
      v14 = [a1 _footprint];
      [v7 appendFormat:@".%@", v14];
    }
  }
  v15 = +[CSAsset assetForAssetType:a3 resourcePath:v6 configVersion:v7 assetProvider:0 assetVariant:1 identity:0 assistantLanguageCode:0];

  return v15;
}

@end