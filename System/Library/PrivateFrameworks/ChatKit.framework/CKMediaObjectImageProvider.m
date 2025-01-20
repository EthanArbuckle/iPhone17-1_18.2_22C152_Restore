@interface CKMediaObjectImageProvider
- (BOOL)_lock_cancelImageRequest:(int64_t)a3;
- (CKMediaObjectImageProvider)init;
- (UIImage)testImage;
- (id)_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5;
- (id)_lock_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5;
- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6;
- (int64_t)numberOfOutstandingHandlers;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_handleFileTransferDidChangeNotification:(id)a3;
- (void)_handlePreviewDidChangeNotification:(id)a3;
- (void)cancelImageRequest:(int64_t)a3;
- (void)setTestImage:(id)a3;
@end

@implementation CKMediaObjectImageProvider

- (CKMediaObjectImageProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKMediaObjectImageProvider;
  v2 = [(CKMediaObjectImageProvider *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_requestDetailsByRequestID = v3->_lock_requestDetailsByRequestID;
    v3->_lock_requestDetailsByRequestID = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_mediaObjectsPendingTransferFinalizationByRequestID = v3->_lock_mediaObjectsPendingTransferFinalizationByRequestID;
    v3->_lock_mediaObjectsPendingTransferFinalizationByRequestID = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_activeRequestIDsByTransferGUID = v3->_lock_activeRequestIDsByTransferGUID;
    v3->_lock_activeRequestIDsByTransferGUID = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel__handlePreviewDidChangeNotification_ name:@"CKPreviewDidChangeNotification" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel__handleFileTransferDidChangeNotification_ name:@"CKFileTransferUpdatedNotification" object:0];
  }
  return v3;
}

- (int64_t)numberOfOutstandingHandlers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(NSMutableDictionary *)self->_lock_requestDetailsByRequestID count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  v15 = (void (**)(id, void *, void))a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v13;
    v17 = _PhotoKitAssetForMediaObjectAsset(v16);
    if (v17)
    {
      v18 = _PhotoKitMediaProvider();
      int64_t v19 = objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, a5, v14, v15, width, height);
    }
    else
    {
      LODWORD(v19) = atomic_fetch_add(_makeNextRequestID_lastRequestID, 1u);
      v42 = [v16 mediaObject];
      int64_t v19 = (int)v19;
      v21 = -[CKMediaObjectImageProvider _imagePreviewForMediaObject:isSynchronous:requestID:](self, "_imagePreviewForMediaObject:isSynchronous:requestID:", v42, [v14 isSynchronous], (int)v19);
      if (v21)
      {
        if (IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = [NSNumber numberWithInteger:(int)v19];
            v24 = [v42 transferGUID];
            *(_DWORD *)buf = 138412546;
            v47 = v23;
            __int16 v48 = 2112;
            os_unfair_lock_t v49 = v24;
            _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Got non-nil UIImage preview for %@-%@, calling result handler", buf, 0x16u);
          }
        }
        v15[2](v15, v21, 0);
      }
      else if (([v14 isSynchronous] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v40 = [NSNumber numberWithInteger:(int)v19];
            [v42 transferGUID];
            *(_DWORD *)buf = 138412546;
            v47 = v40;
            __int16 v48 = 2112;
            os_unfair_lock_t locka = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();
            os_unfair_lock_t v49 = locka;
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Got nil preview for %@-%@, deferring result handler", buf, 0x16u);
          }
        }
        os_unfair_lock_t lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v41 = [v42 transferGUID];
        if (v41)
        {
          v26 = [(NSMutableDictionary *)self->_lock_activeRequestIDsByTransferGUID objectForKeyedSubscript:v41];
          v27 = v26;
          if (v26)
          {
            [v26 addIndex:(int)v19];
          }
          else
          {
            v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:(int)v19];
            [(NSMutableDictionary *)self->_lock_activeRequestIDsByTransferGUID setObject:v27 forKeyedSubscript:v41];
          }
        }
        v28 = [v14 resultHandlerQueue];
        v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = (id)MEMORY[0x1E4F14428];
          id v31 = MEMORY[0x1E4F14428];
        }

        v32 = [CKMediaRequestDetails alloc];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v43[3] = &unk_1E562BFB8;
        id v44 = v30;
        v45 = v15;
        id v37 = v30;
        v33 = [(CKMediaRequestDetails *)v32 initWithRequestID:(int)v19 transferGUID:v41 resultHandler:v43];
        lock_requestDetailsByRequestID = self->_lock_requestDetailsByRequestID;
        v35 = [NSNumber numberWithInteger:(int)v19];
        [(NSMutableDictionary *)lock_requestDetailsByRequestID setObject:v33 forKeyedSubscript:v35];

        os_unfair_lock_unlock(lock);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[CKMediaObjectImageProvider requestImageForAsset:targetSize:contentMode:options:resultHandler:]";
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "%s got non-CKMediaObjectBackedAsset PXDisplayAsset!", buf, 0xCu);
      }
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXDisplayAsset %@ is not a CKMediaObjectBackedAsset", v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = *MEMORY[0x1E4F39698];
    v51[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    ((void (**)(id, void *, void *))v15)[2](v15, 0, v17);
    int64_t v19 = 0;
  }

  return v19;
}

