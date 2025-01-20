@interface _DKSyncPeerMO
+ (id)fetchRequest;
@end

@implementation _DKSyncPeerMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SyncPeer"];
}

@end