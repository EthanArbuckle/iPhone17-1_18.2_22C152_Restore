@interface IMMessageItem
+ (BOOL)messageContainsSurfDD:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_messageItemWithIndexesDeleted:(id)a3 subRangesToDeleteMapping:(id)a4 deleteSubject:(BOOL)a5 deleteTransferCallback:(id)a6 createItemCallback:(id)a7 fromMessageItem:(id)a8;
+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 editedPartIndex:(int64_t)a4 newPartText:(id)a5;
+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5;
+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndexes:(id)a4 shouldRetractSubject:(BOOL)a5;
+ (id)newMessageItemFrom:(id)a3 withText:(id)a4 deleteSubject:(BOOL)a5 withFileTransferGUIDs:(id)a6;
+ (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3 inBody:(id)a4;
- (BOOL)NicknameRequested;
- (BOOL)_updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:(id)a3;
- (BOOL)_updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3;
- (BOOL)_updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3;
- (BOOL)backwardsCompatibleVersion;
- (BOOL)blockingRichLinks;
- (BOOL)canRetryFailedRetraction;
- (BOOL)containsRichLink;
- (BOOL)didNotifyRecipient;
- (BOOL)hasDataDetectorResults;
- (BOOL)hasEditedParts;
- (BOOL)hasLegacyUrgentTriggerMatchInText;
- (BOOL)hasUnseenMention;
- (BOOL)isAlert;
- (BOOL)isAudioMessage;
- (BOOL)isAutoReply;
- (BOOL)isAvailabilityReplySupported;
- (BOOL)isBeingRetried;
- (BOOL)isCMM;
- (BOOL)isCorrupt;
- (BOOL)isCritical;
- (BOOL)isDelivered;
- (BOOL)isDeviceActionMessage;
- (BOOL)isEmote;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpirable;
- (BOOL)isFileAttachment;
- (BOOL)isFindMyPlugin;
- (BOOL)isFinished;
- (BOOL)isFirstMessageCandidate;
- (BOOL)isFromExternalSource;
- (BOOL)isFromMe;
- (BOOL)isFullyRetracted;
- (BOOL)isInitialTranscriptSharingItem;
- (BOOL)isKeyTransparencyVerifiedMessage;
- (BOOL)isLastMessageCandidate;
- (BOOL)isLocatingMessage;
- (BOOL)isPendingSatelliteSend;
- (BOOL)isPlayed;
- (BOOL)isPrepared;
- (BOOL)isRead;
- (BOOL)isReply;
- (BOOL)isSOS;
- (BOOL)isSatelliteMessageRetry;
- (BOOL)isSent;
- (BOOL)isSpam;
- (BOOL)isStewie;
- (BOOL)isSuggestedActionResponse;
- (BOOL)isSystemMessage;
- (BOOL)isTapToRetry;
- (BOOL)isTypingMessage;
- (BOOL)isUnfinished;
- (BOOL)isUpdatingDataSourcePayload;
- (BOOL)needsRelay;
- (BOOL)needsRepeatForRelayReplication;
- (BOOL)sentOrReceivedOffGrid;
- (BOOL)sentViaRemoteIntent;
- (BOOL)shouldNotifyOnSend;
- (BOOL)shouldSendMeCard;
- (BOOL)shouldSendPartIndexesInMessageBody;
- (BOOL)unsentIsFromMeItem;
- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3;
- (BOOL)useStandalone;
- (BOOL)wasDataDetected;
- (BOOL)wasDeliveredQuietly;
- (BOOL)wasDetectedAsSWYSpam;
- (BOOL)wasDetonated;
- (BOOL)wasDowngraded;
- (BOOL)wasInterworked;
- (IMMessageItem)initWithCoder:(id)a3;
- (IMMessageItem)initWithDictionary:(id)a3;
- (IMMessageItem)initWithDictionary:(id)a3 hint:(id)a4;
- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 threadIdentifier:(id)a11;
- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 type:(int64_t)a11 threadIdentifier:(id)a12;
- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6;
- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13;
- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 threadIdentifier:(id)a32 syndicationRanges:(id)a33 syncedSyndicationRanges:(id)a34 partCount:(unint64_t)a35 dateEdited:(id)a36 scheduleType:(unint64_t)a37 scheduleState:(unint64_t)a38;
- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 type:(int64_t)a32 threadIdentifier:(id)a33 syndicationRanges:(id)a34 syncedSyndicationRanges:(id)a35 partCount:(unint64_t)a36 dateEdited:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39;
- (IMMessageItem)threadOriginator;
- (NSArray)editUnsupportedByHandleIDs;
- (NSArray)messageParts;
- (NSArray)replicatedFallbackGUIDs;
- (NSArray)richLinkURLs;
- (NSArray)scheduledMessageOriginalTransferGUIDs;
- (NSArray)syncedSyndicationRanges;
- (NSArray)syndicationRanges;
- (NSAttributedString)body;
- (NSAttributedString)breadcrumbText;
- (NSAttributedString)translatedText;
- (NSData)bodyData;
- (NSData)contactsAvatarRecipeData;
- (NSData)payloadData;
- (NSData)typingIndicatorIcon;
- (NSDate)dateEdited;
- (NSDate)scheduledMessageLastModifiedTime;
- (NSDate)timeDelivered;
- (NSDate)timeExpressiveSendPlayed;
- (NSDate)timePlayed;
- (NSDate)timeRead;
- (NSDictionary)bizIntent;
- (NSDictionary)messageSummaryInfo;
- (NSDictionary)messageSummaryInfoForSending;
- (NSDictionary)originalTextRangesByPartIndex;
- (NSDictionary)replyCountsByPart;
- (NSIndexSet)editedPartIndexes;
- (NSIndexSet)failedEditPartIndexes;
- (NSIndexSet)failedRetractPartIndexes;
- (NSIndexSet)retractedPartIndexes;
- (NSString)biaReferenceID;
- (NSString)detectedLanguage;
- (NSString)expectedServiceForCrossServiceReplacement;
- (NSString)expressiveSendStyleID;
- (NSString)fallbackHash;
- (NSString)locale;
- (NSString)notificationIDSTokenURI;
- (NSString)originalServiceName;
- (NSString)originalUnformattedID;
- (NSString)plainBody;
- (NSString)retryToParticipant;
- (NSString)subject;
- (NSString)suggestedAuthorAvatarPath;
- (NSString)suggestedAuthorName;
- (NSString)swyAppName;
- (NSString)swyBundleID;
- (NSString)threadIdentifier;
- (NSUUID)stewieConversationUUID;
- (TUConversationActivity)groupActivity;
- (double)_messageEditHistoryLimit;
- (double)_messageEditTimeout;
- (double)_messageRetractionTimeout;
- (double)_timeoutIntervalForEditType:(unint64_t)a3;
- (id)_localizedBackwardsCompatibleExpressiveSendText;
- (id)_partRangeByIndexFromPlistSerializable:(id)a3;
- (id)_partRangeByIndexToPlistSerializable:(id)a3;
- (id)attachmentGUIDAtIndex:(unint64_t)a3;
- (id)copyAsReplied;
- (id)copyDictionaryRepresentation;
- (id)copyForBackwardsCompatibility;
- (id)copyWithFlags:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criticalMessagingAppName;
- (id)description;
- (id)fileTransferGUIDs;
- (id)findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3;
- (id)historyForMessagePart:(int64_t)a3;
- (id)messagePartMatchingPartIndex:(int64_t)a3;
- (id)sender;
- (int64_t)expireState;
- (int64_t)replaceID;
- (int64_t)selectedRichCardIndex;
- (int64_t)stewieConversationID;
- (int64_t)stewieSequenceNumber;
- (int64_t)transcriptSharingMessageType;
- (unint64_t)editEligibility;
- (unint64_t)eligibilityForEditType:(unint64_t)a3 messagePartIndex:(int64_t)a4;
- (unint64_t)expectedOffGridCapableDeliveries;
- (unint64_t)flags;
- (unint64_t)getCMMAssetOffset;
- (unint64_t)getCMMState;
- (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3;
- (unint64_t)partCount;
- (unint64_t)powerLogMessageType;
- (unint64_t)replyCountForPartIndex:(int64_t)a3;
- (unint64_t)scheduleState;
- (unint64_t)scheduleType;
- (unsigned)errorCode;
- (void)_clearBodyData;
- (void)_generateBodyDataIfNeeded;
- (void)_generateBodyTextIfNeeded;
- (void)_recalculatePartCount;
- (void)_regenerateBodyData;
- (void)_regenerateBodyText;
- (void)_updateFlags:(unint64_t)a3;
- (void)addEditedPartIndex:(int64_t)a3;
- (void)addFailedEditPartIndex:(int64_t)a3;
- (void)addFailedRetractPartIndex:(int64_t)a3;
- (void)addRetractedPartIndex:(int64_t)a3;
- (void)adjustIsEmptyFlag;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttachmentGUIDsWithBlock:(id)a3;
- (void)eraseMessageContent;
- (void)setBackwardsCompatibleVersion:(BOOL)a3;
- (void)setBiaReferenceID:(id)a3;
- (void)setBizIntent:(id)a3;
- (void)setBlockingRichLinks:(BOOL)a3;
- (void)setBody:(id)a3;
- (void)setBodyData:(id)a3;
- (void)setCMMAssetOffset:(unint64_t)a3;
- (void)setCMMState:(unint64_t)a3;
- (void)setCMMStateToRegisteredAndAssetOffsetTo:(unint64_t)a3;
- (void)setContactsAvatarRecipeData:(id)a3;
- (void)setCriticalMessagingAppName:(id)a3;
- (void)setDateEdited:(id)a3;
- (void)setDetectedLanguage:(id)a3;
- (void)setEditEligibility:(unint64_t)a3;
- (void)setEditedPartIndexes:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setExpectedOffGridCapableDeliveries:(unint64_t)a3;
- (void)setExpectedServiceForCrossServiceReplacement:(id)a3;
- (void)setExpireState:(int64_t)a3;
- (void)setExpressiveSendStyleID:(id)a3;
- (void)setFailedEditPartIndexes:(id)a3;
- (void)setFailedRetractPartIndexes:(id)a3;
- (void)setFallbackHash:(id)a3;
- (void)setFileTransferGUIDs:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setGroupActivity:(id)a3;
- (void)setHasDataDetectorResults:(BOOL)a3;
- (void)setHasUnseenMention:(BOOL)a3;
- (void)setHistory:(id)a3 forMessagePart:(int64_t)a4;
- (void)setInitialTranscriptSharingItem:(BOOL)a3;
- (void)setIsBeingRetried:(BOOL)a3;
- (void)setIsCorrupt:(BOOL)a3;
- (void)setIsCritical:(BOOL)a3;
- (void)setIsKeyTransparencyVerifiedMessage:(BOOL)a3;
- (void)setIsPendingSatelliteSend:(BOOL)a3;
- (void)setIsSOS:(BOOL)a3;
- (void)setIsSpam:(BOOL)a3;
- (void)setIsStewie:(BOOL)a3;
- (void)setIsTapToRetry:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMessageSummaryInfo:(id)a3;
- (void)setNeedsRelay:(BOOL)a3;
- (void)setNeedsRepeatForRelayReplication:(BOOL)a3;
- (void)setNicknameRequested:(BOOL)a3;
- (void)setNotificationIDSTokenURI:(id)a3;
- (void)setOriginalServiceName:(id)a3;
- (void)setOriginalTextRangesByPartIndex:(id)a3;
- (void)setOriginalUnformattedID:(id)a3;
- (void)setPartCount:(unint64_t)a3;
- (void)setPayloadData:(id)a3;
- (void)setPlainBody:(id)a3;
- (void)setReplaceID:(int64_t)a3;
- (void)setReplicatedFallbackGUIDs:(id)a3;
- (void)setReplyCountsByPart:(id)a3;
- (void)setRetractedPartIndexes:(id)a3;
- (void)setRetryToParticipant:(id)a3;
- (void)setSatelliteMessageRetry:(BOOL)a3;
- (void)setScheduleState:(unint64_t)a3;
- (void)setScheduleType:(unint64_t)a3;
- (void)setScheduledMessageLastModifiedTime:(id)a3;
- (void)setScheduledMessageOriginalTransferGUIDs:(id)a3;
- (void)setSelectedRichCardIndex:(int64_t)a3;
- (void)setSentOrReceivedOffGrid:(BOOL)a3;
- (void)setSentViaRemoteIntent:(BOOL)a3;
- (void)setShouldNotifyOnSend:(BOOL)a3;
- (void)setShouldSendMeCard:(BOOL)a3;
- (void)setShouldSendPartIndexesInMessageBody:(BOOL)a3;
- (void)setStewieConversationID:(int64_t)a3;
- (void)setStewieConversationUUID:(id)a3;
- (void)setStewieSequenceNumber:(int64_t)a3;
- (void)setSubject:(id)a3;
- (void)setSuggestedAuthorAvatarPath:(id)a3;
- (void)setSuggestedAuthorName:(id)a3;
- (void)setSwyAppName:(id)a3;
- (void)setSwyBundleID:(id)a3;
- (void)setSyncedSyndicationRanges:(id)a3;
- (void)setSyndicationRanges:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadOriginator:(id)a3;
- (void)setTimeDelivered:(id)a3;
- (void)setTimeExpressiveSendPlayed:(id)a3;
- (void)setTimePlayed:(id)a3;
- (void)setTimeRead:(id)a3;
- (void)setTranscriptSharingMessageType:(int64_t)a3;
- (void)setTranslatedText:(id)a3;
- (void)setTypingIndicatorIcon:(id)a3;
- (void)setUpdatingDataSourcePayload:(BOOL)a3;
- (void)setUseStandalone:(BOOL)a3;
- (void)setWasDataDetected:(BOOL)a3;
- (void)setWasDetectedAsSWYSpam:(BOOL)a3;
- (void)setWasInterworked:(BOOL)a3;
@end

@implementation IMMessageItem

- (BOOL)isLastMessageCandidate
{
  if ([(IMMessageItem *)self scheduleType] != 2) {
    return 1;
  }
  if ([(IMMessageItem *)self scheduleState] == 2) {
    return 0;
  }
  return [(IMMessageItem *)self scheduleState] != 1;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (IMMessageItem)initWithDictionary:(id)a3
{
  return [(IMMessageItem *)self initWithDictionary:a3 hint:0];
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (id)copyDictionaryRepresentation
{
  v76[2] = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)IMMessageItem;
  v3 = [(IMItem *)&v74 copyDictionaryRepresentation];
  v4 = (void *)MEMORY[0x1A6228190]();
  if (!self->_plainBody
    || self->_fileTransferGUIDs
    || [(IMMessageItem *)self hasDataDetectorResults])
  {
    goto LABEL_16;
  }
  v5 = self->_plainBody;
  if (v5) {
    CFDictionarySetValue(v3, @"plainBody", v5);
  }

  if ([(IMMessageItem *)self isStewie])
  {
    v76[0] = @"__kIMMentionConfirmedMention";
    v76[1] = @"__kIMApplyBoldFont";
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = (__CFString **)v76;
    uint64_t v8 = 2;
  }
  else
  {
    v75 = @"__kIMMentionConfirmedMention";
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v75;
    uint64_t v8 = 1;
  }
  v9 = [v6 arrayWithObjects:v7 count:v8];
  v10 = +[IMFeatureFlags sharedFeatureFlags];
  int v11 = [v10 isExpressiveTextEnabled];

  v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11)
  {
    if (!v9) {
      v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v13 = [v9 arrayByAddingObject:@"__kIMTextEffectAttributeName"];

    v14 = [v13 arrayByAddingObject:@"__kIMTextBoldAttributeName"];

    v15 = [v14 arrayByAddingObject:@"__kIMTextItalicAttributeName"];

    v16 = [v15 arrayByAddingObject:@"__kIMTextUnderlineAttributeName"];

    v9 = [v16 arrayByAddingObject:@"__kIMTextStrikethroughAttributeName"];
  }
  if (!v9) {
    v9 = v12;
  }
  v17 = [v9 arrayByAddingObject:@"__kIMRichCardsAttributeName"];

  v18 = [v17 arrayByAddingObject:@"__kIMChipListAttributeName"];

  v19 = [v18 arrayByAddingObject:@"__kIMSuggestedReplyAttributeName"];

  v20 = [v19 arrayByAddingObject:@"__kIMSuggestedActionAttributeName"];

  v21 = [v20 arrayByAddingObject:@"__kIMUrlToTransferMapAttributeName"];

  v22 = [(IMMessageItem *)self body];
  int v23 = objc_msgSend(v22, "__im_containsAttributedValue:", v21);

  if (v23)
  {
LABEL_16:
    v24 = [(IMMessageItem *)self bodyData];
    if (v24) {
      CFDictionarySetValue(v3, @"bodyData", v24);
    }
  }
  v25 = self->_subject;
  if (v25) {
    CFDictionarySetValue(v3, @"subject", v25);
  }

  v26 = self->_fileTransferGUIDs;
  if (v26) {
    CFDictionarySetValue(v3, @"fileTransferGUIDs", v26);
  }

  v27 = [(IMMessageItem *)self typingIndicatorIcon];
  if (v27) {
    CFDictionarySetValue(v3, @"typingIndicatorIcon", v27);
  }

  timeRead = self->_timeRead;
  if (timeRead)
  {
    [(NSDate *)timeRead timeIntervalSinceReferenceDate];
    v29 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v29) {
      CFDictionarySetValue(v3, @"timeRead", v29);
    }
  }
  timeDelivered = self->_timeDelivered;
  if (timeDelivered)
  {
    [(NSDate *)timeDelivered timeIntervalSinceReferenceDate];
    v31 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v31) {
      CFDictionarySetValue(v3, @"timeDelivered", v31);
    }
  }
  timePlayed = self->_timePlayed;
  if (timePlayed)
  {
    [(NSDate *)timePlayed timeIntervalSinceReferenceDate];
    v33 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v33) {
      CFDictionarySetValue(v3, @"timePlayed", v33);
    }
  }
  v34 = [NSNumber numberWithUnsignedLongLong:self->_flags];
  if (v34) {
    CFDictionarySetValue(v3, @"flags", v34);
  }

  if (self->_expireState)
  {
    v35 = objc_msgSend(NSNumber, "numberWithLongLong:");
    if (v35) {
      CFDictionarySetValue(v3, @"expireState", v35);
    }
  }
  if (self->_payloadData)
  {
    v36 = [(IMMessageItem *)self payloadData];
    if (v36) {
      CFDictionarySetValue(v3, @"payloadData", v36);
    }
  }
  if ([(NSString *)self->_expressiveSendStyleID length])
  {
    v37 = [(IMMessageItem *)self expressiveSendStyleID];
    if (v37) {
      CFDictionarySetValue(v3, @"expressiveSendStyleID", v37);
    }
  }
  timeExpressiveSendPlayed = self->_timeExpressiveSendPlayed;
  if (timeExpressiveSendPlayed)
  {
    [(NSDate *)timeExpressiveSendPlayed timeIntervalSinceReferenceDate];
    v39 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v39) {
      CFDictionarySetValue(v3, @"timeExpressiveSendPlayed", v39);
    }
  }
  if (self->_error)
  {
    v40 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    if (v40) {
      CFDictionarySetValue(v3, @"error", v40);
    }
  }
  if (self->_contactsAvatarRecipeData)
  {
    v41 = [(IMMessageItem *)self contactsAvatarRecipeData];
    if (v41) {
      CFDictionarySetValue(v3, @"contactsAvatarRecipeData", v41);
    }
  }
  if (self->_messageSummaryInfo)
  {
    v42 = [(IMMessageItem *)self messageSummaryInfo];
    if (v42) {
      CFDictionarySetValue(v3, @"messageSummaryInfo", v42);
    }
  }
  bizIntent = self->_bizIntent;
  if (bizIntent)
  {
    v44 = bizIntent;
    CFDictionarySetValue(v3, @"bizIntent", v44);
  }
  locale = self->_locale;
  if (locale)
  {
    v46 = locale;
    CFDictionarySetValue(v3, @"locale", v46);
  }
  biaReferenceID = self->_biaReferenceID;
  if (biaReferenceID)
  {
    v48 = biaReferenceID;
    CFDictionarySetValue(v3, @"biaReferenceID", v48);
  }
  if (self->_useStandalone)
  {
    v49 = [NSNumber numberWithBool:1];
    if (v49) {
      CFDictionarySetValue(v3, @"useStandalone", v49);
    }
  }
  notificationIDSTokenURI = self->_notificationIDSTokenURI;
  if (notificationIDSTokenURI)
  {
    v51 = notificationIDSTokenURI;
    CFDictionarySetValue(v3, @"notificationnotificationIDSTokenURI", v51);
  }
  if (self->_shouldSendMeCard)
  {
    v52 = [NSNumber numberWithBool:1];
    if (v52) {
      CFDictionarySetValue(v3, @"shouldSendMeCard", v52);
    }
  }
  if (self->_shouldNotifyOnSend)
  {
    v53 = [NSNumber numberWithBool:1];
    if (v53) {
      CFDictionarySetValue(v3, @"shouldNotifyOnSend", v53);
    }
  }
  if (self->_sentViaRemoteIntent)
  {
    v54 = [NSNumber numberWithBool:1];
    if (v54) {
      CFDictionarySetValue(v3, @"sentViaRemoteIntent", v54);
    }
  }
  if (self->_isBeingRetried)
  {
    v55 = [NSNumber numberWithBool:1];
    if (v55) {
      CFDictionarySetValue(v3, @"isBeingRetried", v55);
    }
  }
  retryToParticipant = self->_retryToParticipant;
  if (retryToParticipant)
  {
    v57 = retryToParticipant;
    CFDictionarySetValue(v3, @"retryToParticipant", v57);
  }
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier) {
    [(__CFDictionary *)v3 setValue:threadIdentifier forKey:@"threadIdentifier"];
  }
  threadOriginator = self->_threadOriginator;
  if (threadOriginator)
  {
    id v60 = [(IMMessageItem *)threadOriginator copyDictionaryRepresentation];
    [(__CFDictionary *)v3 setValue:v60 forKey:@"threadOriginator"];
  }
  replyCountsByPart = self->_replyCountsByPart;
  if (replyCountsByPart) {
    [(__CFDictionary *)v3 setValue:replyCountsByPart forKey:@"replyCountsByPart"];
  }
  if (self->_syndicationRanges)
  {
    v62 = +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:");
    [(__CFDictionary *)v3 setValue:v62 forKey:@"syndicationRanges"];
  }
  if (self->_syncedSyndicationRanges)
  {
    v63 = +[IMMessagePartSyndicationRange serializedStringFromArray:](IMMessagePartSyndicationRange, "serializedStringFromArray:");
    [(__CFDictionary *)v3 setValue:v63 forKey:@"syncedSyndicationRanges"];
  }
  dateEdited = self->_dateEdited;
  if (dateEdited)
  {
    [(NSDate *)dateEdited timeIntervalSinceReferenceDate];
    v65 = objc_msgSend(NSNumber, "numberWithDouble:");
    if (v65) {
      CFDictionarySetValue(v3, @"dateEdited", v65);
    }
  }
  groupActivity = self->_groupActivity;
  if (groupActivity)
  {
    v67 = groupActivity;
    CFDictionarySetValue(v3, @"groupActivity", v67);
  }
  v68 = [NSNumber numberWithUnsignedInteger:self->_partCount];
  [(__CFDictionary *)v3 setObject:v68 forKeyedSubscript:@"partCount"];

  v69 = [NSNumber numberWithLongLong:self->_replaceID];
  [(__CFDictionary *)v3 setObject:v69 forKeyedSubscript:@"replaceID"];

  [(__CFDictionary *)v3 setObject:self->_fallbackHash forKeyedSubscript:@"fallbackHash"];
  v70 = [NSNumber numberWithUnsignedInteger:self->_scheduleType];
  [(__CFDictionary *)v3 setObject:v70 forKeyedSubscript:@"scheduleType"];

  v71 = [NSNumber numberWithUnsignedInteger:self->_scheduleState];
  [(__CFDictionary *)v3 setObject:v71 forKeyedSubscript:@"scheduleState"];

  v72 = v3;

  return v72;
}

