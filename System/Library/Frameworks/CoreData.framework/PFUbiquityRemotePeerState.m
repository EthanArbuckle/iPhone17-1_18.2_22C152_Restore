@interface PFUbiquityRemotePeerState
- (PFUbiquityRemotePeerState)initWithStoreName:(id)a3 andRemotePeerID:(id)a4 insertIntoManagedObjectContext:(id)a5;
@end

@implementation PFUbiquityRemotePeerState

- (PFUbiquityRemotePeerState)initWithStoreName:(id)a3 andRemotePeerID:(id)a4 insertIntoManagedObjectContext:(id)a5
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"PFUbiquityRemotePeerState");
  if (v9)
  {
    v10 = [(NSManagedObject *)self initWithEntity:v9 insertIntoManagedObjectContext:a5];
    v11 = v10;
    if (v10)
    {
      [(PFUbiquityRemotePeerState *)v10 setStoreName:a3];
      [(PFUbiquityRemotePeerState *)v11 setPeerID:a4];
    }
  }
  else
  {

    return 0;
  }
  return v11;
}

@end