@interface LAPSPasscodeChangeAuthorizerBuilder
+ (id)authorizerWithOptions:(id)a3;
@end

@implementation LAPSPasscodeChangeAuthorizerBuilder

+ (id)authorizerWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [[LAPSPasscodeChangeAuthorizerDTOAdapter alloc] initWithOptions:v3];

  v5 = [[LAPSPasscodeChangeAuthorizerDispatchDecorator alloc] initWithAuthorizer:v4];

  return v5;
}

@end