@interface AFShowNextEventRequest
- (id)createResponse;
@end

@implementation AFShowNextEventRequest

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

@end