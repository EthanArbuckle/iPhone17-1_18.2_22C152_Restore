@interface CKIMFileTransfer
+ (id)fileManager;
+ (id)linkFileURLWithFilename:(id)a3;
+ (id)makeHardLink:(id)a3;
- (BOOL)fileIsAnimated;
- (BOOL)hasFinalizedAnimatedFlag;
- (BOOL)hideAttachment;
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isDirectory;
- (BOOL)isDownloadable;
- (BOOL)isDownloading;
- (BOOL)isDownloadingFromRemoteIntent;
- (BOOL)isFileDataReady;
- (BOOL)isFileURLFinalized;
- (BOOL)isFromMomentShare;
- (BOOL)isRejected;
- (BOOL)isRestoring;
- (BOOL)isScreenshot;
- (BOOL)isSticker;
- (BOOL)isThumbnail;
- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9;
- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6;
- (CKIMFileTransfer)initWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8;
- (CKIMFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4;
- (IMMessage)IMMessage;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSDictionary)transcoderUserInfo;
- (NSError)error;
- (NSString)adaptiveImageGlyphContentDescription;
- (NSString)adaptiveImageGlyphContentIdentifier;
- (NSString)audioTranscriptionText;
- (NSString)description;
- (NSString)filename;
- (NSString)guid;
- (NSString)originalFilename;
- (NSURL)animatedImageCacheURL;
- (NSURL)fileURL;
- (NSURL)linkFileURL;
- (NSURL)shareURL;
- (NSURL)thumbnailURL;
- (OS_dispatch_queue)isolationQueue;
- (id)_transfer;
- (id)fileManager;
- (id)imFileTransferCenter;
- (id)notificationCenter;
- (id)syncController;
- (int64_t)commSafetySensitive;
- (int64_t)previewGenerationState;
- (int64_t)transferState;
- (int64_t)updateReason;
- (unint64_t)currentBytes;
- (unint64_t)stickerEffectType;
- (unint64_t)totalBytes;
- (void)_faultInAnimatedFlagImmediately;
- (void)_reloadTransferAndDetermineIfUpdated:(BOOL *)a3;
- (void)attachmentRestored:(id)a3;
- (void)dealloc;
- (void)fetchHighQualityFile:(id)a3;
- (void)mediaObjectAdded;
- (void)mediaObjectRemoved;
- (void)reloadTransfer;
- (void)setAnimatedImageCacheURL:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setFileIsAnimated:(BOOL)a3;
- (void)setHasFinalizedAnimatedFlag:(BOOL)a3;
- (void)setIMMessage:(id)a3;
- (void)setIsolationQueue:(id)a3;
- (void)setLinkFileURL:(id)a3;
- (void)setStickerEffectType:(unint64_t)a3;
- (void)setTransferState:(int64_t)a3;
- (void)setUpdateReason:(int64_t)a3;
- (void)transferUpdated:(id)a3;
@end

@implementation CKIMFileTransfer

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      fileURL = self->_fileURL;
      *(_DWORD *)buf = 138412290;
      v17 = fileURL;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "Transfer %@ removed.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v14 = self->_fileURL;
    _CKLog();
  }
  v5 = self->_guid;
  v6 = [(CKIMFileTransfer *)self imFileTransferCenter];
  v7 = [(CKIMFileTransfer *)self fileManager];
  v8 = [v6 transferForGUID:v5];
  v9 = v8;
  if (self->_linkFileURL && ([v8 isSticker] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        guid = self->_guid;
        linkFileURL = self->_linkFileURL;
        *(_DWORD *)buf = 138412546;
        v17 = (NSURL *)guid;
        __int16 v18 = 2112;
        v19 = linkFileURL;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Remove hard link for %@ at %@.", buf, 0x16u);
      }
    }
    objc_msgSend(v7, "removeItemAtURL:error:", self->_linkFileURL, 0, v14);
  }
  v13 = [(CKIMFileTransfer *)self notificationCenter];
  [v13 removeObserver:self];

  v15.receiver = self;
  v15.super_class = (Class)CKIMFileTransfer;
  [(CKIMFileTransfer *)&v15 dealloc];
}

