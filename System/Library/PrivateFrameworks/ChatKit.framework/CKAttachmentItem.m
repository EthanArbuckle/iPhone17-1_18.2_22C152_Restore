@interface CKAttachmentItem
+ (CGSize)defaultSize;
+ (id)UTITypes;
+ (id)previewCache;
+ (id)previewSizingQueue;
+ (unint64_t)pxWidth;
- (BOOL)canShareItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIrisAsset;
- (BOOL)isSticker;
- (BOOL)showDocumentIcon;
- (CGSize)size;
- (CKAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8;
- (NSDate)createdDate;
- (NSString)description;
- (NSString)guid;
- (NSString)irisVideoPath;
- (NSString)transferGUID;
- (NSURL)alternateShareURL;
- (NSURL)appendedBundleURL;
- (NSURL)fileURL;
- (NSURL)previewItemURL;
- (NSURL)previewURL;
- (id)UTIType;
- (id)_getIrisBundleLocation;
- (id)_getIrisBundleURL;
- (id)_savedPreviewFromURL:(id)a3;
- (id)cachedPreview;
- (id)calculateIrisVideoPath;
- (id)dragItem;
- (id)fileIcon;
- (id)getIrisVideoPath;
- (id)imageData;
- (id)pasteboardItem;
- (id)previewURL:(BOOL)a3;
- (id)uncachedPreviewURL;
- (void)_savePreview:(id)a3;
- (void)generatePreviewWithCompletion:(id)a3;
- (void)setAlternateShareURL:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIrisVideoPath:(id)a3;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setIsSticker:(BOOL)a3;
- (void)setPreviewURL:(id)a3;
- (void)setShowDocumentIcon:(BOOL)a3;
- (void)setTransferGUID:(id)a3;
@end

@implementation CKAttachmentItem

- (id)fileIcon
{
  v3 = [(CKAttachmentItem *)self UTIType];
  if (!v3)
  {
    v5 = 0;
    goto LABEL_12;
  }
  v4 = +[CKMediaObject iconCache];
  v5 = [v4 objectForKey:v3];

  if (v5) {
    goto LABEL_12;
  }
  v6 = [(CKAttachmentItem *)self fileURL];
  v7 = (void *)MEMORY[0x1E4F22430];
  v8 = [v6 lastPathComponent];
  v9 = [v7 documentProxyForName:v8 type:v3 MIMEType:0];

  if ([(CKAttachmentItem *)self showDocumentIcon])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F42A80], "_iconForResourceProxy:format:options:", v9, 3, -[CKAttachmentItem showDocumentIcon](self, "showDocumentIcon") ^ 1);
    if (!v5)
    {
      v10 = +[CKUIBehavior sharedBehaviors];
      uint64_t v11 = [v10 genericDocumentIcon];
      goto LABEL_9;
    }
LABEL_10:
    v12 = +[CKMediaObject iconCache];
    [v12 setObject:v5 forKey:v3];

    goto LABEL_11;
  }
  v5 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v9 format:12 options:1];
  if (v5) {
    goto LABEL_10;
  }
  v10 = [MEMORY[0x1E4F22430] documentProxyForName:0 type:*MEMORY[0x1E4F22608] MIMEType:0];
  uint64_t v11 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v10 format:12 options:1];
LABEL_9:
  v5 = (void *)v11;

  if (v5) {
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:

  return v5;
}

- (CKAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKAttachmentItem;
  v16 = [(CKAttachmentItem *)&v21 init];
  v17 = v16;
  if (v16)
  {
    [(CKAttachmentItem *)v16 setFileURL:v12];
    [(CKAttachmentItem *)v17 setGuid:v14];
    [(CKAttachmentItem *)v17 setCreatedDate:v15];
    v18 = objc_msgSend(v13, "im_lastPathComponent");
    [(CKAttachmentItem *)v17 setTransferGUID:v18];

    appendedBundleURL = v17->_appendedBundleURL;
    v17->_appendedBundleURL = 0;

    [(CKAttachmentItem *)v17 setShowDocumentIcon:1];
  }

  return v17;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentItem;
  v4 = [(CKAttachmentItem *)&v9 description];
  v5 = [(CKAttachmentItem *)self UTIType];
  v6 = [(CKAttachmentItem *)self fileURL];
  v7 = [v3 stringWithFormat:@"%@(%@) %@", v4, v5, v6];

  return (NSString *)v7;
}

