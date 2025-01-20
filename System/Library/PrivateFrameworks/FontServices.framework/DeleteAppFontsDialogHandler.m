@interface DeleteAppFontsDialogHandler
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DeleteAppFontsDialogHandler)initWithCompletionHandler:(id)a3;
- (NSXPCListener)listener;
- (id)completionHandler;
- (void)doneWithDeleteAppFonts:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)showDialogWithUserInfo:(id)a3;
@end

@implementation DeleteAppFontsDialogHandler

- (DeleteAppFontsDialogHandler)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DeleteAppFontsDialogHandler;
  v5 = [(DeleteAppFontsDialogHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1BA995010](v4);
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v6;
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  v7 = [v5 interfaceWithProtocol:&unk_1F0DA3C08];
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)doneWithDeleteAppFonts:(BOOL)a3
{
  id completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a3);
  }
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;
}

- (void)showDialogWithUserInfo:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA6BB8];
  id v5 = a3;
  id v12 = (id)[[v4 alloc] initWithServiceName:@"com.apple.FontInstallViewService" viewControllerClassName:@"DeleteAppFontsMainController"];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA6BA8]);
  v7 = [MEMORY[0x1E4F29290] anonymousListener];
  [v7 setDelegate:self];
  v8 = [v7 endpoint];
  objc_super v9 = [v8 _endpoint];
  [v6 setXpcEndpoint:v9];

  v10 = (void *)[MEMORY[0x1E4FA6BC0] newHandleWithDefinition:v12 configurationContext:v6];
  id v11 = objc_alloc_init(MEMORY[0x1E4FA6B90]);
  [v11 setUserInfo:v5];

  [(DeleteAppFontsDialogHandler *)self setListener:v7];
  [v7 resume];
  [v10 activateWithContext:v11];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end