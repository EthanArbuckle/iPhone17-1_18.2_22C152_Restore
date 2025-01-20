@interface CKAnimatedImageMediaObject
+ (BOOL)supportsSecureCoding;
+ (Class)__ck_attachmentItemClass;
+ (double)maxPixelDimensionOfThumbnailWithImagePixelSize:(CGSize)a3 forWidth:(double)a4 isSticker:(BOOL)a5;
+ (id)UTITypes;
- (BOOL)canPerformQuickAction;
- (BOOL)isReaction;
- (BOOL)needsAnimation;
- (BOOL)validPreviewExistsAtURL:(id)a3;
- (BOOL)validatePreviewFormat;
- (CKAnimatedImageMediaObject)initWithCoder:(id)a3;
- (CKAnimatedImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5;
- (id)animatedImageForWidth:(double)a3;
- (id)bbPreviewFillToSize:(CGSize)a3;
- (id)generateAndPersistAnimatedPreviewFromImageData:(id)a3 forWidth:(double)a4 withTransferGUID:(id)a5 isSticker:(BOOL)a6;
- (id)generateAndPersistAnimatedPreviewFromSourceURL:(id)a3 senderContext:(id)a4 forWidth:(double)a5 withTransferGUID:(id)a6 isSticker:(BOOL)a7;
- (id)generateThumbnailsForWidth:(double)a3 isSticker:(BOOL)a4 orientation:(char)a5;
- (id)imageEdgeEnhancementBlockIfNecessary;
- (id)metricsCollectorMediaType;
- (id)notificationCenter;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)savedAnimatedPreviewFromURL:(id)a3 forOrientation:(char)a4;
- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4;
- (id)scaledThumbnailFromThumbnail:(id)a3 forWidth:(double)a4 isSticker:(BOOL)a5;
- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 imageData:(id)a5 isSticker:(BOOL)a6 orientation:(char)a7;
- (unint64_t)stickerEffectType;
- (void)encodeWithCoder:(id)a3;
- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4;
- (void)saveAnimatedPreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5;
- (void)setStickerEffectType:(unint64_t)a3;
@end

@implementation CKAnimatedImageMediaObject

- (CKAnimatedImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKAnimatedImageMediaObject;
  v10 = [(CKImageMediaObject *)&v37 initWithTransfer:v8 context:v9 forceInlinePreview:v5];
  v11 = v10;
  if (v10)
  {
    v10->_stickerEffectType = 0;
    v12 = [(CKMediaObject *)v10 transfer];
    int v13 = [v12 isSticker];

    if (v13)
    {
      v14 = [(CKMediaObject *)v11 previewFilenameExtension];
      v15 = [(CKMediaObject *)v11 previewCachesFileURLWithOrientation:0 extension:v14 generateIntermediaries:0];

      v16 = [v15 URLByDeletingPathExtension];
      v17 = [v16 URLByAppendingPathExtension:@"plist"];

      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v17];
      if (v18)
      {
        v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:0 error:0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = (objc_class *)objc_opt_class();
              v32 = NSStringFromClass(v31);
              *(_DWORD *)buf = 138412290;
              v39 = v32;
              _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "CKAnimatedImageMediaObject: Invalid preview metadata file: %@", buf, 0xCu);
            }
          }
          goto LABEL_31;
        }
        v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v21 = [v20 isClingEnabled];

        if (v21)
        {
          v22 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F6E390]];
          if ([v22 length])
          {
            if ([v22 containsString:@"none"])
            {
              uint64_t v23 = 0;
            }
            else if ([v22 containsString:@"stroke"])
            {
              uint64_t v23 = 1;
            }
            else if ([v22 containsString:@"comic"])
            {
              uint64_t v23 = 2;
            }
            else if ([v22 containsString:@"puffy"])
            {
              uint64_t v23 = 3;
            }
            else if ([v22 containsString:@"iridescent"])
            {
              uint64_t v23 = 4;
            }
            else
            {
              uint64_t v23 = 0;
            }
            v11->_stickerEffectType = v23;
            v33 = [(CKImageMediaObject *)v11 sticker];
            [v33 setStickerEffectType:v23];
          }
        }
        v34 = [v8 stickerUserInfo];
        v35 = [v34 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B0]];
        char v29 = [v35 BOOLValue];
      }
      else
      {
        v19 = [v8 stickerUserInfo];
        v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v25 = [v24 isClingEnabled];

        if (v25)
        {
          v26 = [v19 valueForKey:*MEMORY[0x1E4F6E390]];
          v27 = v26;
          if (v26) {
            v11->_stickerEffectType = (int)[v26 intValue];
          }
        }
        v28 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B0]];
        char v29 = [v28 BOOLValue];
      }
      v11->_isReaction = v29;
LABEL_31:
    }
  }

  return v11;
}

