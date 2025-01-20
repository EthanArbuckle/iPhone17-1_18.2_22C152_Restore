@interface IMTextMessagePipelineParameter
+ (BOOL)isAutoReplyWithBlastDoorMessage:(id)a3;
+ (BOOL)isCriticalWithBlastDoorMessage:(id)a3;
+ (BOOL)isExpirableWithBlastDoorTextMessage:(id)a3;
+ (BOOL)isSOSWithBlastDoorMessage:(id)a3;
+ (BOOL)seenAsOffGridWithBlastDoorMessage:(id)a3;
+ (id)_fileTransferMatchingAttribute:(id)a3 inFileTransfers:(id)a4;
+ (id)attributionInfoArrayWithBlastDoorMessage:(id)a3;
+ (id)availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:(id)a3;
+ (id)availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:(id)a3;
+ (id)availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:(id)a3;
+ (id)availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:(id)a3;
+ (id)convertAttributionInfoToArray:(id)a3;
+ (id)convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:(id)a3 supportingStickerAttributes:(BOOL)a4 existingFileTransfersForMessage:(id)a5;
+ (id)fileTransferForBlastDoorFileTransferAttribute:(id)a3 fileTransferGUIDs:(id)a4 supportingStickerAttributes:(BOOL)a5;
+ (id)lastPublisherOfOffGridStatusWithBlastDoorMessage:(id)a3;
+ (id)nicknameDictionaryWithBlastDoorMessage:(id)a3;
+ (id)participantDestinationIdentifierWithBasicMessage:(id)a3;
+ (id)participantDestinationIdentifierWithMessage:(id)a3;
+ (id)plainTextBodyWithBlastDoorBasicMessage:(id)a3;
+ (id)plainTextBodyWithBlastDoorMessage:(id)a3;
+ (id)plainTextSubjectWithBlastDoorBasicMessage:(id)a3;
+ (id)plainTextSubjectWithBlastDoorMessage:(id)a3;
+ (id)replicationSourceServiceNameWithBlastDoorBasicMessage:(id)a3;
+ (id)replicationSourceServiceNameWithBlastDoorMessage:(id)a3;
+ (id)richBodyWithBlastDoorBasicMessage:(id)a3;
+ (id)richBodyWithBlastDoorMessage:(id)a3;
+ (id)scheduledDateWithBlastDoorTextMessage:(id)a3;
+ (id)stickerInfoDictionaryFromBlastDoorEmojiImageAttachmentInfo:(id)a3;
+ (id)stickerInfoDictionaryFromBlastDoorStickerAttachmentInfo:(id)a3;
+ (id)stickerInfoDictionaryWithStickerGUID:(id)a3 stickerPackGUID:(id)a4 stickerHash:(id)a5 positionIntent:(id)a6 associatedPositionIntent:(id)a7 parentPreviewWidth:(id)a8 stickerXOffset:(id)a9 stickerYOffset:(id)a10 stickerScale:(id)a11 stickerRotation:(id)a12 stickerBundleID:(id)a13 stickerIsReaction:(id)a14 stickerPositionVersion:(id)a15 stickerExternalURI:(id)a16;
+ (unint64_t)scheduleTypeWithBlastDoorTextMessage:(id)a3;
- (BOOL)hadChat;
- (BOOL)isAutoReply;
- (BOOL)isCritical;
- (BOOL)isExpirable;
- (BOOL)isFromMe;
- (BOOL)isFromStorage;
- (BOOL)isFromTrustedSnapSender;
- (BOOL)isLastFromStorage;
- (BOOL)isSOS;
- (BOOL)seenAsOffGrid;
- (BOOL)supportsStickerAttributesInMessageBody;
- (BOOL)wantsCheckpointing;
- (BOOL)wantsDeliveryReceipt;
- (BOOL)wasDetonated;
- (IMDAccount)account;
- (IMDChat)chat;
- (IMDServiceSession)serviceSession;
- (IMTextMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (IMTextMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4;
- (NSArray)attributionInfoArray;
- (NSArray)fileTransferGUIDs;
- (NSArray)messageItems;
- (NSArray)participantIdentifiers;
- (NSArray)replicatedFallbackGUIDs;
- (NSAttributedString)richBody;
- (NSDate)scheduledDate;
- (NSDictionary)inlineAttachmentsDictionary;
- (NSDictionary)messageSummaryInfo;
- (NSDictionary)nicknameDictionary;
- (NSNumber)groupParticipantVersion;
- (NSNumber)groupPhotoCreationTime;
- (NSNumber)groupProtocolVersion;
- (NSNumber)timestamp;
- (NSSet)senderRegistrationProperties;
- (NSString)GUID;
- (NSString)associatedMessageGUID;
- (NSString)availabilityOffGridRecipientEncryptionValidationToken;
- (NSString)availabilityOffGridRecipientSubscriptionValidationToken;
- (NSString)availabilityVerificationRecipientChannelIDPrefix;
- (NSString)availabilityVerificationRecipientEncryptionValidationToken;
- (NSString)currentGroupName;
- (NSString)expressiveSendStyleIdentifier;
- (NSString)fromDisplayID;
- (NSString)fromIdentifier;
- (NSString)groupID;
- (NSString)lastPublisherOfOffGridStatus;
- (NSString)plainTextBody;
- (NSString)plainTextSubject;
- (NSString)replicationSourceServiceName;
- (NSString)replyToGUID;
- (NSString)threadIdentifierGUID;
- (NSString)threadOriginatorFallbackHash;
- (NSString)toIdentifier;
- (id)_createSuperFormattedStringWithAttributedString:(id)a3;
- (id)description;
- (id)messageSummaryInfoDictionaryWithBlastDoorBasicMessage:(id)a3;
- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3;
- (unint64_t)scheduleState;
- (unint64_t)scheduleType;
- (void)setAccount:(id)a3;
- (void)setAssociatedMessageGUID:(id)a3;
- (void)setAttributionInfoArray:(id)a3;
- (void)setAutoReply:(BOOL)a3;
- (void)setAvailabilityOffGridRecipientEncryptionValidationToken:(id)a3;
- (void)setAvailabilityOffGridRecipientSubscriptionValidationToken:(id)a3;
- (void)setAvailabilityVerificationRecipientChannelIDPrefix:(id)a3;
- (void)setAvailabilityVerificationRecipientEncryptionValidationToken:(id)a3;
- (void)setChat:(id)a3;
- (void)setCritical:(BOOL)a3;
- (void)setCurrentGroupName:(id)a3;
- (void)setExpirable:(BOOL)a3;
- (void)setExpressiveSendStyleIdentifier:(id)a3;
- (void)setFileTransferGUIDs:(id)a3;
- (void)setFromDisplayID:(id)a3;
- (void)setFromIdentifier:(id)a3;
- (void)setFromTrustedSnapSender:(BOOL *)a3;
- (void)setGUID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupParticipantVersion:(id)a3;
- (void)setGroupPhotoCreationTime:(id)a3;
- (void)setGroupProtocolVersion:(id)a3;
- (void)setHadChat:(BOOL)a3;
- (void)setInlineAttachmentsDictionary:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsFromStorage:(BOOL)a3;
- (void)setIsLastFromStorage:(BOOL)a3;
- (void)setLastPublisherOfOffGridStatus:(id)a3;
- (void)setMessageItems:(id)a3;
- (void)setMessageSummaryInfo:(id)a3;
- (void)setNicknameDictionary:(id)a3;
- (void)setParticipantIdentifiers:(id)a3;
- (void)setPlainTextBody:(id)a3;
- (void)setPlainTextSubject:(id)a3;
- (void)setReplicatedFallbackGUIDs:(id)a3;
- (void)setReplicationSourceServiceName:(id)a3;
- (void)setReplyToGUID:(id)a3;
- (void)setRichBody:(id)a3;
- (void)setScheduleState:(unint64_t)a3;
- (void)setScheduleType:(unint64_t)a3;
- (void)setScheduledDate:(id)a3;
- (void)setSeenAsOffGrid:(BOOL)a3;
- (void)setSenderRegistrationProperties:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setSos:(BOOL)a3;
- (void)setThreadIdentifierGUID:(id)a3;
- (void)setThreadOriginatorFallbackHash:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToIdentifier:(id)a3;
- (void)setWantsCheckpointing:(BOOL)a3;
- (void)setWantsDeliveryReceipt:(BOOL)a3;
- (void)setWasDetonated:(BOOL)a3;
@end

@implementation IMTextMessagePipelineParameter

+ (id)participantDestinationIdentifierWithMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  switch(v5)
  {
    case 0:
      v6 = [v3 messageSubType];
      v7 = [v6 typingIndicator];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 1:
      v6 = [v3 messageSubType];
      v7 = [v6 textMessage];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 2:
      v6 = [v3 messageSubType];
      v7 = [v6 tapback];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 3:
      v6 = [v3 messageSubType];
      v7 = [v6 balloonPlugin];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 4:
      v6 = [v3 messageSubType];
      v7 = [v6 sticker];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 5:
      v6 = [v3 messageSubType];
      v7 = [v6 audioMessage];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 6:
      v6 = [v3 messageSubType];
      v7 = [v6 emojiTapback];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_15;
    case 7:
      v6 = [v3 messageSubType];
      v7 = [v6 stickerTapback];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
LABEL_15:
      v10 = (void *)v8;

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v12 = 134217984;
          uint64_t v13 = v5;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMTextMessagePipelineParameter> Unhandled BlastDoorTextMessageMessageType: %ld", (uint8_t *)&v12, 0xCu);
        }
      }
      v10 = 0;
      break;
  }

  return v10;
}

