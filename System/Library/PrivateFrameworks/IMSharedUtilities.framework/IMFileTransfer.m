@interface IMFileTransfer
+ (BOOL)_doesLocalURLRequireArchiving:(id)a3;
+ (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3 isPluginPayload:(BOOL)a4;
+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7;
+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7 isPluginPayload:(BOOL)a8 isRichLink:(BOOL)a9;
+ (BOOL)genmojiFileTransferShouldDisplayAsPermanentlyFailed:(id)a3;
+ (id)AuxGUIDFromFileTransferGUID:(id)a3;
+ (id)_dictionaryRepresentationGUIDKey;
+ (id)guidByStrippingAuxPrefix:(id)a3;
+ (id)guidForFileTransferDictionary:(id)a3;
+ (id)whitelistedKeys;
+ (int64_t)finalTransferStateForThumbnailMode:(int64_t)a3 success:(BOOL)a4;
+ (int64_t)thumbnailModeForMode:(int64_t)a3 afterDownloadSuccess:(BOOL)a4;
- (BOOL)_hasLegacyPreviewGenerationState;
- (BOOL)_isCloudKitEnabled;
- (BOOL)_isMissingAndDownloadable;
- (BOOL)_needsWrapper;
- (BOOL)_updateWithDictionaryRepresentation:(id)a3;
- (BOOL)appMessageFallbackImage;
- (BOOL)auxStateWasDowngraded;
- (BOOL)canBeAccepted;
- (BOOL)canMarkPurgeable;
- (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3;
- (BOOL)existsAtLocalPath;
- (BOOL)hideAttachment;
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isAnimojiV2;
- (BOOL)isAutoloopVideo;
- (BOOL)isAuxImage;
- (BOOL)isAuxVideo;
- (BOOL)isContact;
- (BOOL)isDirectory;
- (BOOL)isDownloadExpired;
- (BOOL)isDownloadingFromRemoteIntent;
- (BOOL)isFinished;
- (BOOL)isFromMomentShare;
- (BOOL)isGenmojiFallback;
- (BOOL)isHEVCWithAlphaVideo;
- (BOOL)isInThumbnailState;
- (BOOL)isIncoming;
- (BOOL)isLocation;
- (BOOL)isOpusAudioMessage;
- (BOOL)isRecipeBasedSticker;
- (BOOL)isScreenshot;
- (BOOL)isSticker;
- (BOOL)isTemporaryBackwardCompatibilityAsset;
- (BOOL)shouldAttemptToResume;
- (BOOL)shouldForceArchive;
- (BOOL)thumbnailExistsAtLocalPath;
- (BOOL)wantsAlphaRemoved;
- (IMFileTransfer)init;
- (NSArray)attachmentSendContexts;
- (NSData)cloudKitServerChangeTokenBlob;
- (NSDate)createdDate;
- (NSDate)refreshDate;
- (NSDate)startDate;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSDictionary)transcoderUserInfo;
- (NSDictionary)userInfo;
- (NSString)accountID;
- (NSString)adaptiveImageGlyphContentDescription;
- (NSString)adaptiveImageGlyphContentIdentifier;
- (NSString)audioTranscriptionText;
- (NSString)cloudKitRecordID;
- (NSString)displayName;
- (NSString)errorDescription;
- (NSString)filename;
- (NSString)guid;
- (NSString)localPath;
- (NSString)messageGUID;
- (NSString)mimeType;
- (NSString)originalFilename;
- (NSString)originalGUID;
- (NSString)otherPerson;
- (NSString)permanentHighQualityLocalPath;
- (NSString)sandboxToken;
- (NSString)serviceFromUserInfo;
- (NSString)temporaryHighQualityLocalPath;
- (NSString)transferredFilename;
- (NSString)type;
- (NSURL)localURL;
- (NSURL)shareURL;
- (NSURL)temporaryHighQualityLocalURL;
- (NSURL)transferDataURL;
- (double)_lastAveragedInterval;
- (double)_lastUpdatedInterval;
- (id)_auxVideoPathIfItExists;
- (id)_dictionaryRepresentation;
- (id)_dictionaryToSend;
- (id)_initWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 localURL:(id)a6 account:(id)a7 otherPerson:(id)a8 totalBytes:(unint64_t)a9 hfsType:(unsigned int)a10 hfsCreator:(unsigned int)a11 hfsFlags:(unsigned __int16)a12 isIncoming:(BOOL)a13;
- (id)createAndPersistLivePhotoBundleIfNecessary;
- (id)description;
- (int64_t)_resolvedPreviewGenerationState;
- (int64_t)cloudKitSyncState;
- (int64_t)commSafetySensitive;
- (int64_t)error;
- (int64_t)fetchOptions;
- (int64_t)finalTransferStateForSuccess:(BOOL)a3;
- (int64_t)previewGenerationVersion;
- (int64_t)thumbnailMode;
- (int64_t)thumbnailModeAfterDownloadSuccess:(BOOL)a3;
- (int64_t)transferState;
- (int64_t)updateReason;
- (unint64_t)_lastAveragedBytes;
- (unint64_t)averageTransferRate;
- (unint64_t)currentBytes;
- (unint64_t)totalBytes;
- (unsigned)hfsCreator;
- (unsigned)hfsFlags;
- (unsigned)hfsType;
- (void)_calculateTypeInformation;
- (void)_clear;
- (void)_clearLegacyPreviewGenerationState;
- (void)_migratePreviewGenerationState;
- (void)_resetTransferStateIfAttachmentIsMissingAndDownloadable;
- (void)_setAccount:(id)a3 otherPerson:(id)a4;
- (void)_setAveragedTransferRate:(unint64_t)a3 lastAveragedInterval:(double)a4 lastAveragedBytes:(unint64_t)a5;
- (void)_setCurrentBytes:(unint64_t)a3 totalBytes:(unint64_t)a4;
- (void)_setDirectory:(BOOL)a3 hfsType:(unsigned int)a4 hfsCreator:(unsigned int)a5 hfsFlags:(unsigned __int16)a6;
- (void)_setError:(int64_t)a3;
- (void)_setErrorDescription:(id)a3;
- (void)_setFetchOptions:(int64_t)a3;
- (void)_setForceArchive:(BOOL)a3;
- (void)_setLastAveragedInterval:(double)a3;
- (void)_setLastUpdatedInterval:(double)a3;
- (void)_setLocalPath:(id)a3;
- (void)_setLocalURL:(id)a3;
- (void)_setNeedsWrapper:(BOOL)a3;
- (void)_setStartDate:(id)a3;
- (void)_setTransferDataURL:(id)a3;
- (void)_setTransferState:(int64_t)a3;
- (void)_updateWithDictionaryRepresentationForWhitelistedKeys:(id)a3;
- (void)dealloc;
- (void)fixInvalidTransferStateIfNeeded;
- (void)setAccountID:(id)a3;
- (void)setAdaptiveImageGlyphContentDescription:(id)a3;
- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3;
- (void)setAppMessageFallbackImage:(BOOL)a3;
- (void)setAttachmentSendContexts:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setAudioTranscriptionText:(id)a3;
- (void)setAuxStateWasDowngraded:(BOOL)a3;
- (void)setAverageTransferRate:(unint64_t)a3;
- (void)setCloudKitRecordID:(id)a3;
- (void)setCloudKitServerChangeTokenBlob:(id)a3;
- (void)setCloudKitSyncState:(int64_t)a3;
- (void)setCommSafetySensitive:(int64_t)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrentBytes:(unint64_t)a3;
- (void)setFilename:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHfsCreator:(unsigned int)a3;
- (void)setHfsFlags:(unsigned __int16)a3;
- (void)setHfsType:(unsigned int)a3;
- (void)setHideAttachment:(BOOL)a3;
- (void)setIsAuxImage:(BOOL)a3;
- (void)setIsAuxVideo:(BOOL)a3;
- (void)setIsContact:(BOOL)a3;
- (void)setIsDirectory:(BOOL)a3;
- (void)setIsGenmojiFallback:(BOOL)a3;
- (void)setIsIncoming:(BOOL)a3;
- (void)setIsLocation:(BOOL)a3;
- (void)setIsScreenshot:(BOOL)a3;
- (void)setIsSticker:(BOOL)a3;
- (void)setIsTemporaryBackwardCompatibilityAsset:(BOOL)a3;
- (void)setMessageGUID:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setOriginalGUID:(id)a3;
- (void)setOtherPerson:(id)a3;
- (void)setPreviewGenerationState:(int64_t)a3;
- (void)setPreviewGenerationVersion:(int64_t)a3;
- (void)setRefreshDate:(id)a3;
- (void)setSandboxToken:(id)a3;
- (void)setShouldAttemptToResume:(BOOL)a3;
- (void)setStickerUserInfo:(id)a3;
- (void)setTemporaryHighQualityLocalURL:(id)a3;
- (void)setThumbnailMode:(int64_t)a3;
- (void)setTotalBytes:(unint64_t)a3;
- (void)setTranscoderUserInfo:(id)a3;
- (void)setTranscoderUserInfoIsGenmoji:(BOOL)a3;
- (void)setTransferredFilename:(id)a3;
- (void)setType:(id)a3;
- (void)setUpdateReason:(int64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation IMFileTransfer

- (NSString)guid
{
  return self->_guid;
}

- (id)_dictionaryRepresentation
{
  [(IMFileTransfer *)self _calculateTypeInformation];
  v3 = (__CFDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    CFDictionarySetValue(v3, @"IMFileTransferGUID", guid);
  }
  messageGUID = self->_messageGUID;
  if (messageGUID) {
    CFDictionarySetValue(v4, @"IMFileTransferMessageGUID", messageGUID);
  }
  if (self->_transferState)
  {
    v7 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:");
    if (v7) {
      CFDictionarySetValue(v4, @"IMFileTransferStateKey", v7);
    }
  }
  if (self->_isIncoming)
  {
    v8 = (const void *)[NSNumber numberWithBool:1];
    if (v8) {
      CFDictionarySetValue(v4, @"IMFileTransferIsIncomingKey", v8);
    }
  }
  filename = self->_filename;
  if (filename) {
    CFDictionarySetValue(v4, @"IMFileTransferFilenameKey", filename);
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    CFDictionarySetValue(v4, @"IMFileTransferMIMETypeKey", mimeType);
  }
  utiType = self->_utiType;
  if (utiType) {
    CFDictionarySetValue(v4, @"IMFileTransferUTITypeKey", utiType);
  }
  transferredFilename = self->_transferredFilename;
  if (transferredFilename) {
    CFDictionarySetValue(v4, @"IMFileTransferTransferredFilenameKey", transferredFilename);
  }
  if (self->_hfsCreator)
  {
    v13 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:");
    if (v13) {
      CFDictionarySetValue(v4, @"IMFileTransferHFSCreatorKey", v13);
    }
  }
  if (self->_hfsType)
  {
    v14 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:");
    if (v14) {
      CFDictionarySetValue(v4, @"IMFileTransferHFSTypeKey", v14);
    }
  }
  if (self->_hfsFlags)
  {
    v15 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:");
    if (v15) {
      CFDictionarySetValue(v4, @"IMFileTransferHFSFlagsKey", v15);
    }
  }
  localUserInfo = self->_localUserInfo;
  if (localUserInfo) {
    CFDictionarySetValue(v4, @"IMFileTransferLocalUserInfoKey", localUserInfo);
  }
  transcoderUserInfo = self->_transcoderUserInfo;
  if (transcoderUserInfo) {
    CFDictionarySetValue(v4, @"sIMFileTransferTranscoderUserInfoKey", transcoderUserInfo);
  }
  stickerUserInfo = self->_stickerUserInfo;
  if (stickerUserInfo) {
    CFDictionarySetValue(v4, @"sIMFileTransferStickerUserInfoKey", stickerUserInfo);
  }
  attributionInfo = self->_attributionInfo;
  if (attributionInfo) {
    CFDictionarySetValue(v4, @"sIMFileTransferAttributionInfoKey", attributionInfo);
  }
  otherPerson = self->_otherPerson;
  if (otherPerson) {
    CFDictionarySetValue(v4, @"IMFileTransferOtherPersonKey", otherPerson);
  }
  accountID = self->_accountID;
  if (accountID) {
    CFDictionarySetValue(v4, @"IMFileTransferAccountKey", accountID);
  }
  v22 = (const void *)[NSNumber numberWithUnsignedLongLong:self->_currentBytes];
  if (v22) {
    CFDictionarySetValue(v4, @"IMFileTransferCurrentBytesKey", v22);
  }
  v23 = (const void *)[NSNumber numberWithUnsignedLongLong:self->_totalBytes];
  if (v23) {
    CFDictionarySetValue(v4, @"IMFileTransferTotalBytesKey", v23);
  }
  v24 = (const void *)[NSNumber numberWithUnsignedLongLong:self->_averageTransferRate];
  if (v24) {
    CFDictionarySetValue(v4, @"IMFileTransferAverageRateKey", v24);
  }
  v25 = (const void *)[NSNumber numberWithBool:self->_auxStateWasDowngraded];
  if (v25) {
    CFDictionarySetValue(v4, @"sIMFileTransferAuxStateWasDowngradedKey", v25);
  }
  v26 = (const void *)[NSNumber numberWithBool:self->_isAuxVideo];
  if (v26) {
    CFDictionarySetValue(v4, @"sIMFileTransferIsAuxVideoKey", v26);
  }
  v27 = (const void *)[NSNumber numberWithBool:self->_isScreenshot];
  if (v27) {
    CFDictionarySetValue(v4, @"sIMFileTransferIsScreenshotKey", v27);
  }
  audioTranscriptionText = self->_audioTranscriptionText;
  if (audioTranscriptionText) {
    CFDictionarySetValue(v4, @"sIMFileTransferAudioTranscriptionTextKey", audioTranscriptionText);
  }
  adaptiveImageGlyphContentIdentifier = self->_adaptiveImageGlyphContentIdentifier;
  if (adaptiveImageGlyphContentIdentifier) {
    CFDictionarySetValue(v4, @"sIMFileTransferAdaptiveImageGlyphContentIdentifierKey", adaptiveImageGlyphContentIdentifier);
  }
  adaptiveImageGlyphContentDescription = self->_adaptiveImageGlyphContentDescription;
  if (adaptiveImageGlyphContentDescription) {
    CFDictionarySetValue(v4, @"sIMFileTransferAdaptiveImageGlyphContentDescriptionKey", adaptiveImageGlyphContentDescription);
  }
  v31 = (const void *)[NSNumber numberWithBool:self->_isAuxImage];
  if (v31) {
    CFDictionarySetValue(v4, @"sIMFileTransferIsAuxImageKey", v31);
  }
  v32 = (const void *)[NSNumber numberWithBool:self->_isSticker];
  if (v32) {
    CFDictionarySetValue(v4, @"sIMFileTransferIsStickerKey", v32);
  }
  v33 = (const void *)[NSNumber numberWithBool:self->_hideAttachment];
  if (v33) {
    CFDictionarySetValue(v4, @"sIMFileTransferHideAttachmentKey", v33);
  }
  v34 = (const void *)[NSNumber numberWithBool:self->_cloudKitSyncState != 0];
  if (v34) {
    CFDictionarySetValue(v4, @"sIMFileTransferCloudKitSyncStateKey", v34);
  }
  v35 = (const void *)[NSNumber numberWithInteger:self->_commSafetySensitive];
  if (v35) {
    CFDictionarySetValue(v4, @"sIMFileTransferIsCommSafetySensitiveKey", v35);
  }
  v36 = (const void *)[NSNumber numberWithInteger:self->_previewGenerationState];
  if (v36) {
    CFDictionarySetValue(v4, @"IMFileTransferPreviewGenerationStateKey", v36);
  }
  if (self->_isDirectory)
  {
    v37 = (const void *)[NSNumber numberWithBool:1];
    if (v37) {
      CFDictionarySetValue(v4, @"IMFileTransferIsDirectoryKey", v37);
    }
  }
  if (self->_shouldAttemptToResume)
  {
    v38 = (const void *)[NSNumber numberWithBool:1];
    if (v38) {
      CFDictionarySetValue(v4, @"IMFileTransferShouldAttemptToResumeKey", v38);
    }
  }
  if (self->_shouldForceArchive)
  {
    v39 = (const void *)[NSNumber numberWithBool:1];
    if (v39) {
      CFDictionarySetValue(v4, @"IMFileTransferShouldForceArchive", v39);
    }
  }
  if (self->_error)
  {
    v40 = (const void *)objc_msgSend(NSNumber, "numberWithInteger:");
    if (v40) {
      CFDictionarySetValue(v4, @"IMFileTransferErrorReasonKey", v40);
    }
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    CFDictionarySetValue(v4, @"IMFileTransferErrorDescriptionKey", errorDescription);
  }
  startDate = self->_startDate;
  if (startDate)
  {
    [(NSDate *)startDate timeIntervalSince1970];
    v43 = (const void *)objc_msgSend(NSNumber, "numberWithDouble:");
    if (v43) {
      CFDictionarySetValue(v4, @"IMFileTransferStartDate", v43);
    }
  }
  createdDate = self->_createdDate;
  if (createdDate)
  {
    [(NSDate *)createdDate timeIntervalSince1970];
    v45 = (const void *)objc_msgSend(NSNumber, "numberWithDouble:");
    if (v45) {
      CFDictionarySetValue(v4, @"IMFileTransferCreatedDate", v45);
    }
  }
  transferDataURL = self->_transferDataURL;
  if (transferDataURL)
  {
    v47 = [(NSURL *)transferDataURL absoluteString];
    if (v47) {
      CFDictionarySetValue(v4, @"IMFileTransferTransferDataURLKey", v47);
    }
  }
  localURL = self->_localURL;
  if (localURL)
  {
    v49 = [(NSURL *)localURL absoluteString];
    if (v49) {
      CFDictionarySetValue(v4, @"IMFileTransferLocalURLKey", v49);
    }
  }
  temporaryHighQualityLocalURL = self->_temporaryHighQualityLocalURL;
  if (temporaryHighQualityLocalURL)
  {
    v51 = [(NSURL *)temporaryHighQualityLocalURL absoluteString];
    if (v51) {
      CFDictionarySetValue(v4, @"IMFileTransferTemporaryHighQualityLocalURLKey", v51);
    }
  }
  sandboxToken = self->_sandboxToken;
  if (sandboxToken) {
    CFDictionarySetValue(v4, @"sIMFileTransferSandboxTokenKey", sandboxToken);
  }
  v53 = (const void *)[NSNumber numberWithInteger:self->_updateReason];
  if (v53) {
    CFDictionarySetValue(v4, @"IMFileTransferUpdateReasonKey", v53);
  }
  return v4;
}

- (void)_calculateTypeInformation
{
  if (!self->_utiType && [[(NSString *)self->_filename pathExtension] length]) {
    self->_utiType = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C348], "defaultHFSFileManager"), "UTITypeOfPath:", self->_filename);
  }
  if (!self->_mimeType)
  {
    v3 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C348], "defaultHFSFileManager"), "MIMETypeOfPath:", self->_filename);
    self->_mimeType = v3;
    if (!v3)
    {
      if (self->_utiType)
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C348], "defaultHFSFileManager"), "pathExtensionForUTIType:", self->_utiType);
        self->_mimeType = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C348], "defaultHFSFileManager"), "MIMETypeOfPathExtension:", v4);
      }
    }
  }
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (IMFileTransfer)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMFileTransfer;
  result = [(IMFileTransfer *)&v3 init];
  if (result)
  {
    result->_needsWrapper = 1;
    result->_commSafetySensitive = 0;
    result->_updateReason = 0;
    *(void *)&result->_isAuxImage = 0;
    result->_adaptiveImageGlyphContentIdentifier = 0;
    result->_adaptiveImageGlyphContentDescription = 0;
    result->_cloudKitServerChangeTokenBlob = 0;
    result->_cloudKitRecordID = 0;
    result->_cloudKitSyncState = 0;
  }
  return result;
}

