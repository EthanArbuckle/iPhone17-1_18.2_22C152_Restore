@interface GKGameSettingsInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (GKGameSettingsInternal)initWithCoder:(id)a3;
- (NSString)bundleID;
- (id)allowFriendListAccessString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serverAllowFriendListAccessValue;
- (int64_t)allowFriendListAccess;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowFriendListAccess:(int64_t)a3;
- (void)setBundleID:(id)a3;
@end

@implementation GKGameSettingsInternal

- (id)serverAllowFriendListAccessValue
{
  int64_t v2 = [(GKGameSettingsInternal *)self allowFriendListAccess];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E6470948[v2 - 1];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setAllowFriendListAccess:", -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess"));
  v5 = [(GKGameSettingsInternal *)self bundleID];
  [v4 setBundleID:v5];

  return v4;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_8 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_8, &__block_literal_global_36);
  }
  int64_t v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_8;

  return v2;
}

void __49__GKGameSettingsInternal_secureCodedPropertyKeys__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"bundleID";
  v2[1] = @"allowFriendListAccess";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_8;
  secureCodedPropertyKeys_sSecureCodedKeys_8 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKGameSettingsInternal;
  id v4 = a3;
  [(GKInternalRepresentation *)&v7 encodeWithCoder:v4];
  v5 = [(GKGameSettingsInternal *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleID"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKGameSettingsInternal allowFriendListAccess](self, "allowFriendListAccess"));
  [v4 encodeObject:v6 forKey:@"allowFriendListAccess"];
}

- (GKGameSettingsInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameSettingsInternal;
  v5 = [(GKInternalRepresentation *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    [(GKGameSettingsInternal *)v5 setBundleID:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowFriendListAccess"];
    -[GKGameSettingsInternal setAllowFriendListAccess:](v5, "setAllowFriendListAccess:", [v7 integerValue]);
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(GKGameSettingsInternal *)self bundleID];
  v6 = [(GKGameSettingsInternal *)self allowFriendListAccessString];
  objc_super v7 = [v3 stringWithFormat:@"                <%@: %p>\n                bundleID: %@\n                allowFriendListAccess: %@            ", v4, self, v5, v6];

  return v7;
}

- (id)allowFriendListAccessString
{
  unint64_t v2 = [(GKGameSettingsInternal *)self allowFriendListAccess];
  if (v2 > 3) {
    return @"GKAllowFriendListAccessInvalid";
  }
  else {
    return off_1E6470960[v2];
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int64_t)allowFriendListAccess
{
  return self->_allowFriendListAccess;
}

- (void)setAllowFriendListAccess:(int64_t)a3
{
  self->_allowFriendListAccess = a3;
}

- (void).cxx_destruct
{
}

@end