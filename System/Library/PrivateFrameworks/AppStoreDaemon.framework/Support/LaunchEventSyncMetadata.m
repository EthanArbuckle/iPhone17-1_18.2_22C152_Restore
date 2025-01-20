@interface LaunchEventSyncMetadata
+ (Class)databaseEntityClass;
- (LaunchEventSyncMetadata)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation LaunchEventSyncMetadata

- (LaunchEventSyncMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)LaunchEventSyncMetadata;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LaunchEventSyncMetadata;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end