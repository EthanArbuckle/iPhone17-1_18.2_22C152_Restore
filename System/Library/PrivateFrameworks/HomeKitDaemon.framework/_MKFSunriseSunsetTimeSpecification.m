@interface _MKFSunriseSunsetTimeSpecification
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFSunriseSunsetTimeSpecificationDatabaseID)databaseID;
@end

@implementation _MKFSunriseSunsetTimeSpecification

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFSunriseSunsetTimeSpecification"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E581590;
}

- (MKFSunriseSunsetTimeSpecificationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFSunriseSunsetTimeSpecificationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

@end