@interface MessageAttachmentController
+ (id)_capabilitiesForTransfers:(id)a3 supportsASTC:(BOOL)a4;
+ (id)_combinedTransferUserInfoForAttachmentSendContexts:(id)a3 transfer:(id)a4 message:(id)a5 commonCapabilities:(id)a6;
- (BOOL)_previewAttachmentEnabledForStickers;
- (BOOL)_shouldAutoAccept:(id)a3 transfer:(id)a4 isAltAccountDevice:(BOOL)a5 shouldDownloadFromPeer:(BOOL)a6;
- (BOOL)_shouldDisableFasterDownload:(id)a3 message:(id)a4;
- (BOOL)_shouldUploadPayloadDataOverMMCS:(id)a3;
- (BOOL)hasLocalDevice;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4;
- (BOOL)shouldSendLowResolutionOnly;
- (MessageAttachmentController)initWithSession:(id)a3;
- (NSMutableDictionary)eagerUploadStatuses;
- (NSMutableDictionary)localPayloadDataRequestGUIDToCompletionBlockMap;
- (NSMutableSet)pendingRemoteFileRequests;
- (double)_stickerUploadTTL;
- (id)_createPayloadRequestDictionaryForMessageGUID:(id)a3 requestKey:(id)a4;
- (id)_createPayloadResponseDictionaryWithDictionary:(id)a3 payloadData:(id)a4 attachments:(id)a5;
- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 forceAutoDownloadIfPossible:(BOOL)a7 lqmEnabled:(BOOL)a8;
- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 lqmEnabled:(BOOL)a7;
- (id)_fileHash:(id)a3;
- (id)_transferInfoFileForKey:(id)a3;
- (id)_transferInfoForKey:(id)a3;
- (id)attachmentRefreshDeliveryController;
- (id)deliveryController;
- (id)eagerUploadKeyForURL:(id)a3 sizes:(id)a4 transcodeDictionary:(id)a5 capabilities:(id)a6;
- (id)eagerUploadStatusForKey:(id)a3;
- (id)localDeviceProductVersion;
- (unint64_t)_maxCompressedPayloadDataLength;
- (void)_deleteTransferInfoForKey:(id)a3;
- (void)_processDownloadedPayload:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8;
- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8;
- (void)_sendURL:(id)a3 urlToRemove:(id)a4 topic:(id)a5 sessionInfo:(id)a6 messageGUID:(id)a7 transferID:(id)a8 fileTransferGUID:(id)a9 attachmentSendContexts:(id)a10 failIfError:(BOOL)a11 sendStatus:(id)a12 attachmentStatus:(id)a13 group:(id)a14;
- (void)_setTransferInfo:(id)a3 key:(id)a4;
- (void)_transcodeURL:(id)a3 reason:(unint64_t)a4 transfer:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 sendStatus:(id)a8 urlGroup:(id)a9 didTranscode:(id)a10 handleURL:(id)a11;
- (void)downloadPayloadDataForMessageGUID:(id)a3 payLoadDictionary:(id)a4 topic:(id)a5 completionBlock:(id)a6;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)fetchPayloadDataFromCompanionForGUID:(id)a3 completionBlock:(id)a4;
- (void)findTranscoderCapabilitiesAcrossRecipients:(id)a3 forTransfers:(id)a4 completion:(id)a5;
- (void)handlePayloadDataRequest:(id)a3 attempts:(unint64_t)a4;
- (void)handlePayloadDataResponse:(id)a3;
- (void)handleTranscodeCompletionBlockForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 attemptedTranscode:(BOOL)a6 transcodedTransferGUIDs:(id)a7 containsAutoLoopVideo:(BOOL)a8 outputURLs:(id)a9 text:(id)a10 success:(BOOL)a11 error:(id)a12 completionBlock:(id)a13;
- (void)processDownloadedPayloadData:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8;
- (void)processMessageAttachmentDictionary:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8;
- (void)remoteFileResponse:(id)a3;
- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5;
- (void)retrieveAttachmentsForMessage:(id)a3 inlineAttachments:(id)a4 displayID:(id)a5 topic:(id)a6 comingFromStorage:(BOOL)a7 shouldForceAutoDownload:(BOOL)a8 senderContext:(id)a9 completionBlock:(id)a10;
- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13;
- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 commonCapabilities:(id)a7 mode:(unint64_t)a8 sessionInfo:(id)a9 topic:(id)a10 completionBlock:(id)a11 uploadFailureBlock:(id)a12;
- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 mode:(unint64_t)a7 fromID:(id)a8 recipients:(id)a9 completionBlock:(id)a10 uploadFailureBlock:(id)a11;
- (void)sendFallbackAttachmentsForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 completionBlock:(id)a6;
- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 fromID:(id)a5 recipients:(id)a6 completionBlock:(id)a7;
- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 sessionInfo:(id)a5 topic:(id)a6 completionBlock:(id)a7;
- (void)sessionInfoForBusinessReceipients:(id)a3 fromID:(id)a4 completion:(id)a5;
- (void)setEagerUploadStatuses:(id)a3;
- (void)setLocalPayloadDataRequestGUIDToCompletionBlockMap:(id)a3;
- (void)setPendingRemoteFileRequests:(id)a3;
- (void)transcribeMessageIfNeeded:(id)a3 forTransfer:(id)a4 completion:(id)a5;
- (void)updateGroupPhoto:(id)a3 forChat:(id)a4 messageGuid:(id)a5;
@end

@implementation MessageAttachmentController

- (MessageAttachmentController)initWithSession:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MessageAttachmentController;
  v3 = [(MessageAttachmentController *)&v10 initWithSession:a3];
  if (v3)
  {
    v4 = +[IMSystemMonitor sharedInstance];
    [v4 setWatchesScreenLightState:1];

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    localPayloadDataRequestGUIDToCompletionBlockMap = v3->_localPayloadDataRequestGUIDToCompletionBlockMap;
    v3->_localPayloadDataRequestGUIDToCompletionBlockMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    eagerUploadStatuses = v3->_eagerUploadStatuses;
    v3->_eagerUploadStatuses = v7;
  }
  return v3;
}

- (id)deliveryController
{
  v2 = [(MessageAttachmentController *)self msgSession];
  v3 = [v2 deliveryController];

  return v3;
}

- (id)attachmentRefreshDeliveryController
{
  v2 = [(MessageAttachmentController *)self msgSession];
  v3 = [v2 attachmentRefreshDeliveryController];

  return v3;
}

- (BOOL)hasLocalDevice
{
  return 0;
}

- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 lqmEnabled:(BOOL)a7
{
  return [(MessageAttachmentController *)self _downloadRestrictionForUTIType:a3 fileSize:a4 qualityType:a5 isSticker:a6 forceAutoDownloadIfPossible:0 lqmEnabled:a7];
}

- (id)_downloadRestrictionForUTIType:(id)a3 fileSize:(unint64_t)a4 qualityType:(unint64_t)a5 isSticker:(BOOL)a6 forceAutoDownloadIfPossible:(BOOL)a7 lqmEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v40 = a7;
  BOOL v9 = a6;
  id v12 = a3;
  char v41 = 0;
  if (a5 == 1
    && !v8
    && (+[IMFeatureFlags sharedFeatureFlags],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 isHighQualityPhotosEnabled],
        v13,
        v14))
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Using high quality photo size limit for download.", buf, 2u);
      }
    }
    id v16 = +[IMDAttachmentUtilities modernHighQualityPhotoSizeLimit];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "*Not* using high quality photo size limit for download", buf, 2u);
      }
    }
    id v16 = +[IMDAttachmentUtilities largeFileSizeFor:v12 allowedLargerRepresentation:&v41];
  }
  unint64_t v18 = (unint64_t)v16;
  unint64_t v19 = (unint64_t)+[IMDAttachmentUtilities freeSpaceInHomeDirectory];
  if (v19 < (unint64_t)+[IMDAttachmentUtilities minimumFreeSpace]|| (double)a4 + (double)a4 > (double)v19)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v43 = v19;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Not enough free space to download: %llu", buf, 0xCu);
      }
    }
    if (v41) {
      +[AttachmentDownloadRestriction noSpaceForHighQualityLimit:v18 qualityType:a5 isSticker:v9 lqmEnabled:v8];
    }
    else {
    uint64_t v21 = +[AttachmentDownloadRestriction noSpaceForLowQualityLimit:v18 qualityType:a5 isSticker:v9 lqmEnabled:v8];
    }
    goto LABEL_24;
  }
  v24 = +[IMLockdownManager sharedInstance];
  if ([v24 isInternalInstall])
  {
    int v25 = IMGetCachedDomainBoolForKey();

    if (v25)
    {
      uint64_t v21 = +[AttachmentDownloadRestriction restrictionAllowedBySettingWithQualityType:a5 isSticker:v9 lqmEnabled:v8];
LABEL_24:
      v22 = (void *)v21;
      goto LABEL_25;
    }
  }
  else
  {
  }
  v26 = +[IMLockdownManager sharedInstance];
  if ([v26 isInternalInstall])
  {
    int v27 = IMGetCachedDomainBoolForKey();

    if (v27)
    {
      uint64_t v21 = +[AttachmentDownloadRestriction restrictionDisallowedBySettingWithQualityType:a5 isSticker:v9 lqmEnabled:v8];
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (v41) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = 2;
  }
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Should auto download:", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = a4 >> 10;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "           File Size: %lld kb", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = v19 >> 10;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "          Free Space: %lld kb", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = v18 >> 10;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "    Max Size Allowed: %lld kb", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      if (v41) {
        CFStringRef v34 = @"YES";
      }
      else {
        CFStringRef v34 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v34;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "        Was HQ limit: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      CFStringRef v36 = @"NO";
      if (v40) {
        CFStringRef v36 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v36;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Should Force Auto Download: %@", buf, 0xCu);
    }
  }
  if (v40) {
    +[AttachmentDownloadRestriction restrictionForceAllowedWithQualityType:a5 isSticker:v9 lqmEnabled:v8];
  }
  else {
  v22 = +[AttachmentDownloadRestriction restrictionWithLimitType:v28 limitSize:v18 qualityType:a5 isSticker:v9 allowDownload:v18 > a4 lqmEnabled:v8];
  }
  if (IMOSLoggingEnabled())
  {
    v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      unsigned int v38 = [v22 allowDownload];
      CFStringRef v39 = @"NO";
      if (v38) {
        CFStringRef v39 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v39;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "  Download Restriction Result: %@", buf, 0xCu);
    }
  }
LABEL_25:

  return v22;
}

- (BOOL)_previewAttachmentEnabledForStickers
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  v3 = [v2 objectForKey:@"disableStickerPreviewSize"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Not enabling preview size for sticker", v7, 2u);
      }
    }
    return 0;
  }
  else
  {
    return +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled];
  }
}

- (double)_stickerUploadTTL
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"fast-transfer-ttl"];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        [v3 doubleValue];
        int v11 = 134217984;
        uint64_t v12 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Server bag MMCS parameter TTL %f", (uint8_t *)&v11, 0xCu);
      }
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 2160000.0;
    if (v4)
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        uint64_t v12 = 0x41407AC000000000;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "No server bag MMCS parameter TTL set. Using default value %f", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  return v8;
}

- (id)_transferInfoFileForKey:(id)a3
{
  id v4 = a3;
  v5 = IMStickerTransferInfoDirectoryURL();
  uint64_t v6 = [v5 path];
  double v7 = [v6 stringByExpandingTildeInPath];

  IMSharedHelperEnsureDirectoryExistsAtPath();
  if ([(MessageAttachmentController *)self _previewAttachmentEnabledForStickers])
  {
    double v8 = [v4 stringByAppendingString:@"-preview"];
    BOOL v9 = [v8 lastPathComponent];

    if (IMOSLoggingEnabled())
    {
      objc_super v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_transferInfoFileForKey _previewAttachmentEnabled computed file name %@ ", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    BOOL v9 = v4;
  }
  int v11 = [v7 stringByAppendingPathComponent:v9];
  uint64_t v12 = [v11 stringByAppendingPathExtension:@"plist"];

  return v12;
}

- (void)_setTransferInfo:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    BOOL v9 = [(MessageAttachmentController *)self _transferInfoFileForKey:v7];
    if (IMOSLoggingEnabled())
    {
      objc_super v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_setTransferInfo plistFilePath %@", buf, 0xCu);
      }
    }
    int v11 = +[NSFileManager defaultManager];
    unsigned int v12 = [v11 fileExistsAtPath:v9 isDirectory:0];

    if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v9;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "transferUserInfo plist already present at path %@", buf, 0xCu);
        }
      }
      int v14 = +[NSFileManager defaultManager];
      id v24 = 0;
      [v14 removeItemAtPath:v9 error:&v24];
      id v15 = v24;

      if (v15 && IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v9;
          __int16 v27 = 2112;
          id v28 = v15;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Attachments could not delete file at path %@, error %@", buf, 0x16u);
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "_setTransferInfo key:%@ transferInfo:%@", buf, 0x16u);
      }
    }
    [v6 writeToFile:v9 atomically:1];
    unint64_t v18 = +[NSFileManager defaultManager];
    unint64_t v19 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSFileProtectionCompleteUntilFirstUserAuthentication, NSFileProtectionKey, 0);
    id v23 = 0;
    [v18 setAttributes:v19 ofItemAtPath:v9 error:&v23];
    id v20 = v23;

    if (v20 && IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v20;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Attachments could not make class C for file at path %@ error %@", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "_setTransferInfo invalid parameters. transferUserInfo %@, userInfoKey %@", buf, 0x16u);
    }
  }
}

- (id)_transferInfoForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MessageAttachmentController *)self _transferInfoFileForKey:v4];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "_transferInfoForKey plistFilePath %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v7 = +[NSDictionary dictionaryWithContentsOfFile:v5];
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        int v14 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "_transferInfoForKey key:%@ object:%@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Attachments nil key passed to _transferInfoForKey ", (uint8_t *)&v11, 2u);
      }
    }
    id v7 = 0;
  }

  return v7;
}

