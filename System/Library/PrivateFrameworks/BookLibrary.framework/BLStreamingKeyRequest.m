@interface BLStreamingKeyRequest
- (BLStreamingKeyRequest)initWithMediaItem:(id)a3 loadingRequest:(id)a4;
- (void)_performStreamingKeyRequestForHLSAsset:(id)a3;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation BLStreamingKeyRequest

- (BLStreamingKeyRequest)initWithMediaItem:(id)a3 loadingRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_init(self, v9, v10, v11);
  v13 = (BLStreamingKeyRequest *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 320), a3);
    objc_storeStrong((id *)&v13->_loadingRequest, a4);
  }

  return v13;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E61F3C0;
  v8[3] = &unk_2644B5700;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_performRequestWithCompletionHandler_(self, v6, (uint64_t)v8, v7);
}

- (void)execute
{
  id v3 = objc_alloc(MEMORY[0x263F89360]);
  active = objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5, v6);
  id v8 = [BLStoreItemMetadataRequest alloc];
  uint64_t v10 = (BLStoreItemMetadataRequest *)objc_msgSend_initWithRequestContext_mediaItem_(v8, v9, (uint64_t)active, (uint64_t)self->_mediaItem);
  metadataRequest = self->_metadataRequest;
  self->_metadataRequest = v10;

  uint64_t v12 = self->_metadataRequest;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21E61F52C;
  v15[3] = &unk_2644B5958;
  v15[4] = self;
  objc_msgSend_performRequestWithResponseHandler_(v12, v13, (uint64_t)v15, v14);
}

- (void)_performStreamingKeyRequestForHLSAsset:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F89360];
  id v5 = a3;
  id v6 = [v4 alloc];
  active = objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v6, v7, v8, v9);
  id v11 = objc_alloc(MEMORY[0x263F892E0]);
  v13 = (ICSecureKeyDeliveryRequest *)objc_msgSend_initWithRequestContext_resourceLoadingRequest_(v11, v12, (uint64_t)active, (uint64_t)self->_loadingRequest);
  secureKeyRequest = self->_secureKeyRequest;
  self->_secureKeyRequest = v13;

  objc_msgSend_setShouldIncludeDeviceGUID_(self->_secureKeyRequest, v15, 1, v16);
  v17 = self->_secureKeyRequest;
  v21 = objc_msgSend_keyCertificateURL(v5, v18, v19, v20);
  objc_msgSend_setCertificateURL_(v17, v22, (uint64_t)v21, v23);

  v24 = self->_secureKeyRequest;
  v28 = objc_msgSend_keyServerURL(v5, v25, v26, v27);

  objc_msgSend_setKeyServerURL_(v24, v29, (uint64_t)v28, v30);
  objc_msgSend_setITunesStoreRequest_(self->_secureKeyRequest, v31, 1, v32);
  v33 = self->_secureKeyRequest;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_21E61F784;
  v36[3] = &unk_2644B5980;
  v36[4] = self;
  objc_msgSend_performWithResponseHandler_(v33, v34, (uint64_t)v36, v35);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingRequest, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_secureKeyRequest, 0);
  objc_storeStrong((id *)&self->_metadataRequest, 0);
}

@end