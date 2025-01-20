@interface AKSurrogateAuthenticationIDGenerator
- (id)generateCheckinID;
@end

@implementation AKSurrogateAuthenticationIDGenerator

- (id)generateCheckinID
{
  return +[NSUUID UUID];
}

@end