- (NSString)description
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3 = [(CKIMFileTransfer *)self imFileTransferCenter];
    v4 = [(CKIMFileTransfer *)self guid];
    v5 = [v3 transferForGUID:v4];

    v23 = [v5 description];
    v21 = [(IMMessage *)self->_imMessage description];

    v22 = @"<< Not Loggable On Main Thread >>";
    uint64_t v20 = @"<< Not Loggable On Main Thread >>";
  }
  else
  {
    if ([(CKIMFileTransfer *)self isDownloadable]) {
      v6 = @"YES";
    }
    else {
      v6 = @"NO";
    }
    v22 = v6;
    if ([(CKIMFileTransfer *)self isDownloading]) {
      v7 = @"YES";
    }
    else {
      v7 = @"NO";
    }
    uint64_t v20 = v7;
    v21 = @"<< Not Loggable Off Main Thread >>";
    v23 = @"<< Not Loggable Off Main Thread >>";
  }
  id v18 = (id)NSString;
  v24.receiver = self;
  v24.super_class = (Class)CKIMFileTransfer;
  v8 = [(CKIMFileTransfer *)&v24 description];
  BOOL v17 = [(CKIMFileTransfer *)self isFileURLFinalized];
  BOOL v16 = [(CKIMFileTransfer *)self isFileDataReady];
  BOOL v9 = [(CKIMFileTransfer *)self isRestoring];
  v10 = [(CKIMFileTransfer *)self error];
  v11 = [(CKIMFileTransfer *)self fileURL];
  v12 = [(CKIMFileTransfer *)self linkFileURL];
  v13 = [(CKIMFileTransfer *)self filename];
  v14 = [(CKIMFileTransfer *)self transcoderUserInfo];
  id v19 = [v18 stringWithFormat:@"[%@ [%@] isFileURLFinalized:%d isFileDataReady:%d isDownloadable:%@ isDownloading:%@ isRestoring:%d error:%@ fileURL:%@ linkFileURL:%@ filename:%@ transcoderUserInfo:%@ currentBytes:%llu totalBytes:%llu imMessage:%@]", v8, v23, v17, v16, v22, v20, v9, v10, v11, v12, v13, v14, -[CKIMFileTransfer currentBytes](self, "currentBytes"), -[CKIMFileTransfer totalBytes](self, "totalBytes"), v21];

  return (NSString *)v19;
}

- (CKIMFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CKIMFileTransfer;
  v8 = [(CKIMFileTransfer *)&v31 init];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = [v6 copy];
  guid = v8->_guid;
  v8->_guid = (NSString *)v9;

  v8->_mediaObjectCount = 0;
  dispatch_queue_t v11 = dispatch_queue_create("CKIMFileTransfer read/write isolation queue", MEMORY[0x1E4F14430]);
  isolationQueue = v8->_isolationQueue;
  v8->_isolationQueue = (OS_dispatch_queue *)v11;

  v13 = [(CKIMFileTransfer *)v8 imFileTransferCenter];
  v14 = [(CKIMFileTransfer *)v8 guid];
  objc_super v15 = [v13 transferForGUID:v14];

  int v16 = !CKFileTransferIsFileURLFinalized([v15 transferState])
     || [(CKIMFileTransfer *)v8 isDownloadingFromRemoteIntent];
  if ([v7 isFromMe]) {
    int v17 = [v7 isSent];
  }
  else {
    int v17 = 1;
  }
  int v18 = [v15 thumbnailExistsAtLocalPath];
  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    id v19 = [v15 localURL];
    uint64_t v20 = [v19 copy];
LABEL_11:
    linkFileURL = v8->_linkFileURL;
    v8->_linkFileURL = (NSURL *)v20;
    goto LABEL_12;
  }
  if (((v16 | v17) & 1) == 0)
  {
    id v19 = [v15 localURL];
    uint64_t v20 = +[CKIMFileTransfer makeHardLink:v19];
    goto LABEL_11;
  }
  if (!v18) {
    goto LABEL_13;
  }
  id v19 = [v15 localURL];
  uint64_t v30 = +[CKIMFileTransfer makeHardLink:v19];
  linkFileURL = v8->_thumbnailURL;
  v8->_thumbnailURL = (NSURL *)v30;
LABEL_12:

LABEL_13:
  v22 = [(CKIMFileTransfer *)v8 attributionInfo];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = [v15 attributionInfo];
  }
  v25 = v24;

  [(CKIMFileTransfer *)v8 setAttributionInfo:v25];
  [v15 setAttributionInfo:v25];
  [(CKIMFileTransfer *)v8 setIMMessage:v7];
  [(CKIMFileTransfer *)v8 reloadTransfer];
  v26 = [(CKIMFileTransfer *)v8 notificationCenter];
  [v26 addObserver:v8 selector:sel_transferUpdated_ name:*MEMORY[0x1E4F6BB08] object:v15];
  v27 = [(CKIMFileTransfer *)v8 syncController];
  if ([v27 isRestoring])
  {
    BOOL v28 = [(CKIMFileTransfer *)v8 isRestoring];

    if (v28) {
      [v26 addObserver:v8 selector:sel_attachmentRestored_ name:@"com.apple.ChatKit.attachmentRestoredNotification" object:0];
    }
  }
  else
  {
  }
LABEL_21:

  return v8;
}

- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  LOBYTE(v7) = 0;
  return [(CKIMFileTransfer *)self initWithFileURL:a3 transcoderUserInfo:a4 attributionInfo:a5 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:a6 isScreenshot:v7];
}

