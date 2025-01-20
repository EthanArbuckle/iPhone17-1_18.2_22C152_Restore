@interface BLStoreItemMetadataRequest
- (BLStoreItemMetadataRequest)initWithRequestContext:(id)a3 mediaItem:(id)a4;
- (BOOL)_isHLSPlaylistURLStringValid:(id)a3;
- (id)_responseDictionaryForKeyCertificateURL:(id)a3 keyServerURL:(id)a4;
- (void)_performBuyProductRequest;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation BLStoreItemMetadataRequest

- (BLStoreItemMetadataRequest)initWithRequestContext:(id)a3 mediaItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_init(self, v9, v10, v11);
  v13 = (BLStoreItemMetadataRequest *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 304), a3);
    objc_storeStrong((id *)&v13->_mediaItem, a4);
  }

  return v13;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_bl_sharedHLSKeyRequestOperationQueue(MEMORY[0x263F08A48], v5, v6, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E61F9C4;
  v11[3] = &unk_2644B59A8;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v10, (uint64_t)v8, (uint64_t)v11);
}

- (void)execute
{
}

- (void)finishWithError:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BLStoreItemMetadataRequest;
  [(ICRequestOperation *)&v3 finishWithError:a3];
}

- (void)_performBuyProductRequest
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F89360]);
  active = objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5, v6);
  id v8 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v12 = objc_msgSend_title(self->_mediaItem, v9, v10, v11);
    *(_DWORD *)buf = 138412290;
    v22 = v12;
    _os_log_impl(&dword_21E616000, v8, OS_LOG_TYPE_INFO, "Starting metadata request for '%@'", buf, 0xCu);
  }
  v16 = objc_msgSend_sharedBagProvider(MEMORY[0x263F893A0], v13, v14, v15);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21E61FC68;
  v19[3] = &unk_2644B59F8;
  v19[4] = self;
  id v20 = active;
  id v17 = active;
  objc_msgSend_getBagForRequestContext_withCompletionHandler_(v16, v18, (uint64_t)v17, (uint64_t)v19);
}

- (id)_responseDictionaryForKeyCertificateURL:(id)a3 keyServerURL:(id)a4
{
  v23[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  mediaItem = self->_mediaItem;
  id v9 = sub_21E61B75C();
  id v12 = objc_msgSend_valueForProperty_(mediaItem, v10, (uint64_t)v9, v11);

  if (objc_msgSend__isHLSPlaylistURLStringValid_(self, v13, (uint64_t)v12, v14))
  {
    v22[0] = @"hls-playlist-url";
    v22[1] = @"hls-key-cert-url";
    v23[0] = v12;
    v23[1] = v6;
    v22[2] = @"hls-key-server-url";
    v23[2] = v7;
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)v23, (uint64_t)v22, 3);
  }
  else
  {
    id v17 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_mediaItem;
      int v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_21E616000, v17, OS_LOG_TYPE_ERROR, "No stream URL available for media item %@.", (uint8_t *)&v20, 0xCu);
    }

    v16 = (void *)MEMORY[0x263EFFA78];
  }

  return v16;
}

- (BOOL)_isHLSPlaylistURLStringValid:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v9 = BLHLSKeyFetchingLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v14) = 0;
    id v12 = "playlistURLString is nil";
LABEL_14:
    _os_log_impl(&dword_21E616000, v9, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 2u);
    goto LABEL_15;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    id v9 = BLHLSKeyFetchingLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(v14) = 0;
    id v12 = "playlistURLString is not a string";
    goto LABEL_14;
  }
  if (!objc_msgSend_length(v3, v4, v5, v6))
  {
    id v9 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      id v12 = "playlistURLString is empty";
      goto LABEL_14;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  id v9 = objc_msgSend_URLWithString_(NSURL, v7, (uint64_t)v3, v8);
  BOOL v10 = v9 != 0;
  if (!v9)
  {
    uint64_t v11 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = 0;
      _os_log_impl(&dword_21E616000, v11, OS_LOG_TYPE_ERROR, "playlistURLString is not a valid url: %@", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_buyProductRequest, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end