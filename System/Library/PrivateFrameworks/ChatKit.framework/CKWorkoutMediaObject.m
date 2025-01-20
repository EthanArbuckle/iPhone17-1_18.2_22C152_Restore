@interface CKWorkoutMediaObject
+ (BOOL)canGeneratePreviewInMVSHostProcess;
+ (BOOL)isPreviewable;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (id)UTITypes;
- (BOOL)_isCachedFileLocationValid;
- (BOOL)generatePreviewOutOfProcess;
- (Class)balloonViewClass;
- (Class)placeholderBalloonViewClass;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (LPLinkMetadata)linkMetadata;
- (char)cachedOrientation;
- (double)cachedWidth;
- (id)attachmentSummary:(unint64_t)a3;
- (id)linkMetadataForWidth:(double)a3 orientation:(char)a4;
- (id)metricsCollectorMediaType;
- (int)mediaType;
- (void)setCachedOrientation:(char)a3;
- (void)setCachedWidth:(double)a3;
- (void)setLinkMetadata:(id)a3;
@end

@implementation CKWorkoutMediaObject

- (id)linkMetadataForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_linkMetadata = &self->_linkMetadata;
  if (self->_linkMetadata
    && vabdd_f64(a3, self->_cachedWidth) <= 1.0
    && self->_cachedOrientation == a4
    && [(CKWorkoutMediaObject *)self _isCachedFileLocationValid])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [(CKMediaObject *)self fileURL];
        int v28 = 138412290;
        v29 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Using cached link metadata for fileURL: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    v10 = *p_linkMetadata;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(CKMediaObject *)self fileURL];
      int v28 = 138412290;
      v29 = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Generating link metadata for fileURL: %@", (uint8_t *)&v28, 0xCu);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F30A28]);
  uint64_t v14 = CKFrameworkBundle();
  v15 = [(id)v14 localizedStringForKey:@"ADD_WORKOUT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v13 setName:v15];

  [v13 setType:@"com.apple.workout"];
  v16 = [(CKMediaObject *)self fileURL];
  LOBYTE(v14) = v16 == 0;

  int v17 = IMOSLoggingEnabled();
  if ((v14 & 1) == 0)
  {
    if (v17)
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Getting Greenfield preview for width and orientation", (uint8_t *)&v28, 2u);
      }
    }
    v19 = [(CKMediaObject *)self previewForWidth:v4 orientation:a3];
    int v20 = IMOSLoggingEnabled();
    if (v19)
    {
      if (v20)
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Got preview image", (uint8_t *)&v28, 2u);
        }
      }
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v19];
      [v13 setThumbnail:v22];
    }
    else if (v20)
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Warning: unable to obtain preview image at this time", (uint8_t *)&v28, 2u);
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v17)
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Cannot generate preview: file URL is missing", (uint8_t *)&v28, 2u);
    }
    goto LABEL_33;
  }
LABEL_34:
  v10 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E4F30A78]);
  [(LPLinkMetadata *)v10 setSpecialization:v13];
  uint64_t v24 = [(CKMediaObject *)self fileURL];
  [(LPLinkMetadata *)v10 setOriginalURL:v24];

  v25 = [v13 thumbnail];
  LOBYTE(v24) = v25 == 0;

  if ((v24 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Caching link presentation metadata with thumbnail", (uint8_t *)&v28, 2u);
      }
    }
    objc_storeStrong((id *)p_linkMetadata, v10);
    self->_cachedWidth = a3;
    self->_cachedOrientation = v4;
  }

LABEL_41:

  return v10;
}

- (BOOL)_isCachedFileLocationValid
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
  uint64_t v4 = [(CKMediaObject *)self fileURL];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    v6 = NSString;
    id v7 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
    v8 = objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v8];

    if ((v10 & 1) == 0 && IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        int v17 = v8;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not exist.  File path: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [(LPLinkMetadata *)self->_linkMetadata originalURL];
        uint64_t v14 = [(CKMediaObject *)self fileURL];
        int v16 = 138412546;
        int v17 = v13;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not match current media object fileURL.  Cached: %@  Current: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    return 0;
  }
  return v10;
}

+ (id)UTITypes
{
  return (id)MEMORY[0x1F4124710](a1, a2);
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D9B0];
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)attachmentSummary:(unint64_t)a3
{
  uint64_t v4 = NSString;
  char v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Workouts" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 10;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 1;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
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
  return (Class)objc_opt_class();
}

- (BOOL)generatePreviewOutOfProcess
{
  return 1;
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