@interface EnergySiteRecords
- (EnergySiteRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation EnergySiteRecords

- (EnergySiteRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (EnergySiteRecords *)EnergySiteRecords.init(entity:insertInto:)(a3, a4);
}

@end