- (NSData)typingIndicatorIcon
{
  return self->_typingIndicatorIcon;
}

- (BOOL)isStewie
{
  v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (v4)
  {
    if ([(IMMessageItem *)self stewieConversationID] < 0) {
      return (BYTE4(self->_flags) >> 1) & 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (int64_t)stewieConversationID
{
  v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return -1;
  }
  BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
  v6 = [v5 objectForKey:@"stid"];

  if (!v6 || [v6 integerValue] < 0) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = [v6 integerValue];
  }

  return v7;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (BOOL)hasDataDetectorResults
{
  return BYTE2(self->_flags) & 1;
}

- (NSData)bodyData
{
  [(IMMessageItem *)self _generateBodyDataIfNeeded];
  bodyData = self->_bodyData;

  return bodyData;
}

- (void)_generateBodyDataIfNeeded
{
  if (!self->_bodyData) {
    MEMORY[0x1F4181798]();
  }
}

- (IMMessageItem)initWithDictionary:(id)a3 hint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v72.receiver = self;
  v72.super_class = (Class)IMMessageItem;
  uint64_t v8 = [(IMItem *)&v72 initWithDictionary:v6];
  if (v8)
  {
    v9 = [v6 objectForKey:@"bodyData"];
    [(IMMessageItem *)v8 setBodyData:v9];

    v10 = [v6 objectForKey:@"subject"];
    [(IMMessageItem *)v8 setSubject:v10];

    int v11 = [v6 objectForKey:@"fileTransferGUIDs"];
    [(IMMessageItem *)v8 setFileTransferGUIDs:v11];

    v12 = [v6 objectForKey:@"timeRead"];
    [v12 doubleValue];
    double v14 = v13;

    if (v14 > 10.0)
    {
      v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v14];
      [(IMMessageItem *)v8 setTimeRead:v15];
    }
    v16 = [v6 objectForKey:@"timeDelivered"];
    [v16 doubleValue];
    double v18 = v17;

    if (v18 > 10.0)
    {
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v18];
      [(IMMessageItem *)v8 setTimeDelivered:v19];
    }
    v20 = [v6 objectForKey:@"timePlayed"];
    [v20 doubleValue];
    double v22 = v21;

    if (v22 > 10.0)
    {
      int v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v22];
      [(IMMessageItem *)v8 setTimePlayed:v23];
    }
    v24 = [v6 objectForKey:@"flags"];
    v8->_flags = [v24 unsignedLongLongValue];

    v25 = [v6 objectForKey:@"expireState"];
    v8->_expireState = [v25 longLongValue];

    v26 = [v6 objectForKey:@"error"];
    v8->_error = [v26 unsignedIntValue];

    uint64_t v27 = [v6 objectForKey:@"plainBody"];
    plainBody = v8->_plainBody;
    v8->_plainBody = (NSString *)v27;

    uint64_t v29 = [v6 objectForKey:@"typingIndicatorIcon"];
    typingIndicatorIcon = v8->_typingIndicatorIcon;
    v8->_typingIndicatorIcon = (NSData *)v29;

    v31 = [v6 objectForKey:@"payloadData"];
    [(IMMessageItem *)v8 setPayloadData:v31];

    v32 = [v6 objectForKey:@"balloonBundleID"];
    [(IMItem *)v8 setBalloonBundleID:v32];

    v33 = [v6 objectForKey:@"expressiveSendStyleID"];
    [(IMMessageItem *)v8 setExpressiveSendStyleID:v33];

    v34 = [v6 objectForKey:@"timeExpressiveSendPlayed"];
    [v34 doubleValue];
    double v36 = v35;

    if (v36 > 10.0)
    {
      v37 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v36];
      [(IMMessageItem *)v8 setTimeExpressiveSendPlayed:v37];
    }
    if ([(IMMessageItem *)v8 isEqual:v7])
    {
      v38 = [v7 body];
      [(IMMessageItem *)v8 setBody:v38];
    }
    v39 = [v6 objectForKey:@"contactsAvatarRecipeData"];
    [(IMMessageItem *)v8 setContactsAvatarRecipeData:v39];

    v40 = [v6 objectForKey:@"messageSummaryInfo"];
    [(IMMessageItem *)v8 setMessageSummaryInfo:v40];

    v41 = [v6 objectForKey:@"bizIntent"];
    [(IMMessageItem *)v8 setBizIntent:v41];

    v42 = [v6 objectForKey:@"locale"];
    [(IMMessageItem *)v8 setLocale:v42];

    v43 = [v6 objectForKey:@"biaReferenceID"];
    [(IMMessageItem *)v8 setBiaReferenceID:v43];

    v44 = [v6 objectForKey:@"useStandalone"];
    -[IMMessageItem setUseStandalone:](v8, "setUseStandalone:", [v44 BOOLValue]);

    v45 = [v6 objectForKey:@"notificationnotificationIDSTokenURI"];
    [(IMMessageItem *)v8 setNotificationIDSTokenURI:v45];

    v46 = [v6 objectForKey:@"shouldSendMeCard"];
    -[IMMessageItem setShouldSendMeCard:](v8, "setShouldSendMeCard:", [v46 BOOLValue]);

    v47 = [v6 objectForKey:@"shouldNotifyOnSend"];
    -[IMMessageItem setShouldNotifyOnSend:](v8, "setShouldNotifyOnSend:", [v47 BOOLValue]);

    v48 = [v6 objectForKey:@"sentViaRemoteIntent"];
    -[IMMessageItem setSentViaRemoteIntent:](v8, "setSentViaRemoteIntent:", [v48 BOOLValue]);

    v49 = [v6 objectForKey:@"isBeingRetried"];
    -[IMMessageItem setIsBeingRetried:](v8, "setIsBeingRetried:", [v49 BOOLValue]);

    v50 = [v6 objectForKey:@"retryToParticipant"];
    [(IMMessageItem *)v8 setRetryToParticipant:v50];

    v51 = [v6 objectForKey:@"threadIdentifier"];
    [(IMMessageItem *)v8 setThreadIdentifier:v51];

    [(IMMessageItem *)v8 setThreadOriginator:0];
    if ([(IMMessageItem *)v8 isReply])
    {
      v52 = [v6 objectForKey:@"threadOriginator"];
      if (v52)
      {
        v53 = [[IMMessageItem alloc] initWithDictionary:v52 hint:0];
        [(IMMessageItem *)v8 setThreadOriginator:v53];
      }
    }
    v54 = [v6 objectForKey:@"replyCountsByPart"];
    [(IMMessageItem *)v8 setReplyCountsByPart:v54];

    v55 = [v6 objectForKey:@"syndicationRanges"];
    v56 = +[IMMessagePartSyndicationRange rangesFromSerializedString:v55];
    [(IMMessageItem *)v8 setSyndicationRanges:v56];

    v57 = [v6 objectForKey:@"syncedSyndicationRanges"];
    v58 = +[IMMessagePartSyndicationRange rangesFromSerializedString:v57];
    [(IMMessageItem *)v8 setSyncedSyndicationRanges:v58];

    v59 = [v6 objectForKey:@"dateEdited"];
    [v59 doubleValue];
    double v61 = v60;

    if (v61 > 10.0)
    {
      v62 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v61];
      [(IMMessageItem *)v8 setDateEdited:v62];
    }
    v63 = [v6 objectForKey:@"partCount"];
    -[IMMessageItem setPartCount:](v8, "setPartCount:", [v63 unsignedIntegerValue]);

    v64 = [v6 objectForKey:@"groupActivity"];
    [(IMMessageItem *)v8 setGroupActivity:v64];

    v65 = [v6 objectForKey:@"replaceID"];
    -[IMMessageItem setReplaceID:](v8, "setReplaceID:", [v65 longLongValue]);

    v66 = [v6 objectForKey:@"fallbackHash"];
    [(IMMessageItem *)v8 setFallbackHash:v66];

    v67 = [v6 objectForKey:@"scheduleType"];
    [v67 doubleValue];
    [(IMMessageItem *)v8 setScheduleType:(unint64_t)v68];

    v69 = [v6 objectForKey:@"scheduleState"];
    [v69 doubleValue];
    [(IMMessageItem *)v8 setScheduleState:(unint64_t)v70];
  }
  return v8;
}

- (BOOL)isSuggestedActionResponse
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isLazuliEnabled];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(IMMessageItem *)self body];
  v9[0] = @"__kIMSuggestedActionAttributeName";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  char v7 = objc_msgSend(v5, "__im_containsAttributedValue:", v6);

  return v7;
}

- (NSAttributedString)body
{
  [(IMMessageItem *)self _generateBodyTextIfNeeded];
  body = self->_body;

  return body;
}

- (void)_generateBodyTextIfNeeded
{
  if ((self->_bodyData || self->_plainBody) && !self->_body) {
    MEMORY[0x1F4181798]();
  }
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (void)setThreadOriginator:(id)a3
{
}

- (void)setThreadIdentifier:(id)a3
{
}

- (void)setSyndicationRanges:(id)a3
{
}

- (void)setSyncedSyndicationRanges:(id)a3
{
}

- (void)setSubject:(id)a3
{
  BOOL v5 = (NSString *)a3;
  p_subject = &self->_subject;
  if (self->_subject != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_subject, a3);
    p_subject = (NSString **)[(IMMessageItem *)self adjustIsEmptyFlag];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](p_subject, v5);
}

- (void)setShouldSendMeCard:(BOOL)a3
{
  self->_shouldSendMeCard = a3;
}

- (void)setShouldNotifyOnSend:(BOOL)a3
{
  self->_shouldNotifyOnSend = a3;
}

- (void)setScheduleType:(unint64_t)a3
{
  self->_scheduleType = a3;
}

- (void)setScheduleState:(unint64_t)a3
{
  self->_scheduleState = a3;
}

- (void)setRetryToParticipant:(id)a3
{
}

- (void)setReplyCountsByPart:(id)a3
{
}

- (void)setReplaceID:(int64_t)a3
{
  self->_replaceID = a3;
}

- (void)setPayloadData:(id)a3
{
  BOOL v5 = (NSData *)a3;
  p_payloadData = &self->_payloadData;
  if (self->_payloadData != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_payloadData, a3);
    p_payloadData = (NSData **)[(IMMessageItem *)self adjustIsEmptyFlag];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](p_payloadData, v5);
}

- (void)setPartCount:(unint64_t)a3
{
  self->_partCount = a3;
}

- (void)setNotificationIDSTokenURI:(id)a3
{
}

- (void)setMessageSummaryInfo:(id)a3
{
}

- (void)setLocale:(id)a3
{
}

- (void)setIsBeingRetried:(BOOL)a3
{
  self->_isBeingRetried = a3;
}

- (void)setGroupActivity:(id)a3
{
}

- (void)setFileTransferGUIDs:(id)a3
{
  BOOL v5 = (NSArray *)a3;
  p_fileTransferGUIDs = &self->_fileTransferGUIDs;
  if (self->_fileTransferGUIDs != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_fileTransferGUIDs, a3);
    p_fileTransferGUIDs = (NSArray **)[(IMMessageItem *)self adjustIsEmptyFlag];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](p_fileTransferGUIDs, v5);
}

- (void)setFallbackHash:(id)a3
{
}

- (void)setExpressiveSendStyleID:(id)a3
{
}

- (void)setContactsAvatarRecipeData:(id)a3
{
}

- (void)setBodyData:(id)a3
{
}

- (void)setBizIntent:(id)a3
{
}

- (void)setBiaReferenceID:(id)a3
{
}

