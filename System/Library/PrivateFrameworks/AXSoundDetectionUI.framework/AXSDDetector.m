@interface AXSDDetector
- (AXSDDetector)initWithIdentifier:(id)a3;
- (AXSDDetector)initWithIdentifier:(id)a3 andName:(id)a4;
- (AXSDDetector)initWithModel:(id)a3;
- (AXSDDetector)initWithType:(id)a3;
- (BOOL)_isInBuild;
- (BOOL)isCompatiable;
- (BOOL)isCustom;
- (BOOL)isDownloading;
- (BOOL)isEnabled;
- (BOOL)isInstalled;
- (BOOL)isOlderThanDetector:(id)a3;
- (BOOL)isUsingSoundPrint;
- (BOOL)needsUpdate;
- (NSString)category;
- (NSString)identifier;
- (NSString)modelURLString;
- (NSString)name;
- (NSURL)modelURL;
- (id)debugDescription;
- (id)description;
- (id)model;
- (id)properties;
- (unint64_t)compatibilityVersion;
- (unint64_t)contentVersion;
- (void)setIdentifier:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation AXSDDetector

- (AXSDDetector)initWithIdentifier:(id)a3
{
  return [(AXSDDetector *)self initWithIdentifier:a3 andName:0];
}

- (AXSDDetector)initWithIdentifier:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXSDDetector;
  v8 = [(AXSDDetector *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelName, a4);
    uint64_t v10 = AXSDSoundDetectionTypeForIdentifier();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    *(_WORD *)&v9->_enabled = 0;
    v12 = v9;
  }

  return v9;
}

- (AXSDDetector)initWithType:(id)a3
{
  v4 = (NSString *)a3;
  v5 = [(AXSDDetector *)self initWithIdentifier:v4];
  modelName = v5->_modelName;
  v5->_modelName = v4;

  return v5;
}

- (AXSDDetector)initWithModel:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXSDDetector;
  id v6 = [(AXSDDetector *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    uint64_t v8 = [v5 ultronModelName];
    modelName = v7->_modelName;
    v7->_modelName = (NSString *)v8;

    uint64_t v10 = [v5 ultronModelName];
    uint64_t v11 = AXSDSoundDetectionTypeForIdentifier();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_needsUpdate = 0;
    v13 = v7;
  }

  return v7;
}