- (BOOL)_updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_guid) {
    id v5 = [(IMFileTransfer *)self _dictionaryRepresentation];
  }
  else {
    id v5 = 0;
  }
  [(IMFileTransfer *)self _clear];
  v6 = (NSURL *)[a3 objectForKey:@"IMFileTransferGUID"];
  v7 = v6;
  if (v6
    && ([(NSURL *)v6 isEqualToString:[(NSURL *)v6 im_lastPathComponent]] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412546;
        v34 = v7;
        __int16 v35 = 2112;
        uint64_t v36 = [(NSURL *)v7 im_lastPathComponent];
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with guid that has path specifiers %@. using stripped guid instead %@", (uint8_t *)&v33, 0x16u);
      }
    }
    v7 = [(NSURL *)v7 im_lastPathComponent];
  }
  self->_guid = (NSString *)v7;
  v9 = (NSURL *)[a3 objectForKey:@"IMFileTransferMessageGUID"];
  v10 = v9;
  if (v9
    && ([(NSURL *)v9 isEqualToString:[(NSURL *)v9 im_lastPathComponent]] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(NSURL *)v10 im_lastPathComponent];
        int v33 = 138412546;
        v34 = v10;
        __int16 v35 = 2112;
        uint64_t v36 = v12;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with messageGuid that has path specifiers %@. using stripped message guid instead %@", (uint8_t *)&v33, 0x16u);
      }
    }
    v10 = [(NSURL *)v10 im_lastPathComponent];
  }
  self->_messageGUID = (NSString *)v10;
  self->_transferState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferStateKey"), "integerValue");
  self->_isIncoming = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferIsIncomingKey"), "BOOLValue");
  self->_filename = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferFilenameKey"), "im_lastPathComponent");
  self->_transferredFilename = (NSString *)(id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferTransferredFilenameKey"), "im_lastPathComponent");
  self->_mimeType = (NSString *)(id)[a3 objectForKey:@"IMFileTransferMIMETypeKey"];
  self->_utiType = (NSString *)(id)[a3 objectForKey:@"IMFileTransferUTITypeKey"];
  self->_hfsCreator = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferHFSCreatorKey"), "integerValue");
  self->_hfsType = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferHFSTypeKey"), "integerValue");
  self->_hfsFlags = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferHFSFlagsKey"), "integerValue");
  self->_otherPerson = (NSString *)(id)[a3 objectForKey:@"IMFileTransferOtherPersonKey"];
  self->_accountID = (NSString *)(id)[a3 objectForKey:@"IMFileTransferAccountKey"];
  self->_currentBytes = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferCurrentBytesKey"), "unsignedLongLongValue");
  self->_totalBytes = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferTotalBytesKey"), "unsignedLongLongValue");
  self->_averageTransferRate = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferAverageRateKey"), "unsignedLongLongValue");
  self->_previewGenerationState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferPreviewGenerationStateKey"), "unsignedLongLongValue");
  self->_isDirectory = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferIsDirectoryKey"), "BOOLValue");
  self->_shouldAttemptToResume = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferShouldAttemptToResumeKey"), "BOOLValue");
  self->_shouldForceArchive = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferShouldForceArchive"), "BOOLValue");
  v13 = (void *)[a3 objectForKey:@"IMFileTransferErrorReasonKey"];
  if (v13)
  {
    int64_t v14 = (int)[v13 intValue];
  }
  else
  {
    int64_t v14 = 15;
    if (self->_transferState != 6) {
      int64_t v14 = -1;
    }
  }
  self->_error = v14;
  self->_errorDescription = (NSString *)(id)[a3 objectForKey:@"IMFileTransferErrorDescriptionKey"];
  self->_localUserInfo = (NSDictionary *)(id)[a3 objectForKey:@"IMFileTransferLocalUserInfoKey"];
  self->_transcoderUserInfo = (NSDictionary *)(id)[a3 objectForKey:@"sIMFileTransferTranscoderUserInfoKey"];
  self->_stickerUserInfo = (NSDictionary *)(id)[a3 objectForKey:@"sIMFileTransferStickerUserInfoKey"];
  self->_attributionInfo = (NSDictionary *)(id)[a3 objectForKey:@"sIMFileTransferAttributionInfoKey"];
  if (self->_error == -2) {
    self->_error = 18;
  }
  v15 = (NSDate *)[a3 objectForKey:@"IMFileTransferStartDate"];
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    [(NSDate *)v15 doubleValue];
    v15 = (NSDate *)(id)objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
  }
  self->_startDate = v15;
  v17 = (NSDate *)[a3 objectForKey:@"IMFileTransferCreatedDate"];
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F1C9C8];
    [(NSDate *)v17 doubleValue];
    v17 = (NSDate *)(id)objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
  }
  self->_createdDate = v17;
  uint64_t v19 = [a3 objectForKey:@"IMFileTransferTransferDataURLKey"];
  if (v19) {
    v20 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v19];
  }
  else {
    v20 = 0;
  }
  self->_transferDataURL = v20;
  uint64_t v21 = [a3 objectForKey:@"IMFileTransferLocalURLKey"];
  if (v21)
  {
    v22 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v21];
    if ([(NSURL *)v22 isFileURL])
    {
      self->_localURL = v22;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v33 = 138412290;
          v34 = v22;
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with non-local URL: %@", (uint8_t *)&v33, 0xCu);
        }
      }

      self->_localURL = 0;
    }
  }
  else
  {

    self->_localURL = 0;
  }
  uint64_t v24 = [a3 objectForKey:@"IMFileTransferTemporaryHighQualityLocalURLKey"];
  if (v24)
  {
    v25 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v24];
    if ([(NSURL *)v25 isFileURL])
    {
      self->_temporaryHighQualityLocalURL = v25;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v33 = 138412290;
          v34 = v25;
          _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "tried to update IMFileTransfer with non-file transfer temporaryHighQualityLocalURL: %@", (uint8_t *)&v33, 0xCu);
        }
      }

      self->_temporaryHighQualityLocalURL = 0;
    }
  }
  else
  {

    self->_temporaryHighQualityLocalURL = 0;
  }
  if (!self->_localURL)
  {
    uint64_t v27 = [a3 objectForKey:@"IMFileTransferLocalPathKey"];
    if (v27) {
      [(IMFileTransfer *)self _setLocalPath:v27];
    }
  }
  v28 = (void *)[a3 objectForKey:@"sIMFileTransferAuxStateWasDowngradedKey"];
  if (v28)
  {
    if (self->_auxStateWasDowngraded) {
      char v29 = 1;
    }
    else {
      char v29 = [v28 BOOLValue];
    }
    self->_auxStateWasDowngraded = v29;
  }
  if ([a3 objectForKey:@"sIMFileTransferIsAuxImageKey"])
  {
    char v30 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferIsAuxImageKey"), "BOOLValue");
    if ((v30 & 1) != 0 || self->_auxStateWasDowngraded) {
      self->_isAuxImage = v30;
    }
  }
  if ([a3 objectForKey:@"sIMFileTransferIsAuxVideoKey"])
  {
    char v31 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferIsAuxVideoKey"), "BOOLValue");
    if ((v31 & 1) != 0 || self->_auxStateWasDowngraded) {
      self->_isAuxVideo = v31;
    }
  }
  if ([a3 objectForKey:@"sIMFileTransferIsScreenshotKey"]) {
    self->_isScreenshot = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferIsScreenshotKey"), "BOOLValue");
  }
  if ([a3 objectForKey:@"sIMFileTransferAudioTranscriptionTextKey"]) {
    self->_audioTranscriptionText = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferAudioTranscriptionTextKey"), "copy");
  }
  if ([a3 objectForKey:@"sIMFileTransferIsStickerKey"]) {
    self->_isSticker = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferIsStickerKey"), "BOOLValue");
  }
  self->_adaptiveImageGlyphContentIdentifier = (NSString *)(id)[a3 objectForKey:@"sIMFileTransferAdaptiveImageGlyphContentIdentifierKey"];
  self->_adaptiveImageGlyphContentDescription = (NSString *)(id)[a3 objectForKey:@"sIMFileTransferAdaptiveImageGlyphContentDescriptionKey"];
  if ([a3 objectForKey:@"sIMFileTransferHideAttachmentKey"]) {
    self->_hideAttachment = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferHideAttachmentKey"), "BOOLValue");
  }
  if ([a3 objectForKey:@"sIMFileTransferCloudKitSyncStateKey"]) {
    self->_cloudKitSyncState = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferCloudKitSyncStateKey"), "BOOLValue");
  }
  if ([a3 objectForKey:@"sIMFileTransferIsCommSafetySensitiveKey"]) {
    self->_commSafetySensitive = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"sIMFileTransferIsCommSafetySensitiveKey"), "integerValue");
  }
  if ([a3 objectForKey:@"IMFileTransferUpdateReasonKey"]) {
    self->_updateReason = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"IMFileTransferUpdateReasonKey"), "integerValue");
  }
  self->_sandboxToken = (NSString *)(id)[a3 objectForKey:@"sIMFileTransferSandboxTokenKey"];
  if (v5) {
    return objc_msgSend(v5, "isEqualToDictionary:", -[IMFileTransfer _dictionaryRepresentation](self, "_dictionaryRepresentation")) ^ 1;
  }
  else {
    return 1;
  }
}

