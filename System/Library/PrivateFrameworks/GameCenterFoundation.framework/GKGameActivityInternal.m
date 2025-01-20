@interface GKGameActivityInternal
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 andUserInfo:(id)a5;
- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 createdAt:(id)a5 andUserInfo:(id)a6;
- (NSDate)createdAt;
- (NSDictionary)userInfo;
- (NSString)activityID;
- (NSString)activityType;
- (NSString)bundleID;
- (id)description;
- (unint64_t)hash;
@end

@implementation GKGameActivityInternal

- (BOOL)isEqual:(id)a3
{
  v4 = (GKGameActivityInternal *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(GKGameActivityInternal *)v4 activityID];
      v6 = [(GKGameActivityInternal *)self activityID];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(GKGameActivityInternal *)self activityID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_1 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_1, &__block_literal_global_11);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_1;

  return v2;
}

void __49__GKGameActivityInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  unint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"activityType", @"userInfo");
  v7[1] = v3;
  v6[2] = @"activityID";
  v7[2] = objc_opt_class();
  v6[3] = @"bundleID";
  v7[3] = objc_opt_class();
  v6[4] = @"createdAt";
  v7[4] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_1;
  secureCodedPropertyKeys_sSecureCodedKeys_1 = v4;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(GKGameActivityInternal *)self activityID];
  char v7 = [(GKGameActivityInternal *)self activityType];
  v8 = [(GKGameActivityInternal *)self bundleID];
  v9 = [(GKGameActivityInternal *)self createdAt];
  v10 = [(GKGameActivityInternal *)self userInfo];
  v11 = [v3 stringWithFormat:@"<%@: %p, activityID: %@, activityType: %@, bundleID: %@, createdAt: %@, userInfo: %@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 andUserInfo:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 date];
  v13 = [(GKGameActivityInternal *)self initWithActivityType:v11 bundleID:v10 createdAt:v12 andUserInfo:v9];

  return v13;
}

- (GKGameActivityInternal)initWithActivityType:(id)a3 bundleID:(id)a4 createdAt:(id)a5 andUserInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)GKGameActivityInternal;
  v15 = [(GKGameActivityInternal *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_activityType, a3);
    objc_storeStrong((id *)&v16->_userInfo, a6);
    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [v17 UUIDString];
    activityID = v16->_activityID;
    v16->_activityID = (NSString *)v18;

    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_createdAt, a5);
  }

  return v16;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end