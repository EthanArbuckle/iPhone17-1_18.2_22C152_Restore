@interface CKWatchfaceMediaObject
+ (BOOL)canGeneratePreviewInMVSHostProcess;
+ (BOOL)isPreviewable;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (id)UTITypes;
- (BOOL)_isCachedFileLocationValid;
- (BOOL)generatePreviewOutOfProcess;
- (BOOL)hasOutOfProcessPreviewGenerator;
- (Class)placeholderBalloonViewClass;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (LPLinkMetadata)linkMetadata;
- (char)cachedOrientation;
- (double)cachedWidth;
- (id)attachmentSummary:(unint64_t)a3;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)linkMetadataForWidth:(double)a3 orientation:(char)a4;
- (id)metricsCollectorMediaType;
- (int)mediaType;
- (void)setCachedOrientation:(char)a3;
- (void)setCachedWidth:(double)a3;
- (void)setLinkMetadata:(id)a3;
@end

@implementation CKWatchfaceMediaObject

+ (id)UTITypes
{
  return &unk_1EDF15DB8;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D9A8];
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Watch Faces" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 8;
}

- (BOOL)hasOutOfProcessPreviewGenerator
{
  return 1;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 0;
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)replyContextBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  v4.receiver = self;
  v4.super_class = (Class)CKWatchfaceMediaObject;
  v2 = [(CKMediaObject *)&v4 previewBalloonViewClass];

  return (Class)v2;
}

- (BOOL)generatePreviewOutOfProcess
{
  BOOL v3 = [(CKWatchfaceMediaObject *)self hasOutOfProcessPreviewGenerator];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKWatchfaceMediaObject;
    LOBYTE(v3) = [(CKMediaObject *)&v5 generatePreviewOutOfProcess];
  }
  return v3;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  int v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      float v8 = a3;
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Generating Greenfield thumbnail in-process (width=%.3g, orientation=%d)", buf, 0x12u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__74;
  v23 = __Block_byref_object_dispose__74;
  id v24 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v10 = [(CKMediaObject *)self fileURL];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__CKWatchfaceMediaObject_generateThumbnailForWidth_orientation___block_invoke;
  v18[3] = &unk_1E562C300;
  v20 = buf;
  v11 = v9;
  v19 = v11;
  +[CKWatchfaceInProcessPreviewGenerator generateFacePreviewImageFromUrl:v10 completionBlock:v18];

  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v11, v12))
  {
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Timed out waiting for metadata.", v17, 2u);
      }
    }
    id v14 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Generated snapshot image", v17, 2u);
      }
    }
    id v14 = *(id *)(*(void *)&buf[8] + 40);
  }

  _Block_object_dispose(buf, 8);

  return v14;
}

void __64__CKWatchfaceMediaObject_generateThumbnailForWidth_orientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      float v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Error generating preview image: %@.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  id v5 = a3;

  return v5;
}

- (BOOL)_isCachedFileLocationValid
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
  int v4 = [(CKMediaObject *)self fileURL];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = NSString;
    id v7 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
    float v8 = objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));

    int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v8];

    if ((v10 & 1) == 0 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        v17 = v8;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not exist.  File path: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
        id v14 = [(CKMediaObject *)self fileURL];
        int v16 = 138412546;
        v17 = v13;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not match current media object fileURL.  Cached: %@  Current: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    return 0;
  }
  return v10;
}

- (id)linkMetadataForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_linkMetadata = &self->_linkMetadata;
  if (self->_linkMetadata
    && vabdd_f64(a3, self->_cachedWidth) <= 1.0
    && self->_cachedOrientation == a4
    && [(CKWatchfaceMediaObject *)self _isCachedFileLocationValid])
  {
    if (IMOSLoggingEnabled())
    {
      float v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [(CKMediaObject *)self fileURL];
        int v30 = 138412290;
        v31 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Using cached link metadata for fileURL: %@", (uint8_t *)&v30, 0xCu);
      }
    }
    char v10 = *p_linkMetadata;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      dispatch_time_t v12 = [(CKMediaObject *)self fileURL];
      int v30 = 138412290;
      v31 = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Generating link metadata for fileURL: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F30A28]);
  id v14 = CKFrameworkBundle();
  v15 = [v14 localizedStringForKey:@"ADD_WATCHFACE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v13 setName:v15];

  uint64_t v16 = [(CKMediaObject *)self filename];
  v17 = IMUTITypeForFilename();
  [v13 setType:v17];

  __int16 v18 = [(CKMediaObject *)self fileURL];
  LOBYTE(v16) = v18 == 0;

  int v19 = IMOSLoggingEnabled();
  if ((v16 & 1) == 0)
  {
    if (v19)
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Getting Greenfield preview for width and orientation", (uint8_t *)&v30, 2u);
      }
    }
    v21 = [(CKMediaObject *)self previewForWidth:v4 orientation:a3];
    int v22 = IMOSLoggingEnabled();
    if (v21)
    {
      if (v22)
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Got preview image", (uint8_t *)&v30, 2u);
        }
      }
      id v24 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v21];
      [v13 setThumbnail:v24];
    }
    else if (v22)
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Warning: unable to obtain preview image at this time", (uint8_t *)&v30, 2u);
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v19)
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Cannot generate preview: file URL is missing", (uint8_t *)&v30, 2u);
    }
    goto LABEL_33;
  }
LABEL_34:
  char v10 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
  [(LPLinkMetadata *)v10 setSpecialization:v13];
  uint64_t v26 = [(CKMediaObject *)self fileURL];
  [(LPLinkMetadata *)v10 setOriginalURL:v26];

  v27 = [v13 thumbnail];
  LOBYTE(v26) = v27 == 0;

  if ((v26 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Caching link presentation metadata with thumbnail", (uint8_t *)&v30, 2u);
      }
    }
    objc_storeStrong((id *)p_linkMetadata, v10);
    self->_cachedWidth = a3;
    self->_cachedOrientation = v4;
  }

LABEL_41:

  return v10;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (double)cachedWidth
{
  return self->_cachedWidth;
}

- (void)setCachedWidth:(double)a3
{
  self->_cachedWidth = a3;
}

- (char)cachedOrientation
{
  return self->_cachedOrientation;
}

- (void)setCachedOrientation:(char)a3
{
  self->_cachedOrientation = a3;
}

- (void).cxx_destruct
{
}

@end