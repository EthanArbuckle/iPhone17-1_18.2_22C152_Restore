@interface FLHostViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (id)exportedInterface;
- (id)serviceViewControllerInterface;
@end

@implementation FLHostViewController

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4681B0];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D482930];
}

- (id)serviceViewControllerInterface
{
  v2 = objc_opt_class();

  return (id)[v2 serviceViewControllerInterface];
}

- (id)exportedInterface
{
  v2 = objc_opt_class();

  return (id)[v2 exportedInterface];
}

@end