- (void)_clear
{
  self->_utiType = 0;
  self->_mimeType = 0;

  self->_messageGUID = 0;
  self->_guid = 0;

  self->_startDate = 0;
  self->_createdDate = 0;

  self->_filename = 0;
  self->_transferDataURL = 0;

  self->_localURL = 0;
  self->_temporaryHighQualityLocalURL = 0;

  self->_otherPerson = 0;
  self->_accountID = 0;

  self->_errorDescription = 0;
  self->_localUserInfo = 0;

  self->_attachmentSendContexts = 0;
  self->_transferredFilename = 0;

  self->_transcoderUserInfo = 0;
  self->_isSticker = 0;

  self->_adaptiveImageGlyphContentIdentifier = 0;
  self->_adaptiveImageGlyphContentDescription = 0;
  self->_isScreenshot = 0;

  self->_stickerUserInfo = 0;
  self->_attributionInfo = 0;
  *(_WORD *)&self->_hideAttachment = 0;
  self->_isContact = 0;
  self->_updateReason = 0;

  self->_commSafetySensitive = 0;
}

+ (BOOL)genmojiFileTransferShouldDisplayAsPermanentlyFailed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 guid];
    switch([v4 transferState])
    {
      case 5:
        char v6 = [v4 existsAtLocalPath];
        if ((v6 & 1) == 0)
        {
          v7 = IMLogHandleForCategory("IMFileTransfer");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_1A09F17A0();
          }
        }
        char v8 = v6 ^ 1;
        goto LABEL_21;
      case 6:
        v9 = IMLogHandleForCategory("IMFileTransfer");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1A09F16D0();
        }
        goto LABEL_19;
      case 7:
        v9 = IMLogHandleForCategory("IMFileTransfer");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1A09F1738();
        }
        goto LABEL_19;
      case 8:
        v9 = IMLogHandleForCategory("IMFileTransfer");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1A09F1668();
        }
        goto LABEL_19;
      case 9:
        v9 = IMLogHandleForCategory("IMFileTransfer");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1A09F1600();
        }