- (BOOL)isReply
{
  v3 = [(IMMessageItem *)self threadIdentifier];

  if (!v3) {
    return 0;
  }
  int v4 = [(IMMessageItem *)self threadIdentifier];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)_regenerateBodyText
{
  body = self->_body;
  self->_body = 0;

  if ([(NSData *)self->_bodyData length])
  {
    int v4 = (void *)MEMORY[0x1A6228190]();
    BOOL v5 = (void *)[(NSData *)self->_bodyData copy];
    JWDecodeCodableObjectWithStandardAllowlist();
    id v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    char v7 = self->_body;
    self->_body = v6;
  }
  else if (self->_plainBody)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (qword_1EB4A6260 != -1)
    {
      id v11 = v8;
      dispatch_once(&qword_1EB4A6260, &unk_1EF2C1138);
      id v8 = v11;
    }
    v9 = (NSAttributedString *)objc_msgSend(v8, "initWithString:attributes:");
    v10 = self->_body;
    self->_body = v9;
  }

  [(IMMessageItem *)self _recalculatePartCount];
}

- (void)_recalculatePartCount
{
  if ([(NSAttributedString *)self->_body length])
  {
    self->_partCount = [(NSAttributedString *)self->_body __im_countMessageParts];
  }
  else if ([(NSString *)self->_plainBody length])
  {
    self->_partCount = 1;
  }
  else
  {
    self->_partCount = 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5 = (IMMessageItem *)a3;
  if (v5 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v120.receiver = self;
      v120.super_class = (Class)IMMessageItem;
      if (![(IMItem *)&v120 isEqual:v6]
        || (unint64_t flags = self->_flags, flags != [(IMMessageItem *)v6 flags])
        || (int64_t replaceID = self->_replaceID, replaceID != [(IMMessageItem *)v6 replaceID]))
      {
        unsigned __int8 v12 = 0;
LABEL_12:

        goto LABEL_13;
      }
      subject = self->_subject;
      v10 = [(IMMessageItem *)v6 subject];
      if (subject != v10)
      {
        id v11 = self->_subject;
        v3 = [(IMMessageItem *)v6 subject];
        if (![(NSString *)v11 isEqualToString:v3])
        {
          unsigned __int8 v12 = 0;
          goto LABEL_60;
        }
      }
      bodyData = self->_bodyData;
      uint64_t v15 = [(IMMessageItem *)v6 bodyData];
      v16 = (NSData *)v15;
      v117 = bodyData;
      v118 = v10;
      if (bodyData == (NSData *)v15)
      {
        v19 = (NSData *)v15;
        v20 = subject;
        uint64_t v116 = 0;
      }
      else
      {
        double v17 = self->_bodyData;
        double v18 = [(IMMessageItem *)v6 bodyData];
        if ([(NSData *)v17 isEqualToData:v18])
        {
          v19 = v16;
          v20 = subject;
          v115 = v18;
          uint64_t v116 = 0;
        }
        else
        {
          body = self->_body;
          uint64_t v35 = [(IMMessageItem *)v6 body];
          if (body == (NSAttributedString *)v35)
          {
            v19 = v16;
            v20 = subject;
            v115 = v18;
            uint64_t v116 = 0x100000000;
            v111 = body;
          }
          else
          {
            v111 = (void *)v35;
            double v36 = self->_body;
            v37 = [(IMMessageItem *)v6 body];
            if (![(NSAttributedString *)v36 isEqualToAttributedString:v37])
            {

              unsigned __int8 v12 = 0;
              goto LABEL_59;
            }
            v19 = v16;
            v20 = subject;
            v107 = v37;
            v115 = v18;
            uint64_t v116 = 0x100000001;
          }
        }
      }
      timeRead = self->_timeRead;
      double v22 = [(IMMessageItem *)v6 timeRead];
      if (timeRead != v22)
      {
        int v23 = self->_timeRead;
        uint64_t v24 = [(IMMessageItem *)v6 timeRead];
        v25 = v23;
        v26 = (void *)v24;
        if (![(NSDate *)v25 isEqualToDate:v24])
        {

          unsigned __int8 v12 = 0;
          v38 = v117;
          char v39 = v116;
          subject = v20;
          goto LABEL_65;
        }
        v109 = v26;
      }
      timeDelivered = self->_timeDelivered;
      [(IMMessageItem *)v6 timeDelivered];
      v113 = timeDelivered;
      v114 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (timeDelivered == v114)
      {
        v33 = v3;
        v32 = timeRead;
LABEL_29:
        timePlayed = self->_timePlayed;
        v112 = [(IMMessageItem *)v6 timePlayed];
        v110 = timePlayed;
        if (timePlayed != v112)
        {
          v41 = self->_timePlayed;
          v42 = [(IMMessageItem *)v6 timePlayed];
          if (![(NSDate *)v41 isEqualToDate:v42])
          {

            v3 = v33;
            if (v113 == v114)
            {
            }
            else
            {
            }
            subject = v20;
            if (v32 != v22) {

            }
            unsigned __int8 v12 = 0;
            v45 = v19;
            v38 = v117;
            v10 = v118;
            if (v116) {
              goto LABEL_66;
            }
LABEL_54:
            v52 = v115;
            if (!HIDWORD(v116))
            {
LABEL_56:
              if (v38 != v45) {

              }
LABEL_59:
              if (subject == v10)
              {
LABEL_61:

                goto LABEL_12;
              }
LABEL_60:

              goto LABEL_61;
            }
LABEL_55:

            goto LABEL_56;
          }
          v103 = v42;
        }
        fileTransferGUIDs = self->_fileTransferGUIDs;
        v108 = [(IMMessageItem *)v6 fileTransferGUIDs];
        v106 = fileTransferGUIDs;
        if (fileTransferGUIDs == v108)
        {
          subject = v20;
          v45 = v19;
          v10 = v118;
        }
        else
        {
          v44 = self->_fileTransferGUIDs;
          v104 = [(IMMessageItem *)v6 fileTransferGUIDs];
          subject = v20;
          v45 = v19;
          v10 = v118;
          if (!-[NSArray isEqualToArray:](v44, "isEqualToArray:")) {
            goto LABEL_46;
          }
        }
        int64_t expireState = self->_expireState;
        if (expireState != [(IMMessageItem *)v6 expireState])
        {
          if (v106 == v108)
          {
            v51 = v106;
LABEL_47:

            if (v110 != v112) {
            v3 = v33;
            }
            if (v113 != v114) {

            }
            if (v32 != v22) {
            unsigned __int8 v12 = 0;
            }
            v38 = v117;
            if ((v116 & 1) == 0) {
              goto LABEL_54;
            }
LABEL_66:

            v52 = v115;
            if ((v116 & 0x100000000) == 0) {
              goto LABEL_56;
            }
            goto LABEL_55;
          }
LABEL_46:

          v51 = v108;
          goto LABEL_47;
        }
        v102 = v32;
        expressiveSendStyleID = self->_expressiveSendStyleID;
        [(IMMessageItem *)v6 expressiveSendStyleID];
        v100 = expressiveSendStyleID;
        v101 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (expressiveSendStyleID != v101)
        {
          v48 = self->_expressiveSendStyleID;
          v98 = [(IMMessageItem *)v6 expressiveSendStyleID];
          if (!-[NSString isEqualToString:](v48, "isEqualToString:"))
          {
            unsigned __int8 v12 = 0;
            v3 = v33;
            v49 = v101;
            v50 = v102;
LABEL_118:

LABEL_119:
            if (v106 != v108) {

            }
            if (v110 != v112) {
            if (v113 != v114)
            }

            if (v50 != v22) {
            v38 = v117;
            }
            if (v116) {
              goto LABEL_66;
            }
            goto LABEL_54;
          }
        }
        timeExpressiveSendPlayed = self->_timeExpressiveSendPlayed;
        uint64_t v99 = [(IMMessageItem *)v6 timeExpressiveSendPlayed];
        v97 = timeExpressiveSendPlayed;
        if (timeExpressiveSendPlayed == (NSDate *)v99)
        {
          v50 = v102;
        }
        else
        {
          v54 = self->_timeExpressiveSendPlayed;
          v96 = [(IMMessageItem *)v6 timeExpressiveSendPlayed];
          v50 = v102;
          if (!-[NSDate isEqualToDate:](v54, "isEqualToDate:"))
          {
            unsigned __int8 v12 = 0;
            v3 = v33;
            v55 = (void *)v99;
            goto LABEL_116;
          }
        }
        unsigned int error = self->_error;
        if (error != [(IMMessageItem *)v6 errorCode])
        {
          v3 = v33;
          if (v97 == (NSDate *)v99)
          {

            unsigned __int8 v12 = 0;
            goto LABEL_117;
          }
          unsigned __int8 v12 = 0;
          v55 = (void *)v99;
LABEL_116:

LABEL_117:
          v49 = v101;
          if (v100 == v101) {
            goto LABEL_119;
          }
          goto LABEL_118;
        }
        threadIdentifier = self->_threadIdentifier;
        v58 = [(IMMessageItem *)v6 threadIdentifier];
        v3 = v33;
        if (threadIdentifier != v58)
        {

          unsigned __int8 v12 = 0;
          v55 = (void *)v99;
          v50 = v102;
          if (v97 != (NSDate *)v99) {
            goto LABEL_116;
          }
          goto LABEL_129;
        }
        v94 = v33;
        v95 = threadIdentifier;
        threadOriginator = self->_threadOriginator;
        uint64_t v60 = [(IMMessageItem *)v6 threadOriginator];
        v93 = threadOriginator;
        if (threadOriginator != (IMMessageItem *)v60)
        {
          double v61 = self->_threadOriginator;
          v91 = [(IMMessageItem *)v6 threadOriginator];
          if (!-[IMMessageItem isEqual:](v61, "isEqual:"))
          {
            unsigned __int8 v12 = 0;
            v3 = v94;
            v62 = (void *)v60;
            v50 = v102;
LABEL_114:

LABEL_115:
            v55 = (void *)v99;
            if (v97 != (NSDate *)v99) {
              goto LABEL_116;
            }
LABEL_129:

            if (v100 != v101) {
            if (v106 != v108)
            }

            if (v110 != v112) {
            if (v113 != v114)
            }

            if (v50 != v22) {
            v38 = v117;
            }
            if (v116) {
              goto LABEL_66;
            }
            goto LABEL_54;
          }
        }
        v92 = (IMMessageItem *)v60;
        replyCountsByPart = self->_replyCountsByPart;
        v64 = [(IMMessageItem *)v6 replyCountsByPart];
        v90 = replyCountsByPart;
        if (replyCountsByPart == v64)
        {
          v87 = v45;
          v88 = subject;
        }
        else
        {
          v65 = self->_replyCountsByPart;
          v89 = [(IMMessageItem *)v6 replyCountsByPart];
          if (!-[NSDictionary isEqualToDictionary:](v65, "isEqualToDictionary:"))
          {
            unsigned __int8 v12 = 0;
            v3 = v94;
            v50 = v102;
LABEL_112:

LABEL_113:
            v62 = v92;
            if (v93 == v92) {
              goto LABEL_115;
            }
            goto LABEL_114;
          }
          v87 = v45;
          v88 = subject;
        }
        syndicationRanges = self->_syndicationRanges;
        v67 = [(IMMessageItem *)v6 syndicationRanges];
        v86 = syndicationRanges;
        if (syndicationRanges != v67)
        {
          double v68 = self->_syndicationRanges;
          v84 = [(IMMessageItem *)v6 syndicationRanges];
          if (!-[NSArray isEqualToArray:](v68, "isEqualToArray:"))
          {
            unsigned __int8 v12 = 0;
LABEL_110:

LABEL_111:
            v3 = v94;
            v50 = v102;
            v45 = v87;
            subject = v88;
            v10 = v118;
            if (v90 == v64) {
              goto LABEL_113;
            }
            goto LABEL_112;
          }
        }
        syncedSyndicationRanges = self->_syncedSyndicationRanges;
        [(IMMessageItem *)v6 syncedSyndicationRanges];
        uint64_t v85 = v83 = syncedSyndicationRanges;
        if (syncedSyndicationRanges != (NSArray *)v85)
        {
          double v70 = self->_syncedSyndicationRanges;
          v82 = [(IMMessageItem *)v6 syncedSyndicationRanges];
          if (!-[NSArray isEqualToArray:](v70, "isEqualToArray:"))
          {
            unsigned __int8 v12 = 0;
            v71 = (void *)v85;
LABEL_108:

LABEL_109:
            if (v86 == v67) {
              goto LABEL_111;
            }
            goto LABEL_110;
          }
        }
        dateEdited = self->_dateEdited;
        v73 = [(IMMessageItem *)v6 dateEdited];
        v81 = dateEdited;
        if (dateEdited == v73
          || (objc_super v74 = self->_dateEdited,
              [(IMMessageItem *)v6 dateEdited],
              v80 = objc_claimAutoreleasedReturnValue(),
              -[NSDate isEqualToDate:](v74, "isEqualToDate:")))
        {
          fallbackHash = self->_fallbackHash;
          uint64_t v76 = [(IMMessageItem *)v6 fallbackHash];
          if (fallbackHash == (NSString *)v76)
          {

            unsigned __int8 v12 = 1;
          }
          else
          {
            v77 = (void *)v76;
            v78 = self->_fallbackHash;
            v79 = [(IMMessageItem *)v6 fallbackHash];
            unsigned __int8 v12 = [(NSString *)v78 isEqualToString:v79];
          }
          if (v81 == v73)
          {
LABEL_107:

            v71 = (void *)v85;
            if (v83 == (NSArray *)v85) {
              goto LABEL_109;
            }
            goto LABEL_108;
          }
        }
        else
        {
          unsigned __int8 v12 = 0;
        }

        goto LABEL_107;
      }
      v28 = self->_timeDelivered;
      uint64_t v29 = [(IMMessageItem *)v6 timeDelivered];
      v30 = v28;
      v31 = (void *)v29;
      v32 = timeRead;
      if ([(NSDate *)v30 isEqualToDate:v29])
      {
        v105 = v31;
        v33 = v3;
        goto LABEL_29;
      }

      subject = v20;
      if (v32 == v22)
      {
      }
      else
      {
      }
      unsigned __int8 v12 = 0;
      v38 = v117;
      char v39 = v116;
LABEL_65:
      v45 = v19;
      v10 = v118;
      if ((v39 & 1) == 0) {
        goto LABEL_54;
      }
      goto LABEL_66;
    }
    v119.receiver = self;
    v119.super_class = (Class)IMMessageItem;
    unsigned __int8 v12 = [(IMItem *)&v119 isEqual:v5];
  }
LABEL_13:

  return v12;
}

- (void)setTimeRead:(id)a3
{
}

- (void)setTimeDelivered:(id)a3
{
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)adjustIsEmptyFlag
{
  if (self->_body || self->_subject || [(NSData *)self->_payloadData length])
  {
    v3 = [(IMMessageItem *)self body];
    id v5 = [v3 string];

    if ([(NSString *)self->_subject length]
      || [v5 length]
      || [(NSArray *)self->_fileTransferGUIDs count]
      || [(NSData *)self->_payloadData length])
    {
      if (![(IMMessageItem *)self isEmpty])
      {
LABEL_11:

        return;
      }
      unint64_t v4 = self->_flags & 0xFFFFFFFFFFFFFFF7;
    }
    else
    {
      unint64_t v4 = self->_flags | 8;
    }
    self->_unint64_t flags = v4;
    goto LABEL_11;
  }
  if (([(IMMessageItem *)self wasDetonated] || [(NSArray *)self->_fileTransferGUIDs count])
    && [(IMMessageItem *)self isEmpty])
  {
    self->_flags &= ~8uLL;
  }
}