+ (id)participantDestinationIdentifierWithBasicMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  switch(v5)
  {
    case 0:
      v6 = [v3 messageSubType];
      v7 = [v6 typingIndicator];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_13;
    case 1:
      v6 = [v3 messageSubType];
      v7 = [v6 textMessage];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_13;
    case 2:
      v6 = [v3 messageSubType];
      v7 = [v6 tapback];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_13;
    case 3:
      v6 = [v3 messageSubType];
      v7 = [v6 audioMessage];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_13;
    case 4:
      v6 = [v3 messageSubType];
      v7 = [v6 unsupported];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
      goto LABEL_13;
    case 5:
      v6 = [v3 messageSubType];
      v7 = [v6 emojiTapback];
      uint64_t v8 = [v7 participantDestinationIdentifiers];
LABEL_13:
      v10 = (void *)v8;

      break;
    default:
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v12 = 134217984;
          uint64_t v13 = v5;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "<IMTextMessagePipelineParameter> Unable to extract destination identifiers from BlastDoorTextMessageMessageType: %ld", (uint8_t *)&v12, 0xCu);
        }
      }
      v10 = 0;
      break;
  }

  return v10;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v5 = NSNumber;
  v6 = [v3 messageSubType];
  v7 = [v6 tapback];
  uint64_t v8 = [v7 messageSummaryInfo];
  v9 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v8, "contentType"));

  if (v9) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D640], v9);
  }

  v10 = [v3 messageSubType];
  v11 = [v10 tapback];
  int v12 = [v11 messageSummaryInfo];
  uint64_t v13 = [v12 summary];

  if (v13) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6A8], v13);
  }

  uint64_t v14 = [v3 messageSubType];
  v15 = [v14 tapback];
  v16 = [v15 messageSummaryInfo];
  v17 = [v16 pluginBundleID];

  if (v17) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D670], v17);
  }

  v18 = [v3 messageSubType];
  v19 = [v18 tapback];
  v20 = [v19 messageSummaryInfo];
  v21 = [v20 pluginDisplayName];

  if (v21) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D678], v21);
  }

  v22 = [v3 messageSummaryInfo];
  v23 = [v22 associatedBalloonBundleID];

  if (v23) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D618], v23);
  }

  v24 = [v3 messageSummaryInfo];
  v25 = [v24 sourceApplicationID];

  if (v25) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D698], v25);
  }

  v26 = [v3 messageSummaryInfo];
  if (objc_msgSend(v26, "has_updatedDateWithServerTime"))
  {
    v27 = NSNumber;
    v28 = [v3 messageSummaryInfo];
    objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "updatedDateWithServerTime"));
    v29 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v29) {
      goto LABEL_17;
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6C0], v29);
    v26 = (void *)v29;
  }

LABEL_17:
  v30 = [v3 messageSummaryInfo];
  if (objc_msgSend(v30, "has_hasBeenRetried"))
  {
    v31 = NSNumber;
    v32 = [v3 messageSummaryInfo];
    objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "hasBeenRetried"));
    v33 = (const void *)objc_claimAutoreleasedReturnValue();

    if (!v33) {
      goto LABEL_21;
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D668], v33);
    v30 = (void *)v33;
  }

LABEL_21:
  if ([(__CFDictionary *)Mutable count]) {
    v34 = Mutable;
  }
  else {
    v34 = 0;
  }
  v35 = v34;

  return v35;
}

- (id)messageSummaryInfoDictionaryWithBlastDoorBasicMessage:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v5 = NSNumber;
  v6 = [v3 messageSubType];
  v7 = [v6 tapback];
  uint64_t v8 = [v7 messageSummaryInfo];
  v9 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v8, "contentType"));

  if (v9) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D640], v9);
  }

  v10 = [v3 messageSubType];
  v11 = [v10 tapback];
  int v12 = [v11 messageSummaryInfo];
  uint64_t v13 = [v12 summary];

  if (v13) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D6A8], v13);
  }

  if ([(__CFDictionary *)Mutable count]) {
    uint64_t v14 = Mutable;
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = v14;

  return v15;
}

+ (id)nicknameDictionaryWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 nicknameInformation];
  if (v4)
  {
  }
  else
  {
    Mutable = [v3 truncatedNicknameRecordKey];

    if (!Mutable) {
      goto LABEL_24;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v6 = [v3 nicknameInformation];
  v7 = [v6 recordKey];

  if (v7) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameCloudKitRecordKey, v7);
  }

  uint64_t v8 = [v3 nicknameInformation];
  v9 = [v8 decryptionKey];

  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameCloudKitDecryptionRecordKey, v9);
  }

  v10 = [v3 truncatedNicknameRecordKey];
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameParticipantTruncatedRIDKey, v10);
  }

  v11 = [v3 nicknameInformation];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [v3 nicknameInformation];
    uint64_t v14 = [v13 lowResWallpaperTag];

    if (v14) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameLowResWallpaperTagKey, v14);
    }

    v15 = [v3 nicknameInformation];
    v16 = [v15 wallpaperTag];

    if (v16) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameWallpaperTagKey, v16);
    }

    v17 = [v3 nicknameInformation];
    v18 = [v17 wallpaperMetadataTag];

    if (v18) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameWallpaperMetadataTagKey, v18);
    }

    v19 = [v3 nicknameInformation];
    [v19 includesWallpaperData];
    v20 = NSStringFromBOOL();

    if (v20) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryWallpaperUpdateKey, v20);
    }

    v21 = [v3 nicknameInformation];
    v22 = [v21 messageType];

    if (v22) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"MessageType", v22);
    }

    id v23 = objc_alloc(NSNumber);
    v24 = [v3 nicknameInformation];
    v25 = objc_msgSend(v23, "initWithLong:", objc_msgSend(v24, "updateInfoIncluded"));

    if (v25) {
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, MessageDictionaryNicknameUpdateInfoIncluded, v25);
    }
  }