LABEL_19:

        goto LABEL_20;
      default:
        char v8 = 0;
        goto LABEL_21;
    }
  }
  id v5 = IMLogHandleForCategory("IMFileTransfer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1A09F15BC(v5);
  }
LABEL_20:
  char v8 = 1;
LABEL_21:

  return v8;
}

- (BOOL)isFromMomentShare
{
  return [(NSDictionary *)[(IMFileTransfer *)self attributionInfo] objectForKey:@"cmm-url"] != 0;
}

- (NSURL)shareURL
{
  result = [(NSDictionary *)[(IMFileTransfer *)self attributionInfo] objectForKey:@"cmm-url"];
  if (result)
  {
    uint64_t v4 = result;
    if (objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKey:", @"ac"), "unsignedIntValue") == 1)return v4; {
    else
    }
      return 0;
  }
  return result;
}

- (void)dealloc
{
  [(IMFileTransfer *)self _clear];

  self->_cloudKitServerChangeTokenBlob = 0;
  self->_cloudKitRecordID = 0;

  self->_originalGUID = 0;
  self->_audioTranscriptionText = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMFileTransfer;
  [(IMFileTransfer *)&v3 dealloc];
}

+ (BOOL)_doesLocalURLRequireArchiving:(id)a3
{
  objc_super v3 = (void *)[a3 path];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "stringByAppendingPathComponent:", @"Contents"), "stringByAppendingPathComponent:", @"MacOS");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "stringByAppendingPathComponent:", @"Contents"), "stringByAppendingPathComponent:", @"MacOS");
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v4) & 1) != 0
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v5) & 1) != 0
      || sub_1A0865390(v3, 0, &v7);
}

+ (id)_dictionaryRepresentationGUIDKey
{
  return @"IMFileTransferGUID";
}

- (id)_initWithGUID:(id)a3 filename:(id)a4 isDirectory:(BOOL)a5 localURL:(id)a6 account:(id)a7 otherPerson:(id)a8 totalBytes:(unint64_t)a9 hfsType:(unsigned int)a10 hfsCreator:(unsigned int)a11 hfsFlags:(unsigned __int16)a12 isIncoming:(BOOL)a13
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = [(IMFileTransfer *)self init];
  if (v19)
  {
    if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "im_lastPathComponent")) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412546;
          id v25 = a3;
          __int16 v26 = 2112;
          uint64_t v27 = objc_msgSend(a3, "im_lastPathComponent");
          _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "tried to init IMFileTransfer with guid that has path specifiers %@. using stripped guid instead %@", (uint8_t *)&v24, 0x16u);
        }
      }
      a3 = (id)objc_msgSend(a3, "im_lastPathComponent");
    }
    v19->_guid = (NSString *)a3;
    v19->_filename = (NSString *)(id)objc_msgSend(a4, "im_lastPathComponent");
    v19->_accountID = (NSString *)a7;
    v19->_otherPerson = (NSString *)a8;
    v19->_createdDate = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] date];
    v19->_isDirectory = a5;
    v19->_hfsType = a10;
    v19->_hfsCreator = a11;
    v19->_hfsFlags = a12;
    v19->_totalBytes = a9;
    v19->_isIncoming = a13;
    if ([a6 isFileURL])
    {
      [(IMFileTransfer *)v19 _setLocalURL:a6];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        id v25 = a6;
        _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "tried to init IMFileTransfer with non-local URL: %@", (uint8_t *)&v24, 0xCu);
      }
    }
    v19->_needsWrapper = 1;
    *(_DWORD *)&v19->_isAuxImage = 0;
    v19->_adaptiveImageGlyphContentIdentifier = 0;
    v19->_adaptiveImageGlyphContentDescription = 0;
    v22 = (NSString *)a3;
    v19->_commSafetySensitive = 0;
    v19->_originalGUID = v22;
    v19->_updateReason = 0;
  }
  return v19;
}

- (void)_setAccount:(id)a3 otherPerson:(id)a4
{
  if (a3)
  {
    accountID = self->_accountID;
    if (accountID != a3)
    {

      self->_accountID = (NSString *)a3;
    }
  }
  if (a4)
  {
    otherPerson = self->_otherPerson;
    if (otherPerson != a4)
    {

      self->_otherPerson = (NSString *)a4;
    }
  }
}

- (void)_setStartDate:(id)a3
{
  startDate = self->_startDate;
  if (startDate != a3)
  {

    self->_startDate = (NSDate *)a3;
    [a3 timeIntervalSince1970];
    self->_lastAveragedInterval = v6;
  }
}

- (void)_setCurrentBytes:(unint64_t)a3 totalBytes:(unint64_t)a4
{
  [(IMFileTransfer *)self setCurrentBytes:a3];

  MEMORY[0x1F4181798](self, sel_setTotalBytes_);
}

- (void)_setAveragedTransferRate:(unint64_t)a3 lastAveragedInterval:(double)a4 lastAveragedBytes:(unint64_t)a5
{
  self->_averageTransferRate = a3;
  self->_lastAveragedInterval = a4;
  self->_lastAveragedBytes = a5;
}