- (BOOL)isTypingMessage
{
  if ([(IMMessageItem *)self wasDetonated])
  {
    LOBYTE(v3) = 0;
  }
  else if ([(IMMessageItem *)self isFinished])
  {
    BOOL v3 = [(IMMessageItem *)self isFinished];
    if (v3)
    {
      BOOL v3 = [(IMMessageItem *)self isEmpty];
      if (v3) {
        LOBYTE(v3) = ![(IMMessageItem *)self hasEditedParts];
      }
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isFinished
{
  return self->_flags & 1;
}

- (BOOL)isEmpty
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)wasDetonated
{
  return (BYTE4(self->_flags) >> 4) & 1;
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (NSDate)timePlayed
{
  return self->_timePlayed;
}

- (NSDate)timeExpressiveSendPlayed
{
  return self->_timeExpressiveSendPlayed;
}

- (NSDate)timeDelivered
{
  return self->_timeDelivered;
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (NSArray)syndicationRanges
{
  return self->_syndicationRanges;
}

- (NSArray)syncedSyndicationRanges
{
  return self->_syncedSyndicationRanges;
}

- (NSString)subject
{
  return self->_subject;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (NSString)plainBody
{
  return self->_plainBody;
}

- (id)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (unsigned)errorCode
{
  return self->_error;
}

- (NSDate)dateEdited
{
  return self->_dateEdited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyCountsByPart, 0);
  objc_storeStrong((id *)&self->_suggestedAuthorAvatarPath, 0);
  objc_storeStrong((id *)&self->_suggestedAuthorName, 0);
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, 0);
  objc_storeStrong((id *)&self->_retryToParticipant, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_translatedText, 0);
  objc_storeStrong((id *)&self->_fallbackHash, 0);
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_dateEdited, 0);
  objc_storeStrong((id *)&self->_syncedSyndicationRanges, 0);
  objc_storeStrong((id *)&self->_syndicationRanges, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_biaReferenceID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_typingIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_contactsAvatarRecipeData, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_timePlayed, 0);
  objc_storeStrong((id *)&self->_timeDelivered, 0);
  objc_storeStrong((id *)&self->_timeRead, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_plainBody, 0);

  objc_storeStrong((id *)&self->_subject, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v33.receiver = self;
  v33.super_class = (Class)IMMessageItem;
  id v4 = [(IMItem *)&v33 copyWithZone:a3];
  id v5 = [(IMMessageItem *)self plainBody];
  [v4 setPlainBody:v5];

  id v6 = [(IMMessageItem *)self timeRead];
  [v4 setTimeRead:v6];

  char v7 = [(IMMessageItem *)self timeDelivered];
  [v4 setTimeDelivered:v7];

  id v8 = [(IMMessageItem *)self timePlayed];
  [v4 setTimePlayed:v8];

  v9 = [(IMMessageItem *)self body];
  [v4 setBody:v9];

  v10 = [(IMMessageItem *)self bodyData];
  [v4 setBodyData:v10];

  id v11 = [(IMMessageItem *)self subject];
  [v4 setSubject:v11];

  objc_msgSend(v4, "setErrorCode:", -[IMMessageItem errorCode](self, "errorCode"));
  unsigned __int8 v12 = [(IMMessageItem *)self fileTransferGUIDs];
  [v4 setFileTransferGUIDs:v12];

  objc_msgSend(v4, "setReplaceID:", -[IMMessageItem replaceID](self, "replaceID"));
  objc_msgSend(v4, "setExpireState:", -[IMMessageItem expireState](self, "expireState"));
  double v13 = [(IMMessageItem *)self payloadData];
  [v4 setPayloadData:v13];

  double v14 = [(IMMessageItem *)self expressiveSendStyleID];
  [v4 setExpressiveSendStyleID:v14];

  uint64_t v15 = [(IMMessageItem *)self timeExpressiveSendPlayed];
  [v4 setTimeExpressiveSendPlayed:v15];

  v16 = [(IMMessageItem *)self typingIndicatorIcon];
  [v4 setTypingIndicatorIcon:v16];

  double v17 = [(IMMessageItem *)self contactsAvatarRecipeData];
  [v4 setContactsAvatarRecipeData:v17];

  double v18 = [(IMMessageItem *)self messageSummaryInfo];
  [v4 setMessageSummaryInfo:v18];

  v19 = [(IMMessageItem *)self bizIntent];
  [v4 setBizIntent:v19];

  v20 = [(IMMessageItem *)self locale];
  [v4 setLocale:v20];

  double v21 = [(IMMessageItem *)self biaReferenceID];
  [v4 setBiaReferenceID:v21];

  objc_msgSend(v4, "setUseStandalone:", -[IMMessageItem useStandalone](self, "useStandalone"));
  double v22 = [(IMMessageItem *)self notificationIDSTokenURI];
  [v4 setNotificationIDSTokenURI:v22];

  objc_msgSend(v4, "setIsCorrupt:", -[IMMessageItem isCorrupt](self, "isCorrupt"));
  objc_msgSend(v4, "setIsSpam:", -[IMMessageItem isSpam](self, "isSpam"));
  objc_msgSend(v4, "setHasUnseenMention:", -[IMMessageItem hasUnseenMention](self, "hasUnseenMention"));
  objc_msgSend(v4, "setShouldSendMeCard:", -[IMMessageItem shouldSendMeCard](self, "shouldSendMeCard"));
  objc_msgSend(v4, "setShouldNotifyOnSend:", -[IMMessageItem shouldNotifyOnSend](self, "shouldNotifyOnSend"));
  objc_msgSend(v4, "setSentViaRemoteIntent:", -[IMMessageItem sentViaRemoteIntent](self, "sentViaRemoteIntent"));
  objc_msgSend(v4, "setIsBeingRetried:", -[IMMessageItem isBeingRetried](self, "isBeingRetried"));
  int v23 = [(IMMessageItem *)self retryToParticipant];
  [v4 setRetryToParticipant:v23];

  uint64_t v24 = [(IMMessageItem *)self threadIdentifier];
  [v4 setThreadIdentifier:v24];

  v25 = [(IMMessageItem *)self threadOriginator];
  [v4 setThreadOriginator:v25];

  v26 = [(IMMessageItem *)self replyCountsByPart];
  [v4 setReplyCountsByPart:v26];

  uint64_t v27 = [(IMMessageItem *)self syndicationRanges];
  [v4 setSyndicationRanges:v27];

  v28 = [(IMMessageItem *)self syncedSyndicationRanges];
  [v4 setSyncedSyndicationRanges:v28];

  uint64_t v29 = [(IMMessageItem *)self dateEdited];
  [v4 setDateEdited:v29];

  v30 = [(IMMessageItem *)self groupActivity];
  [v4 setGroupActivity:v30];

  v31 = [(IMMessageItem *)self fallbackHash];
  [v4 setFallbackHash:v31];

  objc_msgSend(v4, "setIsKeyTransparencyVerifiedMessage:", -[IMMessageItem isKeyTransparencyVerifiedMessage](self, "isKeyTransparencyVerifiedMessage"));
  objc_msgSend(v4, "setScheduleType:", -[IMMessageItem scheduleType](self, "scheduleType"));
  objc_msgSend(v4, "setScheduleState:", -[IMMessageItem scheduleState](self, "scheduleState"));
  objc_msgSend(v4, "setSelectedRichCardIndex:", -[IMMessageItem selectedRichCardIndex](self, "selectedRichCardIndex"));
  return v4;
}

- (id)copyWithFlags:(unint64_t)a3
{
  id v4 = (void *)[(IMMessageItem *)self copy];
  [v4 _updateFlags:a3];
  return v4;
}

- (id)copyAsReplied
{
  id v3 = [(IMMessageItem *)self copyWithFlags:[(IMMessageItem *)self flags]];
  id v4 = [(IMMessageItem *)self body];
  if ([v4 length])
  {
    id v5 = [v4 string];
    id v6 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v4, "length") - 1);
    int v7 = [v6 isEqualToString:@"\uFFFF"];

    if (v7)
    {
      id v8 = objc_msgSend(v4, "attributesAtIndex:effectiveRange:", objc_msgSend(v4, "length") - 1, 0);
      v9 = [v8 _arrayForKey:@"__kIMChipListAttributeName"];
      v10 = [[IMChipList alloc] initWithChipArray:v9 replied:1];
      id v11 = (void *)[v4 mutableCopy];
      unsigned __int8 v12 = [(IMChipList *)v10 dictionaryRepresentation];
      objc_msgSend(v11, "setAttributes:range:", v12, objc_msgSend(v11, "length") - 1, 1);

      [v3 setBody:v11];
    }
  }

  return v3;
}

- (id)copyForBackwardsCompatibility
{
  id v3 = (void *)[(IMMessageItem *)self copy];
  [v3 setPayloadData:0];
  [v3 setBalloonBundleID:0];
  [v3 setExpressiveSendStyleID:0];
  [v3 setTimeExpressiveSendPlayed:0];
  objc_msgSend(v3, "setFlags:", -[IMMessageItem flags](self, "flags") & 0x200005 | objc_msgSend(v3, "flags"));
  [v3 setContactsAvatarRecipeData:0];
  [v3 setMessageSummaryInfo:0];
  id v4 = [v3 body];
  id v5 = [v4 string];
  uint64_t v6 = [v5 rangeOfString:*MEMORY[0x1E4F6C130]];
  uint64_t v8 = v7;

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    v10 = [v3 body];
    id v11 = (void *)[v9 initWithAttributedString:v10];

    objc_msgSend(v11, "deleteCharactersInRange:", v6, v8);
    [v3 setBody:v11];
  }
  [v3 setThreadIdentifier:0];
  [v3 setThreadOriginator:0];
  [v3 setReplyCountsByPart:0];
  [v3 setBackwardsCompatibleVersion:1];
  [v3 setSyndicationRanges:0];
  [v3 setSyncedSyndicationRanges:0];
  [v3 setDateEdited:0];
  return v3;
}

- (id)findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMItem *)self guid];
  [(IMMessageItem *)self messageParts];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v12 = objc_msgSend(v11, "transferGUID", (void)v16);
        if ([v12 length])
        {
          double v13 = IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex((uint64_t)v5, [v11 messagePartIndex]);
          if ([v13 isEqualToString:v4])
          {
            double v14 = IMLogHandleForCategory("IMMessageItem");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              double v21 = v12;
              __int16 v22 = 2112;
              id v23 = v4;
              _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_DEFAULT, "Found transferGUID %@ matching potentially donated transferGUID %@.", buf, 0x16u);
            }

            goto LABEL_15;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessageItem *)self body];
  unint64_t v6 = [(id)objc_opt_class() messagePartIndexForAttachmentMessagePartWithTransferGUID:v4 inBody:v5];

  return v6;
}

+ (unint64_t)messagePartIndexForAttachmentMessagePartWithTransferGUID:(id)a3 inBody:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v5 length])
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = sub_1A07D8080;
    v9[3] = &unk_1E5A11A08;
    id v10 = v5;
    id v11 = &v12;
    objc_msgSend(v6, "__im_visitMessageParts:", v9);
    unint64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

- (BOOL)_updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessageItem *)self fileTransferGUIDs];
  id v6 = (void *)[v5 mutableCopy];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = sub_1A07D8240;
  uint64_t v14 = &unk_1E5A11A30;
  id v7 = v6;
  id v15 = v7;
  long long v16 = &v17;
  [v4 enumerateKeysAndObjectsUsingBlock:&v11];
  int v8 = *((unsigned __int8 *)v18 + 24);
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v9 = objc_msgSend(v7, "copy", v11, v12, v13, v14);
    [(IMMessageItem *)self setFileTransferGUIDs:v9];
  }
  _Block_object_dispose(&v17, 8);

  return v8 != 0;
}

- (BOOL)_updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessageItem *)self body];
  if ([v5 length])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = sub_1A07777FC;
    uint64_t v17 = sub_1A07776E4;
    id v18 = 0;
    id v18 = v5;
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1A07D843C;
    v8[3] = &unk_1E5A11A58;
    v8[4] = &v13;
    v8[5] = &v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    if (*((unsigned char *)v10 + 24)) {
      [(IMMessageItem *)self setBody:v14[5]];
    }
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  uint64_t v29 = self;
  id v4 = [(IMMessageItem *)self messageSummaryInfo];
  v31 = [v4 _dictionaryForKey:@"ec"];

  id v5 = v31;
  if ([v31 count])
  {
    objc_super v33 = (void *)[v31 mutableCopy];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v31;
    uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    BOOL v30 = v34 != 0;
    if (v34)
    {
      char v38 = 0;
      uint64_t v32 = *(void *)v60;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v60 != v32)
          {
            uint64_t v7 = v6;
            objc_enumerationMutation(obj);
            uint64_t v6 = v7;
          }
          uint64_t v36 = v6;
          uint64_t v37 = *(void *)(*((void *)&v59 + 1) + 8 * v6);
          int v8 = objc_msgSend(obj, "_arrayForKey:");
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v56;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v56 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = *(void *)(*((void *)&v55 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v15 = [[IMMessagePartHistoricalContent alloc] initWithMessageSummaryInfoDictionary:v14];
                  p_super = &v15->super;
                  if (v15)
                  {
                    uint64_t v17 = [(IMMessagePartHistoricalContent *)v15 messagePartText];
                    uint64_t v45 = 0;
                    v46 = &v45;
                    uint64_t v47 = 0x3032000000;
                    v48 = sub_1A07777FC;
                    v49 = sub_1A07776E4;
                    v50 = 0;
                    id v18 = v17;
                    v50 = v18;
                    uint64_t v41 = 0;
                    v42 = &v41;
                    uint64_t v43 = 0x2020000000;
                    char v44 = 0;
                    v40[0] = MEMORY[0x1E4F143A8];
                    v40[1] = 3221225472;
                    v40[2] = sub_1A07D8A68;
                    v40[3] = &unk_1E5A11A58;
                    v40[4] = &v45;
                    v40[5] = &v41;
                    [v39 enumerateKeysAndObjectsUsingBlock:v40];
                    if (*((unsigned char *)v42 + 24))
                    {
                      uint64_t v19 = (void *)[p_super copyWithUpdatedMessagePartText:v46[5]];
                      char v20 = [v19 messageSummaryInfoDictionaryRepresentation];
                      [v9 addObject:v20];

                      char v38 = 1;
                    }
                    else
                    {
                      [v9 addObject:v14];
                    }
                    _Block_object_dispose(&v41, 8);
                    _Block_object_dispose(&v45, 8);
                  }
                  else
                  {
                    id v18 = IMLogHandleForCategory("IMMessageItem");
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
                      sub_1A09EF950(&buf, v52, v18);
                    }
                  }
                }
                else
                {
                  p_super = IMLogHandleForCategory("IMMessageItem");
                  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
                    sub_1A09EF990(&v53, v54, p_super);
                  }
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v63 count:16];
            }
            while (v11);
          }

          double v21 = (void *)[v9 copy];
          [v33 setObject:v21 forKeyedSubscript:v37];

          uint64_t v6 = v36 + 1;
        }
        while (v36 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v34);

      if ((v38 & 1) == 0)
      {
        BOOL v30 = 0;
LABEL_35:

        id v5 = v31;
        goto LABEL_36;
      }
      id obj = (id)[v33 copy];
      __int16 v22 = [(IMMessageItem *)v29 messageSummaryInfo];
      id v23 = (void *)[v22 mutableCopy];
      uint64_t v24 = v23;
      if (v23) {
        id v25 = v23;
      }
      else {
        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v26 = v25;

      [v26 setObject:obj forKeyedSubscript:@"ec"];
      uint64_t v27 = (void *)[v26 copy];
      [(IMMessageItem *)v29 setMessageSummaryInfo:v27];
    }
    goto LABEL_35;
  }
  BOOL v30 = 0;
LABEL_36:

  return v30;
}

- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self _updateFileTransfersArrayReplacingTemporaryFileTransferGUIDs:v4];
  BOOL v6 = [(IMMessageItem *)self _updateMessageBodyReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:v4];
  LOBYTE(self) = [(IMMessageItem *)self _updateMessageEditHistoryReplacingTemporaryFileTransferGUIDsWithUpdatedGUIDs:v4];

  return (v5 || v6) | self;
}

- (void)enumerateAttachmentGUIDsWithBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self body];
  uint64_t v6 = *MEMORY[0x1E4F6C1F8];
  uint64_t v7 = [v5 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A07D8C64;
  v10[3] = &unk_1E5A11A80;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v10);
}

