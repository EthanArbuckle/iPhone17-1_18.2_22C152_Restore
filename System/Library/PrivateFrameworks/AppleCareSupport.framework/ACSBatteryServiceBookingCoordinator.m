@interface ACSBatteryServiceBookingCoordinator
- (ACSBatteryServiceBookingCoordinator)init;
- (ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation ACSBatteryServiceBookingCoordinator

- (ACSBatteryServiceBookingCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  v2 = [(ACSBatteryServiceBookingCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    coordinator = v2->coordinator;
    v2->coordinator = (_ACSBatteryServiceBookingCoordinator *)v3;
  }
  return v2;
}

- (ACSBatteryServiceBookingCoordinator)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  v5 = [(ACSBatteryServiceBookingCoordinator *)&v11 init];
  if (v5)
  {
    objc_super v6 = [_ACSBatteryServiceBookingCoordinator alloc];
    v7 = [[_ACSBatteryServiceOptions alloc] initWithValues:v4];
    uint64_t v8 = [(_ACSBatteryServiceBookingCoordinator *)v6 initWithOptions:v7];
    coordinator = v5->coordinator;
    v5->coordinator = (_ACSBatteryServiceBookingCoordinator *)v8;
  }
  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->coordinator;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ACSBatteryServiceBookingCoordinator;
  if (-[ACSBatteryServiceBookingCoordinator respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void).cxx_destruct
{
}

@end