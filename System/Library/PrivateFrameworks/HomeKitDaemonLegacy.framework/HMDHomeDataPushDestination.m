@interface HMDHomeDataPushDestination
- (BOOL)ignoreConfigCompare;
- (HMDHomeDataPushDestination)initWithUser:(id)a3 destination:(id)a4;
- (HMDUser)user;
- (NSString)destination;
- (NSString)pushDestination;
- (NSString)username;
- (id)description;
- (void)setIgnoreConfigCompare:(BOOL)a3;
@end

@implementation HMDHomeDataPushDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)setIgnoreConfigCompare:(BOOL)a3
{
  self->_ignoreConfigCompare = a3;
}

- (BOOL)ignoreConfigCompare
{
  return self->_ignoreConfigCompare;
}

- (NSString)destination
{
  return self->_destination;
}

- (HMDUser)user
{
  return self->_user;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)pushDestination
{
  v3 = [(HMDHomeDataPushDestination *)self destination];

  if (v3)
  {
    v4 = [(HMDHomeDataPushDestination *)self destination];
  }
  else
  {
    v5 = [(HMDHomeDataPushDestination *)self user];
    v4 = [v5 userID];
  }
  return (NSString *)v4;
}

- (id)description
{
  if (shouldLogPrivateInformation())
  {
    v3 = [(HMDHomeDataPushDestination *)self destination];
  }
  else
  {
    v3 = @"...";
    v4 = @"...";
  }
  v5 = NSString;
  v6 = [(HMDHomeDataPushDestination *)self user];
  [(HMDHomeDataPushDestination *)self ignoreConfigCompare];
  v7 = HMFBooleanToString();
  v8 = [v5 stringWithFormat:@"[Push-Destination: User: %@, Dest: %@, Ignore-config: %@]", v6, v3, v7];

  return v8;
}

- (HMDHomeDataPushDestination)initWithUser:(id)a3 destination:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeDataPushDestination;
  v9 = [(HMDHomeDataPushDestination *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_user, a3);
    uint64_t v11 = [v7 userID];
    username = v10->_username;
    v10->_username = (NSString *)v11;

    objc_storeStrong((id *)&v10->_destination, a4);
  }

  return v10;
}

@end