- (id)attachmentGUIDAtIndex:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_1A07777FC;
  uint64_t v17 = sub_1A07776E4;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A07D8F68;
  v8[3] = &unk_1E5A11AA8;
  v8[5] = &v13;
  void v8[6] = a3;
  v8[4] = &v9;
  [(IMMessageItem *)self enumerateAttachmentGUIDsWithBlock:v8];
  if (!*((unsigned char *)v10 + 24) && IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint8_t buf = 138412546;
      char v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "IMMessageItem.attachmentGUIDAtIndex: Did not find an attachment in message %@ at partKey %lu", buf, 0x16u);
    }
  }
  id v6 = (id)v14[5];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (IMMessageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)IMMessageItem;
  BOOL v5 = [(IMItem *)&v48 initWithCoder:v4];
  if (v5)
  {
    context = (void *)MEMORY[0x1A6228190]();
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plainBody"];
    [(IMMessageItem *)v5 setPlainBody:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typingIndicatorIcon"];
    [(IMMessageItem *)v5 setTypingIndicatorIcon:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyData"];
    [(IMMessageItem *)v5 setBodyData:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
    [(IMMessageItem *)v5 setSubject:v9];

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"fileTransferGUIDs"];
    [(IMMessageItem *)v5 setFileTransferGUIDs:v17];

    [v4 decodeDoubleForKey:@"timeRead"];
    if (v18 > 10.0)
    {
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMMessageItem *)v5 setTimeRead:v19];
    }
    [v4 decodeDoubleForKey:@"timeDelivered"];
    if (v20 > 10.0)
    {
      __int16 v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMMessageItem *)v5 setTimeDelivered:v21];
    }
    [v4 decodeDoubleForKey:@"timePlayed"];
    if (v22 > 10.0)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMMessageItem *)v5 setTimePlayed:v23];
    }
    v5->_unint64_t flags = [v4 decodeInt64ForKey:@"flags"];
    v5->_unsigned int error = [v4 decodeInt32ForKey:@"error"];
    v5->_int64_t replaceID = [v4 decodeInt64ForKey:@"replaceID"];
    v5->_int64_t expireState = [v4 decodeInt64ForKey:@"expireState"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadData"];
    [(IMMessageItem *)v5 setPayloadData:v24];

    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expressiveSendStyleID"];
    [(IMMessageItem *)v5 setExpressiveSendStyleID:v25];

    [v4 decodeDoubleForKey:@"timeExpressiveSendPlayed"];
    if (v26 > 10.0)
    {
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMMessageItem *)v5 setTimeExpressiveSendPlayed:v27];
    }
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactsAvatarRecipeData"];
    [(IMMessageItem *)v5 setContactsAvatarRecipeData:v28];

    uint64_t v29 = [v4 decodeObjectOfClasses:v16 forKey:@"messageSummaryInfo"];
    [(IMMessageItem *)v5 setMessageSummaryInfo:v29];

    BOOL v30 = [v4 decodeObjectOfClasses:v16 forKey:@"bizIntent"];
    [(IMMessageItem *)v5 setBizIntent:v30];

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    [(IMMessageItem *)v5 setLocale:v31];

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"biaReferenceID"];
    [(IMMessageItem *)v5 setBiaReferenceID:v32];

    v5->_useStandalone = [v4 decodeBoolForKey:@"useStandalone"];
    objc_super v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationnotificationIDSTokenURI"];
    [(IMMessageItem *)v5 setNotificationIDSTokenURI:v33];

    v5->_shouldSendMeCard = [v4 decodeBoolForKey:@"shouldSendMeCard"];
    v5->_shouldNotifyOnSend = [v4 decodeBoolForKey:@"shouldNotifyOnSend"];
    v5->_sentViaRemoteIntent = [v4 decodeBoolForKey:@"sentViaRemoteIntent"];
    v5->_isBeingRetried = [v4 decodeBoolForKey:@"isBeingRetried"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryToParticipant"];
    [(IMMessageItem *)v5 setRetryToParticipant:v34];

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    [(IMMessageItem *)v5 setThreadIdentifier:v35];

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadOriginator"];
    [(IMMessageItem *)v5 setThreadOriginator:v36];

    uint64_t v37 = [v4 decodeObjectOfClasses:v16 forKey:@"replyCountsByPart"];
    [(IMMessageItem *)v5 setReplyCountsByPart:v37];

    char v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syndicationRanges"];
    id v39 = +[IMMessagePartSyndicationRange rangesFromSerializedString:v38];
    [(IMMessageItem *)v5 setSyndicationRanges:v39];

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncedSyndicationRanges"];
    uint64_t v41 = +[IMMessagePartSyndicationRange rangesFromSerializedString:v40];
    [(IMMessageItem *)v5 setSyncedSyndicationRanges:v41];

    [v4 decodeDoubleForKey:@"dateEdited"];
    if (v42 > 10.0)
    {
      uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      [(IMMessageItem *)v5 setDateEdited:v43];
    }
    v5->_partCount = [v4 decodeIntegerForKey:@"partCount"];
    char v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupActivity"];
    [(IMMessageItem *)v5 setGroupActivity:v44];

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackHash"];
    [(IMMessageItem *)v5 setFallbackHash:v45];

    -[IMMessageItem setScheduleType:](v5, "setScheduleType:", [v4 decodeIntegerForKey:@"scheduleType"]);
    -[IMMessageItem setScheduleState:](v5, "setScheduleState:", [v4 decodeIntegerForKey:@"scheduleState"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)messageContainsSurfDD:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A07D98E8;
  v7[3] = &unk_1E5A11AF8;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v43.receiver = self;
  v43.super_class = (Class)IMMessageItem;
  id v4 = a3;
  [(IMItem *)&v43 encodeWithCoder:v4];
  char v5 = [(IMMessageItem *)self plainBody];
  [v4 encodeObject:v5 forKey:@"plainBody"];

  id v6 = [(IMMessageItem *)self typingIndicatorIcon];
  [v4 encodeObject:v6 forKey:@"typingIndicatorIcon"];

  uint64_t v7 = [(IMMessageItem *)self bodyData];
  [v4 encodeObject:v7 forKey:@"bodyData"];

  uint64_t v8 = [(IMMessageItem *)self subject];
  [v4 encodeObject:v8 forKey:@"subject"];

  uint64_t v9 = [(IMMessageItem *)self fileTransferGUIDs];
  [v4 encodeObject:v9 forKey:@"fileTransferGUIDs"];

  uint64_t v10 = [(IMMessageItem *)self timeRead];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  [v4 encodeDouble:@"timeRead" forKey:v12];
  uint64_t v13 = [(IMMessageItem *)self timeDelivered];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;

  [v4 encodeDouble:@"timeDelivered" forKey:v15];
  long long v16 = [(IMMessageItem *)self timePlayed];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;

  [v4 encodeDouble:@"timePlayed" forKey:v18];
  [v4 encodeInt64:self->_flags forKey:@"flags"];
  [v4 encodeInt32:self->_error forKey:@"error"];
  [v4 encodeInt64:self->_replaceID forKey:@"replaceID"];
  [v4 encodeInt64:self->_expireState forKey:@"expireState"];
  uint64_t v19 = [(IMMessageItem *)self payloadData];
  [v4 encodeObject:v19 forKey:@"payloadData"];

  double v20 = [(IMMessageItem *)self expressiveSendStyleID];
  [v4 encodeObject:v20 forKey:@"expressiveSendStyleID"];

  __int16 v21 = [(IMMessageItem *)self timeExpressiveSendPlayed];
  [v21 timeIntervalSinceReferenceDate];
  double v23 = v22;

  [v4 encodeDouble:@"timeExpressiveSendPlayed" forKey:v23];
  uint64_t v24 = [(IMMessageItem *)self contactsAvatarRecipeData];
  [v4 encodeObject:v24 forKey:@"contactsAvatarRecipeData"];

  id v25 = [(IMMessageItem *)self messageSummaryInfo];
  [v4 encodeObject:v25 forKey:@"messageSummaryInfo"];

  double v26 = [(IMMessageItem *)self bizIntent];
  [v4 encodeObject:v26 forKey:@"bizIntent"];

  uint64_t v27 = [(IMMessageItem *)self locale];
  [v4 encodeObject:v27 forKey:@"locale"];

  v28 = [(IMMessageItem *)self biaReferenceID];
  [v4 encodeObject:v28 forKey:@"biaReferenceID"];

  [v4 encodeBool:self->_useStandalone forKey:@"useStandalone"];
  uint64_t v29 = [(IMMessageItem *)self notificationIDSTokenURI];
  [v4 encodeObject:v29 forKey:@"notificationnotificationIDSTokenURI"];

  [v4 encodeBool:self->_shouldSendMeCard forKey:@"shouldSendMeCard"];
  [v4 encodeBool:self->_shouldNotifyOnSend forKey:@"shouldNotifyOnSend"];
  [v4 encodeBool:self->_sentViaRemoteIntent forKey:@"sentViaRemoteIntent"];
  objc_msgSend(v4, "encodeBool:forKey:", -[IMMessageItem isBeingRetried](self, "isBeingRetried"), @"isBeingRetried");
  BOOL v30 = [(IMMessageItem *)self retryToParticipant];
  [v4 encodeObject:v30 forKey:@"retryToParticipant"];

  v31 = [(IMMessageItem *)self threadIdentifier];
  [v4 encodeObject:v31 forKey:@"threadIdentifier"];

  uint64_t v32 = [(IMMessageItem *)self threadOriginator];
  [v4 encodeObject:v32 forKey:@"threadOriginator"];

  objc_super v33 = [(IMMessageItem *)self replyCountsByPart];
  [v4 encodeObject:v33 forKey:@"replyCountsByPart"];

  uint64_t v34 = [(IMMessageItem *)self syndicationRanges];
  uint64_t v35 = +[IMMessagePartSyndicationRange serializedStringFromArray:v34];
  [v4 encodeObject:v35 forKey:@"syndicationRanges"];

  uint64_t v36 = [(IMMessageItem *)self syncedSyndicationRanges];
  uint64_t v37 = +[IMMessagePartSyndicationRange serializedStringFromArray:v36];
  [v4 encodeObject:v37 forKey:@"syncedSyndicationRanges"];

  char v38 = [(IMMessageItem *)self dateEdited];
  [v38 timeIntervalSinceReferenceDate];
  double v40 = v39;

  [v4 encodeDouble:@"dateEdited" forKey:v40];
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem partCount](self, "partCount"), @"partCount");
  uint64_t v41 = [(IMMessageItem *)self groupActivity];
  [v4 encodeObject:v41 forKey:@"groupActivity"];

  double v42 = [(IMMessageItem *)self fallbackHash];
  [v4 encodeObject:v42 forKey:@"fallbackHash"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem scheduleType](self, "scheduleType"), @"scheduleType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[IMMessageItem scheduleState](self, "scheduleState"), @"scheduleState");
}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 threadIdentifier:(id)a11
{
  return [(IMMessageItem *)self initWithSender:a3 time:a4 body:a5 attributes:a6 fileTransferGUIDs:a7 flags:a8 error:a9 guid:a10 type:0 threadIdentifier:a11];
}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 type:(int64_t)a11 threadIdentifier:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a12;
  if (v16)
  {
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:*MEMORY[0x1E4F6C5C8]];
  }
  else
  {
    uint64_t v24 = 0;
  }
  LODWORD(v27) = [v21 code];
  id v25 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v24, v17, 0, 0, 0, 0, v18, 0, v19, v20, a8, v22, 0, 0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          v27,
          a11,
          v23,
          0,
          0,
          objc_msgSend(v18, "__im_countMessageParts"),
          0,
          0,
          0);
  if (v16) {

  }
  return v25;
}

- (IMMessageItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 type:(int64_t)a6
{
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v10 = *MEMORY[0x1E4F6C5C8];
    id v11 = a5;
    id v12 = a4;
    uint64_t v13 = [v9 dictionaryWithObject:a3 forKey:v10];
    LODWORD(v20) = 0;
    double v14 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v13, v12, 0, 0, 0, 0, 0, 0, 0, 0, 0, v11, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            v20,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);

    double v15 = v14;
  }
  else
  {
    id v16 = a5;
    id v17 = a4;
    LODWORD(v20) = 0;
    id v18 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", 0, v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, v16, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            v20,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);

    double v15 = v18;
  }

  return v15;
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 guid:(id)a5 messageID:(int64_t)a6 account:(id)a7 accountID:(id)a8 service:(id)a9 handle:(id)a10 roomName:(id)a11 unformattedID:(id)a12 countryCode:(id)a13
{
  LODWORD(v14) = 0;
  return -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0, 0, a5, a6, a8,
           a8,
           a9,
           a10,
           a11,
           a12,
           a13,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v14,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 threadIdentifier:(id)a32 syndicationRanges:(id)a33 syncedSyndicationRanges:(id)a34 partCount:(unint64_t)a35 dateEdited:(id)a36 scheduleType:(unint64_t)a37 scheduleState:(unint64_t)a38
{
  LODWORD(v39) = a31;
  return -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           v39,
           0,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

- (IMMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 bizIntent:(id)a28 locale:(id)a29 biaReferenceID:(id)a30 errorType:(unsigned int)a31 type:(int64_t)a32 threadIdentifier:(id)a33 syndicationRanges:(id)a34 syncedSyndicationRanges:(id)a35 partCount:(unint64_t)a36 dateEdited:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39
{
  id v63 = a5;
  id v64 = a6;
  id v62 = a7;
  id v65 = a8;
  id v58 = a9;
  id v60 = a10;
  id v57 = a12;
  id v59 = a24;
  id v61 = a25;
  id v42 = a26;
  id v43 = a27;
  id v44 = a28;
  id v45 = a29;
  id v46 = a30;
  id v47 = a33;
  id v48 = a34;
  id v49 = a35;
  id v50 = a37;
  v66.receiver = self;
  v66.super_class = (Class)IMMessageItem;
  v51 = [(IMItem *)&v66 initWithSenderInfo:a3 time:a4 guid:a14 messageID:a15 account:a16 accountID:a17 service:a18 handle:a19 roomName:a20 unformattedID:a21 countryCode:a22 type:a32];
  v52 = v51;
  if (v51)
  {
    [(IMMessageItem *)v51 setSubject:v65];
    [(IMMessageItem *)v52 setTimeRead:v63];
    [(IMMessageItem *)v52 setTimeDelivered:v64];
    [(IMMessageItem *)v52 setTimePlayed:v62];
    [(IMMessageItem *)v52 _updateFlags:a13];
    [(IMMessageItem *)v52 setExpireState:a23];
    [(IMMessageItem *)v52 setErrorCode:a31];
    objc_storeStrong((id *)&v52->_fileTransferGUIDs, a12);
    objc_storeStrong((id *)&v52->_body, a9);
    [(IMMessageItem *)v52 setPayloadData:v61];
    [(IMItem *)v52 setBalloonBundleID:v59];
    [(IMMessageItem *)v52 setExpressiveSendStyleID:v42];
    [(IMMessageItem *)v52 setTimeExpressiveSendPlayed:v43];
    if (v60) {
      objc_storeStrong((id *)&v52->_bodyData, a10);
    }
    [(IMMessageItem *)v52 adjustIsEmptyFlag];
    [(IMMessageItem *)v52 setContactsAvatarRecipeData:0];
    [(IMMessageItem *)v52 setBizIntent:v44];
    [(IMMessageItem *)v52 setLocale:v45];
    [(IMMessageItem *)v52 setBiaReferenceID:v46];
    [(IMMessageItem *)v52 setThreadIdentifier:v47];
    [(IMMessageItem *)v52 setThreadOriginator:0];
    [(IMMessageItem *)v52 setSyndicationRanges:v48];
    [(IMMessageItem *)v52 setSyncedSyndicationRanges:v49];
    [(IMMessageItem *)v52 setPartCount:a36];
    [(IMMessageItem *)v52 setDateEdited:v50];
    [(IMMessageItem *)v52 setScheduleType:a38];
    [(IMMessageItem *)v52 setScheduleState:a39];
  }

  return v52;
}

- (id)sender
{
  v2 = [(IMItem *)self senderInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x1E4F6C5C8]];

  return v3;
}

- (BOOL)isAlert
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isUnfinished
{
  return 0;
}

- (BOOL)isRead
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)isAudioMessage
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (BOOL)isExpirable
{
  return BYTE3(self->_flags) & 1;
}

- (BOOL)isPlayed
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (BOOL)isDelivered
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)wasDeliveredQuietly
{
  return (BYTE4(self->_flags) >> 2) & 1;
}

- (BOOL)didNotifyRecipient
{
  return (BYTE4(self->_flags) >> 3) & 1;
}

- (BOOL)isAutoReply
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)isSystemMessage
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)isPrepared
{
  return (BYTE1(self->_flags) >> 3) & 1;
}

- (BOOL)isLocatingMessage
{
  return BYTE2(self->_flags) >> 7;
}

- (BOOL)isEmote
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isSent
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)wasDowngraded
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)isFromExternalSource
{
  return (BYTE3(self->_flags) >> 1) & 1;
}

- (BOOL)isCorrupt
{
  return (BYTE3(self->_flags) >> 2) & 1;
}

- (BOOL)isSOS
{
  return BYTE4(self->_flags) >> 7;
}

- (BOOL)isCritical
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (BOOL)isTapToRetry
{
  return BYTE5(self->_flags) & 1;
}

- (BOOL)isCMM
{
  return [(IMMessageItem *)self getCMMState] != 0;
}

- (BOOL)isFindMyPlugin
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  if ([v3 isWaldoEnabled])
  {
    id v4 = [(IMItem *)self balloonBundleID];
    if ([v4 length])
    {
      char v5 = [(IMItem *)self balloonBundleID];
      char v6 = [v5 containsString:@"com.apple.findmy.FindMyMessagesApp"];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isFileAttachment
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isSWYAttachmentsEnabled];

  if (v4)
  {
    char v5 = [(IMItem *)self balloonBundleID];
    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      uint64_t v7 = [(IMMessageItem *)self fileTransferGUIDs];
      if (![v7 count]
        || [(IMMessageItem *)self isAudioMessage]
        || [(IMMessageItem *)self isTypingMessage])
      {
        LOBYTE(v6) = 0;
      }
      else
      {
        BOOL v6 = ![(IMMessageItem *)self isLocatingMessage];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setIsTapToRetry:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (void)setIsCorrupt:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)isSpam
{
  return (BYTE3(self->_flags) >> 3) & 1;
}

- (void)setIsSpam:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (void)setIsSOS:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (void)setIsCritical:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (void)setIsStewie:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 stewieEnabled];

  if (v6)
  {
    uint64_t v7 = 0x200000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    self->_unint64_t flags = self->_flags & 0xFFFFFFFDFFFFFFFFLL | v7;
  }
}

- (int64_t)stewieSequenceNumber
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return -1;
  }
  char v5 = [(IMMessageItem *)self messageSummaryInfo];
  int v6 = [v5 objectForKey:@"stsn"];

  if (!v6 || [v6 integerValue] < 0) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = [v6 integerValue];
  }

  return v7;
}

- (void)setStewieSequenceNumber:(int64_t)a3
{
  char v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    int v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  int64_t v7 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKey:@"stsn"];

  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)setStewieConversationID:(int64_t)a3
{
  char v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    int v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  int64_t v7 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKey:@"stid"];

  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (NSUUID)stewieConversationUUID
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (v4)
  {
    char v5 = [(IMMessageItem *)self messageSummaryInfo];
    int v6 = [v5 objectForKeyedSubscript:@"stcuuid"];

    if ([v6 length]) {
      int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return (NSUUID *)v7;
}

- (void)setStewieConversationUUID:(id)a3
{
  id v10 = a3;
  int v4 = +[IMFeatureFlags sharedFeatureFlags];
  int v5 = [v4 stewieEnabled];

  if (v5)
  {
    int v6 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v6 count])
    {
      int64_t v7 = [(IMMessageItem *)self messageSummaryInfo];
      id v8 = (id)[v7 mutableCopy];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    uint64_t v9 = [v10 UUIDString];
    [v8 setObject:v9 forKeyedSubscript:@"stcuuid"];

    [(IMMessageItem *)self setMessageSummaryInfo:v8];
  }
}

- (int64_t)transcriptSharingMessageType
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (!v4) {
    return 0;
  }
  int v5 = [(IMMessageItem *)self messageSummaryInfo];
  int v6 = [v5 objectForKey:@"tsmt"];

  if (!v6 || [v6 integerValue] < 0) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = [v6 integerValue];
  }

  return v7;
}

- (void)setTranscriptSharingMessageType:(int64_t)a3
{
  int v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isTranscriptSharingEnabled];

  if (v6)
  {
    int64_t v7 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v7 count])
    {
      id v8 = [(IMMessageItem *)self messageSummaryInfo];
      id v10 = (id)[v8 mutableCopy];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    uint64_t v9 = [NSNumber numberWithInteger:a3];
    [v10 setValue:v9 forKey:@"tsmt"];

    [(IMMessageItem *)self setMessageSummaryInfo:v10];
  }
}

- (BOOL)isInitialTranscriptSharingItem
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (!v4) {
    return 0;
  }
  int v5 = [(IMMessageItem *)self messageSummaryInfo];
  int v6 = [v5 objectForKey:@"tsfirstitem"];

  if (!v6) {
    return 0;
  }
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setInitialTranscriptSharingItem:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isTranscriptSharingEnabled];

  if (v6)
  {
    char v7 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v7 count])
    {
      id v8 = [(IMMessageItem *)self messageSummaryInfo];
      id v10 = (id)[v8 mutableCopy];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    uint64_t v9 = [NSNumber numberWithBool:v3];
    [v10 setValue:v9 forKey:@"tsfirstitem"];

    [(IMMessageItem *)self setMessageSummaryInfo:v10];
  }
}

- (BOOL)isPendingSatelliteSend
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4) {
    return (BYTE5(self->_flags) >> 1) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setIsPendingSatelliteSend:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (v6)
  {
    uint64_t v7 = 0x20000000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    self->_unint64_t flags = self->_flags & 0xFFFFFDFFFFFFFFFFLL | v7;
  }
}

- (BOOL)needsRelay
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4) {
    return (BYTE5(self->_flags) >> 2) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setNeedsRelay:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (v6)
  {
    uint64_t v7 = 0x40000000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    self->_unint64_t flags = self->_flags & 0xFFFFFBFFFFFFFFFFLL | v7;
  }
}