+ (id)previewCache
{
  return +[CKPreviewDispatchCache detailsPreviewCache];
}

+ (id)previewSizingQueue
{
  v2 = (void *)sPreviewSizingQueue;
  if (!sPreviewSizingQueue)
  {
    uint64_t v3 = [MEMORY[0x1E4F6C918] serialQueueWithDispatchPriority:-2];
    v4 = (void *)sPreviewSizingQueue;
    sPreviewSizingQueue = v3;

    v2 = (void *)sPreviewSizingQueue;
  }

  return v2;
}

+ (CGSize)defaultSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)UTITypes
{
  return 0;
}

- (id)imageData
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = [(CKAttachmentItem *)self guid];
    v8 = [v4 guid];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_savedPreviewFromURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (+[CKImageData supportsASTC])
    {
      id v4 = (void *)MEMORY[0x1E4F42A80];
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:0];
      char v6 = [v4 imageWithData:v5];
    }
    else
    {
      char v6 = CKJPEGUIImageFromURL((uint64_t)v3);
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (BOOL)canShareItem
{
  return ![(CKAttachmentItem *)self isSticker];
}

- (void)_savePreview:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() previewCache];
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      char v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Queue save: %@", buf, 0xCu);
      }
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__CKAttachmentItem__savePreview___block_invoke;
    v7[3] = &unk_1E5620AF8;
    v7[4] = self;
    id v8 = v4;
    [v5 enqueueSaveBlock:v7 withPriority:0];
  }
}

void __33__CKAttachmentItem__savePreview___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Perform save: %@", buf, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 32) previewURL:1];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v4 path];
    char v7 = [v5 fileExistsAtPath:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = *(id *)(a1 + 40);
      id v9 = v4;
      im_perform_with_task_assertion();
    }
  }
}

void __33__CKAttachmentItem__savePreview___block_invoke_46(uint64_t a1)
{
  if (!+[CKImageData supportsASTC])
  {
    double v2 = CKUIImageJPEGRepresentationWithHardwareAcceleration();
    if (!v2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double v2 = objc_msgSend(*(id *)(a1 + 32), "__ck_ASTCRepresentation");
  if (v2)
  {
LABEL_5:
    id v3 = v2;
    CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
    double v2 = v3;
  }
LABEL_6:
}

- (id)previewURL:(BOOL)a3
{
  previewURL = self->_previewURL;
  if (!previewURL)
  {
    uint64_t v5 = [(CKAttachmentItem *)self fileURL];
    +[CKImageData supportsASTC];
    IMAttachmentPreviewFileURL();
    char v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    char v7 = self->_previewURL;
    self->_previewURL = v6;

    previewURL = self->_previewURL;
  }

  return previewURL;
}

- (id)uncachedPreviewURL
{
  double v2 = [(CKAttachmentItem *)self fileURL];
  +[CKImageData supportsASTC];
  id v3 = IMAttachmentPreviewFileURL();

  return v3;
}

- (id)cachedPreview
{
  id v3 = [(id)objc_opt_class() previewCache];
  id v4 = [(CKAttachmentItem *)self guid];
  uint64_t v5 = [v3 cachedPreviewForKey:v4];
  if (v5)
  {
    id v6 = v5;
LABEL_5:
    id v9 = v6;
    goto LABEL_6;
  }
  char v7 = +[CKPreviewDispatchCache transcriptPreviewCache];
  id v8 = [v7 cachedPreviewForKey:v4];

  if (v8)
  {
    [v3 setCachedPreview:v8 key:v4];
    id v6 = v8;
    goto LABEL_5;
  }
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [(CKAttachmentItem *)self previewURL:0];
  }
  else {
  uint64_t v11 = [(CKAttachmentItem *)self uncachedPreviewURL];
  }
  uint64_t v12 = [(CKAttachmentItem *)self _savedPreviewFromURL:v11];
  if (v12) {
    [v3 setCachedPreview:v12 key:v4];
  }
  id v9 = v12;

LABEL_6:

  return v9;
}

- (BOOL)isIrisAsset
{
  double v2 = [(CKAttachmentItem *)self calculateIrisVideoPath];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)UTIType
{
  BOOL v3 = +[CKMediaObjectManager sharedInstance];
  id v4 = [(CKAttachmentItem *)self fileURL];
  uint64_t v5 = [v4 lastPathComponent];
  id v6 = [v3 UTITypeForFilename:v5];

  return v6;
}

- (id)pasteboardItem
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKAttachmentItem *)self fileURL];
  id v4 = [v3 lastPathComponent];
  uint64_t v5 = [v4 stringByDeletingPathExtension];

  if (v3)
  {
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:8 error:0];
  }
  else
  {
    id v6 = 0;
  }
  BOOL v7 = [(CKAttachmentItem *)self isIrisAsset];
  id v8 = [(CKAttachmentItem *)self calculateIrisVideoPath];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = @"NO";
      if (v7) {
        v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      __int16 v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "pasteBoardItem hasAppendedVideo %@ appendedVideoPath %@", buf, 0x16u);
    }
  }
  uint64_t v11 = 0;
  if (v5 && v6)
  {
    if (v8) {
      BOOL v12 = v7;
    }
    else {
      BOOL v12 = 0;
    }
    uint64_t v13 = [(id)*MEMORY[0x1E4F43C18] objectAtIndex:0];
    id v14 = (void *)v13;
    if (v12)
    {
      v21[0] = v13;
      id v15 = [v5 dataUsingEncoding:4];
      v22[0] = v15;
      v16 = [(CKAttachmentItem *)self UTIType];
      v21[1] = v16;
      v22[1] = v6;
      v21[2] = @"com.apple.MobileSMS.appendedURL";
      v17 = [v8 dataUsingEncoding:4];
      v22[2] = v17;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    }
    else
    {
      id v15 = objc_msgSend(v5, "dataUsingEncoding:", 4, v13);
      v20[0] = v15;
      v16 = [(CKAttachmentItem *)self UTIType];
      v19[1] = v16;
      v20[1] = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    }
  }

  return v11;
}

