@interface PFUbiquityPeerState
+ (PFUbiquityPeerState)peerStateForStoreName:(void *)a3 andPeerID:(void *)a4 inManagedObjectContext:(int)a5 createIfMissing:;
- (PFUbiquityPeerState)initWithStoreName:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation PFUbiquityPeerState

- (PFUbiquityPeerState)initWithStoreName:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"PFUbiquityPeerState");
  if (v7)
  {
    v8 = [(NSManagedObject *)self initWithEntity:v7 insertIntoManagedObjectContext:a4];
    v9 = v8;
    if (v8) {
      [(PFUbiquityPeerState *)v8 setStoreName:a3];
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

+ (PFUbiquityPeerState)peerStateForStoreName:(void *)a3 andPeerID:(void *)a4 inManagedObjectContext:(int)a5 createIfMissing:
{
  self;
  if (![a2 length] || !objc_msgSend(a3, "length") || !objc_msgSend(a4, "persistentStoreCoordinator")) {
    return 0;
  }
  v9 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityPeerState"];
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"storeName == %@ AND peer.peerKey == %@ AND storeMetadata.ubiquityName == %@", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", a2, a3, a2, 0) argumentArray]);
  uint64_t v14 = 0;
  v10 = (void *)[a4 executeFetchRequest:v9 error:&v14];
  v11 = v10;
  if (v14 || (unint64_t)[v10 count] >= 2)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error or too many peer states: %@, error: %@", "+[PFUbiquityPeerState(UbiquityMethods) peerStateForStoreName:andPeerID:inManagedObjectContext:createIfMissing:]", 58, v11, v14);
    }
    return 0;
  }
  if ([v11 count] == 1) {
    v12 = (PFUbiquityPeerState *)[v11 objectAtIndex:0];
  }
  else {
    v12 = 0;
  }
  if (!v12 && a5)
  {
    v12 = [[PFUbiquityPeerState alloc] initWithStoreName:a2 insertIntoManagedObjectContext:a4];
    [(PFUbiquityPeerState *)v12 setPeer:+[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, a3, a4, 1)];
    [(PFUbiquityPeerState *)v12 setStoreMetadata:+[PFUbiquityStoreMetadata metadataForStoreWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a2, a4)];
  }
  return v12;
}

@end