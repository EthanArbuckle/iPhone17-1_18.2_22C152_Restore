@interface UsagePointRecords
- (UsagePointRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation UsagePointRecords

- (UsagePointRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (UsagePointRecords *)UsagePointRecords.init(entity:insertInto:)(a3, a4);
}

@end