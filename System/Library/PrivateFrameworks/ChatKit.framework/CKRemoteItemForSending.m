@interface CKRemoteItemForSending
+ (BOOL)hasAppendedVideo:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_sharedIOSurfaceCIContext;
+ (id)previewQueue;
- (BOOL)isAttachmentTooLarge:(id)a3;
- (BOOL)previewIsFullyRealizedByChatKit;
- (CGImageBlockSet)blockSet;
- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 blockOnPreviewCreation:(BOOL)a5;
- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 previewImage:(id)a5 blockOnPreviewCreation:(BOOL)a6;
- (CKRemoteItemForSending)initWithCoder:(id)a3;
- (CKRemoteItemForSending)initWithMSMessage:(id)a3;
- (CKRemoteItemForSending)initWithRichLinkWithURL:(id)a3 data:(id)a4;
- (MSMessage)appendedMessage;
- (NSData)appendedRichLinkData;
- (NSString)attachmentDescription;
- (NSURL)appendedBundleURL;
- (NSURL)appendedRichLinkURL;
- (NSURL)appendedVideoURL;
- (NSURL)attachmentURL;
- (__IOSurface)previewImage;
- (id)description;
- (id)previewUIImage;
- (void)_setPreviewUIImage:(id)a3;
- (void)beginPreviewCreation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)previewUIImage;
- (void)setAppendedBundleURL:(id)a3;
- (void)setAppendedMessage:(id)a3;
- (void)setAppendedRichLinkData:(id)a3;
- (void)setAppendedRichLinkURL:(id)a3;
- (void)setAppendedVideoURL:(id)a3;
- (void)setAttachmentDescription:(id)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setBlockSet:(CGImageBlockSet *)a3;
- (void)setPreviewImage:(__IOSurface *)a3;
- (void)setPreviewIsFullyRealizedByChatKit:(BOOL)a3;
@end

@implementation CKRemoteItemForSending

+ (id)previewQueue
{
  if (previewQueue_onceToken != -1) {
    dispatch_once(&previewQueue_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)previewQueue__previewQueue;

  return v2;
}

void __38__CKRemoteItemForSending_previewQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)previewQueue__previewQueue;
  previewQueue__previewQueue = (uint64_t)v0;

  [(id)previewQueue__previewQueue setQualityOfService:33];
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v2 = [v3 processorCount];
  [(id)previewQueue__previewQueue setMaxConcurrentOperationCount:2 * v2];
}

+ (BOOL)hasAppendedVideo:(id)a3
{
  id v3 = [a3 pathExtension];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F8D2F8]];

  return v4;
}

