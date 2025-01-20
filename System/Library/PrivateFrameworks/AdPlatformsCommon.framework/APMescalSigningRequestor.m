@interface APMescalSigningRequestor
+ (BOOL)canShareConnection;
+ (id)machService;
- (APMescalSigningRequestor)init;
- (id)remoteObjectInterface;
- (id)signatureForData:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)signatureForData:(id)a3 completion:(id)a4;
- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5;
@end

@implementation APMescalSigningRequestor

- (APMescalSigningRequestor)init
{
  v3.receiver = self;
  v3.super_class = (Class)APMescalSigningRequestor;
  return [(APXPCActionRequester *)&v3 init];
}

- (void)signatureForData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v14 = objc_msgSend_remoteObjectProxy(self, v8, v9, v10, v11, v12, v13);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_226310784;
  v20[3] = &unk_26479BB90;
  id v21 = v6;
  id v15 = v6;
  objc_msgSend_signatureForData_completion_(v14, v16, (uint64_t)v7, (uint64_t)v20, v17, v18, v19);
}

- (id)signatureForData:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  double v19 = sub_2263109D8;
  v20 = sub_2263109E8;
  id v21 = 0;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v5, (uint64_t)&unk_26D9FF280, v6, v7, COERCE_DOUBLE(0x3032000000), v8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_226310AA0;
  v15[3] = &unk_26479BBB8;
  v15[4] = &v16;
  objc_msgSend_signatureForData_completion_(v9, v10, (uint64_t)v4, (uint64_t)v15, v11, COERCE_DOUBLE(3221225472), v12);

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (void)signatureForData:(id)a3 waitTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v16 = objc_msgSend_remoteObjectProxy(self, v10, v11, v12, v13, v14, v15);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_226310C58;
  v21[3] = &unk_26479BB90;
  id v22 = v8;
  id v17 = v8;
  objc_msgSend_signatureForData_waitTime_completion_(v16, v18, (uint64_t)v9, (uint64_t)v21, v19, a4, v20);
}

- (id)remoteObjectInterface
{
  return &unk_26DA0AC60;
}

- (void)connectionInterrupted
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_226303000, v2, OS_LOG_TYPE_DEFAULT, "Connection to MescalSigning in Daemon was interrupted.", v3, 2u);
  }
}

- (void)connectionInvalidated
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_226303000, v2, OS_LOG_TYPE_INFO, "Connection to MescalSigning in Daemon was invalidated.", v3, 2u);
  }
}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.mescalinterface";
}

@end