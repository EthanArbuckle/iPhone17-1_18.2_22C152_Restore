@interface INIntent(DBSmartWidget)
- (uint64_t)car_action;
- (uint64_t)car_people;
- (uint64_t)car_valid;
@end

@implementation INIntent(DBSmartWidget)

- (uint64_t)car_people
{
  return 0;
}

- (uint64_t)car_action
{
  return 0;
}

- (uint64_t)car_valid
{
  return 0;
}

@end