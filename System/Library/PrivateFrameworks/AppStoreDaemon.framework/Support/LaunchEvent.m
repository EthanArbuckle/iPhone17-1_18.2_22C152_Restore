@interface LaunchEvent
+ (Class)databaseEntityClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LaunchEvent

- (id)description
{
  v3 = +[NSMutableArray array];
  v4 = sub_1003AC978(self);
  v5 = +[NSString stringWithFormat:@"bundleID: %@", v4];
  [v3 addObject:v5];

  v6 = sub_1003AC9B0(self);

  if (v6)
  {
    v7 = sub_1003AC9B0(self);
    v8 = sub_1002826D4(v7);
    v9 = +[NSString stringWithFormat:@"startTime: %@", v8];
    [v3 addObject:v9];
  }
  v10 = sub_1003ACA24(self);
  v11 = sub_1002826D4(v10);
  v12 = +[NSString stringWithFormat:@"endTime: %@", v11];
  [v3 addObject:v12];

  v13 = sub_1003ACA98(self);

  if (v13)
  {
    v14 = sub_1003ACA98(self);
    v15 = +[NSString stringWithFormat:@"launchReason: %@", v14];
    [v3 addObject:v15];
  }
  if (sub_1003ACB08(self)) {
    [v3 addObject:@"isExtension: Y"];
  }
  v16 = sub_1003ACB70(self);
  id v17 = [v16 length];

  if (v17)
  {
    v18 = sub_1003ACB70(self);
    v19 = +[NSString stringWithFormat:@"bundleID: %@", v18];
    [v3 addObject:v19];
  }
  v20 = [v3 componentsJoinedByString:@", "];
  v21 = +[NSString stringWithFormat:@"{ %@ }", v20];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LaunchEvent;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end