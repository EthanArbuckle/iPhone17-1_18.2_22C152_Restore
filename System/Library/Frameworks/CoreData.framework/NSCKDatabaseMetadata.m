@interface NSCKDatabaseMetadata
+ (NSManagedObject)databaseMetadataForScope:(uint64_t)a3 forStore:(void *)a4 inContext:(uint64_t)a5 error:;
+ (NSString)entityPath;
- (BOOL)hasSubscription;
- (int64_t)databaseScope;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setHasSubscription:(BOOL)a3;
@end

@implementation NSCKDatabaseMetadata

- (BOOL)hasSubscription
{
  v2 = (void *)[(NSCKDatabaseMetadata *)self hasSubscriptionNum];

  return [v2 BOOLValue];
}

- (void)setHasSubscription:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(NSCKDatabaseMetadata *)self setHasSubscriptionNum:v4];
}

- (int64_t)databaseScope
{
  v2 = (void *)[(NSCKDatabaseMetadata *)self databaseScopeNum];

  return [v2 integerValue];
}

- (void)setDatabaseScope:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];

  [(NSCKDatabaseMetadata *)self setDatabaseScopeNum:v4];
}

+ (NSManagedObject)databaseMetadataForScope:(uint64_t)a3 forStore:(void *)a4 inContext:(uint64_t)a5 error:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  self;
  v9 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKDatabaseMetadata entityPath]);
  v14[0] = a3;
  -[NSFetchRequest setAffectedStores:](v9, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1]);
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"databaseScopeNum = %@", objc_msgSend(NSNumber, "numberWithInteger:", a2)]);
  [(NSFetchRequest *)v9 setPropertiesToFetch:&unk_1ED7E9910];
  v10 = (void *)[a4 executeFetchRequest:v9 error:a5];
  if (!v10) {
    return 0;
  }
  v11 = (NSManagedObject *)[v10 lastObject];
  if (!v11)
  {
    v11 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKDatabaseMetadata entityPath], a4);
    [(NSManagedObject *)v11 setDatabaseScope:a2];
    self;
    if ((unint64_t)(a2 - 1) > 2) {
      v12 = 0;
    }
    else {
      v12 = off_1E544E638[a2 - 1];
    }
    [(NSManagedObject *)v11 setDatabaseName:v12];
    [(NSManagedObject *)v11 setHasSubscriptionNum:&unk_1ED7E2B18];
    [a4 assignObject:v11 toPersistentStore:a3];
  }
  return v11;
}

+ (NSString)entityPath
{
  v2 = NSString;
  id v3 = +[PFCloudKitMetadataModel ancillaryModelNamespace];
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v2 stringWithFormat:@"%@/%@", v3, NSStringFromClass(v4)];
}

@end