- (CKIMFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v39 = a4;
  id v16 = a5;
  id v38 = a6;
  id v37 = a7;
  int v17 = [v15 lastPathComponent];
  int v18 = +[CKIMFileTransfer linkFileURLWithFilename:v17];

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v15;
      __int16 v42 = 2112;
      id v43 = v18;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_DEBUG, "Create CKFileTransfer's hard link for %@ at %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v33 = v15;
    v35 = v18;
    _CKLog();
  }
  uint64_t v20 = [(CKIMFileTransfer *)self fileManager];
  v21 = [v18 URLByDeletingLastPathComponent];
  [v20 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:0];

  [v20 copyItemAtURL:v15 toURL:v18 error:0];
  v22 = [(CKIMFileTransfer *)self imFileTransferCenter];
  v23 = [v22 createNewOutgoingTransferWithLocalFileURL:v15];
  id v24 = [v22 transferForGUID:v23];
  [v24 setTranscoderUserInfo:v39];
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v16;
      __int16 v42 = 2112;
      id v43 = v23;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "set attributionInfo %@ for guid %@", buf, 0x16u);
    }
  }
  [v24 setAttributionInfo:v16];
  [v24 setAdaptiveImageGlyphContentIdentifier:v38];
  [v24 setAdaptiveImageGlyphContentDescription:v37];
  [v24 setHideAttachment:v9];
  [v24 setIsScreenshot:a9];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(46);
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v23;
      __int16 v42 = 2112;
      id v43 = v15;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_DEBUG, "Generate IM guid %@ for %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v34 = v23;
    id v36 = v15;
    _CKLog();
  }
  objc_msgSend(v22, "registerTransferWithDaemon:", v23, v34, v36);
  v27 = (NSDictionary *)[v16 copy];
  attributionInfo = self->_attributionInfo;
  self->_attributionInfo = v27;

  v29 = [(CKIMFileTransfer *)self initWithTransferGUID:v23 imMessage:0];
  if (v29)
  {
    uint64_t v30 = [v18 copy];
    linkFileURL = v29->_linkFileURL;
    v29->_linkFileURL = (NSURL *)v30;

    [(CKIMFileTransfer *)v29 reloadTransfer];
  }

  return v29;
}

- (CKIMFileTransfer)initWithStickerFileURL:(id)a3 transferUserInfo:(id)a4 attributionInfo:(id)a5 animatedImageCacheURL:(id)a6 adaptiveImageGlyphContentIdentifier:(id)a7 adaptiveImageGlyphContentDescription:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v27 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(CKIMFileTransfer *)self imFileTransferCenter];
  uint64_t v20 = [v19 createNewOutgoingTransferWithLocalFileURL:v14];
  v21 = [v19 transferForGUID:v20];
  [v21 setStickerUserInfo:v15];
  [v21 setIsSticker:1];
  [v21 setAdaptiveImageGlyphContentIdentifier:v17];
  [v21 setAdaptiveImageGlyphContentDescription:v18];
  [v21 setAttributionInfo:v16];
  v22 = [(CKIMFileTransfer *)self initWithTransferGUID:v20 imMessage:0];
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Generated file guid %@ for fileURL %@", buf, 0x16u);
    }
  }
  if (v22)
  {
    uint64_t v24 = [v14 copy];
    linkFileURL = v22->_linkFileURL;
    v22->_linkFileURL = (NSURL *)v24;

    [(CKIMFileTransfer *)v22 setAttributionInfo:v16];
    [(CKIMFileTransfer *)v22 setAnimatedImageCacheURL:v27];
    [(CKIMFileTransfer *)v22 reloadTransfer];
  }

  return v22;
}

- (IMMessage)IMMessage
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    v5 = [(CKIMFileTransfer *)self guid];
    [v3 raise:v4, @"Tried to access -[CKFileTransfer message] (%@) off of mainThread.", v5 format];
  }
  imMessage = self->_imMessage;

  return imMessage;
}

- (void)setIMMessage:(id)a3
{
  uint64_t v4 = (IMMessage *)a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    uint64_t v7 = [(CKIMFileTransfer *)self guid];
    [v5 raise:v6, @"Tried to change -[CKFileTransfer message] (%@) off of mainThread.", v7 format];
  }
  imMessage = self->_imMessage;
  self->_imMessage = v4;
}

- (NSString)guid
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__CKIMFileTransfer_guid__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __24__CKIMFileTransfer_guid__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSURL)fileURL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  BOOL v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__CKIMFileTransfer_fileURL__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __27__CKIMFileTransfer_fileURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasFinalizedAnimatedFlag
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CKIMFileTransfer_hasFinalizedAnimatedFlag__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CKIMFileTransfer_hasFinalizedAnimatedFlag__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 13);
  return result;
}

- (NSString)filename
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CKIMFileTransfer_filename__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __28__CKIMFileTransfer_filename__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)transcoderUserInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CKIMFileTransfer_transcoderUserInfo__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__CKIMFileTransfer_transcoderUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)stickerUserInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_stickerUserInfo__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __35__CKIMFileTransfer_stickerUserInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)attributionInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_attributionInfo__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __35__CKIMFileTransfer_attributionInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSError)error
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__CKIMFileTransfer_error__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

void __25__CKIMFileTransfer_error__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)currentBytes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CKIMFileTransfer_currentBytes__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__CKIMFileTransfer_currentBytes__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (unint64_t)totalBytes
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CKIMFileTransfer_totalBytes__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CKIMFileTransfer_totalBytes__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 96);
  return result;
}

- (BOOL)isSticker
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__CKIMFileTransfer_isSticker__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__CKIMFileTransfer_isSticker__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 14);
  return result;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CKIMFileTransfer_adaptiveImageGlyphContentIdentifier__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __55__CKIMFileTransfer_adaptiveImageGlyphContentIdentifier__block_invoke(uint64_t a1)
{
}

