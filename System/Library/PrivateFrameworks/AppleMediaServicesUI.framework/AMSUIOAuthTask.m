@interface AMSUIOAuthTask
- (AMSUIOAuthTask)initWithOAuthURL:(id)a3 customScheme:(id)a4 presentingViewController:(id)a5;
- (AMSUIOAuthTask)initWithOAuthURL:(id)a3 host:(id)a4 path:(id)a5 presentingViewController:(id)a6;
- (ASWebAuthenticationSessionCallback)callback;
- (NSURL)oAuthURL;
- (UIViewController)presentingViewController;
- (id)performTask;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)setCallback:(id)a3;
- (void)setOAuthURL:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation AMSUIOAuthTask

- (AMSUIOAuthTask)initWithOAuthURL:(id)a3 customScheme:(id)a4 presentingViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSUIOAuthTask;
  v12 = [(AMSTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_oAuthURL, a3);
    uint64_t v14 = [getASWebAuthenticationSessionCallbackClass() callbackWithCustomScheme:v10];
    callback = v13->_callback;
    v13->_callback = (ASWebAuthenticationSessionCallback *)v14;

    objc_storeStrong((id *)&v13->_presentingViewController, a5);
  }

  return v13;
}

- (AMSUIOAuthTask)initWithOAuthURL:(id)a3 host:(id)a4 path:(id)a5 presentingViewController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AMSUIOAuthTask;
  v15 = [(AMSTask *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_oAuthURL, a3);
    uint64_t v17 = [getASWebAuthenticationSessionCallbackClass() callbackWithHTTPSHost:v12 path:v13];
    callback = v16->_callback;
    v16->_callback = (ASWebAuthenticationSessionCallback *)v17;

    objc_storeStrong((id *)&v16->_presentingViewController, a6);
  }

  return v16;
}

- (id)performTask
{
  id v3 = objc_alloc_init(MEMORY[0x263F27D90]);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v4 = (void *)getASWebAuthenticationSessionClass_softClass;
  uint64_t v20 = getASWebAuthenticationSessionClass_softClass;
  if (!getASWebAuthenticationSessionClass_softClass)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getASWebAuthenticationSessionClass_block_invoke;
    v16[3] = &unk_2643E33D8;
    v16[4] = &v17;
    __getASWebAuthenticationSessionClass_block_invoke((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  v5 = v4;
  _Block_object_dispose(&v17, 8);
  id v6 = [v5 alloc];
  v7 = [(AMSUIOAuthTask *)self oAuthURL];
  v8 = [(AMSUIOAuthTask *)self callback];
  id v9 = [v3 completionHandlerAdapter];
  id v10 = (void *)[v6 initWithURL:v7 callback:v8 completionHandler:v9];

  [v10 setPresentationContextProvider:self];
  [v10 setPrefersEphemeralWebBrowserSession:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AMSUIOAuthTask_performTask__block_invoke;
  block[3] = &unk_2643E3118;
  id v15 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __29__AMSUIOAuthTask_performTask__block_invoke_2;
  v13[3] = &unk_2643E4120;
  v13[4] = self;
  [v3 addFinishBlock:v13];

  return v3;
}

uint64_t __29__AMSUIOAuthTask_performTask__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

void __29__AMSUIOAuthTask_performTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  v8 = (void *)v7;
  if (v5)
  {
    if (!v7)
    {
      v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = AMSLogKey();
      id v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        a1 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, a1];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      id v14 = };
      uint64_t v20 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      __int16 v23 = 2114;
      id v24 = v20;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Task finished successfully with a URL. url = %{public}@", buf, 0x16u);
      if (v10)
      {

        id v14 = (void *)a1;
      }
    }
  }
  else
  {
    if (!v7)
    {
      v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = AMSLogKey();
      v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        a1 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, a1];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      uint64_t v19 = };
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Task finished with error. error = %{public}@", buf, 0x16u);
      if (v15)
      {

        uint64_t v19 = (void *)a1;
      }
    }
  }
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = [(AMSUIOAuthTask *)self presentingViewController];
  v4 = [v3 view];
  id v5 = [v4 window];

  return v5;
}

- (NSURL)oAuthURL
{
  return self->_oAuthURL;
}

- (void)setOAuthURL:(id)a3
{
}

- (ASWebAuthenticationSessionCallback)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_oAuthURL, 0);
}

@end