- (id)animatedImageForWidth:(double)a3
{
  BOOL v5 = [(CKImageMediaObject *)self imageData];
  v6 = [v5 durationsWithMaxCount:*MEMORY[0x1E4F6D500]];

  v7 = [CKAnimatedImage alloc];
  id v8 = [(CKMediaObject *)self transfer];
  id v9 = -[CKAnimatedImageMediaObject generateThumbnailsForWidth:isSticker:orientation:](self, "generateThumbnailsForWidth:isSticker:orientation:", [v8 isSticker], 0, a3);
  v10 = [(CKAnimatedImage *)v7 initWithImages:v9 durations:v6];

  return v10;
}

+ (id)UTITypes
{
  return (id)MEMORY[0x1F4124608](a1, a2);
}

- (id)metricsCollectorMediaType
{
  v3 = [(CKMediaObject *)self transfer];
  int v4 = [v3 isSticker];

  if (v4)
  {
    BOOL v5 = (void **)MEMORY[0x1E4F6D990];
  }
  else
  {
    BOOL v6 = [(CKAnimatedImageMediaObject *)self needsAnimation];
    BOOL v5 = (void **)MEMORY[0x1E4F6D958];
    if (!v6) {
      BOOL v5 = (void **)MEMORY[0x1E4F6D988];
    }
  }
  v7 = *v5;

  return v7;
}

- (BOOL)canPerformQuickAction
{
  v5.receiver = self;
  v5.super_class = (Class)CKAnimatedImageMediaObject;
  BOOL v3 = [(CKMediaObject *)&v5 canPerformQuickAction];
  if (v3) {
    LOBYTE(v3) = ![(CKAnimatedImageMediaObject *)self needsAnimation];
  }
  return v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (![(CKAnimatedImageMediaObject *)self needsAnimation])
  {
    v47.receiver = self;
    v47.super_class = (Class)CKAnimatedImageMediaObject;
    v7 = [(CKMediaObject *)&v47 previewForWidth:v4 orientation:a3];
    goto LABEL_64;
  }
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    v7 = 0;
    goto LABEL_64;
  }
  id v8 = [(CKMediaObject *)self previewCacheKeyWithOrientation:v4];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "%@ previewForOrientation:%d", buf, 0x12u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v35 = self;
    uint64_t v36 = (int)v4;
    _CKLog();
  }
  v10 = [(CKMediaObject *)self transfer];
  if (![(CKMediaObject *)self isPreviewable]
    || ([v10 isFileDataReady] & 1) == 0 && (objc_msgSend(v10, "isRestoring") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v7 = 0;
    goto LABEL_63;
  }
  v11 = [(CKMediaObject *)self previewDispatchCache];
  id v12 = [v11 cachedPreviewForKey:v8];
  if (!v12)
  {
LABEL_30:
    v15 = [(CKMediaObject *)self transfer];
    if ([v15 isFileURLFinalized])
    {
    }
    else
    {
      v16 = [(CKMediaObject *)self transfer];
      int v17 = [v16 isSticker];

      if (!v17) {
        goto LABEL_40;
      }
    }
    v18 = [(CKMediaObject *)self previewFilenameExtension];
    v19 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v4 extension:v18 generateIntermediaries:0];

    v20 = [(CKAnimatedImageMediaObject *)self savedAnimatedPreviewFromURL:v19 forOrientation:v4];

    int v21 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v21 trackEvent:*MEMORY[0x1E4F6DA60]];

    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2112;
          v49 = v19;
          _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%s Got persisted animated preview %p from disk @ %@", buf, 0x20u);
        }
      }
      [v11 setCachedPreview:v20 key:v8];
      id v12 = v20;

      goto LABEL_61;
    }

    id v12 = 0;
