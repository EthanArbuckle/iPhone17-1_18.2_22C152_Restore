@interface BABookletMigrationInfo
+ (id)fetchRequest;
- (id)createInfo;
@end

@implementation BABookletMigrationInfo

- (id)createInfo
{
  id v2 = objc_msgSend(objc_alloc((Class)BLBookletMigrationInfo), "initWithStoreID:migrationState:", -[BABookletMigrationInfo storeID](self, "storeID"), -[BABookletMigrationInfo migrationState](self, "migrationState"));

  return v2;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"BookletMigrationInfo"];
}

@end