- (BOOL)isAttachmentTooLarge:(id)a3
{
  id v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    char v4 = [v3 lastPathComponent];
    v5 = IMUTITypeForFilename();

    uint64_t v6 = *MEMORY[0x1E4F1C5F8];
    uint64_t v7 = *MEMORY[0x1E4F1C948];
    uint64_t v8 = *MEMORY[0x1E4F1C810];
    uint64_t v9 = *MEMORY[0x1E4F1C6A0];
    v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C5F8], *MEMORY[0x1E4F1C948], *MEMORY[0x1E4F1C810], *MEMORY[0x1E4F1C6A0], 0);
    v11 = [v3 resourceValuesForKeys:v10 error:0];

    v12 = [v11 objectForKey:v9];
    LODWORD(v10) = [v12 BOOLValue];

    if (v10)
    {
      v13 = [v11 objectForKey:v7];
      v14 = [v11 objectForKey:v8];
      uint64_t v15 = [v13 unsignedIntegerValue];
      unint64_t v16 = v15 - [v14 unsignedIntegerValue];
    }
    else
    {
      v13 = [v11 objectForKey:v6];
      unint64_t v16 = [v13 unsignedIntegerValue];
    }

    char IsSupportedForTranscodeOnSend = IMUTITypeIsSupportedForTranscodeOnSend();
    if (v16 < 0x6400001) {
      char v19 = 1;
    }
    else {
      char v19 = IsSupportedForTranscodeOnSend;
    }
    if ((v19 & 1) == 0)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, @"kCKTransferFileTooLargeAttachmentURLKey", 0);
      v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v21 postNotificationName:@"CKTransferFileTooLargeNotification" object:0 userInfo:v20];
    }
    char v17 = v19 ^ 1;
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 previewImage:(id)a5 blockOnPreviewCreation:(BOOL)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CKRemoteItemForSending;
  v13 = [(CKRemoteItemForSending *)&v40 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_27;
  }
  if (![(CKRemoteItemForSending *)v13 isAttachmentTooLarge:v10])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        BOOL v16 = +[CKRemoteItemForSending hasAppendedVideo:v10];
        char v17 = @"NO";
        if (v16) {
          char v17 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v42 = v17;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "has appended video %@", buf, 0xCu);
      }
    }
    if (!+[CKRemoteItemForSending hasAppendedVideo:v10])
    {
      objc_storeStrong((id *)&v14->_attachmentURL, a3);
      appendedBundleURL = v14->_appendedBundleURL;
      v14->_appendedBundleURL = 0;

      appendedVideoURL = (__CFString *)v14->_appendedVideoURL;
      v14->_appendedVideoURL = 0;
LABEL_18:

      objc_storeStrong((id *)&v14->_attachmentDescription, a4);
      if (v12) {
        [(CKRemoteItemForSending *)v14 _setPreviewUIImage:v12];
      }
      else {
        [(CKRemoteItemForSending *)v14 beginPreviewCreation];
      }
LABEL_27:
      v38 = v14;
      goto LABEL_28;
    }
    v18 = (__CFString *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v10];
    appendedVideoURL = v18;
    if (v18)
    {
      v20 = [(__CFString *)v18 imagePath];
      if (v20)
      {
        v21 = [(__CFString *)appendedVideoURL videoPath];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          v23 = (void *)MEMORY[0x1E4F1CB10];
          v24 = [(__CFString *)appendedVideoURL imagePath];
          uint64_t v25 = [v23 fileURLWithPath:v24];
          attachmentURL = v14->_attachmentURL;
          v14->_attachmentURL = (NSURL *)v25;

          v27 = (void *)MEMORY[0x1E4F1CB10];
          v28 = [(__CFString *)appendedVideoURL videoPath];
          uint64_t v29 = [v27 fileURLWithPath:v28];
          v30 = v14->_appendedVideoURL;
          v14->_appendedVideoURL = (NSURL *)v29;

          objc_storeStrong((id *)&v14->_appendedBundleURL, a3);
          if (IMOSLoggingEnabled())
          {
            v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = v14->_appendedVideoURL;
              v33 = v14->_appendedBundleURL;
              *(_DWORD *)buf = 138412546;
              v42 = (__CFString *)v32;
              __int16 v43 = 2112;
              v44 = v33;
              _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "appended video URL %@, bundle URL %@", buf, 0x16u);
            }
          }
          goto LABEL_18;
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = [(__CFString *)appendedVideoURL imagePath];
        v37 = [(__CFString *)appendedVideoURL videoPath];
        *(_DWORD *)buf = 138412802;
        v42 = appendedVideoURL;
        __int16 v43 = 2112;
        v44 = v36;
        __int16 v45 = 2112;
        v46 = v37;
        _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "CKRemoteItemForSending. Returning nil videoComplement %@, [videoComplement imagePath] %@, [videoComplement videoPath] %@", buf, 0x20u);
      }
    }
  }
  v38 = 0;
LABEL_28:

  return v38;
}

- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 blockOnPreviewCreation:(BOOL)a5
{
  return [(CKRemoteItemForSending *)self initWithAttachmentURL:a3 description:a4 previewImage:0 blockOnPreviewCreation:a5];
}

- (CKRemoteItemForSending)initWithRichLinkWithURL:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKRemoteItemForSending;
  uint64_t v9 = [(CKRemoteItemForSending *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    appendedRichLinkData = v9->_appendedRichLinkData;
    v9->_appendedRichLinkData = (NSData *)v10;

    objc_storeStrong((id *)&v9->_appendedRichLinkURL, a3);
  }

  return v9;
}

