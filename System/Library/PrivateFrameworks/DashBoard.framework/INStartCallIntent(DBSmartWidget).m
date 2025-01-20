@interface INStartCallIntent(DBSmartWidget)
- (id)car_action;
- (uint64_t)car_valid;
@end

@implementation INStartCallIntent(DBSmartWidget)

- (id)car_action
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 localizedStringForKey:@"SMARTWIDGET_CALL" value:&stru_26E13A820 table:@"CarPlayApp"];

  return v1;
}

- (uint64_t)car_valid
{
  return 1;
}

@end