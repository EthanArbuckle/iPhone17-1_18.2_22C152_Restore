@interface MURemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldResignFirstResponder;
- (id)finishedWithResultsCompletionBlock;
- (int64_t)sandboxExtensionHandle;
- (void)beginDismissWithInfo:(id)a3;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)serviceDidFinishwithResults:(id)a3 andSandboxExtension:(id)a4;
- (void)setFinishedWithResultsCompletionBlock:(id)a3;
- (void)setSandboxExtensionHandle:(int64_t)a3;
- (void)setShouldResignFirstResponder:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MURemoteViewController

+ (id)serviceViewControllerInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1B9328];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:sel_animateExitWithInfo_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)exportedInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1A1698];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_serviceDidFinishwithResults_andSandboxExtension_ argumentIndex:0 ofReply:0];

  uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v4 forSelector:sel_serviceDidFinishwithResults_andSandboxExtension_ argumentIndex:1 ofReply:0];

  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MURemoteViewController;
  [(MURemoteViewController *)&v3 viewDidLoad];
  [(MURemoteViewController *)self setShouldResignFirstResponder:0];
  [(MURemoteViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MURemoteViewController;
  [(_UIRemoteViewController *)&v4 viewWillDisappear:a3];
  [(MURemoteViewController *)self setShouldResignFirstResponder:1];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  if (a3 != 1)
  {
    v8.receiver = self;
    v8.super_class = (Class)MURemoteViewController;
    if ([(MURemoteViewController *)&v8 respondsToSelector:sel_motionEnded_withEvent_])
    {
      v7.receiver = self;
      v7.super_class = (Class)MURemoteViewController;
      [(MURemoteViewController *)&v7 motionEnded:a3 withEvent:v6];
    }
  }
}

- (void)serviceDidFinishwithResults:(id)a3 andSandboxExtension:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    [v6 UTF8String];
    [(MURemoteViewController *)self setSandboxExtensionHandle:sandbox_extension_consume()];
  }
  objc_super v7 = [(MURemoteViewController *)self finishedWithResultsCompletionBlock];

  if (v7)
  {
    objc_super v8 = [(MURemoteViewController *)self finishedWithResultsCompletionBlock];
    ((void (**)(void, id))v8)[2](v8, v9);
  }
}

- (void)beginDismissWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 animateExitWithInfo:v4];

  if ([(MURemoteViewController *)self sandboxExtensionHandle])
  {
    [(MURemoteViewController *)self sandboxExtensionHandle];
    sandbox_extension_release();
    [(MURemoteViewController *)self setSandboxExtensionHandle:0];
  }
}

- (id)finishedWithResultsCompletionBlock
{
  return self->_finishedWithResultsCompletionBlock;
}

- (void)setFinishedWithResultsCompletionBlock:(id)a3
{
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (BOOL)shouldResignFirstResponder
{
  return self->_shouldResignFirstResponder;
}

- (void)setShouldResignFirstResponder:(BOOL)a3
{
  self->_shouldResignFirstResponder = a3;
}

- (void).cxx_destruct
{
}

@end