@interface AFGetTimerRequest
+ (BOOL)supportsSecureCoding;
- (id)createResponseWithTimer:(id)a3;
@end

@implementation AFGetTimerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createResponseWithTimer:(id)a3
{
  id v4 = a3;
  id v5 = [(AFSiriResponse *)[AFGetTimerResponse alloc] _initWithRequest:self];
  [v5 setTimer:v4];

  return v5;
}

@end