@interface BLSecureOfflineKeyDeliveryRequest
- (BLSecureOfflineKeyDeliveryRequest)init;
- (BLSecureOfflineKeyDeliveryRequest)initWithRequestContext:(id)a3;
- (MPMediaItem)mediaItem;
- (NSString)identity;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (id)_deviceGUID;
- (void)_createSPCData;
- (void)_ksq_fetchCKCDataUsingSPC:(id)a3 forKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setKeyCertificateURL:(id)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setMediaItem:(id)a3;
@end

@implementation BLSecureOfflineKeyDeliveryRequest

- (BLSecureOfflineKeyDeliveryRequest)initWithRequestContext:(id)a3
{
  id v5 = a3;
  uint64_t v9 = objc_msgSend_init(self, v6, v7, v8);
  v10 = (BLSecureOfflineKeyDeliveryRequest *)v9;
  if (v9) {
    objc_storeStrong((id *)(v9 + 320), a3);
  }

  return v10;
}

- (BLSecureOfflineKeyDeliveryRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)BLSecureOfflineKeyDeliveryRequest;
  id v2 = [(ICRequestOperation *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iBooks.HLSKeySession", v3);
    id v5 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v4;

    uint64_t v8 = objc_msgSend_contentKeySessionWithKeySystem_(MEMORY[0x263EFA6E0], v6, *MEMORY[0x263EF97F8], v7);
    uint64_t v9 = (void *)*((void *)v2 + 38);
    *((void *)v2 + 38) = v8;

    objc_msgSend_setDelegate_queue_(*((void **)v2 + 38), v10, (uint64_t)v2, *((void *)v2 + 39));
  }
  return (BLSecureOfflineKeyDeliveryRequest *)v2;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_bl_sharedHLSKeyRequestOperationQueue(MEMORY[0x263F08A48], v5, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E61CAD8;
  v11[3] = &unk_2644B5700;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v10, (uint64_t)v8, (uint64_t)v11);
}

- (void)execute
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (self->_keyCertificateURL && self->_keyServerURL)
  {
    v3 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(self->_mediaItem, v4, v5, v6);
      uint64_t v7 = (BLSecureOfflineKeyDeliveryRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v7;
      _os_log_impl(&dword_21E616000, v3, OS_LOG_TYPE_DEFAULT, "Fetching key request certificate for '%@'", buf, 0xCu);
    }
    v11 = objc_msgSend_highPrioritySession(MEMORY[0x263F893B8], v8, v9, v10);
    id v12 = objc_alloc(MEMORY[0x263F089E0]);
    v15 = objc_msgSend_initWithURL_(v12, v13, (uint64_t)self->_keyCertificateURL, v14);
    objc_msgSend_setHTTPMethod_(v15, v16, @"GET", v17);
    id v18 = objc_alloc(MEMORY[0x263F89368]);
    v20 = objc_msgSend_initWithURLRequest_requestContext_(v18, v19, (uint64_t)v15, (uint64_t)self->_requestContext);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_21E61CE20;
    v28[3] = &unk_2644B5890;
    v28[4] = self;
    objc_msgSend_enqueueDataRequest_withCompletionHandler_(v11, v21, (uint64_t)v20, (uint64_t)v28);
  }
  else
  {
    v22 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      keyCertificateURL = self->_keyCertificateURL;
      keyServerURL = self->_keyServerURL;
      *(_DWORD *)buf = 138543874;
      v30 = self;
      __int16 v31 = 2114;
      v32 = keyCertificateURL;
      __int16 v33 = 2114;
      v34 = keyServerURL;
      _os_log_impl(&dword_21E616000, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: Missing certificate URL: %{public}@, key server URL: %{public}@", buf, 0x20u);
    }

    v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v25, *MEMORY[0x263F88F00], -7101, 0);
    objc_msgSend_finishWithError_(self, v26, (uint64_t)v11, v27);
  }
}

- (id)_deviceGUID
{
  if (qword_267D3B060 != -1) {
    dispatch_once(&qword_267D3B060, &unk_26CF8FA60);
  }
  id v2 = (void *)qword_267D3B058;
  return v2;
}

