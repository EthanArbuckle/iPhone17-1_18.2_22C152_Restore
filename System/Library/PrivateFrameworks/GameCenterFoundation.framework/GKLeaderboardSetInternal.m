@interface GKLeaderboardSetInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)icons;
- (NSDictionary)leaderboardIdentifiers;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)title;
- (unint64_t)hash;
- (void)setGroupIdentifier:(id)a3;
- (void)setIcons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLeaderboardIdentifiers:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKLeaderboardSetInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_267 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_267, &__block_literal_global_269);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_266;

  return v2;
}

void __51__GKLeaderboardSetInternal_secureCodedPropertyKeys__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"identifier", @"groupIdentifier", @"title", @"leaderboardIdentifiers");
  v11[3] = v3;
  v10[4] = @"icons";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v11[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_266;
  secureCodedPropertyKeys_sSecureCodedKeys_266 = v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(GKLeaderboardSetInternal *)self identifier];
    v7 = [v5 identifier];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKLeaderboardSetInternal *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDictionary)leaderboardIdentifiers
{
  return self->_leaderboardIdentifiers;
}

- (void)setLeaderboardIdentifiers:(id)a3
{
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_leaderboardIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end