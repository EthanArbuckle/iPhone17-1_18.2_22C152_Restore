@interface FPUIActionRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (FPUIActionRemoteViewControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation FPUIActionRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E926D40];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E929F28];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FPUIActionRemoteViewController;
  id v4 = a3;
  [(_UIRemoteViewController *)&v6 viewServiceDidTerminateWithError:v4];
  v5 = [(FPUIActionRemoteViewController *)self delegate];
  [v5 remoteActionControllerDidFinishAction:self error:v4];
}

- (FPUIActionRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPUIActionRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end