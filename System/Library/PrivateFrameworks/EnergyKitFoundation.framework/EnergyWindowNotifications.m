@interface EnergyWindowNotifications
- (EnergyWindowNotifications)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation EnergyWindowNotifications

- (EnergyWindowNotifications)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (EnergyWindowNotifications *)EnergyWindowNotifications.init(entity:insertInto:)(a3, a4);
}

@end