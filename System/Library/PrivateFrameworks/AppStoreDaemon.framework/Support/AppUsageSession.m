@interface AppUsageSession
+ (Class)databaseEntityClass;
- (AppUsageSession)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppUsageSession

- (AppUsageSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppUsageSession;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)description
{
  objc_super v3 = sub_10025AE1C(self);
  v4 = sub_10025AE54(self);
  v5 = sub_10025AE8C(self);
  v6 = sub_1002826D4(v5);
  v7 = +[NSString stringWithFormat:@"{ bundleID: %@ sessionReporterKey: %@ lastRefresh: %@ expired: %d }", v3, v4, v6, sub_10025AF0C(self)];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AppUsageSession;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end