- (void)_deleteTransferInfoForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MessageAttachmentController *)self _transferInfoFileForKey:v4];
    id v6 = +[NSFileManager defaultManager];
    id v11 = 0;
    [v6 removeItemAtPath:v5 error:&v11];
    id v7 = v11;

    int v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        BOOL v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v13 = v5;
          __int16 v14 = 2112;
          id v15 = v7;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "_deleteTransferInfoForKey failed to delete file at path %@ error %@", buf, 0x16u);
        }
LABEL_14:
      }
    }
    else if (v8)
    {
      BOOL v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v13 = v5;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "_deleteTransferInfoForKey deleted file at path %@", buf, 0xCu);
      }
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_deleteTransferInfoForKey nil key passed in. Not deleting", buf, 2u);
    }
  }
LABEL_16:
}

- (id)_fileHash:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = IMSharedHelperMD5HashOfFileAtPath();
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412546;
        id v9 = v3;
        __int16 v10 = 2112;
        id v11 = v4;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "filePath %@ fileHash %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "nil filePath to _fileHash", (uint8_t *)&v8, 2u);
      }
    }
    id v4 = 0;
  }

  return v4;
}

- (void)updateGroupPhoto:(id)a3 forChat:(id)a4 messageGuid:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = [v8 groupPhotoGuid];
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v35 = v10;
      __int16 v36 = 2112;
      id v37 = v7;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Updating group photo from %@ to %@ for chat %@", buf, 0x20u);
    }
  }
  if (IMSharedHelperAreObjectsLogicallySame())
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, " => Failed to update", buf, 2u);
      }
    }
  }
  else
  {
    __int16 v13 = +[IMDFileTransferCenter sharedInstance];
    __int16 v14 = [v13 transferForGUID:v7];

    id v15 = +[IMDAttachmentStore sharedInstance];
    id v16 = [v8 guid];
    [v15 storeAttachment:v14 associateWithMessageWithGUID:v9 chatGUID:v16 storeAtExternalLocation:1];

    v17 = +[IMDChatRegistry sharedInstance];
    unint64_t v18 = [v8 chatIdentifier];
    unint64_t v19 = objc_msgSend(v17, "allExistingChatsWithIdentifier:style:", v18, objc_msgSend(v8, "style"));

    id v20 = +[IMDAttachmentStore sharedInstance];
    [v20 deleteAttachmentWithGUID:v10];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v19;
    id v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v30;
      do
      {
        id v24 = 0;
        do
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v24), "updateGroupPhotoGuid:", v7, (void)v29);
          id v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        id v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    int v25 = +[IMDFileTransferCenter sharedInstance];
    [v25 removeTransferForGUID:v10];

    [v8 updateGroupPhotoUploadFailureCount:0];
    id v26 = +[IMDChatRegistry sharedInstance];
    [v26 updateFaceTimeGroupPhoto:v8];

    __int16 v27 = +[IMSafetyMonitorCoordinator sharedCoordinator];
    id v28 = [v8 groupID];
    [v27 informOfChangedGroupPhoto:v28];
  }
}

+ (id)_combinedTransferUserInfoForAttachmentSendContexts:(id)a3 transfer:(id)a4 message:(id)a5 commonCapabilities:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  __int16 v13 = [v9 handle];
  if ([v13 length])
  {
    __int16 v14 = [v9 handle];
    char IsBusinessID = IMStringIsBusinessID();
  }
  else
  {
    char IsBusinessID = 0;
  }

  id v16 = [v12 sortedArrayUsingComparator:&stru_DE998];

  id v17 = v16;
  unint64_t v18 = v17;
  if ((unint64_t)[v17 count] >= 2)
  {
    unint64_t v19 = [v17 lastObject];
    id v20 = objc_msgSend(v17, "subarrayWithRange:", 0, (char *)objc_msgSend(v17, "count") - 1);
    __int16 v36 = v19;
    id v21 = +[NSArray arrayWithObjects:&v36 count:1];
    unint64_t v18 = [v21 arrayByAddingObjectsFromArray:v20];
  }
  unsigned __int8 v22 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v11 isSending:1];
  uint64_t v23 = [v11 type];

  BOOL v24 = UTTypeConformsTo(v23, kUTTypeImage) != 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_4EAB0;
  v30[3] = &unk_DE9C0;
  unsigned __int8 v33 = v22;
  BOOL v34 = v24;
  char v35 = IsBusinessID;
  id v31 = v10;
  id v25 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 5 * (void)objc_msgSend(v18, "count"));
  id v32 = v25;
  id v26 = v10;
  [v18 enumerateObjectsUsingBlock:v30];
  __int16 v27 = v32;
  id v28 = v25;

  return v28;
}

- (id)eagerUploadKeyForURL:(id)a3 sizes:(id)a4 transcodeDictionary:(id)a5 capabilities:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a3 path];
  __int16 v13 = IMSharedHelperMD5HashOfFileAtPath();

  if (v10 && [v10 count])
  {
    __int16 v14 = IMSharedHelperMD5HashPlist();
    uint64_t v15 = [v13 stringByAppendingString:v14];

    __int16 v13 = (void *)v15;
  }
  if (v11 && [v11 count])
  {
    id v16 = IMSharedHelperMD5HashPlist();
    uint64_t v17 = [v13 stringByAppendingString:v16];

    __int16 v13 = (void *)v17;
  }
  if ([v9 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v26 = v9;
    id v18 = v9;
    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        unsigned __int8 v22 = 0;
        uint64_t v23 = v13;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v24 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v22) stringValue];
          __int16 v13 = [v23 stringByAppendingFormat:@"-%@", v24];

          unsigned __int8 v22 = (char *)v22 + 1;
          uint64_t v23 = v13;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }

    id v9 = v26;
  }

  return v13;
}

- (id)eagerUploadStatusForKey:(id)a3
{
  id v4 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  if (v5 > *(double *)&qword_EC538)
  {
    *(double *)&qword_EC538 = v5 + 3600.0;
    id v7 = objc_alloc_init((Class)NSMutableArray);
    eagerUploadStatuses = self->_eagerUploadStatuses;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    __int16 v14 = sub_4F098;
    uint64_t v15 = &unk_DE9E8;
    double v17 = v6;
    id v16 = v7;
    id v9 = v7;
    [(NSMutableDictionary *)eagerUploadStatuses enumerateKeysAndObjectsUsingBlock:&v12];
    -[NSMutableDictionary removeObjectsForKeys:](self->_eagerUploadStatuses, "removeObjectsForKeys:", v9, v12, v13, v14, v15);
  }
  if (v4)
  {
    id v10 = [(NSMutableDictionary *)self->_eagerUploadStatuses objectForKeyedSubscript:v4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)eagerUploadCancel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  eagerUploadStatuses = self->_eagerUploadStatuses;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_4F270;
  id v12 = &unk_DEA10;
  id v13 = v4;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSMutableDictionary *)eagerUploadStatuses enumerateKeysAndObjectsUsingBlock:&v9];
  -[NSMutableDictionary removeObjectsForKeys:](self->_eagerUploadStatuses, "removeObjectsForKeys:", v7, v9, v10, v11, v12);
}

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[IMCTSMSUtilities IMIsEagerUploadEnabledForPhoneNumber:0 simID:0])
  {
    id v8 = objc_alloc_init((Class)IMFileTransfer);
    [v8 _updateWithDictionaryRepresentation:v6];
    [v8 _setNeedsWrapper:0];
    if (([v8 appMessageFallbackImage] & 1) != 0
      || ([v8 isRecipeBasedSticker] & 1) != 0
      || ([v8 shouldFastSend] & 1) != 0
      || ([v8 isDirectory] & 1) != 0)
    {
      unsigned int v9 = 1;
    }
    else if ([v8 isAuxVideo])
    {
      unsigned int v9 = +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled];
    }
    else
    {
      unsigned int v9 = 0;
    }
    uint64_t v10 = [v8 type];
    if (UTTypeConformsTo(v10, kUTTypeImage) || UTTypeConformsTo(v10, kUTTypeMovie))
    {
      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      if ((unint64_t)[v8 totalBytes] > 0x1E00000) {
        char v12 = 1;
      }
      else {
        char v12 = v9;
      }
      if (v12)
      {
LABEL_10:
        if (IMOSLoggingEnabled())
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "EAGER skip: policy", buf, 2u);
          }
        }
        goto LABEL_19;
      }
    }
    id v13 = +[IMDAttachmentUtilities fetchSizeLimitsForTransfer:v8 mode:0];
    id v14 = [v13 firstObject];
    id v15 = [v14 integerValue];

    *(void *)buf = 0;
    BOOL v34 = buf;
    uint64_t v35 = 0x3032000000;
    __int16 v36 = sub_4F950;
    id v37 = sub_4F960;
    id v38 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_4F968;
    v26[3] = &unk_DEA88;
    v26[4] = self;
    id v16 = v13;
    id v27 = v16;
    id v17 = v8;
    id v31 = buf;
    id v32 = v15;
    id v28 = v17;
    long long v29 = @"com.apple.madrid";
    long long v30 = @"EAGER";
    id v18 = objc_retainBlock(v26);
    id v39 = v17;
    id v19 = +[NSArray arrayWithObjects:&v39 count:1];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_506C8;
    v21[3] = &unk_DEAB0;
    id v22 = v7;
    id v25 = buf;
    id v23 = v17;
    id v20 = v18;
    id v24 = v20;
    [(MessageAttachmentController *)self findTranscoderCapabilitiesAcrossRecipients:v22 forTransfers:v19 completion:v21];

    _Block_object_dispose(buf, 8);
LABEL_19:
  }
}

- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 mode:(unint64_t)a7 fromID:(id)a8 recipients:(id)a9 completionBlock:(id)a10 uploadFailureBlock:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v39 = a6;
  id v40 = a8;
  id v18 = a9;
  id v19 = a10;
  id v42 = a11;
  id v37 = v16;
  id v38 = v17;
  char v41 = v18;
  if (IMGetCachedDomainIntForKeyWithDefaultValue() < 1)
  {
    BOOL v35 = a4;
    uint64_t v60 = 0;
    v61 = (os_activity_scope_state_s *)&v60;
    uint64_t v62 = 0x3010000000;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    v63 = &unk_C6D1B;
    id v20 = _os_activity_create(&dword_0, "com.apple.messages.MessageAttachmentUploads", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v20, v61 + 2);
    objc_msgSend(v18, "__im_canonicalIDSIDsFromAddresses");
    v33 = id v32 = v20;
    uint64_t v21 = IMServiceNameForCanonicalIDSAddresses();
    BOOL v34 = self;
    id v22 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v23 = [v16 fileTransferGUIDs];
    id v24 = [v23 countByEnumeratingWithState:&v56 objects:v73 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v57;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          id v28 = +[IMDFileTransferCenter sharedInstance];
          long long v29 = [v28 transferForGUID:v27];

          if (v29) {
            BOOL v30 = v22 != 0;
          }
          else {
            BOOL v30 = 0;
          }
          if (v30) {
            CFArrayAppendValue(v22, v29);
          }
        }
        id v24 = [v23 countByEnumeratingWithState:&v56 objects:v73 count:16];
      }
      while (v24);
    }

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_50D88;
    v43[3] = &unk_DEB50;
    v53 = &v60;
    id v51 = v19;
    id v31 = v21;
    id v44 = v31;
    v45 = v34;
    id v46 = v41;
    id v47 = v40;
    id v48 = v37;
    BOOL v55 = v35;
    id v49 = v38;
    id v50 = v39;
    unint64_t v54 = a7;
    id v52 = v42;
    [(MessageAttachmentController *)v34 findTranscoderCapabilitiesAcrossRecipients:v46 forTransfers:v22 completion:v43];

    _Block_object_dispose(&v60, 8);
  }
  else
  {
    v66 = _NSConcreteStackBlock;
    uint64_t v67 = 3221225472;
    v68 = sub_50D64;
    v69 = &unk_DEAD8;
    id v72 = v19;
    id v70 = v16;
    id v71 = v17;
    im_dispatch_after();
  }
}

