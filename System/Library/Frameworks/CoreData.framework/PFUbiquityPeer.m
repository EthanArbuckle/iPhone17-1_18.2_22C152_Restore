@interface PFUbiquityPeer
+ (uint64_t)peerForPeerID:(void *)a3 inManagedObjectContext:(int)a4 createIfMissing:;
@end

@implementation PFUbiquityPeer

+ (uint64_t)peerForPeerID:(void *)a3 inManagedObjectContext:(int)a4 createIfMissing:
{
  self;
  uint64_t v7 = [a2 length];
  v8 = 0;
  if (a3 && v7)
  {
    v9 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityPeer"];
    -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"peerKey == %@", a2]);
    uint64_t v14 = 0;
    v10 = (void *)[a3 executeFetchRequest:v9 error:&v14];
    if (v10)
    {
      v11 = v10;
      if ((unint64_t)[v10 count] >= 2)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Found more than one peer object for peer ID: %@\n%@", "+[PFUbiquityPeer(UbiquityMethods) peerForPeerID:inManagedObjectContext:createIfMissing:]", 37, a2, v11);
        }
        return [v11 lastObject];
      }
      if ([v11 count] == 1) {
        return [v11 objectAtIndex:0];
      }
      if (a4)
      {
        v8 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeer alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"PFUbiquityPeer"), a3);
        [(PFUbiquityPeer *)v8 setPeerKey:a2];
        [(PFUbiquityPeer *)v8 setPeerCode:a2];

        return (uint64_t)v8;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error getting peer: %@", "+[PFUbiquityPeer(UbiquityMethods) peerForPeerID:inManagedObjectContext:createIfMissing:]", 34, v14);
    }
    return 0;
  }
  return (uint64_t)v8;
}

@end