@interface GKGameActivity
- (GKGameActivity)initWithInternalRepresentation:(id)a3;
- (GKGameActivityInternal)internal;
- (NSDate)createdAt;
- (NSDictionary)userInfo;
- (NSString)activityID;
- (NSString)activityType;
- (NSString)bundleID;
- (id)description;
@end

@implementation GKGameActivity

- (GKGameActivity)initWithInternalRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKGameActivity;
  v6 = [(GKGameActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internal, a3);
  }

  return v7;
}

- (NSString)activityType
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 activityType];

  return (NSString *)v3;
}

- (NSDictionary)userInfo
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 userInfo];

  return (NSDictionary *)v3;
}

- (NSString)activityID
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 activityID];

  return (NSString *)v3;
}

- (NSString)bundleID
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (NSDate)createdAt
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 createdAt];

  return (NSDate *)v3;
}

- (id)description
{
  v2 = [(GKGameActivity *)self internal];
  v3 = [v2 description];

  return v3;
}

- (GKGameActivityInternal)internal
{
  return (GKGameActivityInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end