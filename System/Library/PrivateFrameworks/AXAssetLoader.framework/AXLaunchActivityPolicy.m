@interface AXLaunchActivityPolicy
- (AXLaunchActivityPolicy)initWithLaunchActivityIdentifier:(id)a3;
- (id)assetType;
@end

@implementation AXLaunchActivityPolicy

- (AXLaunchActivityPolicy)initWithLaunchActivityIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXLaunchActivityPolicy;
  v5 = [(AXAssetPolicy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(AXAssetPolicy *)v5 setLaunchActivityIdentifier:v4];
  }

  return v6;
}

- (id)assetType
{
  return &stru_1F367E168;
}

@end