@interface EnergyWindowsTracker
- (EnergyWindowsTracker)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation EnergyWindowsTracker

- (EnergyWindowsTracker)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (EnergyWindowsTracker *)EnergyWindowsTracker.init(entity:insertInto:)(a3, a4);
}

@end