LABEL_40:
    uint64_t v23 = [(CKMediaObject *)self transfer];
    int v24 = [v23 isSticker];

    if (v24)
    {
      int v25 = [(CKImageMediaObject *)self sticker];
      v26 = [v25 animatedImageCacheURLFromExtension];
      if (v26)
      {
        id v46 = 0;
        v27 = +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:v26 error:&v46];
        id v37 = v46;

        if (v27)
        {
          if (IMOSLoggingEnabled())
          {
            v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v27;
              *(_WORD *)&buf[22] = 2112;
              v49 = v26;
              _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "%s Got animated image preview %p from sticker app cache @ %@", buf, 0x20u);
            }
          }
          [v11 setCachedPreview:v27 key:v8];
          id v12 = v27;

          goto LABEL_61;
        }

        id v12 = 0;
      }
    }
    if ([(CKMediaObject *)self generatePreviewOutOfProcess])
    {
      [(CKMediaObject *)self generateOOPPreviewForWidth:v4 orientation:a3];
      v7 = 0;
      goto LABEL_62;
    }
    if (IMOSLoggingEnabled())
    {
      char v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "%@ animated preview NOT read from disk.", buf, 0xCu);
      }
    }
    if (([v11 isGeneratingPreviewForKey:v8] & 1) == 0)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v49 = __Block_byref_object_copy__27;
      v50 = __Block_byref_object_dispose__27;
      id v51 = 0;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke;
      v45[3] = &unk_1E5620E10;
      v45[4] = self;
      v45[5] = buf;
      *(double *)&v45[6] = a3;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_70;
      v39[3] = &unk_1E5625828;
      id v40 = v11;
      id v41 = v8;
      v42 = self;
      char v44 = v4;
      v43 = buf;
      [v40 enqueueGenerationBlock:v45 completion:v39 withPriority:-1 forKey:v41];

      _Block_object_dispose(buf, 8);
    }
    v38.receiver = self;
    v38.super_class = (Class)CKAnimatedImageMediaObject;
    v30 = [(CKMediaObject *)&v38 previewForWidth:v4 orientation:a3];

    uint64_t v31 = [(CKAnimatedImageMediaObject *)self imageEdgeEnhancementBlockIfNecessary];
    v32 = (void *)v31;
    if (v31)
    {
      uint64_t v33 = (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v30);

      v30 = (void *)v33;
    }
    id v12 = v30;

LABEL_61:
    v7 = v12;
    goto LABEL_62;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CKAnimatedImageMediaObject previewForWidth:orientation:]";
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%s cached in-memory preview is not animated, forcing reload from disk", buf, 0xCu);
      }
    }
    goto LABEL_30;
  }
  id v12 = v12;
  v7 = v12;
LABEL_62:

LABEL_63:
LABEL_64:

  return v7;
}

id __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "%@ generate animated preview.", buf, 0xCu);
    }
  }
  BOOL v6 = *(void **)(a1 + 32);
  v7 = [v6 imageData];
  double v8 = *(double *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) transferGUID];
  v10 = [*(id *)(a1 + 32) transfer];
  uint64_t v11 = objc_msgSend(v6, "generateAndPersistAnimatedPreviewFromImageData:forWidth:withTransferGUID:isSticker:", v7, v9, objc_msgSend(v10, "isSticker"), v8);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v17 = 0;
  v15 = +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:v14 error:&v17];

  return v15;
}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_70(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_2;
  block[3] = &unk_1E5625828;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  char v6 = *(unsigned char *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    if (CKIsRunningInFullCKClient())
    {
      if (IMOSLoggingEnabled())
      {
        id v3 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          uint64_t v4 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v4;
          _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%@ save animated preview.", buf, 0xCu);
        }
      }
      long long v5 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_71;
      v9[3] = &unk_1E5625800;
      char v11 = *(unsigned char *)(a1 + 64);
      long long v10 = *(_OWORD *)(a1 + 48);
      [v5 enqueueSaveBlock:v9 forMediaObject:(void)v10 withPriority:0];
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        char v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v7;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Not running in Full CK Client, deleting %@", buf, 0xCu);
        }
      }
      double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 removeItemAtURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:0];
    }
    [*(id *)(a1 + 48) postPreviewDidChangeNotifications];
  }
}

void __58__CKAnimatedImageMediaObject_previewForWidth_orientation___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 needsAnimation])
  {
    char v4 = *(unsigned char *)(a1 + 48);
    long long v5 = *(void **)(a1 + 32);
    char v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) pathExtension];
    uint64_t v7 = [v5 previewCachesFileURLWithOrientation:v4 extension:v6 generateIntermediaries:1];

    if (v7 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 moveItemAtURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) toURL:v7 error:0];
    }
    else if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        int v11 = 134218240;
        uint64_t v12 = v7;
        __int16 v13 = 2048;
        uint64_t v14 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Failed to get a previewURL %p, or temporaryPreviewURL %p", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![(CKAnimatedImageMediaObject *)self needsAnimation])
  {
    v31.receiver = self;
    v31.super_class = (Class)CKAnimatedImageMediaObject;
    [(CKMediaObject *)&v31 prewarmPreviewForWidth:v4 orientation:a3];
  }
  uint64_t v7 = [(CKMediaObject *)self previewCacheKeyWithOrientation:v4];
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Prewarm: Asked to prewarm preview for key %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    uint64_t v10 = [(CKMediaObject *)self transfer];
    if (![(CKMediaObject *)self isPreviewable]
      || ([v10 isFileDataReady] & 1) == 0 && (objc_msgSend(v10, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, not previewable", (uint8_t *)&buf, 0xCu);
        }
      }
      goto LABEL_33;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__27;
    objc_super v38 = __Block_byref_object_dispose__27;
    id v39 = 0;
    int v11 = [(CKMediaObject *)self previewDispatchCache];
    uint64_t v12 = [v11 cachedPreviewForKey:v7];
    __int16 v13 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v12;

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v32 = 138412290;
          *(void *)&v32[4] = v7;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Prewarm: %@ already in cache", v32, 0xCu);
        }
      }
      goto LABEL_32;
    }
    v16 = [(CKMediaObject *)self transfer];
    if ([v16 isFileURLFinalized])
    {
    }
    else
    {
      uint64_t v17 = [(CKMediaObject *)self transfer];
      int v18 = [v17 isSticker];

      if (!v18)
      {
LABEL_32:

        _Block_object_dispose(&buf, 8);
LABEL_33:

        goto LABEL_34;
      }
    }
    uint64_t v19 = [(CKMediaObject *)self previewFilenameExtension];
    uint64_t v20 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v4 extension:v19 generateIntermediaries:0];

    if (IMOSLoggingEnabled())
    {
      int v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v32 = 138412546;
        *(void *)&v32[4] = v7;
        __int16 v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Prewarm: Async fetching %@ at path %@", v32, 0x16u);
      }
    }
    *(void *)v32 = 0;
    objc_initWeak((id *)v32, self);
    v22 = +[CKPreviewDispatchCache previewPrewarmQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke;
    v24[3] = &unk_1E5625878;
    p_long long buf = &buf;
    objc_copyWeak(&v29, (id *)v32);
    id v25 = v20;
    char v30 = v4;
    id v26 = v11;
    id v27 = v7;
    id v23 = v20;
    dispatch_async(v22, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)v32);
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, transcode generation failed", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_34:
}