- (void)sendAttachmentsForMessage:(id)a3 canSendInline:(BOOL)a4 displayIDs:(id)a5 additionalContext:(id)a6 commonCapabilities:(id)a7 mode:(unint64_t)a8 sessionInfo:(id)a9 topic:(id)a10 completionBlock:(id)a11 uploadFailureBlock:(id)a12
{
  BOOL v111 = a4;
  id v15 = a3;
  v93 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v92 = a6;
  id v104 = a7;
  id v103 = a9;
  id v102 = a10;
  v94 = (void (**)(id, id, id, id, uint64_t, void))a11;
  id v105 = a12;
  v117 = v15;
  v110 = [v15 guid];
  id v16 = v15;
  if (([v15 isTypingMessage] & 1) == 0 && IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v15 fileTransferGUIDs];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v177 = v93;
      LOWORD(v178) = 2048;
      *(void *)((char *)&v178 + 2) = a8;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Processing file transfers: %@ (Message: %@   to: %@) mode=%llu", buf, 0x2Au);
    }
    id v16 = v15;
  }
  id v19 = [v16 fileTransferGUIDs];
  id v20 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
  long long v174 = 0u;
  long long v175 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  id obj = v19;
  id v21 = [obj countByEnumeratingWithState:&v172 objects:v184 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v173;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v173 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v172 + 1) + 8 * i);
        if (v20 && v24) {
          CFArrayAppendValue(v20, *(const void **)(*((void *)&v172 + 1) + 8 * i));
        }
        uint64_t v25 = +[IMDFileTransferCenter sharedInstance];
        id v26 = [v25 transferForGUID:v24];

        if ([v26 isAuxImage]
          && (+[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled] & 1) == 0)
        {
          BOOL v30 = +[IMFileTransfer AuxGUIDFromFileTransferGUID:v24];
          id v31 = +[IMDFileTransferCenter sharedInstance];
          id v32 = [v31 transferForGUID:v30];

          int v33 = IMOSLoggingEnabled();
          if (v32)
          {
            if (v33)
            {
              BOOL v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v30;
                _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Adding Aux video to list of transfer %@", buf, 0xCu);
              }
            }
            if (v20 && v30) {
              CFArrayAppendValue(v20, v30);
            }
          }
          else if (v33)
          {
            BOOL v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v30;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Attachment expected to find transfer for Aux video %@ . But we did not find transfer", buf, 0xCu);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              unsigned int v28 = +[IMDAttachmentUtilities isPreviewAttachmentSizeEnabled];
              CFStringRef v29 = @"NO";
              if (v28) {
                CFStringRef v29 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v29;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Not an Aux image or low quality image on %@. Moving on", buf, 0xCu);
            }
          }
          [v26 setIsAuxImage:0];
          [v26 setAuxStateWasDowngraded:1];
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v172 objects:v184 count:16];
    }
    while (v21);
  }

  if (([v15 isTypingMessage] & 1) == 0 && IMOSLoggingEnabled())
  {
    __int16 v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "File transfer guids to process %@", buf, 0xCu);
    }
  }
  id v37 = [v15 balloonBundleID];
  unsigned int v38 = [v37 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  if ([(__CFArray *)v20 count]) {
    int v39 = v38;
  }
  else {
    int v39 = 1;
  }
  if (v39 == 1)
  {
    if (v38 && [(__CFArray *)v20 count])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_99;
      }
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = [(__CFArray *)v20 count];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v41;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Skipping %tu file transfers due to payload attachments.", buf, 0xCu);
      }
    }
    else
    {
      if (([v15 isTypingMessage] & 1) != 0 || !IMOSLoggingEnabled())
      {
LABEL_99:
        if (v94) {
          v94[2](v94, v15, v93, v92, 1, 0);
        }
        goto LABEL_147;
      }
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "No file transfers, just continuing", buf, 2u);
      }
    }

    goto LABEL_99;
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v42 = [v15 fileTransferGUIDs];
  id v43 = [v42 countByEnumeratingWithState:&v168 objects:v183 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v169;
    char v45 = 1;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v169 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v168 + 1) + 8 * (void)j);
        id v48 = +[IMDFileTransferCenter sharedInstance];
        id v49 = [v48 transferForGUID:v47];

        if (v49 && ![v49 appMessageFallbackImage]) {
          char v45 = 0;
        }
        else {
          [v49 setAppMessageFallbackImage:0];
        }
      }
      id v43 = [v42 countByEnumeratingWithState:&v168 objects:v183 count:16];
    }
    while (v43);

    if ((v45 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v50 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v110;
          _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "Uploading attachments for app msg %@", buf, 0xCu);
        }
      }
      v116 = objc_alloc_init(MessageAttachmentOverallStatus);
      [(MessageAttachmentOverallStatus *)v116 setError:0];
      [(MessageAttachmentOverallStatus *)v116 setFailed:0];
      v118 = +[IMDFileTransferCenter sharedInstance];
      group = dispatch_group_create();
      if (v111)
      {
        CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v92 mutableCopy];
        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        if (IMOSLoggingEnabled())
        {
          id v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            id v52 = [(__CFArray *)v20 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "We can send inline. Trying to inline %lu transfers.", buf, 0xCu);
          }
        }
        long long v166 = 0u;
        long long v167 = 0u;
        long long v164 = 0u;
        long long v165 = 0u;
        v99 = v20;
        id v53 = [(__CFArray *)v99 countByEnumeratingWithState:&v164 objects:v182 count:16];
        if (v53)
        {
          dispatch_group_t v108 = 0;
          uint64_t v112 = *(void *)v165;
          do
          {
            for (k = 0; k != v53; k = (char *)k + 1)
            {
              if (*(void *)v165 != v112) {
                objc_enumerationMutation(v99);
              }
              uint64_t v55 = *(void *)(*((void *)&v164 + 1) + 8 * (void)k);
              long long v56 = [v118 transferForGUID:v55];
              if (v56)
              {
                dispatch_group_enter(group);
                long long v57 = [v56 localURL];
                long long v58 = +[NSData dataWithContentsOfURL:v57];

                [v56 _setNeedsWrapper:0];
                [v118 startTransfer:v55];
                long long v59 = [v117 accountID];
                uint64_t v60 = [v117 handle];
                if (v60)
                {
                  v61 = [v117 handle];
                  [v118 assignTransfer:v55 toAccount:v59 otherPerson:v61];
                }
                else
                {
                  [v118 assignTransfer:v55 toAccount:v59 otherPerson:0];
                }

                v154[0] = _NSConcreteStackBlock;
                v154[1] = 3221225472;
                v154[2] = sub_525F0;
                v154[3] = &unk_DEB78;
                id v155 = v58;
                id v63 = v56;
                id v156 = v63;
                v163 = (char *)k + (void)v108;
                id v157 = v110;
                id v158 = v118;
                uint64_t v159 = v55;
                v160 = Mutable;
                v161 = v116;
                v162 = group;
                id v64 = v58;
                [(MessageAttachmentController *)self transcribeMessageIfNeeded:v117 forTransfer:v63 completion:v154];
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v62 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v55;
                    _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
                  }
                }
                [(MessageAttachmentOverallStatus *)v116 setFailed:1];
                [(MessageAttachmentOverallStatus *)v116 setError:34];
              }
            }
            id v53 = [(__CFArray *)v99 countByEnumeratingWithState:&v164 objects:v182 count:16];
            dispatch_group_t v108 = (dispatch_group_t)((char *)k + (void)v108);
          }
          while (v53);
        }

        uint64_t v65 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_527F4;
        block[3] = &unk_DEBA0;
        v148 = v99;
        v149 = v116;
        v153 = v94;
        id v150 = v117;
        v151 = v93;
        CFMutableDictionaryRef v152 = Mutable;
        v66 = Mutable;
        dispatch_group_notify(group, v65, block);
      }
      else
      {
        id v100 = objc_alloc_init((Class)NSFileCoordinator);
        v180[0] = kAttachmentsAutomationTransferGUIDsKey;
        v180[1] = kAttachmentsAutomationMessageGUIDKey;
        v68 = (__CFArray *)&__NSArray0__struct;
        if (v20) {
          v68 = v20;
        }
        v181[0] = v68;
        v181[1] = v110;
        v69 = +[NSDictionary dictionaryWithObjects:v181 forKeys:v180 count:2];
        AttachmentsAutomationLogMilestoneWithOptionFlags();

        long long v145 = 0u;
        long long v146 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        v96 = v20;
        id v107 = [(__CFArray *)v96 countByEnumeratingWithState:&v143 objects:v179 count:16];
        if (v107)
        {
          char v70 = 0;
          uint64_t v98 = *(void *)v144;
          do
          {
            for (m = 0; m != v107; m = (char *)m + 1)
            {
              if (*(void *)v144 != v98) {
                objc_enumerationMutation(v96);
              }
              uint64_t v72 = *(void *)(*((void *)&v143 + 1) + 8 * (void)m);
              v73 = [v118 transferForGUID:v72];
              v128[0] = _NSConcreteStackBlock;
              v128[1] = 3221225472;
              v128[2] = sub_52944;
              v128[3] = &unk_DECE0;
              id v74 = v73;
              id v129 = v74;
              id v130 = v110;
              id v75 = v118;
              id v131 = v75;
              uint64_t v132 = v72;
              dispatch_group_t v109 = group;
              dispatch_group_t v133 = v109;
              v134 = self;
              v113 = v116;
              v135 = v113;
              unint64_t v142 = a8;
              id v136 = v104;
              id v76 = v117;
              id v137 = v76;
              id v141 = v105;
              id v138 = v102;
              id v139 = v103;
              id v97 = v100;
              id v140 = v97;
              v77 = objc_retainBlock(v128);
              int v78 = IMOSLoggingEnabled();
              if (v74)
              {
                if (v78)
                {
                  v79 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                  {
                    id v80 = [v74 guid];
                    unsigned int v81 = [v74 isAuxImage];
                    CFStringRef v82 = @"NO";
                    if (v81) {
                      CFStringRef v82 = @"YES";
                    }
                    CFStringRef v95 = v82;
                    unsigned int v83 = [v74 isSticker];
                    unsigned int v84 = [v74 isAnimojiV2];
                    *(_DWORD *)buf = 138413058;
                    CFStringRef v85 = @"NO";
                    if (v83) {
                      CFStringRef v86 = @"YES";
                    }
                    else {
                      CFStringRef v86 = @"NO";
                    }
                    *(void *)&uint8_t buf[4] = v80;
                    if (v84) {
                      CFStringRef v85 = @"YES";
                    }
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v95;
                    *(_WORD *)&buf[22] = 2112;
                    v177 = (uint64_t (*)(uint64_t, uint64_t))v86;
                    LOWORD(v178) = 2112;
                    *(void *)((char *)&v178 + 2) = v85;
                    _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "Transfer %@ Is Aux image %@, is Sticker %@, is Animoji %@", buf, 0x2Au);
                  }
                }
                dispatch_group_enter(v109);
                [v74 _setNeedsWrapper:0];
                [v75 startTransfer:v72];
                [v75 endTransfer:v72];
                if (IMOSLoggingEnabled())
                {
                  v87 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_0, v87, OS_LOG_TYPE_INFO, "Overriding transfer to end", buf, 2u);
                  }
                }
                v88 = [v76 accountID];
                v89 = [v76 handle];
                if (v89)
                {
                  v90 = [v76 handle];
                  [v75 assignTransfer:v72 toAccount:v88 otherPerson:v90];
                }
                else
                {
                  [v75 assignTransfer:v72 toAccount:v88 otherPerson:0];
                }

                [(MessageAttachmentController *)self transcribeMessageIfNeeded:v76 forTransfer:v74 completion:v77];
                char v70 = 1;
              }
              else
              {
                if (v78)
                {
                  v91 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v72;
                    _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
                  }
                }
                [(MessageAttachmentOverallStatus *)v113 setFailed:1];
                [(MessageAttachmentOverallStatus *)v113 setError:34];
              }
            }
            id v107 = [(__CFArray *)v96 countByEnumeratingWithState:&v143 objects:v179 count:16];
          }
          while (v107);

          if (v70)
          {
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v177 = sub_4F950;
            *(void *)&long long v178 = sub_4F960;
            *((void *)&v178 + 1) = 0;
            *((void *)&v178 + 1) = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"OutgoingMessagesPowerAssertion" timeout:120.0];
            v120[0] = _NSConcreteStackBlock;
            v120[1] = 3221225472;
            v120[2] = sub_55B1C;
            v120[3] = &unk_DED08;
            v121 = v96;
            v122 = v113;
            v126 = v94;
            id v123 = v76;
            v124 = v93;
            id v125 = v92;
            v127 = buf;
            dispatch_group_notify(v109, (dispatch_queue_t)&_dispatch_main_q, v120);

            _Block_object_dispose(buf, 8);
          }
          v66 = (__CFDictionary *)v97;
        }
        else
        {

          v66 = (__CFDictionary *)v100;
        }
      }

      goto LABEL_147;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v117;
      _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "All attachments for msg guid %@ already uploaded. Not re-uploading", buf, 0xCu);
    }
  }
  if (v94) {
    v94[2](v94, v117, v93, v92, 1, 0);
  }
LABEL_147:
}

- (void)transcribeMessageIfNeeded:(id)a3 forTransfer:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = (void (**)(void))a5;
  if ([v7 isAudioMessage])
  {
    uint64_t v10 = +[MessageTranscodeController sharedInstance];
    id v11 = [v8 localURL];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_55EC0;
    v12[3] = &unk_DED30;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    [v10 transcribeAudioForAudioTransferURL:v11 withCompletion:v12];
  }
  else
  {
    v9[2](v9);
  }
}

- (void)_transcodeURL:(id)a3 reason:(unint64_t)a4 transfer:(id)a5 sizes:(id)a6 commonCapabilities:(id)a7 sendStatus:(id)a8 urlGroup:(id)a9 didTranscode:(id)a10 handleURL:(id)a11
{
  id v36 = a3;
  id v15 = a5;
  id v16 = a6;
  id v37 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  dispatch_group_enter(v18);
  unsigned __int8 v21 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v15 isSending:1];
  int v33 = +[MessageTranscodeController sharedInstance];
  id v32 = [v15 type];
  unsigned int v31 = [v15 isSticker];
  uint64_t v22 = [v15 transcoderUserInfo];
  BOOL v30 = (+[IMDAttachmentUtilities shouldSendLowResolutionOnly](IMDAttachmentUtilities, "shouldSendLowResolutionOnly") & 1) == 0&& (unint64_t)[v16 count] > 1;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_56254;
  v38[3] = &unk_DED80;
  id v39 = v15;
  id v40 = v36;
  unsigned __int8 v47 = v21;
  id v41 = v16;
  id v42 = v18;
  id v43 = v17;
  id v44 = v20;
  id v45 = v19;
  unint64_t v46 = a4;
  id v35 = v19;
  id v23 = v17;
  uint64_t v24 = v18;
  id v25 = v20;
  id v26 = v16;
  id v27 = v36;
  id v28 = v15;
  LOBYTE(v29) = v21;
  [v33 transcodeFileTransferContents:v27 utiType:v32 isSticker:v31 transcoderUserInfo:v22 sizes:v26 commonCapabilities:v37 representations:v30 isLQMEnabled:v29 completionBlock:v38];
}

- (void)_sendURL:(id)a3 urlToRemove:(id)a4 topic:(id)a5 sessionInfo:(id)a6 messageGUID:(id)a7 transferID:(id)a8 fileTransferGUID:(id)a9 attachmentSendContexts:(id)a10 failIfError:(BOOL)a11 sendStatus:(id)a12 attachmentStatus:(id)a13 group:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v43 = a5;
  id v42 = a6;
  id v21 = a7;
  id v41 = a8;
  id v45 = a9;
  id v44 = a10;
  id v22 = a12;
  id v23 = a13;
  uint64_t v24 = a14;
  dispatch_group_enter(v24);
  id v25 = +[IMDFileTransferCenter sharedInstance];
  if (v19)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v27 = v26;
    uint64_t v60 = kAttachmentsAutomationURLKey;
    uint64_t v28 = [v19 path];
    id v39 = v20;
    uint64_t v29 = (void *)v28;
    CFStringRef v30 = &stru_E0738;
    if (v28) {
      CFStringRef v30 = (const __CFString *)v28;
    }
    CFStringRef v61 = v30;
    unsigned int v31 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    AttachmentsAutomationLogMilestone();

    id v32 = +[IMTransferServicesController sharedInstance];
    [v19 path];
    v33 = id v40 = v25;
    BOOL v34 = [v33 stringByResolvingAndStandardizingPath];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_572EC;
    v58[3] = &unk_DEDA8;
    id v59 = v45;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_57410;
    v46[3] = &unk_DEDD0;
    id v47 = v21;
    id v48 = v19;
    id v49 = v59;
    id v50 = v40;
    uint64_t v56 = v27;
    BOOL v57 = a11;
    id v51 = v22;
    id v52 = v23;
    id v53 = v44;
    id v35 = v39;
    id v54 = v39;
    uint64_t v55 = v24;
    id v36 = v41;
    [v32 sendFilePath:v34 topic:v43 userInfo:v42 transferID:v41 encryptFile:1 progressBlock:v58 completionBlock:v46];

    id v25 = v40;
    id v37 = v43;
    unsigned int v38 = v42;
  }
  else
  {
    dispatch_group_leave(v24);
    id v35 = v20;
    unsigned int v38 = v42;
    id v37 = v43;
    id v36 = v41;
  }
}