- (NSString)adaptiveImageGlyphContentDescription
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CKIMFileTransfer_adaptiveImageGlyphContentDescription__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __56__CKIMFileTransfer_adaptiveImageGlyphContentDescription__block_invoke(uint64_t a1)
{
}

- (BOOL)hideAttachment
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CKIMFileTransfer_hideAttachment__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__CKIMFileTransfer_hideAttachment__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 19);
  return result;
}

- (BOOL)isDirectory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CKIMFileTransfer_isDirectory__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__CKIMFileTransfer_isDirectory__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 20);
  return result;
}

- (int64_t)commSafetySensitive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CKIMFileTransfer_commSafetySensitive__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__CKIMFileTransfer_commSafetySensitive__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (BOOL)isFileURLFinalized
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CKIMFileTransfer_isFileURLFinalized__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__CKIMFileTransfer_isFileURLFinalized__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)isRejected
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CKIMFileTransfer_isRejected__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CKIMFileTransfer_isRejected__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (BOOL)isFileDataReady
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CKIMFileTransfer_isFileDataReady__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__CKIMFileTransfer_isFileDataReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 15);
  return result;
}

- (BOOL)isRestoring
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CKIMFileTransfer_isRestoring__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__CKIMFileTransfer_isRestoring__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 18);
  return result;
}

- (BOOL)isFromMomentShare
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__CKIMFileTransfer_isFromMomentShare__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__CKIMFileTransfer_isFromMomentShare__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 21);
  return result;
}

- (int64_t)transferState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CKIMFileTransfer_transferState__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__CKIMFileTransfer_transferState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136);
  return result;
}

- (NSURL)shareURL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__69;
  v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__CKIMFileTransfer_shareURL__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __28__CKIMFileTransfer_shareURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_transfer
{
  uint64_t v3 = [(CKIMFileTransfer *)self imFileTransferCenter];
  uint64_t v4 = [(CKIMFileTransfer *)self guid];
  v5 = [v3 transferForGUID:v4];

  return v5;
}

- (BOOL)isThumbnail
{
  uint64_t v2 = [(CKIMFileTransfer *)self _transfer];
  BOOL v3 = [v2 transferState] == 9;

  return v3;
}

- (BOOL)isDownloadable
{
  uint64_t v2 = [(CKIMFileTransfer *)self _transfer];
  char v3 = [v2 _isMissingAndDownloadable];

  return v3;
}

- (BOOL)isDownloading
{
  char v3 = [(CKIMFileTransfer *)self isFileDataReady];
  uint64_t v4 = [(CKIMFileTransfer *)self transferState];
  v5 = [(CKIMFileTransfer *)self guid];
  char IsDownloading = CKFileTransferIsDownloading(v3, v4, v5);

  return IsDownloading;
}

- (NSString)originalFilename
{
  uint64_t v2 = [(CKIMFileTransfer *)self _transfer];
  char v3 = [v2 originalFilename];

  return (NSString *)v3;
}

- (int64_t)previewGenerationState
{
  uint64_t v2 = [(CKIMFileTransfer *)self _transfer];
  int64_t v3 = [v2 previewGenerationState];

  return v3;
}

- (void)mediaObjectAdded
{
}

- (void)mediaObjectRemoved
{
  if (atomic_fetch_add_explicit(&self->_mediaObjectCount, 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    int64_t v3 = [(CKIMFileTransfer *)self notificationCenter];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__CKIMFileTransfer_mediaObjectRemoved__block_invoke;
    v5[3] = &unk_1E5620AF8;
    id v6 = v3;
    uint64_t v7 = self;
    id v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __38__CKIMFileTransfer_mediaObjectRemoved__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotificationName:@"CKFileTransferRemovedNotification" object:*(void *)(a1 + 40)];
}

- (void)setHasFinalizedAnimatedFlag:(BOOL)a3
{
  v5 = [(CKIMFileTransfer *)self isolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CKIMFileTransfer_setHasFinalizedAnimatedFlag___block_invoke;
  v6[3] = &unk_1E5622A18;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_sync(v5, v6);
}

uint64_t __48__CKIMFileTransfer_setHasFinalizedAnimatedFlag___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 13) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_faultInAnimatedFlagImmediately
{
  int64_t v3 = [(CKIMFileTransfer *)self filename];
  id v4 = IMUTITypeForFilename();

  if (IMUTTypeIsSupportedAnimatedImage())
  {
    v5 = [(CKIMFileTransfer *)self fileURL];
    char v6 = IMFileURLIsActuallyAnimated();
  }
  else
  {
    char v6 = 0;
  }
  BOOL v7 = [(CKIMFileTransfer *)self isolationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CKIMFileTransfer__faultInAnimatedFlagImmediately__block_invoke;
  v8[3] = &unk_1E5622A18;
  v8[4] = self;
  char v9 = v6;
  dispatch_barrier_sync(v7, v8);
}

uint64_t __51__CKIMFileTransfer__faultInAnimatedFlagImmediately__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 12) = *(unsigned char *)(result + 40);
  *(unsigned char *)(*(void *)(result + 32) + 13) = 1;
  return result;
}