void __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained savedAnimatedPreviewFromURL:*(void *)(a1 + 32) forOrientation:*(char *)(a1 + 72)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v9 = objc_loadWeakRetained(v2);
      *(_DWORD *)long long buf = 138412802;
      v16 = @"animated";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Prewarm: %@ preview %@, welf %@", buf, 0x20u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke_81;
  v10[3] = &unk_1E5625850;
  uint64_t v14 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  __int16 v13 = @"animated";
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __65__CKAnimatedImageMediaObject_prewarmPreviewForWidth_orientation___block_invoke_81(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
    if (v2
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      uint64_t v7 = [v2 durations];
      unint64_t v8 = [v7 count];

      id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) durations];
      unint64_t v10 = [v9 count];

      if (v10 <= v8) {
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315650;
          __int16 v13 = "-[CKAnimatedImageMediaObject prewarmPreviewForWidth:orientation:]_block_invoke";
          __int16 v14 = 2048;
          unint64_t v15 = v10;
          __int16 v16 = 2048;
          unint64_t v17 = v8;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%s Prewarm adding to cache, preview count %lu > cached count %lu", (uint8_t *)&v12, 0x20u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v12 = 136315650;
        __int16 v13 = "-[CKAnimatedImageMediaObject prewarmPreviewForWidth:orientation:]_block_invoke";
        __int16 v14 = 2112;
        unint64_t v15 = v4;
        __int16 v16 = 2112;
        unint64_t v17 = (unint64_t)v2;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s Prewarm adding to cache, preview is %@ superceeds cached preview %@", (uint8_t *)&v12, 0x20u);
      }
    }
    [*(id *)(a1 + 32) setCachedPreview:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) key:*(void *)(a1 + 40)];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(const char **)(a1 + 48);
      int v12 = 138412546;
      __int16 v13 = v5;
      __int16 v14 = 2112;
      unint64_t v15 = v6;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Prewarm: No %@ preview on disk for %@", (uint8_t *)&v12, 0x16u);
    }
  }
LABEL_21:
}