+ (id)_capabilitiesForTransfers:(id)a3 supportsASTC:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v12[0] = IDSRegistrationPropertySupportsHDRVideo;
  v12[1] = IDSRegistrationPropertyPrefersSDRVideo;
  id v6 = +[NSArray arrayWithObjects:v12 count:2];
  [v5 addObject:v6];

  if (v4)
  {
    uint64_t v11 = IDSRegistrationPropertySupportsHEIFEncoding;
    id v7 = +[NSArray arrayWithObjects:&v11 count:1];
    [v5 addObject:v7];
  }
  id v8 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v9 = [v8 isHighQualityPhotosEnabled];

  if (v9) {
    [v5 addObject:&off_E3A08];
  }

  return v5;
}

- (void)findTranscoderCapabilitiesAcrossRecipients:(id)a3 forTransfers:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  objc_msgSend(v9, "__im_canonicalIDSIDsFromAddresses");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = IMServiceNameForCanonicalIDSAddresses();
  uint64_t v11 = +[MessageAttachmentController _capabilitiesForTransfers:v8 supportsASTC:IMSupportsASTC()];

  +[IMIDSUtilities findCommonCapabilitiesAcrossRecipients:v9 serviceName:v10 capsToCheck:v11 completion:v7];
}

- (void)sessionInfoForBusinessReceipients:(id)a3 fromID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v7, "__im_canonicalIDSIDsFromAddresses");
  uint64_t v11 = IMServiceNameForCanonicalIDSAddresses();
  id v12 = v11;
  if (v9)
  {
    uint64_t v13 = IDSServiceNameiMessageForBusiness;
    if ([v11 isEqualToString:IDSServiceNameiMessageForBusiness])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_581E8;
      v17[3] = &unk_DEE48;
      id v14 = v9;
      id v19 = v14;
      id v18 = v8;
      if ((+[IMIDSIDQueryController currentRemoteDevicesForDestinations:v7 service:v13 listenerID:@"MessageAttachmentController" queue:&_dispatch_main_q completionBlock:v17] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "-sessionInfoForBusinessReceipients:completion: success == NO when querying for business session info", v16, 2u);
          }
        }
        (*((void (**)(id, void))v14 + 2))(v14, 0);
      }
    }
  }
}

- (void)sendFallbackAttachmentsForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 completionBlock:(id)a6
{
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  id v40 = a6;
  id v48 = +[IMDFileTransferCenter sharedInstance];
  id v50 = objc_alloc_init((Class)NSMutableArray);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v9 = [v44 fileTransferGUIDs];
  id v10 = [v9 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v10)
  {
    char v45 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v75;
    uint64_t v13 = IMStickerUserInfoStickerRecipeKey;
    uint64_t v14 = IMStickerUserInfoStickerPackGUIDKey;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(v9);
        }
        id v16 = [v48 transferForGUID:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        if ([v16 isRecipeBasedSticker])
        {
          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "sendFallbackAttachmentsForMessage sending recipe based sticker", buf, 2u);
            }
          }
          id v18 = [v16 stickerUserInfo];
          id v19 = [v18 objectForKey:v13];
          id v47 = [v19 _FTDataFromHexString];

          id v20 = [v16 stickerUserInfo];
          unint64_t v46 = [v20 objectForKey:v14];

          if (v47)
          {

            goto LABEL_26;
          }
          if (IMOSLoggingEnabled())
          {
            id v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              id v22 = [v44 guid];
              id v23 = [v16 stickerUserInfo];
              *(_DWORD *)buf = 138412546;
              id v80 = v22;
              __int16 v81 = 2112;
              CFStringRef v82 = v23;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "sendFallbackAttachmentsForMessage found recipe based transfer but no recipe in it for msg guid %@ %@", buf, 0x16u);
            }
          }
          uint64_t v11 = v46;
        }
        else if ([v16 isAutoloopVideo])
        {
          [v50 addObject:v16];
          char v45 = 1;
        }
        else if ([v16 isOpusAudioMessage])
        {
          [v50 addObject:v16];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    unint64_t v46 = v11;
    id v47 = 0;
  }
  else
  {
    char v45 = 0;
    unint64_t v46 = 0;
    id v47 = 0;
  }
LABEL_26:

  id v53 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v24 = dispatch_group_create();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v50;
  id v25 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v25)
  {
    uint64_t v51 = *(void *)v71;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v71 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
        dispatch_group_enter(v24);
        unsigned __int8 v28 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v27 isSending:1];
        uint64_t v29 = +[MessageTranscodeController sharedInstance];
        CFStringRef v30 = [v27 localURL];
        unsigned int v31 = [v27 type];
        id v32 = [v27 transcoderUserInfo];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_58F58;
        v66[3] = &unk_DEE70;
        id v67 = v53;
        v68 = v27;
        v69 = v24;
        LOBYTE(v39) = v28;
        [v29 transcodeFallbackFileTransferContents:v30 utiType:v31 transcoderUserInfo:v32 sizes:0 commonCapabilities:0 representations:0 isLQMEnabled:v39 completionBlock:v66];
      }
      id v25 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v25);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_59148;
  block[3] = &unk_DEEE8;
  id v56 = v47;
  id v57 = v46;
  id v58 = v44;
  id v59 = v48;
  uint64_t v60 = self;
  id v61 = v43;
  id v62 = v42;
  id v63 = v53;
  char v65 = v45 & 1;
  id v64 = v40;
  id v52 = v40;
  id v33 = v53;
  id v34 = v42;
  id v35 = v43;
  id v36 = v48;
  id v54 = v44;
  id v37 = v46;
  id v38 = v47;
  dispatch_group_notify(v24, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)handleTranscodeCompletionBlockForMessage:(id)a3 displayIDs:(id)a4 additionalContext:(id)a5 attemptedTranscode:(BOOL)a6 transcodedTransferGUIDs:(id)a7 containsAutoLoopVideo:(BOOL)a8 outputURLs:(id)a9 text:(id)a10 success:(BOOL)a11 error:(id)a12 completionBlock:(id)a13
{
  BOOL v13 = a8;
  BOOL v75 = a6;
  id v82 = a3;
  id v78 = a4;
  id v79 = a5;
  id v77 = a7;
  id obj = a9;
  id v80 = a10;
  id v76 = a12;
  __int16 v81 = (void (**)(id, id, id, id, BOOL, void))a13;
  id v17 = +[IMDFileTransferCenter sharedInstance];
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v82 guid];
      uint64_t v20 = [v82 balloonBundleID];
      id v21 = (void *)v20;
      CFStringRef v22 = @"NO";
      *(_DWORD *)buf = 138413826;
      id v106 = v19;
      if (a11) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      if (v75) {
        CFStringRef v22 = @"YES";
      }
      __int16 v107 = 2112;
      uint64_t v108 = v20;
      __int16 v109 = 2112;
      id v110 = obj;
      __int16 v111 = 2112;
      id v112 = v80;
      __int16 v113 = 2112;
      id v114 = v76;
      __int16 v115 = 2112;
      CFStringRef v116 = v23;
      __int16 v117 = 2112;
      CFStringRef v118 = v22;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Fallback transcoded version msg %@ bid %@ outputURLs %@ text %@ error %@ success %@ attemptedTranscode %@", buf, 0x48u);
    }
  }
  uint64_t v24 = [v82 balloonBundleID];
  id v25 = IMBalloonExtensionIDWithSuffix();
  unsigned int v26 = [v24 isEqualToString:v25];

  if (v81) {
    unsigned int v27 = v26;
  }
  else {
    unsigned int v27 = 0;
  }
  if (v27 == 1)
  {
    unsigned __int8 v28 = [obj lastObject];
    uint64_t v29 = +[NSData dataWithContentsOfURL:v28];

    uint64_t v100 = 0;
    CFStringRef v30 = IMSharedHelperPayloadFromCombinedPluginPayloadData();
    id v31 = 0;

    id v32 = +[IMDFileTransferCenter sharedInstance];
    id v33 = [v82 guid];
    id v34 = [v32 guidsForStoredAttachmentPayloadData:v31 messageGUID:v33];

    id v35 = [v82 copyForBackwardsCompatibility];
    id v36 = [objc_alloc((Class)NSAttributedString) initWithString:v80];

    [v35 setBody:v36];
    [v35 setPayloadData:v30];
    [v35 setFileTransferGUIDs:v34];
    [v35 setBalloonBundleID:IMBalloonPluginIdentifierRichLinks];
    v81[2](v81, v35, v78, v79, a11, 0);
    goto LABEL_83;
  }
  if (v81)
  {
    id v37 = [v82 balloonBundleID];
    uint64_t v74 = IMBalloonPluginIdentifierMessageExtension;
    unsigned int v38 = objc_msgSend(v37, "containsString:");

    if (v38)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          id v40 = [v82 guid];
          *(_DWORD *)buf = 138412290;
          id v106 = v40;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Ignoring returned URLs for app message %@", buf, 0xCu);
        }
      }

      id obj = 0;
    }
    CFStringRef v30 = +[NSMutableArray array];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = obj;
    id v41 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v97;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v97 != v42) {
            objc_enumerationMutation(obj);
          }
          id v44 = [v17 createNewOutgoingTransferWithLocalFileURL:*(void *)(*((void *)&v96 + 1) + 8 * i)];
          [v30 addObject:v44];
        }
        id v41 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
      }
      while (v41);
    }

    if (v13)
    {
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      char v45 = [v82 fileTransferGUIDs];
      id v46 = [v45 countByEnumeratingWithState:&v92 objects:v103 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v93;
        do
        {
          for (j = 0; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v93 != v47) {
              objc_enumerationMutation(v45);
            }
            uint64_t v49 = *(void *)(*((void *)&v92 + 1) + 8 * (void)j);
            id v50 = [v17 transferForGUID:v49];
            if (([v50 isAutoloopVideo] & 1) == 0) {
              [v30 addObject:v49];
            }
          }
          id v46 = [v45 countByEnumeratingWithState:&v92 objects:v103 count:16];
        }
        while (v46);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v106 = v77;
        _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Got transcoded strings: %@", buf, 0xCu);
      }
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v52 = v77;
    id v53 = [v52 countByEnumeratingWithState:&v88 objects:v102 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v89;
      do
      {
        for (k = 0; k != v53; k = (char *)k + 1)
        {
          if (*(void *)v89 != v54) {
            objc_enumerationMutation(v52);
          }
          uint64_t v56 = *(void *)(*((void *)&v88 + 1) + 8 * (void)k);
          id v57 = [v52 objectForKey:v56];
          id v58 = [v17 createNewOutgoingTransferWithLocalFileURL:v57];

          id v59 = [v30 indexOfObject:v56];
          if (v59 == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v30 addObject:v58];
          }
          else {
            [v30 replaceObjectAtIndex:v59 withObject:v58];
          }
        }
        id v53 = [v52 countByEnumeratingWithState:&v88 objects:v102 count:16];
      }
      while (v53);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        id v61 = [v82 guid];
        *(_DWORD *)buf = 138412546;
        id v106 = v61;
        __int16 v107 = 2112;
        uint64_t v108 = (uint64_t)v30;
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "Msg guid %@, FallBack GUIDs attempted to upload %@", buf, 0x16u);
      }
    }
    if (!v75 && ![v52 count]) {
      goto LABEL_84;
    }
    id v62 = [v82 balloonBundleID];
    unsigned int v63 = [v62 containsString:v74];

    if (v63)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v64 = [v82 fileTransferGUIDs];
      id v65 = [v64 countByEnumeratingWithState:&v84 objects:v101 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v85;
        do
        {
          for (m = 0; m != v65; m = (char *)m + 1)
          {
            if (*(void *)v85 != v66) {
              objc_enumerationMutation(v64);
            }
            uint64_t v68 = *(void *)(*((void *)&v84 + 1) + 8 * (void)m);
            v69 = +[IMDFileTransferCenter sharedInstance];
            long long v70 = [v69 transferForGUID:v68];

            [v70 setAppMessageFallbackImage:1];
          }
          id v65 = [v64 countByEnumeratingWithState:&v84 objects:v101 count:16];
        }
        while (v65);
      }
    }
    id v34 = [v82 copyForBackwardsCompatibility];
    if ([v30 count]) {
      [v34 setFileTransferGUIDs:v30];
    }
    id v35 = +[NSAttributedString __im_attributedStringWithFileTransfers:v30];
    id v36 = [v35 mutableCopy];
    if (v80)
    {
      id v71 = [objc_alloc((Class)NSAttributedString) initWithString:v80];
      [v36 appendAttributedString:v71];
    }
    long long v72 = objc_msgSend(v36, "__im_attributedStringByAssigningMessagePartNumbers");
    if ([v72 length]) {
      [v34 setBody:v72];
    }
    if (IMOSLoggingEnabled())
    {
      long long v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v106 = v34;
        _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "New Message %@", buf, 0xCu);
      }
    }
    if (!v75 && !a11) {
      [v52 count];
    }
    ((void (*)(void (**)(id, id, id, id, BOOL, void), id, id, id))v81[2])(v81, v34, v78, v79);

LABEL_83:
LABEL_84:
  }
}