- (id)dragItem
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v4 = [(CKAttachmentItem *)self fileURL];
  uint64_t v5 = [(CKAttachmentItem *)self UTIType];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __28__CKAttachmentItem_dragItem__block_invoke;
  v16[3] = &unk_1E562BB90;
  v16[4] = self;
  [v3 registerFileRepresentationForTypeIdentifier:v5 fileOptions:1 visibility:0 loadHandler:v16];

  id v6 = [(id)*MEMORY[0x1E4F43C18] objectAtIndex:0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __28__CKAttachmentItem_dragItem__block_invoke_2;
  id v14 = &unk_1E5621A58;
  id v15 = v4;
  id v7 = v4;
  [v3 registerDataRepresentationForTypeIdentifier:v6 visibility:0 loadHandler:&v11];

  id v8 = objc_alloc(MEMORY[0x1E4F429A0]);
  id v9 = objc_msgSend(v8, "initWithItemProvider:", v3, v11, v12, v13, v14);

  return v9;
}

uint64_t __28__CKAttachmentItem_dragItem__block_invoke(uint64_t a1, void (**a2)(void, void, void, void))
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 fileURL];
  ((void (**)(void, void *, void, void))a2)[2](v4, v5, 0, 0);

  return 0;
}

uint64_t __28__CKAttachmentItem_dragItem__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 lastPathComponent];
  uint64_t v5 = [v4 stringByDeletingPathExtension];

  id v6 = [v5 dataUsingEncoding:4];
  v3[2](v3, v6, 0);

  return 0;
}

- (id)getIrisVideoPath
{
  return 0;
}

- (id)calculateIrisVideoPath
{
  irisVideoPath = self->_irisVideoPath;
  if (!irisVideoPath)
  {
    id v4 = [(CKAttachmentItem *)self fileURL];
    uint64_t v5 = +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:v4];
    id v6 = self->_irisVideoPath;
    self->_irisVideoPath = v5;

    irisVideoPath = self->_irisVideoPath;
  }

  return irisVideoPath;
}