- (BOOL)sentOrReceivedOffGrid
{
  BOOL v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (v4) {
    return (BYTE5(self->_flags) >> 3) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setSentOrReceivedOffGrid:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[IMFeatureFlags sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (v6)
  {
    uint64_t v7 = 0x80000000000;
    if (!v3) {
      uint64_t v7 = 0;
    }
    self->_unint64_t flags = self->_flags & 0xFFFFF7FFFFFFFFFFLL | v7;
  }
}

- (NSArray)replicatedFallbackGUIDs
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:@"rfgs"];

  return (NSArray *)v3;
}

- (void)setReplicatedFallbackGUIDs:(id)a3
{
  id v7 = a3;
  int v4 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v5 = (void *)[v4 mutableCopy];

  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"rfgs"];
  }
  else {
    [v5 removeObjectForKey:@"rfgs"];
  }
  int v6 = (void *)[v5 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v6];
}

- (BOOL)isKeyTransparencyVerifiedMessage
{
  return (BYTE4(self->_flags) >> 5) & 1;
}

- (void)setIsKeyTransparencyVerifiedMessage:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (NSAttributedString)translatedText
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"trt"];

  return (NSAttributedString *)v3;
}

- (NSString)detectedLanguage
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"lang"];

  return (NSString *)v3;
}

- (BOOL)shouldSendPartIndexesInMessageBody
{
  uint64_t v3 = [(IMMessageItem *)self body];
  unint64_t v4 = objc_msgSend(v3, "__im_countMessageParts");

  if (v4 > 1) {
    return 1;
  }
  BOOL v5 = [(IMMessageItem *)self editedPartIndexes];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  id v8 = [(IMMessageItem *)self retractedPartIndexes];
  BOOL v7 = [v8 count] != 0;

  return v7;
}

- (unint64_t)replyCountForPartIndex:(int64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  unint64_t v4 = [(IMMessageItem *)self replyCountsByPart];
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A07DBA44;
    v7[3] = &unk_1E5A11B20;
    v7[4] = &v8;
    void v7[5] = a3;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
  }
  unint64_t v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)needsRepeatForRelayReplication
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"nrr"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setNeedsRepeatForRelayReplication:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (v3) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = 0;
  }
  [v8 setObject:v7 forKeyedSubscript:@"nrr"];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (BOOL)isSatelliteMessageRetry
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"ismr"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSatelliteMessageRetry:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (v3) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v7 = 0;
  }
  [v8 setObject:v7 forKeyedSubscript:@"ismr"];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (unint64_t)expectedOffGridCapableDeliveries
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"eogcd"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setExpectedOffGridCapableDeliveries:(unint64_t)a3
{
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  if (a3)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 setObject:v7 forKeyedSubscript:@"eogcd"];
  }
  else
  {
    [v8 setObject:0 forKeyedSubscript:@"eogcd"];
  }
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (NSString)expectedServiceForCrossServiceReplacement
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"acsr"];

  return (NSString *)v3;
}

- (void)setExpectedServiceForCrossServiceReplacement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v7 = (id)[v6 mutableCopy];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  [v7 setObject:v4 forKeyedSubscript:@"acsr"];
  [(IMMessageItem *)self setMessageSummaryInfo:v7];
}

- (id)criticalMessagingAppName
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"critical-messaging-app-name"];

  return v3;
}

- (void)setCriticalMessagingAppName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v7 = (id)[v6 mutableCopy];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  [v7 setObject:v4 forKeyedSubscript:@"critical-messaging-app-name"];
  [(IMMessageItem *)self setMessageSummaryInfo:v7];
}

- (NSDate)scheduledMessageLastModifiedTime
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"smlmt"];

  return (NSDate *)v3;
}

- (void)setScheduledMessageLastModifiedTime:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v5 count])
    {
      uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
      id v7 = (id)[v6 mutableCopy];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    [v7 setObject:v4 forKeyedSubscript:@"smlmt"];
    [(IMMessageItem *)self setMessageSummaryInfo:v7];
  }
}

- (NSArray)scheduledMessageOriginalTransferGUIDs
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"smotg"];

  return (NSArray *)v3;
}

- (void)setScheduledMessageOriginalTransferGUIDs:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v5 count])
    {
      uint64_t v6 = [(IMMessageItem *)self messageSummaryInfo];
      id v7 = (id)[v6 mutableCopy];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    [v7 setObject:v4 forKeyedSubscript:@"smotg"];
    [(IMMessageItem *)self setMessageSummaryInfo:v7];
  }
}

- (NSDictionary)messageSummaryInfoForSending
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (qword_1E94FE988 != -1) {
    dispatch_once(&qword_1E94FE988, &unk_1EF2C1118);
  }
  id v4 = (id)qword_1E94FE9F0;
  unint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A07DC39C;
  v11[3] = &unk_1E5A11B48;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = v13;
  uint64_t v9 = (NSDictionary *)v6;

  return v9;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)MEMORY[0x1E4F28D60];
  id v9 = a3;
  uint64_t v10 = [v8 indexSetWithIndex:a4];
  uint64_t v11 = [a1 editedMessageItemWithOriginalMessageItem:v9 retractedPartIndexes:v10 shouldRetractSubject:v5];

  return v11;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 retractedPartIndexes:(id)a4 shouldRetractSubject:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 body];
  if (!v9)
  {
    uint64_t v10 = [v7 plainBody];
    uint64_t v11 = (void *)v10;
    id v12 = &stru_1EF2CAD28;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    id v13 = v12;

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1A07777FC;
  BOOL v30 = sub_1A07776E4;
  id v31 = 0;
  id v14 = v9;
  double v15 = 0;
  id v31 = v14;
  if (!a5)
  {
    double v15 = [v7 subject];
  }
  id v16 = objc_msgSend(v7, "copyWithFlags:", objc_msgSend(v7, "flags"));
  objc_msgSend(v16, "_setMessageID:", objc_msgSend(v7, "messageID"));
  [v16 setPlainBody:0];
  [v16 setSubject:v15];
  [v16 setSortID:0];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = sub_1A07DC6F0;
  id v23 = &unk_1E5A11B70;
  id v25 = &v26;
  id v17 = v16;
  id v24 = v17;
  [v8 enumerateIndexesUsingBlock:&v20];
  id v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime", v20, v21, v22, v23);
  [v17 setDateEdited:v18];

  [v17 setBody:v27[5]];
  _Block_object_dispose(&v26, 8);

  return v17;
}

+ (id)editedMessageItemWithOriginalMessageItem:(id)a3 editedPartIndex:(int64_t)a4 newPartText:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 body];
  if (!v9)
  {
    uint64_t v10 = [v7 plainBody];
    uint64_t v11 = (void *)v10;
    id v12 = &stru_1EF2CAD28;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    id v13 = v12;

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
  }
  if (a4 == -1)
  {
    id v14 = [v8 string];
    id v15 = v9;
  }
  else
  {
    id v14 = [v7 subject];
    objc_msgSend(v9, "__im_messageTextByReplacingMessagePartIndex:withNewPartText:", a4, v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v15;
  id v17 = objc_msgSend(v7, "copyWithFlags:", objc_msgSend(v7, "flags"));
  objc_msgSend(v17, "_setMessageID:", objc_msgSend(v7, "messageID"));
  [v17 setBody:v16];
  [v17 setPlainBody:0];
  [v17 setSubject:v14];
  id v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
  [v17 setDateEdited:v18];

  [v17 addEditedPartIndex:a4];
  [v17 setSortID:0];

  return v17;
}

- (NSIndexSet)editedPartIndexes
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  id v3 = [v2 objectForKey:@"ep"];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F28D60], "__im_indexSetFromNumberArray:", v3);
  }
  else {
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (void)setEditedPartIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v9 = (id)[v6 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  id v7 = objc_msgSend(v4, "__im_numberArray");

  [v9 setObject:v7 forKey:@"ep"];
  id v8 = (void *)[v9 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)addEditedPartIndex:(int64_t)a3
{
  id v7 = [(IMMessageItem *)self editedPartIndexes];
  BOOL v5 = (void *)[v7 mutableCopy];
  [v5 addIndex:a3];
  id v6 = (void *)[v5 copy];
  [(IMMessageItem *)self setEditedPartIndexes:v6];
}

- (NSIndexSet)retractedPartIndexes
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  id v3 = [v2 objectForKey:@"rp"];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F28D60], "__im_indexSetFromNumberArray:", v3);
  }
  else {
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (void)setRetractedPartIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v9 = (id)[v6 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  id v7 = objc_msgSend(v4, "__im_numberArray");

  [v9 setObject:v7 forKey:@"rp"];
  id v8 = (void *)[v9 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)addRetractedPartIndex:(int64_t)a3
{
  id v7 = [(IMMessageItem *)self retractedPartIndexes];
  BOOL v5 = (void *)[v7 mutableCopy];
  [v5 addIndex:a3];
  id v6 = (void *)[v5 copy];
  [(IMMessageItem *)self setRetractedPartIndexes:v6];
}

- (NSIndexSet)failedEditPartIndexes
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  id v3 = [v2 objectForKey:@"edfp"];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F28D60], "__im_indexSetFromNumberArray:", v3);
  }
  else {
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (void)setFailedEditPartIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v9 = (id)[v6 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  id v7 = objc_msgSend(v4, "__im_numberArray");

  [v9 setObject:v7 forKey:@"edfp"];
  id v8 = (void *)[v9 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)addFailedEditPartIndex:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(IMItem *)self guid];
      int v10 = 134218242;
      int64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Adding failed edit part index %ld to message %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = [(IMMessageItem *)self failedEditPartIndexes];
  id v8 = (void *)[v7 mutableCopy];
  [v8 addIndex:a3];
  id v9 = (void *)[v8 copy];
  [(IMMessageItem *)self setFailedEditPartIndexes:v9];
}

- (NSIndexSet)failedRetractPartIndexes
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  id v3 = [v2 objectForKey:@"rdfp"];

  if (v3) {
    objc_msgSend(MEMORY[0x1E4F28D60], "__im_indexSetFromNumberArray:", v3);
  }
  else {
  id v4 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return (NSIndexSet *)v4;
}

- (void)setFailedRetractPartIndexes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v9 = (id)[v6 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  id v7 = objc_msgSend(v4, "__im_numberArray");

  [v9 setObject:v7 forKey:@"rdfp"];
  id v8 = (void *)[v9 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)addFailedRetractPartIndex:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(IMItem *)self guid];
      int v10 = 134218242;
      int64_t v11 = a3;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Adding failed retract part index %ld to message %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = [(IMMessageItem *)self failedRetractPartIndexes];
  id v8 = (void *)[v7 mutableCopy];
  [v8 addIndex:a3];
  id v9 = (void *)[v8 copy];
  [(IMMessageItem *)self setFailedRetractPartIndexes:v9];
}

- (id)historyForMessagePart:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v5 = [v4 _dictionaryForKey:@"ec"];

  if ([v5 count])
  {
    id v6 = [NSNumber numberWithInteger:a3];
    id v7 = [v6 stringValue];

    id v8 = [v5 _arrayForKey:v7];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = [IMMessagePartHistoricalContent alloc];
            id v17 = -[IMMessagePartHistoricalContent initWithMessageSummaryInfoDictionary:](v16, "initWithMessageSummaryInfoDictionary:", v15, (void)v20);
            if (v17) {
              [v9 addObject:v17];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    id v18 = (void *)[v9 copy];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

- (void)setHistory:(id)a3 forMessagePart:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "messageSummaryInfoDictionaryRepresentation", (void)v29);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];
  uint64_t v15 = [(IMMessageItem *)self messageSummaryInfo];
  id v16 = (void *)[v15 mutableCopy];
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v19 = v18;

  long long v20 = [v19 _dictionaryForKey:@"ec"];
  long long v21 = (void *)[v20 mutableCopy];
  long long v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v24 = v23;

  uint64_t v25 = [NSNumber numberWithInteger:a4];
  uint64_t v26 = [v25 stringValue];

  if ([v14 count]) {
    [v24 setObject:v14 forKey:v26];
  }
  else {
    [v24 removeObjectForKey:v26];
  }
  uint64_t v27 = objc_msgSend(v24, "copy", (void)v29);
  if ([v27 count]) {
    [v19 setObject:v27 forKey:@"ec"];
  }
  else {
    [v19 removeObjectForKey:@"ec"];
  }
  uint64_t v28 = (void *)[v19 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v28];
}

- (NSDictionary)originalTextRangesByPartIndex
{
  id v3 = [(IMMessageItem *)self messageSummaryInfo];
  id v4 = [v3 objectForKey:@"otr"];

  if ([v4 count])
  {
    BOOL v5 = [(IMMessageItem *)self _partRangeByIndexFromPlistSerializable:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (void)setOriginalTextRangesByPartIndex:(id)a3
{
  id v8 = [(IMMessageItem *)self _partRangeByIndexToPlistSerializable:a3];
  id v4 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v4 count])
  {
    BOOL v5 = [(IMMessageItem *)self messageSummaryInfo];
    id v6 = (id)[v5 mutableCopy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  [v6 setObject:v8 forKey:@"otr"];
  id v7 = (void *)[v6 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v7];
}

- (id)_partRangeByIndexToPlistSerializable:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = sub_1A07DD8B0;
  v9[3] = &unk_1E5A11B98;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];

  return v7;
}

- (id)_partRangeByIndexFromPlistSerializable:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = sub_1A07DDA98;
  v9[3] = &unk_1E5A11BC0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];

  return v7;
}

- (NSArray)editUnsupportedByHandleIDs
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"euh"];
  id v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  return (NSArray *)v6;
}

- (BOOL)hasEditedParts
{
  v2 = [(IMMessageItem *)self dateEdited];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFullyRetracted
{
  BOOL v3 = [(IMMessageItem *)self dateEdited];

  if (!v3) {
    return 0;
  }
  id v4 = [(IMMessageItem *)self body];
  uint64_t v5 = objc_msgSend(v4, "__im_countMessageParts");

  if (v5 > 0) {
    return 0;
  }
  id v7 = [(IMMessageItem *)self subject];
  BOOL v6 = [v7 length] == 0;

  return v6;
}

- (unint64_t)eligibilityForEditType:(unint64_t)a3 messagePartIndex:(int64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([(IMMessageItem *)self isFromMe])
  {
    if ([(IMMessageItem *)self isSent])
    {
      id v7 = +[IMFeatureFlags sharedFeatureFlags];
      int v8 = [v7 isPriusEnabled];

      if (v8)
      {
        if (a3 == 2)
        {
          uint64_t v9 = [(IMItem *)self service];
          char v10 = [v9 isEqualToString:IMServiceNameiMessage[0]];

          if ((v10 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v11 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                LOWORD(v44) = 0;
                _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Message cannot be edited, message service is not iMessage", (uint8_t *)&v44, 2u);
              }
LABEL_45:

              return 2;
            }
            return 2;
          }
        }
      }
      else
      {
        uint64_t v15 = [(IMItem *)self service];
        int v16 = [v15 isEqualToString:IMServiceNameiMessage[0]];

        if ((v16 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Message cannot be edited, message service is not iMessage", (uint8_t *)&v44, 2u);
            }
            goto LABEL_45;
          }
          return 2;
        }
      }
      id v17 = [(IMItem *)self handle];
      if ([v17 length] && MEMORY[0x1A62278A0](v17))
      {
        if (IMOSLoggingEnabled())
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Message cannot be edited, message is in a business chat", (uint8_t *)&v44, 2u);
          }
        }
        unint64_t v13 = 2;
        goto LABEL_67;
      }
      id v19 = +[IMFeatureFlags sharedFeatureFlags];
      int v20 = [v19 isScheduledMessagesCoreEnabled];

      if (v20)
      {
        if ([(IMMessageItem *)self scheduleType] == 2)
        {
          unint64_t v21 = [(IMMessageItem *)self scheduleState] - 1;
          if (v21 < 5 && ((0x1Du >> v21) & 1) != 0)
          {
            unint64_t v13 = qword_1A0A07930[v21];
            goto LABEL_67;
          }
        }
      }
      long long v22 = [(IMItem *)self time];
      id v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
      [v23 timeIntervalSinceDate:v22];
      double v25 = v24;
      [(IMMessageItem *)self _timeoutIntervalForEditType:a3];
      if (v25 >= v26)
      {
        double v32 = v26;
        if (IMOSLoggingEnabled())
        {
          objc_super v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            int v44 = 134218754;
            uint64_t v45 = (uint64_t)v25;
            __int16 v46 = 2048;
            uint64_t v47 = (uint64_t)v32;
            __int16 v48 = 2112;
            id v49 = v22;
            __int16 v50 = 2112;
            v51 = v23;
            _os_log_impl(&dword_1A0772000, v33, OS_LOG_TYPE_INFO, "Message cannot be edited, message was sent %ld seconds ago, which is greater than timeout of %ld seconds. Sent: %@ Now: %@", (uint8_t *)&v44, 0x2Au);
          }
        }
        unint64_t v13 = 3;
        goto LABEL_66;
      }
      uint64_t v27 = [(IMItem *)self balloonBundleID];
      if ([v27 length])
      {
        if (a3 != 2)
        {
          if (IMOSLoggingEnabled())
          {
            long long v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "Message cannot be edited, message is a balloon plugin message", (uint8_t *)&v44, 2u);
            }
            goto LABEL_63;
          }
LABEL_64:
          unint64_t v13 = 4;
          goto LABEL_65;
        }
        char v28 = [v27 isEqualToString:@"com.apple.messages.URLBalloonProvider"];
        char v29 = [v27 isEqualToString:@"com.apple.DigitalTouchBalloonProvider"];
        char v30 = [v27 isEqualToString:@"com.apple.Jellyfish.Animoji"];
        if ((v28 & 1) == 0 && (v29 & 1) == 0 && (v30 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "Message cannot be retracted, message is a balloon plugin message", (uint8_t *)&v44, 2u);
            }