- (BOOL)_shouldAutoAccept:(id)a3 transfer:(id)a4 isAltAccountDevice:(BOOL)a5 shouldDownloadFromPeer:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "DownloadAttachmentInDemoMode ", (uint8_t *)&v29, 2u);
      }
    }
    LOBYTE(v12) = 1;
  }
  else
  {
    BOOL v13 = +[IMMobileNetworkManager sharedInstance];
    unsigned int v14 = [v13 isWiFiUsable];

    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        CFStringRef v16 = @"NO";
        if (v14) {
          CFStringRef v16 = @"YES";
        }
        int v29 = 138412290;
        CFStringRef v30 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "isWifiUsable %@", (uint8_t *)&v29, 0xCu);
      }
    }
    if (v7)
    {
      id v17 = +[IMMobileNetworkManager sharedInstance];
      unsigned int v18 = [v17 hasLTEDataConnection];

      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          CFStringRef v20 = @"NO";
          if (v18) {
            CFStringRef v20 = @"YES";
          }
          int v29 = 138412290;
          CFStringRef v30 = v20;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "isOnHighCellularBandwidth %@", (uint8_t *)&v29, 0xCu);
        }
      }
      int v12 = v18 | v14;
    }
    else
    {
      if ([v10 isLocation]) {
        unsigned int v21 = [v9 isFromMe] ^ 1;
      }
      else {
        unsigned int v21 = 0;
      }
      int v12 = v21 | v6 | v14;
      if (IMOSLoggingEnabled())
      {
        CFStringRef v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          CFStringRef v23 = @"NO";
          if (v14) {
            CFStringRef v24 = @"YES";
          }
          else {
            CFStringRef v24 = @"NO";
          }
          if (v6) {
            CFStringRef v25 = @"YES";
          }
          else {
            CFStringRef v25 = @"NO";
          }
          int v29 = 138412802;
          CFStringRef v30 = v24;
          __int16 v31 = 2112;
          CFStringRef v32 = v25;
          if (v21) {
            CFStringRef v23 = @"YES";
          }
          __int16 v33 = 2112;
          CFStringRef v34 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "isWifiUsable %@, shouldDownloadFromPeer %@, autoDownloadLocationFile %@", (uint8_t *)&v29, 0x20u);
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      unsigned int v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        CFStringRef v27 = @"NO";
        if (v12) {
          CFStringRef v27 = @"YES";
        }
        int v29 = 138412290;
        CFStringRef v30 = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "shouldAutoAcceptFile %@,", (uint8_t *)&v29, 0xCu);
      }
    }
  }

  return v12;
}

- (BOOL)_shouldDisableFasterDownload:(id)a3 message:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 objectForKey:@"should-disable-faster-download"];
  if ([v6 BOOLValue])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v5 balloonBundleID];
    char v7 = [v8 length] != 0;
  }
  return v7;
}

- (void)retrieveAttachmentsForMessage:(id)a3 inlineAttachments:(id)a4 displayID:(id)a5 topic:(id)a6 comingFromStorage:(BOOL)a7 shouldForceAutoDownload:(BOOL)a8 senderContext:(id)a9 completionBlock:(id)a10
{
  id v120 = a3;
  id v114 = a4;
  id v112 = a5;
  id v109 = a6;
  id v111 = a9;
  id v110 = a10;
  kdebug_trace();
  BOOL v13 = +[IMUnlockMonitor sharedInstance];
  unsigned int v14 = [v13 isUnderFirstDataProtectionLock];

  if (v14 && IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v120;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Not downloading attachments for message %@ as we are under first unlock", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v158 = 0;
  uint64_t v159 = &v158;
  uint64_t v160 = 0x2020000000;
  uint64_t v161 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v173 = 0x3032000000;
  long long v174 = sub_4F950;
  long long v175 = sub_4F960;
  id v176 = 0;
  CFStringRef v16 = [v120 balloonBundleID];
  if ([v16 isEqualToString:IMBalloonPluginIdentifierRichLinks]) {
    goto LABEL_127;
  }
  id v17 = [v120 fileTransferGUIDs];
  if (![v17 count])
  {

LABEL_127:
    goto LABEL_128;
  }
  unsigned int v18 = [v120 balloonBundleID];
  unsigned int v19 = [v18 containsString:IMBalloonPluginIdentifierSurf];

  if (((v19 | v14) & 1) == 0)
  {
    *(void *)long long v168 = 0;
    *(void *)&v168[8] = v168;
    *(void *)&v168[16] = 0x3010000000;
    uint64_t v170 = 0;
    uint64_t v171 = 0;
    CFStringRef v169 = (const __CFString *)&unk_C6D1B;
    id v104 = _os_activity_create(&dword_0, "com.apple.messages.MessageAttachmentDownloads", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v104, (os_activity_scope_state_t)(*(void *)&v168[8] + 32));
    v124 = +[IMDFileTransferCenter sharedInstance];
    uint64_t v154 = 0;
    id v155 = &v154;
    uint64_t v156 = 0x2020000000;
    char v157 = 1;
    uint64_t v150 = 0;
    v151 = &v150;
    uint64_t v152 = 0x2020000000;
    int v153 = 0;
    CFStringRef v20 = +[IMDMessageStore sharedInstance];
    unsigned int v21 = [v120 guid];
    CFStringRef v22 = [v20 messageWithGUID:v21];

    if (IMOSLoggingEnabled())
    {
      CFStringRef v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v162 = 138412290;
        uint64_t v163 = (uint64_t)v22;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Found already stored message? %@", v162, 0xCu);
      }
    }
    CFStringRef v24 = v120;
    if (v22) {
      CFStringRef v24 = v22;
    }
    id v107 = v24;

    CFStringRef v25 = [(MessageAttachmentController *)self msgSession];
    if ([v25 isReplicating])
    {
      unsigned int v26 = +[IMDMessageStore sharedInstance];
      CFStringRef v27 = [v120 guid];
      unsigned __int8 v28 = [v26 wasMessageDeduplicatedWithGUID:v27];

      if (v28) {
        goto LABEL_23;
      }
      if (IMOSLoggingEnabled())
      {
        int v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Session is replicating and stored message was not deduplicated, using passed-in message instead", v162, 2u);
        }
      }
      CFStringRef v25 = v107;
      id v107 = v120;
    }

LABEL_23:
    if ([v107 scheduleType] == (char *)&dword_0 + 2
      && ([v107 scheduleState] == (char *)&dword_0 + 1
       || [v107 scheduleState] == (char *)&dword_0 + 2
       || [v107 scheduleState] == (char *)&dword_0 + 3)
      && [v120 isFromMe])
    {
      if (IMOSLoggingEnabled())
      {
        CFStringRef v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Using passed-in message instead of stored message as it might be an edited scheduled message", v162, 2u);
        }
      }
      __int16 v31 = [v107 fileTransferGUIDs];
      if ([v31 count] && IMOSLoggingEnabled())
      {
        CFStringRef v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v162 = 138412290;
          uint64_t v163 = (uint64_t)v31;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Deleteing old stored attachments %@, since we've now received the self-delivered message", v162, 0xCu);
        }
      }
      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id v33 = v31;
      id v34 = [v33 countByEnumeratingWithState:&v146 objects:v167 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v147;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v147 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v37 = *(void *)(*((void *)&v146 + 1) + 8 * i);
            unsigned int v38 = +[IMDAttachmentStore sharedInstance];
            [v38 deleteAttachmentWithGUID:v37];
          }
          id v34 = [v33 countByEnumeratingWithState:&v146 objects:v167 count:16];
        }
        while (v34);
      }

      id v39 = v120;
      id v107 = v39;
    }
    if (v107)
    {
      id v40 = [v107 fileTransferGUIDs];
      id v41 = [v40 count];
      BOOL v118 = v41 != 0;

      if (IMOSLoggingEnabled())
      {
        uint64_t v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          CFStringRef v43 = @"NO";
          if (v41) {
            CFStringRef v43 = @"YES";
          }
          *(_DWORD *)v162 = 138412290;
          uint64_t v163 = (uint64_t)v43;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "   Has attachments present: %@", v162, 0xCu);
        }
      }
      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      id v44 = [v107 fileTransferGUIDs];
      id v45 = [v44 countByEnumeratingWithState:&v142 objects:v166 count:16];
      if (v45)
      {
        __int16 v113 = 0;
        uint64_t v122 = *(void *)v143;
        id obj = v44;
        do
        {
          id v123 = v45;
          for (j = 0; j != v123; j = (char *)j + 1)
          {
            if (*(void *)v143 != v122) {
              objc_enumerationMutation(obj);
            }
            uint64_t v47 = *(void **)(*((void *)&v142 + 1) + 8 * (void)j);
            id v48 = [v124 transferForGUID:v47];
            if (v48)
            {
              uint64_t v49 = [v120 guid];
              [v48 setMessageGUID:v49];

              id v50 = [v48 localURL];
              if (UTTypeConformsTo((CFStringRef)[v48 type], kUTTypeImage))
              {
                uint64_t v51 = +[IMTipKitEventReporter sharedInstance];
                [v51 sendReceivedPhotoEvent];
              }
              if (!v50
                || (+[NSFileManager defaultManager],
                    id v52 = objc_claimAutoreleasedReturnValue(),
                    [v50 path],
                    id v53 = objc_claimAutoreleasedReturnValue(),
                    unsigned __int8 v54 = [v52 fileExistsAtPath:v53],
                    v53,
                    v52,
                    (v54 & 1) == 0))
              {
                v121 = [v48 userInfo];
                uint64_t v55 = [v121 _stringForKey:@"inline-attachment"];
                if (IMOSLoggingEnabled())
                {
                  uint64_t v56 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v162 = 138412290;
                    uint64_t v163 = (uint64_t)v55;
                    _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "   Checking for inline attachment. Inline file? %@", v162, 0xCu);
                  }
                }
                if (v55)
                {
                  id v57 = [v114 _dataForKey:v55];
                  id v58 = [v57 length];
                  if (IMOSLoggingEnabled())
                  {
                    id v59 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v162 = 138412290;
                      uint64_t v163 = (uint64_t)v48;
                      _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, " inline transfer: %@", v162, 0xCu);
                    }
                  }
                  if (IMOSLoggingEnabled())
                  {
                    uint64_t v60 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v162 = 138412290;
                      uint64_t v163 = (uint64_t)v121;
                      _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "       user info: %@", v162, 0xCu);
                    }
                  }
                  if (IMOSLoggingEnabled())
                  {
                    id v61 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      if (v57) {
                        uint64_t v62 = (uint64_t)v58;
                      }
                      else {
                        uint64_t v62 = -1;
                      }
                      *(_DWORD *)v162 = 134217984;
                      uint64_t v163 = v62;
                      _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, " Found data size: %ld", v162, 0xCu);
                    }
                  }
                  if (v57)
                  {
                    unsigned int v63 = [v120 accountID];
                    [v124 assignTransfer:v47 toAccount:v63 otherPerson:v112];

                    id v64 = [v48 filename];
                    __int16 v115 = [v64 lastPathComponent];

                    id v65 = +[NSFileManager defaultManager];
                    uint64_t v66 = objc_msgSend(v65, "im_randomTemporaryFileURLWithFileName:", v115);
                    id v67 = [v66 path];

                    [v124 acceptTransfer:v47 path:v67];
                    CFStringRef v116 = [v67 stringByResolvingAndStandardizingPath];

                    v119 = +[NSURL fileURLWithPath:v116];
                    LODWORD(v65) = [v57 writeToURL:v119 atomically:1];
                    if (v65)
                    {
                      v69 = +[IMDFileTransferCenter sharedInstance];
                      [v69 updateTransfer:v47 currentBytes:v58 totalBytes:v58];

                      [v48 setUserInfo:0];
                      if (v119
                        && (+[NSFileManager defaultManager],
                            long long v70 = objc_claimAutoreleasedReturnValue(),
                            [v119 path],
                            id v71 = objc_claimAutoreleasedReturnValue(),
                            unsigned int v72 = [v70 fileExistsAtPath:v71],
                            v71,
                            v70,
                            v72))
                      {
                        if (IMOSLoggingEnabled())
                        {
                          long long v73 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v162 = 138412290;
                            uint64_t v163 = (uint64_t)v119;
                            _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "Adding gatekeeper properties to: %@", v162, 0xCu);
                          }
                        }
                        uint64_t v74 = +[IMDFileTransferCenter sharedInstance];
                        [v74 addDefaultGatekeeperPropertiesToDirectory:v116];

                        [v48 _setLocalURL:v119];
                        if (IMOSLoggingEnabled())
                        {
                          BOOL v75 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v162 = 138412290;
                            uint64_t v163 = (uint64_t)v119;
                            _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "Set transfer local url to: %@", v162, 0xCu);
                          }
                        }
                        id v76 = [v48 guid];
                        [v124 startFinalizingTransfer:v76];

                        if (IMOSLoggingEnabled())
                        {
                          id v77 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v162 = 0;
                            _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "Generating preview for in-line attachment", v162, 2u);
                          }
                        }
                        id v78 = +[IMDFileTransferCenter sharedInstance];
                        [v78 generatePreviewForTransfer:v48 messageItem:v120 senderContext:v111];
                      }
                      else
                      {
                        if (IMOSLoggingEnabled())
                        {
                          long long v84 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v162 = 138412290;
                            uint64_t v163 = (uint64_t)v48;
                            _os_log_impl(&dword_0, v84, OS_LOG_TYPE_INFO, "Could not locate file for transfer: %@", v162, 0xCu);
                          }
                        }
                        id v85 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.MessageAttachmentControllerErrorDomain" code:41 userInfo:0];

                        *((unsigned char *)v155 + 24) = 0;
                        *((_DWORD *)v151 + 6) = 35;
                        v159[3] = (uint64_t)v58;
                        __int16 v113 = v85;
                      }
                    }
                    else
                    {
                      __int16 v81 = +[NSError errorWithDomain:@"com.apple.MessageAttachmentControllerErrorDomain" code:35 userInfo:0];
                      id v82 = [v81 copy];

                      if (IMOSLoggingEnabled())
                      {
                        unsigned int v83 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v162 = 138412546;
                          uint64_t v163 = (uint64_t)v48;
                          __int16 v164 = 2112;
                          long long v165 = v81;
                          _os_log_impl(&dword_0, v83, OS_LOG_TYPE_INFO, "Failed retreiving file transfer: %@   error: %@", v162, 0x16u);
                        }
                      }
                      [v124 failTransfer:v47 error:v81];
                      *((unsigned char *)v155 + 24) = 0;
                      *((_DWORD *)v151 + 6) = 35;
                      v159[3] = (uint64_t)v58;

                      __int16 v113 = v82;
                    }
                  }
                }
                else
                {
                  if (IMOSLoggingEnabled())
                  {
                    id v80 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v162 = 138412290;
                      uint64_t v163 = (uint64_t)v50;
                      _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "   We're missing an attachment at path: %@", v162, 0xCu);
                    }
                  }
                  BOOL v118 = 0;
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                id v79 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v162 = 138412290;
                  uint64_t v163 = (uint64_t)v47;
                  _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "   We're missing a transfer for guid: %@", v162, 0xCu);
                }
              }
              BOOL v118 = 0;
            }
          }
          id v44 = obj;
          id v45 = [obj countByEnumeratingWithState:&v142 objects:v166 count:16];
        }
        while (v45);
      }
      else
      {
        __int16 v113 = 0;
      }

      if (v118)
      {
        if (IMOSLoggingEnabled())
        {
          long long v92 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v162 = 0;
            _os_log_impl(&dword_0, v92, OS_LOG_TYPE_INFO, "   We already have all these transfers, just moving along as a success!", v162, 2u);
          }
        }
        os_activity_scope_leave((os_activity_scope_state_t)(*(void *)&v168[8] + 32));
        if (v110)
        {
          kdebug_trace();
          (*((void (**)(id, id, id, void, void, void *, uint64_t, void, void))v110 + 2))(v110, v107, v112, *((unsigned __int8 *)v155 + 24), *((unsigned int *)v151 + 6), v113, v159[3], *(void *)(*((void *)&buf + 1) + 40), 0);
        }