- (void)_setDirectory:(BOOL)a3 hfsType:(unsigned int)a4 hfsCreator:(unsigned int)a5 hfsFlags:(unsigned __int16)a6
{
  self->_isDirectory = a3;
  self->_hfsType = a4;
  self->_hfsCreator = a5;
  self->_hfsFlags = a6;
}

- (NSString)serviceFromUserInfo
{
  return (NSString *)[(NSDictionary *)self->_localUserInfo objectForKey:@"service"];
}

+ (id)whitelistedKeys
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"IMFileTransferGUID";
  v3[1] = @"IMFileTransferMessageGUID";
  v3[2] = @"IMFileTransferFilenameKey";
  v3[3] = @"IMFileTransferMIMETypeKey";
  v3[4] = @"IMFileTransferUTITypeKey";
  v3[5] = @"IMFileTransferLocalUserInfoKey";
  v3[6] = @"IMFileTransferCreatedDate";
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 7));
}

- (void)_updateWithDictionaryRepresentationForWhitelistedKeys:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v5, "intersectSet:", +[IMFileTransfer whitelistedKeys](IMFileTransfer, "whitelistedKeys"));
  objc_msgSend(a3, "dictionaryWithValuesForKeys:", objc_msgSend(v5, "allObjects"));

  MEMORY[0x1F4181798](self, sel__updateWithDictionaryRepresentation_);
}

- (id)_dictionaryToSend
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (__CFDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = v3;
  guid = self->_guid;
  if (guid) {
    CFDictionarySetValue(v3, @"IMFileTransferGUID", guid);
  }
  messageGUID = self->_messageGUID;
  if (messageGUID) {
    CFDictionarySetValue(v4, @"IMFileTransferMessageGUID", messageGUID);
  }
  filename = self->_filename;
  if (filename) {
    CFDictionarySetValue(v4, @"IMFileTransferFilenameKey", filename);
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    CFDictionarySetValue(v4, @"IMFileTransferMIMETypeKey", mimeType);
  }
  utiType = self->_utiType;
  if (utiType) {
    CFDictionarySetValue(v4, @"IMFileTransferUTITypeKey", utiType);
  }
  localUserInfo = self->_localUserInfo;
  if (localUserInfo) {
    CFDictionarySetValue(v4, @"IMFileTransferLocalUserInfoKey", localUserInfo);
  }
  createdDate = self->_createdDate;
  if (createdDate)
  {
    [(NSDate *)createdDate timeIntervalSince1970];
    uint64_t v12 = (const void *)objc_msgSend(NSNumber, "numberWithDouble:");
    if (v12) {
      CFDictionarySetValue(v4, @"IMFileTransferCreatedDate", v12);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Constructed transfer dictionary to send: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v4;
}

+ (id)guidForFileTransferDictionary:(id)a3
{
  return (id)[a3 _stringForKey:@"IMFileTransferGUID"];
}

- (NSDate)refreshDate
{
  objc_super v3 = [(NSDictionary *)self->_localUserInfo objectForKey:@"refresh-date"];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([(NSDate *)[(IMFileTransfer *)self createdDate] compare:v3] != NSOrderedDescending) {
      return v4;
    }
  }

  return [(IMFileTransfer *)self createdDate];
}

- (NSString)originalFilename
{
  id v3 = [(NSDictionary *)[(IMFileTransfer *)self userInfo] objectForKey:@"service"];
  if (!v3 || ![(__CFString *)IMServiceNameRCS[0] isEqualToString:v3]) {
    return self->_filename;
  }
  id v4 = [(NSDictionary *)[(IMFileTransfer *)self userInfo] objectForKey:@"file"];

  return (NSString *)[v4 objectForKey:@"fileName"];
}

- (void)fixInvalidTransferStateIfNeeded
{
  if (![(IMFileTransfer *)self isFinished]
    && ![(IMFileTransfer *)self isInThumbnailState]
    && [(IMFileTransfer *)self transferState])
  {
    [(IMFileTransfer *)self _setTransferState:7];
    MEMORY[0x1F4181798](self, sel__setError_);
  }
}

- (BOOL)isDownloadExpired
{
  id v3 = [(NSDictionary *)[(IMFileTransfer *)self userInfo] objectForKey:@"service"];
  if (v3 && [(__CFString *)IMServiceNameRCS[0] isEqualToString:v3])
  {
    id v4 = objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", @"file"), "objectForKey:", @"validUntil");
    if (v4) {
      return objc_msgSend(v4, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "now")) == -1;
    }
    return 1;
  }
  double v6 = [(IMFileTransfer *)self refreshDate];
  if (!v6)
  {
    double v6 = [(IMFileTransfer *)self createdDate];
    if (!v6) {
      return 1;
    }
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", -2678400.0), "compare:", v6) == 1;
}

- (void)setRefreshDate:(id)a3
{
  if ((IMSharedHelperAreObjectsLogicallySame([(NSDictionary *)self->_localUserInfo objectForKey:@"refresh-date"], a3) & 1) == 0)
  {
    uint64_t v5 = (NSDictionary *)[(NSDictionary *)self->_localUserInfo mutableCopy];

    if (a3) {
      [(NSDictionary *)v5 setObject:a3 forKey:@"refresh-date"];
    }
    else {
      [(NSDictionary *)v5 removeObjectForKey:@"refresh-date"];
    }
    self->_localUserInfo = v5;
  }
}

- (BOOL)canBeAccepted
{
  return self->_isIncoming && [(IMFileTransfer *)self transferState] < 3;
}

- (BOOL)isFinished
{
  return [(IMFileTransfer *)self transferState] <= 6
      && [(IMFileTransfer *)self transferState] > 4;
}

- (NSString)displayName
{
  uint64_t v3 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
  [(IMFileTransfer *)self filename];
  [(IMFileTransfer *)self hfsFlags];

  return (NSString *)MEMORY[0x1F4181798](v3, sel_displayNameOfFileWithName_hfsFlags_);
}

- (BOOL)existsAtLocalPath
{
  if ([(IMFileTransfer *)self isDownloadingFromRemoteIntent]
    || self->_isIncoming && [(IMFileTransfer *)self transferState] != 5)
  {
    return 0;
  }
  uint64_t v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(IMFileTransfer *)self localPath];

  return [v3 fileExistsAtPath:v4];
}

- (BOOL)isDownloadingFromRemoteIntent
{
  return 0;
}

- (BOOL)thumbnailExistsAtLocalPath
{
  int v3 = [(IMFileTransfer *)self isInThumbnailState];
  if (v3)
  {
    id v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [(IMFileTransfer *)self localPath];
    LOBYTE(v3) = [v4 fileExistsAtPath:v5];
  }
  return v3;
}

- (BOOL)isSticker
{
  return [(NSDictionary *)[(IMFileTransfer *)self stickerUserInfo] count] != 0;
}

- (BOOL)isContact
{
  NSUInteger v3 = -[NSString length](-[NSString stringByTrimmingCharactersInSet:](-[IMFileTransfer mimeType](self, "mimeType"), "stringByTrimmingCharactersInSet:", [MEMORY[0x1E4F28B88] whitespaceCharacterSet]), "length");
  if (v3)
  {
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F22500], (CFStringRef)[(IMFileTransfer *)self mimeType], 0);
    CFAutorelease(PreferredIdentifierForTag);
    LOBYTE(v3) = IMUTTypeIsVCard(PreferredIdentifierForTag);
  }
  return v3;
}

- (BOOL)isAnimojiV2
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self transcoderUserInfo] objectForKey:@"AVIsAnimojiV2"];

  return [v2 BOOLValue];
}

- (BOOL)wantsAlphaRemoved
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self transcoderUserInfo] objectForKey:@"AVIsRemoveAlpha"];

  return [v2 BOOLValue];
}

- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3
{
  adaptiveImageGlyphContentIdentifier = self->_adaptiveImageGlyphContentIdentifier;
  if (adaptiveImageGlyphContentIdentifier != a3)
  {

    self->_adaptiveImageGlyphContentIdentifier = (NSString *)a3;
    id v6 = a3;
    [(NSString *)self->_adaptiveImageGlyphContentIdentifier length];
    MEMORY[0x1F4181798](self, sel_setTranscoderUserInfoIsGenmoji_);
  }
}

- (void)setTranscoderUserInfoIsGenmoji:(BOOL)a3
{
  BOOL v3 = a3;
  transcoderUserInfo = self->_transcoderUserInfo;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](transcoderUserInfo, "objectForKeyedSubscript:", @"isGenmoji"), "BOOLValue") != a3)
  {
    if (transcoderUserInfo) {
      id v6 = (id)[(NSDictionary *)transcoderUserInfo mutableCopy];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    char v7 = v6;

    if (v3) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"isGenmoji");
    }
    else {
      [v7 removeObjectForKey:@"isGenmoji"];
    }
    char v8 = (NSDictionary *)[v7 copy];

    self->_transcoderUserInfo = v8;
  }
}

- (BOOL)isGenmojiFallback
{
  id v2 = [(NSDictionary *)self->_transcoderUserInfo objectForKeyedSubscript:@"isGenmojiFallback"];

  return [v2 BOOLValue];
}