- (NSString)name
{
  return self->_modelName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)contentVersion
{
  model = self->_model;
  if (model) {
    return [(AXAsset *)model contentVersion];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)compatibilityVersion
{
  model = self->_model;
  if (model) {
    return [(AXAsset *)model compatibilityVersion];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)properties
{
  return (id)[(AXAsset *)self->_model properties];
}

- (id)model
{
  return self->_model;
}

- (BOOL)isCustom
{
  return 0;
}

- (void)setIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  if (![(AXSDDetector *)self _isInBuild])
  {
    id v5 = [MEMORY[0x263F21148] store];
    id v6 = [MEMORY[0x263F21188] ultronAssetType];
    id v7 = [v5 valueForKey:@"AXUltronAssetsInUse" forAssetType:v6];
    id v14 = (id)[v7 mutableCopy];

    uint64_t v8 = (uint64_t)v14;
    if (!v14) {
      uint64_t v8 = objc_opt_new();
    }
    id v15 = (id)v8;
    if (v3)
    {
      v9 = [(AXSDDetector *)self model];
      uint64_t v10 = [v9 assetId];
      uint64_t v11 = [(AXSDDetector *)self identifier];
      [v15 setObject:v10 forKey:v11];
    }
    else
    {
      v9 = [(AXSDDetector *)self identifier];
      [v15 removeObjectForKey:v9];
    }

    v12 = [MEMORY[0x263F21148] store];
    v13 = [MEMORY[0x263F21188] ultronAssetType];
    [v12 setValue:v15 forKey:@"AXUltronAssetsInUse" forAssetType:v13];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)category
{
  v2 = [(AXSDDetector *)self identifier];
  BOOL v3 = (id *)MEMORY[0x263F21CA0];
  v4 = AXSDSoundDetectionTypesForCategory();
  char v5 = [v4 containsObject:v2];

  if ((v5 & 1) == 0)
  {
    BOOL v3 = (id *)MEMORY[0x263F21CA8];
    id v6 = AXSDSoundDetectionTypesForCategory();
    char v7 = [v6 containsObject:v2];

    if ((v7 & 1) == 0)
    {
      BOOL v3 = (id *)MEMORY[0x263F21CB0];
      uint64_t v8 = AXSDSoundDetectionTypesForCategory();
      char v9 = [v8 containsObject:v2];

      if ((v9 & 1) == 0)
      {
        BOOL v3 = (id *)MEMORY[0x263F21CC0];
        uint64_t v10 = AXSDSoundDetectionTypesForCategory();
        int v11 = [v10 containsObject:v2];

        if (!v11) {
          BOOL v3 = (id *)MEMORY[0x263F21CB8];
        }
      }
    }
  }
  v12 = (NSString *)*v3;

  return v12;
}

- (BOOL)isDownloading
{
  if ([(AXSDDetector *)self _isInBuild]) {
    return 0;
  }
  model = self->_model;
  return [(AXAsset *)model isDownloading];
}

- (BOOL)isInstalled
{
  if ([(AXSDDetector *)self _isInBuild]) {
    return 1;
  }
  model = self->_model;
  return [(AXAsset *)model isInstalled];
}

- (BOOL)isCompatiable
{
  if ([(AXSDDetector *)self _isInBuild]) {
    return 1;
  }
  unint64_t v4 = [(AXSDDetector *)self compatibilityVersion];
  if (v4 < [MEMORY[0x263F21188] minimumCompatibilityVersion]) {
    return 0;
  }
  unint64_t v5 = [(AXSDDetector *)self compatibilityVersion];
  return v5 <= [MEMORY[0x263F21188] maximumCompatibilityVersion];
}

- (BOOL)isUsingSoundPrint
{
  return [(AXAsset *)self->_model isUsingSoundPrint];
}

- (NSURL)modelURL
{
  return (NSURL *)[(AXAsset *)self->_model localURL];
}

- (NSString)modelURLString
{
  v2 = [(AXSDDetector *)self modelURL];
  BOOL v3 = [v2 absoluteString];

  return (NSString *)v3;
}

- (BOOL)isOlderThanDetector:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if (!-[AXSDDetector _isInBuild](self, "_isInBuild") && ([v4 isCustom] & 1) == 0)
  {
    unint64_t v5 = [v4 compatibilityVersion];
    if (v5 > [(AXSDDetector *)self compatibilityVersion]
      || (uint64_t v6 = [v4 compatibilityVersion],
          v6 == [(AXSDDetector *)self compatibilityVersion])
      && (unint64_t v7 = [v4 contentVersion], v7 > -[AXSDDetector contentVersion](self, "contentVersion")))
    {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_isInBuild
{
  BOOL v3 = [(AXSDDetector *)self name];
  if (([v3 isEqualToString:*MEMORY[0x263F21CF8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F21D00]] & 1) != 0)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:*MEMORY[0x263F21CF0]] ^ 1;
  }
  if (AXIsSoundDetectionMedinaSupportEnabled()) {
    unsigned int v5 = v4 & ~[(AXSDDetector *)self isCustom];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(AXSDDetector *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"[%@] Identifier: %@", v4, v5];

  return v6;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(AXSDDetector *)self name];
  uint64_t v6 = [(AXSDDetector *)self identifier];
  unint64_t v7 = [(AXSDDetector *)self category];
  unint64_t v8 = [(AXSDDetector *)self compatibilityVersion];
  unint64_t v9 = [(AXSDDetector *)self contentVersion];
  [(AXSDDetector *)self isInstalled];
  uint64_t v10 = NSStringFromBOOL();
  int v11 = [v3 stringWithFormat:@"[%@] Name: %@, Identifier: %@, Category: %@, Compat Version: %lu, Version: %lu, Is Installed: %@", v4, v5, v6, v7, v8, v9, v10];

  if ([(AXSDDetector *)self isInstalled])
  {
    v12 = NSString;
    v13 = [(AXSDDetector *)self modelURL];
    id v14 = [v12 stringWithFormat:@"%@, Model URL: %@", v11, v13];
  }
  else
  {
    id v14 = v11;
  }

  return v14;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

@end