@interface MUIHello
- (NSString)world;
@end

@implementation MUIHello

- (NSString)world
{
  v2 = objc_alloc_init(MUIHelloSwift);
  v3 = [(MUIHelloSwift *)v2 world];

  return (NSString *)v3;
}

@end