@interface BLUIHostServiceProxy
- (BLDownloadQueue)downloadQueue;
- (BLDownloadQueueUIManagerProtocol)uiManagerDelegate;
- (BLRequest)request;
- (BLUIHostServiceNonUI)fallback;
- (BLUIHostServiceProxy)initWithUIManager:(id)a3 forRequest:(id)a4 inDownloadQueue:(id)a5;
- (id)_topMostViewController;
- (id)_window;
- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4;
- (void)handleDialogRequest:(id)a3 withReply:(id)a4;
- (void)handleEngagementRequest:(id)a3 withReply:(id)a4;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation BLUIHostServiceProxy

- (BLUIHostServiceProxy)initWithUIManager:(id)a3 forRequest:(id)a4 inDownloadQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BLUIHostServiceProxy;
  v11 = [(BLUIHostServiceProxy *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_request, v9);
    objc_storeWeak((id *)&v12->_downloadQueue, v10);
    objc_storeWeak((id *)&v12->_uiManagerDelegate, v8);
    v13 = objc_alloc_init(BLUIHostServiceNonUI);
    fallback = v12->_fallback;
    v12->_fallback = v13;
  }
  return v12;
}

- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E617BDC;
  v16[3] = &unk_2644B5588;
  v16[4] = self;
  id v8 = v7;
  id v18 = v8;
  id v9 = v6;
  id v17 = v9;
  v13 = (void (**)(void))MEMORY[0x223C2CBB0](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], v10, v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_21E617F80;
      v14[3] = &unk_2644B55B0;
      v15 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
  }
}

- (void)handleDialogRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E6180E4;
  v16[3] = &unk_2644B5588;
  v16[4] = self;
  id v8 = v7;
  id v18 = v8;
  id v9 = v6;
  id v17 = v9;
  v13 = (void (**)(void))MEMORY[0x223C2CBB0](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], v10, v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_21E618528;
      v14[3] = &unk_2644B55B0;
      v15 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
  }
}

- (void)handleEngagementRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E61868C;
  v16[3] = &unk_2644B5588;
  v16[4] = self;
  id v8 = v7;
  id v18 = v8;
  id v9 = v6;
  id v17 = v9;
  v13 = (void (**)(void))MEMORY[0x223C2CBB0](v16);
  if (v13)
  {
    if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], v10, v11, v12))
    {
      v13[2](v13);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_21E618BEC;
      v14[3] = &unk_2644B55B0;
      v15 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v14);
    }
  }
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (id)_window
{
  sub_21E619460();
  if (objc_opt_class())
  {
    id v2 = sub_21E619460();
    id v6 = objc_msgSend_sharedApplication(v2, v3, v4, v5);
    id v10 = objc_msgSend_keyWindow(v6, v7, v8, v9);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)_topMostViewController
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_21E618E1C;
  uint64_t v11 = sub_21E618E2C;
  id v12 = 0;
  sub_21E619460();
  if (objc_opt_class() && (sub_21E61959C(), objc_opt_class()) && (sub_21E619814(), objc_opt_class()))
  {
    id v2 = _os_activity_create(&dword_21E616000, "Find Top Most View Controller", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E618E34;
    block[3] = &unk_2644B5650;
    block[4] = &v7;
    os_activity_apply(v2, block);
  }
  else
  {
    id v2 = BLDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_21E616000, v2, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link UIKit!", v5, 2u);
    }
  }

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (BLDownloadQueue)downloadQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadQueue);
  return (BLDownloadQueue *)WeakRetained;
}

- (BLUIHostServiceNonUI)fallback
{
  return (BLUIHostServiceNonUI *)objc_getProperty(self, a2, 16, 1);
}

- (BLRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (BLRequest *)WeakRetained;
}

- (BLDownloadQueueUIManagerProtocol)uiManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiManagerDelegate);
  return (BLDownloadQueueUIManagerProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiManagerDelegate);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_destroyWeak((id *)&self->_downloadQueue);
}

@end