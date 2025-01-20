@interface UsageSummaryRecords
- (UsageSummaryRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation UsageSummaryRecords

- (UsageSummaryRecords)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (UsageSummaryRecords *)UsageSummaryRecords.init(entity:insertInto:)(a3, a4);
}

@end