LABEL_24:

  return Mutable;
}

+ (id)availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:(id)a3
{
  return (id)[a3 availabilityVerificationRecipientChannelIDPrefix];
}

+ (id)availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:(id)a3
{
  return (id)[a3 availabilityVerificationRecipientEncryptionValidationToken];
}

+ (id)availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 availabilityOffGridRecipientSubscriptionValidationToken];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 availabilityOffGridRecipientEncryptionValidationToken];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)seenAsOffGridWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 seenAsOffGrid];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)lastPublisherOfOffGridStatusWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 lastPublisherOfOffGridStatus];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isExpirableWithBlastDoorTextMessage:(id)a3
{
  return [a3 isExpirable];
}

+ (BOOL)isAutoReplyWithBlastDoorMessage:(id)a3
{
  return [a3 isAutoReply];
}

+ (BOOL)isSOSWithBlastDoorMessage:(id)a3
{
  return [a3 isSOS];
}

+ (BOOL)isCriticalWithBlastDoorMessage:(id)a3
{
  return [a3 isCritical];
}

+ (id)replicationSourceServiceNameWithBlastDoorMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(v3, "has_replicationSourceID"))
  {
    uint64_t v4 = [v3 replicationSourceID];
    uint64_t v5 = +[IMDServiceController sharedController];
    v6 = [v5 serviceWithReplicationSourceID:v4];

    v7 = [v6 internalName];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Resolved replication source service to %@ for ID %llu", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)replicationSourceServiceNameWithBlastDoorBasicMessage:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(v3, "has_replicationSourceID"))
  {
    uint64_t v4 = [v3 replicationSourceID];
    uint64_t v5 = +[IMDServiceController sharedController];
    v6 = [v5 serviceWithReplicationSourceID:v4];

    v7 = [v6 internalName];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Resolved replication source service to %@ for ID %llu", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)scheduleTypeWithBlastDoorTextMessage:(id)a3
{
  id v3 = a3;
  if ([v3 scheduleType] == -1)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Got message with Unspecified ScheduleType, downgrading to NotScheduled", v7, 2u);
      }
    }
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [v3 scheduleType];
  }

  return v4;
}

+ (id)scheduledDateWithBlastDoorTextMessage:(id)a3
{
  return (id)[a3 scheduledDate];
}

+ (id)richBodyWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  v6 = 0;
  switch(v5)
  {
    case 1:
      v7 = [v3 messageSubType];
      uint64_t v8 = [v7 textMessage];
      goto LABEL_6;
    case 3:
      v7 = [v3 messageSubType];
      uint64_t v8 = [v7 balloonPlugin];
      goto LABEL_6;
    case 4:
      v7 = [v3 messageSubType];
      v9 = [v7 sticker];
      goto LABEL_8;
    case 5:
      v7 = [v3 messageSubType];
      uint64_t v8 = [v7 audioMessage];
LABEL_6:
      int v10 = v8;
      v6 = [v8 content];
      goto LABEL_9;
    case 7:
      v7 = [v3 messageSubType];
      v9 = [v7 stickerTapback];
LABEL_8:
      int v10 = v9;
      v11 = [v9 messageContent];
      v6 = [v11 content];

LABEL_9:
      break;
    default:
      break;
  }

  return v6;
}

+ (id)richBodyWithBlastDoorBasicMessage:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  if (v5 == 3)
  {
    v6 = [v3 messageSubType];
    v7 = [v6 audioMessage];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = [v3 messageSubType];
    v7 = [v6 textMessage];
LABEL_5:
    uint64_t v8 = v7;
    v9 = [v7 content];

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)convertAttributionInfoToArray:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByApplyingBlock:", &unk_1F3390840);
}

+ (id)attributionInfoArrayWithBlastDoorMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 messageSubType];
  uint64_t v6 = [v5 type];

  switch(v6)
  {
    case 4:
      v11 = [v4 messageSubType];
      __int16 v12 = [v11 sticker];
      uint64_t v13 = [v12 messageContent];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        v7 = [v4 messageSubType];
        v9 = [v7 sticker];
        v15 = [v9 messageContent];
        int v10 = [v15 attributionInfo];

        goto LABEL_9;
      }
      break;
    case 3:
      v7 = [v4 messageSubType];
      uint64_t v8 = [v7 balloonPlugin];
      goto LABEL_6;
    case 1:
      v7 = [v4 messageSubType];
      uint64_t v8 = [v7 textMessage];
LABEL_6:
      v9 = v8;
      int v10 = [v8 attributionInfo];
LABEL_9:

      goto LABEL_11;
  }
  int v10 = 0;
LABEL_11:
  v16 = [a1 convertAttributionInfoToArray:v10];

  return v16;
}

+ (id)plainTextBodyWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  if (v5 == 3)
  {
    uint64_t v6 = [v3 messageSubType];
    v7 = [v6 balloonPlugin];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [v3 messageSubType];
    v7 = [v6 textMessage];
LABEL_5:
    uint64_t v8 = v7;
    v9 = [v7 plainTextBody];

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)plainTextBodyWithBlastDoorBasicMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    uint64_t v6 = [v3 messageSubType];
    v7 = [v6 textMessage];
    uint64_t v8 = [v7 plainTextBody];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)plainTextSubjectWithBlastDoorMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    uint64_t v6 = [v3 messageSubType];
    v7 = [v6 textMessage];
    uint64_t v8 = [v7 plainTextSubject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)plainTextSubjectWithBlastDoorBasicMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messageSubType];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    uint64_t v6 = [v3 messageSubType];
    v7 = [v6 textMessage];
    uint64_t v8 = [v7 plainTextSubject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)fileTransferForBlastDoorFileTransferAttribute:(id)a3 fileTransferGUIDs:(id)a4 supportingStickerAttributes:(BOOL)a5
{
  BOOL v64 = a5;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v69 = a4;
  v7 = [v6 name];
  if (!v7)
  {
    id v18 = 0;
    goto LABEL_40;
  }
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "datasize"));
  v65 = [v8 stringValue];

  v9 = [v6 attachmentSubtype];
  v68 = [v9 livePhoto];

  v67 = [v68 iris];
  if ([v67 length])
  {
    if ([v69 count])
    {
      int v10 = [v69 lastObject];
      v11 = +[IMDFileTransferCenter sharedInstance];
      __int16 v12 = [v11 transferForGUID:v10];

      if (v12)
      {
        [v12 setIsAuxImage:1];
        uint64_t v13 = [MEMORY[0x1E4F6E780] AuxGUIDFromFileTransferGUID:v10];
        char v14 = +[IMDFileTransferCenter sharedInstance];
        v15 = [v7 lastPathComponent];
        LOWORD(v63) = 0;
        objc_msgSend(v14, "makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v13, v15, 0, objc_msgSend(v65, "longLongValue"), 0, 0, v63);

        id v16 = v13;
        v17 = +[IMDFileTransferCenter sharedInstance];
        id v18 = [v17 transferForGUID:v16];

        if (v18)
        {
          [v18 setIsAuxVideo:1];
          if (IMOSLoggingEnabled())
          {
            v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v75 = v18;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Successfully created AuxVideo transfer %@", buf, 0xCu);
            }
          }
          goto LABEL_24;
        }
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v16;
            _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Was not able to create Aux video transfer for guid %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v10;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Could not find Aux image transfer with guid %@ while parsing message", buf, 0xCu);
          }
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v75 = v7;
        __int16 v76 = 2112;
        id v77 = v69;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Could not find Aux image transfer with name (%@) because the list of guids was nil or empty: %@", buf, 0x16u);
      }
    }
    char v36 = 0;
    id v18 = 0;
    goto LABEL_39;
  }
  v20 = +[IMDFileTransferCenter sharedInstance];
  v21 = [v7 lastPathComponent];
  objc_msgSend(v20, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v21, 0, objc_msgSend(v65, "longLongValue"), 0, 0, 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v22 = +[IMDFileTransferCenter sharedInstance];
    id v18 = [v22 transferForGUID:v16];
  }
  else
  {
    id v18 = 0;
  }
