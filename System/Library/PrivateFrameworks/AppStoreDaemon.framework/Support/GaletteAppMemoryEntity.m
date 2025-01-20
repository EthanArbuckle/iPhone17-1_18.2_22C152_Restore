@interface GaletteAppMemoryEntity
+ (Class)databaseEntityClass;
+ (id)appWithBundleID:(id)a3 mode:(int64_t)a4 name:(id)a5;
+ (id)defaultProperties;
- (NSString)bundleID;
- (NSString)name;
- (int64_t)mode;
@end

@implementation GaletteAppMemoryEntity

+ (id)appWithBundleID:(id)a3 mode:(int64_t)a4 name:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [GaletteAppMemoryEntity alloc];
  v15[0] = v8;
  v14[0] = @"bundle_id";
  v14[1] = @"mode";
  v10 = +[NSNumber numberWithInteger:a4];
  v14[2] = @"name";
  v15[1] = v10;
  v15[2] = v7;
  v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  v12 = [(SQLiteMemoryEntity *)v9 initWithPropertyValues:v11];
  return v12;
}

- (NSString)bundleID
{
  return (NSString *)sub_10026E95C(self, @"bundle_id");
}

- (int64_t)mode
{
  return (int64_t)sub_10026E91C(self, @"mode");
}

- (NSString)name
{
  return (NSString *)sub_10026E95C(self, @"name");
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"bundle_id";
  v4[1] = @"mode";
  v4[2] = @"name";
  v2 = +[NSArray arrayWithObjects:v4 count:3];
  return v2;
}

@end