LABEL_165:

        _Block_object_dispose(&v150, 8);
        _Block_object_dispose(&v154, 8);

        _Block_object_dispose(v168, 8);
        goto LABEL_166;
      }
      if (IMOSLoggingEnabled())
      {
        long long v93 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl(&dword_0, v93, OS_LOG_TYPE_INFO, "   We don't have all the attachments yet, we'll just re-download.", v162, 2u);
        }
      }
    }
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = sub_5BB48;
    v127[3] = &unk_DEFD8;
    id v128 = v120;
    id v129 = v124;
    id v130 = v112;
    id v131 = self;
    BOOL v140 = a8;
    v135 = &v154;
    id v136 = &v150;
    id v137 = &v158;
    id v132 = v111;
    BOOL v141 = a7;
    id v133 = v109;
    p_long long buf = &buf;
    id v139 = v168;
    id v134 = v110;
    long long v94 = objc_retainBlock(v127);
    if ((IMIsRunningInUnitTesting() & 1) != 0
      || (+[FTUserConfiguration sharedInstance],
          long long v95 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v96 = [v95 allowAnyNetwork],
          v95,
          (v96 & 1) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        long long v97 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl(&dword_0, v97, OS_LOG_TYPE_INFO, "Allowing any network, bypassing check", v162, 2u);
        }
      }
      ((void (*)(void *, void))v94[2])(v94, 0);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v98 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl(&dword_0, v98, OS_LOG_TYPE_INFO, "Starting network availablity check...", v162, 2u);
        }
      }
      long long v99 = +[IMSystemMonitor sharedInstance];
      unsigned int v100 = [v99 isScreenLit];

      id v101 = objc_alloc((Class)IMNetworkAvailability);
      if (v100) {
        uint64_t v102 = 0;
      }
      else {
        uint64_t v102 = 9;
      }
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_60250;
      v125[3] = &unk_DF000;
      v126 = v94;
      id v103 = [v101 initWithFlags:3 options:v102 timeout:v125 wifiTimeout:20.0 completionBlock:5.0];
      [v103 start];
    }
    __int16 v113 = v128;
    goto LABEL_165;
  }
LABEL_128:
  if (IMOSLoggingEnabled())
  {
    long long v86 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      long long v87 = [v120 fileTransferGUIDs];
      long long v88 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v87 count]);
      uint64_t v89 = [v120 balloonBundleID];
      long long v90 = (void *)v89;
      CFStringRef v91 = @"NO";
      *(_DWORD *)long long v168 = 138412802;
      *(void *)&v168[4] = v88;
      *(_WORD *)&v168[12] = 2112;
      if (v14) {
        CFStringRef v91 = @"YES";
      }
      *(void *)&v168[14] = v89;
      *(_WORD *)&v168[22] = 2112;
      CFStringRef v169 = v91;
      _os_log_impl(&dword_0, v86, OS_LOG_TYPE_INFO, "Not downloading attachments, transfer count:%@, bundle ID:%@ isUnderFirstDataProtectionLock %@", v168, 0x20u);
    }
  }
  if (v110)
  {
    kdebug_trace();
    (*((void (**)(id, id, id, uint64_t, void, void, uint64_t, void, void))v110 + 2))(v110, v120, v112, 1, 0, 0, v159[3], *(void *)(*((void *)&buf + 1) + 40), 0);
  }
LABEL_166:
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v158, 8);
}

- (BOOL)sendToLocalPeers:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageAttachmentController *)self deliveryController];
  unsigned __int8 v6 = [v5 sendToLocalPeers:v4];

  return v6;
}

- (BOOL)sendToLocalPeersFile:(id)a3 dictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MessageAttachmentController *)self deliveryController];
  unsigned __int8 v9 = [v8 sendToLocalPeersFile:v7 dictionary:v6];

  return v9;
}

- (id)localDeviceProductVersion
{
  v2 = [(MessageAttachmentController *)self deliveryController];
  id v3 = [v2 localDevice];
  id v4 = [v3 productVersion];

  return v4;
}

- (void)retrieveLocalFileTransfer:(id)a3 attachmentIndex:(unint64_t)a4 path:(id)a5 requestURLString:(id)a6 ownerID:(id)a7 signature:(id)a8 decryptionKey:(id)a9 requestedSize:(id)a10 fileSize:(unint64_t)a11 progressBlock:(id)a12 completionBlock:(id)a13
{
  id v18 = a3;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a12;
  id v22 = a13;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || ![v18 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        *(_DWORD *)id v50 = a4;
        *(_WORD *)&v50[4] = 2112;
        *(void *)&v50[6] = v18;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Trying to retrieve attachment at index: %u for transfer ID: %@, failing", buf, 0x12u);
      }
    }
    (*((void (**)(id, id, unint64_t, void, void, void, void))v22 + 2))(v22, v18, a4, 0, 0, 0, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)id v50 = v18;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " Requesting file attachments for transfer %@", buf, 0xCu);
      }
    }
    v48[0] = v18;
    v47[0] = IMDRelayLocalMessageDictionaryGUIDKey;
    v47[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
    CFStringRef v24 = +[NSNumber numberWithUnsignedInteger:a4];
    v48[1] = v24;
    v47[2] = IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey;
    v48[2] = &__kCFBooleanTrue;
    uint64_t v35 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];

    v45[0] = IMDRelayLocalMessageDictionaryTypeKey;
    v45[1] = IMDRelayLocalMessageDictionaryDictKey;
    v46[0] = IMDRelayLocalMessageTypeRemoteFileRequest;
    v46[1] = v35;
    CFStringRef v25 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    if ([(MessageAttachmentController *)self sendToLocalPeers:v25])
    {
      if (!qword_EB408)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFStringRef v27 = (void *)qword_EB408;
        qword_EB408 = (uint64_t)Mutable;
      }
      unsigned __int8 v28 = objc_msgSend(v18, "stringByAppendingFormat:", @"_%lu", a4);
      int v29 = (void *)qword_EB408;
      id v30 = objc_retainBlock(v22);
      [v29 setObject:v30 forKey:v28];

      dispatch_time_t v31 = dispatch_time(0, 600000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_60A5C;
      block[3] = &unk_DF028;
      id v42 = v28;
      id v43 = v18;
      unint64_t v44 = a4;
      id v32 = v28;
      dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)id v50 = v18;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, " Failed to send message to local device for Transfer %@, Failing", buf, 0xCu);
        }
      }
      (*((void (**)(id, id, unint64_t, void, void, void, void))v22 + 2))(v22, v18, a4, 0, 0, 0, 0);
    }
  }
}

- (void)remoteFileResponse:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, " Incomming response for file attachment %@ ", buf, 0xCu);
    }
  }
  id v5 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  id v6 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  id v7 = [v6 unsignedIntegerValue];

  id v8 = [v3 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryFileDataKey];
  unsigned __int8 v9 = [v3 objectForKeyedSubscript:iMessageLocalFileErrorCodeKey];
  id v10 = (char *)[v9 integerValue];

  uint64_t v11 = 0;
  if (v10) {
    BOOL v12 = v10 == (unsigned char *)&dword_4 + 1;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = v12;
  if (v10 && v10 != (unsigned char *)&dword_4 + 1)
  {
    uint64_t v11 = +[NSError errorWithDomain:IMPeerAttachmentMessageErrorDomain code:v10 userInfo:0];
  }
  if ([v5 length])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v8 length];
        *(_DWORD *)long long buf = 138413058;
        id v25 = v5;
        __int16 v26 = 2048;
        id v27 = v7;
        __int16 v28 = 2048;
        id v29 = v15;
        __int16 v30 = 2048;
        dispatch_time_t v31 = v10;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " Incomming response for message %@ attachmentIndex %lu data of length %lu errorCode %lu", buf, 0x2Au);
      }
    }
    CFStringRef v16 = objc_msgSend(v5, "stringByAppendingFormat:", @"_%lu", v7);
    id v17 = [(id)qword_EB408 objectForKey:v16];
    int v18 = IMOSLoggingEnabled();
    if (v17)
    {
      if (v18)
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " Found completion block for attachment", buf, 2u);
        }
      }
      ((void (**)(void, void *, id, void, void *, uint64_t, void *))v17)[2](v17, v5, v7, 0, v8, v13, v11);
      [(id)qword_EB408 removeObjectForKey:v16];
    }
    else
    {
      if (v18)
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v16;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " No completion block for attachment found: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [(id)qword_EB408 allKeys];
          *(_DWORD *)long long buf = 138412290;
          id v25 = v22;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "     In list of blocks: %@", buf, 0xCu);
        }
      }
    }
    if (![(id)qword_EB408 count])
    {
      CFStringRef v23 = (void *)qword_EB408;
      qword_EB408 = 0;
    }
  }
}

- (void)_sendAttachmentToPeerDevice:(unint64_t)a3 fileTransferGUID:(id)a4 messageGuid:(id)a5 fileURL:(id)a6 useLocalPeersFileAPI:(BOOL)a7 error:(int64_t)a8
{
  BOOL v9 = a7;
  id v33 = a4;
  id v35 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    unsigned int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v41 = v33;
      __int16 v42 = 2048;
      int64_t v43 = a8;
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Forwarding Attachment with guid %@ to local peer. Error: %lu. fileURL %@", buf, 0x20u);
    }
  }
  id v15 = +[NSFileManager defaultManager];
  CFStringRef v16 = [v13 path];
  id v17 = [v15 attributesOfItemAtPath:v16 error:0];

  int v18 = [v17 objectForKeyedSubscript:NSFileSize];
  uint64_t v19 = (uint64_t)[v18 longValue];

  int v20 = v19 > 0x100000 || v9;
  if (v20) {
    +[NSData data];
  }
  else {
  id v21 = +[NSData dataWithContentsOfURL:v13];
  }
  v39[0] = v35;
  v38[0] = IMDRelayLocalMessageDictionaryGUIDKey;
  v38[1] = IMDRelayLocalMessageDictionaryAttachmentIndexKey;
  id v22 = +[NSNumber numberWithUnsignedInteger:a3];
  v39[1] = v22;
  v38[2] = IMDRelayLocalMessageDictionaryFileDataKey;
  CFStringRef v23 = v21;
  if (!v21)
  {
    CFStringRef v23 = +[NSData data];
  }
  v39[2] = v23;
  v38[3] = iMessageLocalFileErrorCodeKey;
  CFStringRef v24 = +[NSNumber numberWithInteger:a8];
  v39[3] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];

  if (!v21) {
  v36[0] = IMDRelayLocalMessageDictionaryDictKey;
  }
  v36[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v37[0] = v25;
  v37[1] = IMDRelayLocalMessageTypeRemoteFileResponse;
  __int16 v26 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  if (v20)
  {
    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Sending attachment with file url api", buf, 2u);
      }
    }
    __int16 v28 = [(MessageAttachmentController *)self deliveryController];
    [v28 sendToLocalPeersFile:v13 dictionary:v26];
  }
  else
  {
    id v29 = [(MessageAttachmentController *)self deliveryController];
    __int16 v30 = [v29 localDevice];
    __int16 v28 = [v30 productVersion];

    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v41 = v28;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Using legacy api to send attachment running on product version: %@", buf, 0xCu);
      }
    }
    id v32 = [(MessageAttachmentController *)self deliveryController];
    [v32 sendToLocalPeers:v26];
  }
}

