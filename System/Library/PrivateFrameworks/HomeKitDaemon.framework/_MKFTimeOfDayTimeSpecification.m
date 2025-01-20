@interface _MKFTimeOfDayTimeSpecification
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFTimeOfDayTimeSpecificationDatabaseID)databaseID;
@end

@implementation _MKFTimeOfDayTimeSpecification

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DEA88;
}

- (MKFTimeOfDayTimeSpecificationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFTimeOfDayTimeSpecificationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFTimeOfDayTimeSpecification"];
}

@end