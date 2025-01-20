@interface BLOfflineKeyRequest
- (BLOfflineKeyRequest)initWithMediaItem:(id)a3 identity:(id)a4;
- (void)_performOfflineKeyRequest;
- (void)dealloc;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation BLOfflineKeyRequest

- (BLOfflineKeyRequest)initWithMediaItem:(id)a3 identity:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_init(self, v9, v10, v11);
  v13 = (BLOfflineKeyRequest *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 336), a3);
    objc_storeStrong((id *)&v13->_identity, a4);
    v14 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend_title(v13->_mediaItem, v15, v16, v17);
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_21E616000, v14, OS_LOG_TYPE_DEFAULT, "Creating Offline key request for '%@'.", (uint8_t *)&v20, 0xCu);
    }
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend_title(self->_mediaItem, v4, v5, v6);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl(&dword_21E616000, v3, OS_LOG_TYPE_DEFAULT, "Removing Offline key request for '%@'.", buf, 0xCu);
  }
  mediaItem = self->_mediaItem;
  self->_mediaItem = 0;

  v9.receiver = self;
  v9.super_class = (Class)BLOfflineKeyRequest;
  [(BLOfflineKeyRequest *)&v9 dealloc];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_bl_sharedHLSKeyRequestOperationQueue(MEMORY[0x263F08A48], v5, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E6208B8;
  v11[3] = &unk_2644B5700;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v10, (uint64_t)v8, (uint64_t)v11);
}

- (void)finishWithError:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BLOfflineKeyRequest;
  [(ICRequestOperation *)&v3 finishWithError:a3];
}

- (void)execute
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F89360]);
  active = (ICStoreRequestContext *)objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5, v6);
  requestContext = self->_requestContext;
  self->_requestContext = active;

  id v9 = [BLStoreItemMetadataRequest alloc];
  uint64_t v11 = (BLStoreItemMetadataRequest *)objc_msgSend_initWithRequestContext_mediaItem_(v9, v10, (uint64_t)self->_requestContext, (uint64_t)self->_mediaItem);
  metadataRequest = self->_metadataRequest;
  self->_metadataRequest = v11;

  v13 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_msgSend_title(self->_mediaItem, v14, v15, v16);
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl(&dword_21E616000, v13, OS_LOG_TYPE_DEFAULT, "Setting up metadata request for '%@'.", buf, 0xCu);
  }
  v18 = self->_metadataRequest;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_21E620B28;
  v21[3] = &unk_2644B5958;
  v21[4] = self;
  objc_msgSend_performRequestWithResponseHandler_(v18, v19, (uint64_t)v21, v20);
}

- (void)_performOfflineKeyRequest
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_keyServerURL(self->_assetInfo, a2, v2, v3);
  if (v5)
  {
    id v9 = (void *)v5;
    uint64_t v10 = objc_msgSend_keyCertificateURL(self->_assetInfo, v6, v7, v8);
    if (v10)
    {
      v14 = (void *)v10;
      uint64_t v15 = objc_msgSend_length(self->_identity, v11, v12, v13);

      if (v15)
      {
        uint64_t v16 = [BLSecureOfflineKeyDeliveryRequest alloc];
        v19 = (BLSecureOfflineKeyDeliveryRequest *)objc_msgSend_initWithRequestContext_(v16, v17, (uint64_t)self->_requestContext, v18);
        secureKeyRequest = self->_secureKeyRequest;
        self->_secureKeyRequest = v19;

        v21 = self->_secureKeyRequest;
        v25 = objc_msgSend_keyCertificateURL(self->_assetInfo, v22, v23, v24);
        objc_msgSend_setKeyCertificateURL_(v21, v26, (uint64_t)v25, v27);

        v28 = self->_secureKeyRequest;
        v32 = objc_msgSend_keyServerURL(self->_assetInfo, v29, v30, v31);
        objc_msgSend_setKeyServerURL_(v28, v33, (uint64_t)v32, v34);

        objc_msgSend_setIdentity_(self->_secureKeyRequest, v35, (uint64_t)self->_identity, v36);
        objc_msgSend_setMediaItem_(self->_secureKeyRequest, v37, (uint64_t)self->_mediaItem, v38);
        v39 = BLHLSKeyFetchingLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v43 = objc_msgSend_title(self->_mediaItem, v40, v41, v42);
          v47 = objc_msgSend_keyServerURL(self->_assetInfo, v44, v45, v46);
          v51 = objc_msgSend_keyCertificateURL(self->_assetInfo, v48, v49, v50);
          *(_DWORD *)buf = 138412802;
          v67 = v43;
          __int16 v68 = 2112;
          v69 = v47;
          __int16 v70 = 2112;
          v71 = v51;
          _os_log_impl(&dword_21E616000, v39, OS_LOG_TYPE_DEFAULT, "Setting secure offline key request for '%@' (%@, %@).", buf, 0x20u);
        }
        v52 = self->_secureKeyRequest;
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = sub_21E621040;
        v65[3] = &unk_2644B5A20;
        v65[4] = self;
        objc_msgSend_performRequestWithResponseHandler_(v52, v53, (uint64_t)v65, v54);
        return;
      }
    }
    else
    {
    }
  }
  if (objc_msgSend_length(self->_identity, v6, v7, v8))
  {
    v58 = objc_msgSend_keyServerURL(self->_assetInfo, v55, v56, v57);

    if (v58)
    {
      objc_msgSend_keyCertificateURL(self->_assetInfo, v59, v60, v61);
    }
  }
  BLError();
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v62, (uint64_t)v64, v63);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentKeyData, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_secureKeyRequest, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_metadataRequest, 0);
}

@end