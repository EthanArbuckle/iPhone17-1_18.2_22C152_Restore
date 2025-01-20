@interface NSPersistentHistoryChange
+ (NSEntityDescription)entityDescription;
+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest)fetchRequest;
+ (id)shortStringForChangeType:(int64_t)a3;
+ (id)stringForChangeType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)tombstone;
- (NSManagedObjectID)changedObjectID;
- (NSPersistentHistoryChangeType)changeType;
- (NSPersistentHistoryTransaction)transaction;
- (NSSet)updatedProperties;
- (id)description;
- (int64_t)changeID;
@end

@implementation NSPersistentHistoryChange

+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context
{
  if (!context) {
    return 0;
  }
  v3 = [(NSManagedObjectContext *)context persistentStoreCoordinator];
  v4 = v3 ? v3->_modelMap : 0;
  uint64_t v5 = [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryFetchModel ancillaryModelNamespace](_PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), @"Change"];
  if (!v4) {
    return 0;
  }
  uint64_t v6 = v5;
  entitiesByPath = v4->_entitiesByPath;

  return (NSEntityDescription *)[(NSDictionary *)entitiesByPath objectForKey:v6];
}

+ (NSFetchRequest)fetchRequest
{
  v2 = +[NSPersistentHistoryChange entityDescription];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  v4 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v4 setEntity:v3];
  uint64_t v5 = v4;
  return v4;
}

+ (NSEntityDescription)entityDescription
{
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (!v2) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return +[NSPersistentHistoryChange entityDescriptionWithContext:v2];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryChange: %lld %@ %@ %lld %@ %@>", -[NSPersistentHistoryChange changeID](self, "changeID"), -[NSPersistentHistoryChange changedObjectID](self, "changedObjectID"), +[NSPersistentHistoryChange shortStringForChangeType:](NSPersistentHistoryChange, "shortStringForChangeType:", -[NSPersistentHistoryChange changeType](self, "changeType")), -[NSPersistentHistoryTransaction transactionNumber](-[NSPersistentHistoryChange transaction](self, "transaction"), "transactionNumber"), -[NSPersistentHistoryChange updatedProperties](self, "updatedProperties"), -[NSPersistentHistoryChange tombstone](self, "tombstone")];
}

- (NSDictionary)tombstone
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (NSManagedObjectID)changedObjectID
{
  return 0;
}

- (NSPersistentHistoryChangeType)changeType
{
  return -1;
}

- (NSPersistentHistoryTransaction)transaction
{
  return 0;
}

- (int64_t)changeID
{
  return -1;
}

- (NSSet)updatedProperties
{
  return 0;
}

+ (id)shortStringForChangeType:(int64_t)a3
{
  v3 = (void *)[a1 stringForChangeType:a3];

  return (id)[v3 stringByReplacingOccurrencesOfString:@"NSPersistentHistoryChangeType" withString:&stru_1ED787880];
}

+ (id)stringForChangeType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"'%ld' is an unknown NSPersistentHistoryChangeType value", a3), 0 reason userInfo]);
  }
  return off_1E544BFC0[a3];
}

@end