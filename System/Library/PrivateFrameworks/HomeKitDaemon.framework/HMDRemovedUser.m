@interface HMDRemovedUser
+ (BOOL)supportsSecureCoding;
+ (id)removedUserWithUser:(id)a3;
- (BOOL)isEqualToUser:(id)a3;
- (BOOL)isEqualToUserID:(id)a3;
- (BOOL)isExpired;
- (BOOL)isRemovalInProgress;
- (HMDRemovedUser)initWithCoder:(id)a3;
- (HMDRemovedUser)initWithUser:(id)a3 expiration:(id)a4;
- (HMDUser)user;
- (NSDate)expirationDate;
- (NSString)mergeID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRemovalInProgress:(BOOL)a3;
@end

@implementation HMDRemovedUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (void)setRemovalInProgress:(BOOL)a3
{
  self->_removalInProgress = a3;
}

- (BOOL)isRemovalInProgress
{
  return self->_removalInProgress;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (HMDUser)user
{
  return self->_user;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemovedUser *)self user];
  [v4 encodeObject:v5 forKey:@"HM.user"];

  id v6 = [(HMDRemovedUser *)self expirationDate];
  [v4 encodeObject:v6 forKey:@"HM.expiry"];
}

- (HMDRemovedUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.user"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.expiry"];

  v7 = [(HMDRemovedUser *)self initWithUser:v5 expiration:v6];
  return v7;
}

- (BOOL)isEqualToUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemovedUser *)self user];

  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [v4 userID];
    BOOL v7 = [(HMDRemovedUser *)self isEqualToUserID:v6];
  }
  return v7;
}

- (BOOL)isEqualToUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRemovedUser *)self user];
  id v6 = [v5 userID];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (BOOL)isExpired
{
  v3 = [(HMDRemovedUser *)self user];

  if (!v3) {
    return 1;
  }
  id v4 = [(HMDRemovedUser *)self expirationDate];
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 < 0.0;

  return v6;
}

- (NSString)mergeID
{
  v2 = [(HMDRemovedUser *)self user];
  v3 = [v2 account];
  id v4 = [v3 senderCorrelationIdentifier];

  return (NSString *)v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(HMDRemovedUser *)self user];
  BOOL v6 = [(HMDRemovedUser *)self expirationDate];
  char v7 = [v3 stringWithFormat:@"<%@, User = %@, Expiration = %@>", v4, v5, v6];

  return v7;
}

- (HMDRemovedUser)initWithUser:(id)a3 expiration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRemovedUser;
  v9 = [(HMDRemovedUser *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    objc_storeStrong((id *)&v10->_expirationDate, a4);
    v10->_removalInProgress = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)removedUserWithUser:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [HMDRemovedUser alloc];
  double v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2592000.0];
  BOOL v6 = [(HMDRemovedUser *)v4 initWithUser:v3 expiration:v5];

  return v6;
}

@end