void __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  block[3] = &unk_1E5622EC8;
  v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __96__CKMediaObjectImageProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKMediaObjectImageProvider requestPlayerItemForVideo:options:resultHandler:]";
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%s got non-CKMediaObjectBackedAsset PXDisplayAsset!", buf, 0xCu);
      }
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"PXDisplayAsset %@ is not a CKMediaObjectBackedAsset", v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = *MEMORY[0x1E4F39698];
    id v30 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v9[2](v9, 0, v11);
LABEL_9:
    int64_t v13 = 0;
    goto LABEL_10;
  }
  id v10 = v7;
  v11 = _PhotoKitAssetForMediaObjectAsset(v10);
  if (!v11)
  {
    id v16 = [v10 mediaObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v16 asset];
      v18 = [MEMORY[0x1E4F16620] playerItemWithAsset:v17];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__CKMediaObjectImageProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
      block[3] = &unk_1E5623828;
      id v25 = v18;
      v26 = v9;
      id v19 = v18;
      dispatch_async(MEMORY[0x1E4F14428], block);
      signed int add = atomic_fetch_add(_makeNextRequestID_lastRequestID, 1u);

      int64_t v13 = add;
      goto LABEL_10;
    }
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKMediaObjectImageProvider requestPlayerItemForVideo:options:resultHandler:]";
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "%s got non-CKMovieMediaObject for movie request!", buf, 0xCu);
      }
    }
    v22 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"CKMediaObject %@ is not a CKMovieMediaObject", v16);
    uint64_t v27 = *MEMORY[0x1E4F39698];
    v28 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v9[2](v9, 0, v23);

    goto LABEL_9;
  }
  id v12 = _PhotoKitMediaProvider();
  int64_t v13 = [v12 requestPlayerItemForVideo:v11 options:v8 resultHandler:v9];

LABEL_10:
  return v13;
}

uint64_t __78__CKMediaObjectImageProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  int64_t v4 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v4) = [(CKMediaObjectImageProvider *)v4 _lock_cancelImageRequest:a3];
  os_unfair_lock_unlock(p_lock);
  if ((v4 & 1) == 0)
  {
    _PhotoKitMediaProvider();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 cancelImageRequest:a3];
  }
}

- (id)_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5
{
  BOOL v6 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  id v10 = [(CKMediaObjectImageProvider *)self _lock_imagePreviewForMediaObject:v9 isSynchronous:v6 requestID:a5];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)_lock_imagePreviewForMediaObject:(id)a3 isSynchronous:(BOOL)a4 requestID:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v9 = [(CKMediaObjectImageProvider *)self testImage];

  if (v9)
  {
    id v10 = [(CKMediaObjectImageProvider *)self testImage];
    [(CKMediaObjectImageProvider *)self setTestImage:0];
  }
  else
  {
    v11 = [NSNumber numberWithInteger:a5];
    id v12 = [v8 transfer];
    if ([v12 isFromMomentShare] && objc_msgSend(v12, "transferState") <= 3)
    {
      if (!a4)
      {
        [(NSMutableDictionary *)self->_lock_mediaObjectsPendingTransferFinalizationByRequestID setObject:v8 forKeyedSubscript:v11];
        if (IMOSLoggingEnabled())
        {
          int64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = [v8 transfer];
            id v15 = [v14 guid];
            int v19 = 138412546;
            id v20 = v15;
            __int16 v21 = 2048;
            uint64_t v22 = [v12 transferState];
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Transfer %@ is < finished %ld deferring preview generation", (uint8_t *)&v19, 0x16u);
          }
        }
      }
      id v10 = 0;
    }
    else
    {
      [(NSMutableDictionary *)self->_lock_mediaObjectsPendingTransferFinalizationByRequestID setObject:0 forKeyedSubscript:v11];
      id v16 = +[CKUIBehavior sharedBehaviors];
      [v16 previewMaxWidth];
      v17 = objc_msgSend(v8, "previewForWidth:orientation:", 0);

      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v10 = v17;
      }
      else {
        id v10 = 0;
      }
    }
  }

  return v10;
}