- (CKRemoteItemForSending)initWithMSMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKRemoteItemForSending;
  uint64_t v6 = [(CKRemoteItemForSending *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appendedMessage, a3);
  }

  return v7;
}

- (void)beginPreviewCreation
{
  id v3 = [CKDBFileTransfer alloc];
  char v4 = [(CKRemoteItemForSending *)self attachmentURL];
  id v5 = [(CKDBFileTransfer *)v3 initWithFileURL:v4 transcoderUserInfo:0 attributionInfo:0 hideAttachment:0];

  uint64_t v6 = [(CKRemoteItemForSending *)self attachmentDescription];
  [(CKDBFileTransfer *)v5 setFilename:v6];

  [(CKDBFileTransfer *)v5 setTransferState:5];
  [(CKDBFileTransfer *)v5 setPreviewGenerationState:1];
  id v7 = +[CKMediaObjectManager sharedInstance];
  id v8 = [(CKDBFileTransfer *)v5 filename];
  objc_super v9 = (objc_class *)[v7 classForFilename:v8];

  uint64_t v10 = +[CKMessageContext selfContext];
  id v11 = (void *)[[v9 alloc] initWithTransfer:v5 context:v10 forceInlinePreview:1];
  id v12 = +[CKUIBehavior sharedBehaviors];
  [v12 previewMaxWidth];
  uint64_t v14 = v13;

  uint64_t v15 = +[CKRemoteItemForSending previewQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__CKRemoteItemForSending_beginPreviewCreation__block_invoke;
  v17[3] = &unk_1E5620E38;
  uint64_t v20 = v14;
  id v18 = v11;
  char v19 = self;
  id v16 = v11;
  [v15 addOperationWithBlock:v17];
}

void __46__CKRemoteItemForSending_beginPreviewCreation__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) previewForWidth:1 orientation:*(double *)(a1 + 48)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v4 image];

    id v3 = (id)v2;
  }
  else
  {
    id v3 = v4;
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 8) = 1;
  id v5 = v3;
  [*(id *)(a1 + 40) _setPreviewUIImage:v3];
}

- (void)dealloc
{
  previewImage = self->_previewImage;
  if (previewImage) {
    CFRelease(previewImage);
  }
  if (self->_blockSet) {
    CGImageBlockSetRelease();
  }
  v4.receiver = self;
  v4.super_class = (Class)CKRemoteItemForSending;
  [(CKRemoteItemForSending *)&v4 dealloc];
}

- (void)setPreviewImage:(__IOSurface *)a3
{
  previewImage = self->_previewImage;
  if (previewImage != a3)
  {
    if (previewImage) {
      CFRelease(previewImage);
    }
    self->_previewImage = a3;
    CFRetain(a3);
  }
}

- (void)_setPreviewUIImage:(id)a3
{
  uint64_t v4 = _setPreviewUIImage___pred_SBFCreateIOSurfaceForImageSpringBoardFoundation;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_setPreviewUIImage___pred_SBFCreateIOSurfaceForImageSpringBoardFoundation, &__block_literal_global_61);
  }
  uint64_t v7 = 0;
  uint64_t v6 = _setPreviewUIImage___SBFCreateIOSurfaceForImage(v5, &v7, 1);

  [(CKRemoteItemForSending *)self setPreviewImage:v6];
  [(CKRemoteItemForSending *)self setBlockSet:v7];
}

void *__45__CKRemoteItemForSending__setPreviewUIImage___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("SBFCreateIOSurfaceForImage", @"SpringBoardFoundation");
  _setPreviewUIImage___SBFCreateIOSurfaceForImage = result;
  return result;
}

- (id)description
{
  uint64_t v2 = @"fully realized preview";
  if (!self->_previewIsFullyRealizedByChatKit) {
    uint64_t v2 = @"raw preview";
  }
  return (id)[NSString stringWithFormat:@"CKRemoteItemForSending <%@,%@,%@,%@,%@,%@>", self->_previewImage, self->_attachmentURL, self->_attachmentDescription, v2, self->_appendedVideoURL, self->_appendedBundleURL];
}

