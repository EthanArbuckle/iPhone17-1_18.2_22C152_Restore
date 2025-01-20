@interface CKDBFileTransfer
- (BOOL)fileIsAnimated;
- (BOOL)hideAttachment;
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isDirectory;
- (BOOL)isDownloadable;
- (BOOL)isDownloading;
- (BOOL)isFileDataReady;
- (BOOL)isFileURLFinalized;
- (BOOL)isFromMomentShare;
- (BOOL)isRejected;
- (BOOL)isRestoring;
- (BOOL)isScreenshot;
- (BOOL)isSticker;
- (BOOL)isThumbnail;
- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9;
- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6;
- (CKDBFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4;
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
- (NSURL)shareURL;
- (NSURL)thumbnailURL;
- (int64_t)commSafetySensitive;
- (int64_t)previewGenerationState;
- (int64_t)transferState;
- (int64_t)updateReason;
- (unint64_t)currentBytes;
- (unint64_t)stickerEffectType;
- (unint64_t)totalBytes;
- (void)setAttributionInfo:(id)a3;
- (void)setFilename:(id)a3;
- (void)setPreviewGenerationState:(int64_t)a3;
- (void)setStickerEffectType:(unint64_t)a3;
- (void)setTransferState:(int64_t)a3;
@end

@implementation CKDBFileTransfer

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDBFileTransfer;
  v4 = [(CKDBFileTransfer *)&v11 description];
  v5 = [(CKDBFileTransfer *)self guid];
  v6 = [(CKDBFileTransfer *)self fileURL];
  v7 = [(CKDBFileTransfer *)self transcoderUserInfo];
  v8 = [(CKDBFileTransfer *)self filename];
  v9 = [v3 stringWithFormat:@"[%@ transferGUID:%@ fileURL:%@ transcoderUserInfo:%@ filename:%@]", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v35.receiver = self;
  v35.super_class = (Class)CKDBFileTransfer;
  v20 = [(CKDBFileTransfer *)&v35 init];
  if (v20)
  {
    v21 = [NSString stringGUID];
    uint64_t v22 = [v21 copy];
    guid = v20->_guid;
    v20->_guid = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v24;

    uint64_t v26 = [v16 copy];
    transcoderUserInfo = v20->_transcoderUserInfo;
    v20->_transcoderUserInfo = (NSDictionary *)v26;

    uint64_t v28 = [v17 copy];
    attributionInfo = v20->_attributionInfo;
    v20->_attributionInfo = (NSDictionary *)v28;

    v20->_isSticker = 0;
    uint64_t v30 = [v18 copy];
    adaptiveImageGlyphContentIdentifier = v20->_adaptiveImageGlyphContentIdentifier;
    v20->_adaptiveImageGlyphContentIdentifier = (NSString *)v30;

    uint64_t v32 = [v19 copy];
    adaptiveImageGlyphContentDescription = v20->_adaptiveImageGlyphContentDescription;
    v20->_adaptiveImageGlyphContentDescription = (NSString *)v32;

    v20->_isScreenshot = 0;
    v20->_commSafetySensitive = 0;
    v20->_hideAttachment = a8;
  }

  return v20;
}

- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(v15) = IMIsImageURLAScreenshot();
  v13 = [(CKDBFileTransfer *)self initWithFileURL:v12 transcoderUserInfo:v11 attributionInfo:v10 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:v6 isScreenshot:v15];

  return v13;
}

- (CKDBFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F28B00];
  id v7 = a3;
  v8 = [v6 currentHandler];
  [v8 handleFailureInMethod:a2, self, @"CKDBFileTransfer.m", 70, @"-initWithTransferGUID (%@) should not be called for CKDBFileTransfer", v7 object file lineNumber description];

  return 0;
}

- (BOOL)fileIsAnimated
{
  v2 = IMUTITypeForFilename();
  if (IMUTTypeIsSupportedAnimatedImage()) {
    char v3 = IMFileURLIsActuallyAnimated();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSString)filename
{
  char v3 = [(CKDBFileTransfer *)self fileURL];
  v4 = [v3 lastPathComponent];

  if (!v4) {
    v4 = self->_filename;
  }

  return v4;
}

- (NSString)originalFilename
{
  char v3 = [(CKDBFileTransfer *)self fileURL];
  v4 = [v3 lastPathComponent];

  if (!v4) {
    v4 = self->_originalFilename;
  }

  return v4;
}

- (NSError)error
{
  if ([(CKDBFileTransfer *)self transferState] == 6)
  {
    v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CKFileTransferErrorDomain" code:0 userInfo:0];
  }
  else
  {
    v2 = 0;
  }

  return (NSError *)v2;
}

- (unint64_t)currentBytes
{
  return 0;
}

- (unint64_t)totalBytes
{
  return 0;
}

- (BOOL)isFileURLFinalized
{
  uint64_t v2 = [(CKDBFileTransfer *)self transferState];

  return CKFileTransferIsFileURLFinalized(v2);
}

- (BOOL)isFileDataReady
{
  BOOL v3 = [(CKDBFileTransfer *)self isFileURLFinalized];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(CKDBFileTransfer *)self fileURL];
    BOOL v6 = [v5 path];
    char v7 = [v4 fileExistsAtPath:v6];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)isRejected
{
  return [(CKDBFileTransfer *)self transferState] == 8;
}

- (BOOL)isThumbnail
{
  return [(CKDBFileTransfer *)self transferState] == 9;
}

- (BOOL)isDownloadable
{
  int v3 = [(CKDBFileTransfer *)self isFileDataReady];
  uint64_t v4 = [(CKDBFileTransfer *)self transferState];

  return CKFileTransferIsDownloadable(v3, v4);
}

- (BOOL)isDownloading
{
  char v3 = [(CKDBFileTransfer *)self isFileDataReady];
  uint64_t v4 = [(CKDBFileTransfer *)self transferState];
  v5 = [(CKDBFileTransfer *)self guid];
  char IsDownloading = CKFileTransferIsDownloading(v3, v4, v5);

  return IsDownloading;
}

- (BOOL)isRestoring
{
  return 0;
}

- (BOOL)isAdaptiveImageGlyph
{
  return [(NSString *)self->_adaptiveImageGlyphContentIdentifier length] != 0;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSDictionary)transcoderUserInfo
{
  return self->_transcoderUserInfo;
}

- (NSDictionary)stickerUserInfo
{
  return self->_stickerUserInfo;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (void)setFilename:(id)a3
{
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (int64_t)commSafetySensitive
{
  return self->_commSafetySensitive;
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (BOOL)isFromMomentShare
{
  return self->_isFromMomentShare;
}

- (NSURL)shareURL
{
  return self->_shareURL;
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

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (int64_t)previewGenerationState
{
  return self->_previewGenerationState;
}

- (void)setPreviewGenerationState:(int64_t)a3
{
  self->_previewGenerationState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end