LABEL_24:
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  v26 = [v6 attachments];
  v27 = [v26 sortedArrayUsingComparator:&unk_1F3390860];

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1D96C9AC0;
  v70[3] = &unk_1E6B73750;
  v28 = Mutable;
  v71 = v28;
  id v29 = v7;
  id v72 = v29;
  id v30 = v6;
  id v73 = v30;
  [v27 enumerateObjectsUsingBlock:v70];
  v31 = [v30 attachmentSubtype];
  v32 = [v31 audioMessage];

  if (v32)
  {
    CFDictionarySetValue(v28, @"name", v29);
    v33 = [v30 utiType];
    if (v33) {
      CFDictionarySetValue(v28, @"uti-type", v33);
    }

    v34 = [v32 inlineAttachmentKey];
    if (v34) {
      CFDictionarySetValue(v28, @"inline-attachment", v34);
    }

    v35 = [v32 audioTranscription];
    if (v35) {
      CFDictionarySetValue(v28, @"audio-transcription", v35);
    }
  }
  [v18 setUserInfo:v28];

  char v36 = 1;
LABEL_39:

  if ((v36 & 1) == 0)
  {
    v53 = 0;
    goto LABEL_55;
  }
LABEL_40:
  v38 = [v6 attachmentSubtype];
  v39 = [v38 emojiImage];

  if (v39)
  {
    v40 = [v39 emojiImageContentIdentifer];
    v41 = [v39 emojiImageShortDescription];
    v42 = [a1 stickerInfoDictionaryFromBlastDoorEmojiImageAttachmentInfo:v39];
    [v18 setAdaptiveImageGlyphContentIdentifier:v40];
    [v18 setAdaptiveImageGlyphContentDescription:v41];
    [v18 setStickerUserInfo:v42];
  }
  if (v18 && v64)
  {
    v43 = [v6 attachmentSubtype];
    v44 = [v43 sticker];

    if (v44)
    {
      v45 = [a1 stickerInfoDictionaryFromBlastDoorStickerAttachmentInfo:v44];
      if (v45)
      {
        [v18 setStickerUserInfo:v45];
      }
      else
      {
        v54 = IMLogHandleForCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_1D98FE4BC(v54, v55, v56, v57, v58, v59, v60, v61);
        }
      }
    }
  }
  else
  {
    v44 = IMLogHandleForCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE4F4(v44, v46, v47, v48, v49, v50, v51, v52);
    }
  }

  id v18 = v18;
  v53 = v18;
LABEL_55:

  return v53;
}

+ (id)stickerInfoDictionaryWithStickerGUID:(id)a3 stickerPackGUID:(id)a4 stickerHash:(id)a5 positionIntent:(id)a6 associatedPositionIntent:(id)a7 parentPreviewWidth:(id)a8 stickerXOffset:(id)a9 stickerYOffset:(id)a10 stickerScale:(id)a11 stickerRotation:(id)a12 stickerBundleID:(id)a13 stickerIsReaction:(id)a14 stickerPositionVersion:(id)a15 stickerExternalURI:(id)a16
{
  id v21 = a3;
  id v35 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v34 = a8;
  id v40 = a9;
  v25 = v21;
  id v39 = a10;
  id v26 = a11;
  id v37 = a12;
  id v36 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v31 = v30;
  if (v25) {
    CFDictionarySetValue(v30, (const void *)*MEMORY[0x1E4F6E3A0], v25);
  }
  v38 = v26;
  if (v35) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3B8], v35);
  }
  if (v22) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3A8], v22);
  }
  if (v23) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E368], v23);
  }
  if (v24) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E358], v24);
  }
  if (v34) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E370], v34);
  }
  if (v40) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3D0], v40);
  }
  if (v39) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3D8], v39);
  }
  if (v26) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E380], v26);
  }
  if (v37) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E378], v37);
  }
  if (v36) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E388], v36);
  }
  if (v27) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3B0], v27);
  }
  if (v28) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E3C0], v28);
  }
  if (v29) {
    CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E4F6E398], v29);
  }
  v32 = (void *)[(__CFDictionary *)v31 copy];

  return v32;
}

+ (id)stickerInfoDictionaryFromBlastDoorStickerAttachmentInfo:(id)a3
{
  id v4 = a3;
  id v36 = [v4 stickerIdentifier];
  id v35 = [v4 stickerPackIdentifier];
  id v34 = [v4 stickerHash];
  if (objc_msgSend(v4, "has_positionIntent"))
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "positionIntent"));
    v32 = [v5 stringValue];
  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend(v4, "has_associatedPositionIntent"))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "associatedPositionIntent"));
    v31 = [v6 stringValue];
  }
  else
  {
    v31 = 0;
  }
  if (objc_msgSend(v4, "has_parentPreviewWidth"))
  {
    v7 = NSNumber;
    [v4 parentPreviewWidth];
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    id v30 = [v8 stringValue];
  }
  else
  {
    id v30 = 0;
  }
  if (objc_msgSend(v4, "has_stickerOffset"))
  {
    v9 = NSNumber;
    [v4 stickerOffset];
    int v10 = objc_msgSend(v9, "numberWithDouble:");
    v33 = [v10 stringValue];
  }
  else
  {
    v33 = 0;
  }
  if (objc_msgSend(v4, "has_stickerOffset"))
  {
    v11 = NSNumber;
    [v4 stickerOffset];
    uint64_t v13 = [v11 numberWithDouble:v12];
    id v29 = [v13 stringValue];
  }
  else
  {
    id v29 = 0;
  }
  if (objc_msgSend(v4, "has_stickerScale"))
  {
    char v14 = NSNumber;
    [v4 stickerScale];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    id v16 = [v15 stringValue];
  }
  else
  {
    id v16 = 0;
  }
  if (objc_msgSend(v4, "has_stickerRotation"))
  {
    v17 = NSNumber;
    [v4 stickerRotation];
    objc_msgSend(v17, "numberWithDouble:");
    v19 = id v18 = a1;
    v20 = [v19 stringValue];

    a1 = v18;
  }
  else
  {
    v20 = 0;
  }
  id v27 = [v4 balloonBundleID];
  uint64_t v21 = [v4 isReaction];
  uint64_t v22 = [v4 stickerPositionVersion];
  id v23 = [v4 stickerExternalURI];
  id v24 = [NSNumber numberWithBool:v21];
  v25 = [NSNumber numberWithUnsignedInteger:v22];
  id v28 = [a1 stickerInfoDictionaryWithStickerGUID:v36 stickerPackGUID:v35 stickerHash:v34 positionIntent:v32 associatedPositionIntent:v31 parentPreviewWidth:v30 stickerXOffset:v33 stickerYOffset:v29 stickerScale:v16 stickerRotation:v20 stickerBundleID:v27 stickerIsReaction:v24 stickerPositionVersion:v25 stickerExternalURI:v23];

  return v28;
}