- (id)_getIrisBundleLocation
{
  id v3 = [(CKAttachmentItem *)self fileURL];
  id v4 = [v3 path];
  uint64_t v5 = [v4 stringByDeletingLastPathComponent];

  if ([v5 length])
  {
    id v6 = [(CKAttachmentItem *)self transferGUID];
    id v7 = [v5 stringByAppendingPathComponent:v6];

    uint64_t v5 = [v7 stringByAppendingPathExtension:*MEMORY[0x1E4F8D2F8]];

    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_getIrisBundleURL
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([(CKAttachmentItem *)self isIrisAsset])
  {
    id v3 = [(CKAttachmentItem *)self _getIrisBundleLocation];
    p_appendedBundleURL = (id *)&self->_appendedBundleURL;
    appendedBundleURL = self->_appendedBundleURL;
    self->_appendedBundleURL = v3;

    if (self->_appendedBundleURL
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [*p_appendedBundleURL path],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v6 fileExistsAtPath:v7],
          v7,
          v6,
          v8))
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          id v41 = v10;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "using pre existing bundle %@", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v13 = [(CKAttachmentItem *)self fileURL];
      id v14 = [v13 path];

      id v15 = [(CKAttachmentItem *)self calculateIrisVideoPath];
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          id v41 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "_getIrisBundleURL Creating Iris bundle %@", buf, 0xCu);
        }
      }
      if (v14 && v15)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F8CE20]);
        uint64_t v19 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
        long long v20 = *(_OWORD *)v19;
        uint64_t v39 = *(void *)(v19 + 16);
        long long v38 = v20;
        objc_super v21 = (void *)[v18 initWithPathToVideo:v15 pathToImage:v14 imageDisplayTime:&v38 pairingIdentifier:0];
        v22 = [(CKAttachmentItem *)self _getIrisBundleLocation];
        if (!v21) {
          goto LABEL_28;
        }
        id v37 = 0;
        int v23 = [v21 writeToBundleAtURL:v22 error:&v37];
        id v24 = v37;
        if (v23)
        {
          __int16 v25 = [v22 absoluteString];
          objc_msgSend(v25, "im_markFileAsPurgeable:", 1);
        }
        if (v24)
        {
          if (IMOSLoggingEnabled())
          {
            v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              id v41 = v14;
              __int16 v42 = 2112;
              v43 = v15;
              __int16 v44 = 2112;
              v45 = v22;
              __int16 v46 = 2112;
              v47 = v21;
              __int16 v48 = 2112;
              id v49 = v24;
              _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Could not create iris bundle from image path %@ video path %@ URL %@ using videoComplement %@, error %@", buf, 0x34u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = [v21 imagePath];
              v29 = [v21 videoPath];
              *(_DWORD *)buf = 138412546;
              id v41 = v28;
              __int16 v42 = 2112;
              v43 = v29;
              _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "image path  %@, video path %@", buf, 0x16u);
            }
          }
          id v30 = *p_appendedBundleURL;
          id *p_appendedBundleURL = 0;
        }
        else
        {
LABEL_28:
          uint64_t v31 = [v22 copy];
          id v24 = *p_appendedBundleURL;
          id *p_appendedBundleURL = (id)v31;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v41 = v14;
          __int16 v42 = 2112;
          v43 = v15;
          _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Iris. This is unexpected. imageFilePath %@ videoFilePath %@", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          id v41 = v34;
          _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "_getIrisBundleURL %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    uint64_t v12 = self->_appendedBundleURL;
    uint64_t v11 = &self->_appendedBundleURL;
    *uint64_t v11 = 0;

    p_appendedBundleURL = (id *)v11;
  }
  id v35 = *p_appendedBundleURL;

  return v35;
}

- (NSURL)previewItemURL
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKAttachmentItem *)self _getIrisBundleURL];
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [(CKAttachmentItem *)self fileURL];
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Passing back iris url %@ to QL for fileURL  %@", (uint8_t *)&v9, 0x16u);
      }
    }
    id v6 = v3;
  }
  else
  {
    id v6 = [(CKAttachmentItem *)self fileURL];
  }
  id v7 = v6;

  return (NSURL *)v7;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double width = 100.0;
    double height = 100.0;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

+ (unint64_t)pxWidth
{
  double v2 = +[CKUIBehavior sharedBehaviors];
  [v2 previewMaxWidth];
  double v4 = v3;
  uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 scale];
  unint64_t v7 = (unint64_t)(v4 * v6);

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)appendedBundleURL
{
  return self->_appendedBundleURL;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void)setTransferGUID:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (BOOL)showDocumentIcon
{
  return self->_showDocumentIcon;
}

- (void)setShowDocumentIcon:(BOOL)a3
{
  self->_showDocumentIcon = a3;
}

- (NSString)irisVideoPath
{
  return self->_irisVideoPath;
}

- (void)setIrisVideoPath:(id)a3
{
}

- (NSURL)alternateShareURL
{
  return self->_alternateShareURL;
}

- (void)setAlternateShareURL:(id)a3
{
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_alternateShareURL, 0);
  objc_storeStrong((id *)&self->_irisVideoPath, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end