- (BOOL)fileIsAnimated
{
  if (![(CKIMFileTransfer *)self hasFinalizedAnimatedFlag]) {
    [(CKIMFileTransfer *)self _faultInAnimatedFlagImmediately];
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int64_t v3 = [(CKIMFileTransfer *)self isolationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CKIMFileTransfer_fileIsAnimated__block_invoke;
  v6[3] = &unk_1E5628B80;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__CKIMFileTransfer_fileIsAnimated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

- (BOOL)isAdaptiveImageGlyph
{
  uint64_t v2 = [(CKIMFileTransfer *)self adaptiveImageGlyphContentIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)imFileTransferCenter
{
  return (id)[MEMORY[0x1E4F6BCC8] sharedInstance];
}

- (id)notificationCenter
{
  return (id)[MEMORY[0x1E4F28EB8] defaultCenter];
}

- (id)fileManager
{
  return (id)[MEMORY[0x1E4F28CB8] defaultManager];
}

+ (id)fileManager
{
  return (id)[MEMORY[0x1E4F28CB8] defaultManager];
}

- (id)syncController
{
  return +[CKSyncController sharedInstance];
}

- (void)_reloadTransferAndDetermineIfUpdated:(BOOL *)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3B8];
    char v6 = [(CKIMFileTransfer *)self guid];
    [v4 raise:v5, @"Tried to access IMFileTransfer %@ off of mainThread.", v6 format];
  }
  uint64_t v7 = [(NSURL *)self->_fileURL copy];
  uint64_t v8 = [(NSString *)self->_filename copy];
  uint64_t v9 = [(NSError *)self->_error copy];
  v134 = (void *)[(NSDictionary *)self->_transcoderUserInfo copy];
  v133 = (void *)[(NSDictionary *)self->_stickerUserInfo copy];
  unint64_t totalBytes = self->_totalBytes;
  unint64_t currentBytes = self->_currentBytes;
  BOOL isSticker = self->_isSticker;
  v132 = self->_adaptiveImageGlyphContentIdentifier;
  v131 = self->_adaptiveImageGlyphContentDescription;
  int64_t commSafetySensitive = self->_commSafetySensitive;
  int64_t updateReason = self->_updateReason;
  BOOL fileURLFinalized = self->_fileURLFinalized;
  BOOL fileDataReady = self->_fileDataReady;
  BOOL restoring = self->_restoring;
  BOOL rejected = self->_rejected;
  int64_t transferState = self->_transferState;
  uint64_t v10 = [(NSDictionary *)self->_attributionInfo copy];
  BOOL isDirectory = self->_isDirectory;
  BOOL hideAttachment = self->_hideAttachment;
  BOOL isFromMomentShare = self->_isFromMomentShare;
  v129 = (void *)[(NSURL *)self->_shareURL copy];
  BOOL isScreenshot = self->_isScreenshot;
  v128 = self->_audioTranscriptionText;
  id v11 = [(CKIMFileTransfer *)self imFileTransferCenter];
  v12 = [(CKIMFileTransfer *)self guid];
  v13 = [v11 transferForGUID:v12];

  uint64_t v14 = [(CKIMFileTransfer *)self IMMessage];
  v124 = [v13 filename];
  v117 = [v13 transcoderUserInfo];
  v122 = [v13 stickerUserInfo];
  uint64_t v15 = [v13 totalBytes];
  uint64_t v116 = [v13 currentBytes];
  char v115 = [v13 isSticker];
  v112 = [v13 adaptiveImageGlyphContentIdentifier];
  v114 = [v13 adaptiveImageGlyphContentDescription];
  uint64_t v113 = [v13 commSafetySensitive];
  if (v13) {
    uint64_t v16 = [v13 transferState];
  }
  else {
    uint64_t v16 = 6;
  }
  v130 = (void *)v10;
  uint64_t v17 = [v13 attributionInfo];
  char v110 = [v13 hideAttachment];
  char v109 = [v13 isDirectory];
  char v108 = [v13 isFromMomentShare];
  v135 = (void *)v14;
  uint64_t v119 = v15;
  v111 = (void *)v17;
  if (CKFileTransferIsFileURLFinalized(v16)
    && ![(CKIMFileTransfer *)self isDownloadingFromRemoteIntent])
  {
    id v18 = [v13 localURL];
    if (v18)
    {
      v23 = [(CKIMFileTransfer *)self fileManager];
      uint64_t v24 = [(NSURL *)v18 path];
      unsigned int v25 = [v23 fileExistsAtPath:v24];
    }
    else
    {
      unsigned int v25 = 0;
    }
    v26 = [(CKIMFileTransfer *)self syncController];
    unsigned int v27 = [v26 isRestoring];

    int v22 = CKFileTransferRestoring(v25, v16 != 0, v27);
    if ([v135 isFromMe]) {
      int v28 = [v135 isSent] ^ 1;
    }
    else {
      int v28 = 0;
    }
    if (v16 != 6) {
      int v28 = 1;
    }
    char v107 = 1;
    if (v25) {
      int v21 = v28;
    }
    else {
      int v21 = 0;
    }
  }
  else
  {
    id v18 = self->_linkFileURL;
    if (v18)
    {
      id v19 = [(CKIMFileTransfer *)self fileManager];
      uint64_t v20 = [(NSURL *)v18 path];
      int v21 = [v19 fileExistsAtPath:v20];

      char v107 = 0;
      int v22 = 0;
    }
    else
    {
      char v107 = 0;
      int v22 = 0;
      int v21 = 0;
    }
  }
  v126 = (void *)v9;
  v127 = (void *)v8;
  if (v13 && (v16 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v29 = (NSURL *)v7;
    __int16 v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = [v13 error];
    uint64_t v32 = v30;
    id v33 = @"IMFileTransferErrorDomain";
LABEL_36:
    id v36 = [v32 errorWithDomain:v33 code:v31 userInfo:0];
    goto LABEL_37;
  }
  if (v13) {
    int v34 = v21;
  }
  else {
    int v34 = 1;
  }
  if ((v34 | v22))
  {
    if (v13) {
      goto LABEL_30;
    }
LABEL_35:
    v29 = (NSURL *)v7;
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    id v33 = @"CKFileTransferErrorDomain";
    uint64_t v31 = 0;
    goto LABEL_36;
  }
  v35 = [(CKIMFileTransfer *)self guid];
  if (CKFileTransferIsDownloading(0, v16, v35))
  {
    v29 = (NSURL *)v7;

    goto LABEL_33;
  }
  char v37 = [v13 _isMissingAndDownloadable];

  if ((v37 & 1) == 0) {
    goto LABEL_35;
  }
LABEL_30:
  v29 = (NSURL *)v7;
LABEL_33:
  id v36 = 0;
LABEL_37:
  isolationQueue = self->_isolationQueue;
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke;
  v138[3] = &unk_1E562BC90;
  v138[4] = self;
  id v39 = v18;
  v139 = v39;
  id v125 = v124;
  id v140 = v125;
  id v121 = v36;
  id v141 = v121;
  id v40 = v117;
  id v142 = v40;
  id v123 = v122;
  id v143 = v123;
  uint64_t v148 = v116;
  uint64_t v149 = v119;
  char v152 = v115;
  id v120 = v112;
  id v144 = v120;
  id v118 = v114;
  id v145 = v118;
  uint64_t v150 = v113;
  uint64_t v151 = v16;
  char v153 = v21;
  char v154 = v107;
  BOOL v155 = v16 == 8;
  char v156 = v22;
  id v41 = v111;
  id v146 = v41;
  char v157 = v110;
  char v158 = v109;
  char v159 = v108;
  id v42 = v13;
  id v147 = v42;
  ck_dispatch_isolated(isolationQueue, v138);
  id v43 = v29;
  if (v29 != v39 && ([(NSURL *)v29 isEqual:v39] & 1) == 0)
  {
    [(CKIMFileTransfer *)self setHasFinalizedAnimatedFlag:0];
    uint64_t v44 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke_2;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(v44, block);
  }
  v46 = v126;
  v45 = v127;
  if (a3)
  {
    uint64_t v47 = [(CKIMFileTransfer *)self fileURL];
    v106 = v43;
    if (v43 == (NSURL *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      [(CKIMFileTransfer *)self fileURL];
      id v49 = v41;
      id v50 = v42;
      v52 = id v51 = v40;
      int v53 = [(NSURL *)v43 isEqual:v52];

      id v40 = v51;
      id v42 = v50;
      id v41 = v49;
      v46 = v126;
      v45 = v127;

      if (!v53)
      {
LABEL_43:
        BOOL v54 = 1;
LABEL_60:
        id v43 = v106;
LABEL_61:
        *a3 = v54;
        goto LABEL_62;
      }
    }
    id v91 = v40;
    uint64_t v55 = [(CKIMFileTransfer *)self filename];
    if (v45 == (void *)v55)
    {
    }
    else
    {
      v56 = (void *)v55;
      v57 = [(CKIMFileTransfer *)self filename];
      int v58 = [v45 isEqualToString:v57];

      if (!v58) {
        goto LABEL_59;
      }
    }
    uint64_t v59 = [(CKIMFileTransfer *)self error];
    if (v46 == (void *)v59)
    {
    }
    else
    {
      v60 = (void *)v59;
      v61 = [(CKIMFileTransfer *)self error];
      int v62 = [v46 isEqual:v61];

      if (!v62) {
        goto LABEL_59;
      }
    }
    uint64_t v63 = [(CKIMFileTransfer *)self transcoderUserInfo];
    if (v134 == (void *)v63)
    {
    }
    else
    {
      v64 = (void *)v63;
      v65 = [(CKIMFileTransfer *)self transcoderUserInfo];
      int v66 = [v134 isEqualToDictionary:v65];

      if (!v66) {
        goto LABEL_59;
      }
    }
    uint64_t v67 = [(CKIMFileTransfer *)self stickerUserInfo];
    if (v133 == (void *)v67)
    {
    }
    else
    {
      v68 = (void *)v67;
      v69 = [(CKIMFileTransfer *)self stickerUserInfo];
      int v70 = [v133 isEqualToDictionary:v69];

      if (!v70)
      {
LABEL_59:
        BOOL v54 = 1;
        id v40 = v91;
        goto LABEL_60;
      }
    }
    id v40 = v91;
    if (currentBytes != [(CKIMFileTransfer *)self currentBytes]) {
      goto LABEL_43;
    }
    id v43 = v106;
    if (totalBytes != [(CKIMFileTransfer *)self totalBytes]
      || isSticker != [(CKIMFileTransfer *)self isSticker])
    {
      goto LABEL_84;
    }
    uint64_t v71 = [(CKIMFileTransfer *)self adaptiveImageGlyphContentIdentifier];
    if (v132 == (NSString *)v71)
    {
    }
    else
    {
      v72 = (void *)v71;
      v73 = [(CKIMFileTransfer *)self adaptiveImageGlyphContentIdentifier];
      BOOL v74 = [(NSString *)v132 isEqualToString:v73];

      if (!v74) {
        goto LABEL_73;
      }
    }
    uint64_t v75 = [(CKIMFileTransfer *)self adaptiveImageGlyphContentDescription];
    if (v131 == (NSString *)v75)
    {
    }
    else
    {
      v76 = (void *)v75;
      v77 = [(CKIMFileTransfer *)self adaptiveImageGlyphContentDescription];
      BOOL v78 = [(NSString *)v131 isEqualToString:v77];

      if (!v78)
      {
LABEL_73:
        BOOL v54 = 1;
        id v40 = v91;
LABEL_86:
        id v43 = v106;
        goto LABEL_61;
      }
    }
    id v40 = v91;
    if (commSafetySensitive != [(CKIMFileTransfer *)self commSafetySensitive])
    {
      BOOL v54 = 1;
      goto LABEL_86;
    }
    id v43 = v106;
    if (fileDataReady != [(CKIMFileTransfer *)self isFileDataReady]
      || fileURLFinalized != [(CKIMFileTransfer *)self isFileURLFinalized]
      || rejected != [(CKIMFileTransfer *)self isRejected]
      || restoring != [(CKIMFileTransfer *)self isRestoring]
      || transferState != [(CKIMFileTransfer *)self transferState])
    {
LABEL_84:
      BOOL v54 = 1;
      goto LABEL_61;
    }
    uint64_t v79 = [(CKIMFileTransfer *)self attributionInfo];
    if (v130 == (void *)v79)
    {
    }
    else
    {
      v80 = (void *)v79;
      v81 = [(CKIMFileTransfer *)self attributionInfo];
      int v82 = [v130 isEqualToDictionary:v81];

      if (!v82) {
        goto LABEL_98;
      }
    }
    if (hideAttachment != [(CKIMFileTransfer *)self hideAttachment]
      || isDirectory != [(CKIMFileTransfer *)self isDirectory]
      || isFromMomentShare != [(CKIMFileTransfer *)self isFromMomentShare])
    {
      goto LABEL_98;
    }
    uint64_t v83 = [(CKIMFileTransfer *)self shareURL];
    if (v129 == (void *)v83)
    {
    }
    else
    {
      v84 = (void *)v83;
      v85 = [(CKIMFileTransfer *)self shareURL];
      int v86 = [v129 isEqual:v85];

      if (!v86) {
        goto LABEL_98;
      }
    }
    if (isScreenshot == [(CKIMFileTransfer *)self isScreenshot])
    {
      uint64_t v87 = [(CKIMFileTransfer *)self audioTranscriptionText];
      if (v128 == (NSString *)v87)
      {
      }
      else
      {
        v88 = (void *)v87;
        v89 = [(CKIMFileTransfer *)self audioTranscriptionText];
        BOOL v90 = [(NSString *)v128 isEqualToString:v89];

        if (!v90) {
          goto LABEL_98;
        }
      }
      BOOL v54 = updateReason != [(CKIMFileTransfer *)self updateReason];
      goto LABEL_99;
    }
LABEL_98:
    BOOL v54 = 1;
LABEL_99:
    id v43 = v106;
    id v40 = v91;
    goto LABEL_61;
  }
LABEL_62:
}

uint64_t __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v8;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v11;

  uint64_t v14 = [*(id *)(a1 + 72) copy];
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 72);
  *(void *)(v15 + 72) = v14;

  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(a1 + 112);
  *(void *)(*(void *)(a1 + 32) + 96) = *(void *)(a1 + 120);
  *(unsigned char *)(*(void *)(a1 + 32) + 14) = *(unsigned char *)(a1 + 144);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 80));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 88));
  *(void *)(*(void *)(a1 + 32) + 120) = *(void *)(a1 + 128);
  *(unsigned char *)(*(void *)(a1 + 32) + 15) = *(unsigned char *)(a1 + 145);
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = *(unsigned char *)(a1 + 146);
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = *(unsigned char *)(a1 + 147);
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = *(unsigned char *)(a1 + 148);
  *(void *)(*(void *)(a1 + 32) + 136) = *(void *)(a1 + 136);
  uint64_t v17 = [*(id *)(a1 + 96) copy];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 80);
  *(void *)(v18 + 80) = v17;

  *(unsigned char *)(*(void *)(a1 + 32) + 19) = *(unsigned char *)(a1 + 149);
  *(unsigned char *)(*(void *)(a1 + 32) + 20) = *(unsigned char *)(a1 + 150);
  *(unsigned char *)(*(void *)(a1 + 32) + 21) = *(unsigned char *)(a1 + 151);
  uint64_t v20 = [*(id *)(a1 + 104) shareURL];
  uint64_t v21 = [v20 copy];
  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 152);
  *(void *)(v22 + 152) = v21;

  *(unsigned char *)(*(void *)(a1 + 32) + 22) = [*(id *)(a1 + 104) isScreenshot];
  uint64_t v24 = [*(id *)(a1 + 104) audioTranscriptionText];
  uint64_t v25 = [v24 copy];
  uint64_t v26 = *(void *)(a1 + 32);
  unsigned int v27 = *(void **)(v26 + 160);
  *(void *)(v26 + 160) = v25;

  uint64_t result = [*(id *)(a1 + 104) updateReason];
  *(void *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

uint64_t __57__CKIMFileTransfer__reloadTransferAndDetermineIfUpdated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _faultInAnimatedFlagImmediately];
}

