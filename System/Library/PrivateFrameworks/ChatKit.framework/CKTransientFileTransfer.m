@interface CKTransientFileTransfer
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
- (CKTransientFileTransfer)initWithAttributionInfo:(id)a3;
- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9;
- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6;
- (CKTransientFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4;
- (IMMessage)IMMessage;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSDictionary)transcoderUserInfo;
- (NSError)error;
- (NSString)adaptiveImageGlyphContentDescription;
- (NSString)adaptiveImageGlyphContentIdentifier;
- (NSString)audioTranscriptionText;
- (NSString)filename;
- (NSString)guid;
- (NSString)originalFilename;
- (NSURL)animatedImageCacheURL;
- (NSURL)fileURL;
- (NSURL)shareURL;
- (NSURL)thumbnailURL;
- (int64_t)commSafetySensitive;
- (int64_t)previewGenerationState;
- (int64_t)updateReason;
- (unint64_t)currentBytes;
- (unint64_t)stickerEffectType;
- (unint64_t)totalBytes;
- (void)setAttributionInfo:(id)a3;
- (void)setIMMessage:(id)a3;
- (void)setStickerEffectType:(unint64_t)a3;
@end

@implementation CKTransientFileTransfer

- (CKTransientFileTransfer)initWithAttributionInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKTransientFileTransfer;
  v5 = [(CKTransientFileTransfer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CKTransientFileTransfer *)v5 setAttributionInfo:v4];
  }

  return v6;
}

- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  return -[CKTransientFileTransfer initWithAttributionInfo:](self, "initWithAttributionInfo:", a5, a4);
}

- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  LOBYTE(v7) = 0;
  return [(CKTransientFileTransfer *)self initWithFileURL:a3 transcoderUserInfo:a4 attributionInfo:a5 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:a6 isScreenshot:v7];
}

- (CKTransientFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  return -[CKTransientFileTransfer initWithAttributionInfo:](self, "initWithAttributionInfo:", self->attributionInfo, a4);
}

- (int64_t)previewGenerationState
{
  return 1;
}

- (NSDictionary)attributionInfo
{
  return self->attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (unint64_t)currentBytes
{
  return self->currentBytes;
}

- (NSError)error
{
  return self->error;
}

- (NSString)filename
{
  return self->filename;
}

- (NSString)originalFilename
{
  return self->originalFilename;
}

- (NSURL)fileURL
{
  return self->fileURL;
}

- (NSURL)thumbnailURL
{
  return self->thumbnailURL;
}

- (BOOL)fileIsAnimated
{
  return self->fileIsAnimated;
}

- (NSString)guid
{
  return self->guid;
}

- (IMMessage)IMMessage
{
  return self->IMMessage;
}

- (void)setIMMessage:(id)a3
{
}

- (NSDictionary)stickerUserInfo
{
  return self->stickerUserInfo;
}

- (NSDictionary)transcoderUserInfo
{
  return self->transcoderUserInfo;
}

- (int64_t)commSafetySensitive
{
  return self->commSafetySensitive;
}

- (BOOL)isThumbnail
{
  return self->thumbnail;
}

- (BOOL)isDownloadable
{
  return self->downloadable;
}

- (BOOL)isDownloading
{
  return self->downloading;
}

- (BOOL)isFileDataReady
{
  return self->fileDataReady;
}

- (BOOL)isRejected
{
  return self->rejected;
}

- (BOOL)isFileURLFinalized
{
  return self->fileURLFinalized;
}

- (BOOL)hideAttachment
{
  return self->hideAttachment;
}

- (BOOL)isDirectory
{
  return self->isDirectory;
}

- (BOOL)isSticker
{
  return self->isSticker;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->adaptiveImageGlyphContentDescription;
}

- (BOOL)isAdaptiveImageGlyph
{
  return self->isAdaptiveImageGlyph;
}

- (unint64_t)totalBytes
{
  return self->totalBytes;
}

- (BOOL)isFromMomentShare
{
  return self->isFromMomentShare;
}

- (NSURL)shareURL
{
  return self->shareURL;
}

- (NSString)audioTranscriptionText
{
  return self->audioTranscriptionText;
}

- (BOOL)isRestoring
{
  return self->restoring;
}

- (BOOL)isScreenshot
{
  return self->isScreenshot;
}

- (int64_t)updateReason
{
  return self->updateReason;
}

- (unint64_t)stickerEffectType
{
  return self->stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->stickerEffectType = a3;
}

- (NSURL)animatedImageCacheURL
{
  return self->animatedImageCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->shareURL, 0);
  objc_storeStrong((id *)&self->adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->stickerUserInfo, 0);
  objc_storeStrong((id *)&self->IMMessage, 0);
  objc_storeStrong((id *)&self->guid, 0);
  objc_storeStrong((id *)&self->thumbnailURL, 0);
  objc_storeStrong((id *)&self->fileURL, 0);
  objc_storeStrong((id *)&self->originalFilename, 0);
  objc_storeStrong((id *)&self->filename, 0);
  objc_storeStrong((id *)&self->error, 0);

  objc_storeStrong((id *)&self->attributionInfo, 0);
}

@end