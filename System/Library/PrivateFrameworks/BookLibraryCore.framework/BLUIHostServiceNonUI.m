@interface BLUIHostServiceNonUI
- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4;
- (void)handleDialogRequest:(id)a3 withReply:(id)a4;
- (void)handleEngagementRequest:(id)a3 withReply:(id)a4;
@end

@implementation BLUIHostServiceNonUI

- (void)handleAuthenticateRequest:(id)a3 withReply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = BLDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use out-of-process authenticate", buf, 2u);
  }

  id v8 = objc_alloc(MEMORY[0x263F27B18]);
  v11 = objc_msgSend_initWithRequest_(v8, v9, (uint64_t)v6, v10);

  v15 = objc_msgSend_performAuthentication(v11, v12, v13, v14);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21E00E568;
  v19[3] = &unk_26448BBE0;
  id v20 = v5;
  id v16 = v5;
  objc_msgSend_addFinishBlock_(v15, v17, (uint64_t)v19, v18);
}

- (void)handleDialogRequest:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = BLDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use out-of-process dialog", buf, 2u);
  }

  id v8 = objc_alloc(MEMORY[0x263F27EB0]);
  v11 = objc_msgSend_initWithRequest_(v8, v9, (uint64_t)v5, v10);
  v15 = objc_msgSend_present(v11, v12, v13, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_21E00E714;
  v20[3] = &unk_26448BC08;
  id v21 = v5;
  id v22 = v6;
  id v16 = v6;
  id v17 = v5;
  objc_msgSend_addFinishBlock_(v15, v18, (uint64_t)v20, v19);
}

- (void)handleEngagementRequest:(id)a3 withReply:(id)a4
{
  id v4 = a4;
  id v5 = BLDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: Engagement request not supported for non-UI", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263F27E10]);
  v7 = BLError(0, @"Engagement request not supported for non-UI", 0);
  objc_msgSend_finishWithError_(v6, v8, (uint64_t)v7, v9);

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E00E97C;
  v13[3] = &unk_26448BC30;
  id v14 = v4;
  id v10 = v4;
  objc_msgSend_addFinishBlock_(v6, v11, (uint64_t)v13, v12);
}

@end