- (id)generateAndPersistAnimatedPreviewFromImageData:(id)a3 forWidth:(double)a4 withTransferGUID:(id)a5 isSticker:(BOOL)a6
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v41 = (CKAnimatedImageMediaObject *)a5;
  if (IMOSLoggingEnabled())
  {
    unint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v49 = self;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%@ generate animated preview.", buf, 0xCu);
    }
  }
  id v11 = (void *)MEMORY[0x1E4F1CB10];
  int v12 = IMSafeTemporaryDirectory();
  __int16 v13 = [v12 path];
  v56[0] = v13;
  v56[1] = @"CKAnimatedImageMediaObjectPreview";
  __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v40 = [v11 fileURLWithPathComponents:v14];

  unint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v47 = 0;
  LOBYTE(v11) = [v15 createDirectoryAtURL:v40 withIntermediateDirectories:1 attributes:0 error:&v47];
  id v37 = (CKAnimatedImageMediaObject *)v47;

  if ((v11 & 1) == 0 && IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      v49 = v37;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Failed to create temporary preview directory with error: %@", buf, 0xCu);
    }
  }
  if (!v41) {
    goto LABEL_34;
  }
  unint64_t v17 = [(CKAnimatedImageMediaObject *)v41 im_lastPathComponent];
  uint64_t v18 = [v40 URLByAppendingPathComponent:v17 isDirectory:0];
  __int16 v19 = +[CKAnimatedImage filenameExtension];
  id v20 = [v18 URLByAppendingPathExtension:v19];

  if (!v20)
  {
LABEL_34:
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        v49 = v41;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL from transfer guid %@", buf, 0xCu);
      }
    }
    id v20 = 0;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v22 startTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime"];
  id v23 = [v9 durationsWithMaxCount:*MEMORY[0x1E4F6D500]];
  uint64_t v24 = [v23 count];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromImageData_forWidth_withTransferGUID_isSticker___block_invoke;
  aBlock[3] = &unk_1E56258A0;
  aBlock[4] = self;
  double v45 = a4;
  id v25 = v9;
  id v44 = v25;
  BOOL v46 = a6;
  id v26 = _Block_copy(aBlock);
  id v27 = [[CKMultiFrameImage alloc] initWithFrameCount:v24 frameProvider:v26 frameDurations:v23];
  if (v27)
  {
    v28 = [[CKAnimatedImage alloc] initWithMultiFrameImage:v27];
    id v29 = v28;
    if (v28)
    {
      id v42 = 0;
      BOOL v30 = [(CKAnimatedImage *)v28 writeAsOptimizedBitmapToFileURL:v20 error:&v42];
      id v31 = v42;
    }
    else
    {
      BOOL v30 = 0;
      id v31 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
    id v31 = 0;
  }
  objc_msgSend(v22, "stopTimingForKey:", @"CKAnimatedImageMediaObject_PreviewGenerationTime", v37);
  if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      __int16 v33 = [(CKMediaObject *)self UTIType];
      v34 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      v49 = v33;
      __int16 v50 = 2112;
      if (v30) {
        v34 = @"YES";
      }
      id v51 = v34;
      __int16 v52 = 2112;
      id v53 = v31;
      __int16 v54 = 2112;
      id v55 = v22;
      _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with success: (%@), error: (%@), and timing: %@", buf, 0x2Au);
    }
  }
  v35 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v35 trackEvent:*MEMORY[0x1E4F6DA68]];

  return v20;
}

id __113__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromImageData_forWidth_withTransferGUID_isSticker___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) thumbnailAtIndex:a2 forWidth:*(void *)(a1 + 40) imageData:*(unsigned __int8 *)(a1 + 56) isSticker:0 orientation:*(double *)(a1 + 48)];
  unint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) generatePreviewFromThumbnail:v3 width:0 orientation:*(double *)(a1 + 48)];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)generateAndPersistAnimatedPreviewFromSourceURL:(id)a3 senderContext:(id)a4 forWidth:(double)a5 withTransferGUID:(id)a6 isSticker:(BOOL)a7
{
  BOOL v7 = a7;
  v78[2] = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v53 = a4;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "%@ generate animated preview.", (uint8_t *)&buf, 0xCu);
    }
  }
  __int16 v13 = (void *)MEMORY[0x1E4F1CB10];
  __int16 v14 = IMSafeTemporaryDirectory();
  unint64_t v15 = [v14 path];
  v78[0] = v15;
  v78[1] = @"CKAnimatedImageMediaObjectPreview";
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  unint64_t v17 = [v13 fileURLWithPathComponents:v16];

  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v18 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:0];

  if (!v11) {
    goto LABEL_56;
  }
  __int16 v19 = objc_msgSend(v11, "im_lastPathComponent");
  id v20 = [v17 URLByAppendingPathComponent:v19 isDirectory:0];
  uint64_t v21 = +[CKAnimatedImage filenameExtension];
  id v22 = [v20 URLByAppendingPathExtension:v21];

  if (!v22)
  {
LABEL_56:
    if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Failed to get a temporaryPreviewURL from transfer guid %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v22 = 0;
  }
  uint64_t v24 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [(__CFString *)v24 startTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime"];
  [(__CFString *)v24 startTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime_MetadataOnly"];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__27;
  v76 = __Block_byref_object_dispose__27;
  id v77 = 0;
  id v25 = dispatch_group_create();
  dispatch_group_enter(v25);
  id v26 = (void *)MEMORY[0x1E4F6E5E8];
  uint64_t v27 = *MEMORY[0x1E4F6D500];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke;
  v62[3] = &unk_1E56258C8;
  p_long long buf = &buf;
  v28 = v25;
  v63 = v28;
  [v26 getMetadataForAnimatedImage:v52 senderContext:v53 maxCount:v27 withCompletionBlock:v62];
  dispatch_time_t v29 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v28, v29))
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Timed out waiting for BlastDoor's getMetadataForAnimatedImage.", v65, 2u);
      }
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_21;
    }
    id v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Unable to get animated image metadata from BlastDoor, returning early.", v65, 2u);
    }
LABEL_20:

LABEL_21:
    id v32 = 0;
    goto LABEL_51;
  }
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    if (IMOSLoggingEnabled())
    {
      id v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "BlastDoor's getMetadataForAnimatedImage returned nil.", v65, 2u);
      }
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_21;
    }
    id v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Unable to get animated image metadata from BlastDoor, returning early.", v65, 2u);
    }
    goto LABEL_20;
  }
  [(__CFString *)v24 stopTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime_MetadataOnly"];
  if (IMOSLoggingEnabled())
  {
    __int16 v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = [(CKMediaObject *)self UTIType];
      *(_DWORD *)v65 = 138412546;
      v66 = v34;
      __int16 v67 = 2112;
      v68 = v24;
      _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated metadata with timing: %@", v65, 0x16u);
    }
  }
  [*(id *)(*((void *)&buf + 1) + 40) pixelSize];
  +[CKAnimatedImageMediaObject maxPixelDimensionOfThumbnailWithImagePixelSize:forWidth:isSticker:](CKAnimatedImageMediaObject, "maxPixelDimensionOfThumbnailWithImagePixelSize:forWidth:isSticker:", v7);
  uint64_t v36 = v35;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_111;
  aBlock[3] = &unk_1E5625918;
  id v56 = v52;
  id v57 = v53;
  v58 = self;
  uint64_t v59 = v36;
  double v60 = a5;
  BOOL v61 = v7;
  __int16 v50 = _Block_copy(aBlock);
  id v37 = [*(id *)(*((void *)&buf + 1) + 40) durations];
  objc_super v38 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameCount:frameProvider:frameDurations:", [v37 count], v50, v37);
  if (v38)
  {
    id v39 = [[CKAnimatedImage alloc] initWithMultiFrameImage:v38];
    uint64_t v40 = v39;
    if (v39)
    {
      id v54 = 0;
      BOOL v41 = [(CKAnimatedImage *)v39 writeAsOptimizedBitmapToFileURL:v22 error:&v54];
      id v48 = v54;
    }
    else
    {
      BOOL v41 = 0;
      id v48 = 0;
    }

    [(__CFString *)v24 stopTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime", v48];
  }
  else
  {
    BOOL v41 = 0;
    [(__CFString *)v24 stopTimingForKey:@"CKAnimatedImageMediaObject_PreviewGenerationTime", 0];
  }
  if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = [(CKMediaObject *)self UTIType];
      double v45 = @"NO";
      *(_DWORD *)v65 = 138413058;
      v66 = v44;
      if (v41) {
        double v45 = @"YES";
      }
      __int16 v67 = 2112;
      v68 = v45;
      __int16 v69 = 2112;
      v70 = v49;
      __int16 v71 = 2112;
      v72 = v24;
      _os_log_impl(&dword_18EF18000, v43, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with success: (%@), error: (%@), and timing: %@", v65, 0x2Au);
    }
  }
  BOOL v46 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v46 trackEvent:*MEMORY[0x1E4F6DA68]];

  if (v41) {
    id v32 = v22;
  }
  else {
    id v32 = 0;
  }

LABEL_51:
  _Block_object_dispose(&buf, 8);

  return v32;
}

void __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6 && !a3)
  {
    MEMORY[0x192FBA860](@"BlastDoorAnimatedImageMetadata", @"BlastDoor");
    if (objc_opt_isKindOfClass()) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_111(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__27;
  uint64_t v27 = __Block_byref_object_dispose__27;
  id v28 = 0;
  unint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = (void *)MEMORY[0x1E4F6E5E8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  double v8 = *(double *)(a1 + 56);
  uint64_t v9 = *MEMORY[0x1E4F6D500];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_2;
  v19[3] = &unk_1E56258F0;
  id v22 = &v23;
  id v20 = v6;
  unint64_t v10 = v4;
  uint64_t v21 = v10;
  [v5 generateAnimatedImagePreview:v7 senderContext:v20 maxPixelDimension:a2 index:v9 maxCount:v19 withCompletionBlock:v8];
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v10, v11))
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Timed out generating frame.", v18, 2u);
      }
    }
    goto LABEL_7;
  }
  uint64_t v13 = [*(id *)(a1 + 48) scaledThumbnailFromThumbnail:v24[5] forWidth:*(unsigned __int8 *)(a1 + 72) isSticker:*(double *)(a1 + 64)];
  __int16 v14 = (void *)v24[5];
  v24[5] = v13;

  if (*(unsigned char *)(a1 + 72))
  {
LABEL_7:
    id v15 = (id)v24[5];
    goto LABEL_8;
  }
  id v15 = [*(id *)(a1 + 48) generatePreviewFromThumbnail:v24[5] width:0 orientation:*(double *)(a1 + 64)];
LABEL_8:
  __int16 v16 = v15;

  _Block_object_dispose(&v23, 8);

  return v16;
}