LABEL_63:

            goto LABEL_64;
          }
          goto LABEL_64;
        }
      }
      uint64_t v34 = [(IMMessageItem *)self messageSummaryInfo];
      uint64_t v35 = [v34 objectForKey:@"amab"];

      if (([v35 containsString:@"com.apple.PassbookUIService.PeerPaymentMessagesExtension"] & 1) != 0
        || [v35 containsString:@"com.apple.Passbook.PeerPaymentMessagesExtension"])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1A0772000, v36, OS_LOG_TYPE_INFO, "Message cannot be edited or retracted, message is a memo associated with an Apple Cash payment or request", (uint8_t *)&v44, 2u);
          }
        }
        unint64_t v13 = 4;
        goto LABEL_59;
      }
      if (a3 == 1)
      {
        char v38 = [(IMMessageItem *)self historyForMessagePart:a4];
        uint64_t v39 = [v38 count] - 1;
        [(IMMessageItem *)self _messageEditHistoryLimit];
        uint64_t v41 = (uint64_t)v40;
        if (v39 >= (uint64_t)v40)
        {
          if (IMOSLoggingEnabled())
          {
            id v43 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              int v44 = 134218240;
              uint64_t v45 = v39;
              __int16 v46 = 2048;
              uint64_t v47 = v41;
              _os_log_impl(&dword_1A0772000, v43, OS_LOG_TYPE_INFO, "Message cannot be edited, message has already been edited %ld times. Maximum is %ld edits.", (uint8_t *)&v44, 0x16u);
            }
          }
          unint64_t v13 = 5;
          goto LABEL_59;
        }

        if (!IMOSLoggingEnabled()) {
          goto LABEL_80;
        }
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "Message can be edited", (uint8_t *)&v44, 2u);
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_80:
          unint64_t v13 = 0;
LABEL_59:

LABEL_65:
LABEL_66:

LABEL_67:
          return v13;
        }
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "Message can be retracted", (uint8_t *)&v44, 2u);
        }
      }

      goto LABEL_80;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Message cannot be edited, message is currently sending", (uint8_t *)&v44, 2u);
      }
    }
    return 6;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v44) = 0;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Message cannot be edited, message is not from me", (uint8_t *)&v44, 2u);
      }
    }
    return 1;
  }
}

- (double)_timeoutIntervalForEditType:(unint64_t)a3
{
  if (a3 == 2)
  {
    MEMORY[0x1F4181798](self, sel__messageRetractionTimeout);
  }
  else if (a3 == 1)
  {
    MEMORY[0x1F4181798](self, sel__messageEditTimeout);
  }
  else
  {
    return 0.0;
  }
  return result;
}

- (double)_messageEditTimeout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"message-edit-timeout"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 doubleValue], v4 > 0.0))
  {
    double v5 = v4;
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218240;
        uint64_t v9 = (uint64_t)v5;
        __int16 v10 = 2048;
        uint64_t v11 = (uint64_t)900.0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Server bag override for message edit timeout. Server: %ld Default: %ld", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    double v5 = 900.0;
  }

  return v5;
}

- (double)_messageEditHistoryLimit
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"message-edit-history-limit"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int v4 = [v3 intValue], v4 >= 1))
  {
    uint64_t v5 = v4;
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [NSNumber numberWithInteger:v5];
        int v8 = [NSNumber numberWithInteger:5];
        int v10 = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        unint64_t v13 = v8;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Server bag override for message edit history limit. Server: %@ Default: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v5 = 5;
  }

  return (double)v5;
}

- (double)_messageRetractionTimeout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  BOOL v3 = [v2 objectForKey:@"message-retraction-timeout"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 doubleValue], v4 > 0.0))
  {
    double v5 = v4;
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 134218240;
        uint64_t v9 = (uint64_t)v5;
        __int16 v10 = 2048;
        uint64_t v11 = (uint64_t)120.0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Server bag override for message retraction timeout. Server: %ld Default: %ld", (uint8_t *)&v8, 0x16u);
      }
    }
  }
  else
  {
    double v5 = 120.0;
  }

  return v5;
}

- (BOOL)canRetryFailedRetraction
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMItem *)self time];
  double v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;
  [(IMMessageItem *)self _timeoutIntervalForEditType:2];
  double v8 = v7;
  if (v6 >= v7 && IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218754;
      uint64_t v12 = (uint64_t)v6;
      __int16 v13 = 2048;
      uint64_t v14 = (uint64_t)120.0;
      __int16 v15 = 2112;
      int v16 = v3;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Cannot retry retraction, message was sent %ld seconds ago, which is greater than timeout of %ld seconds. Sent: %@ Now: %@", (uint8_t *)&v11, 0x2Au);
    }
  }
  return v6 < v8;
}

- (BOOL)hasUnseenMention
{
  return (BYTE3(self->_flags) >> 4) & 1;
}

- (void)setHasUnseenMention:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (void)setHasDataDetectorResults:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMMessageItem *)self hasDataDetectorResults] != a3)
  {
    uint64_t v5 = 0x10000;
    if (!v3) {
      uint64_t v5 = 0;
    }
    self->_unint64_t flags = self->_flags & 0xFFFFFFFFFFFEFFFFLL | v5;
  }
}

- (BOOL)wasDataDetected
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)containsRichLink
{
  v2 = [(IMMessageItem *)self body];
  uint64_t v3 = [v2 length];
  BOOL v4 = v2 && (objc_msgSend(v2, "attribute:existsInRange:", *MEMORY[0x1E4F6C1D0], 0, v3) & 1) != 0;

  return v4;
}

- (NSArray)richLinkURLs
{
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1A07777FC;
  __int16 v13 = sub_1A07776E4;
  id v14 = 0;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(IMMessageItem *)self body];
  uint64_t v4 = [v3 length];
  uint64_t v5 = *MEMORY[0x1E4F6C1D0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A07DEDB4;
  v8[3] = &unk_1E5A11BE8;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  double v6 = (void *)[(id)v10[5] copy];

  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (NSString)swyAppName
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"swyan"];

  return (NSString *)v3;
}

- (void)setSwyAppName:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    uint64_t v4 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v4 count])
    {
      uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
      id v6 = (id)[v5 mutableCopy];
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    [v6 setObject:v7 forKey:@"swyan"];
    [(IMMessageItem *)self setMessageSummaryInfo:v6];
  }
}

- (NSString)swyBundleID
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"swybid"];

  return (NSString *)v3;
}

- (void)setSwyBundleID:(id)a3
{
  id v7 = a3;
  if ([v7 length])
  {
    uint64_t v4 = [(IMMessageItem *)self messageSummaryInfo];
    if ([v4 count])
    {
      uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
      id v6 = (id)[v5 mutableCopy];
    }
    else
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }

    [v6 setObject:v7 forKey:@"swybid"];
    [(IMMessageItem *)self setMessageSummaryInfo:v6];
  }
}

- (void)setWasDataDetected:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_unint64_t flags = self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (NSString)originalUnformattedID
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"oui"];

  return (NSString *)v3;
}

- (void)setOriginalUnformattedID:(id)a3
{
  id v11 = a3;
  if (v11
    || ([(IMMessageItem *)self originalUnformattedID],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
    id v6 = (void *)[v5 mutableCopy];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v9 = v8;

    if (v11) {
      [v9 setObject:v11 forKeyedSubscript:@"oui"];
    }
    else {
      [v9 removeObjectForKey:@"oui"];
    }
    __int16 v10 = (void *)[v9 copy];
    [(IMMessageItem *)self setMessageSummaryInfo:v10];
  }
}

- (NSString)originalServiceName
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"osn"];

  return (NSString *)v3;
}

- (void)setOriginalServiceName:(id)a3
{
  id v13 = a3;
  id v4 = [(IMMessageItem *)self originalServiceName];
  uint64_t v5 = v13;
  if (v4 != v13)
  {
    id v6 = [(IMMessageItem *)self originalServiceName];
    char v7 = [v6 isEqualToString:v13];

    if (v7) {
      goto LABEL_11;
    }
    id v8 = [(IMMessageItem *)self messageSummaryInfo];
    uint64_t v9 = (void *)[v8 mutableCopy];
    __int16 v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v5 = v11;

    if (v13) {
      [v5 setObject:v13 forKeyedSubscript:@"osn"];
    }
    else {
      [v5 removeObjectForKey:@"osn"];
    }
    uint64_t v12 = (void *)[v5 copy];
    [(IMMessageItem *)self setMessageSummaryInfo:v12];
  }
LABEL_11:
}

- (BOOL)wasInterworked
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"i"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setWasInterworked:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMMessageItem *)self wasInterworked] != a3)
  {
    uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
    id v6 = (void *)[v5 mutableCopy];
    char v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v11 = v8;

    if (v3)
    {
      uint64_t v9 = [NSNumber numberWithBool:1];
      [v11 setObject:v9 forKeyedSubscript:@"i"];
    }
    else
    {
      [v11 removeObjectForKey:@"i"];
    }
    __int16 v10 = (void *)[v11 copy];
    [(IMMessageItem *)self setMessageSummaryInfo:v10];
  }
}

- (void)setCMMStateToRegisteredAndAssetOffsetTo:(unint64_t)a3
{
  uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v9 = (id)[v6 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  char v7 = [NSNumber numberWithUnsignedInteger:1];
  [v9 setObject:v7 forKey:@"cmmS\x10"];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 setObject:v8 forKey:@"cmmAO"];

  [(IMMessageItem *)self setMessageSummaryInfo:v9];
}

- (unint64_t)getCMMState
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"cmmS\x10"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setCMMState:(unint64_t)a3
{
  uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  char v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKey:@"cmmS\x10"];

  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (void)setCMMAssetOffset:(unint64_t)a3
{
  uint64_t v5 = [(IMMessageItem *)self messageSummaryInfo];
  if ([v5 count])
  {
    id v6 = [(IMMessageItem *)self messageSummaryInfo];
    id v8 = (id)[v6 mutableCopy];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  char v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v7 forKey:@"cmmAO"];

  [(IMMessageItem *)self setMessageSummaryInfo:v8];
}

- (unint64_t)getCMMAssetOffset
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"cmmAO"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)_updateFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (void)setFlags:(unint64_t)a3
{
}

- (void)_regenerateBodyData
{
  bodyData = self->_bodyData;
  self->_bodyData = 0;

  if ([(NSAttributedString *)self->_body length])
  {
    unint64_t v4 = (void *)MEMORY[0x1A6228190]();
    JWEncodeCodableObject();
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_bodyData;
    self->_bodyData = v5;
  }
}

- (void)_clearBodyData
{
  self->_bodyData = 0;
  MEMORY[0x1F41817F8]();
}

- (void)setBody:(id)a3
{
  uint64_t v5 = (NSAttributedString *)a3;
  p_body = &self->_body;
  if (self->_body != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_body, a3);
    [(IMMessageItem *)self _clearBodyData];
    [(IMMessageItem *)self _recalculatePartCount];
    p_body = (NSAttributedString **)[(IMMessageItem *)self adjustIsEmptyFlag];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_body, v5);
}

- (void)setPlainBody:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_plainBody = &self->_plainBody;
  if (self->_plainBody != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_plainBody, a3);
    p_plainBody = (NSString **)[(IMMessageItem *)self _recalculatePartCount];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_plainBody, v5);
}

- (void)eraseMessageContent
{
  body = self->_body;
  self->_body = 0;

  plainBody = self->_plainBody;
  self->_plainBody = 0;

  subject = self->_subject;
  self->_subject = 0;

  [(IMMessageItem *)self _clearBodyData];
  self->_flags &= ~8uLL;
  self->_partCount = 0;
}

- (NSAttributedString)breadcrumbText
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v2 = [(IMMessageItem *)self body];
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_1A07777FC;
  id v23 = sub_1A07776E4;
  id v24 = 0;
  uint64_t v3 = [v2 length];
  uint64_t v4 = *MEMORY[0x1E4F6C138];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1A07DFD8C;
  v18[3] = &unk_1E5A10628;
  v18[4] = &v19;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v3, 0x100000, v18);
  if (v20[5])
  {
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v17 = 0;
    uint64_t v5 = [v2 length];
    uint64_t v6 = *MEMORY[0x1E4F6C140];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A07DFE04;
    v13[3] = &unk_1E5A10628;
    v13[4] = &v14;
    objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0x100000, v13);
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v8 = v20[5];
    uint64_t v25 = v6;
    id v9 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v15 + 6)];
    v26[0] = v9;
    __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v11 = (void *)[v7 initWithString:v8 attributes:v10];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return (NSAttributedString *)v11;
}

- (id)description
{
  if (qword_1EB4A6240 != -1) {
    dispatch_once(&qword_1EB4A6240, &unk_1EF2BF340);
  }
  v84 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v94 = NSStringFromClass(v3);
  uint64_t v4 = @"YES";
  if ([(IMMessageItem *)self isFromMe]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  v82 = v5;
  v93 = [(IMMessageItem *)self sender];
  v92 = [(IMItem *)self service];
  v91 = [(IMItem *)self handle];
  v90 = [(IMItem *)self destinationCallerID];
  v89 = [(IMItem *)self unformattedID];
  v88 = [(IMItem *)self countryCode];
  uint64_t v6 = [(IMItem *)self roomName];
  unint64_t flags = self->_flags;
  v80 = (void *)v6;
  v78 = off_1EB4A6238(self->_subject);
  id v7 = (void (*)(void))off_1EB4A6238;
  v83 = [(NSAttributedString *)self->_body string];
  v77 = v7();
  int64_t v76 = [(IMItem *)self messageID];
  v87 = [(IMItem *)self guid];
  v75 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMItem sortID](self, "sortID"));
  v81 = [(IMItem *)self time];
  [v81 timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;
  [(NSDate *)self->_timeDelivered timeIntervalSinceReferenceDate];
  uint64_t v11 = v10;
  [(NSDate *)self->_timeRead timeIntervalSinceReferenceDate];
  uint64_t v13 = v12;
  [(NSDate *)self->_timePlayed timeIntervalSinceReferenceDate];
  uint64_t v15 = v14;
  fileTransferGUIDs = self->_fileTransferGUIDs;
  if ([(IMMessageItem *)self isEmpty]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  v73 = v16;
  if ([(IMMessageItem *)self isFinished]) {
    int v17 = @"YES";
  }
  else {
    int v17 = @"NO";
  }
  objc_super v72 = v17;
  if ([(IMMessageItem *)self isSent]) {
    id v18 = @"YES";
  }
  else {
    id v18 = @"NO";
  }
  v71 = v18;
  if ([(IMMessageItem *)self isRead]) {
    uint64_t v19 = @"YES";
  }
  else {
    uint64_t v19 = @"NO";
  }
  double v70 = v19;
  if ([(IMMessageItem *)self isDelivered]) {
    int v20 = @"YES";
  }
  else {
    int v20 = @"NO";
  }
  v69 = v20;
  unint64_t v68 = [(IMMessageItem *)self scheduleType];
  unint64_t v67 = [(IMMessageItem *)self scheduleState];
  if ([(IMMessageItem *)self isAudioMessage]) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  objc_super v66 = v21;
  if ([(IMMessageItem *)self isPlayed]) {
    long long v22 = @"YES";
  }
  else {
    long long v22 = @"NO";
  }
  id v65 = v22;
  if ([(IMMessageItem *)self isFromMe]) {
    id v23 = @"YES";
  }
  else {
    id v23 = @"NO";
  }
  id v64 = v23;
  if ([(IMMessageItem *)self hasDataDetectorResults]) {
    id v24 = @"YES";
  }
  else {
    id v24 = @"NO";
  }
  id v63 = v24;
  if ([(IMMessageItem *)self wasDataDetected]) {
    uint64_t v25 = @"YES";
  }
  else {
    uint64_t v25 = @"NO";
  }
  id v62 = v25;
  if ([(IMMessageItem *)self wasDowngraded]) {
    double v26 = @"YES";
  }
  else {
    double v26 = @"NO";
  }
  id v61 = v26;
  if ([(IMMessageItem *)self isEmote]) {
    uint64_t v27 = @"YES";
  }
  else {
    uint64_t v27 = @"NO";
  }
  id v60 = v27;
  if ([(IMMessageItem *)self isExpirable]) {
    char v28 = @"YES";
  }
  else {
    char v28 = @"NO";
  }
  id v59 = v28;
  int64_t v58 = [(IMMessageItem *)self expireState];
  v86 = [(IMItem *)self balloonBundleID];
  id v57 = [(IMMessageItem *)self expressiveSendStyleID];
  long long v56 = [(IMMessageItem *)self timeExpressiveSendPlayed];
  long long v55 = [(IMMessageItem *)self bizIntent];
  v54 = [(IMMessageItem *)self locale];
  uint8_t v53 = [(IMMessageItem *)self biaReferenceID];
  uint64_t v52 = [(IMMessageItem *)self errorCode];
  v51 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IMItem cloudKitSyncState](self, "cloudKitSyncState"));
  if ([(IMMessageItem *)self isCorrupt]) {
    char v29 = @"YES";
  }
  else {
    char v29 = @"NO";
  }
  __int16 v50 = v29;
  if ([(IMMessageItem *)self shouldSendMeCard]) {
    char v30 = @"YES";
  }
  else {
    char v30 = @"NO";
  }
  id v49 = v30;
  if ([(IMMessageItem *)self isSpam]) {
    long long v31 = @"YES";
  }
  else {
    long long v31 = @"NO";
  }
  __int16 v48 = v31;
  if ([(IMMessageItem *)self hasUnseenMention]) {
    double v32 = @"YES";
  }
  else {
    double v32 = @"NO";
  }
  uint64_t v47 = v32;
  threadIdentifier = self->_threadIdentifier;
  threadOriginator = self->_threadOriginator;
  replyCountsByPart = self->_replyCountsByPart;
  if ([(IMMessageItem *)self isStewie]) {
    objc_super v33 = @"YES";
  }
  else {
    objc_super v33 = @"NO";
  }
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMMessageItem stewieConversationID](self, "stewieConversationID"));
  uint64_t v35 = [(NSArray *)self->_syndicationRanges componentsJoinedByString:@","];
  uint64_t v36 = [(NSArray *)self->_syncedSyndicationRanges componentsJoinedByString:@","];
  [(NSDate *)self->_dateEdited timeIntervalSinceReferenceDate];
  uint64_t v38 = v37;
  uint64_t v45 = [(IMMessageItem *)self groupActivity];
  if (v45) {
    uint64_t v39 = @"YES";
  }
  else {
    uint64_t v39 = @"NO";
  }
  if ([(IMMessageItem *)self wasDetonated]) {
    double v40 = @"YES";
  }
  else {
    double v40 = @"NO";
  }
  if ([(IMMessageItem *)self isSOS]) {
    uint64_t v41 = @"YES";
  }
  else {
    uint64_t v41 = @"NO";
  }
  if (![(IMMessageItem *)self isCritical]) {
    uint64_t v4 = @"NO";
  }
  [(NSString *)self->_fallbackHash length];
  objc_msgSend(v84, "stringWithFormat:", @"%@[outgoing: %@ sender=%@; service=%@; handle=%@; destinationCallerID= %@, unformatted=%@; country=%@; roomName='%@'; flags=0x%llx; subject='%@' text='%@' messageID: %lld GUID:'%@' sortID: %@ date:'%f' date-delivered:'%f' date-read:'%f' date-played:'%f' transfer guids: '%@' empty: %@ finished: %@ sent: %@ read: %@ delivered: %@ scheduleType: %lu, scheduleState: %lu, audio: %@ played: %@ from-me: %@ DD results: %@ DD Scanned: %@ Downgraded: %@ emote: %@ expirable: %@ expire-state: %d balloon-bundle-id: %@ expressive-send-style-id: %@ time-expressive-send-played: %@ bizIntent: %@ locale: %@ biaReferenceID: %@ error: %d sync-state %@ corrupt: %@ shouldSendMeCard: %@ isSpam: %@ hasUnseenMention: %@ threadIdentifier: %@, threadOriginator: %@, replyCountsByPart: %@, isChoros: %@, chorosConversationID: %@, syndicationRanges: %@, syncedSyndicationRanges: %@, dateEdited: '%f', hasGroupActivity: %@, wasDetonated: %@, isSOS: %@, isCritical %@, fallbackHash (len): %llu]",
    v94,
    v82,
    v93,
    v92,
    v91,
    v90,
    v89,
    v88,
    v80,
    flags,
    v78,
    v77,
    v76,
    v87,
    v75,
    v9,
    v11,
    v13,
    v15,
    fileTransferGUIDs,
    v73,
    v72,
    v71,
    v70,
    v69,
    v68,
    v67,
    v66,
    v65,
    v64,
    v63,
    v62,
    v61,
    v60,
    v59,
    v58,
    v86,
    v57,
    v56,
    v55,
    v54,
    v53,
    v52,
    v51,
    v50,
    v49,
    v48,
    v47,
    threadIdentifier,
    threadOriginator,
    replyCountsByPart,
    v33,
    v34,
    v35,
    v36,
    v38,
    v39,
    v40,
    v41,
  uint64_t v85 = v4);

  return v85;
}

