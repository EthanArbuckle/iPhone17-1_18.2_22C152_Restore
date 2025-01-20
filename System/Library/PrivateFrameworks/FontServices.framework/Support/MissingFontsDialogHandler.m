@interface MissingFontsDialogHandler
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FontServicesDaemon)daemon;
- (MissingFontsDialogHandler)initWithFontServicesDaemon:(id)a3 completionHandler:(id)a4;
- (NSXPCListener)listener;
- (id)completionHandler;
- (void)doneWithMissingFonts:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setListener:(id)a3;
- (void)showDialogWithUserInfo:(id)a3 sceneID:(id)a4 appID:(id)a5;
@end

@implementation MissingFontsDialogHandler

- (MissingFontsDialogHandler)initWithFontServicesDaemon:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MissingFontsDialogHandler;
  v9 = [(MissingFontsDialogHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }
  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontInstallViewServiceProtocol];
  [v5 setExportedInterface:v6];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)doneWithMissingFonts:(id)a3
{
  id completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a3);
  }
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;
}

- (void)showDialogWithUserInfo:(id)a3 sceneID:(id)a4 appID:(id)a5
{
  id v6 = a3;
  id v13 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.FontInstallViewService" viewControllerClassName:@"FontInstallMissingController"];
  id v7 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v8 = +[NSXPCListener anonymousListener];
  [v8 setDelegate:self];
  v9 = [v8 endpoint];
  v10 = [v9 _endpoint];
  [v7 setXpcEndpoint:v10];

  id v11 = +[SBSRemoteAlertHandle newHandleWithDefinition:v13 configurationContext:v7];
  id v12 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v12 setUserInfo:v6];

  [(MissingFontsDialogHandler *)self setListener:v8];
  [v8 resume];
  [v11 activateWithContext:v12];
}

- (FontServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
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
  return (NSXPCListener *)objc_getProperty(self, a2, 24, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end