void __127__CKAnimatedImageMediaObject_generateAndPersistAnimatedPreviewFromSourceURL_senderContext_forWidth_withTransferGUID_isSticker___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v25 = a2;
  if (v25 && !a3)
  {
    MEMORY[0x192FBA860](@"BlastDoorPreviewImage", @"BlastDoor");
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v6 = v25;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    double v8 = [v7 image];
    uint64_t v9 = [v8 cgImage];

    id v10 = objc_alloc(MEMORY[0x1E4F42A80]);
    dispatch_time_t v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 scale];
    uint64_t v12 = objc_msgSend(v10, "initWithCGImage:scale:orientation:", v9, 0);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v15 = [v25 utTypeString];
    if (!v15) {
      goto LABEL_10;
    }
    __int16 v16 = (void *)v15;
    unint64_t v17 = [v25 utTypeString];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v20 = [v25 utTypeString];
      [v19 setValue:v20 forKey:*MEMORY[0x1E4F6DCD8]];

      uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFromMe"));
      [v19 setValue:v21 forKey:*MEMORY[0x1E4F6DCB8]];

      id v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isTrustedSender"));
      [v19 setValue:v22 forKey:*MEMORY[0x1E4F6DCC0]];

      uint64_t v23 = [*(id *)(a1 + 32) serviceName];
      [v19 setValue:v23 forKey:*MEMORY[0x1E4F6DCC8]];

      uint64_t v24 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v24 trackEvent:*MEMORY[0x1E4F6D8B0] withDictionary:v19];
    }
    else
    {
LABEL_10:
      id v19 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v19 trackEvent:*MEMORY[0x1E4F6D8A8]];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)notificationCenter
{
  return (id)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKAnimatedImageMediaObject;
  id v7 = [(CKMediaObject *)&v10 savedPreviewFromURL:v6 forOrientation:v4];
  if (!v7)
  {
    double v8 = [(CKAnimatedImageMediaObject *)self savedAnimatedPreviewFromURL:v6 forOrientation:v4];
    id v7 = [v8 image];
  }

  return v7;
}

- (id)savedAnimatedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  if (a3)
  {
    uint64_t v7 = 0;
    id v5 = +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:a3 error:&v7];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)scaledThumbnailFromThumbnail:(id)a3 forWidth:(double)a4 isSticker:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [v7 size];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v12, "thumbnailFillSizeForWidth:imageSize:", a4, v9, v11);
  double v14 = v13;
  double v16 = v15;

  if ([(id)objc_opt_class() shouldScaleUpPreview]
    && !a5
    && (v9 + 1.0 < v14 || v11 + 1.0 < v16))
  {
    if (v9 == 0.0) {
      double v18 = 0.0;
    }
    else {
      double v18 = v14 / v9;
    }
    if (v11 == 0.0) {
      double v19 = 0.0;
    }
    else {
      double v19 = v16 / v11;
    }
    id v20 = [MEMORY[0x1E4F42D90] mainScreen];
    [v20 scale];
    double v22 = v21;

    uint64_t v23 = [MEMORY[0x1E4F42D90] mainScreen];
    double v24 = v22 / fmax(v18, v19);
    [v23 scale];
    double v26 = v25 * 0.5;

    if (v24 < v26) {
      double v24 = v26;
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v43.width = v9;
        v43.height = v11;
        NSStringFromCGSize(v43);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        v44.width = v14;
        v44.height = v16;
        dispatch_time_t v29 = NSStringFromCGSize(v44);
        *(_DWORD *)long long buf = 138412802;
        id v36 = v28;
        __int16 v37 = 2048;
        double v38 = v24;
        __int16 v39 = 2112;
        uint64_t v40 = v29;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v45.width = v9;
      v45.height = v11;
      BOOL v30 = NSStringFromCGSize(v45);
      v46.width = v14;
      v46.height = v16;
      v34 = NSStringFromCGSize(v46);
      _CKLog();
    }
    id v31 = objc_alloc(MEMORY[0x1E4F42A80]);
    id v32 = v7;
    id v7 = (id)objc_msgSend(v31, "initWithCGImage:scale:orientation:", objc_msgSend(v32, "CGImage"), objc_msgSend(v32, "imageOrientation"), v24);
  }

  return v7;
}

- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 imageData:(id)a5 isSticker:(BOOL)a6 orientation:(char)a7
{
  BOOL v7 = a6;
  if (a6)
  {
    [a5 ptSize];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    id v16 = a5;
    unint64_t v17 = +[CKUIBehavior sharedBehaviors];
    [v16 ptSize];
    objc_msgSend(v17, "thumbnailFillSizeForWidth:imageSize:", a4, v18, v19);
    double v13 = v20;
    double v15 = v21;
  }
  double v22 = objc_msgSend(a5, "thumbnailAtIndex:fillToSize:maxCount:", a3, *MEMORY[0x1E4F6D500], v13, v15);

  uint64_t v23 = [(CKAnimatedImageMediaObject *)self scaledThumbnailFromThumbnail:v22 forWidth:v7 isSticker:a4];

  return v23;
}

