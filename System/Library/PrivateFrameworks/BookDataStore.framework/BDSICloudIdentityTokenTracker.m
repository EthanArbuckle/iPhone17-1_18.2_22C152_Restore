@interface BDSICloudIdentityTokenTracker
- (BDSICloudIdentityToken)currentToken;
- (BDSICloudIdentityTokenTracker)initWithContainerURL:(id)a3 trackingLiverpool:(BOOL)a4;
- (BOOL)didUnacknowledgediCloudLogoutOccur;
- (BOOL)trackLiverpool;
- (NSMutableDictionary)plistContents;
- (NSURL)plistURL;
- (OS_dispatch_queue)dispatchQueue;
- (void)acknowledgeiCloudIdentity;
- (void)fetchCurrentToken;
- (void)forceUpdateTokenWithString:(id)a3;
- (void)setCurrentToken:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPlistContents:(id)a3;
- (void)setPlistURL:(id)a3;
- (void)setTrackLiverpool:(BOOL)a3;
@end

@implementation BDSICloudIdentityTokenTracker

- (BDSICloudIdentityTokenTracker)initWithContainerURL:(id)a3 trackingLiverpool:(BOOL)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BDSICloudIdentityTokenTracker;
  v7 = [(BDSICloudIdentityTokenTracker *)&v40 init];
  v14 = v7;
  if (v7)
  {
    v7->_trackLiverpool = a4;
    uint64_t v15 = objc_msgSend_URLByAppendingPathComponent_(v6, v8, @"BDSICloudIdentityToken.plist", v9, v10, v11, v12, v13);
    plistURL = v14->_plistURL;
    v14->_plistURL = (NSURL *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.iBooks.BDSICloudStatusMonitor.dispatchQueue", v18);
    dispatchQueue = v14->_dispatchQueue;
    v14->_dispatchQueue = (OS_dispatch_queue *)v19;

    v27 = objc_msgSend_dictionaryWithContentsOfURL_(NSDictionary, v21, (uint64_t)v14->_plistURL, v22, v23, v24, v25, v26);
    v35 = objc_msgSend_mutableCopy(v27, v28, v29, v30, v31, v32, v33, v34);
    v36 = v35;
    if (v35) {
      v37 = v35;
    }
    else {
      v37 = (NSMutableDictionary *)objc_opt_new();
    }
    plistContents = v14->_plistContents;
    v14->_plistContents = v37;
  }
  return v14;
}

- (void)fetchCurrentToken
{
  if (objc_msgSend_trackLiverpool(self, a2, v2, v3, v4, v5, v6, v7))
  {
    uint64_t v16 = objc_msgSend_tokenForCurrentIdentityIfCloudKitEnabled(BDSICloudIdentityToken, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v22 = [BDSICloudIdentityToken alloc];
    uint64_t v16 = objc_msgSend_initWithCurrentIdentity(v22, v23, v24, v25, v26, v27, v28, v29);
  }
  uint64_t v30 = (char *)v16;
  objc_msgSend_setCurrentToken_(self, v30, (uint64_t)v30, v17, v18, v19, v20, v21);
}

- (void)forceUpdateTokenWithString:(id)a3
{
  id v24 = a3;
  if (v24)
  {
    uint64_t v10 = [BDSICloudIdentityToken alloc];
    uint64_t v17 = objc_msgSend_initWithToken_(v10, v11, (uint64_t)v24, v12, v13, v14, v15, v16);
    objc_msgSend_setCurrentToken_(self, v18, (uint64_t)v17, v19, v20, v21, v22, v23);
  }
  else
  {
    objc_msgSend_setCurrentToken_(self, v4, 0, v5, v6, v7, v8, v9);
  }
}

- (BOOL)didUnacknowledgediCloudLogoutOccur
{
  uint64_t v2 = self;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_initWeak(&location, self);
  uint64_t v10 = objc_msgSend_dispatchQueue(v2, v3, v4, v5, v6, v7, v8, v9);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2360EB8E0;
  v12[3] = &unk_264CA1570;
  objc_copyWeak(&v13, &location);
  v12[4] = v2;
  v12[5] = &v15;
  dispatch_sync(v10, v12);

  LOBYTE(v2) = *((unsigned char *)v16 + 24);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);
  return (char)v2;
}

- (void)acknowledgeiCloudIdentity
{
  uint64_t v3 = BDSCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2360BC000, v3, OS_LOG_TYPE_DEFAULT, "acknowledgeiCloudIdentity", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  uint64_t v11 = objc_msgSend_dispatchQueue(self, v4, v5, v6, v7, v8, v9, v10);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2360EBB80;
  v12[3] = &unk_264CA1598;
  objc_copyWeak(&v13, buf);
  v12[4] = self;
  dispatch_sync(v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (NSMutableDictionary)plistContents
{
  return self->_plistContents;
}

- (void)setPlistContents:(id)a3
{
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (void)setPlistURL:(id)a3
{
}

- (BDSICloudIdentityToken)currentToken
{
  return self->_currentToken;
}

- (void)setCurrentToken:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)trackLiverpool
{
  return self->_trackLiverpool;
}

- (void)setTrackLiverpool:(BOOL)a3
{
  self->_trackLiverpool = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_plistContents, 0);
}

@end