+ (id)stickerInfoDictionaryFromBlastDoorEmojiImageAttachmentInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stickerIdentifier];
  id v6 = [v4 stickerPackIdentifier];
  v7 = [v4 stickerHash];
  uint64_t v8 = [v4 stickerBalloonBundleID];
  v9 = [v4 stickerExternalURI];

  int v10 = [a1 stickerInfoDictionaryWithStickerGUID:v5 stickerPackGUID:v6 stickerHash:v7 positionIntent:0 associatedPositionIntent:0 parentPreviewWidth:0 stickerXOffset:0 stickerYOffset:0 stickerScale:0 stickerRotation:0 stickerBundleID:v8 stickerIsReaction:0 stickerPositionVersion:0 stickerExternalURI:v9];

  return v10;
}

+ (id)_fileTransferMatchingAttribute:(id)a3 inFileTransfers:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a4;
  uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v30)
  {
    id v32 = 0;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v5;
        id v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        v7 = [v34 attachments];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v33 = v7;
        uint64_t v8 = [v33 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v36 != v10) {
                objc_enumerationMutation(v33);
              }
              double v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              uint64_t v13 = [v12 attachmentURL];
              char v14 = [v13 absoluteString];

              v15 = [v12 encryptionKey];
              if ([v14 length])
              {
                id v16 = [v6 userInfo];
                v17 = [v16 objectForKeyedSubscript:@"mmcs-url"];

                id v18 = [v6 userInfo];
                v19 = [v18 objectForKeyedSubscript:@"decryption-key"];

                if ([v17 isEqualToString:v14]
                  && ([v19 isEqualToString:v15] & 1) != 0)
                {
                  id v26 = v6;

                  id v32 = v26;
                  goto LABEL_25;
                }
              }
              v20 = [v34 attachmentSubtype];
              uint64_t v21 = [v20 emojiImage];
              uint64_t v22 = [v21 emojiImageContentIdentifer];

              id v23 = [v6 adaptiveImageGlyphContentIdentifier];
              if ([v22 length]
                && [v23 length]
                && [v22 isEqualToString:v23])
              {
                id v24 = v6;

                int v25 = 0;
                id v32 = v24;
              }
              else
              {
                int v25 = 1;
              }

              if (!v25) {
                goto LABEL_25;
              }
            }
            uint64_t v9 = [v33 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_25:

        uint64_t v5 = v31 + 1;
      }
      while (v31 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v30);
  }
  else
  {
    id v32 = 0;
  }

  return v32;
}

+ (id)convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:(id)a3 supportingStickerAttributes:(BOOL)a4 existingFileTransfersForMessage:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    uint64_t v9 = (void *)[a3 mutableCopy];
    uint64_t v10 = [v9 length];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = sub_1D96CA9B8;
    id v24 = &unk_1E6B73778;
    id v29 = a1;
    id v25 = v8;
    id v26 = v11;
    BOOL v30 = a4;
    id v27 = v12;
    id v28 = v9;
    id v13 = v9;
    id v14 = v12;
    id v15 = v11;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, &v21);
    id v16 = [IMTextMessageAttributedStringContent alloc];
    v17 = objc_msgSend(v13, "copy", v21, v22, v23, v24);
    id v18 = (void *)[v14 copy];
    v19 = [(IMTextMessageAttributedStringContent *)v16 initWithMessageBodyWithNativeAttributes:v17 fileTransferGuids:v18];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)supportsStickerAttributesInMessageBody
{
  return 0;
}

- (id)_createSuperFormattedStringWithAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "__im_attributedStringByAssigningMessagePartNumbers");
  uint64_t v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

