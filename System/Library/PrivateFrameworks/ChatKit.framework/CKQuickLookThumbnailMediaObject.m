@interface CKQuickLookThumbnailMediaObject
+ (Class)__ck_attachmentItemClass;
+ (id)UTITypes;
- (BOOL)isPreviewable;
- (BOOL)shouldSuppressPreview;
- (id)attachmentSummary:(unint64_t)a3;
- (id)diskCachedThumbnailForOrientation:(char)a3;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
@end

@implementation CKQuickLookThumbnailMediaObject

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (id)UTITypes
{
  return &unk_1EDF157B8;
}

- (BOOL)isPreviewable
{
  return ![(CKQuickLookThumbnailMediaObject *)self shouldSuppressPreview];
}

- (BOOL)shouldSuppressPreview
{
  v3 = [(CKMediaObject *)self messageContext];
  v4 = [v3 chatContext];
  uint64_t v5 = [v4 serviceType];

  v10.receiver = self;
  v10.super_class = (Class)CKQuickLookThumbnailMediaObject;
  if ([(CKMediaObject *)&v10 shouldSuppressPreview]) {
    return 1;
  }
  v7 = [(CKMediaObject *)self messageContext];
  char v8 = [v7 isSenderUnauthenticated];
  if (v5 == 3) {
    BOOL v6 = v8;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  uint64_t v5 = IMSharedUtilitiesFrameworkBundle();
  BOOL v6 = [v5 localizedStringForKey:@"%lu AR Models" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(CKMediaObject *)self previewCacheKeyWithOrientation:a3];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__53;
  v36 = __Block_byref_object_dispose__53;
  id v37 = 0;
  v7 = [(CKMediaObject *)self transfer];
  if ([(CKQuickLookThumbnailMediaObject *)self isPreviewable]
    && (([v7 isFileDataReady] & 1) != 0 || (objc_msgSend(v7, "isRestoring") & 1) != 0))
  {
    char v8 = [(CKMediaObject *)self previewDispatchCache];
    uint64_t v9 = [v8 cachedPreviewForKey:v6];
    objc_super v10 = (void *)v33[5];
    v33[5] = v9;

    v11 = (void *)v33[5];
    if (!v11)
    {
      uint64_t v12 = [(CKQuickLookThumbnailMediaObject *)self diskCachedThumbnailForOrientation:v4];
      v13 = (void *)v33[5];
      v33[5] = v12;

      v14 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v14 trackEvent:*MEMORY[0x1E4F6DA60]];

      if (!v33[5])
      {
        v19 = +[CKUIBehavior sharedBehaviors];
        [v19 attachmentBalloonSize];
        uint64_t v21 = v20;
        uint64_t v23 = v22;

        if (([v8 isGeneratingPreviewForKey:v6] & 1) == 0)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke;
          v31[3] = &unk_1E562A408;
          v31[6] = v21;
          v31[7] = v23;
          v31[4] = self;
          v31[5] = &v32;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_3;
          v25[3] = &unk_1E562A430;
          v29 = &v32;
          id v26 = v8;
          id v27 = v6;
          v28 = self;
          char v30 = v4;
          [v26 enqueueGenerationBlock:v31 completion:v25 withPriority:-1 forKey:v27];
        }
        id v16 = 0;
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = self;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_DEBUG, "%@ quicklook preview read from disk.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v24 = self;
        _CKLog();
      }
      objc_msgSend(v8, "setCachedPreview:key:", v33[5], v6, v24);
      v11 = (void *)v33[5];
    }
    id v16 = v11;
LABEL_15:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  id v16 = (id)v33[5];
LABEL_24:

  _Block_object_dispose(&v32, 8);

  return v16;
}

id __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F3A6C0]);
  v3 = [*(id *)(a1 + 32) fileURL];
  uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  BOOL v6 = objc_msgSend(v2, "initWithFileAtURL:size:scale:representationTypes:", v3, 4, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);

  [v6 setShouldUseRestrictedExtension:1];
  if (_IMWillLog())
  {
    v15 = v6;
    _IMAlwaysLog();
  }
  v7 = dispatch_group_create();
  id v8 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v8 startTimingForKey:@"CKQuickLookThumbnailMediaObject_PreviewGenerationTime"];
  dispatch_group_enter(v7);
  uint64_t v9 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_2;
  uint64_t v20 = &unk_1E5629920;
  uint64_t v22 = *(void *)(a1 + 40);
  objc_super v10 = v7;
  uint64_t v21 = v10;
  [v9 generateBestRepresentationForRequest:v6 completionHandler:&v17];

  [v8 stopTimingForKey:@"CKQuickLookThumbnailMediaObject_PreviewGenerationTime"];
  if (_IMWillLog())
  {
    v15 = [*(id *)(a1 + 32) UTIType];
    id v16 = v8;
    _IMAlwaysLog();
  }
  v11 = objc_msgSend(MEMORY[0x1E4F6E890], "sharedInstance", v15, v16, v17, v18, v19, v20);
  [v11 trackEvent:*MEMORY[0x1E4F6DA68]];

  dispatch_time_t v12 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v10, v12)) {
    _IMWarn();
  }
  id v13 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return v13;
}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = [a2 UIImage];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_4;
  block[3] = &unk_1E562A430;
  uint64_t v8 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  char v9 = *(unsigned char *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_4(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 56) + 8) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) setCachedPreview:v1 key:*(void *)(result + 40)];
    if (CKIsRunningInFullCKClient())
    {
      uint64_t v3 = *(void **)(v2 + 32);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_5;
      v4[3] = &unk_1E5625800;
      char v6 = *(unsigned char *)(v2 + 64);
      long long v5 = *(_OWORD *)(v2 + 48);
      [v3 enqueueSaveBlock:v4 forMediaObject:(void)v5 withPriority:0];
    }
    return [*(id *)(v2 + 48) postPreviewDidChangeNotifications];
  }
  return result;
}

void __63__CKQuickLookThumbnailMediaObject_previewForWidth_orientation___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(char *)(a1 + 48);
  id v5 = a2;
  char v6 = [v5 previewFilenameExtension];
  id v7 = [v3 previewCachesFileURLWithOrientation:v4 extension:v6 generateIntermediaries:1];

  [v5 savePreview:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) toURL:v7 forOrientation:*(char *)(a1 + 48)];
}

- (id)diskCachedThumbnailForOrientation:(char)a3
{
  uint64_t v3 = a3;
  id v5 = [(CKMediaObject *)self previewFilenameExtension];
  CFURLRef v6 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v3 extension:v5 generateIntermediaries:0];

  if (v6 && (id v7 = CGImageSourceCreateWithURL(v6, 0)) != 0)
  {
    uint64_t v8 = v7;
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
    if (ImageAtIndex)
    {
      objc_super v10 = ImageAtIndex;
      v11 = (void *)MEMORY[0x1E4F42A80];
      dispatch_time_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
      [v12 scale];
      id v13 = objc_msgSend(v11, "imageWithCGImage:scale:orientation:", v10, 0);

      CGImageRelease(v10);
    }
    else
    {
      id v13 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end