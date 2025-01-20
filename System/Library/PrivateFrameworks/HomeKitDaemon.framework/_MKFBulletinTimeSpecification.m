@interface _MKFBulletinTimeSpecification
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFBulletinTimeSpecificationDatabaseID)databaseID;
@end

@implementation _MKFBulletinTimeSpecification

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DE938;
}

- (MKFBulletinTimeSpecificationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFBulletinTimeSpecificationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFBulletinTimeSpecification"];
}

@end