- (void)setIsGenmojiFallback:(BOOL)a3
{
  BOOL v3 = a3;
  transcoderUserInfo = self->_transcoderUserInfo;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](transcoderUserInfo, "objectForKeyedSubscript:", @"isGenmojiFallback"), "BOOLValue") != a3)
  {
    if (transcoderUserInfo) {
      id v6 = (id)[(NSDictionary *)transcoderUserInfo mutableCopy];
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    char v7 = v6;

    if (v3) {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"isGenmojiFallback");
    }
    else {
      [v7 removeObjectForKey:@"isGenmojiFallback"];
    }
    char v8 = (NSDictionary *)[v7 copy];

    self->_transcoderUserInfo = v8;
  }
}

- (BOOL)_hasLegacyPreviewGenerationState
{
  id v2 = [(IMFileTransfer *)self attributionInfo];

  return IMFileTransferAttributionInfoHasLegacyState(v2);
}

- (int64_t)_resolvedPreviewGenerationState
{
  int64_t previewGenerationState = self->_previewGenerationState;
  id v4 = [(IMFileTransfer *)self attributionInfo];
  uint64_t v5 = [(IMFileTransfer *)self type];

  return IMFileTransferPreviewGenerationStateWithStoredState(previewGenerationState, v4, (uint64_t)v5);
}

- (void)_migratePreviewGenerationState
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(IMFileTransfer *)self _hasLegacyPreviewGenerationState])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v4 = 138412290;
        uint64_t v5 = [(IMFileTransfer *)self guid];
        _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Migrating transfer GUID %@ to new preview generation state storage", (uint8_t *)&v4, 0xCu);
      }
    }
    [(IMFileTransfer *)self setPreviewGenerationState:[(IMFileTransfer *)self _resolvedPreviewGenerationState]];
  }
}

- (void)_clearLegacyPreviewGenerationState
{
  v4[2] = *MEMORY[0x1E4F143B8];
  if ([(IMFileTransfer *)self _hasLegacyPreviewGenerationState])
  {
    BOOL v3 = (void *)[(NSDictionary *)[(IMFileTransfer *)self attributionInfo] mutableCopy];
    v4[0] = @"pgens";
    v4[1] = @"pgenp";
    objc_msgSend(v3, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 2));
    -[IMFileTransfer setAttributionInfo:](self, "setAttributionInfo:", [v3 copy]);
  }
}

- (void)setPreviewGenerationState:(int64_t)a3
{
  self->_int64_t previewGenerationState = a3;
}

- (int64_t)previewGenerationVersion
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self attributionInfo] objectForKeyedSubscript:@"pgenv"];

  return [v2 integerValue];
}

- (void)setPreviewGenerationVersion:(int64_t)a3
{
  id v5 = (id)[(NSDictionary *)[(IMFileTransfer *)self attributionInfo] mutableCopy];
  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3), @"pgenv");
  uint64_t v6 = [v5 copy];

  [(IMFileTransfer *)self setAttributionInfo:v6];
}

- (BOOL)canMarkPurgeable
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSString *)[(IMFileTransfer *)self filename] pathExtension];
  uint64_t v4 = [(NSString *)v3 im_isAudioMessageExtension];
  BOOL v5 = [(NSString *)[(IMFileTransfer *)self filename] containsString:@"GroupPhotoImage"];
  uint64_t v6 = [(NSString *)v3 isEqualToString:@"pluginpayload"]
    || [(NSString *)v3 isEqualToString:@"pluginpayloadattachment"];
  LOBYTE(v17) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[IMFileTransfer attributionInfo](self, "attributionInfo"), "objectForKeyedSubscript:", @"bundle-id"), "hasPrefix:", @"com.apple.messages.URLBalloonProvider");
  int v7 = objc_msgSend((id)objc_opt_class(), "canMarkPurgeableWithCKSyncState:transferState:isAudio:isSticker:isGroupPhoto:isPluginPayload:isRichLink:", -[IMFileTransfer cloudKitSyncState](self, "cloudKitSyncState"), -[IMFileTransfer transferState](self, "transferState"), v4, -[IMFileTransfer isSticker](self, "isSticker"), v5, v6, v17);
  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(IMFileTransfer *)self guid];
      v10 = [(IMFileTransfer *)self filename];
      int64_t v11 = [(IMFileTransfer *)self cloudKitSyncState];
      int64_t v12 = [(IMFileTransfer *)self transferState];
      if ([(IMFileTransfer *)self hideAttachment]) {
        v13 = @"YES";
      }
      else {
        v13 = @"NO";
      }
      id v14 = [(NSDictionary *)[(IMFileTransfer *)self attributionInfo] objectForKeyedSubscript:@"bundle-id"];
      if (v7) {
        int v15 = @"YES";
      }
      else {
        int v15 = @"NO";
      }
      *(_DWORD *)buf = 138413826;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2048;
      int64_t v23 = v11;
      __int16 v24 = 2048;
      int64_t v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      char v31 = v15;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "canMarkPurgeable transfer: %@ file: [%@], cloudKitSyncState: [%ld], transferState: [%ld], hideAttachment: [%@], bundleID: [%@], purgeable: [%@]", buf, 0x48u);
    }
  }
  return v7;
}

- (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3
{
  BOOL v3 = [[(NSString *)[(IMFileTransfer *)self filename] pathExtension] lowercaseString];
  if (![(NSString *)v3 isEqualToString:@"pluginpayload"]) {
    [(NSString *)v3 isEqualToString:@"pluginpayloadattachment"];
  }
  uint64_t v4 = objc_opt_class();

  return MEMORY[0x1F4181798](v4, sel_canMarkPurgeableIfIsRichLink_isPluginPayload_);
}

+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7
{
  LOBYTE(v8) = 0;
  return [a1 canMarkPurgeableWithCKSyncState:a3 transferState:a4 isAudio:a5 isSticker:a6 isGroupPhoto:a7 isPluginPayload:0 isRichLink:v8];
}

+ (BOOL)canMarkPurgeableWithCKSyncState:(int64_t)a3 transferState:(int64_t)a4 isAudio:(BOOL)a5 isSticker:(BOOL)a6 isGroupPhoto:(BOOL)a7 isPluginPayload:(BOOL)a8 isRichLink:(BOOL)a9
{
  if (a3 != 1 || a4 != 5 || a5 || a6 || a7) {
    return 0;
  }
  else {
    return MEMORY[0x1F4181798](a1, sel_canMarkPurgeableIfIsRichLink_isPluginPayload_);
  }
}

+ (BOOL)canMarkPurgeableIfIsRichLink:(BOOL)a3 isPluginPayload:(BOOL)a4
{
  return !a4 || a3;
}

- (BOOL)isLocation
{
  id v2 = [(IMFileTransfer *)self mimeType];

  return [(NSString *)v2 isEqualToString:@"text/x-vlocation"];
}

- (BOOL)isRecipeBasedSticker
{
  BOOL v3 = [(IMFileTransfer *)self isSticker];
  if (v3) {
    LOBYTE(v3) = objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer stickerUserInfo](self, "stickerUserInfo"), "objectForKey:", @"srecipe"), "length") != 0;
  }
  return v3;
}

- (BOOL)isAutoloopVideo
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self transcoderUserInfo] objectForKey:@"AVIsAutoloopVideo"];

  return [v2 BOOLValue];
}

- (BOOL)isOpusAudioMessage
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self transcoderUserInfo] objectForKey:@"AVIsOpusAudioMessage"];

  return [v2 BOOLValue];
}

- (BOOL)isHEVCWithAlphaVideo
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self transcoderUserInfo] objectForKey:@"AVIsHEVCWithAlphaVideo"];

  return [v2 BOOLValue];
}

- (BOOL)isAdaptiveImageGlyph
{
  return [(NSString *)self->_adaptiveImageGlyphContentIdentifier length] != 0;
}

- (BOOL)isInThumbnailState
{
  return [(IMFileTransfer *)self transferState] == 9;
}

- (int64_t)thumbnailMode
{
  return (int)objc_msgSend(-[NSDictionary objectForKey:](-[IMFileTransfer userInfo](self, "userInfo"), "objectForKey:", @"thumbMode"), "intValue");
}

- (void)setThumbnailMode:(int64_t)a3
{
  if ((int)objc_msgSend(-[NSDictionary objectForKey:](self->_localUserInfo, "objectForKey:", @"thumbMode"), "intValue") != a3)
  {
    BOOL v5 = (NSDictionary *)[(NSDictionary *)self->_localUserInfo mutableCopy];

    if (a3) {
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", [NSNumber numberWithInteger:a3], @"thumbMode");
    }
    else {
      [(NSDictionary *)v5 removeObjectForKey:@"thumbMode"];
    }
    self->_localUserInfo = v5;
  }
}

- (BOOL)isTemporaryBackwardCompatibilityAsset
{
  id v2 = [(NSDictionary *)[(IMFileTransfer *)self userInfo] objectForKey:@"isTemporaryBackwardCompatibilityAsset"];

  return [v2 BOOLValue];
}