- (void)reloadTransfer
{
}

- (void)transferUpdated:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKIMFileTransfer *)self transferState];
  char v11 = 0;
  [(CKIMFileTransfer *)self _reloadTransferAndDetermineIfUpdated:&v11];
  uint64_t v6 = [(CKIMFileTransfer *)self notificationCenter];
  uint64_t v7 = v6;
  if (v11) {
    [v6 postNotificationName:@"CKFileTransferUpdatedNotification" object:self];
  }
  if (!CKFileTransferIsFileURLFinalized(v5)
    && CKFileTransferIsFileURLFinalized([(CKIMFileTransfer *)self transferState])
    && ![(CKIMFileTransfer *)self isDownloadingFromRemoteIntent])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(46);
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = [(CKIMFileTransfer *)self guid];
        *(_DWORD *)buf = 138412290;
        v13 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "Transfer %@ finished.", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v10 = [(CKIMFileTransfer *)self guid];
      _CKLog();
    }
    objc_msgSend(v7, "postNotificationName:object:", @"CKFileTransferFinishedNotification", self, v10);
  }
}

- (BOOL)isDownloadingFromRemoteIntent
{
  return 0;
}

- (void)fetchHighQualityFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKIMFileTransfer *)self imFileTransferCenter];
  if (v5)
  {
    uint64_t v6 = [(CKIMFileTransfer *)self guid];
    uint64_t v7 = [v5 transferForGUID:v6];

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __41__CKIMFileTransfer_fetchHighQualityFile___block_invoke;
      v8[3] = &unk_1E562BCB8;
      id v9 = v4;
      [v5 fetchHighQualityVariantForTransfer:v7 completion:v8];
    }
    else if (v4)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __41__CKIMFileTransfer_fetchHighQualityFile___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id v9 = v5;
    if (a2)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
      (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, 1, v8);
    }
    else
    {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
    uint64_t v6 = v9;
  }
}