+ (id)_sharedIOSurfaceCIContext
{
  if (_sharedIOSurfaceCIContext_onceToken != -1) {
    dispatch_once(&_sharedIOSurfaceCIContext_onceToken, &__block_literal_global_77_0);
  }
  uint64_t v2 = (void *)_sharedIOSurfaceCIContext_sharedIOSurfaceCIContext;

  return v2;
}

void __51__CKRemoteItemForSending__sharedIOSurfaceCIContext__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1E018]);
  uint64_t v1 = *MEMORY[0x1E4F1E238];
  v6[0] = *MEMORY[0x1E4F1E208];
  v6[1] = v1;
  v7[0] = @"com.apple.chatkit.IOSurfaceCIContext";
  v7[1] = MEMORY[0x1E4F1CC38];
  v6[2] = *MEMORY[0x1E4F1E210];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7[2] = DeviceRGB;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  uint64_t v4 = [v0 initWithOptions:v3];
  id v5 = (void *)_sharedIOSurfaceCIContext_sharedIOSurfaceCIContext;
  _sharedIOSurfaceCIContext_sharedIOSurfaceCIContext = v4;
}

- (id)previewUIImage
{
  if (self->_previewImage)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithIOSurface:self->_previewImage];
    id v3 = [(id)objc_opt_class() _sharedIOSurfaceCIContext];
    [v2 extent];
    uint64_t v4 = objc_msgSend(v3, "createCGImage:fromRect:", v2);
    if (v4)
    {
      id v5 = (CGImage *)v4;
      uint64_t v6 = [MEMORY[0x1E4F42A80] imageWithCGImage:v4];
      CGImageRelease(v5);
    }
    else
    {
      uint64_t v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(CKRemoteItemForSending *)v2 previewUIImage];
      }

      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 encodeObject:self->_attachmentURL forKey:@"CKRemoteItemForSendingAttachmentURLKey"];
    [v15 encodeObject:self->_attachmentDescription forKey:@"CKRemoteItemForSendingAttachmentDescriptionKey"];
    uint64_t v4 = [NSNumber numberWithBool:self->_previewIsFullyRealizedByChatKit];
    [v15 encodeObject:v4 forKey:@"CKRemoteItemForSendingPreviewIsFullyRealizedByChatKitKey"];

    [v15 encodeObject:self->_appendedVideoURL forKey:@"CKRemoteItemForSendingAppendedAttachmentURLKey"];
    [v15 encodeObject:self->_appendedBundleURL forKey:@"CKRemoteItemForSendingAppendedBundleURLKey"];
    [v15 encodeObject:self->_appendedRichLinkURL forKey:@"CKRemoteItemForSendingAppendedRichLinkURLKey"];
    [v15 encodeObject:self->_appendedRichLinkData forKey:@"CKRemoteItemForSendingAppendedRichLinkDataKey"];
    [v15 encodeObject:self->_appendedMessage forKey:@"CKRemoteItemForSendingAppendedMessageKey"];
    previewImage = self->_previewImage;
    if (!previewImage) {
      goto LABEL_6;
    }
    XPCObject = IOSurfaceCreateXPCObject(previewImage);
    [v15 encodeXPCObject:XPCObject forKey:@"CKRemoteItemForSendingPreviewImageKey"];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    objc_super v9 = NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    XPCObject = NSStringFromClass(v10);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    objc_msgSend(v9, "stringWithFormat:", @"An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with a %@",
      XPCObject,
    uint64_t v13 = v12);
    uint64_t v14 = [v7 exceptionWithName:v8 reason:v13 userInfo:0];
    IMLogSimulateCrashForException();
  }
LABEL_6:
}