- (void)setIsTemporaryBackwardCompatibilityAsset:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMFileTransfer *)self isTemporaryBackwardCompatibilityAsset] != a3)
  {
    BOOL v5 = (NSDictionary *)[(NSDictionary *)self->_localUserInfo mutableCopy];

    if (v3) {
      -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", [NSNumber numberWithBool:1], @"isTemporaryBackwardCompatibilityAsset");
    }
    else {
      [(NSDictionary *)v5 removeObjectForKey:@"isTemporaryBackwardCompatibilityAsset"];
    }
    self->_localUserInfo = v5;
  }
}

- (void)_setTransferDataURL:(id)a3
{
  transferDataURL = self->_transferDataURL;
  if (transferDataURL != a3)
  {

    self->_transferDataURL = (NSURL *)a3;
  }
}

- (NSString)localPath
{
  id v2 = [(IMFileTransfer *)self localURL];

  return [(NSURL *)v2 path];
}

- (NSString)temporaryHighQualityLocalPath
{
  id v2 = [(IMFileTransfer *)self temporaryHighQualityLocalURL];

  return [(NSURL *)v2 path];
}

- (NSString)permanentHighQualityLocalPath
{
  id v2 = [(IMFileTransfer *)self localPath];

  return (NSString *)MEMORY[0x1F4181798](v2, sel___im_filePathWithVariant_);
}

- (void)_setLocalPath:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
    [(IMFileTransfer *)self _setLocalURL:v4];
  }
}

- (void)_setLocalURL:(id)a3
{
  localURL = self->_localURL;
  if (localURL != a3)
  {

    self->_localURL = (NSURL *)a3;
  }
  if (a3)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "path"), "lastPathComponent");
    filename = self->_filename;
    if (filename != (NSString *)v6)
    {
      uint64_t v8 = (void *)v6;

      self->_filename = (NSString *)v8;
    }
  }
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)type
{
  return self->_utiType;
}

- (unsigned)hfsType
{
  return self->_hfsType;
}

- (id)description
{
  uint64_t v19 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v3);
  int64_t v4 = [(IMFileTransfer *)self transferState];
  if ((unint64_t)(v4 + 1) > 0xA) {
    BOOL v5 = @"Unknown";
  }
  else {
    BOOL v5 = off_1E5A14D68[v4 + 1];
  }
  uint64_t v17 = v5;
  uint64_t v6 = [(IMFileTransfer *)self cloudKitSyncState];
  int v7 = [(IMFileTransfer *)self localURL];
  uint64_t v8 = [(IMFileTransfer *)self transferredFilename];
  v9 = [(IMFileTransfer *)self guid];
  int64_t v10 = [(IMFileTransfer *)self error];
  unint64_t totalBytes = self->_totalBytes;
  int64_t v12 = [(IMFileTransfer *)self createdDate];
  int64_t v13 = [(IMFileTransfer *)self commSafetySensitive];
  unint64_t v14 = [(IMFileTransfer *)self updateReason];
  if (v14 > 2) {
    int v15 = @"Unhandled New Case";
  }
  else {
    int v15 = off_1E5A14DC0[v14];
  }
  return (id)[v19 stringWithFormat:@"[%@: %p  state: %@  sync state: %@  local path: %@  transferred name: %@  guid: %@  error: %d  total bytes: %d  created: %@ commSafety: %d update reason: %@]", v18, self, v17, IMStringFromCKSyncState(v6), v7, v8, v9, v10, totalBytes, v12, v13, v15];
}

- (unint64_t)totalBytes
{
  if ([(IMFileTransfer *)self transferState] == 5 && !self->_totalBytes)
  {
    uint64_t v5 = 0;
    BOOL v3 = [(IMFileTransfer *)self localPath];
    if ([(NSString *)v3 length]) {
      self->_unint64_t totalBytes = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C348], "defaultHFSFileManager"), "attributesOfItemAtPath:error:", v3, &v5), "fileSize");
    }
  }
  return self->_totalBytes;
}

- (unint64_t)currentBytes
{
  if ([(IMFileTransfer *)self transferState] != 5
    || [(IMFileTransfer *)self isDownloadingFromRemoteIntent])
  {
    return self->_currentBytes;
  }

  return MEMORY[0x1F4181798](self, sel_totalBytes);
}

+ (id)AuxGUIDFromFileTransferGUID:(id)a3
{
  if (a3)
  {
    return (id)objc_msgSend(@"Aux_", "stringByAppendingString:");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "nil guid passed to AuxGUIDFromFileTransferGUID", v5, 2u);
      }
    }
    return 0;
  }
}

+ (id)guidByStrippingAuxPrefix:(id)a3
{
  if (a3)
  {
    return (id)[a3 stringByReplacingOccurrencesOfString:@"Aux_" withString:&stru_1EF2CAD28];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "nil guid passed to guidByStrippingAuxPrefix", v5, 2u);
      }
    }
    return 0;
  }
}

- (int64_t)finalTransferStateForSuccess:(BOOL)a3
{
  [(IMFileTransfer *)self thumbnailMode];

  return MEMORY[0x1F4181798](IMFileTransfer, sel_finalTransferStateForThumbnailMode_success_);
}

+ (int64_t)finalTransferStateForThumbnailMode:(int64_t)a3 success:(BOOL)a4
{
  int64_t v4 = 9;
  if (a4) {
    int64_t v4 = 5;
  }
  int64_t v5 = 5;
  if (!a4) {
    int64_t v5 = 0;
  }
  uint64_t v6 = 9;
  if (!a4) {
    uint64_t v6 = 0;
  }
  if (a3 == 1) {
    int64_t v5 = v6;
  }
  if (a3 == 2) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (int64_t)thumbnailModeForMode:(int64_t)a3 afterDownloadSuccess:(BOOL)a4
{
  int64_t v4 = a3 - 1;
  if (a4) {
    int64_t v4 = a3 == 1;
  }
  if (a3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (int64_t)thumbnailModeAfterDownloadSuccess:(BOOL)a3
{
  [(IMFileTransfer *)self thumbnailMode];

  return MEMORY[0x1F4181798](IMFileTransfer, sel_thumbnailModeForMode_afterDownloadSuccess_);
}

- (id)createAndPersistLivePhotoBundleIfNecessary
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSString *)[(IMFileTransfer *)self localPath] __im_livePhotoBundlePathWithGUID:[(IMFileTransfer *)self guid]];
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = [(IMFileTransfer *)self guid];
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Live Photo bundle path didn't exist for transfer with GUID %@", buf, 0xCu);
      }
    }
    int64_t v5 = [(IMFileTransfer *)self localPath];
    id v6 = [(IMFileTransfer *)self _auxVideoPathIfItExists];
    id v7 = v6;
    if (!v5)
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      int64_t v11 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      int64_t v12 = [(IMFileTransfer *)self guid];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      int64_t v10 = "Live Photo bundle could not be created because the image path didn't exist for transfer with GUID %@, videoC"
            "omplementPath: %@";
      int64_t v13 = v11;
      uint32_t v14 = 22;
      goto LABEL_18;
    }
    if (!v6)
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      int v15 = [(IMFileTransfer *)self guid];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      int64_t v10 = "Live Photo bundle could not be created because the video complement path didn't exist for transfer with GUID %@";
LABEL_17:
      int64_t v13 = v8;
      uint32_t v14 = 12;