- (IMTextMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v82.receiver = self;
  v82.super_class = (Class)IMTextMessagePipelineParameter;
  id v8 = [(IMTextMessagePipelineParameter *)&v82 init];
  if (!v8) {
    goto LABEL_32;
  }
  uint64_t v9 = [v7 fromIdentifier];
  [(IMTextMessagePipelineParameter *)v8 setFromIdentifier:v9];

  uint64_t v10 = [v7 toIdentifier];
  [(IMTextMessagePipelineParameter *)v8 setToIdentifier:v10];

  -[IMTextMessagePipelineParameter setIsFromMe:](v8, "setIsFromMe:", [v7 isFromMe]);
  id v11 = [v6 metadata];
  id v12 = [v11 messageGUID];
  v79 = [v12 UUIDString];

  id v13 = v11;
  uint64_t v72 = [v11 timestamp];
  uint64_t v14 = +[IMTextMessagePipelineParameter richBodyWithBlastDoorMessage:v6];
  uint64_t v15 = [(IMTextMessagePipelineParameter *)v8 supportsStickerAttributesInMessageBody];
  uint64_t v78 = (void *)v14;
  id v16 = +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:v14 supportingStickerAttributes:v15 existingFileTransfersForMessage:MEMORY[0x1E4F1CBF0]];
  uint64_t v17 = [v16 messageBodyWithNativeAttributes];
  id v77 = v16;
  uint64_t v18 = [v16 fileTransferGuids];
  v19 = +[IMTextMessagePipelineParameter plainTextBodyWithBlastDoorMessage:v6];
  if (!v17)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v19) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = @" ";
    }
    uint64_t v22 = (void *)[v20 initWithString:v21];
    uint64_t v17 = [(IMTextMessagePipelineParameter *)v8 _createSuperFormattedStringWithAttributedString:v22];
  }
  uint64_t v23 = +[IMTextMessagePipelineParameter plainTextSubjectWithBlastDoorMessage:v6];
  id v24 = +[IMTextMessagePipelineParameter attributionInfoArrayWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setAttributionInfoArray:v24];

  v74 = (void *)v17;
  [(IMTextMessagePipelineParameter *)v8 setRichBody:v17];
  [(IMTextMessagePipelineParameter *)v8 setPlainTextBody:v19];
  id v73 = (void *)v23;
  [(IMTextMessagePipelineParameter *)v8 setPlainTextSubject:v23];
  __int16 v76 = (void *)v18;
  [(IMTextMessagePipelineParameter *)v8 setFileTransferGUIDs:v18];
  id v25 = [v6 messageSubType];
  id v26 = [v25 audioMessage];
  id v27 = [v26 inlineAudioMessages];

  id v28 = v13;
  if ([v27 count] == 1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    BOOL v30 = [v27 firstObject];
    if (v30) {
      CFDictionarySetValue(Mutable, @"ia-0", v30);
    }

    [(IMTextMessagePipelineParameter *)v8 setInlineAttachmentsDictionary:Mutable];
  }
  [(IMTextMessagePipelineParameter *)v8 setGUID:v79];
  uint64_t v31 = [NSNumber numberWithUnsignedLongLong:v72];
  [(IMTextMessagePipelineParameter *)v8 setTimestamp:v31];

  id v32 = [v13 storageContext];
  -[IMTextMessagePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v32 isFromStorage]);

  id v33 = [v13 storageContext];
  -[IMTextMessagePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v33 isLastFromStorage]);

  -[IMTextMessagePipelineParameter setWantsDeliveryReceipt:](v8, "setWantsDeliveryReceipt:", [v13 wantsDeliveryReceipt]);
  -[IMTextMessagePipelineParameter setWantsCheckpointing:](v8, "setWantsCheckpointing:", [v13 wantsCheckpointing]);
  id v34 = +[IMTextMessagePipelineParameter participantDestinationIdentifierWithMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setParticipantIdentifiers:v34];

  long long v35 = [(IMTextMessagePipelineParameter *)v8 messageSummaryInfoDictionaryWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setMessageSummaryInfo:v35];

  long long v36 = +[IMTextMessagePipelineParameter nicknameDictionaryWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setNicknameDictionary:v36];

  [(IMTextMessagePipelineParameter *)v8 setAutoReply:+[IMTextMessagePipelineParameter isAutoReplyWithBlastDoorMessage:v6]];
  long long v37 = +[IMTextMessagePipelineParameter availabilityVerificationRecipientChannelIDPrefixWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setAvailabilityVerificationRecipientChannelIDPrefix:v37];

  long long v38 = +[IMTextMessagePipelineParameter availabilityVerificationRecipientEncryptionValidationTokenWithBlastDoorTextMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setAvailabilityVerificationRecipientEncryptionValidationToken:v38];

  long long v39 = +[IMTextMessagePipelineParameter availabilityOffGridRecipientSubscriptionValidationTokenWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setAvailabilityOffGridRecipientSubscriptionValidationToken:v39];

  long long v40 = +[IMTextMessagePipelineParameter availabilityOffGridRecipientEncryptionValidationTokenWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setAvailabilityOffGridRecipientEncryptionValidationToken:v40];

  [(IMTextMessagePipelineParameter *)v8 setSeenAsOffGrid:+[IMTextMessagePipelineParameter seenAsOffGridWithBlastDoorMessage:v6]];
  long long v41 = +[IMTextMessagePipelineParameter lastPublisherOfOffGridStatusWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setLastPublisherOfOffGridStatus:v41];

  [(IMTextMessagePipelineParameter *)v8 setExpirable:+[IMTextMessagePipelineParameter isExpirableWithBlastDoorTextMessage:v6]];
  [(IMTextMessagePipelineParameter *)v8 setSos:+[IMTextMessagePipelineParameter isSOSWithBlastDoorMessage:v6]];
  [(IMTextMessagePipelineParameter *)v8 setCritical:+[IMTextMessagePipelineParameter isCriticalWithBlastDoorMessage:v6]];
  long long v42 = +[IMTextMessagePipelineParameter replicationSourceServiceNameWithBlastDoorMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setReplicationSourceServiceName:v42];

  [(IMTextMessagePipelineParameter *)v8 setScheduleType:+[IMTextMessagePipelineParameter scheduleTypeWithBlastDoorTextMessage:v6]];
  v43 = +[IMTextMessagePipelineParameter scheduledDateWithBlastDoorTextMessage:v6];
  [(IMTextMessagePipelineParameter *)v8 setScheduledDate:v43];

  v44 = [v6 threadIdentifierGUID];
  [(IMTextMessagePipelineParameter *)v8 setThreadIdentifierGUID:v44];

  uint64_t v45 = [v6 threadOriginatorFallbackHash];
  [(IMTextMessagePipelineParameter *)v8 setThreadOriginatorFallbackHash:v45];

  uint64_t v46 = [v6 expressiveSendStyleIdentifier];
  [(IMTextMessagePipelineParameter *)v8 setExpressiveSendStyleIdentifier:v46];

  if (objc_msgSend(v6, "has_groupParticipantVersion"))
  {
    uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "groupParticipantVersion"));
    [(IMTextMessagePipelineParameter *)v8 setGroupParticipantVersion:v47];
  }
  else
  {
    [(IMTextMessagePipelineParameter *)v8 setGroupParticipantVersion:0];
  }
  if (objc_msgSend(v6, "has_groupProtocolVersion"))
  {
    uint64_t v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "groupProtocolVersion"));
    [(IMTextMessagePipelineParameter *)v8 setGroupProtocolVersion:v48];
  }
  else
  {
    [(IMTextMessagePipelineParameter *)v8 setGroupProtocolVersion:0];
  }
  id v75 = v7;
  uint64_t v49 = v27;
  if (objc_msgSend(v6, "has_groupPhotoCreationTime"))
  {
    uint64_t v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "groupPhotoCreationTime"));
    [(IMTextMessagePipelineParameter *)v8 setGroupPhotoCreationTime:v50];
  }
  else
  {
    [(IMTextMessagePipelineParameter *)v8 setGroupPhotoCreationTime:0];
  }
  uint64_t v51 = [v6 replicatedFallbackGUIDs];
  [(IMTextMessagePipelineParameter *)v8 setReplicatedFallbackGUIDs:v51];

  uint64_t v52 = [(IMTextMessagePipelineParameter *)v8 participantIdentifiers];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = sub_1D96CC200;
  v80[3] = &unk_1E6B72B30;
  v53 = v8;
  v81 = v53;
  v54 = objc_msgSend(v52, "__imArrayByFilteringWithBlock:", v80);
  uint64_t v55 = [v54 _IDsFromURIs];

  uint64_t v56 = [(IMTextMessagePipelineParameter *)v53 fromIdentifier];
  uint64_t v57 = [v56 _stripFZIDPrefix];

  uint64_t v58 = [(IMTextMessagePipelineParameter *)v53 participantIdentifiers];
  unint64_t v59 = [v58 count];

  if (v59 <= 2)
  {
    if (!-[IMTextMessagePipelineParameter isFromMe](v53, "isFromMe") || ![v55 count]) {
      goto LABEL_26;
    }
    uint64_t v61 = [v55 lastObject];
    uint64_t v62 = [v61 _stripFZIDPrefix];

    uint64_t v57 = (void *)v62;
  }
  else
  {
    uint64_t v60 = [v6 groupID];
    [(IMTextMessagePipelineParameter *)v53 setGroupID:v60];

    uint64_t v61 = [v6 currentGroupName];
    [(IMTextMessagePipelineParameter *)v53 setCurrentGroupName:v61];
  }

LABEL_26:
  if ([v57 length])
  {
    [(IMTextMessagePipelineParameter *)v53 setFromDisplayID:v57];
  }
  else
  {
    uint64_t v63 = IMLogHandleForCategory();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE52C(v63, v64, v65, v66, v67, v68, v69, v70);
    }
  }
  id v7 = v75;
LABEL_32:

  return v8;
}