- (void)remotefileRequest:(id)a3 attempts:(int64_t)a4 shouldRetry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  BOOL v9 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  id v10 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryAttachmentIndexKey];
  id v80 = [v10 unsignedIntegerValue];

  uint64_t v105 = 0;
  id v106 = &v105;
  uint64_t v107 = 0x2020000000;
  unsigned __int8 v108 = 0;
  uint64_t v11 = [v8 objectForKeyedSubscript:iMessageLocalFileUseFileURLAPI];
  unsigned __int8 v12 = [v11 BOOLValue];

  unsigned __int8 v108 = v12;
  id v13 = [v8 objectForKeyedSubscript:IMDRelayLocalMessageDictionarySupportsDirectMMCSDownloadKey];
  unsigned int v14 = [v13 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      if (v5) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Attempting to locate message with Message Guid %@ shouldRetry %@", buf, 0x16u);
    }
  }
  id v17 = +[IMDMessageStore sharedInstance];
  int v18 = [v17 itemWithGUID:v9];

  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Unable To locate Message with GUID %@, adding to pending requests to retry later", buf, 0xCu);
      }
    }
    id v23 = [(MessageAttachmentController *)self pendingRemoteFileRequests];
    if (!v23)
    {
      id v23 = +[NSMutableSet set];
      [(MessageAttachmentController *)self setPendingRemoteFileRequests:v23];
    }
    [v23 addObject:v8];
    if (v5)
    {
      if (a4 <= 39)
      {
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v9;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Message with Guid  is not found %@, Retrying it a bit ", buf, 0xCu);
          }
        }
        id v81 = v8;
        im_dispatch_after();

        goto LABEL_88;
      }
      if (IMOSLoggingEnabled())
      {
        id v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Message with Guid is not found %@, No retried remain ", buf, 0xCu);
        }
      }
    }
    uint64_t v53 = 1;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Located Mesage with Message Guid %@", buf, 0xCu);
    }
  }
  int v20 = [(MessageAttachmentController *)self pendingRemoteFileRequests];
  [v20 removeObject:v8];

  id v21 = [(MessageAttachmentController *)self pendingRemoteFileRequests];
  BOOL v22 = [v21 count] == 0;

  if (v22) {
    [(MessageAttachmentController *)self setPendingRemoteFileRequests:0];
  }
  if (![v18 type])
  {
    id v23 = v18;
    if ([v23 isFinished]) {
      goto LABEL_30;
    }
    if (a4 > 39)
    {
      if (IMOSLoggingEnabled())
      {
        id v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "Message with Guid is unfinished %@, No retried remain ", buf, 0xCu);
        }
      }
      uint64_t v53 = 2;
      goto LABEL_133;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v56 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "Message with Guid  is unfinished %@, Retrying it a bit ", buf, 0xCu);
      }
    }
    long long v98 = _NSConcreteStackBlock;
    uint64_t v99 = 3221225472;
    unsigned int v100 = sub_628E0;
    id v101 = &unk_DF028;
    uint64_t v102 = self;
    id v103 = v8;
    int64_t v104 = a4;
    im_dispatch_after();

LABEL_88:
    uint64_t v53 = 0;
    goto LABEL_133;
  }
  id v23 = 0;
LABEL_30:
  __int16 v26 = [v18 fileTransferGUIDs];

  if (!v26)
  {
    uint64_t v53 = 3;
    goto LABEL_133;
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Located message with guid %@ attachments,  ", buf, 0xCu);
    }
  }
  __int16 v28 = [v18 fileTransferGUIDs];
  BOOL v29 = v80 < [v28 count];

  if (v29)
  {
    __int16 v30 = [v18 fileTransferGUIDs];
    id v78 = [v30 objectAtIndex:v80];

    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v78;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Attempting to locate file transfer with guid %@ ", buf, 0xCu);
      }
    }
    id v32 = +[IMDFileTransferCenter sharedInstance];
    id v79 = [v32 transferForGUID:v78];

    if (!v79)
    {
      if (IMOSLoggingEnabled())
      {
        id v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Transfer not found in transfer center, checking attachment store", buf, 2u);
        }
      }
      id v34 = +[IMDAttachmentStore sharedInstance];
      id v79 = [v34 attachmentWithGUID:v78];

      if (!v79)
      {
        if (IMOSLoggingEnabled())
        {
          id v67 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v78;
            _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "Did not find file transfer for message GUID %@ transfer guid %@", buf, 0x16u);
          }
        }
        uint64_t v53 = 3;

        goto LABEL_132;
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v78;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Located Transfer with Guid %@ ", buf, 0xCu);
      }
    }
    if (![v79 isFinished])
    {
      if (a4 > 39)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v60 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v78;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, no retries remain ", buf, 0x16u);
          }
        }
        uint64_t v53 = 4;
        goto LABEL_131;
      }
      if (IMOSLoggingEnabled())
      {
        id v58 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Transfer Guid %@ for Message with %@ is not yet complete, Retrying it a bit ", buf, 0x16u);
        }
      }
      id v82 = v8;
      im_dispatch_after();

LABEL_130:
      uint64_t v53 = 0;
LABEL_131:

LABEL_132:
      goto LABEL_133;
    }
    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v78;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Located Completed transfer with %@ ", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay", buf, 2u);
      }
    }
    id v38 = +[IMDChatStore sharedInstance];
    id v39 = [v38 chatsGUIDsForMessageWithGUID:v9];
    id v76 = [v39 lastObject];

    id v40 = +[IMDChatStore sharedInstance];
    BOOL v75 = [v40 chatWithGUID:v76];

    id v41 = [v75 isFiltered];
    if (v41) {
      int v42 = v14 ^ 1;
    }
    else {
      int v42 = 1;
    }
    if (v42 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        int64_t v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          __int16 v44 = +[NSNumber numberWithBool:v41 == 0];
          id v45 = +[NSNumber numberWithBool:v14 ^ 1];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v45;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Attempting to transcode attachment for peer relay, this is a known sender (%@) or old watch (%@)", buf, 0x16u);
        }
      }
      inUTI = [v79 type];
      id v46 = [v79 transcoderUserInfo];
      CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v46 mutableCopy];

      if (UTTypeConformsTo(inUTI, kUTTypeAudiovisualContent))
      {
        if (!Mutable) {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        if (IMOSLoggingEnabled())
        {
          id v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Found an a/v type, adding transcoder options to remove alpha and check for hevc+alpha", buf, 2u);
          }
        }
        uint64_t v49 = +[NSNumber numberWithBool:1];
        [(__CFDictionary *)Mutable setObject:v49 forKey:IMFileTransferAVTranscodeOptionRemoveAlpha];

        id v50 = +[NSNumber numberWithBool:1];
        [(__CFDictionary *)Mutable setObject:v50 forKey:IMFileTransferAVTranscodeOptionCheckForAnimojiV2];
      }
      unsigned __int8 v74 = +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v79 isSending:1];
      uint64_t v51 = +[MessageTranscodeController sharedInstance];
      id v52 = [v79 localURL];
      unsigned int v73 = [v79 isSticker];
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_628F8;
      v91[3] = &unk_DF050;
      id v92 = v79;
      long long v93 = self;
      unsigned __int8 v96 = &v105;
      id v97 = v80;
      id v94 = v78;
      id v95 = v9;
      LOBYTE(v72) = v74;
      [v51 transcodeFileTransferContents:v52 utiType:inUTI isSticker:v73 transcoderUserInfo:Mutable sizes:&off_E3A20 commonCapabilities:0 representations:0 isLQMEnabled:v72 completionBlock:v91];

      goto LABEL_129;
    }
    id v61 = [v79 type];
    BOOL v62 = v61 == 0;

    if (v62) {
      goto LABEL_139;
    }
    unsigned int v63 = [v79 type];
    inUTI = +[UTType typeWithIdentifier:v63];

    if ([(__CFString *)inUTI conformsToType:UTTypeImage])
    {
      id v64 = [v79 localURL];
      char v65 = IMFileURLIsActuallyAnimated();

      if ((v65 & 1) == 0)
      {
        uint64_t v110 = 0;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero();
        *(_OWORD *)long long buf = xmmword_A54F0;
        *(_OWORD *)&buf[16] = xmmword_A5500;
        LOBYTE(v110) = [v79 isSticker];
        BYTE2(v110) = [v79 isAdaptiveImageGlyph];
        BYTE1(v110) = 0;
        long long v70 = +[IMTranscodeController sharedInstance];
        id v71 = [v79 localURL];
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_62E04;
        v85[3] = &unk_DF078;
        v85[4] = self;
        id v90 = v80;
        id v86 = v78;
        id v87 = v9;
        uint64_t v89 = &v105;
        id v88 = v79;
        v83[0] = *(_OWORD *)buf;
        v83[1] = *(_OWORD *)&buf[16];
        uint64_t v84 = v110;
        [v70 generateSafeRender:v71 constraints:v83 completionBlock:v85];

        goto LABEL_129;
      }
    }
    if (!inUTI)
    {
LABEL_139:
      if (IMOSLoggingEnabled())
      {
        uint64_t v68 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not found", buf, 2u);
        }
      }
      inUTI = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = inUTI;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay because the filetype was not supported: %@", buf, 0xCu);
      }
    }
    v69 = [v79 localURL];
    [(MessageAttachmentController *)self _sendAttachmentToPeerDevice:v80 fileTransferGUID:v78 messageGuid:v9 fileURL:v69 useLocalPeersFileAPI:*((unsigned __int8 *)v106 + 24) error:5];

LABEL_129:
    goto LABEL_130;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned __int8 v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      uint64_t v55 = [v18 fileTransferGUIDs];
      *(_DWORD *)long long buf = 134218242;
      *(void *)&uint8_t buf[4] = v80;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v55;
      _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "Attachment index out of bounds. attachment index: %lu file transfer guids: %@", buf, 0x16u);
    }
  }
  uint64_t v53 = 6;
LABEL_133:

  if (v53) {
    [(MessageAttachmentController *)self _sendAttachmentToPeerDevice:v80 fileTransferGUID:0 messageGuid:v9 fileURL:0 useLocalPeersFileAPI:*((unsigned __int8 *)v106 + 24) error:v53];
  }

  _Block_object_dispose(&v105, 8);
}

- (id)_createPayloadRequestDictionaryForMessageGUID:(id)a3 requestKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"guid", v5);
    CFDictionarySetValue(Mutable, @"request-key", v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        unsigned int v14 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "PayoadAttachments _createPayloadRequestDictionaryForMessageGUID invalid parameters guid %@ key %@", (uint8_t *)&v11, 0x16u);
      }
    }
    CFMutableDictionaryRef Mutable = 0;
  }

  return Mutable;
}

- (void)fetchPayloadDataFromCompanionForGUID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 length];
  if (v7 && v8)
  {
    BOOL v9 = +[NSString stringGUID];
    id v10 = [(MessageAttachmentController *)self _createPayloadRequestDictionaryForMessageGUID:v6 requestKey:v9];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryTypeKey, @"payload-data-request");
    id v12 = v10;
    if (v12)
    {
      CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryDictKey, v12);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_96804();
    }

    id v15 = [(MessageAttachmentController *)self deliveryController];
    unsigned int v16 = [v15 sendToLocalPeers:Mutable];

    int v17 = IMOSLoggingEnabled();
    if (v16)
    {
      if (v17)
      {
        int v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v28 = v12;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Sent payload-data-request to companion successfully with dict %@", buf, 0xCu);
        }
      }
      if (!self->_localPayloadDataRequestGUIDToCompletionBlockMap)
      {
        uint64_t v19 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        localPayloadDataRequestGUIDToCompletionBlockMap = self->_localPayloadDataRequestGUIDToCompletionBlockMap;
        self->_localPayloadDataRequestGUIDToCompletionBlockMap = v19;
      }
      id v21 = _Block_copy(v7);
      BOOL v22 = self->_localPayloadDataRequestGUIDToCompletionBlockMap;
      id v23 = objc_retainBlock(v21);
      [(NSMutableDictionary *)v22 setObject:v23 forKey:v9];

      id v25 = v9;
      id v26 = v6;
      im_dispatch_after();
    }
    else
    {
      if (v17)
      {
        CFStringRef v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v28 = v6;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "PayloadAttachments failed to send payload-data-request for message guid %@", buf, 0xCu);
        }
      }
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = objc_retainBlock(v7);
      *(_DWORD *)long long buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "PayloadAttachments Invalid parameters to fetchPayloadDataFromCompanionForGUID %@ %@", buf, 0x16u);
    }
  }
}

- (void)handlePayloadDataResponse:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "HandlePayloadDataresponse", buf, 2u);
    }
  }
  id v6 = [v4 objectForKey:@"request-key"];
  id v7 = [v4 objectForKey:@"payload-data"];
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_localPayloadDataRequestGUIDToCompletionBlockMap objectForKey:v6];
    if (v8)
    {
      BOOL v9 = +[NSString stringGUID];
      id v21 = [v9 stringByAppendingPathExtension:IMFileTransferCombinedPluginPayloadExtension];

      id v10 = +[NSFileManager defaultManager];
      int v11 = objc_msgSend(v10, "im_randomTemporaryFileURLWithFileName:", v21);
      id v12 = [v11 path];

      __int16 v13 = [v12 stringByResolvingAndStandardizingPath];

      id v14 = +[NSURL fileURLWithPath:v13 isDirectory:0];
      id v22 = 0;
      unsigned __int8 v15 = [v7 writeToURL:v14 options:1 error:&v22];
      id v16 = v22;
      if ((v15 & 1) == 0)
      {

        if (IMOSLoggingEnabled())
        {
          int v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v24 = v16;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "IMiMessageAppPayloadDecoder Failed writing attachment to disk on incoming: %@", buf, 0xCu);
          }
        }
        id v14 = 0;
      }
      ((void (**)(void, void *))v8)[2](v8, v14);
      [(NSMutableDictionary *)self->_localPayloadDataRequestGUIDToCompletionBlockMap removeObjectForKey:v6];
      if (IMOSLoggingEnabled())
      {
        int v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v6;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Dequeue completion block for key %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v24 = v6;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "PayloadAttachments no completion block found for key %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "PayloadAttachments handlePayloadDataResponse. No request key present. No completion block to call", buf, 2u);
    }
  }
}

- (id)_createPayloadResponseDictionaryWithDictionary:(id)a3 payloadData:(id)a4 attachments:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (__CFDictionary *)[v7 mutableCopy];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v12 = Mutable;
  if (v8) {
    CFDictionarySetValue(Mutable, IMCombinedPayloadDictionaryPayloadKey, v8);
  }
  if (v9) {
    CFDictionarySetValue(v12, IMCombinedPayloadDictionaryAttachmentsKey, v9);
  }
  __int16 v13 = JWEncodeDictionary();
  id v14 = [v13 _FTCopyGzippedData];

  id v15 = v14;
  if (v15)
  {
    CFDictionarySetValue(v10, @"payload-data", v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_96890();
  }

  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v18 = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Created response dictionary", v18, 2u);
    }
  }
  return v10;
}

- (void)handlePayloadDataRequest:(id)a3 attempts:(unint64_t)a4
{
  id v44 = a3;
  id v45 = [v44 objectForKey:@"guid"];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v61 = v45;
      __int16 v62 = 2048;
      unint64_t v63 = a4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "handlePayloadDataRequest for guid %@ attempts %lu", buf, 0x16u);
    }
  }
  id v6 = [v45 length];
  if (a4 > 2 || !v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v61 = v45;
        __int16 v62 = 2048;
        unint64_t v63 = a4;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "PayloadAttachments did not find data for messageGUID %@ in attempts %lu", buf, 0x16u);
      }
    }
    __int16 v29 = 0;
    id v28 = 0;
