@interface ECBundlePageController
- (ECBundlePageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (ECWebContentObserver)webContentObserverProxy;
- (NSMutableArray)remoteContentURLs;
- (WKWebProcessPlugIn)plugIn;
- (WKWebProcessPlugInBrowserContextController)controller;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
- (void)invalidate;
- (void)setWebContentObserverProxy:(id)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
@end

@implementation ECBundlePageController

- (ECBundlePageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ECBundlePageController;
  v8 = [(ECBundlePageController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_plugIn, v6);
    objc_storeStrong((id *)&v9->_controller, a4);
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteContentURLs = v9->_remoteContentURLs;
    v9->_remoteContentURLs = v10;

    [(WKWebProcessPlugInBrowserContextController *)v9->_controller setLoadDelegate:v9];
  }

  return v9;
}

- (void)invalidate
{
}

- (ECWebContentObserver)webContentObserverProxy
{
  webContentObserverProxy = self->_webContentObserverProxy;
  if (!webContentObserverProxy)
  {
    v4 = [(ECBundlePageController *)self controller];
    v5 = [v4 _remoteObjectRegistry];
    id v6 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___ECWebContentObserver];
    id v7 = [v5 remoteObjectProxyWithInterface:v6];
    v8 = self->_webContentObserverProxy;
    self->_webContentObserverProxy = v7;

    webContentObserverProxy = self->_webContentObserverProxy;
  }
  return webContentObserverProxy;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v13 = a4;
  id v6 = [a3 mainFrame];

  id v7 = v13;
  if (v6 == v13)
  {
    v8 = self->_remoteContentURLs;
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    remoteContentURLs = self->_remoteContentURLs;
    self->_remoteContentURLs = v9;

    v11 = [(ECBundlePageController *)self webContentObserverProxy];
    v12 = [v13 URL];
    [v11 baseURL:v12 didRequestRemoteContentURLs:v8];

    id v7 = v13;
  }
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  id v8 = a6;
  v9 = [v8 URL];
  if ((objc_msgSend(v9, "ef_hasScheme:", @"https") & 1) != 0
    || objc_msgSend(v9, "ef_hasScheme:", @"http"))
  {
    [(NSMutableArray *)self->_remoteContentURLs addObject:v9];
    id v10 = 0;
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (WKWebProcessPlugIn)plugIn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugIn);
  return (WKWebProcessPlugIn *)WeakRetained;
}

- (WKWebProcessPlugInBrowserContextController)controller
{
  return self->_controller;
}

- (void)setWebContentObserverProxy:(id)a3
{
}

- (NSMutableArray)remoteContentURLs
{
  return self->_remoteContentURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webContentObserverProxy, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_plugIn);
  objc_storeStrong((id *)&self->_remoteContentURLs, 0);
}

@end