- (IMTextMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v61.receiver = self;
  v61.super_class = (Class)IMTextMessagePipelineParameter;
  id v8 = [(IMTextMessagePipelineParameter *)&v61 init];
  if (v8)
  {
    uint64_t v9 = [v7 fromIdentifier];
    [(IMTextMessagePipelineParameter *)v8 setFromIdentifier:v9];

    uint64_t v10 = [v7 toIdentifier];
    [(IMTextMessagePipelineParameter *)v8 setToIdentifier:v10];

    -[IMTextMessagePipelineParameter setIsFromMe:](v8, "setIsFromMe:", [v7 isFromMe]);
    id v11 = [v6 metadata];
    id v12 = [v11 messageGUID];
    uint64_t v58 = [v12 UUIDString];

    uint64_t v13 = [v11 timestamp];
    v53 = +[IMTextMessagePipelineParameter richBodyWithBlastDoorBasicMessage:v6];
    uint64_t v14 = +[IMTextMessagePipelineParameter convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:](IMTextMessagePipelineParameter, "convertBlastDoorInstanceTypedAttributesToNativeTypesInAttributedString:supportingStickerAttributes:existingFileTransfersForMessage:");
    uint64_t v15 = [v14 messageBodyWithNativeAttributes];
    uint64_t v52 = v14;
    id v16 = v14;
    uint64_t v17 = (void *)v15;
    uint64_t v18 = [v16 fileTransferGuids];
    uint64_t v19 = +[IMTextMessagePipelineParameter plainTextBodyWithBlastDoorBasicMessage:v6];
    if (!v17)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      if (v19) {
        uint64_t v21 = (__CFString *)v19;
      }
      else {
        uint64_t v21 = @" ";
      }
      uint64_t v22 = (void *)[v20 initWithString:v21];
      uint64_t v23 = [(IMTextMessagePipelineParameter *)v8 _createSuperFormattedStringWithAttributedString:v22];

      uint64_t v17 = (void *)v23;
    }
    uint64_t v24 = +[IMTextMessagePipelineParameter plainTextSubjectWithBlastDoorBasicMessage:v6];
    uint64_t v56 = v17;
    [(IMTextMessagePipelineParameter *)v8 setRichBody:v17];
    uint64_t v57 = (void *)v19;
    [(IMTextMessagePipelineParameter *)v8 setPlainTextBody:v19];
    [(IMTextMessagePipelineParameter *)v8 setPlainTextSubject:v24];
    uint64_t v55 = (void *)v18;
    [(IMTextMessagePipelineParameter *)v8 setFileTransferGUIDs:v18];
    id v25 = [v6 threadIdentifierGUID];
    [(IMTextMessagePipelineParameter *)v8 setThreadIdentifierGUID:v25];

    id v26 = [v6 threadOriginatorFallbackHash];
    [(IMTextMessagePipelineParameter *)v8 setThreadOriginatorFallbackHash:v26];

    id v27 = [v6 messageSubType];
    id v28 = [v27 audioMessage];
    id v29 = [v28 inlineAudioMessages];

    if ([v29 count] == 1)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v31 = [v29 firstObject];
      if (v31) {
        CFDictionarySetValue(Mutable, @"ia-0", v31);
      }

      [(IMTextMessagePipelineParameter *)v8 setInlineAttachmentsDictionary:Mutable];
    }
    [(IMTextMessagePipelineParameter *)v8 setGUID:v58];
    id v32 = [NSNumber numberWithUnsignedLongLong:v13];
    [(IMTextMessagePipelineParameter *)v8 setTimestamp:v32];

    id v33 = [v11 storageContext];
    -[IMTextMessagePipelineParameter setIsFromStorage:](v8, "setIsFromStorage:", [v33 isFromStorage]);

    id v34 = [v11 storageContext];
    -[IMTextMessagePipelineParameter setIsLastFromStorage:](v8, "setIsLastFromStorage:", [v34 isLastFromStorage]);

    -[IMTextMessagePipelineParameter setWantsDeliveryReceipt:](v8, "setWantsDeliveryReceipt:", [v11 wantsDeliveryReceipt]);
    -[IMTextMessagePipelineParameter setWantsCheckpointing:](v8, "setWantsCheckpointing:", [v11 wantsCheckpointing]);
    long long v35 = +[IMTextMessagePipelineParameter participantDestinationIdentifierWithBasicMessage:v6];
    [(IMTextMessagePipelineParameter *)v8 setParticipantIdentifiers:v35];

    long long v36 = [(IMTextMessagePipelineParameter *)v8 messageSummaryInfoDictionaryWithBlastDoorBasicMessage:v6];
    [(IMTextMessagePipelineParameter *)v8 setMessageSummaryInfo:v36];

    long long v37 = +[IMTextMessagePipelineParameter replicationSourceServiceNameWithBlastDoorBasicMessage:v6];
    [(IMTextMessagePipelineParameter *)v8 setReplicationSourceServiceName:v37];

    if (objc_msgSend(v6, "has_groupParticipantVersion"))
    {
      long long v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "groupParticipantVersion"));
      [(IMTextMessagePipelineParameter *)v8 setGroupParticipantVersion:v38];
    }
    else
    {
      [(IMTextMessagePipelineParameter *)v8 setGroupParticipantVersion:0];
    }
    v54 = (void *)v24;
    if (objc_msgSend(v6, "has_groupProtocolVersion"))
    {
      long long v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "groupProtocolVersion"));
      [(IMTextMessagePipelineParameter *)v8 setGroupProtocolVersion:v39];
    }
    else
    {
      [(IMTextMessagePipelineParameter *)v8 setGroupProtocolVersion:0];
    }
    long long v40 = [(IMTextMessagePipelineParameter *)v8 participantIdentifiers];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = sub_1D96CC8A4;
    v59[3] = &unk_1E6B72B30;
    long long v41 = v8;
    uint64_t v60 = v41;
    long long v42 = objc_msgSend(v40, "__imArrayByFilteringWithBlock:", v59);
    v43 = [v42 _IDsFromURIs];

    v44 = [(IMTextMessagePipelineParameter *)v41 fromIdentifier];
    uint64_t v45 = [v44 _stripFZIDPrefix];

    uint64_t v46 = [(IMTextMessagePipelineParameter *)v41 participantIdentifiers];
    unint64_t v47 = [v46 count];

    if (v47 <= 2)
    {
      if (!-[IMTextMessagePipelineParameter isFromMe](v41, "isFromMe") || ![v43 count]) {
        goto LABEL_23;
      }
      uint64_t v49 = [v43 lastObject];
      uint64_t v50 = [v49 _stripFZIDPrefix];

      uint64_t v45 = (void *)v50;
    }
    else
    {
      uint64_t v48 = [v6 groupID];
      [(IMTextMessagePipelineParameter *)v41 setGroupID:v48];

      uint64_t v49 = [v6 currentGroupName];
      [(IMTextMessagePipelineParameter *)v41 setCurrentGroupName:v49];
    }

LABEL_23:
    [(IMTextMessagePipelineParameter *)v41 setFromDisplayID:v45];
  }
  return v8;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(IMTextMessagePipelineParameter *)self GUID];
  uint64_t v5 = [(IMTextMessagePipelineParameter *)self timestamp];
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  uint64_t v9 = [(IMTextMessagePipelineParameter *)self messageItems];
  uint64_t v10 = [v9 count];
  BOOL v11 = [(IMTextMessagePipelineParameter *)self hadChat];
  id v12 = @"NO";
  if (v11) {
    id v12 = @"YES";
  }
  uint64_t v13 = [v3 stringWithFormat:@"<IMMessagePipelineParameter %p> { guid: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu, hadChat: %@}", self, v4, v5, v6, v7, v8, v10, v12];

  return v13;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)wantsDeliveryReceipt
{
  return self->_wantsDeliveryReceipt;
}

- (void)setWantsDeliveryReceipt:(BOOL)a3
{
  self->_wantsDeliveryReceipt = a3;
}

- (BOOL)wantsCheckpointing
{
  return self->_wantsCheckpointing;
}

- (void)setWantsCheckpointing:(BOOL)a3
{
  self->_wantsCheckpointing = a3;
}

- (BOOL)isFromStorage
{
  return self->_isFromStorage;
}

