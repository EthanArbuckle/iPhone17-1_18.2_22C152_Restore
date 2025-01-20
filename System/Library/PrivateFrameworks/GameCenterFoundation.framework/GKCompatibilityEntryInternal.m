@interface GKCompatibilityEntryInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (NSNumber)adamID;
- (NSSet)shortVersions;
- (NSSet)versions;
- (NSString)bundleID;
- (int64_t)platform;
- (unint64_t)hash;
- (void)setAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setPlatform:(int64_t)a3;
- (void)setShortVersions:(id)a3;
- (void)setVersions:(id)a3;
@end

@implementation GKCompatibilityEntryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_426[0] != -1) {
    dispatch_once(secureCodedPropertyKeys_onceToken_426, &__block_literal_global_428);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_425;

  return v2;
}

void __55__GKCompatibilityEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"bundleID", @"adamID", @"platform", @"versions");
  v11[3] = v3;
  v10[4] = @"shortVersions";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v11[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_425;
  secureCodedPropertyKeys_sSecureCodedKeys_425 = v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(GKCompatibilityEntryInternal *)self bundleID];
    v7 = [v5 bundleID];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [(GKCompatibilityEntryInternal *)self adamID];
      v9 = [v5 adamID];
      if ([v8 isEqualToNumber:v9]
        && (int64_t v10 = -[GKCompatibilityEntryInternal platform](self, "platform"), v10 == [v5 platform]))
      {
        v11 = [(GKCompatibilityEntryInternal *)self versions];
        v12 = [v5 versions];
        if ([v11 isEqual:v12])
        {
          v16 = [(GKCompatibilityEntryInternal *)self shortVersions];
          v13 = [v5 shortVersions];
          char v14 = [v16 isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = NSString;
  id v4 = [(GKCompatibilityEntryInternal *)self bundleID];
  id v5 = [(GKCompatibilityEntryInternal *)self versions];
  uint64_t v6 = [v3 stringWithFormat:@"%@%@", v4, v5];
  unint64_t v7 = [v6 hash];

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSSet)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
}

- (NSSet)shortVersions
{
  return self->_shortVersions;
}

- (void)setShortVersions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersions, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_adamID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end