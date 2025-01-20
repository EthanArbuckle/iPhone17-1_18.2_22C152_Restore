@interface ACXPendingAppUpdateState
+ (BOOL)supportsSecureCoding;
- (ACXPendingAppUpdateState)initWithCoder:(id)a3;
- (ACXPendingAppUpdateState)initWithCompanionBundleID:(id)a3;
- (BOOL)hasExpired;
- (BOOL)isEqual:(id)a3;
- (NSString)companionAppBundleID;
- (double)creationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACXPendingAppUpdateState

- (ACXPendingAppUpdateState)initWithCompanionBundleID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACXPendingAppUpdateState;
  v6 = [(ACXPendingAppUpdateState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_companionAppBundleID, a3);
    +[NSDate timeIntervalSinceReferenceDate];
    v7->_creationTime = v8;
  }

  return v7;
}

- (BOOL)hasExpired
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(ACXPendingAppUpdateState *)self creationTime];
  return v4 - v5 > 604800.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXPendingAppUpdateState)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACXPendingAppUpdateState;
  double v5 = [(ACXPendingAppUpdateState *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionAppBundleID"];
    companionAppBundleID = v5->_companionAppBundleID;
    v5->_companionAppBundleID = (NSString *)v6;

    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_creationTime = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double creationTime = self->_creationTime;
  id v5 = a3;
  [v5 encodeDouble:@"creationTime" forKey:creationTime];
  [v5 encodeObject:self->_companionAppBundleID forKey:@"companionAppBundleID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(ACXPendingAppUpdateState *)self companionAppBundleID];
  uint64_t v6 = [v4 initWithCompanionBundleID:v5];

  [(ACXPendingAppUpdateState *)self creationTime];
  v6[2] = v7;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACXPendingAppUpdateState *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(ACXPendingAppUpdateState *)self companionAppBundleID];
      uint64_t v7 = [(ACXPendingAppUpdateState *)v5 companionAppBundleID];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ACXPendingAppUpdateState *)self companionAppBundleID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(ACXPendingAppUpdateState *)self companionAppBundleID];
  [(ACXPendingAppUpdateState *)self creationTime];
  uint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v7 = +[NSString stringWithFormat:@"<%@<%p> companionAppBundleID:%@ creationTime:%@>", v4, self, v5, v6];

  return v7;
}

- (NSString)companionAppBundleID
{
  return self->_companionAppBundleID;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void).cxx_destruct
{
}

@end