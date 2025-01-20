@interface STKGenerativeModelsAvailability
+ (BOOL)isAvailable;
- (STKGenerativeModelsAvailability)init;
@end

@implementation STKGenerativeModelsAvailability

+ (BOOL)isAvailable
{
  return sub_2452BD870() & 1;
}

- (STKGenerativeModelsAvailability)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STKGenerativeModelsAvailability();
  return [(STKGenerativeModelsAvailability *)&v3 init];
}

@end