- (void)attachmentRestored:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKIMFileTransfer *)self isRestoring])
  {
    [(CKIMFileTransfer *)self reloadTransfer];
    if (![(CKIMFileTransfer *)self isRestoring])
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v6 = [(CKIMFileTransfer *)self guid];
          *(_DWORD *)buf = 138412290;
          uint64_t v10 = v6;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "Transfer %@ restored.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        uint64_t v8 = [(CKIMFileTransfer *)self guid];
        _CKLog();
      }
      uint64_t v7 = [(CKIMFileTransfer *)self notificationCenter];
      [v7 removeObserver:self name:@"com.apple.ChatKit.attachmentRestoredNotification" object:0];
      [v7 postNotificationName:@"CKFileTransferRestoredNotification" object:self];
    }
  }
}

+ (id)linkFileURLWithFilename:(id)a3
{
  return CKAttachmentLinkFileURL(a3);
}

+ (id)makeHardLink:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 lastPathComponent];

    if (v6)
    {
      uint64_t v7 = [v5 lastPathComponent];
      uint64_t v6 = [a1 linkFileURLWithFilename:v7];

      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412546;
          v13 = v5;
          __int16 v14 = 2112;
          uint64_t v15 = v6;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Create CKFileTransfer's hard link for %@ at %@.", (uint8_t *)&v12, 0x16u);
        }
      }
      id v9 = [a1 fileManager];
      uint64_t v10 = [v6 URLByDeletingLastPathComponent];
      [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];

      [v9 copyItemAtURL:v5 toURL:v6 error:0];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setFileIsAnimated:(BOOL)a3
{
  self->_fileIsAnimated = a3;
}

- (void)setAttributionInfo:(id)a3
{
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (void)setUpdateReason:(int64_t)a3
{
  self->_int64_t updateReason = a3;
}

- (void)setTransferState:(int64_t)a3
{
  self->_int64_t transferState = a3;
}

- (NSString)audioTranscriptionText
{
  return self->_audioTranscriptionText;
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSURL)animatedImageCacheURL
{
  return self->_animatedImageCacheURL;
}

- (void)setAnimatedImageCacheURL:(id)a3
{
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
}

- (NSURL)linkFileURL
{
  return self->_linkFileURL;
}

- (void)setLinkFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkFileURL, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_imMessage, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end