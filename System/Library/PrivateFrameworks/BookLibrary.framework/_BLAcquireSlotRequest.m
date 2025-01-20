@interface _BLAcquireSlotRequest
- (_BLAcquireSlotRequest)initWithDeviceGUID:(id)a3;
- (void)_acquireSlotWithURL:(id)a3;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation _BLAcquireSlotRequest

- (_BLAcquireSlotRequest)initWithDeviceGUID:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BLAcquireSlotRequest;
  v5 = [(ICRequestOperation *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F89360]);
    uint64_t active = objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v6, v7, v8, v9);
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)active;

    uint64_t v15 = objc_msgSend_copy(v4, v12, v13, v14);
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v15;
  }
  return v5;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E61A42C;
  v8[3] = &unk_2644B5700;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_performRequestWithCompletionHandler_(self, v6, (uint64_t)v8, v7);
}

- (void)execute
{
  id v5 = objc_msgSend_defaultBag(MEMORY[0x263F2BA48], a2, v2, v3);
  objc_initWeak(&location, self);
  id v9 = objc_msgSend_acquireSlotURL(v5, v6, v7, v8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E61A57C;
  v12[3] = &unk_2644B5728;
  objc_copyWeak(&v13, &location);
  objc_msgSend_valueWithCompletion_(v9, v10, (uint64_t)v12, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_acquireSlotWithURL:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = v5;
  deviceGUID = self->_deviceGUID;
  if (deviceGUID) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)deviceGUID, @"guid");
  }
  v10 = objc_msgSend_deviceInfo(self->_requestContext, v6, (uint64_t)deviceGUID, v7);
  int isWatch = objc_msgSend_isWatch(v10, v11, v12, v13);

  if (isWatch)
  {
    objc_super v18 = objc_msgSend_sharedMonitor(MEMORY[0x263F89250], v15, v16, v17);
    v22 = objc_msgSend_pairedDeviceMediaGUID(v18, v19, v20, v21);

    if (objc_msgSend_length(v22, v23, v24, v25))
    {
      objc_msgSend_setObject_forKey_(v8, v26, (uint64_t)v22, @"companion-guid");
    }
    else
    {
      v27 = BLHLSKeyFetchingLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v53 = self;
        _os_log_impl(&dword_21E616000, v27, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain companion guid.", buf, 0xCu);
      }
    }
  }
  id v51 = 0;
  v28 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v15, (uint64_t)v8, 100, 0, &v51);
  v29 = (_BLAcquireSlotRequest *)v51;
  v30 = v29;
  if (!v28 || v29)
  {
    v31 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v30;
      _os_log_impl(&dword_21E616000, v31, OS_LOG_TYPE_ERROR, "Failed to serialize property list for acquireSlot request! %@", buf, 0xCu);
    }
  }
  id v32 = objc_alloc(MEMORY[0x263F089E0]);
  v35 = objc_msgSend_initWithURL_(v32, v33, (uint64_t)v4, v34);
  objc_msgSend_setHTTPMethod_(v35, v36, @"POST", v37);
  objc_msgSend_setHTTPBody_(v35, v38, (uint64_t)v28, v39);
  objc_msgSend_setValue_forHTTPHeaderField_(v35, v40, *MEMORY[0x263F88F18], *MEMORY[0x263F88F20]);
  objc_initWeak((id *)buf, self);
  id v41 = objc_alloc(MEMORY[0x263F89368]);
  v43 = objc_msgSend_initWithURLRequest_requestContext_(v41, v42, (uint64_t)v35, (uint64_t)self->_requestContext);
  v47 = objc_msgSend_highPrioritySession(MEMORY[0x263F893B8], v44, v45, v46);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_21E61A9AC;
  v49[3] = &unk_2644B5750;
  objc_copyWeak(&v50, (id *)buf);
  objc_msgSend_enqueueDataRequest_withCompletionHandler_(v47, v48, (uint64_t)v43, (uint64_t)v49);
  objc_destroyWeak(&v50);

  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end