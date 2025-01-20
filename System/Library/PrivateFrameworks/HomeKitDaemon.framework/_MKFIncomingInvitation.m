@interface _MKFIncomingInvitation
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFIncomingInvitationDatabaseID)databaseID;
@end

@implementation _MKFIncomingInvitation

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DE788;
}

- (MKFIncomingInvitationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFIncomingInvitationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFIncomingInvitation"];
}

@end