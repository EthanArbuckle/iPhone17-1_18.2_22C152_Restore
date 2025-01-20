@interface CLSRemoteViewController
+ (id)exportedInterface;
+ (id)instantiateViewControllerWithInputItems:(id)a3 identifier:(id)a4 connectionHandler:(id)a5;
+ (id)serviceViewControllerInterface;
- (UIWindow)previousKeyWindow;
- (UIWindow)window;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentModallyInNewWindowWithCompletion:(id)a3;
- (void)setPreviousKeyWindow:(id)a3;
- (void)setWindow:(id)a3;
- (void)viewDidInvalidateIntrinsicContentSize;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation CLSRemoteViewController

+ (id)instantiateViewControllerWithInputItems:(id)a3 identifier:(id)a4 connectionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v10 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x263EFF9A0], v9, (uint64_t)a4, *MEMORY[0x263F07FE0]);
  id v26 = 0;
  v12 = objc_msgSend_extensionsWithMatchingAttributes_error_(MEMORY[0x263F08800], v11, (uint64_t)v10, &v26);
  id v15 = v26;
  if (v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    __int16 v29 = 2114;
    id v30 = v15;
    _os_log_error_impl(&dword_22BFA1000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to get privacy disclosure extension for attributes: %{public}@. Error: %{public}@", buf, 0x16u);
  }
  v16 = objc_msgSend_firstObject(v12, v13, v14);
  if (v16)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_22BFA52A0;
    v21[3] = &unk_264904EE0;
    v17 = &v22;
    id v22 = v8;
    objc_msgSend_instantiateViewControllerWithInputItems_listenerEndpoint_connectionHandler_(v16, v18, (uint64_t)v7, 0, v21);
    id v19 = v16;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22BFA5288;
    block[3] = &unk_264904F30;
    v17 = &v25;
    id v25 = v8;
    id v24 = v15;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }

  return v16;
}

- (void)viewDidInvalidateIntrinsicContentSize
{
  objc_msgSend_serviceViewControllerProxy(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_viewDidInvalidateIntrinsicContentSize(v5, v3, v4);
}

+ (id)serviceViewControllerInterface
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F08D80], sel_interfaceWithProtocol_, &unk_26DF7C648);
}

+ (id)exportedInterface
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F08D80], sel_interfaceWithProtocol_, &unk_26DF81CD8);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = v4;
  if (v4 && objc_msgSend_code(v4, v5, v6) != 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_error_impl(&dword_22BFA1000, &_os_log_internal, OS_LOG_TYPE_ERROR, "viewServiceDidTerminateWithError Terminated with error: %@", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)CLSRemoteViewController;
  [(_UIRemoteViewController *)&v8 viewServiceDidTerminateWithError:v7];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22BFA5510;
  v9[3] = &unk_264904F08;
  id v7 = v6;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  v8.receiver = self;
  v8.super_class = (Class)CLSRemoteViewController;
  [(CLSRemoteViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)presentModallyInNewWindowWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_22BFA5684;
  v6[3] = &unk_264904F30;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (UIWindow)previousKeyWindow
{
  return self->_previousKeyWindow;
}

- (void)setPreviousKeyWindow:(id)a3
{
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_previousKeyWindow, 0);
}

@end