- (CKRemoteItemForSending)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKRemoteItemForSending;
  id v5 = [(CKRemoteItemForSending *)&v34 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAttachmentURLKey"];
      attachmentURL = v5->_attachmentURL;
      v5->_attachmentURL = (NSURL *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAttachmentDescriptionKey"];
      attachmentDescription = v5->_attachmentDescription;
      v5->_attachmentDescription = (NSString *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingPreviewIsFullyRealizedByChatKitKey"];
      v5->_previewIsFullyRealizedByChatKit = [v10 BOOLValue];

      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAppendedAttachmentURLKey"];
      appendedVideoURL = v5->_appendedVideoURL;
      v5->_appendedVideoURL = (NSURL *)v11;

      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAppendedBundleURLKey"];
      appendedBundleURL = v5->_appendedBundleURL;
      v5->_appendedBundleURL = (NSURL *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAppendedRichLinkURLKey"];
      appendedRichLinkURL = v5->_appendedRichLinkURL;
      v5->_appendedRichLinkURL = (NSURL *)v15;

      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKRemoteItemForSendingAppendedRichLinkDataKey"];
      appendedRichLinkData = v5->_appendedRichLinkData;
      v5->_appendedRichLinkData = (NSData *)v17;

      uint64_t v19 = [v4 decodeObjectOfClass:NSClassFromString(&cfstr_Msmessage.isa) forKey:@"CKRemoteItemForSendingAppendedMessageKey"];
      appendedMessage = v5->_appendedMessage;
      v5->_appendedMessage = (MSMessage *)v19;

      v21 = [v4 decodeXPCObjectForKey:@"CKRemoteItemForSendingPreviewImageKey"];
      BOOL v22 = v21;
      if (v21)
      {
        IOSurfaceRef v23 = IOSurfaceLookupFromXPCObject(v21);
        [(CKRemoteItemForSending *)v5 setPreviewImage:v23];
        if (v23) {
          CFRelease(v23);
        }
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      v26 = NSString;
      v27 = (objc_class *)objc_opt_class();
      BOOL v22 = NSStringFromClass(v27);
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      objc_msgSend(v26, "stringWithFormat:", @"An %@ can only be decoded with an instance of NSXPCCoder; attempting to encode with a %@",
        v22,
      v30 = v29);
      v31 = [v24 exceptionWithName:v25 reason:v30 userInfo:0];
      IMLogSimulateCrashForException();
    }
    v32 = v5;
  }

  return v5;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (NSString)attachmentDescription
{
  return self->_attachmentDescription;
}

- (void)setAttachmentDescription:(id)a3
{
}

- (__IOSurface)previewImage
{
  return self->_previewImage;
}

- (BOOL)previewIsFullyRealizedByChatKit
{
  return self->_previewIsFullyRealizedByChatKit;
}

- (void)setPreviewIsFullyRealizedByChatKit:(BOOL)a3
{
  self->_previewIsFullyRealizedByChatKit = a3;
}

- (NSURL)appendedVideoURL
{
  return self->_appendedVideoURL;
}

- (void)setAppendedVideoURL:(id)a3
{
}

- (NSURL)appendedBundleURL
{
  return self->_appendedBundleURL;
}

- (void)setAppendedBundleURL:(id)a3
{
}

- (NSURL)appendedRichLinkURL
{
  return self->_appendedRichLinkURL;
}

- (void)setAppendedRichLinkURL:(id)a3
{
}

- (NSData)appendedRichLinkData
{
  return self->_appendedRichLinkData;
}

- (void)setAppendedRichLinkData:(id)a3
{
}

- (MSMessage)appendedMessage
{
  return self->_appendedMessage;
}

- (void)setAppendedMessage:(id)a3
{
}

- (CGImageBlockSet)blockSet
{
  return self->_blockSet;
}

- (void)setBlockSet:(CGImageBlockSet *)a3
{
  self->_blockSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appendedMessage, 0);
  objc_storeStrong((id *)&self->_appendedRichLinkData, 0);
  objc_storeStrong((id *)&self->_appendedRichLinkURL, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);
  objc_storeStrong((id *)&self->_appendedVideoURL, 0);
  objc_storeStrong((id *)&self->_attachmentDescription, 0);

  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

- (void)previewUIImage
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 extent];
  id v3 = NSStringFromCGRect(v7);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "-createCGImage:fromRect: returned nil. Requested rect: %@ – will not return a valid preview UIImage.", (uint8_t *)&v4, 0xCu);
}

@end