LABEL_18:
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, v10, buf, v14);
      return 0;
    }
    if ([(NSString *)v5 isEqualToString:v6])
    {
      if (!IMOSLoggingEnabled()) {
        return 0;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      v9 = [(IMFileTransfer *)self guid];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      int64_t v10 = "Live Photo bundle could not be created because the image and video complement paths are the same for transfer with GUID %@";
      goto LABEL_17;
    }
    v16 = [[(NSString *)v5 stringByDeletingLastPathComponent] stringByAppendingPathComponent:[(IMFileTransfer *)self guid]];
    __int16 v35 = 0;
    uint64_t v36 = (uint64_t)&v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v17 = (void *)qword_1EB4A5E68;
    v38 = (void *)qword_1EB4A5E68;
    if (!qword_1EB4A5E68)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1A08680DC;
      v43 = (void (*)(uint64_t, uint64_t))&unk_1E5A10130;
      v44 = (void (*)(uint64_t))&v35;
      v18 = (void *)sub_1A086812C();
      uint64_t v19 = dlsym(v18, "PFLivePhotoBundleExtension");
      *(void *)(*((void *)v44 + 1) + 24) = v19;
      qword_1EB4A5E68 = *(void *)(*((void *)v44 + 1) + 24);
      uint64_t v17 = *(void **)(v36 + 24);
    }
    _Block_object_dispose(&v35, 8);
    if (!v17)
    {
      sub_1A09EEB7C();
      __break(1u);
    }
    BOOL v3 = [(NSString *)v16 stringByAppendingPathExtension:*v17];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    v43 = sub_1A077794C;
    v44 = sub_1A0777798;
    __int16 v20 = (objc_class *)qword_1EB4A5DA0;
    uint64_t v45 = qword_1EB4A5DA0;
    if (!qword_1EB4A5DA0)
    {
      __int16 v35 = (void (*)(uint64_t, uint64_t))MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      uint64_t v37 = (uint64_t)sub_1A08682A0;
      v38 = &unk_1E5A10130;
      v39 = buf;
      sub_1A08682A0((uint64_t)&v35);
      __int16 v20 = *(objc_class **)(*(void *)&buf[8] + 40);
    }
    _Block_object_dispose(buf, 8);
    id v21 = [v20 alloc];
    *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
    *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    __int16 v22 = (void *)[v21 initWithPathToVideo:v7 pathToImage:v5 imageDisplayTime:buf pairingIdentifier:0];
    __int16 v35 = 0;
    if (IMOSLoggingEnabled())
    {
      int64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = [(IMFileTransfer *)self guid];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Creating live photo bundle for transfer %@ at path %@", buf, 0x16u);
      }
    }
    int64_t v25 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    int v26 = [v22 writeToBundleAtURL:v25 error:&v35];

    if (!v26
      || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
    {
      char v31 = IMLogHandleForCategory("IMFileTransfer");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v33 = [(IMFileTransfer *)self guid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        *(_WORD *)&buf[22] = 2112;
        v43 = v35;
        _os_log_error_impl(&dword_1A0772000, v31, OS_LOG_TYPE_ERROR, "Error creating live photo bundle for transfer %@ at path %@. Error: %@", buf, 0x20u);
      }
      return 0;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = [(IMFileTransfer *)self guid];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "Successfully created live photo bundle for transfer %@ at path %@", buf, 0x16u);
      }
    }
    [(NSString *)v3 im_markFileAsPurgeable:1];
    uint64_t v40 = *MEMORY[0x1E4F1C630];
    uint64_t v41 = [NSNumber numberWithBool:1];
    v34 = 0;
    objc_msgSend(v25, "setResourceValues:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1), &v34);
    if (v34)
    {
      id v29 = IMLogHandleForCategory("IMFileTransfer");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = [(IMFileTransfer *)self guid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v43 = v34;
        _os_log_error_impl(&dword_1A0772000, v29, OS_LOG_TYPE_ERROR, "Error setting resource values for transfer %@ at url %@. Error: %@", buf, 0x20u);
      }
    }
  }
  return v3;
}

- (id)_auxVideoPathIfItExists
{
  BOOL v3 = [[(NSString *)[(IMFileTransfer *)self localPath] stringByDeletingPathExtension] stringByAppendingPathExtension:@"MOV"];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0)
  {
    int64_t v4 = [[(NSString *)[(IMFileTransfer *)self localPath] stringByDeletingPathExtension] stringByAppendingPathExtension:@"mov"];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v4)) {
      return v4;
    }
    else {
      return 0;
    }
  }
  return v3;
}

- (BOOL)_isCloudKitEnabled
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (BOOL)_isMissingAndDownloadable
{
  BOOL v3 = [(IMFileTransfer *)self _isCloudKitEnabled];
  BOOL v4 = [(IMFileTransfer *)self existsAtLocalPath];
  if (!v4 && !v3) {
    BOOL v4 = [(IMFileTransfer *)self isDownloadExpired];
  }
  return !v4;
}

- (void)_resetTransferStateIfAttachmentIsMissingAndDownloadable
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(IMFileTransfer *)self _isMissingAndDownloadable])
  {
    [(IMFileTransfer *)self _setTransferState:0];
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v4 = 138412290;
        int64_t v5 = self;
        _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "File not on disk, but in cloudkit or MMCS. Resetting state: %@", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

- (void)setMimeType:(id)a3
{
  self->_mimeType = (NSString *)a3;
}

- (double)_lastUpdatedInterval
{
  return self->_lastUpdatedInterval;
}

- (void)_setLastUpdatedInterval:(double)a3
{
  self->_lastUpdatedInterval = a3;
}

- (double)_lastAveragedInterval
{
  return self->_lastAveragedInterval;
}

- (void)_setLastAveragedInterval:(double)a3
{
  self->_lastAveragedInterval = a3;
}

- (unint64_t)_lastAveragedBytes
{
  return self->_lastAveragedBytes;
}

- (void)setGuid:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (void)_setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSURL)transferDataURL
{
  return self->_transferDataURL;
}

- (void)setType:(id)a3
{
}

- (void)setHfsType:(unsigned int)a3
{
  self->_hfsType = a3;
}

- (unsigned)hfsFlags
{
  return self->_hfsFlags;
}

- (void)setHfsFlags:(unsigned __int16)a3
{
  self->_hfsFlags = a3;
}

- (unsigned)hfsCreator
{
  return self->_hfsCreator;
}

- (void)setHfsCreator:(unsigned int)a3
{
  self->_hfsCreator = a3;
}

- (void)setAccountID:(id)a3
{
}

- (NSString)otherPerson
{
  return self->_otherPerson;
}

- (void)setOtherPerson:(id)a3
{
}

- (void)setCurrentBytes:(unint64_t)a3
{
  self->_currentBytes = a3;
}

- (void)setTotalBytes:(unint64_t)a3
{
  self->_unint64_t totalBytes = a3;
}

- (unint64_t)averageTransferRate
{
  return self->_averageTransferRate;
}

- (void)setAverageTransferRate:(unint64_t)a3
{
  self->_averageTransferRate = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (BOOL)shouldAttemptToResume
{
  return self->_shouldAttemptToResume;
}

- (void)setShouldAttemptToResume:(BOOL)a3
{
  self->_shouldAttemptToResume = a3;
}

- (int64_t)error
{
  return self->_error;
}

- (void)_setError:(int64_t)a3
{
  self->_error = a3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)_setErrorDescription:(id)a3
{
}

- (BOOL)shouldForceArchive
{
  return self->_shouldForceArchive;
}

- (void)_setForceArchive:(BOOL)a3
{
  self->_shouldForceArchive = a3;
}

- (NSDictionary)userInfo
{
  return self->_localUserInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)_needsWrapper
{
  return self->_needsWrapper;
}

- (void)_setNeedsWrapper:(BOOL)a3
{
  self->_needsWrapper = a3;
}

- (NSString)transferredFilename
{
  return self->_transferredFilename;
}

- (void)setTransferredFilename:(id)a3
{
}

- (NSDictionary)transcoderUserInfo
{
  return self->_transcoderUserInfo;
}

- (void)setTranscoderUserInfo:(id)a3
{
}

- (BOOL)isAuxImage
{
  return self->_isAuxImage;
}

- (void)setIsAuxImage:(BOOL)a3
{
  self->_isAuxImage = a3;
}

- (BOOL)isAuxVideo
{
  return self->_isAuxVideo;
}

- (void)setIsAuxVideo:(BOOL)a3
{
  self->_isAuxVideo = a3;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (void)setAdaptiveImageGlyphContentDescription:(id)a3
{
}

- (NSDictionary)stickerUserInfo
{
  return self->_stickerUserInfo;
}

- (void)setStickerUserInfo:(id)a3
{
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

- (void)setHideAttachment:(BOOL)a3
{
  self->_hideAttachment = a3;
}

- (NSArray)attachmentSendContexts
{
  return self->_attachmentSendContexts;
}

- (void)setAttachmentSendContexts:(id)a3
{
}

- (void)setIsLocation:(BOOL)a3
{
  self->_isLocation = a3;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

- (int64_t)cloudKitSyncState
{
  return self->_cloudKitSyncState;
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  self->_cloudKitSyncState = a3;
}

- (NSData)cloudKitServerChangeTokenBlob
{
  return self->_cloudKitServerChangeTokenBlob;
}

- (void)setCloudKitServerChangeTokenBlob:(id)a3
{
}

- (NSString)cloudKitRecordID
{
  return self->_cloudKitRecordID;
}

- (void)setCloudKitRecordID:(id)a3
{
}

- (NSString)sandboxToken
{
  return self->_sandboxToken;
}

- (void)setSandboxToken:(id)a3
{
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (void)setIsScreenshot:(BOOL)a3
{
  self->_isScreenshot = a3;
}

- (NSString)audioTranscriptionText
{
  return self->_audioTranscriptionText;
}

- (void)setAudioTranscriptionText:(id)a3
{
}

- (int64_t)commSafetySensitive
{
  return self->_commSafetySensitive;
}

- (void)setCommSafetySensitive:(int64_t)a3
{
  self->_commSafetySensitive = a3;
}

- (NSURL)localURL
{
  return self->_localURL;
}

- (NSURL)temporaryHighQualityLocalURL
{
  return self->_temporaryHighQualityLocalURL;
}

- (void)setTemporaryHighQualityLocalURL:(id)a3
{
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (BOOL)appMessageFallbackImage
{
  return self->_appMessageFallbackImage;
}

- (void)setAppMessageFallbackImage:(BOOL)a3
{
  self->_appMessageFallbackImage = a3;
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (void)setOriginalGUID:(id)a3
{
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (void)setUpdateReason:(int64_t)a3
{
  self->_updateReason = a3;
}

- (BOOL)auxStateWasDowngraded
{
  return self->_auxStateWasDowngraded;
}

- (void)setAuxStateWasDowngraded:(BOOL)a3
{
  self->_auxStateWasDowngraded = a3;
}

- (int64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)_setFetchOptions:(int64_t)a3
{
  self->_fetchOptions = a3;
}

@end