- (BOOL)isFirstMessageCandidate
{
  return 1;
}

- (BOOL)unsentIsFromMeItem
{
  uint64_t v3 = +[IMFeatureFlags sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesCoreEnabled];

  if (v4)
  {
    BOOL v5 = [(IMMessageItem *)self isFromMe];
    if (v5)
    {
      unint64_t v6 = [(IMMessageItem *)self scheduleType];
      LOBYTE(v5) = (v6 >= 2
                 && (v6 != 2
                  || (unint64_t v7 = [(IMMessageItem *)self scheduleState], v7 > 5)
                  || ((1 << v7) & 0x39) == 0)
                 || ![(IMMessageItem *)self isSent])
                && [(IMMessageItem *)self errorCode] == 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IMMessageItem;
    LOBYTE(v5) = [(IMItem *)&v9 unsentIsFromMeItem];
  }
  return v5;
}

- (id)_localizedBackwardsCompatibleExpressiveSendText
{
  if ([(NSString *)self->_expressiveSendStyleID length])
  {
    if ([(NSString *)self->_expressiveSendStyleID isEqualToString:@"com.apple.MobileSMS.expressivesend.invisibleink"])
    {
      uint64_t v3 = NSString;
      int v4 = IMSharedUtilitiesFrameworkBundle();
      BOOL v5 = v4;
      unint64_t v6 = @"IMPACT_INVISIBLE";
LABEL_4:
      unint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
      uint64_t v8 = objc_msgSend(v3, "localizedStringWithFormat:", v7, 0);
      goto LABEL_5;
    }
    uint64_t v9 = [(NSString *)self->_expressiveSendStyleID rangeOfString:@"com.apple.MobileSMS.expressivesend"];
    if (v10)
    {
      unint64_t v11 = v9 + v10 + 1;
      if (v11 < [(NSString *)self->_expressiveSendStyleID length])
      {
        BOOL v5 = [(NSString *)self->_expressiveSendStyleID substringFromIndex:v11];
        if ([v5 isEqualToString:@"gentle"])
        {
          uint64_t v12 = NSString;
          uint64_t v13 = IMSharedUtilitiesFrameworkBundle();
          unint64_t v7 = v13;
          uint64_t v14 = @"IMPACT_GENTLE";
        }
        else if ([v5 isEqualToString:@"loud"])
        {
          uint64_t v12 = NSString;
          uint64_t v13 = IMSharedUtilitiesFrameworkBundle();
          unint64_t v7 = v13;
          uint64_t v14 = @"IMPACT_LOUD";
        }
        else
        {
          if (![v5 isEqualToString:@"impact"])
          {
            uint64_t v8 = 0;
            goto LABEL_6;
          }
          uint64_t v12 = NSString;
          uint64_t v13 = IMSharedUtilitiesFrameworkBundle();
          unint64_t v7 = v13;
          uint64_t v14 = @"IMPACT_IMPACT";
        }
        uint64_t v16 = [v13 localizedStringForKey:v14 value:&stru_1EF2CAD28 table:@"IMSharedUtilities"];
        uint64_t v8 = objc_msgSend(v12, "localizedStringWithFormat:", v16, 0);

LABEL_5:
LABEL_6:

        goto LABEL_37;
      }
    }
    else
    {
      [(NSString *)self->_expressiveSendStyleID rangeOfString:@"com.apple.messages.effect"];
      if (v15)
      {
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKConfettiEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_CONFETTI";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKHappyBirthdayEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_BALLOONS";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKLasersEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_LASERS";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKFireworksEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_FIREWORKS";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKShootingStarEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_SHOOTING_STAR";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKSparklesEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_CELEBRATION";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKHeartEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_LOVE";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKEchoEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_ECHO";
          goto LABEL_4;
        }
        if ([(NSString *)self->_expressiveSendStyleID hasSuffix:@"CKSpotlightEffect"])
        {
          uint64_t v3 = NSString;
          int v4 = IMSharedUtilitiesFrameworkBundle();
          BOOL v5 = v4;
          unint64_t v6 = @"FSM_SENT_WITH_SPOTLIGHT";
          goto LABEL_4;
        }
      }
    }
  }
  uint64_t v8 = 0;
LABEL_37:

  return v8;
}

- (BOOL)isDeviceActionMessage
{
  v2 = [(IMMessageItem *)self messageSummaryInfo];
  uint64_t v3 = [v2 objectForKey:@"dam"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)_messageItemWithIndexesDeleted:(id)a3 subRangesToDeleteMapping:(id)a4 deleteSubject:(BOOL)a5 deleteTransferCallback:(id)a6 createItemCallback:(id)a7 fromMessageItem:(id)a8
{
  BOOL v11 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v44 = a6;
  id v49 = (void (**)(id, id, id, void, id))a7;
  id v15 = a8;
  uint64_t v16 = [v15 body];
  int v17 = (void *)[v16 mutableCopy];

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = *MEMORY[0x1E4F6C1F8];
  uint64_t v21 = [v17 length];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1A07E0F30;
  v56[3] = &unk_1E5A11C38;
  BOOL v47 = v11;
  BOOL v63 = v11;
  id v48 = v13;
  id v57 = v48;
  id v46 = v14;
  id v58 = v46;
  id v22 = v17;
  id v59 = v22;
  id v45 = v44;
  id v62 = v45;
  id v23 = v19;
  id v60 = v23;
  id v24 = v18;
  id v61 = v24;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v21, 0, v56);
  uint64_t v25 = [v24 sortedArrayUsingComparator:&unk_1EF2C10F8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v53 != v28) {
          objc_enumerationMutation(v25);
        }
        unint64_t v30 = [*(id *)(*((void *)&v52 + 1) + 8 * i) rangeValue];
        unint64_t v32 = v31;
        if (v30 < [v22 length])
        {
          uint64_t v33 = [v22 length];
          if (v32 >= v33 - v30 ? v33 - v30 : v32) {
            [v22 deleteCharactersInRange:v30];
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v27);
  }
  uint64_t v35 = [v15 fileTransferGUIDs];
  uint64_t v36 = (void *)[v35 mutableCopy];

  uint64_t v37 = *MEMORY[0x1E4F6C188];
  uint64_t v38 = [v22 length];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1A07E1374;
  v50[3] = &unk_1E5A11C80;
  id v39 = v36;
  id v51 = v39;
  objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v37, 0, v38, 0, v50);
  if ([v23 count]) {
    [v39 removeObjectsInArray:v23];
  }
  if (v49)
  {
    uint64_t v40 = ((void (**)(id, id, id, BOOL, id))v49)[2](v49, v15, v22, v47, v39);
  }
  else
  {
    uint64_t v40 = [a1 newMessageItemFrom:v15 withText:v22 deleteSubject:v47 withFileTransferGUIDs:v39];
  }
  uint64_t v41 = (void *)v40;

  return v41;
}

+ (id)newMessageItemFrom:(id)a3 withText:(id)a4 deleteSubject:(BOOL)a5 withFileTransferGUIDs:(id)a6
{
  id v9 = a3;
  id v36 = a6;
  id v35 = a4;
  uint64_t v34 = [IMMessageItem alloc];
  uint64_t v10 = [v9 senderInfo];
  BOOL v11 = [v9 time];
  BOOL v47 = [v9 timeRead];
  id v46 = [v9 timeDelivered];
  id v45 = [v9 timePlayed];
  id v48 = (void *)v10;
  if (a5)
  {
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v37 = [v9 subject];
  }
  uint64_t v33 = [v9 flags];
  id v42 = [v9 guid];
  uint64_t v32 = [v9 messageID];
  id v44 = [v9 account];
  uint64_t v40 = [v9 accountID];
  unint64_t v31 = [v9 service];
  id v43 = [v9 handle];
  uint64_t v41 = [v9 unformattedID];
  unint64_t v30 = [v9 countryCode];
  id v39 = [v9 balloonBundleID];
  char v29 = [v9 payloadData];
  uint64_t v38 = [v9 expressiveSendStyleID];
  uint64_t v27 = [v9 timeExpressiveSendPlayed];
  uint64_t v28 = [v9 bizIntent];
  uint64_t v26 = [v9 locale];
  uint64_t v25 = [v9 biaReferenceID];
  int v23 = [v9 errorCode];
  uint64_t v21 = [v9 type];
  id v24 = [v9 threadIdentifier];
  id v22 = [v9 syndicationRanges];
  uint64_t v12 = [v9 syncedSyndicationRanges];
  uint64_t v13 = [v9 partCount];
  id v14 = [v9 dateEdited];
  LODWORD(v20) = v23;
  id v15 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](v34, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:", v48, v11, v47, v46, v45, v37, v35, 0, 0, v36, v33, v42, v32, v44,
          v40,
          v31,
          v43,
          0,
          v41,
          v30,
          0,
          v39,
          v29,
          v38,
          v27,
          v28,
          v26,
          v25,
          v20,
          v21,
          v24,
          v22,
          v12,
          v13,
          v14,
          [v9 scheduleType],
          [v9 scheduleState]);

  if (!a5) {
  -[IMMessageItem setUseStandalone:](v15, "setUseStandalone:", [v9 useStandalone]);
  }
  uint64_t v16 = [v9 messageSummaryInfo];
  [(IMMessageItem *)v15 setMessageSummaryInfo:v16];

  -[IMItem setSortID:](v15, "setSortID:", [v9 sortID]);
  int v17 = [v9 replyCountsByPart];
  [(IMMessageItem *)v15 setReplyCountsByPart:v17];

  id v18 = [v9 fallbackHash];
  [(IMMessageItem *)v15 setFallbackHash:v18];

  return v15;
}

- (void)setErrorCode:(unsigned int)a3
{
  self->_unsigned int error = a3;
}

- (int64_t)replaceID
{
  return self->_replaceID;
}

- (void)setTimePlayed:(id)a3
{
}

- (int64_t)expireState
{
  return self->_expireState;
}

- (void)setExpireState:(int64_t)a3
{
  self->_int64_t expireState = a3;
}

- (NSData)contactsAvatarRecipeData
{
  return self->_contactsAvatarRecipeData;
}

- (void)setTimeExpressiveSendPlayed:(id)a3
{
}

- (void)setTypingIndicatorIcon:(id)a3
{
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)biaReferenceID
{
  return self->_biaReferenceID;
}

- (void)setDateEdited:(id)a3
{
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (NSString)fallbackHash
{
  return self->_fallbackHash;
}

- (unint64_t)partCount
{
  return self->_partCount;
}

- (BOOL)blockingRichLinks
{
  return self->_blockingRichLinks;
}

- (void)setBlockingRichLinks:(BOOL)a3
{
  self->_blockingRichLinks = a3;
}

- (void)setTranslatedText:(id)a3
{
}

- (void)setDetectedLanguage:(id)a3
{
}

- (void)setShouldSendPartIndexesInMessageBody:(BOOL)a3
{
  self->_shouldSendPartIndexesInMessageBody = a3;
}

- (unint64_t)editEligibility
{
  return self->_editEligibility;
}

- (void)setEditEligibility:(unint64_t)a3
{
  self->_editEligibility = a3;
}

- (BOOL)isBeingRetried
{
  return self->_isBeingRetried;
}

- (NSString)retryToParticipant
{
  return self->_retryToParticipant;
}

- (NSString)notificationIDSTokenURI
{
  return self->_notificationIDSTokenURI;
}

- (BOOL)isUpdatingDataSourcePayload
{
  return self->_updatingDataSourcePayload;
}

- (void)setUpdatingDataSourcePayload:(BOOL)a3
{
  self->_updatingDataSourcePayload = a3;
}

- (BOOL)backwardsCompatibleVersion
{
  return self->_backwardsCompatibleVersion;
}

- (void)setBackwardsCompatibleVersion:(BOOL)a3
{
  self->_backwardsCompatibleVersion = a3;
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (BOOL)NicknameRequested
{
  return self->_NicknameRequested;
}

- (void)setNicknameRequested:(BOOL)a3
{
  self->_NicknameRequested = a3;
}

- (BOOL)shouldSendMeCard
{
  return self->_shouldSendMeCard;
}

- (BOOL)shouldNotifyOnSend
{
  return self->_shouldNotifyOnSend;
}

- (BOOL)sentViaRemoteIntent
{
  return self->_sentViaRemoteIntent;
}

- (void)setSentViaRemoteIntent:(BOOL)a3
{
  self->_sentViaRemoteIntent = a3;
}

- (NSString)suggestedAuthorName
{
  return self->_suggestedAuthorName;
}

- (void)setSuggestedAuthorName:(id)a3
{
}

- (NSString)suggestedAuthorAvatarPath
{
  return self->_suggestedAuthorAvatarPath;
}

- (void)setSuggestedAuthorAvatarPath:(id)a3
{
}

- (NSDictionary)replyCountsByPart
{
  return self->_replyCountsByPart;
}

- (BOOL)wasDetectedAsSWYSpam
{
  return self->_wasDetectedAsSWYSpam;
}

- (void)setWasDetectedAsSWYSpam:(BOOL)a3
{
  self->_wasDetectedAsSWYSpam = a3;
}

- (int64_t)selectedRichCardIndex
{
  return self->_selectedRichCardIndex;
}

- (void)setSelectedRichCardIndex:(int64_t)a3
{
  self->_selectedRichCardIndex = a3;
}

- (NSArray)messageParts
{
  v2 = [(IMMessageItem *)self body];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A081DE30;
    v7[3] = &unk_1E5A106F0;
    id v8 = v3;
    id v4 = v3;
    objc_msgSend(v2, "__im_visitMessageParts:", v7);
    BOOL v5 = (void *)[v4 copy];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)messagePartMatchingPartIndex:(int64_t)a3
{
  id v4 = [(IMMessageItem *)self body];
  BOOL v5 = v4;
  if (v4)
  {
    unint64_t v6 = objc_msgSend(v4, "__im_messagePartMatchingPartIndex:", a3);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)powerLogMessageType
{
  if ([(IMMessageItem *)self isTypingMessage]) {
    return 0;
  }
  if ([(IMMessageItem *)self isAudioMessage]) {
    return 3;
  }
  id v4 = [(IMMessageItem *)self expressiveSendStyleID];
  uint64_t v5 = [v4 length];

  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = sub_1A086AA14;
  v9[3] = &unk_1E5A14E08;
  void v9[4] = &v10;
  [(IMMessageItem *)self enumerateAttachmentGUIDsWithBlock:v9];
  uint64_t v6 = 4;
  if (v5) {
    uint64_t v6 = 5;
  }
  uint64_t v7 = 1;
  if (v5) {
    uint64_t v7 = 2;
  }
  if (*((unsigned char *)v11 + 24)) {
    unint64_t v3 = v6;
  }
  else {
    unint64_t v3 = v7;
  }
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (BOOL)isAvailabilityReplySupported
{
  v2 = self;
  char v3 = sub_1A087CE8C();

  return v3 & 1;
}

- (BOOL)hasLegacyUrgentTriggerMatchInText
{
  v2 = self;
  char v3 = sub_1A087D4D8();

  return v3 & 1;
}

@end