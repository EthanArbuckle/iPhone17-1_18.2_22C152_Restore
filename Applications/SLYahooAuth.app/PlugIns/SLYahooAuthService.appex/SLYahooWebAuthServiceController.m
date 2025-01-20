@interface SLYahooWebAuthServiceController
- (SLYahooWebAuthServiceController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5 error:(id)a6;
@end

@implementation SLYahooWebAuthServiceController

- (SLYahooWebAuthServiceController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SLYahooWebAuthServiceController;
  v4 = [(SLYahooWebAuthServiceController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = (SL_OOPAWebViewController *)objc_alloc_init((Class)SL_OOPAWebViewController);
    webViewController = v4->_webViewController;
    v4->_webViewController = v5;

    [(SL_OOPAWebViewController *)v4->_webViewController setDelegate:v4];
  }
  return v4;
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)SLYahooWebAuthServiceController;
  [(SLYahooWebAuthServiceController *)&v20 loadView];
  v3 = [(SLYahooWebAuthServiceController *)self view];
  [v3 setOpaque:1];

  v4 = +[UIColor clearColor];
  v5 = [(SLYahooWebAuthServiceController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(SLYahooWebAuthServiceController *)self extensionContext];
  v7 = [v6 inputItems];
  objc_super v8 = [v7 firstObject];

  v9 = [v8 userInfo];
  _SLLog();
  v10 = [v9 objectForKeyedSubscript:@"description"];
  [(SL_OOPAWebViewController *)self->_webViewController setNavBarTitle:v10];

  v11 = [v9 objectForKeyedSubscript:@"username"];
  if (v11) {
    [(SL_OOPAWebViewController *)self->_webViewController setUsername:v11];
  }
  uint64_t v12 = objc_opt_class();
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v9 objectForKeyedSubscript:@"webClient"];
  id v19 = 0;
  v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v14 error:&v19];
  id v16 = v19;

  if (v16)
  {
    id v18 = v16;
    _SLLog();
  }
  -[SLYahooWebAuthServiceController pushViewController:animated:](self, "pushViewController:animated:", self->_webViewController, 0, v18);
  id v17 = [objc_alloc((Class)SLWebAuthFlowController) initWithWebClient:v15];
  [(SL_OOPAWebViewController *)self->_webViewController setAuthFlowDelegate:v17];
}

- (void)webViewController:(id)a3 didFinishWithSuccess:(BOOL)a4 response:(id)a5 error:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  v10 = v9;
  if (a5 || v7)
  {
    uint64_t v12 = +[NSKeyedArchiver archivedDataWithRootObject:a5 requiringSecureCoding:1 error:0];
    id v13 = [objc_alloc((Class)NSItemProvider) initWithItem:v12 typeIdentifier:kUTTypeData];
    id v20 = v13;
    v14 = +[NSArray arrayWithObjects:&v20 count:1];
    id v15 = objc_alloc_init((Class)NSExtensionItem);
    [v15 setAttachments:v14];
    _SLLog();
    id v16 = [(SLYahooWebAuthServiceController *)self extensionContext];
    id v19 = v15;
    id v17 = +[NSArray arrayWithObjects:&v19 count:1];
    [v16 completeRequestReturningItems:v17 completionHandler:&stru_100004178];
  }
  else
  {
    id v18 = v9;
    _SLLog();
    v11 = [(SLYahooWebAuthServiceController *)self extensionContext];
    [v11 cancelRequestWithError:v10];

    _SLLog();
  }
}

- (void).cxx_destruct
{
}

@end