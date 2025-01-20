@interface AppMetadataInstall
+ (Class)databaseEntityClass;
- (AppMetadataInstall)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation AppMetadataInstall

- (AppMetadataInstall)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppMetadataInstall;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AppMetadataInstall;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end