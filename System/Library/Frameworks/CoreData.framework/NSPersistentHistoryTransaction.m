@interface NSPersistentHistoryTransaction
+ (NSEntityDescription)entityDescription;
+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context;
+ (NSFetchRequest)fetchRequest;
- (BOOL)isEqual:(id)a3;
- (NSArray)changes;
- (NSDate)timestamp;
- (NSNotification)objectIDNotification;
- (NSPersistentHistoryToken)token;
- (NSString)author;
- (NSString)bundleID;
- (NSString)contextName;
- (NSString)processID;
- (NSString)storeID;
- (id)description;
- (id)initialQueryGenerationToken;
- (id)postQueryGenerationToken;
- (int64_t)transactionNumber;
@end

@implementation NSPersistentHistoryTransaction

+ (NSFetchRequest)fetchRequest
{
  v2 = +[NSPersistentHistoryTransaction entityDescription];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  v4 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v4 setEntity:v3];
  v5 = v4;
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

  return +[NSPersistentHistoryTransaction entityDescriptionWithContext:v2];
}

+ (NSEntityDescription)entityDescriptionWithContext:(NSManagedObjectContext *)context
{
  if (!context) {
    return 0;
  }
  v3 = [(NSManagedObjectContext *)context persistentStoreCoordinator];
  v4 = v3 ? v3->_modelMap : 0;
  uint64_t v5 = [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryFetchModel ancillaryModelNamespace](_PFPersistentHistoryFetchModel, "ancillaryModelNamespace"), @"Transaction"];
  if (!v4) {
    return 0;
  }
  uint64_t v6 = v5;
  entitiesByPath = v4->_entitiesByPath;

  return (NSEntityDescription *)[(NSDictionary *)entitiesByPath objectForKey:v6];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = [(NSPersistentHistoryTransaction *)self storeID];
  BOOL result = 0;
  if (v5 == (NSString *)[a3 storeID])
  {
    int64_t v6 = [(NSPersistentHistoryTransaction *)self transactionNumber];
    if (v6 == [a3 transactionNumber]) {
      return 1;
    }
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryTransaction: %lld, %@, %@, %@, %@, %@, %@>", -[NSPersistentHistoryTransaction transactionNumber](self, "transactionNumber"), -[NSPersistentHistoryTransaction timestamp](self, "timestamp"), -[NSPersistentHistoryTransaction bundleID](self, "bundleID"), -[NSPersistentHistoryTransaction processID](self, "processID"), -[NSPersistentHistoryTransaction contextName](self, "contextName"), -[NSPersistentHistoryTransaction author](self, "author"), -[NSPersistentHistoryTransaction changes](self, "changes")];
}

- (NSDate)timestamp
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];

  return (NSDate *)[v2 distantFuture];
}

- (NSArray)changes
{
  return 0;
}

- (NSPersistentHistoryToken)token
{
  return 0;
}

- (id)initialQueryGenerationToken
{
  return 0;
}

- (id)postQueryGenerationToken
{
  return 0;
}

- (int64_t)transactionNumber
{
  return 0;
}

- (NSString)storeID
{
  return (NSString *)&stru_1ED787880;
}

- (NSString)bundleID
{
  return (NSString *)&stru_1ED787880;
}

- (NSString)processID
{
  return (NSString *)&stru_1ED787880;
}

- (NSString)contextName
{
  return 0;
}

- (NSString)author
{
  return 0;
}

- (NSNotification)objectIDNotification
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  uint64_t v2 = (void *)MEMORY[0x1E4F28EA0];

  return (NSNotification *)[v2 notificationWithName:&stru_1ED787880 object:0];
}

@end