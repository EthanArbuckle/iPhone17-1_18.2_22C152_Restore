@interface AFConnectionAvailabilityObserver
- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4;
@end

@implementation AFConnectionAvailabilityObserver

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
}

void __68__AFConnectionAvailabilityObserver_networkAvailability_isAvailable___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"AFNetworkAvailabilityDidChangeNotification" object:0];
}

@end