+ (double)maxPixelDimensionOfThumbnailWithImagePixelSize:(CGSize)a3 forWidth:(double)a4 isSticker:(BOOL)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = [MEMORY[0x1E4F42D90] mainScreen];
  [v9 scale];
  double v11 = v10;

  double v12 = width / v11;
  double v13 = height / v11;
  double v14 = v13;
  double v15 = v12;
  if (!a5)
  {
    id v16 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:", a4, v12, v13);
    double v15 = v17;
    double v14 = v18;
  }
  double v19 = v15 / v12;
  double v20 = 0.0;
  if (v12 == 0.0) {
    double v19 = 0.0;
  }
  if (v13 != 0.0) {
    double v20 = v14 / v13;
  }
  double v21 = fmin(v19, v20);
  return v11 * fmax(floor(v12 * v21), floor(v13 * v21));
}

- (id)generateThumbnailsForWidth:(double)a3 isSticker:(BOOL)a4 orientation:(char)a5
{
  double v8 = [(CKImageMediaObject *)self imageData];
  double v9 = +[CKUIBehavior sharedBehaviors];
  [v8 ptSize];
  objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a3, v10, v11);
  double v13 = v12;
  double v15 = v14;

  id v16 = objc_msgSend(v8, "thumbnailsFillToSize:maxCount:", *MEMORY[0x1E4F6D500], v13, v15);
  double v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __79__CKAnimatedImageMediaObject_generateThumbnailsForWidth_isSticker_orientation___block_invoke;
  v21[3] = &unk_1E5625940;
  id v18 = v17;
  id v22 = v18;
  uint64_t v23 = self;
  double v24 = a3;
  BOOL v25 = a4;
  [v16 enumerateObjectsUsingBlock:v21];
  id v19 = v18;

  return v19;
}

void __79__CKAnimatedImageMediaObject_generateThumbnailsForWidth_isSticker_orientation___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) scaledThumbnailFromThumbnail:a2 forWidth:*(unsigned __int8 *)(a1 + 56) isSticker:*(double *)(a1 + 48)];
  [v2 addObject:v3];
}

- (void)saveAnimatedPreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    double v9 = [(CKMediaObject *)self fileManager];
    double v10 = [v8 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = v7;
      id v13 = v8;
      im_perform_with_task_assertion();
    }
  }
}

void __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v14 = 0;
    int v4 = [v2 writeAsOptimizedBitmapToFileURL:v3 error:&v14];
    id v5 = v14;
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = *(void *)(a1 + 40);
          uint64_t v7 = *(void *)(a1 + 48);
          int v15 = 138412546;
          uint64_t v16 = v7;
          __int16 v17 = 2112;
          uint64_t v18 = v8;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%@ animated preview saved to %@.", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    else
    {
      id v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke_cold_1((uint64_t)v5, v13);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    double v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138412802;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "%@ animated preview NOT saved to %@ because %@ isn't a CKAnimatedImage.", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (BOOL)needsAnimation
{
  id v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 fileIsAnimated];

  return v3;
}

- (id)imageEdgeEnhancementBlockIfNecessary
{
  return 0;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [(CKMediaObject *)self transferGUID];
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);
      }
    }
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = +[CKAnimatedImage filenameExtension];
    uint64_t v8 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:0 extension:v7 generateIntermediaries:0];

    id v6 = [(CKAnimatedImageMediaObject *)self savedAnimatedPreviewFromURL:v8 forOrientation:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v6 image];

      id v6 = (void *)v9;
    }
    if (!v6 && IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (BOOL)validPreviewExistsAtURL:(id)a3
{
  id v4 = a3;
  if ([(CKMediaObject *)self cachedValidPreviewExists])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [v4 path];
    uint64_t v5 = [v6 fileExistsAtPath:v7];

    [(CKMediaObject *)self setCachedValidPreviewExists:v5];
  }

  return v5;
}

- (CKAnimatedImageMediaObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAnimatedImageMediaObject;
  uint64_t v5 = [(CKImageMediaObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerEffectType"];
    -[CKAnimatedImageMediaObject setStickerEffectType:](v5, "setStickerEffectType:", (int)[v6 intValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKAnimatedImageMediaObject;
  id v4 = a3;
  [(CKImageMediaObject *)&v6 encodeWithCoder:v4];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKAnimatedImageMediaObject stickerEffectType](self, "stickerEffectType", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"stickerEffectType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

+ (Class)__ck_attachmentItemClass
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  [v2 shouldAnimateGifsInPhotoGrid];

  char v3 = objc_opt_class();

  return (Class)v3;
}

void __71__CKAnimatedImageMediaObject_saveAnimatedPreview_toURL_forOrientation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Animated preview failed save. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end