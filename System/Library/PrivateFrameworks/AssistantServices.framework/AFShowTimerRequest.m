@interface AFShowTimerRequest
+ (BOOL)supportsSecureCoding;
- (id)createResponse;
@end

@implementation AFShowTimerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

@end