LABEL_48:
    dispatch_time_t v31 = v28;
    id v32 = v29;
    id v33 = -[MessageAttachmentController _createPayloadResponseDictionaryWithDictionary:payloadData:attachments:](self, "_createPayloadResponseDictionaryWithDictionary:payloadData:attachments:", v44);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryTypeKey, @"payload-data-response");
    id v35 = v33;
    if (v35)
    {
      CFDictionarySetValue(Mutable, IMDRelayLocalMessageDictionaryDictKey, v35);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_96804();
    }

    id v36 = [(MessageAttachmentController *)self deliveryController];
    unsigned int v37 = [v36 sendToLocalPeers:Mutable];

    int v38 = IMOSLoggingEnabled();
    if (v37)
    {
      if (v38)
      {
        id v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v61 = v45;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Sent message payload successfully for guid %@", buf, 0xCu);
        }
LABEL_60:
      }
    }
    else if (v38)
    {
      id v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v61 = v45;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "PayloadAttachments Sent message payload successfully for guid %@", buf, 0xCu);
      }
      goto LABEL_60;
    }

    goto LABEL_62;
  }
  id v7 = +[IMDMessageStore sharedInstance];
  int v42 = [v7 messageWithGUID:v45];

  id v8 = [v42 payloadData];
  LODWORD(v7) = v8 == 0;

  int v9 = IMOSLoggingEnabled();
  if (!v7)
  {
    id v10 = v42;
    if (v9)
    {
      int v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v61 = v45;
        __int16 v62 = 2048;
        unint64_t v63 = a4;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Found messageitem %@ with payload attempt %lul ", buf, 0x16u);
      }

      id v10 = v42;
    }
    id v12 = [v10 payloadData];
    id v41 = [v12 _FTCopyGzippedData];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = [v42 fileTransferGUIDs];
    id v13 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v13)
    {
      id v14 = 0;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(obj);
          }
          int v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          int v18 = +[IMDFileTransferCenter sharedInstance];
          uint64_t v19 = [v18 transferForGUID:v17];

          if (v19)
          {
            int v20 = [v19 localURL];
            if (v20)
            {
              id v47 = 0;
              id v21 = +[NSData dataWithContentsOfURL:v20 options:1 error:&v47];
              id v22 = v47;
              if ([v21 length]) {
                BOOL v23 = v22 == 0;
              }
              else {
                BOOL v23 = 0;
              }
              if (v23)
              {
                id v27 = v14;
                if (!v14) {
                  id v27 = objc_alloc_init((Class)NSMutableArray);
                }
                id v14 = v27;
                [v27 addObject:v21];
              }
              else if (IMOSLoggingEnabled())
              {
                id v24 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412546;
                  id v61 = v17;
                  __int16 v62 = 2112;
                  unint64_t v63 = (unint64_t)v22;
                  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "PayloadAttachments Missing attachment data for attachment with file transfer GUID %@, possible read error %@", buf, 0x16u);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              id v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                id v61 = v17;
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "PayloadAttachments Missing attachment URL for attachment with file transfer GUID %@", buf, 0xCu);
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            id v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v61 = v17;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "PayloadAttachments Did not find file transfer with GUID %@", buf, 0xCu);
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v13);

      id v28 = v41;
      __int16 v29 = v14;
    }
    else
    {

      __int16 v29 = 0;
      id v28 = v41;
    }
    goto LABEL_48;
  }
  if (v9)
  {
    id v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v61 = v45;
      __int16 v62 = 2112;
      unint64_t v63 = (unint64_t)v42;
      __int16 v64 = 2048;
      unint64_t v65 = a4;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "PayloadAttachments Did not find data for guid %@ messageItem %@ attempts %lu", buf, 0x20u);
    }
  }
  id v52 = _NSConcreteStackBlock;
  uint64_t v53 = 3221225472;
  unsigned __int8 v54 = sub_6449C;
  uint64_t v55 = &unk_DF028;
  uint64_t v56 = self;
  id v57 = v44;
  unint64_t v58 = a4;
  im_dispatch_after();

  dispatch_time_t v31 = v42;
LABEL_62:
}

- (unint64_t)_maxCompressedPayloadDataLength
{
  return 9216;
}

- (BOOL)_shouldUploadPayloadDataOverMMCS:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _FTCopyGzippedData];
  unint64_t v6 = [(MessageAttachmentController *)self _maxCompressedPayloadDataLength];
  if (IMGetCachedDomainBoolForKey())
  {
    id v7 = +[IMLockdownManager sharedInstance];
    unsigned int v8 = [v7 isInternalInstall];

    if (v8) {
      unint64_t v6 = 0;
    }
  }
  id v9 = [v5 length];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v5 length];
      id v12 = [v4 length];
      CFStringRef v13 = @"NO";
      int v15 = 134218754;
      id v16 = v11;
      __int16 v17 = 2048;
      if ((unint64_t)v9 > v6) {
        CFStringRef v13 = @"YES";
      }
      id v18 = v12;
      __int16 v19 = 2048;
      unint64_t v20 = v6;
      __int16 v21 = 2112;
      CFStringRef v22 = v13;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Should upload compressed payload data length %lu, uncompressed data length %lu, maxLenght %lu  result %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  return (unint64_t)v9 > v6;
}

- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 fromID:(id)a5 recipients:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = objc_msgSend(v15, "__im_canonicalIDSIDsFromAddresses");
  id v18 = IMServiceNameForCanonicalIDSAddresses();
  if ([v18 isEqualToString:IDSServiceNameiMessageForBusiness])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_647E0;
    v19[3] = &unk_DF0C8;
    v19[4] = self;
    id v20 = v12;
    id v21 = v13;
    id v22 = v18;
    id v23 = v16;
    [(MessageAttachmentController *)self sessionInfoForBusinessReceipients:v15 fromID:v14 completion:v19];
  }
  else
  {
    [(MessageAttachmentController *)self sendPayloadData:v12 messageGUID:v13 sessionInfo:0 topic:v18 completionBlock:v16];
  }
}

- (void)sendPayloadData:(id)a3 messageGUID:(id)a4 sessionInfo:(id)a5 topic:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v29 = a5;
  id v30 = a6;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v39 = v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Request to upload payload data for message guid %@", buf, 0xCu);
    }
  }
  if ([(MessageAttachmentController *)self _shouldUploadPayloadDataOverMMCS:v12])
  {
    id v16 = +[NSFileManager defaultManager];
    __int16 v17 = +[NSString stringGUID];
    id v18 = [v17 stringByAppendingPathExtension:@"txt"];
    __int16 v19 = objc_msgSend(v16, "im_randomTemporaryFileURLWithFileName:", v18);
    uint64_t v20 = [v19 path];

    id v21 = [(id)v20 stringByResolvingAndStandardizingPath];

    [v12 writeToFile:v21 atomically:1];
    id v22 = +[NSFileManager defaultManager];
    LOBYTE(v20) = [v22 fileExistsAtPath:v21];

    if (v20)
    {
      id v23 = +[NSString stringGUID];
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412802;
          id v39 = v13;
          __int16 v40 = 2112;
          id v41 = v21;
          __int16 v42 = 2112;
          int64_t v43 = v23;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Wrote payload data for message %@ to file %@ transferID %@", buf, 0x20u);
        }
      }
      id v25 = +[IMTransferServicesController sharedInstance];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      void v36[2] = sub_64CF8;
      v36[3] = &unk_DEDA8;
      id v37 = v23;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_64E38;
      v31[3] = &unk_DF0F0;
      id v32 = v21;
      id v33 = v37;
      id v34 = v13;
      id v35 = v14;
      id v26 = v37;
      [v25 sendFilePath:v32 topic:v30 userInfo:v29 transferID:v26 encryptFile:1 progressBlock:v36 completionBlock:v31];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v39 = v13;
          __int16 v40 = 2112;
          id v41 = v21;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Could not write payload data for msg guid %@ to filepath %@", buf, 0x16u);
        }
      }
      if (v14) {
        (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Not uploading payload data to MMCS", buf, 2u);
      }
    }
    if (v14) {
      (*((void (**)(id, void, uint64_t))v14 + 2))(v14, 0, 1);
    }
  }
}

- (void)downloadPayloadDataForMessageGUID:(id)a3 payLoadDictionary:(id)a4 topic:(id)a5 completionBlock:(id)a6
{
  id v32 = a3;
  id v9 = a4;
  id v31 = a5;
  id v10 = a6;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v39 = v32;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Request to download payload data for message %@ payload dictionary %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    id v30 = [v9 objectForKey:@"o"];
    id v29 = [v9 objectForKey:@"s"];
    id v28 = [v9 objectForKey:@"r"];
    id v12 = [v9 objectForKey:@"e"];
    uint64_t v13 = [v9 objectForKey:@"f"];
    id v14 = (void *)v13;
    if (v30 && v29 && v28 && v12 && v13)
    {
      id v15 = +[NSFileManager defaultManager];
      id v16 = +[NSString stringGUID];
      __int16 v17 = [v16 stringByAppendingPathExtension:@"txt"];
      id v18 = objc_msgSend(v15, "im_randomTemporaryFileURLWithFileName:", v17);
      id v27 = [v18 path];

      __int16 v19 = +[NSString stringGUID];
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412802;
          id v39 = v27;
          __int16 v40 = 2112;
          id v41 = v19;
          __int16 v42 = 2112;
          id v43 = v32;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "About to start download payload to file %@ with fileTransferID %@ message GUID %@", buf, 0x20u);
        }
      }
      id v21 = +[IMTransferServicesController sharedInstance];
      id v22 = [v27 stringByResolvingAndStandardizingPath];
      id v23 = [v14 unsignedIntegerValue];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      void v36[2] = sub_657F4;
      v36[3] = &unk_DEDA8;
      id v37 = v19;
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_65934;
      v33[3] = &unk_DF118;
      id v34 = v32;
      id v35 = v10;
      id v24 = v19;
      [v21 receiveFileTransfer:v24 topic:v31 path:v22 requestURLString:v28 ownerID:v30 signature:v29 decryptionKey:v12 fileSize:v23 progressBlock:v36 completionBlock:v33];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138413314;
          id v39 = v30;
          __int16 v40 = 2112;
          id v41 = v29;
          __int16 v42 = 2112;
          id v43 = v28;
          __int16 v44 = 2112;
          id v45 = v12;
          __int16 v46 = 2112;
          id v47 = v14;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "PayloadAttachments. Payload data dictionary is incomplete. Cannot download file ownerID %@ signature %@ requestURLString %@ decryptionKey %@ fileSize %@", buf, 0x34u);
        }
      }
      if (v10) {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "No payload data to download from MMCS", buf, 2u);
      }
    }
    if (v10) {
      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, 1);
    }
  }
}

- (void)_processDownloadedPayload:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  __int16 v19 = +[IMDChatRegistry sharedInstance];
  id v20 = [v19 hasKnownSenderChatWithChatIdentifier:v16];

  id v21 = +[IMSenderContext contextWithKnownSender:v20];
  id v22 = +[IMTranscodeController sharedInstance];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_65D90;
  v29[3] = &unk_DF140;
  id v30 = v15;
  id v31 = v14;
  id v32 = v16;
  id v33 = v17;
  id v34 = v13;
  id v35 = v18;
  id v23 = v13;
  id v24 = v17;
  id v25 = v16;
  id v26 = v14;
  id v27 = v15;
  id v28 = v18;
  [v22 decodeiMessageAppPayload:v23 senderContext:v21 bundleID:v27 completionBlock:v29 blockUntilReply:1];
}

- (void)processDownloadedPayloadData:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8
{
  id v14 = a3;
  id v25 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  __int16 v19 = +[NSString stringGUID];
  id v20 = [v19 stringByAppendingPathComponent:IMFileTransferPluginPayloadAttachmentExtension];

  id v21 = +[NSFileManager defaultManager];
  id v22 = objc_msgSend(v21, "im_randomTemporaryFileURLWithFileName:", v20);

  id v26 = 0;
  LOBYTE(a8) = [v14 writeToURL:v22 options:1 error:&v26];
  id v23 = v26;
  if (a8)
  {
    [(MessageAttachmentController *)self _processDownloadedPayload:v22 forMessageGUID:v25 balloonBundleID:v15 fromIdentifier:v16 senderToken:v17 withCompletionBlock:v18];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v28 = v22;
        __int16 v29 = 2112;
        id v30 = v23;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "PayloadAttachments. Failed writing payload data to path %@ error %@", buf, 0x16u);
      }
    }
    (*((void (**)(id, void, void, void))v18 + 2))(v18, 0, 0, 0);
  }
}

- (void)processMessageAttachmentDictionary:(id)a3 forMessageGUID:(id)a4 balloonBundleID:(id)a5 fromIdentifier:(id)a6 senderToken:(id)a7 withCompletionBlock:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v33 = v16;
  id v19 = a3;
  id v20 = +[NSArray arrayWithObjects:&v33 count:1];
  id v21 = IMServiceNameForCanonicalIDSAddresses();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_6667C;
  v27[3] = &unk_DF168;
  v27[4] = self;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  [(MessageAttachmentController *)self downloadPayloadDataForMessageGUID:v26 payLoadDictionary:v19 topic:v21 completionBlock:v27];
}

- (NSMutableSet)pendingRemoteFileRequests
{
  return self->_pendingRemoteFileRequests;
}

- (void)setPendingRemoteFileRequests:(id)a3
{
}

- (BOOL)shouldSendLowResolutionOnly
{
  return self->_shouldSendLowResolutionOnly;
}

- (NSMutableDictionary)localPayloadDataRequestGUIDToCompletionBlockMap
{
  return self->_localPayloadDataRequestGUIDToCompletionBlockMap;
}

- (void)setLocalPayloadDataRequestGUIDToCompletionBlockMap:(id)a3
{
}

- (NSMutableDictionary)eagerUploadStatuses
{
  return self->_eagerUploadStatuses;
}

- (void)setEagerUploadStatuses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eagerUploadStatuses, 0);
  objc_storeStrong((id *)&self->_localPayloadDataRequestGUIDToCompletionBlockMap, 0);

  objc_storeStrong((id *)&self->_pendingRemoteFileRequests, 0);
}

@end