- (BOOL)_lock_cancelImageRequest:(int64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [NSNumber numberWithInteger:a3];
  BOOL v6 = [(NSMutableDictionary *)self->_lock_requestDetailsByRequestID objectForKeyedSubscript:v5];
  if (v6)
  {
    [(NSMutableDictionary *)self->_lock_requestDetailsByRequestID setObject:0 forKeyedSubscript:v5];
    id v7 = [v6 transferGUID];

    if (v7)
    {
      lock_activeRequestIDsByTransferGUID = self->_lock_activeRequestIDsByTransferGUID;
      id v9 = [v6 transferGUID];
      id v10 = [(NSMutableDictionary *)lock_activeRequestIDsByTransferGUID objectForKeyedSubscript:v9];

      [v10 removeIndex:a3];
      if (v10 && ![v10 count])
      {
        v11 = self->_lock_activeRequestIDsByTransferGUID;
        id v12 = [v6 transferGUID];
        [(NSMutableDictionary *)v11 setObject:0 forKeyedSubscript:v12];
      }
    }
  }
  [(NSMutableDictionary *)self->_lock_mediaObjectsPendingTransferFinalizationByRequestID setObject:0 forKeyedSubscript:v5];

  return v6 != 0;
}

- (void)_handlePreviewDidChangeNotification:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [v4 object];
  id v8 = v7;
  if (isKindOfClass)
  {
    id v9 = [(__CFString *)v7 transferGUID];
    if (v9)
    {
      os_unfair_lock_lock(&self->_lock);
      id v10 = [(NSMutableDictionary *)self->_lock_activeRequestIDsByTransferGUID objectForKeyedSubscript:v9];
      v11 = (void *)[v10 copy];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__CKMediaObjectImageProvider__handlePreviewDidChangeNotification___block_invoke;
      v16[3] = &unk_1E56240E0;
      v16[4] = self;
      v17 = v8;
      [v11 enumerateIndexesUsingBlock:v16];
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    id v12 = (objc_class *)objc_opt_class();

    if (v12)
    {
      int64_t v13 = NSString;
      id v14 = NSStringFromClass(v12);
      id v8 = [v13 stringWithFormat:@"of type: %@", v14];
    }
    else
    {
      id v8 = @"nil";
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v19 = v8;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Notification object received was %@ instead of expected type CKMediaObject, _handlePreviewDidChangeNotification does nothing", buf, 0xCu);
      }
    }
  }
}

void __66__CKMediaObjectImageProvider__handlePreviewDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [NSNumber numberWithUnsignedInteger:a2];
        id v9 = [*(id *)(a1 + 40) transferGUID];
        int v14 = 138412546;
        id v15 = v8;
        __int16 v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Got incoming preview change notification for pending handler %@ - %@", (uint8_t *)&v14, 0x16u);
      }
    }
    id v10 = objc_msgSend(*(id *)(a1 + 32), "_lock_imagePreviewForMediaObject:isSynchronous:requestID:", *(void *)(a1 + 40), 0, a2);
    if (v10)
    {
      v11 = [v6 resultHandler];

      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Got preview after preview change notification, returning handler", (uint8_t *)&v14, 2u);
          }
        }
        int64_t v13 = [v6 resultHandler];
        ((void (**)(void, void *, void))v13)[2](v13, v10, 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "_lock_cancelImageRequest:", a2);
    }
  }
}

- (void)_handleFileTransferDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke;
  v6[3] = &unk_1E5620AF8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) object];
  v3 = [v2 guid];
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
    id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v3];
    id v5 = (void *)[v4 copy];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke_2;
    v6[3] = &unk_1E5624B18;
    void v6[4] = *(void *)(a1 + 40);
    [v5 enumerateIndexesUsingBlock:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 24));
  }
}

void __71__CKMediaObjectImageProvider__handleFileTransferDidChangeNotification___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Transfer state changed for %@, attempting generation", (uint8_t *)&v14, 0xCu);
      }
    }
    id v8 = objc_msgSend(*(id *)(a1 + 32), "_lock_imagePreviewForMediaObject:isSynchronous:requestID:", v6, 0, a2);
    if (v8)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 32);
      id v10 = [NSNumber numberWithUnsignedInteger:a2];
      v11 = [v9 objectForKey:v10];
      id v12 = [v11 resultHandler];

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          int64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Got preview after file transfer changed, returning handler", (uint8_t *)&v14, 2u);
          }
        }
        ((void (**)(void, void *, void))v12)[2](v12, v8, 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "_lock_cancelImageRequest:", a2);
    }
  }
}

- (UIImage)testImage
{
  return self->_testImage;
}

- (void)setTestImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testImage, 0);
  objc_storeStrong((id *)&self->_lock_activeRequestIDsByTransferGUID, 0);
  objc_storeStrong((id *)&self->_lock_mediaObjectsPendingTransferFinalizationByRequestID, 0);

  objc_storeStrong((id *)&self->_lock_requestDetailsByRequestID, 0);
}

@end