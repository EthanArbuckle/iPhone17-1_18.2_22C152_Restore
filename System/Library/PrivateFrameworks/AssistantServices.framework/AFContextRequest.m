@interface AFContextRequest
- (BOOL)_makeAppFrontmost;
- (id)createResponseWithContext:(id)a3;
@end

@implementation AFContextRequest

- (id)createResponseWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[AFContextResponse alloc] _initWithRequest:self context:v4];

  return v5;
}

- (BOOL)_makeAppFrontmost
{
  return 0;
}

@end