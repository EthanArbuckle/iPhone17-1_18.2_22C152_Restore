@interface FPUIActionExtensionViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_extensionImplementsSelector:(SEL)a3;
- (unint64_t)_browserUserInterfaceStyle;
- (void)_configureWithDomainIdentifier:(id)a3;
- (void)_prepareAuthenticationUsingServerURL:(id)a3;
- (void)_prepareAuthenticationUsingURL:(id)a3;
- (void)_prepareForActionWithIdentifier:(id)a3 items:(id)a4;
- (void)_prepareForError:(id)a3;
- (void)_prepareForServerCreation;
- (void)_setBrowserUserInterfaceStyle:(unint64_t)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)prepareAuthenticationUsingServerURL:(id)a3;
@end

@implementation FPUIActionExtensionViewController

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E926D40];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FPUIActionExtensionViewController;
  [(FPUIActionExtensionViewController *)&v6 beginRequestWithExtensionContext:v4];
  v5 = (void *)gExtensionContext;
  gExtensionContext = (uint64_t)v4;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E929F28];
}

- (void)_setBrowserUserInterfaceStyle:(unint64_t)a3
{
  if (self->_browserUserInterfaceStyle != a3)
  {
    self->_browserUserInterfaceStyle = a3;
    [(FPUIActionExtensionViewController *)self _browserUserInterfaceStyleDidChange];
  }
}

- (BOOL)_extensionImplementsSelector:(SEL)a3
{
  uint64_t v4 = -[FPUIActionExtensionViewController methodForSelector:](self, "methodForSelector:");
  return v4 != +[FPUIActionExtensionViewController instanceMethodForSelector:a3];
}

- (void)_prepareForActionWithIdentifier:(id)a3 items:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__FPUIActionExtensionViewController__prepareForActionWithIdentifier_items___block_invoke;
  v10[3] = &unk_264C6CDD8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  CallBlockOnMainThread(v10);
}

uint64_t __75__FPUIActionExtensionViewController__prepareForActionWithIdentifier_items___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForActionWithIdentifier:*(void *)(a1 + 40) itemIdentifiers:*(void *)(a1 + 48)];
}

- (void)_prepareForServerCreation
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__FPUIActionExtensionViewController__prepareForServerCreation__block_invoke;
  v2[3] = &unk_264C6CC98;
  v2[4] = self;
  CallBlockOnMainThread(v2);
}

uint64_t __62__FPUIActionExtensionViewController__prepareForServerCreation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareForServerCreation];
}

- (void)_prepareAuthenticationUsingURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__FPUIActionExtensionViewController__prepareAuthenticationUsingURL___block_invoke;
  v6[3] = &unk_264C6CBF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CallBlockOnMainThread(v6);
}

uint64_t __68__FPUIActionExtensionViewController__prepareAuthenticationUsingURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAuthenticationUsingURL:*(void *)(a1 + 40)];
}

- (void)_prepareAuthenticationUsingServerURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__FPUIActionExtensionViewController__prepareAuthenticationUsingServerURL___block_invoke;
  v6[3] = &unk_264C6CBF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CallBlockOnMainThread(v6);
}

uint64_t __74__FPUIActionExtensionViewController__prepareAuthenticationUsingServerURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareAuthenticationUsingServerURL:*(void *)(a1 + 40)];
}

- (void)_configureWithDomainIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__FPUIActionExtensionViewController__configureWithDomainIdentifier___block_invoke;
  v6[3] = &unk_264C6CBF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CallBlockOnMainThread(v6);
}

void __68__FPUIActionExtensionViewController__configureWithDomainIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) extensionContext];
  [v2 setDomainIdentifier:v1];
}

- (void)_prepareForError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__FPUIActionExtensionViewController__prepareForError___block_invoke;
  v6[3] = &unk_264C6CBF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CallBlockOnMainThread(v6);
}

uint64_t __54__FPUIActionExtensionViewController__prepareForError___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _extensionImplementsSelector:sel_prepareForError_] & 1) != 0
    || ![*(id *)(a1 + 32) _extensionImplementsSelector:sel_prepareForAuthentication])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 prepareForError:v5];
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    return [v2 prepareForAuthentication];
  }
}

- (void)prepareAuthenticationUsingServerURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __73__FPUIActionExtensionViewController_prepareAuthenticationUsingServerURL___block_invoke;
  v6[3] = &unk_264C6CBF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  CallBlockOnMainThread(v6);
}

void __73__FPUIActionExtensionViewController_prepareAuthenticationUsingServerURL___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) extensionContext];
  [v2 setInitialURL:v1];
}

- (unint64_t)_browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

@end