- (void)setIsFromStorage:(BOOL)a3
{
  self->_isFromStorage = a3;
}

- (BOOL)isLastFromStorage
{
  return self->_isLastFromStorage;
}

- (void)setIsLastFromStorage:(BOOL)a3
{
  self->_isLastFromStorage = a3;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (void)setFromIdentifier:(id)a3
{
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void)setToIdentifier:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (NSString)plainTextBody
{
  return self->_plainTextBody;
}

- (void)setPlainTextBody:(id)a3
{
}

- (NSString)plainTextSubject
{
  return self->_plainTextSubject;
}

- (void)setPlainTextSubject:(id)a3
{
}

- (NSAttributedString)richBody
{
  return self->_richBody;
}

- (void)setRichBody:(id)a3
{
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
}

- (NSArray)participantIdentifiers
{
  return self->_participantIdentifiers;
}

- (void)setParticipantIdentifiers:(id)a3
{
}

- (NSString)fromDisplayID
{
  return self->_fromDisplayID;
}

- (void)setFromDisplayID:(id)a3
{
}

- (NSString)replyToGUID
{
  return self->_replyToGUID;
}

- (void)setReplyToGUID:(id)a3
{
}

- (NSString)threadIdentifierGUID
{
  return self->_threadIdentifierGUID;
}

- (void)setThreadIdentifierGUID:(id)a3
{
}

- (NSString)threadOriginatorFallbackHash
{
  return self->_threadOriginatorFallbackHash;
}

- (void)setThreadOriginatorFallbackHash:(id)a3
{
}

- (NSString)expressiveSendStyleIdentifier
{
  return self->_expressiveSendStyleIdentifier;
}

- (void)setExpressiveSendStyleIdentifier:(id)a3
{
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
}

- (NSDictionary)inlineAttachmentsDictionary
{
  return self->_inlineAttachmentsDictionary;
}

- (void)setInlineAttachmentsDictionary:(id)a3
{
}

- (NSArray)attributionInfoArray
{
  return self->_attributionInfoArray;
}

- (void)setAttributionInfoArray:(id)a3
{
}

- (NSDictionary)nicknameDictionary
{
  return self->_nicknameDictionary;
}

- (void)setNicknameDictionary:(id)a3
{
}

- (BOOL)isFromTrustedSnapSender
{
  return self->_fromTrustedSnapSender;
}

- (void)setFromTrustedSnapSender:(BOOL *)a3
{
  self->_fromTrustedSnapSender = a3;
}

- (NSString)availabilityVerificationRecipientChannelIDPrefix
{
  return self->_availabilityVerificationRecipientChannelIDPrefix;
}

- (void)setAvailabilityVerificationRecipientChannelIDPrefix:(id)a3
{
}

- (NSString)availabilityVerificationRecipientEncryptionValidationToken
{
  return self->_availabilityVerificationRecipientEncryptionValidationToken;
}

- (void)setAvailabilityVerificationRecipientEncryptionValidationToken:(id)a3
{
}

- (NSString)availabilityOffGridRecipientSubscriptionValidationToken
{
  return self->_availabilityOffGridRecipientSubscriptionValidationToken;
}

- (void)setAvailabilityOffGridRecipientSubscriptionValidationToken:(id)a3
{
}

- (NSString)availabilityOffGridRecipientEncryptionValidationToken
{
  return self->_availabilityOffGridRecipientEncryptionValidationToken;
}

- (void)setAvailabilityOffGridRecipientEncryptionValidationToken:(id)a3
{
}

- (BOOL)seenAsOffGrid
{
  return self->_seenAsOffGrid;
}

- (void)setSeenAsOffGrid:(BOOL)a3
{
  self->_seenAsOffGrid = a3;
}

- (NSString)lastPublisherOfOffGridStatus
{
  return self->_lastPublisherOfOffGridStatus;
}

- (void)setLastPublisherOfOffGridStatus:(id)a3
{
}

- (NSSet)senderRegistrationProperties
{
  return self->_senderRegistrationProperties;
}

- (void)setSenderRegistrationProperties:(id)a3
{
}

- (BOOL)isExpirable
{
  return self->_expirable;
}

- (void)setExpirable:(BOOL)a3
{
  self->_expirable = a3;
}

- (BOOL)isAutoReply
{
  return self->_autoReply;
}

- (void)setAutoReply:(BOOL)a3
{
  self->_autoReply = a3;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSos:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (void)setScheduleState:(unint64_t)a3
{
  self->_scheduleState = a3;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (void)setScheduledDate:(id)a3
{
}

- (NSString)replicationSourceServiceName
{
  return self->_replicationSourceServiceName;
}

- (void)setReplicationSourceServiceName:(id)a3
{
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (IMDServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)currentGroupName
{
  return self->_currentGroupName;
}

- (void)setCurrentGroupName:(id)a3
{
}

- (NSNumber)groupParticipantVersion
{
  return self->_groupParticipantVersion;
}

- (void)setGroupParticipantVersion:(id)a3
{
}

- (NSNumber)groupProtocolVersion
{
  return self->_groupProtocolVersion;
}

- (void)setGroupProtocolVersion:(id)a3
{
}

- (NSNumber)groupPhotoCreationTime
{
  return self->_groupPhotoCreationTime;
}

- (void)setGroupPhotoCreationTime:(id)a3
{
}

- (NSArray)replicatedFallbackGUIDs
{
  return self->_replicatedFallbackGUIDs;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
}

- (BOOL)wasDetonated
{
  return self->_wasDetonated;
}

- (void)setWasDetonated:(BOOL)a3
{
  self->_wasDetonated = a3;
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)setAssociatedMessageGUID:(id)a3
{
}

- (NSArray)messageItems
{
  return self->_messageItems;
}

- (void)setMessageItems:(id)a3
{
}

- (IMDChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
}

- (BOOL)hadChat
{
  return self->_hadChat;
}

- (void)setHadChat:(BOOL)a3
{
  self->_hadChat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_messageItems, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_replicatedFallbackGUIDs, 0);
  objc_storeStrong((id *)&self->_groupPhotoCreationTime, 0);
  objc_storeStrong((id *)&self->_groupProtocolVersion, 0);
  objc_storeStrong((id *)&self->_groupParticipantVersion, 0);
  objc_storeStrong((id *)&self->_currentGroupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_replicationSourceServiceName, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_senderRegistrationProperties, 0);
  objc_storeStrong((id *)&self->_lastPublisherOfOffGridStatus, 0);
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientEncryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityOffGridRecipientSubscriptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientEncryptionValidationToken, 0);
  objc_storeStrong((id *)&self->_availabilityVerificationRecipientChannelIDPrefix, 0);
  objc_storeStrong((id *)&self->_nicknameDictionary, 0);
  objc_storeStrong((id *)&self->_attributionInfoArray, 0);
  objc_storeStrong((id *)&self->_inlineAttachmentsDictionary, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleIdentifier, 0);
  objc_storeStrong((id *)&self->_threadOriginatorFallbackHash, 0);
  objc_storeStrong((id *)&self->_threadIdentifierGUID, 0);
  objc_storeStrong((id *)&self->_replyToGUID, 0);
  objc_storeStrong((id *)&self->_fromDisplayID, 0);
  objc_storeStrong((id *)&self->_participantIdentifiers, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_richBody, 0);
  objc_storeStrong((id *)&self->_plainTextSubject, 0);
  objc_storeStrong((id *)&self->_plainTextBody, 0);
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_GUID, 0);
}

@end