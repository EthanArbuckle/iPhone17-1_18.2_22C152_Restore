@interface _MSRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (MSViewServiceHostProtocol)host;
- (void)requestDismiss;
- (void)setHost:(id)a3;
@end

@implementation _MSRemoteViewController

- (void)requestDismiss
{
  id v2 = [(_MSRemoteViewController *)self host];
  [v2 requestDismiss];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D98AD70];
}

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D99B948];
}

- (MSViewServiceHostProtocol)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (MSViewServiceHostProtocol *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (void).cxx_destruct
{
}

@end