- (void)_createSPCData
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend_title(self->_mediaItem, v4, v5, v6);
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_21E616000, v3, OS_LOG_TYPE_DEFAULT, "Creating SPC data for '%@'", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend_processContentKeyRequestWithIdentifier_initializationData_options_(self->_keySession, v8, (uint64_t)self->_identity, 0, 0);
}

- (void)_ksq_fetchCKCDataUsingSPC:(id)a3 forKeyRequest:(id)a4
{
  v110[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  if (v6)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v11 = objc_msgSend_initWithObjectsAndKeys_(v8, v9, (uint64_t)&unk_26CF91340, v10, @"id", 0);
    uint64_t v18 = objc_msgSend_identity(self, v12, v13, v14);
    if (v18) {
      objc_msgSend_setObject_forKey_(v11, v15, v18, @"uri");
    }
    v96 = (void *)v18;
    if (objc_msgSend_length(v6, v15, v16, v17))
    {
      v21 = objc_msgSend_base64EncodedStringWithOptions_(v6, v19, 0, v20);
      if (objc_msgSend_length(v21, v22, v23, v24)) {
        objc_msgSend_setObject_forKey_(v11, v25, (uint64_t)v21, @"spc");
      }
    }
    objc_msgSend_setObject_forKey_(v11, v19, MEMORY[0x263EFFA88], @"offline");
    uint64_t v32 = objc_msgSend__deviceGUID(self, v26, v27, v28);
    if (v32) {
      objc_msgSend_setObject_forKey_(v11, v29, v32, @"guid");
    }
    v95 = (void *)v32;
    __int16 v33 = objc_msgSend_deviceInfo(self->_requestContext, v29, v30, v31);
    int isWatch = objc_msgSend_isWatch(v33, v34, v35, v36);

    if (isWatch)
    {
      v41 = objc_msgSend_sharedMonitor(MEMORY[0x263F89250], v38, v39, v40);
      v45 = objc_msgSend_pairedDeviceMediaGUID(v41, v42, v43, v44);

      if (objc_msgSend_length(v45, v46, v47, v48))
      {
        objc_msgSend_setObject_forKey_(v11, v49, (uint64_t)v45, @"companion-guid");
      }
      else
      {
        v54 = BLHLSKeyFetchingLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v103 = self;
          _os_log_impl(&dword_21E616000, v54, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain companion guid.", buf, 0xCu);
        }
      }
    }
    v109 = @"fairplay-streaming-request";
    v108[0] = &unk_26CF91358;
    v107[0] = @"version";
    v107[1] = @"streaming-keys";
    v106 = v11;
    v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)&v106, 1);
    v108[1] = v55;
    v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v56, (uint64_t)v108, (uint64_t)v107, 2);
    v110[0] = v57;
    v59 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v58, (uint64_t)v110, (uint64_t)&v109, 1);

    id v99 = 0;
    v61 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x263F08900], v60, (uint64_t)v59, 0, &v99);
    id v62 = v99;
    v63 = BLHLSKeyFetchingLog();
    v64 = v63;
    if (!v61 || v62)
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v103 = self;
        __int16 v104 = 2112;
        id v105 = v62;
        _os_log_impl(&dword_21E616000, v64, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to serialize key server request data with error:  %@", buf, 0x16u);
      }

      v89 = (void *)MEMORY[0x263F087E8];
      uint64_t v90 = *MEMORY[0x263F2BA28];
      if (v62)
      {
        uint64_t v100 = *MEMORY[0x263F08608];
        id v101 = v62;
        v91 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v88, (uint64_t)&v101, (uint64_t)&v100, 1);
        v72 = objc_msgSend_errorWithDomain_code_userInfo_(v89, v92, v90, 2, v91);
      }
      else
      {
        v72 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v88, *MEMORY[0x263F2BA28], 2, 0);
      }
      v87 = v95;
      objc_msgSend_finishWithError_(self, v93, (uint64_t)v72, v94);
      v86 = v96;
    }
    else
    {
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_title(self->_mediaItem, v65, v66, v67);
        v68 = (BLSecureOfflineKeyDeliveryRequest *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v103 = v68;
        _os_log_impl(&dword_21E616000, v64, OS_LOG_TYPE_DEFAULT, "Performing offline key request for '%@'", buf, 0xCu);
      }
      id v69 = objc_alloc(MEMORY[0x263F089E0]);
      v72 = objc_msgSend_initWithURL_(v69, v70, (uint64_t)self->_keyServerURL, v71);
      objc_msgSend_setHTTPBody_(v72, v73, (uint64_t)v61, v74);
      objc_msgSend_setHTTPMethod_(v72, v75, @"POST", v76);
      objc_msgSend_setValue_forHTTPHeaderField_(v72, v77, *MEMORY[0x263F88F10], *MEMORY[0x263F88F20]);
      id v78 = objc_alloc(MEMORY[0x263F89368]);
      v80 = objc_msgSend_initWithURLRequest_requestContext_(v78, v79, (uint64_t)v72, (uint64_t)self->_requestContext);
      v84 = objc_msgSend_highPrioritySession(MEMORY[0x263F893B8], v81, v82, v83);
      v97[0] = MEMORY[0x263EF8330];
      v97[1] = 3221225472;
      v97[2] = sub_21E61D768;
      v97[3] = &unk_2644B58E0;
      v97[4] = self;
      id v98 = v7;
      objc_msgSend_enqueueDataRequest_withCompletionHandler_(v84, v85, (uint64_t)v80, (uint64_t)v97);

      v87 = v95;
      v86 = v96;
    }
  }
  else
  {
    v50 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v103 = self;
      _os_log_impl(&dword_21E616000, v50, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to generate server playback context data", buf, 0xCu);
    }

    uint64_t v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v51, *MEMORY[0x263F2BA28], 2, 0);
    objc_msgSend_finishWithError_(self, v52, (uint64_t)v11, v53);
  }
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  id v7 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_INFO, "Content key request provided", buf, 2u);
  }

  if (self->_activeKeyRequest)
  {
    id v8 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E616000, v8, OS_LOG_TYPE_DEFAULT, "Skipping provided content key request", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activeKeyRequest, a4);
    id v15 = 0;
    char v11 = objc_msgSend_respondByRequestingPersistableContentKeyRequestAndReturnError_(v6, v9, (uint64_t)&v15, v10);
    id v8 = v15;
    if ((v11 & 1) == 0)
    {
      id v12 = BLHLSKeyFetchingLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v8;
        _os_log_impl(&dword_21E616000, v12, OS_LOG_TYPE_ERROR, "Request for persistable content key request failed with error:  %@", buf, 0xCu);
      }

      objc_msgSend_finishWithError_(self, v13, (uint64_t)v8, v14);
    }
  }
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  id v7 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_DEFAULT, "Persistable content key request provided", buf, 2u);
  }

  if (self->_activePersistableKeyRequest)
  {
    id v8 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E616000, v8, OS_LOG_TYPE_DEFAULT, "Skipping provided persistable content key request", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activePersistableKeyRequest, a4);
    id v8 = objc_msgSend_dataUsingEncoding_(self->_identity, v9, 4, v10);
    certificateData = self->_certificateData;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_21E61E2D0;
    v13[3] = &unk_2644B5908;
    v13[4] = self;
    id v14 = v6;
    objc_msgSend_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler_(v14, v12, (uint64_t)certificateData, (uint64_t)v8, 0, v13);
  }
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = (AVPersistableContentKeyRequest *)a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  if ((AVPersistableContentKeyRequest *)self->_activeKeyRequest == v7 || self->_activePersistableKeyRequest == v7)
  {
    int v9 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend_title(self->_mediaItem, v10, v11, v12);
      int v16 = 138412546;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_21E616000, v9, OS_LOG_TYPE_ERROR, "Content key request failed for '%@' with error:  %@", (uint8_t *)&v16, 0x16u);
    }
    objc_msgSend_finishWithError_(self, v14, (uint64_t)v8, v15);
  }
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (void)setKeyCertificateURL:(id)a3
{
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
}

- (NSString)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_activePersistableKeyRequest, 0);
  objc_storeStrong((id *)&self->_activeKeyRequest, 0);
  objc_storeStrong((id *)&self->_slotRequest, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_persistentKeyData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_keySessionQueue, 0);
  objc_storeStrong((id *)&self->_keySession, 0);
}

@end