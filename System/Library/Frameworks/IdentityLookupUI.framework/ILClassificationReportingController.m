@interface ILClassificationReportingController
- (ILClassificationReportingController)init;
- (ILClassificationReportingController)initWithHostViewController:(id)a3;
- (UIViewController)hostViewController;
- (id)completion;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)reportResponse:(id)a3 forExtension:(id)a4 withCompletion:(id)a5;
- (void)reportResponseViaNetwork:(id)a3 forExtension:(id)a4 withCompletion:(id)a5;
- (void)reportResponseViaSMS:(id)a3 forExtension:(id)a4 withCompletion:(id)a5;
- (void)setCompletion:(id)a3;
@end

@implementation ILClassificationReportingController

- (ILClassificationReportingController)initWithHostViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ILClassificationReportingController;
  v5 = [(ILClassificationReportingController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostViewController, v4);
  }

  return v6;
}

- (ILClassificationReportingController)init
{
  return 0;
}

- (void)reportResponse:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = ILDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_2375F8000, v11, OS_LOG_TYPE_DEFAULT, "response: %@ extension:%@", buf, 0x16u);
  }

  v12 = [v9 networkReportDestination];
  uint64_t v13 = [v9 SMSReportDestination];
  v14 = (void *)v13;
  if (v12)
  {
    [(ILClassificationReportingController *)self reportResponseViaNetwork:v8 forExtension:v9 withCompletion:v10];
  }
  else if (v13)
  {
    [(ILClassificationReportingController *)self reportResponseViaSMS:v8 forExtension:v9 withCompletion:v10];
  }
  else
  {
    v15 = [NSString stringWithFormat:@"Extension: %@ did not specify SMS or network report destination", v9];
    v16 = ILDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ILClassificationReportingController reportResponse:forExtension:withCompletion:]((uint64_t)v15, v16);
    }

    v17 = (void *)MEMORY[0x263F087E8];
    v20 = @"Error";
    v21 = v15;
    v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v19 = [v17 errorWithDomain:@"com.apple.IdentityLookupUI.ILClassificationReportingController" code:0 userInfo:v18];
    v10[2](v10, v19);
  }
}

- (void)reportResponseViaNetwork:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x263F0EF78];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  v12 = ILDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v7 identifier];
    int v18 = 138412290;
    v19 = v13;
    _os_log_impl(&dword_2375F8000, v12, OS_LOG_TYPE_DEFAULT, "creating report request with identifier: %@", (uint8_t *)&v18, 0xCu);
  }
  id v14 = objc_alloc(MEMORY[0x263F0EF68]);
  v15 = [v7 identifier];
  v16 = [v10 userInfo];

  v17 = (void *)[v14 initWithExtensionIdentifier:v15 jsonDictionary:v16];
  [v11 performClassificationReportRequest:v17 completion:v9];
}

- (void)reportResponseViaSMS:(id)a3 forExtension:(id)a4 withCompletion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = a3;
  id v11 = [v8 SMSReportDestination];
  v12 = [v10 userString];

  if ([v11 length] && objc_msgSend(v12, "length"))
  {
    [(ILClassificationReportingController *)self setCompletion:v9];
    id v13 = objc_alloc_init((Class)CUTWeakLinkClass());
    id v14 = ILDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      _os_log_impl(&dword_2375F8000, v14, OS_LOG_TYPE_DEFAULT, "reporting classification via SMS to %@ (%@)", buf, 0x16u);
    }

    v22 = v11;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [v13 setRecipients:v15];

    [v13 setBody:v12];
    [v13 setMessageComposeDelegate:self];
    v16 = [(ILClassificationReportingController *)self hostViewController];
    [v16 presentViewController:v13 animated:1 completion:0];
    goto LABEL_10;
  }
  id v13 = [NSString stringWithFormat:@"Extension: %@ did not specify both SMS destination (%@) and userString (%@)", v8, v11, v12];
  v17 = ILDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[ILClassificationReportingController reportResponseViaSMS:forExtension:withCompletion:]((uint64_t)v13, v17);
  }

  if (v9)
  {
    int v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = @"Error";
    id v21 = v13;
    v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v19 = [v18 errorWithDomain:@"com.apple.IdentityLookupUI.ILClassificationReportingController" code:0 userInfo:v16];
    v9[2](v9, v19);

LABEL_10:
  }
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  v5 = ILDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2375F8000, v5, OS_LOG_TYPE_DEFAULT, "did finish sending message", v8, 2u);
  }

  v6 = [(ILClassificationReportingController *)self completion];

  if (v6)
  {
    id v7 = [(ILClassificationReportingController *)self completion];
    v7[2](v7, 0);

    [(ILClassificationReportingController *)self setCompletion:0];
  }
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (UIViewController *)WeakRetained;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_destroyWeak((id *)&self->_hostViewController);
}

- (void)reportResponse:(uint64_t)a1 forExtension:(NSObject *)a2 withCompletion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "error reporting response: %@", (uint8_t *)&v2, 0xCu);
}

- (void)reportResponseViaSMS:(uint64_t)a1 forExtension:(NSObject *)a2 withCompletion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2375F8000, a2, OS_LOG_TYPE_ERROR, "error reporting SMS response: %@", (uint8_t *)&v2, 0xCu);
}

@end