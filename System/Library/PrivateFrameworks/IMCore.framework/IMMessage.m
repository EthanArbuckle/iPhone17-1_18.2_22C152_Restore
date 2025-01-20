@interface IMMessage
+ (IMMessage)messageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6;
+ (id)_vCardDataWithCLLocation:(id)a3;
+ (id)breadcrumbMessageWithText:(id)a3 associatedMessageGUID:(id)a4 balloonBundleID:(id)a5 fileTransferGUIDs:(id)a6 payloadData:(id)a7 threadIdentifier:(id)a8;
+ (id)defaultInvitationMessageFromSender:(id)a3 flags:(unint64_t)a4;
+ (id)fromMeIMHandle:(id)a3 withText:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6;
+ (id)instantMessageWithAssociatedMessageContent:(id)a3 associatedMessageGUID:(id)a4 associatedMessageType:(int64_t)a5 associatedMessageRange:(_NSRange)a6 associatedMessageEmoji:(id)a7 messageSummaryInfo:(id)a8 threadIdentifier:(id)a9;
+ (id)instantMessageWithText:(id)a3 flags:(unint64_t)a4 threadIdentifier:(id)a5;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 balloonBundleID:(id)a7 payloadData:(id)a8 expressiveSendStyleID:(id)a9;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 threadIdentifier:(id)a7;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6 threadIdentifier:(id)a7;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6;
+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6 associatedMessageGUID:(id)a7 scheduledDate:(id)a8;
+ (id)locatingMessageWithGuid:(id)a3 error:(id)a4;
+ (id)messageFromIMMessageItem:(id)a3 sender:(id)a4 subject:(id)a5;
+ (id)messageFromIMMessageItemDictionary:(id)a3 body:(id)a4 sender:(id)a5 subject:(id)a6;
+ (id)textMessageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6;
- (BOOL)didNotifyRecipient;
- (BOOL)hasDataDetectorResults;
- (BOOL)hasEditedParts;
- (BOOL)hasInlineAttachments;
- (BOOL)hasMention;
- (BOOL)isAddressedToMe;
- (BOOL)isAlert;
- (BOOL)isAssociatedMessage;
- (BOOL)isAudioMessage;
- (BOOL)isAutoReply;
- (BOOL)isCancelTypingMessage;
- (BOOL)isCritical;
- (BOOL)isDelayed;
- (BOOL)isDelivered;
- (BOOL)isDeviceActionMessage;
- (BOOL)isEmote;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinished;
- (BOOL)isFromMe;
- (BOOL)isIncomingTypingMessage;
- (BOOL)isIncomingTypingOrCancelTypingMessage;
- (BOOL)isInvitationMessage;
- (BOOL)isKeyTransparencyVerifiedMessage;
- (BOOL)isLocatingMessage;
- (BOOL)isPendingSatelliteSend;
- (BOOL)isPlayed;
- (BOOL)isRead;
- (BOOL)isReply;
- (BOOL)isRichLinkMessage;
- (BOOL)isSOS;
- (BOOL)isSenderUnknown;
- (BOOL)isSent;
- (BOOL)isSuggestedActionResponse;
- (BOOL)isSystemMessage;
- (BOOL)isTapToRetry;
- (BOOL)isTypingMessage;
- (BOOL)isTypingOrCancelTypingMessage;
- (BOOL)needsRelay;
- (BOOL)sentOrReceivedOffGrid;
- (BOOL)sentViaRemoteIntent;
- (BOOL)shouldNotifyOnSend;
- (BOOL)useStandalone;
- (BOOL)wasDataDetected;
- (BOOL)wasDeliveredQuietly;
- (BOOL)wasDetonated;
- (BOOL)wasDowngraded;
- (IMHandle)sender;
- (IMHandle)subject;
- (IMMessage)initWithSender:(id)a3 fileTransfer:(id)a4;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10 threadIdentifier:(id)a11;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 associatedMessageInfo:(id)a15;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17 messageSummaryInfo:(id)a18;
- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 threadIdentifier:(id)a12;
- (IMMessage)threadOriginator;
- (IMMessageItem)_imMessageItem;
- (IMTapback)tapback;
- (NSArray)fileTransferGUIDs;
- (NSArray)inlineAttachmentAttributesArray;
- (NSArray)messageParts;
- (NSArray)syncedSyndicationRanges;
- (NSArray)syndicationRanges;
- (NSAttributedString)messageSubject;
- (NSAttributedString)text;
- (NSData)customTypingIndicatorIcon;
- (NSData)payloadData;
- (NSDate)dateEdited;
- (NSDate)time;
- (NSDate)timeDelivered;
- (NSDate)timeExpressiveSendPlayed;
- (NSDate)timePlayed;
- (NSDate)timeRead;
- (NSDictionary)bizIntent;
- (NSDictionary)messageSummaryInfo;
- (NSDictionary)replyCountsByPart;
- (NSError)error;
- (NSIndexSet)editedPartIndexes;
- (NSIndexSet)retractedPartIndexes;
- (NSString)associatedBalloonBundleID;
- (NSString)associatedMessageEmoji;
- (NSString)associatedMessageGUID;
- (NSString)balloonBundleID;
- (NSString)biaReferenceID;
- (NSString)expressiveSendStyleID;
- (NSString)guid;
- (NSString)locale;
- (NSString)notificationIDSTokenURI;
- (NSString)plainBody;
- (NSString)senderName;
- (NSString)sourceApplicationID;
- (NSString)summaryString;
- (NSString)threadIdentifier;
- (TUConversationActivity)groupActivity;
- (_NSRange)associatedMessageRange;
- (id)_account;
- (id)_copyWithFlags:(unint64_t)a3;
- (id)_initWithSender:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 plainText:(id)a8 text:(id)a9 messageSubject:(id)a10 fileTransferGUIDs:(id)a11 flags:(unint64_t)a12 error:(id)a13 guid:(id)a14 messageID:(int64_t)a15 subject:(id)a16 balloonBundleID:(id)a17 payloadData:(id)a18 expressiveSendStyleID:(id)a19 timeExpressiveSendPlayed:(id)a20 associatedMessageGUID:(id)a21 associatedMessageType:(int64_t)a22 associatedMessageRange:(_NSRange)a23 associatedMessageEmoji:(id)a24 messageSummaryInfo:(id)a25 threadIdentifier:(id)a26 dateEdited:(id)a27 scheduleType:(unint64_t)a28 scheduleState:(unint64_t)a29;
- (id)_transcriptPluginChatItemFromTypeErasedPartChatItems:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionForPurpose:(int64_t)a3;
- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4;
- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4 senderDisplayName:(id)a5;
- (id)messagePartMatchingPartIndex:(int64_t)a3;
- (id)messagesBySeparatingRichLinks;
- (id)messagesSeparatedByByteLength:(int64_t)a3;
- (id)richLinkDataSourceWithChatContext:(id)a3;
- (id)tapbackSummaryForConversationListUsingIsAdaptiveImageGlyphProvider:(id)a3 isCommSafetySensitiveProvider:(id)a4 adaptiveImageGlyphProvider:(id)a5 effectString:(id)a6;
- (int64_t)associatedMessageType;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 comparisonType:(int64_t)a4;
- (int64_t)messageID;
- (unint64_t)flags;
- (unint64_t)scheduleState;
- (unint64_t)scheduleType;
- (unint64_t)sortID;
- (void)_associatedMessageEmoji:(id)a3;
- (void)_associatedMessageGUID:(id)a3;
- (void)_associatedMessageRange:(_NSRange)a3;
- (void)_associatedMessageType:(int64_t)a3;
- (void)_messageSummaryInfo:(id)a3;
- (void)_syncedSyndicationRanges:(id)a3;
- (void)_syndicationRanges:(id)a3;
- (void)_updateBizIntent:(id)a3;
- (void)_updateError:(id)a3;
- (void)_updateFileTransferGUIDs:(id)a3;
- (void)_updateFlags:(unint64_t)a3;
- (void)_updateGUID:(id)a3;
- (void)_updateLocale:(id)a3;
- (void)_updateMessageID:(int64_t)a3;
- (void)_updateSender:(id)a3;
- (void)_updateText:(id)a3;
- (void)_updateTime:(id)a3;
- (void)_updateTimeDelivered:(id)a3;
- (void)_updateTimePlayed:(id)a3;
- (void)_updateTimeRead:(id)a3;
- (void)_updatedDateEdited:(id)a3;
- (void)addEditedPartIndex:(int64_t)a3;
- (void)addRetractedPartIndex:(int64_t)a3;
- (void)setAssociatedBalloonBundleID:(id)a3;
- (void)setBalloonBundleID:(id)a3;
- (void)setCustomTypingIndicatorIcon:(id)a3;
- (void)setEditedPartIndexes:(id)a3;
- (void)setExpressiveSendStyleID:(id)a3;
- (void)setGroupActivity:(id)a3;
- (void)setHasMention:(BOOL)a3;
- (void)setIsInvitationMessage:(BOOL)a3;
- (void)setIsKeyTransparencyVerifiedMessage:(BOOL)a3;
- (void)setIsTapToRetry:(BOOL)a3;
- (void)setNeedsRelay:(BOOL)a3;
- (void)setNotificationIDSTokenURI:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setPendingSatelliteSend:(BOOL)a3;
- (void)setPlainBody:(id)a3;
- (void)setReplyCountsByPart:(id)a3;
- (void)setRetractedPartIndexes:(id)a3;
- (void)setScheduleState:(unint64_t)a3;
- (void)setScheduleType:(unint64_t)a3;
- (void)setSentOrReceivedOffGrid:(BOOL)a3;
- (void)setSentViaRemoteIntent:(BOOL)a3;
- (void)setShouldNotifyOnSend:(BOOL)a3;
- (void)setSortID:(unint64_t)a3;
- (void)setSourceApplicationID:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadOriginator:(id)a3;
- (void)setTimeExpressiveSendPlayed:(id)a3;
- (void)setUseStandalone:(BOOL)a3;
@end

@implementation IMMessage

- (NSIndexSet)retractedPartIndexes
{
  v4 = objc_msgSend_messageSummaryInfo(self, a2, v2, v3);
  v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6D688], v6);

  if (v7) {
    objc_msgSend___im_indexSetFromNumberArray_(MEMORY[0x1E4F28D60], v8, (uint64_t)v7, v10);
  }
  else {
  v11 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v8, v9, v10);
  }

  return (NSIndexSet *)v11;
}

- (NSDictionary)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (IMTapback)tapback
{
  uint64_t v5 = objc_msgSend_associatedMessageType(self, a2, v2, v3);
  if ((unint64_t)(v5 - 3000) >= 6 && (unint64_t)(v5 - 2000) > 5)
  {
    uint64_t v18 = objc_msgSend_associatedMessageType(self, v6, v7, v8);
    if (v18 == 3006 || v18 == 2006)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F6E768]);
      v26 = objc_msgSend_associatedMessageEmoji(self, v23, v24, v25);
      BOOL v30 = (objc_msgSend_associatedMessageType(self, v27, v28, v29) & 0xFFFFFFFFFFFFFFF8) == 3000;
      isRemoved = objc_msgSend_initWithEmoji_isRemoved_(v22, v31, (uint64_t)v26, v30);
    }
    else
    {
      uint64_t v32 = objc_msgSend_associatedMessageType(self, v19, v20, v21);
      if (v32 == 3007 || v32 == 2007)
      {
        v36 = objc_msgSend_fileTransferGUIDs(self, v33, v34, v35);
        v40 = objc_msgSend_firstObject(v36, v37, v38, v39);

        if (v40)
        {
          BOOL v44 = (objc_msgSend_associatedMessageType(self, v41, v42, v43) & 0xFFFFFFFFFFFFFFF8) == 3000;
          id v45 = objc_alloc(MEMORY[0x1E4F6EA60]);
          isRemoved = objc_msgSend_initWithTransferGUID_isRemoved_(v45, v46, (uint64_t)v40, v44);
        }
        else
        {
          isRemoved = 0;
        }
      }
      else
      {
        isRemoved = 0;
      }
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6E6A0]);
    uint64_t v13 = objc_msgSend_associatedMessageType(self, v10, v11, v12);
    isRemoved = objc_msgSend_initWithAssociatedMessageType_(v9, v14, v13, v15);
  }

  return (IMTapback *)isRemoved;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

+ (id)messageFromIMMessageItem:(id)a3 sender:(id)a4 subject:(id)a5
{
  id v7 = a3;
  id v167 = a5;
  id v166 = a4;
  uint64_t v11 = (objc_class *)objc_msgSend_messageClass(IMChatRegistry, v8, v9, v10);
  unsigned int v15 = objc_msgSend_errorCode(v7, v12, v13, v14);
  if (v15)
  {
    v175 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, @"__kIMMessageErrorDomain", v15, 0);
  }
  else
  {
    v175 = 0;
  }
  v19 = objc_msgSend_subject(v7, v16, v17, v18);
  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v24 = objc_msgSend_subject(v7, v21, v22, v23);
    v174 = objc_msgSend_initWithString_(v20, v25, (uint64_t)v24, v26);
  }
  else
  {
    v174 = 0;
  }

  id v165 = [v11 alloc];
  v173 = objc_msgSend_time(v7, v27, v28, v29);
  v172 = objc_msgSend_timeRead(v7, v30, v31, v32);
  v164 = objc_msgSend_timeDelivered(v7, v33, v34, v35);
  v163 = objc_msgSend_timePlayed(v7, v36, v37, v38);
  v162 = objc_msgSend_plainBody(v7, v39, v40, v41);
  v171 = objc_msgSend_body(v7, v42, v43, v44);
  v170 = objc_msgSend_fileTransferGUIDs(v7, v45, v46, v47);
  uint64_t v161 = objc_msgSend_flags(v7, v48, v49, v50);
  v169 = objc_msgSend_guid(v7, v51, v52, v53);
  uint64_t v160 = objc_msgSend_messageID(v7, v54, v55, v56);
  v168 = objc_msgSend_balloonBundleID(v7, v57, v58, v59);
  v159 = objc_msgSend_payloadData(v7, v60, v61, v62);
  v158 = objc_msgSend_expressiveSendStyleID(v7, v63, v64, v65);
  v157 = objc_msgSend_timeExpressiveSendPlayed(v7, v66, v67, v68);
  v156 = objc_msgSend_associatedMessageGUID(v7, v69, v70, v71);
  uint64_t v154 = objc_msgSend_associatedMessageType(v7, v72, v73, v74);
  uint64_t v152 = objc_msgSend_associatedMessageRange(v7, v75, v76, v77);
  v79 = v78;
  v155 = objc_msgSend_associatedMessageEmoji(v7, v78, v80, v81);
  v153 = objc_msgSend_messageSummaryInfo(v7, v82, v83, v84);
  v88 = objc_msgSend_threadIdentifier(v7, v85, v86, v87);
  v92 = objc_msgSend_dateEdited(v7, v89, v90, v91);
  uint64_t v96 = objc_msgSend_scheduleType(v7, v93, v94, v95);
  uint64_t v100 = objc_msgSend_scheduleState(v7, v97, v98, v99);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v165, v101, (uint64_t)v166, (uint64_t)v173, v172, v164, v163, v162, v171, v174, v170, v161, v175, v169, v160, v167, v168, v159, v158, v157, v156, v154, v152, v79, v155, v153, v88, v92, v96, v100);

  uint64_t v106 = objc_msgSend_sortID(v7, v103, v104, v105);
  objc_msgSend_setSortID_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v107, v106, v108);
  v112 = objc_msgSend_account(v7, v109, v110, v111);
  v113 = _IMBestAccountForIMItem(v7, 0, v112, 0, 0);

  v117 = objc_msgSend_threadOriginator(v7, v114, v115, v116);
  IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v117, v113, 1);

  objc_msgSend_setThreadOriginator_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v119, (uint64_t)IMMessageFromIMItem, v120);
  uint64_t v124 = objc_msgSend_flags(v7, v121, v122, v123);
  if (objc_msgSend_isEmote(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v125, v126, v127))v124 |= 2uLL; {
  if (objc_msgSend_isEmpty(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v128, v129, v130))v124 |= 8uLL;
  }
  if (objc_msgSend_hasMention(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v131, v132, v133))v124 |= 0x20000000uLL; {
  if (objc_msgSend_isAddressedToMe(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v134, v135, v136))objc_msgSend__updateFlags_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v137, v124 | 0x800, v138);
  }
  else {
    objc_msgSend__updateFlags_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v137, v124, v138);
  }
  v142 = objc_msgSend_syndicationRanges(v7, v139, v140, v141);
  objc_msgSend__syndicationRanges_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v143, (uint64_t)v142, v144);

  v148 = objc_msgSend_syncedSyndicationRanges(v7, v145, v146, v147);
  objc_msgSend__syncedSyndicationRanges_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v149, (uint64_t)v148, v150);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

- (BOOL)isTypingMessage
{
  if (objc_msgSend_wasDetonated(self, a2, v2, v3))
  {
    LOBYTE(isFinished) = 0;
  }
  else if (objc_msgSend_isFinished(self, v5, v6, v7))
  {
    int isFinished = objc_msgSend_isFinished(self, v9, v10, v11);
    if (isFinished)
    {
      int isFinished = objc_msgSend_isEmpty(self, v12, v13, v14);
      if (isFinished) {
        LOBYTE(isFinished) = objc_msgSend_hasEditedParts(self, v15, v16, v17) ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(isFinished) = 1;
  }
  return isFinished;
}

- (BOOL)isFinished
{
  return self->_flags & 1;
}

- (BOOL)isEmpty
{
  if (self->_flags & 8) == 0 || (objc_msgSend_hasInlineAttachments(self, a2, v2, v3)) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_fileTransferGUIDs(self, v5, v6, v7);
  if (objc_msgSend_count(v9, v10, v11, v12))
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v16 = objc_msgSend_messageSubject(self, v13, v14, v15);
    if (objc_msgSend_length(v16, v17, v18, v19))
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v23 = objc_msgSend_payloadData(self, v20, v21, v22);
      BOOL v8 = objc_msgSend_length(v23, v24, v25, v26) == 0;
    }
  }

  return v8;
}

- (BOOL)wasDetonated
{
  return (BYTE4(self->_flags) >> 4) & 1;
}

- (void)setSortID:(unint64_t)a3
{
  self->_sortID = a3;
}

- (void)setThreadOriginator:(id)a3
{
}

- (BOOL)isEmote
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isAddressedToMe
{
  return self->_isAddressedToMe;
}

- (BOOL)hasMention
{
  return (BYTE3(self->_flags) >> 5) & 1;
}

- (void)_updateFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)_syndicationRanges:(id)a3
{
}

- (void)_syncedSyndicationRanges:(id)a3
{
}

- (id)_initWithSender:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 plainText:(id)a8 text:(id)a9 messageSubject:(id)a10 fileTransferGUIDs:(id)a11 flags:(unint64_t)a12 error:(id)a13 guid:(id)a14 messageID:(int64_t)a15 subject:(id)a16 balloonBundleID:(id)a17 payloadData:(id)a18 expressiveSendStyleID:(id)a19 timeExpressiveSendPlayed:(id)a20 associatedMessageGUID:(id)a21 associatedMessageType:(int64_t)a22 associatedMessageRange:(_NSRange)a23 associatedMessageEmoji:(id)a24 messageSummaryInfo:(id)a25 threadIdentifier:(id)a26 dateEdited:(id)a27 scheduleType:(unint64_t)a28 scheduleState:(unint64_t)a29
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  id v185 = a3;
  id v164 = a4;
  id v180 = a4;
  id v179 = a5;
  id v178 = a6;
  id v177 = a7;
  id v33 = a8;
  id v184 = a9;
  id v176 = a10;
  id v181 = a11;
  id v175 = a13;
  id v34 = a14;
  id v35 = a16;
  id v174 = a17;
  v36 = v185;
  id v173 = a18;
  id v172 = a19;
  id v171 = a20;
  id v170 = a21;
  id v169 = a24;
  id v37 = a25;
  id v168 = a26;
  id v167 = a27;
  v192.receiver = self;
  v192.super_class = (Class)IMMessage;
  uint64_t v38 = [(IMMessage *)&v192 init];
  uint64_t v39 = v38;
  if (v38)
  {
    id v162 = v35;
    id v166 = v33;
    objc_storeStrong((id *)&v38->_sender, a3);
    objc_storeStrong((id *)&v39->_time, v164);
    p_messageSubject = (void **)&v39->_messageSubject;
    objc_storeStrong((id *)&v39->_messageSubject, a10);
    v39->_messageID = a15;
    v39->_flags = a12;
    objc_storeStrong((id *)&v39->_timeRead, a5);
    objc_storeStrong((id *)&v39->_timeDelivered, a6);
    objc_storeStrong((id *)&v39->_timePlayed, a7);
    objc_storeStrong((id *)&v39->_subject, a16);
    objc_storeStrong((id *)&v39->_balloonBundleID, a17);
    objc_storeStrong((id *)&v39->_payloadData, a18);
    objc_storeStrong((id *)&v39->_expressiveSendStyleID, a19);
    objc_storeStrong((id *)&v39->_timeExpressiveSendPlayed, a20);
    objc_storeStrong((id *)&v39->_associatedMessageGUID, a21);
    v39->_associatedMessageType = a22;
    v39->_associatedMessageRange = a23;
    objc_storeStrong((id *)&v39->_associatedMessageEmoji, a24);
    objc_storeStrong((id *)&v39->_messageSummaryInfo, a25);
    uint64_t v43 = objc_msgSend_objectForKey_(v37, v41, *MEMORY[0x1E4F6D618], v42);
    associatedBalloonBundleID = v39->_associatedBalloonBundleID;
    v39->_associatedBalloonBundleID = (NSString *)v43;

    id v45 = v37;
    uint64_t v48 = objc_msgSend_objectForKey_(v37, v46, *MEMORY[0x1E4F6D698], v47);
    sourceApplicationID = v39->_sourceApplicationID;
    v39->_sourceApplicationID = (NSString *)v48;

    objc_storeStrong((id *)&v39->_dateEdited, a27);
    v39->_scheduleType = a28;
    v39->_scheduleState = a29;
    if (v34)
    {
      uint64_t v53 = (NSString *)v34;
    }
    else
    {
      objc_msgSend_stringGUID(NSString, v50, v51, v52);
      uint64_t v53 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    guid = v39->_guid;
    v39->_guid = v53;

    if (objc_msgSend_isLoginIMHandle(v185, v55, v56, v57)) {
      v39->_flags |= 4uLL;
    }
    if (v184) {
      objc_storeStrong((id *)&v39->_text, a9);
    }
    p_fileTransferGUIDs = (void **)&v39->_fileTransferGUIDs;
    objc_storeStrong((id *)&v39->_fileTransferGUIDs, a11);
    if (objc_msgSend_length(v33, v59, v60, v61))
    {
      uint64_t v65 = (NSString *)v33;
      plainBody = v39->_plainBody;
      v39->_plainBody = v65;
    }
    else
    {
      id v67 = v34;
      uint64_t v68 = objc_msgSend_count(v181, v62, v63, v64);
      objc_msgSend_string(v39->_text, v69, v70, v71);
      v72 = (NSString *)objc_claimAutoreleasedReturnValue();
      plainBody = v72;
      if (v68)
      {
        uint64_t v76 = objc_msgSend___stringByStrippingAttachmentAndControlCharacters(v72, v73, v74, v75);
        uint64_t v77 = v39->_plainBody;
        v39->_plainBody = (NSString *)v76;
      }
      else
      {
        v78 = v39->_plainBody;
        v39->_plainBody = v72;
        plainBody = v78;
      }
      id v34 = v67;
      p_messageSubject = (void **)&v39->_messageSubject;
    }

    if (objc_msgSend_length(v39->_plainBody, v79, v80, v81)
      && objc_msgSend_characterAtIndex_(v39->_plainBody, v82, 0, v84) == 47
      && !objc_msgSend_count(*p_fileTransferGUIDs, v82, v83, v84)
      && !objc_msgSend_length(*p_messageSubject, v82, v83, v84))
    {
      id v182 = v34;
      long long v190 = 0u;
      long long v191 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      v85 = IMEmotePrefixes();
      uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v86, (uint64_t)&v188, (uint64_t)v193, 16);
      if (v87)
      {
        uint64_t v89 = v87;
        uint64_t v90 = *(void *)v189;
        while (2)
        {
          for (uint64_t i = 0; i != v89; ++i)
          {
            if (*(void *)v189 != v90) {
              objc_enumerationMutation(v85);
            }
            v92 = *(void **)(*((void *)&v188 + 1) + 8 * i);
            v93 = objc_msgSend_commonPrefixWithString_options_(v92, v88, (uint64_t)v39->_plainBody, 1);
            int isEqualToString = objc_msgSend_isEqualToString_(v93, v94, (uint64_t)v92, v95);

            if (isEqualToString)
            {
              unint64_t v99 = objc_msgSend_length(v39->_plainBody, v88, v97, v98);
              if (v99 > objc_msgSend_length(v92, v100, v101, v102))
              {
                uint64_t v105 = v39->_plainBody;
                uint64_t v106 = objc_msgSend_length(v92, v88, v103, v104);
                uint64_t v109 = objc_msgSend_characterAtIndex_(v105, v107, v106, v108);
                v113 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28B88], v110, v111, v112);
                LOBYTE(v109) = objc_msgSend_characterIsMember_(v113, v114, v109, v115);

                if ((v109 & 1) == 0)
                {
                  v39->_flags |= 2uLL;
                  goto LABEL_31;
                }
              }
            }
          }
          uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v85, v88, (uint64_t)&v188, (uint64_t)v193, 16);
          if (v89) {
            continue;
          }
          break;
        }
      }
LABEL_31:

      id v33 = v166;
      id v34 = v182;
    }
    if ((v39->_flags & 0x20000000) == 0)
    {
      uint64_t v116 = objc_msgSend_subject(v39, v82, v83, v84);
      if (objc_msgSend_isBusiness(v116, v117, v118, v119))
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend_sender(v39, v120, v121, v122);
      v124 = id v123 = v34;
      char isBusiness = objc_msgSend_isBusiness(v124, v125, v126, v127);

      id v34 = v123;
      if ((isBusiness & 1) == 0)
      {
        uint64_t v129 = *MEMORY[0x1E4F6D538];
        uint64_t v130 = objc_msgSend_length(v184, v82, v83, v84);
        v186[0] = MEMORY[0x1E4F143A8];
        v186[1] = 3221225472;
        v186[2] = sub_1A4B34260;
        v186[3] = &unk_1E5B7DB08;
        v187 = v39;
        uint64_t v131 = v130;
        id v34 = v123;
        objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v184, v132, v129, 0, v131, 0, v186);
        uint64_t v116 = v187;
        goto LABEL_36;
      }
    }
LABEL_37:
    uint64_t v133 = objc_msgSend_plainBody(v39, v82, v83, v84);
    if (!objc_msgSend_length(v133, v134, v135, v136) && !objc_msgSend_count(*p_fileTransferGUIDs, v137, v138, v139))
    {
      id v143 = v34;
      uint64_t v144 = objc_msgSend_messageSubject(v39, v140, v141, v142);
      if (!objc_msgSend_length(v144, v145, v146, v147))
      {
        v151 = objc_msgSend_payloadData(v39, v148, v149, v150);
        if (!objc_msgSend_length(v151, v152, v153, v154))
        {
          char v161 = objc_msgSend_wasDetonated(v39, v155, v156, v157);

          id v34 = v143;
          if ((v161 & 1) == 0)
          {
            unint64_t v158 = v39->_flags | 8;
            goto LABEL_45;
          }
LABEL_44:
          unint64_t v158 = v39->_flags & 0xFFFFFFFFFFFFFFF7;
LABEL_45:
          id v35 = v162;
          id v37 = v45;
          v39->_flags = v158;
          objc_storeStrong((id *)&v39->_error, a13);
          objc_storeStrong((id *)&v39->_threadIdentifier, a26);
          replyCountsByPart = v39->_replyCountsByPart;
          v39->_replyCountsByPart = 0;

          v36 = v185;
          goto LABEL_46;
        }
      }
      id v34 = v143;
    }

    goto LABEL_44;
  }
LABEL_46:

  return v39;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)subject
{
  return self->_subject;
}

- (NSString)plainBody
{
  p_plainBody = &self->_plainBody;
  plainBody = self->_plainBody;
  if (!plainBody)
  {
    uint64_t v7 = objc_msgSend_string(self->_text, a2, v2, v3);
    uint64_t v9 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, *MEMORY[0x1E4F6C110], (uint64_t)&stru_1EF8E78C8);
    uint64_t v11 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v9, v10, *MEMORY[0x1E4F6C130], (uint64_t)&stru_1EF8E78C8);
    uint64_t v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v11, v12, *MEMORY[0x1E4F6CE60], (uint64_t)&stru_1EF8E78C8);

    if (objc_msgSend_length(v13, v14, v15, v16)) {
      objc_storeStrong((id *)p_plainBody, v13);
    }

    plainBody = *p_plainBody;
  }

  return plainBody;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (NSString)balloonBundleID
{
  return self->_balloonBundleID;
}

- (BOOL)isRead
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)expressiveSendStyleID
{
  return self->_expressiveSendStyleID;
}

- (id)tapbackSummaryForConversationListUsingIsAdaptiveImageGlyphProvider:(id)a3 isCommSafetySensitiveProvider:(id)a4 adaptiveImageGlyphProvider:(id)a5 effectString:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v20 = objc_msgSend_associatedMessageType(self, v14, v15, v16) & 0xFFFFFFFFFFFFFFF8;
  if (v20 != 3000 && v20 != 2000)
  {
LABEL_15:
    uint64_t v40 = 0;
    goto LABEL_16;
  }
  uint64_t v21 = objc_msgSend_sender(self, v17, v18, v19);
  uint64_t v28 = objc_msgSend_isFromMe(self, v22, v23, v24);
  if (v28)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = objc_msgSend__displayNameWithAbbreviation(v21, v25, v26, v27);
  }
  uint64_t v30 = objc_msgSend_tapback(self, v25, v26, v27);
  if (!v30)
  {
    uint64_t v49 = IMLogHandleForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB72A8(v49);
    }

    goto LABEL_15;
  }
  id v34 = (void *)v30;
  id v35 = objc_msgSend_messageSummaryInfo(self, v31, v32, v33);
  uint64_t v40 = objc_msgSend_previewAttributedStringWithMessageSummaryInfo_isAdaptiveImageGlyphProvider_isCommSafetySensitiveProvider_adaptiveImageGlyphProvider_senderDisplayName_isFromMe_effectString_(v34, v36, (uint64_t)v35, (uint64_t)v10, v11, v12, v29, v28, v13);
  if (!v40)
  {
    uint64_t v41 = objc_msgSend_plainBody(self, v37, v38, v39);
    uint64_t v42 = (void *)v41;
    uint64_t v43 = &stru_1EF8E78C8;
    if (v41) {
      uint64_t v43 = (__CFString *)v41;
    }
    uint64_t v44 = v43;

    id v45 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v46 = v44;
    uint64_t v40 = objc_msgSend_initWithString_(v45, v47, (uint64_t)v44, v48);
  }
LABEL_16:

  return v40;
}

- (id)descriptionForPurpose:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_guid(self, a2, a3, v3);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = objc_msgSend_sharedRegistry(IMChatRegistry, v7, v8, v9, 0);
  uint64_t v14 = objc_msgSend_cachedChats(v10, v11, v12, v13);

  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_messageForGUID_(v22, v17, (uint64_t)v6, v18);

        if (v23)
        {
          uint64_t v25 = objc_msgSend_descriptionForPurpose_inChat_(self, v17, a3, (uint64_t)v22);

          goto LABEL_11;
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, (uint64_t)v31, 16);
      if (v19) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = objc_msgSend_descriptionForPurpose_inChat_(self, v24, a3, 0);
LABEL_11:

  return v25;
}

- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4
{
  if (a4) {
    BOOL v6 = objc_msgSend_chatStyle(a4, a2, a3, (uint64_t)a4) != 45;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = objc_msgSend__imMessageItem(self, a2, a3, (uint64_t)a4);
  uint64_t v9 = objc_msgSend_descriptionForPurpose_isGroupMessage_messageDataSource_attachmentDataSource_(v7, v8, a3, v6, 0, &unk_1EF8E5298);

  return v9;
}

- (id)descriptionForPurpose:(int64_t)a3 inChat:(id)a4 senderDisplayName:(id)a5
{
  id v11 = a5;
  if (a4) {
    a4 = (id)(objc_msgSend_chatStyle(a4, v8, v9, v10) != 45);
  }
  uint64_t v12 = objc_msgSend__imMessageItem(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_descriptionForPurpose_isGroupMessage_senderDisplayName_messageDataSource_attachmentDataSource_(v12, v13, a3, (uint64_t)a4, v11, 0, &unk_1EF8E3E30);

  return v14;
}

+ (id)defaultInvitationMessageFromSender:(id)a3 flags:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v9 = (objc_class *)objc_msgSend_messageClass(IMChatRegistry, v6, v7, v8);
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v13 = objc_msgSend_initWithString_(v10, v11, (uint64_t)&stru_1EF8E78C8, v12);
  id v14 = [v9 alloc];
  uint64_t v18 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16, v17);
  uint64_t v20 = objc_msgSend_initWithSender_time_text_fileTransferGUIDs_flags_error_guid_subject_threadIdentifier_(v14, v19, (uint64_t)v5, (uint64_t)v18, v13, 0, a4 | 1, 0, 0, 0, 0);

  return v20;
}

+ (id)instantMessageWithText:(id)a3 flags:(unint64_t)a4 threadIdentifier:(id)a5
{
  return (id)MEMORY[0x1F4181798](a1, sel_instantMessageWithText_messageSubject_flags_threadIdentifier_, a3, 0);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6
{
  return (id)MEMORY[0x1F4181798](a1, sel_instantMessageWithText_messageSubject_flags_expressiveSendStyleID_threadIdentifier_, a3, a4);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6
{
  return (id)MEMORY[0x1F4181798](a1, sel_instantMessageWithText_messageSubject_flags_expressiveSendStyleID_threadIdentifier_, a3, a4);
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 expressiveSendStyleID:(id)a6 threadIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc((Class)a1);
  uint64_t v20 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18, v19);
  uint64_t v24 = objc_msgSend_stringGUID(NSString, v21, v22, v23);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v16, v25, 0, (uint64_t)v20, 0, 0, 0, 0, v15, v14, 0, a5, 0, v24, 0, 0, 0, 0, v13, 0, 0, 0, 0, 0, 0, 0, v12, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 flags:(unint64_t)a5 threadIdentifier:(id)a6 associatedMessageGUID:(id)a7 scheduledDate:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  id v21 = objc_alloc((Class)a1);
  if (v13)
  {
    uint64_t v22 = 2;
    uint64_t v23 = v13;
  }
  else
  {
    uint64_t v23 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19, v20);
    uint64_t v22 = 0;
  }
  uint64_t v24 = objc_msgSend_stringGUID(NSString, v18, v19, v20);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v21, v25, 0, (uint64_t)v23, 0, 0, 0, 0, v17, v16, 0, a5, 0, v24, 0, 0, 0, 0, 0, 0, v14, 0, 0, 0, 0, 0, v15, 0, v22, v13 != 0);

  if (!v13) {

  }
  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 threadIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (!v12) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  id v16 = objc_alloc((Class)a1);
  uint64_t v20 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18, v19);
  uint64_t v24 = objc_msgSend_stringGUID(NSString, v21, v22, v23);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v16, v25, 0, (uint64_t)v20, 0, 0, 0, 0, v12, v13, v14, a6, 0, v24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, v15, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)instantMessageWithText:(id)a3 messageSubject:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6 balloonBundleID:(id)a7 payloadData:(id)a8 expressiveSendStyleID:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (!v15) {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  id v21 = objc_alloc((Class)a1);
  uint64_t v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24);
  long long v29 = objc_msgSend_stringGUID(NSString, v26, v27, v28);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v21, v30, 0, (uint64_t)v25, 0, 0, 0, 0, v15, v16, v17, a6, 0, v29, 0, 0, v18, v19, v20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)fromMeIMHandle:(id)a3 withText:(id)a4 fileTransferGUIDs:(id)a5 flags:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v16 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  long long v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)a1, @"IMMessage.m", 254, @"Invalid parameter not satisfying: %@", @"imHandle != nil");

  if (!v12) {
LABEL_3:
  }
    id v12 = objc_alloc_init(MEMORY[0x1E4F28B18]);
LABEL_4:
  id v17 = objc_alloc((Class)a1);
  id v21 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19, v20);
  uint64_t v25 = objc_msgSend_stringGUID(NSString, v22, v23, v24);
  uint64_t v27 = objc_msgSend_initWithSender_time_text_fileTransferGUIDs_flags_error_guid_subject_threadIdentifier_(v17, v26, (uint64_t)v11, (uint64_t)v21, v12, v16, a6, 0, v25, 0, 0);

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v214 = objc_alloc((Class)objc_opt_class());
  v213 = objc_msgSend_sender(self, v4, v5, v6);
  id v10 = objc_msgSend_time(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_text(self, v11, v12, v13);
  id v18 = objc_msgSend_messageSubject(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_fileTransferGUIDs(self, v19, v20, v21);
  uint64_t v212 = objc_msgSend_flags(self, v23, v24, v25);
  long long v29 = objc_msgSend_error(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_guid(self, v30, v31, v32);
  id v37 = objc_msgSend_subject(self, v34, v35, v36);
  uint64_t v41 = objc_msgSend_threadIdentifier(self, v38, v39, v40);
  uint64_t v43 = objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_threadIdentifier_(v214, v42, (uint64_t)v213, (uint64_t)v10, v14, v18, v22, v212, v29, v33, v37, v41);

  uint64_t v47 = objc_msgSend_time(self, v44, v45, v46);
  objc_msgSend__updateTime_(v43, v48, (uint64_t)v47, v49);

  uint64_t v53 = objc_msgSend_timeRead(self, v50, v51, v52);
  objc_msgSend__updateTimeRead_(v43, v54, (uint64_t)v53, v55);

  uint64_t v59 = objc_msgSend_timeDelivered(self, v56, v57, v58);
  objc_msgSend__updateTimeDelivered_(v43, v60, (uint64_t)v59, v61);

  uint64_t v65 = objc_msgSend_timePlayed(self, v62, v63, v64);
  objc_msgSend__updateTimePlayed_(v43, v66, (uint64_t)v65, v67);

  uint64_t v71 = objc_msgSend_messageID(self, v68, v69, v70);
  objc_msgSend__updateMessageID_(v43, v72, v71, v73);
  uint64_t v77 = objc_msgSend_associatedMessageGUID(self, v74, v75, v76);
  objc_msgSend__associatedMessageGUID_(v43, v78, (uint64_t)v77, v79);

  uint64_t v83 = objc_msgSend_associatedMessageType(self, v80, v81, v82);
  objc_msgSend__associatedMessageType_(v43, v84, v83, v85);
  uint64_t v89 = objc_msgSend_associatedMessageRange(self, v86, v87, v88);
  objc_msgSend__associatedMessageRange_(v43, v90, v89, (uint64_t)v90);
  uint64_t v94 = objc_msgSend_associatedMessageEmoji(self, v91, v92, v93);
  objc_msgSend__associatedMessageEmoji_(v43, v95, (uint64_t)v94, v96);

  uint64_t v100 = objc_msgSend_messageSummaryInfo(self, v97, v98, v99);
  objc_msgSend__messageSummaryInfo_(v43, v101, (uint64_t)v100, v102);

  uint64_t v106 = objc_msgSend_balloonBundleID(self, v103, v104, v105);
  objc_msgSend_setBalloonBundleID_(v43, v107, (uint64_t)v106, v108);

  uint64_t v112 = objc_msgSend_payloadData(self, v109, v110, v111);
  objc_msgSend_setPayloadData_(v43, v113, (uint64_t)v112, v114);

  uint64_t v118 = objc_msgSend_expressiveSendStyleID(self, v115, v116, v117);
  objc_msgSend_setExpressiveSendStyleID_(v43, v119, (uint64_t)v118, v120);

  uint64_t v124 = objc_msgSend_timeExpressiveSendPlayed(self, v121, v122, v123);
  objc_msgSend_setTimeExpressiveSendPlayed_(v43, v125, (uint64_t)v124, v126);

  uint64_t v130 = objc_msgSend_bizIntent(self, v127, v128, v129);
  objc_msgSend__updateBizIntent_(v43, v131, (uint64_t)v130, v132);

  uint64_t v136 = objc_msgSend_locale(self, v133, v134, v135);
  objc_msgSend__updateLocale_(v43, v137, (uint64_t)v136, v138);

  uint64_t v142 = objc_msgSend_useStandalone(self, v139, v140, v141);
  objc_msgSend_setUseStandalone_(v43, v143, v142, v144);
  uint64_t shouldNotifyOnSend = objc_msgSend_shouldNotifyOnSend(self, v145, v146, v147);
  objc_msgSend_setShouldNotifyOnSend_(v43, v149, shouldNotifyOnSend, v150);
  uint64_t v154 = objc_msgSend_sentViaRemoteIntent(self, v151, v152, v153);
  objc_msgSend_setSentViaRemoteIntent_(v43, v155, v154, v156);
  uint64_t v160 = objc_msgSend_messageSummaryInfo(self, v157, v158, v159);
  v163 = objc_msgSend_objectForKey_(v160, v161, *MEMORY[0x1E4F6D618], v162);
  objc_msgSend_setAssociatedBalloonBundleID_(v43, v164, (uint64_t)v163, v165);

  id v169 = objc_msgSend_messageSummaryInfo(self, v166, v167, v168);
  id v172 = objc_msgSend_objectForKey_(v169, v170, *MEMORY[0x1E4F6D698], v171);
  objc_msgSend_setSourceApplicationID_(v43, v173, (uint64_t)v172, v174);

  id v178 = objc_msgSend_syndicationRanges(self, v175, v176, v177);
  objc_msgSend__syndicationRanges_(v43, v179, (uint64_t)v178, v180);

  id v184 = objc_msgSend_syncedSyndicationRanges(self, v181, v182, v183);
  objc_msgSend__syncedSyndicationRanges_(v43, v185, (uint64_t)v184, v186);

  long long v190 = objc_msgSend_dateEdited(self, v187, v188, v189);
  objc_msgSend__updatedDateEdited_(v43, v191, (uint64_t)v190, v192);

  v196 = objc_msgSend_groupActivity(self, v193, v194, v195);
  objc_msgSend_setGroupActivity_(v43, v197, (uint64_t)v196, v198);

  uint64_t v202 = objc_msgSend_scheduleType(self, v199, v200, v201);
  objc_msgSend_setScheduleType_(v43, v203, v202, v204);
  uint64_t v208 = objc_msgSend_scheduleState(self, v205, v206, v207);
  objc_msgSend_setScheduleState_(v43, v209, v208, v210);
  return v43;
}

- (id)_copyWithFlags:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_copy(self, a2, a3, v3);
  objc_msgSend__updateFlags_(v5, v6, a3, v7);
  return v5;
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, 0, 0, 0,
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
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 threadIdentifier:(id)a12
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a12,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, 0, a6, a7, a8, a9, 0, a10, 0, 0, 0,
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
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 fileTransferGUIDs:(id)a6 flags:(unint64_t)a7 error:(id)a8 guid:(id)a9 subject:(id)a10 threadIdentifier:(id)a11
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, 0, a6, a7, a8, a9, 0, a10, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a11,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, a12, a13, a14,
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
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, a12, a13, a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a15,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17 messageSummaryInfo:(id)a18
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, a12, a13, a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a18,
                        a15,
                        0,
                        a16,
                        a17);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 balloonBundleID:(id)a12 payloadData:(id)a13 expressiveSendStyleID:(id)a14 threadIdentifier:(id)a15 scheduleType:(unint64_t)a16 scheduleState:(unint64_t)a17
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, a12, a13, a14,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        a15,
                        0,
                        a16,
                        a17);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, 0, 0, 0,
                        0,
                        a12,
                        a13,
                        a14.location,
                        a14.length,
                        0,
                        a15,
                        0,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16
{
  return (IMMessage *)objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 0, 0, a5, a6, a7, a8, a9, a10, 0, a11, 0, 0, 0,
                        0,
                        a12,
                        a13,
                        a14.location,
                        a14.length,
                        0,
                        a15,
                        a16,
                        0,
                        0,
                        0);
}

- (IMMessage)initWithSender:(id)a3 fileTransfer:(id)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_guid(a4, v7, v8, v9);
  id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v14 = objc_msgSend_initWithObjectsAndKeys_(v11, v12, (uint64_t)v10, v13, *MEMORY[0x1E4F6C188], 0);
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v17 = objc_msgSend_initWithString_attributes_(v15, v16, *MEMORY[0x1E4F6C110], (uint64_t)v14);
  id v18 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v21 = objc_msgSend_initWithObjects_(v18, v19, (uint64_t)v10, v20, 0);
  uint64_t v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24);
  long long v29 = objc_msgSend_stringGUID(NSString, v26, v27, v28);
  uint64_t v31 = objc_msgSend_initWithSender_time_text_fileTransferGUIDs_flags_error_guid_subject_threadIdentifier_(self, v30, (uint64_t)v6, (uint64_t)v25, v17, v21, 1, 0, v29, 0, 0);

  uint64_t v32 = v31;
  return v32;
}

- (NSString)senderName
{
  return (NSString *)objc_msgSend_name(self->_sender, a2, v2, v3);
}

- (NSString)summaryString
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_plainBody(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_mutableCopy(v5, v6, v7, v8);
  if (objc_msgSend_isEmote(self, v10, v11, v12))
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v16 = IMEmotePrefixes();
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v16);
          }
          uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend_commonPrefixWithString_options_(v23, v19, (uint64_t)v9, 1, (void)v37);
          int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v23, v26);

          if (isEqualToString)
          {
            uint64_t v30 = objc_msgSend_length(v23, v19, v28, v29);
            id v34 = objc_msgSend_senderName(self, v31, v32, v33);
            objc_msgSend_replaceCharactersInRange_withString_(v9, v35, 0, v30, v34);
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v37, (uint64_t)v41, 16);
      }
      while (v20);
    }
  }
  objc_msgSend_replaceNewlinesWithSpaces(v9, v13, v14, v15, (void)v37);

  return (NSString *)v9;
}

- (BOOL)hasDataDetectorResults
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)isLocatingMessage
{
  return BYTE2(self->_flags) >> 7;
}

- (BOOL)isSent
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)hasInlineAttachments
{
  if (!objc_msgSend_length(self->_text, a2, v2, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_string(self->_text, v5, v6, v7);
  BOOL v11 = objc_msgSend_rangeOfString_(v8, v9, *MEMORY[0x1E4F6C110], v10) != 0x7FFFFFFFFFFFFFFFLL;

  return v11;
}

- (NSArray)inlineAttachmentAttributesArray
{
  uint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  uint64_t v9 = objc_msgSend_length(self->_text, v6, v7, v8);
  if (v9)
  {
    unint64_t v11 = v9;
    unint64_t v12 = 0;
    uint64_t v13 = *MEMORY[0x1E4F6C188];
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v14 = objc_msgSend_attributesAtIndex_longestEffectiveRange_inRange_(self->_text, v10, v12, (uint64_t)&v21, v12, v11 - v12);
      uint64_t v17 = objc_msgSend_objectForKey_(v14, v15, v13, v16);

      if (v17) {
        objc_msgSend_addObject_(v5, v18, (uint64_t)v14, v19);
      }
      unint64_t v12 = v22 + v21;
    }
    while (v12 < v11);
  }

  return (NSArray *)v5;
}

- (BOOL)isSenderUnknown
{
  if ((objc_msgSend_isFromMe(self, a2, v2, v3) & 1) == 0)
  {
    uint64_t v9 = objc_msgSend_sender(self, v5, v6, v7);
    uint64_t v13 = v9;
    if (v9)
    {
      if ((objc_msgSend_isContact(v9, v10, v11, v12) & 1) != 0
        || (objc_msgSend_isBusiness(v13, v14, v15, v16) & 1) != 0)
      {
        goto LABEL_6;
      }
      uint64_t v21 = objc_msgSend_service(v13, v17, v18, v19);
      uint64_t v25 = objc_msgSend_iMessageService(IMServiceImpl, v22, v23, v24);

      if (v21 == v25)
      {
        uint64_t v20 = objc_msgSend_normalizedID(v13, v26, v27, v28);
        if (IMStringIsEmail()
          && ((objc_msgSend_hasSuffix_(v20, v29, @"@apple.com", v30) & 1) != 0
           || (objc_msgSend_hasSuffix_(v20, v31, @".apple.com", v32) & 1) != 0))
        {

LABEL_6:
          BOOL v8 = 0;
LABEL_17:

          return v8;
        }
        goto LABEL_15;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v34 = 0;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Could not determine sender, returning unknown sender", v34, 2u);
      }
LABEL_15:
    }
    BOOL v8 = 1;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)isDelayed
{
  return (LOBYTE(self->_flags) >> 5) & 1;
}

- (BOOL)isAutoReply
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (BOOL)isDelivered
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)isAudioMessage
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (BOOL)isPlayed
{
  return (BYTE2(self->_flags) >> 6) & 1;
}

- (BOOL)isSystemMessage
{
  if ((self->_flags & 4) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend_sender(self, a2, v2, v3);
    if (v5) {
      BOOL v6 = (BYTE1(self->_flags) >> 6) & 1;
    }
    else {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)isAlert
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)wasDowngraded
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)wasDataDetected
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)wasDeliveredQuietly
{
  return (BYTE4(self->_flags) >> 2) & 1;
}

- (BOOL)didNotifyRecipient
{
  return (BYTE4(self->_flags) >> 3) & 1;
}

- (BOOL)isSOS
{
  return BYTE4(self->_flags) >> 7;
}

- (BOOL)isCritical
{
  return (BYTE4(self->_flags) >> 6) & 1;
}

- (BOOL)isSuggestedActionResponse
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isLazuliEnabled = objc_msgSend_isLazuliEnabled(v5, v6, v7, v8);

  if (!isLazuliEnabled) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_text(self, v10, v11, v12);
  v20[0] = *MEMORY[0x1E4F6E3E0];
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v20, 1);
  char v18 = objc_msgSend___im_containsAttributedValue_(v13, v16, (uint64_t)v15, v17);

  return v18;
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
  self->_flags = self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)isTapToRetry
{
  return BYTE5(self->_flags) & 1;
}

- (void)setIsTapToRetry:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)isPendingSatelliteSend
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled) {
    return (BYTE5(self->_flags) >> 1) & 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)setPendingSatelliteSend:(BOOL)a3
{
  BOOL v4 = a3;
  BOOL v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v6, v7, v8, v9);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v11 = 0x20000000000;
    if (!v4) {
      uint64_t v11 = 0;
    }
    self->_flags = self->_flags & 0xFFFFFDFFFFFFFFFFLL | v11;
  }
}

- (BOOL)needsRelay
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled) {
    return (BYTE5(self->_flags) >> 2) & 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)setNeedsRelay:(BOOL)a3
{
  BOOL v4 = a3;
  BOOL v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v6, v7, v8, v9);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v11 = 0x40000000000;
    if (!v4) {
      uint64_t v11 = 0;
    }
    self->_flags = self->_flags & 0xFFFFFBFFFFFFFFFFLL | v11;
  }
}

- (BOOL)sentOrReceivedOffGrid
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled) {
    return (BYTE5(self->_flags) >> 3) & 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (void)setSentOrReceivedOffGrid:(BOOL)a3
{
  BOOL v4 = a3;
  BOOL v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v6, v7, v8, v9);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v11 = 0x80000000000;
    if (!v4) {
      uint64_t v11 = 0;
    }
    self->_flags = self->_flags & 0xFFFFF7FFFFFFFFFFLL | v11;
  }
}

- (NSIndexSet)editedPartIndexes
{
  BOOL v4 = objc_msgSend_messageSummaryInfo(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6D660], v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  uint64_t v13 = objc_msgSend___im_indexSetFromNumberArray_(MEMORY[0x1E4F28D60], v11, (uint64_t)v10, v12);

  return (NSIndexSet *)v13;
}

- (void)setEditedPartIndexes:(id)a3
{
  objc_msgSend___im_numberArray(a3, a2, (uint64_t)a3, v3);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_messageSummaryInfo(self, v5, v6, v7);
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_messageSummaryInfo(self, v12, v13, v14);
    uint64_t v19 = (NSDictionary *)objc_msgSend_mutableCopy(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v22, *MEMORY[0x1E4F6D660]);
  messageSummaryInfo = self->_messageSummaryInfo;
  self->_messageSummaryInfo = v19;
}

- (void)addEditedPartIndex:(int64_t)a3
{
  objc_msgSend_editedPartIndexes(self, a2, a3, v3);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_mutableCopy(v18, v6, v7, v8);
  objc_msgSend_addIndex_(v9, v10, a3, v11);
  uint64_t v15 = objc_msgSend_copy(v9, v12, v13, v14);
  objc_msgSend_setEditedPartIndexes_(self, v16, (uint64_t)v15, v17);
}

- (void)setRetractedPartIndexes:(id)a3
{
  objc_msgSend___im_numberArray(a3, a2, (uint64_t)a3, v3);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_messageSummaryInfo(self, v5, v6, v7);
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v15 = objc_msgSend_messageSummaryInfo(self, v12, v13, v14);
    uint64_t v19 = (NSDictionary *)objc_msgSend_mutableCopy(v15, v16, v17, v18);
  }
  else
  {
    uint64_t v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  objc_msgSend_setObject_forKey_(v19, v20, (uint64_t)v22, *MEMORY[0x1E4F6D688]);
  messageSummaryInfo = self->_messageSummaryInfo;
  self->_messageSummaryInfo = v19;
}

- (void)addRetractedPartIndex:(int64_t)a3
{
  objc_msgSend_retractedPartIndexes(self, a2, a3, v3);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_mutableCopy(v18, v6, v7, v8);
  objc_msgSend_addIndex_(v9, v10, a3, v11);
  uint64_t v15 = objc_msgSend_copy(v9, v12, v13, v14);
  objc_msgSend_setRetractedPartIndexes_(self, v16, (uint64_t)v15, v17);
}

- (BOOL)hasEditedParts
{
  BOOL v4 = objc_msgSend_dateEdited(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isDeviceActionMessage
{
  BOOL v4 = objc_msgSend_messageSummaryInfo(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F6D648], v6);
  char v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);

  return v11;
}

- (void)setAssociatedBalloonBundleID:(id)a3
{
  p_associatedBalloonBundleID = (uint64_t *)&self->_associatedBalloonBundleID;
  id v14 = a3;
  if ((objc_msgSend_isEqualToString_((void *)*p_associatedBalloonBundleID, v6, (uint64_t)v14, v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_associatedBalloonBundleID, a3);
    Mutable = (NSDictionary *)objc_msgSend_mutableCopy(self->_messageSummaryInfo, v8, v9, v10);
    if (!Mutable) {
      Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    if (*p_associatedBalloonBundleID) {
      objc_msgSend_setObject_forKey_(Mutable, v11, *p_associatedBalloonBundleID, *MEMORY[0x1E4F6D618]);
    }
    messageSummaryInfo = self->_messageSummaryInfo;
    self->_messageSummaryInfo = Mutable;
  }
}

- (void)setSourceApplicationID:(id)a3
{
  p_sourceApplicationID = (uint64_t *)&self->_sourceApplicationID;
  id v14 = a3;
  if ((objc_msgSend_isEqualToString_((void *)*p_sourceApplicationID, v6, (uint64_t)v14, v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sourceApplicationID, a3);
    Mutable = (NSDictionary *)objc_msgSend_mutableCopy(self->_messageSummaryInfo, v8, v9, v10);
    if (!Mutable) {
      Mutable = (NSDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    if (*p_sourceApplicationID) {
      objc_msgSend_setObject_forKey_(Mutable, v11, *p_sourceApplicationID, *MEMORY[0x1E4F6D698]);
    }
    messageSummaryInfo = self->_messageSummaryInfo;
    self->_messageSummaryInfo = Mutable;
  }
}

- (BOOL)isReply
{
  BOOL v4 = objc_msgSend_threadIdentifier(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_length(v4, v5, v6, v7) != 0;

  return v8;
}

- (int64_t)compare:(id)a3
{
  return IMMessageCompare(self, a3, 0);
}

- (int64_t)compare:(id)a3 comparisonType:(int64_t)a4
{
  return IMMessageCompare(self, a3, a4);
}

- (id)_account
{
  BOOL v5 = objc_msgSend_subject(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_account(v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v13 = objc_msgSend_sender(self, v10, v11, v12);
    uint64_t v9 = objc_msgSend_account(v13, v14, v15, v16);
  }

  return v9;
}

- (void)_updateSender:(id)a3
{
}

- (IMMessageItem)_imMessageItem
{
  BOOL v5 = objc_msgSend__account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_text(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v9, v10, v11, v12);

  uint64_t v388 = objc_msgSend___im_countMessageParts(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_sender(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_ID(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_length(v24, v25, v26, v27);

  if (v28)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v33 = objc_msgSend_sender(self, v29, v30, v31);
    long long v37 = objc_msgSend_ID(v33, v34, v35, v36);
    uint64_t v39 = objc_msgSend_dictionaryWithObject_forKey_(v32, v38, (uint64_t)v37, *MEMORY[0x1E4F6C5C8]);
  }
  else
  {
    uint64_t v39 = MEMORY[0x1E4F1CC08];
  }
  uint64_t v40 = objc_msgSend_associatedMessageGUID(self, v29, v30, v31);
  v390 = v5;
  v407 = v13;
  v395 = (void *)v39;
  if (v40
    && (uint64_t v44 = (void *)v40,
        objc_msgSend_associatedMessageGUID(self, v41, v42, v43),
        uint64_t v45 = objc_claimAutoreleasedReturnValue(),
        uint64_t v49 = objc_msgSend_length(v45, v46, v47, v48),
        v45,
        v44,
        v49))
  {
    uint64_t v53 = objc_msgSend_balloonBundleID(self, v50, v51, v52);
    int isEqualToString = objc_msgSend_isEqualToString_(v53, v54, *MEMORY[0x1E4F6CAE8], v55);

    if (isEqualToString)
    {
      v406 = objc_msgSend_locale(self, v57, v58, v59);
    }
    else
    {
      v406 = 0;
    }
    id v376 = objc_alloc(MEMORY[0x1E4F6E5E0]);
    uint64_t v384 = objc_msgSend_time(self, v177, v178, v179);
    v400 = objc_msgSend_messageSubject(self, v180, v181, v182);
    v403 = objc_msgSend_string(v400, v183, v184, v185);
    v405 = objc_msgSend_fileTransferGUIDs(self, v186, v187, v188);
    uint64_t v374 = objc_msgSend_flags(self, v189, v190, v191);
    v394 = objc_msgSend_guid(self, v192, v193, v194);
    uint64_t v372 = objc_msgSend_messageID(self, v195, v196, v197);
    v399 = objc_msgSend_loginIMHandle(v5, v198, v199, v200);
    v404 = objc_msgSend_ID(v399, v201, v202, v203);
    v402 = objc_msgSend_uniqueID(v5, v204, v205, v206);
    v393 = objc_msgSend_internalName(v5, v207, v208, v209);
    v398 = objc_msgSend_subject(self, v210, v211, v212);
    v392 = objc_msgSend_ID(v398, v213, v214, v215);
    v397 = objc_msgSend_subject(self, v216, v217, v218);
    v391 = objc_msgSend_originalID(v397, v219, v220, v221);
    v396 = objc_msgSend_subject(self, v222, v223, v224);
    uint64_t v382 = objc_msgSend_countryCode(v396, v225, v226, v227);
    v401 = objc_msgSend_balloonBundleID(self, v228, v229, v230);
    uint64_t v380 = objc_msgSend_payloadData(self, v231, v232, v233);
    uint64_t v378 = objc_msgSend_expressiveSendStyleID(self, v234, v235, v236);
    uint64_t v240 = objc_msgSend_timeExpressiveSendPlayed(self, v237, v238, v239);
    v387 = objc_msgSend_error(self, v241, v242, v243);
    int v370 = objc_msgSend_code(v387, v244, v245, v246);
    uint64_t v250 = objc_msgSend_associatedMessageGUID(self, v247, v248, v249);
    uint64_t v369 = objc_msgSend_associatedMessageType(self, v251, v252, v253);
    uint64_t v257 = objc_msgSend_associatedMessageRange(self, v254, v255, v256);
    v259 = v258;
    uint64_t v262 = objc_msgSend_associatedMessageEmoji(self, v258, v260, v261);
    uint64_t v266 = objc_msgSend_biaReferenceID(self, v263, v264, v265);
    uint64_t v270 = objc_msgSend_messageSummaryInfo(self, v267, v268, v269);
    uint64_t v274 = objc_msgSend_threadIdentifier(self, v271, v272, v273);
    uint64_t v278 = objc_msgSend_scheduleType(self, v275, v276, v277);
    uint64_t v282 = objc_msgSend_scheduleState(self, v279, v280, v281);
    uint64_t v366 = v388;
    uint64_t v367 = v274;
    uint64_t v368 = v278;
    uint64_t v167 = (void *)v274;
    uint64_t v168 = (void *)v270;
    uint64_t v365 = v270;
    v389 = (void *)v266;
    uint64_t v363 = v266;
    v385 = (void *)v262;
    v358 = v259;
    uint64_t v360 = v262;
    id v169 = (void *)v250;
    uint64_t v355 = v250;
    id v170 = (void *)v240;
    uint64_t v171 = (void *)v378;
    uint64_t v352 = v240;
    id v173 = (void *)v380;
    uint64_t v176 = (void *)v384;
    id v172 = (void *)v382;
    timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState = objc_msgSend_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState_(v376, v283, (uint64_t)v395, v384, 0, 0, 0, v403, v407, 0, 0, v405, v374, v394, v372, v404, v402, v393, v392, 0, v391, v382, 0, v401, v380, v378, v352, v370, v355, v369, v257, v358, v360, 0, v406, v363, v365, v366, v367, v368, v282);
  }
  else
  {
    id v375 = objc_alloc(MEMORY[0x1E4F6E850]);
    v406 = objc_msgSend_time(self, v60, v61, v62);
    v383 = objc_msgSend_messageSubject(self, v63, v64, v65);
    v400 = objc_msgSend_string(v383, v66, v67, v68);
    v403 = objc_msgSend_fileTransferGUIDs(self, v69, v70, v71);
    uint64_t v373 = objc_msgSend_flags(self, v72, v73, v74);
    v405 = objc_msgSend_guid(self, v75, v76, v77);
    uint64_t v371 = objc_msgSend_messageID(self, v78, v79, v80);
    v394 = objc_msgSend_loginIMHandle(v5, v81, v82, v83);
    v399 = objc_msgSend_ID(v394, v84, v85, v86);
    v404 = objc_msgSend_uniqueID(v5, v87, v88, v89);
    v402 = objc_msgSend_internalName(v5, v90, v91, v92);
    v393 = objc_msgSend_subject(self, v93, v94, v95);
    v398 = objc_msgSend_ID(v393, v96, v97, v98);
    v392 = objc_msgSend_subject(self, v99, v100, v101);
    v397 = objc_msgSend_originalID(v392, v102, v103, v104);
    v391 = objc_msgSend_subject(self, v105, v106, v107);
    v396 = objc_msgSend_countryCode(v391, v108, v109, v110);
    uint64_t v381 = objc_msgSend_balloonBundleID(self, v111, v112, v113);
    v401 = objc_msgSend_payloadData(self, v114, v115, v116);
    uint64_t v379 = objc_msgSend_expressiveSendStyleID(self, v117, v118, v119);
    uint64_t v377 = objc_msgSend_timeExpressiveSendPlayed(self, v120, v121, v122);
    uint64_t v126 = objc_msgSend_bizIntent(self, v123, v124, v125);
    uint64_t v130 = objc_msgSend_locale(self, v127, v128, v129);
    uint64_t v134 = objc_msgSend_biaReferenceID(self, v131, v132, v133);
    v385 = objc_msgSend_error(self, v135, v136, v137);
    int v386 = objc_msgSend_code(v385, v138, v139, v140);
    uint64_t v144 = objc_msgSend_threadIdentifier(self, v141, v142, v143);
    uint64_t v148 = objc_msgSend_syndicationRanges(self, v145, v146, v147);
    uint64_t v152 = objc_msgSend_syncedSyndicationRanges(self, v149, v150, v151);
    uint64_t v156 = objc_msgSend_dateEdited(self, v153, v154, v155);
    uint64_t v160 = v39;
    uint64_t v161 = objc_msgSend_scheduleType(self, v157, v158, v159);
    uint64_t v165 = objc_msgSend_scheduleState(self, v162, v163, v164);
    uint64_t v364 = v161;
    uint64_t v166 = v160;
    uint64_t v361 = v152;
    uint64_t v362 = v388;
    uint64_t v167 = (void *)v152;
    uint64_t v168 = (void *)v148;
    uint64_t v359 = v148;
    v389 = (void *)v144;
    int v357 = v386;
    id v169 = (void *)v134;
    uint64_t v356 = v134;
    v387 = (void *)v130;
    uint64_t v353 = v126;
    uint64_t v354 = v130;
    id v170 = (void *)v126;
    uint64_t v171 = (void *)v377;
    id v172 = (void *)v381;
    id v173 = (void *)v379;
    timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState = objc_msgSend_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_(v375, v174, v166, (uint64_t)v406, 0, 0, 0, v400, v407, 0, 0, v403, v373, v405, v371, v399, v404, v402, v398, 0, v397, v396, 0, v381, v401, v379, v377, v353, v354, v356, v357, v144, v359, v361, v362, v156, v364, v165);

    uint64_t v176 = v383;
  }

  if (objc_msgSend_isReply(self, v284, v285, v286))
  {
    v290 = objc_msgSend_threadOriginator(self, v287, v288, v289);
    v294 = objc_msgSend__imMessageItem(v290, v291, v292, v293);
    objc_msgSend_setThreadOriginator_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v295, (uint64_t)v294, v296);
  }
  v297 = objc_msgSend_replyCountsByPart(self, v287, v288, v289);
  objc_msgSend_setReplyCountsByPart_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v298, (uint64_t)v297, v299);

  v303 = objc_msgSend_sender(self, v300, v301, v302);
  v307 = objc_msgSend_subject(self, v304, v305, v306);
  objc_msgSend__updateContextWithSenderHandle_otherHandle_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v308, (uint64_t)v303, (uint64_t)v307);

  uint64_t isInvitationMessage = objc_msgSend_isInvitationMessage(self, v309, v310, v311);
  objc_msgSend__setInvitation_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v313, isInvitationMessage, v314);
  uint64_t v318 = objc_msgSend_useStandalone(self, v315, v316, v317);
  objc_msgSend_setUseStandalone_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v319, v318, v320);
  uint64_t shouldNotifyOnSend = objc_msgSend_shouldNotifyOnSend(self, v321, v322, v323);
  objc_msgSend_setShouldNotifyOnSend_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v325, shouldNotifyOnSend, v326);
  uint64_t v330 = objc_msgSend_sentViaRemoteIntent(self, v327, v328, v329);
  objc_msgSend_setSentViaRemoteIntent_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v331, v330, v332);
  v336 = objc_msgSend_messageSummaryInfo(self, v333, v334, v335);
  objc_msgSend_setMessageSummaryInfo_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v337, (uint64_t)v336, v338);

  uint64_t v342 = objc_msgSend_sortID(self, v339, v340, v341);
  objc_msgSend_setSortID_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v343, v342, v344);
  v348 = objc_msgSend_groupActivity(self, v345, v346, v347);
  objc_msgSend_setGroupActivity_(timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState, v349, (uint64_t)v348, v350);

  return (IMMessageItem *)timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_errorType_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_bizIntent_locale_biaReferenceID_messageSummaryInfo_partCount_threadIdentifier_scheduleType_scheduleState;
}

+ (id)messageFromIMMessageItemDictionary:(id)a3 body:(id)a4 sender:(id)a5 subject:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v216 = a6;
  uint64_t v200 = (objc_class *)objc_msgSend_messageClass(IMChatRegistry, v12, v13, v14);
  uint64_t v17 = objc_msgSend_objectForKey_(v9, v15, @"flags", v16);
  uint64_t v194 = objc_msgSend_unsignedLongLongValue(v17, v18, v19, v20);

  uint64_t v23 = objc_msgSend_objectForKey_(v9, v21, @"error", v22);
  unsigned int v27 = objc_msgSend_unsignedIntValue(v23, v24, v25, v26);

  if (v27)
  {
    uint64_t v214 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v28, @"__kIMMessageErrorDomain", v27, 0);
  }
  else
  {
    uint64_t v214 = 0;
  }
  uint64_t v30 = objc_msgSend_objectForKey_(v9, v28, @"subject", v29);
  uint64_t v217 = objc_msgSend_objectForKey_(v9, v31, @"plainBody", v32);
  uint64_t v35 = objc_msgSend_objectForKey_(v9, v33, @"bodyData", v34);
  v213 = objc_msgSend_objectForKey_(v9, v36, @"balloonBundleID", v37);
  uint64_t v212 = objc_msgSend_objectForKey_(v9, v38, @"payloadData", v39);
  uint64_t v211 = objc_msgSend_objectForKey_(v9, v40, @"expressiveSendStyleID", v41);
  uint64_t v210 = objc_msgSend_objectForKey_(v9, v42, @"associatedMessageGUID", v43);
  if (v30)
  {
    id v47 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v209 = objc_msgSend_initWithString_(v47, v48, v30, v49);
  }
  else
  {
    uint64_t v209 = 0;
  }
  uint64_t v196 = (void *)v30;
  if (!v10)
  {
    if (objc_msgSend_length(v217, v44, v45, v46))
    {
      id v54 = objc_alloc(MEMORY[0x1E4F28B18]);
      if (qword_1E965E9F0 != -1) {
        dispatch_once(&qword_1E965E9F0, &unk_1EF8E66E8);
      }
      id v10 = (id)objc_msgSend_initWithString_attributes_(v54, v53, (uint64_t)v217, qword_1E965E9E8);
    }
    else if (objc_msgSend_length(v35, v50, v51, v52))
    {
      uint64_t v55 = (void *)MEMORY[0x1A6264150]();
      JWDecodeCodableObjectWithStandardAllowlist();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  uint64_t v195 = v35;
  uint64_t v56 = objc_msgSend_objectForKey_(v9, v44, @"time", v46);
  uint64_t v59 = objc_msgSend_objectForKey_(v9, v57, @"timeDelivered", v58);
  uint64_t v62 = objc_msgSend_objectForKey_(v9, v60, @"timeRead", v61);
  uint64_t v65 = objc_msgSend_objectForKey_(v9, v63, @"timePlayed", v64);
  uint64_t v68 = objc_msgSend_objectForKey_(v9, v66, @"timeExpressiveSendPlayed", v67);
  uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v9, v69, @"associatedMessageRangeLocation", v70);
  uint64_t v189 = objc_msgSend_integerValue(v71, v72, v73, v74);

  uint64_t v77 = objc_msgSend_objectForKeyedSubscript_(v9, v75, @"associatedMessageRangeLength", v76);
  uint64_t v188 = objc_msgSend_integerValue(v77, v78, v79, v80);

  uint64_t v208 = objc_msgSend_objectForKey_(v9, v81, @"associatedMessageEmoji", v82);
  uint64_t v207 = objc_msgSend_objectForKey_(v9, v83, @"threadIdentifier", v84);
  uint64_t v206 = objc_msgSend_objectForKey_(v9, v85, @"dateEdited", v86);
  uint64_t v205 = objc_msgSend_objectForKey_(v9, v87, @"scheduleType", v88);
  uint64_t v204 = objc_msgSend_objectForKey_(v9, v89, @"scheduleState", v90);
  if (v68)
  {
    uint64_t v94 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v68, v91, v92, v93);
    uint64_t v203 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v94, v95, v96, v97);
  }
  else
  {
    uint64_t v203 = 0;
  }
  if (v206)
  {
    uint64_t v98 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v206, v91, v92, v93);
    uint64_t v202 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v98, v99, v100, v101);
  }
  else
  {
    uint64_t v202 = 0;
  }
  id v187 = [v200 alloc];
  if (v56)
  {
    uint64_t v105 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v56, v102, v103, v104);
    uint64_t v201 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v105, v106, v107, v108);
    if (v62) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v199 = 0;
    if (v59) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  uint64_t v201 = 0;
  if (!v62) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v109 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend_doubleValue(v62, v102, v103, v104);
  uint64_t v199 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v109, v110, v111, v112);
  if (v59)
  {
LABEL_24:
    uint64_t v113 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v59, v102, v103, v104);
    uint64_t v198 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v113, v114, v115, v116);
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v198 = 0;
LABEL_28:
  uint64_t v197 = v11;
  uint64_t v215 = v10;
  uint64_t v192 = v59;
  uint64_t v193 = v56;
  uint64_t v190 = v68;
  uint64_t v191 = v62;
  uint64_t v186 = v65;
  if (v65)
  {
    uint64_t v117 = (void *)MEMORY[0x1E4F1C9C8];
    objc_msgSend_doubleValue(v65, v102, v103, v104);
    uint64_t v121 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v117, v118, v119, v120);
  }
  else
  {
    uint64_t v121 = 0;
  }
  uint64_t v122 = objc_msgSend_objectForKey_(v9, v102, @"fileTransferGUIDs", v104);
  uint64_t v125 = objc_msgSend_objectForKey_(v9, v123, @"guid", v124);
  uint64_t v128 = objc_msgSend_objectForKey_(v9, v126, @"messageID", v127);
  uint64_t v132 = objc_msgSend_longLongValue(v128, v129, v130, v131);
  uint64_t v135 = objc_msgSend_objectForKey_(v9, v133, @"associatedMessageType", v134);
  uint64_t v139 = objc_msgSend_longLongValue(v135, v136, v137, v138);
  uint64_t v142 = objc_msgSend_objectForKey_(v9, v140, @"messageSummaryInfo", v141);
  uint64_t v146 = objc_msgSend_unsignedIntegerValue(v205, v143, v144, v145);
  uint64_t v150 = objc_msgSend_unsignedIntegerValue(v204, v147, v148, v149);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v187, v151, (uint64_t)v197, (uint64_t)v201, v199, v198, v121, v217, v215, v209, v122, v194, v214, v125, v132, v216, v213, v212, v211, v203, v210, v139, v189, v188, v208, v142, v207, v202, v146, v150);

  if (v186) {
  if (v192)
  }

  if (v191) {
  if (v193)
  }

  if (objc_msgSend_isEmote(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v153, v154, v155))uint64_t v159 = v194 | 2; {
  else
  }
    uint64_t v159 = v194;
  if (objc_msgSend_isEmpty(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v156, v157, v158))v159 |= 8uLL; {
  if (objc_msgSend_hasMention(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v160, v161, v162))v159 |= 0x20000000uLL;
  }
  if (objc_msgSend_isAddressedToMe(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v163, v164, v165))objc_msgSend__updateFlags_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v166, v159 | 0x800, v167); {
  else
  }
    objc_msgSend__updateFlags_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v166, v159, v167);
  id v170 = objc_msgSend_objectForKey_(v9, v168, @"threadOriginator", v169);
  id v172 = objc_msgSend_messageFromIMMessageItemDictionary_body_sender_subject_(IMMessage, v171, (uint64_t)v170, 0, 0, 0);
  objc_msgSend_setThreadOriginator_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v173, (uint64_t)v172, v174);
  uint64_t v177 = objc_msgSend_objectForKey_(v9, v175, @"syndicationRanges", v176);
  objc_msgSend__syndicationRanges_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v178, (uint64_t)v177, v179);

  uint64_t v182 = objc_msgSend_objectForKey_(v9, v180, @"syncedSyndicationRanges", v181);
  objc_msgSend__syncedSyndicationRanges_(timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState, v183, (uint64_t)v182, v184);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

- (id)messagesBySeparatingRichLinks
{
  v146[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Separate rich links", buf, 2u);
    }
  }
  BOOL v4 = self;
  uint64_t v8 = objc_msgSend_payloadData(v4, v5, v6, v7);
  BOOL v12 = objc_msgSend_length(v8, v9, v10, v11) != 0;

  uint64_t v16 = objc_msgSend_fileTransferGUIDs(v4, v13, v14, v15);
  BOOL v20 = objc_msgSend_count(v16, v17, v18, v19) != 0;

  if (v12 && v20)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = objc_msgSend_payloadData(v4, v26, v27, v28);
        uint64_t v33 = objc_msgSend_length(v29, v30, v31, v32);
        uint64_t v37 = objc_msgSend_fileTransferGUIDs(v4, v34, v35, v36);
        uint64_t v41 = objc_msgSend_count(v37, v38, v39, v40);
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v41;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Not splitting message, payloadData.length: %lu, transfers.count: %lu", buf, 0x16u);
      }
    }
    v146[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v146, 1);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v143 = sub_1A4B3454C;
    uint64_t v144 = sub_1A4B3438C;
    id v145 = 0;
    v140[0] = 0;
    v140[1] = v140;
    v140[2] = 0x3032000000;
    v140[3] = sub_1A4B3454C;
    v140[4] = sub_1A4B3438C;
    id v141 = 0;
    objc_msgSend_guid(v4, v21, v22, v23);
    id v141 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v136 = 0;
    uint64_t v137 = &v136;
    uint64_t v138 = 0x2020000000;
    char v139 = 0;
    v134[0] = 0;
    v134[1] = v134;
    v134[2] = 0x2020000000;
    char v135 = 1;
    uint64_t v128 = 0;
    uint64_t v129 = &v128;
    uint64_t v130 = 0x3032000000;
    uint64_t v131 = sub_1A4B3454C;
    uint64_t v132 = sub_1A4B3438C;
    id v133 = 0;
    objc_msgSend_text(v4, v43, v44, v45);
    id v133 = (id)objc_claimAutoreleasedReturnValue();
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x3032000000;
    v126[3] = sub_1A4B3454C;
    v126[4] = sub_1A4B3438C;
    id v127 = 0;
    objc_msgSend_text(v4, v46, v47, v48);
    id v127 = (id)objc_claimAutoreleasedReturnValue();
    id v49 = sub_1A4C3DD1C((void *)v129[5]);
    uint64_t v50 = (void *)v129[5];
    v129[5] = (uint64_t)v49;

    uint64_t v51 = (void *)v129[5];
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = sub_1A4BF9548;
    v118[3] = &unk_1E5B7DB80;
    uint64_t v120 = &v128;
    uint64_t v121 = v126;
    uint64_t v122 = v140;
    uint64_t v52 = v4;
    uint64_t v119 = v52;
    uint64_t v123 = v134;
    uint64_t v124 = &v136;
    uint64_t v125 = buf;
    IMRichLinkUtilitiesEnumerateRichLinksInAttributedString(v51, 1, v118);
    if (*((unsigned char *)v137 + 24))
    {
      uint64_t v116 = [IMMessage alloc];
      uint64_t v117 = objc_msgSend_sender(v52, v53, v54, v55);
      uint64_t v59 = objc_msgSend_time(v52, v56, v57, v58);
      uint64_t v63 = objc_msgSend_messageSubject(v52, v60, v61, v62);
      uint64_t v67 = objc_msgSend_flags(v52, v64, v65, v66);
      uint64_t v71 = objc_msgSend_guid(v52, v68, v69, v70);
      uint64_t v75 = objc_msgSend_subject(v52, v72, v73, v74);
      uint64_t v79 = objc_msgSend_expressiveSendStyleID(v52, v76, v77, v78);
      uint64_t v83 = objc_msgSend_threadIdentifier(v52, v80, v81, v82);
      uint64_t v87 = objc_msgSend_scheduleType(v52, v84, v85, v86);
      uint64_t v91 = objc_msgSend_scheduleState(v52, v88, v89, v90);
      uint64_t v93 = objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_balloonBundleID_payloadData_expressiveSendStyleID_threadIdentifier_scheduleType_scheduleState_(v116, v92, (uint64_t)v117, (uint64_t)v59, v63, 0, 0, v67, 0, v71, v75, 0, 0, v79, v83, v87, v91);

      uint64_t v97 = objc_msgSend_associatedBalloonBundleID(v52, v94, v95, v96);
      objc_msgSend_setAssociatedBalloonBundleID_(v93, v98, (uint64_t)v97, v99);

      uint64_t v103 = objc_msgSend_sourceApplicationID(v52, v100, v101, v102);
      objc_msgSend_setSourceApplicationID_(v93, v104, (uint64_t)v103, v105);

      if (objc_msgSend_isReply(v93, v106, v107, v108))
      {
        uint64_t v112 = objc_msgSend_threadOriginator(v52, v109, v110, v111);
        objc_msgSend_setThreadOriginator_(v93, v113, (uint64_t)v112, v114);
      }
      objc_msgSend_insertObject_atIndex_(*(void **)(*(void *)&buf[8] + 40), v109, (uint64_t)v93, 0);
    }
    id v42 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(v126, 8);
    _Block_object_dispose(&v128, 8);

    _Block_object_dispose(v134, 8);
    _Block_object_dispose(&v136, 8);
    _Block_object_dispose(v140, 8);

    _Block_object_dispose(buf, 8);
  }

  return v42;
}

- (id)messagesSeparatedByByteLength:(int64_t)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v72 = a3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Separating message by byte length: %ld", buf, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_text(self, v4, v5, v6);
  uint64_t v60 = objc_msgSend_string(v8, v9, v10, v11);

  uint64_t v14 = objc_msgSend___im_separateStringByByteLength_(v60, v12, a3, v13);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v14;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v66, (uint64_t)v70, 16);
  if (v64)
  {
    uint64_t v63 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v67 != v63) {
          objc_enumerationMutation(obj);
        }
        BOOL v20 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v16, v17, v18);
        uint64_t v24 = objc_msgSend_stringByTrimmingCharactersInSet_(v20, v22, (uint64_t)v21, v23);

        if (objc_msgSend_length(v24, v25, v26, v27))
        {
          id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v31 = objc_msgSend_initWithString_(v28, v29, (uint64_t)v20, v30);
          uint64_t v35 = objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v31, v32, v33, v34);
          uint64_t v36 = [IMMessage alloc];
          uint64_t v40 = objc_msgSend_sender(self, v37, v38, v39);
          uint64_t v44 = objc_msgSend_time(self, v41, v42, v43);
          uint64_t v48 = objc_msgSend_flags(self, v45, v46, v47);
          id v49 = StringGUID();
          uint64_t v53 = objc_msgSend_subject(self, v50, v51, v52);
          uint64_t v55 = objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_balloonBundleID_payloadData_expressiveSendStyleID_threadIdentifier_(v36, v54, (uint64_t)v40, (uint64_t)v44, v35, 0, 0, v48, 0, v49, v53, 0, 0, 0, 0);

          objc_msgSend_addObject_(v62, v56, (uint64_t)v55, v57);
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "Dropping empty message", buf, 2u);
          }
        }
      }
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v66, (uint64_t)v70, 16);
    }
    while (v64);
  }

  return v62;
}

- (NSArray)messageParts
{
  uint64_t v8 = objc_msgSend_text(self, a2, v2, v3);
  if (!v8)
  {
    if (objc_msgSend_length(self->_plainBody, v5, v6, v7))
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v8 = objc_msgSend_initWithString_(v9, v10, (uint64_t)self->_plainBody, v11);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  BOOL v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4BFA43C;
  v21[3] = &unk_1E5B7DBA8;
  id v22 = v12;
  id v13 = v12;
  objc_msgSend___im_visitMessageParts_(v8, v14, (uint64_t)v21, v15);
  uint64_t v19 = objc_msgSend_copy(v13, v16, v17, v18);

  return (NSArray *)v19;
}

- (id)messagePartMatchingPartIndex:(int64_t)a3
{
  id v9 = objc_msgSend_text(self, a2, a3, v3);
  if (!v9)
  {
    if (objc_msgSend_length(self->_plainBody, v6, v7, v8))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v9 = objc_msgSend_initWithString_(v10, v11, (uint64_t)self->_plainBody, v12);
      objc_msgSend___im_messagePartMatchingPartIndex_(v9, v13, a3, v14);
      goto LABEL_6;
    }
    id v9 = 0;
  }
  objc_msgSend___im_messagePartMatchingPartIndex_(v9, v6, a3, v8);
  uint64_t v15 = LABEL_6:;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (IMMessage *)a3;
  if (v6 == self)
  {
    unsigned __int8 v27 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      unint64_t flags = self->_flags;
      if (flags != objc_msgSend_flags(v7, v9, v10, v11)
        || (int64_t messageID = self->_messageID, messageID != objc_msgSend_messageID(v7, v12, v13, v14)))
      {
        unsigned __int8 v27 = 0;
LABEL_94:

        goto LABEL_95;
      }
      guid = self->_guid;
      objc_msgSend_guid(v7, v16, v17, v18);
      uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (guid != v23)
      {
        uint64_t v24 = self->_guid;
        uint64_t v3 = objc_msgSend_guid(v7, v20, v21, v22);
        if (!objc_msgSend_isEqualToString_(v24, v25, (uint64_t)v3, v26))
        {
          unsigned __int8 v27 = 0;
          goto LABEL_92;
        }
      }
      sender = self->_sender;
      objc_msgSend_sender(v7, v20, v21, v22);
      uint64_t v32 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      if (sender != v32)
      {
        unsigned __int8 v27 = 0;
LABEL_13:

        goto LABEL_91;
      }
      subject = self->_subject;
      objc_msgSend_subject(v7, v29, v30, v31);
      uint64_t v34 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      if (subject != v34)
      {

LABEL_90:
        unsigned __int8 v27 = 0;
        goto LABEL_91;
      }
      uint64_t v132 = subject;
      time = self->_time;
      objc_msgSend_time(v7, v35, v36, v37);
      uint64_t v130 = time;
      uint64_t v131 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (time != v131)
      {
        uint64_t v42 = self->_time;
        BOOL v4 = objc_msgSend_time(v7, v39, v40, v41);
        if ((objc_msgSend_isEqualToDate_(v42, v43, (uint64_t)v4, v44) & 1) == 0)
        {

LABEL_89:
          goto LABEL_90;
        }
        uint64_t v126 = v4;
      }
      timeRead = self->_timeRead;
      objc_msgSend_timeRead(v7, v39, v40, v41);
      uint64_t v128 = timeRead;
      uint64_t v129 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (timeRead != v129)
      {
        id v49 = self->_timeRead;
        uint64_t v50 = objc_msgSend_timeRead(v7, v46, v47, v48);
        uint64_t v51 = v49;
        timeRead = (NSDate *)v50;
        if ((objc_msgSend_isEqualToDate_(v51, v52, v50, v53) & 1) == 0)
        {

          uint64_t v54 = v131;
          if (v130 != v131) {

          }
          goto LABEL_88;
        }
      }
      uint64_t v124 = timeRead;
      timeDelivered = self->_timeDelivered;
      objc_msgSend_timeDelivered(v7, v46, v47, v48);
      id v127 = (NSDate *)objc_claimAutoreleasedReturnValue();
      uint64_t v125 = timeDelivered;
      if (timeDelivered != v127)
      {
        uint64_t v59 = self->_timeDelivered;
        BOOL v4 = objc_msgSend_timeDelivered(v7, v56, v57, v58);
        if ((objc_msgSend_isEqualToDate_(v59, v60, (uint64_t)v4, v61) & 1) == 0)
        {

          uint64_t v54 = v131;
          if (v128 == v129)
          {
          }
          else
          {
          }
          uint64_t v97 = v126;
          if (v130 == v131) {
            goto LABEL_88;
          }
          goto LABEL_54;
        }
      }
      timePlayed = self->_timePlayed;
      objc_msgSend_timePlayed(v7, v56, v57, v58);
      uint64_t v122 = timePlayed;
      uint64_t v123 = (NSDate *)objc_claimAutoreleasedReturnValue();
      uint64_t v121 = v4;
      if (timePlayed != v123)
      {
        long long v66 = self->_timePlayed;
        uint64_t v67 = objc_msgSend_timePlayed(v7, v63, v64, v65);
        long long v68 = v66;
        long long v69 = (void *)v67;
        if ((objc_msgSend_isEqualToDate_(v68, v70, v67, v71) & 1) == 0)
        {

          uint64_t v54 = v131;
          if (v125 == v127)
          {
          }
          else
          {
          }
          uint64_t v97 = v126;
          if (v128 != v129) {

          }
          if (v130 == v131) {
            goto LABEL_88;
          }
LABEL_54:

LABEL_88:
          goto LABEL_89;
        }
        uint64_t v116 = v69;
      }
      text = self->_text;
      objc_msgSend_text(v7, v63, v64, v65);
      uint64_t v120 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      uint64_t v118 = text;
      if (text != v120)
      {
        uint64_t v76 = self->_text;
        uint64_t v77 = objc_msgSend_text(v7, v73, v74, v75);
        if ((objc_msgSend_isEqualToAttributedString_(v76, v78, (uint64_t)v77, v79) & 1) == 0)
        {

          uint64_t v54 = v131;
          if (v122 == v123)
          {
          }
          else
          {
          }
          uint64_t v108 = v126;
          uint64_t v109 = v130;
          if (v125 == v127)
          {
          }
          else
          {

            uint64_t v108 = v126;
            uint64_t v109 = v130;
          }
          if (v128 != v129) {

          }
          if (v109 != v131) {
          goto LABEL_88;
          }
        }
        uint64_t v113 = v77;
      }
      messageSubject = self->_messageSubject;
      objc_msgSend_messageSubject(v7, v73, v74, v75);
      uint64_t v119 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      uint64_t v117 = messageSubject;
      if (messageSubject == v119
        || (uint64_t v84 = self->_messageSubject,
            objc_msgSend_messageSubject(v7, v81, v82, v83),
            uint64_t v115 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqualToAttributedString_(v84, v85, (uint64_t)v115, v86)))
      {
        fileTransferGUIDs = self->_fileTransferGUIDs;
        objc_msgSend_fileTransferGUIDs(v7, v81, v82, v83);
        uint64_t v93 = (NSArray *)objc_claimAutoreleasedReturnValue();
        uint64_t v114 = fileTransferGUIDs;
        if (fileTransferGUIDs == v93
          || (uint64_t v94 = self->_fileTransferGUIDs,
              objc_msgSend_fileTransferGUIDs(v7, v90, v91, v92),
              uint64_t v112 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_isEqualToArray_(v94, v95, (uint64_t)v112, v96)))
        {
          uint64_t v98 = objc_msgSend_code(self->_error, v90, v91, v92);
          uint64_t v102 = objc_msgSend_error(v7, v99, v100, v101);
          unsigned __int8 v27 = v98 == objc_msgSend_code(v102, v103, v104, v105);

          if (v114 == v93)
          {

            if (v117 != v119) {
            if (v118 != v120)
            }

            if (v122 != v123) {
            uint64_t v110 = v127;
            }
            if (v125 != v127)
            {

              uint64_t v110 = v127;
            }

            if (v128 != v129) {
            if (v130 != v131)
            }

            goto LABEL_13;
          }
        }
        else
        {
          unsigned __int8 v27 = 0;
        }
        uint64_t v87 = v131;

        uint64_t v88 = v123;
        if (v117 == v119)
        {

          uint64_t v107 = v118;
          uint64_t v106 = v120;
          goto LABEL_56;
        }
      }
      else
      {
        unsigned __int8 v27 = 0;
        uint64_t v87 = v131;
        uint64_t v88 = v123;
      }
      uint64_t v106 = v120;

      uint64_t v107 = v118;
LABEL_56:
      if (v107 != v106) {

      }
      if (v122 != v88) {
      if (v125 != v127)
      }

      if (v128 != v129) {
      if (v130 != v87)
      }

LABEL_91:
      if (guid == v23)
      {
LABEL_93:

        goto LABEL_94;
      }
LABEL_92:

      goto LABEL_93;
    }
    v133.receiver = self;
    v133.super_class = (Class)IMMessage;
    unsigned __int8 v27 = [(IMMessage *)&v133 isEqual:v6];
  }
LABEL_95:

  return v27;
}

- (id)description
{
  if (qword_1E965E748 != -1) {
    dispatch_once(&qword_1E965E748, &unk_1EF8E5538);
  }
  uint64_t v189 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v200 = NSStringFromClass(v3);
  uint64_t v199 = objc_msgSend_ID(self->_sender, v4, v5, v6);
  uint64_t v198 = objc_msgSend_ID(self->_subject, v7, v8, v9);
  uint64_t v194 = objc_msgSend_account(self->_sender, v10, v11, v12);
  uint64_t v197 = objc_msgSend_uniqueID(v194, v13, v14, v15);
  uint64_t v193 = objc_msgSend_account(self->_sender, v16, v17, v18);
  uint64_t v192 = objc_msgSend_service(v193, v19, v20, v21);
  uint64_t v196 = objc_msgSend_internalName(v192, v22, v23, v24);
  unint64_t flags = self->_flags;
  uint64_t v25 = (void (*)(void))off_1E965E740;
  uint64_t v191 = objc_msgSend_string(self->_messageSubject, v26, v27, v28);
  uint64_t v195 = v25();
  uint64_t v29 = (void (*)(void))off_1E965E740;
  uint64_t v188 = objc_msgSend_string(self->_text, v30, v31, v32);
  uint64_t v181 = v29();
  int64_t messageID = self->_messageID;
  guid = self->_guid;
  uint64_t v33 = NSNumber;
  id v187 = objc_msgSend__imMessageItem(self, v34, v35, v36);
  uint64_t v40 = objc_msgSend_sortID(v187, v37, v38, v39);
  uint64_t v179 = objc_msgSend_numberWithUnsignedInteger_(v33, v41, v40, v42);
  objc_msgSend_timeIntervalSinceReferenceDate(self->_time, v43, v44, v45);
  uint64_t v47 = v46;
  objc_msgSend_timeIntervalSinceReferenceDate(self->_timeDelivered, v48, v49, v50);
  uint64_t v52 = v51;
  objc_msgSend_timeIntervalSinceReferenceDate(self->_timeRead, v53, v54, v55);
  uint64_t v57 = v56;
  objc_msgSend_timeIntervalSinceReferenceDate(self->_timePlayed, v58, v59, v60);
  uint64_t v62 = v61;
  if (objc_msgSend_isEmpty(self, v63, v64, v65)) {
    long long v69 = @"YES";
  }
  else {
    long long v69 = @"NO";
  }
  uint64_t v183 = v69;
  if (objc_msgSend_isFinished(self, v66, v67, v68)) {
    uint64_t v73 = @"YES";
  }
  else {
    uint64_t v73 = @"NO";
  }
  uint64_t v182 = v73;
  if (objc_msgSend_isSent(self, v70, v71, v72)) {
    uint64_t v77 = @"YES";
  }
  else {
    uint64_t v77 = @"NO";
  }
  uint64_t v180 = v77;
  if (objc_msgSend_isRead(self, v74, v75, v76)) {
    uint64_t v81 = @"YES";
  }
  else {
    uint64_t v81 = @"NO";
  }
  uint64_t v178 = v81;
  if (objc_msgSend_isDelivered(self, v78, v79, v80)) {
    uint64_t v85 = @"YES";
  }
  else {
    uint64_t v85 = @"NO";
  }
  uint64_t v177 = v85;
  if (objc_msgSend_isAudioMessage(self, v82, v83, v84)) {
    uint64_t v89 = @"YES";
  }
  else {
    uint64_t v89 = @"NO";
  }
  uint64_t v176 = v89;
  if (objc_msgSend_isPlayed(self, v86, v87, v88)) {
    uint64_t v93 = @"YES";
  }
  else {
    uint64_t v93 = @"NO";
  }
  id v175 = v93;
  if (objc_msgSend_isFromMe(self, v90, v91, v92)) {
    uint64_t v97 = @"YES";
  }
  else {
    uint64_t v97 = @"NO";
  }
  uint64_t v168 = v97;
  if (objc_msgSend_isEmote(self, v94, v95, v96)) {
    uint64_t v101 = @"YES";
  }
  else {
    uint64_t v101 = @"NO";
  }
  id v173 = v101;
  if (objc_msgSend_hasDataDetectorResults(self, v98, v99, v100)) {
    uint64_t v105 = @"YES";
  }
  else {
    uint64_t v105 = @"NO";
  }
  uint64_t v171 = v105;
  if (objc_msgSend_wasDataDetected(self, v102, v103, v104)) {
    uint64_t v109 = @"YES";
  }
  else {
    uint64_t v109 = @"NO";
  }
  uint64_t v169 = v109;
  uint64_t v163 = objc_msgSend_error(self, v106, v107, v108);
  id v172 = objc_msgSend_associatedMessageGUID(self, v110, v111, v112);
  uint64_t v164 = objc_msgSend_associatedMessageType(self, v113, v114, v115);
  id v170 = objc_msgSend_associatedMessageEmoji(self, v116, v117, v118);
  uint64_t v167 = objc_msgSend_balloonBundleID(self, v119, v120, v121);
  uint64_t v162 = objc_msgSend_expressiveSendStyleID(self, v122, v123, v124);
  uint64_t v174 = objc_msgSend_timeExpressiveSendPlayed(self, v125, v126, v127);
  objc_msgSend_timeIntervalSinceReferenceDate(v174, v128, v129, v130);
  uint64_t v132 = v131;
  long long v165 = *(_OWORD *)&self->_threadIdentifier;
  long long v166 = *(_OWORD *)&self->_bizIntent;
  replyCountsByPart = self->_replyCountsByPart;
  uint64_t v136 = objc_msgSend_componentsJoinedByString_(self->_syndicationRanges, v134, @",", v135);
  char v139 = objc_msgSend_componentsJoinedByString_(self->_syncedSyndicationRanges, v137, @",", v138);
  objc_msgSend_timeIntervalSinceReferenceDate(self->_dateEdited, v140, v141, v142);
  uint64_t v144 = v143;
  if (objc_msgSend_wasDetonated(self, v145, v146, v147)) {
    uint64_t v150 = @"YES";
  }
  else {
    uint64_t v150 = @"NO";
  }
  uint64_t v151 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v148, self->_scheduleType, v149);
  uint64_t v154 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v152, self->_scheduleState, v153);
  if (objc_msgSend_isPendingSatelliteSend(self, v155, v156, v157)) {
    uint64_t v160 = @"YES";
  }
  else {
    uint64_t v160 = @"NO";
  }
  objc_msgSend_stringWithFormat_(v189, v158, @"%@[from=%@; msg-subject=%@; account:%@; service=%@; flags=%x; subject='%@' text='%@' messageID: %lld GUID:'%@' sortID: %@ date:'%f' date-delivered:'%f' date-read:'%f' date-played:'%f' empty: %@ finished: %@ sent: %@ read: %@ delivered: %@ audio: %@ played: %@ from-me: %@ emote: %@ dd-results: %@ dd-scanned: %@ error: %@ associatedMessageGUID: %@ associatedMessageType: %lld associatedMessageEmoji: %@ balloonBundleID: %@ expressiveSendStyleID: %@ timeExpressiveSendStylePlayed: %f bizIntent:%@ locale:%@ threadIdentifier: %@, threadOriginator: %@, replyCountsByPart: %@, syndicationRanges: %@, syncedSyndicationRanges: %@, dateEdited:'%f', wasDetonated: %@, scheduleType: %@, scheduleState: %@, pendingSatelliteSend: %@]",
    v159,
    v200,
    v199,
    v198,
    v197,
    v196,
    flags,
    v195,
    v181,
    messageID,
    guid,
    v179,
    v47,
    v52,
    v57,
    v62,
    v183,
    v182,
    v180,
    v178,
    v177,
    v176,
    v175,
    v168,
    v173,
    v171,
    v169,
    v163,
    v172,
    v164,
    v170,
    v167,
    v162,
    v132,
    v166,
    v165,
    replyCountsByPart,
    v136,
    v139,
    v144,
    v150,
    v151,
    v154,
  uint64_t v190 = v160);

  return v190;
}

- (NSAttributedString)messageSubject
{
  return self->_messageSubject;
}

- (NSDate)time
{
  return self->_time;
}

- (void)_updateTime:(id)a3
{
}

- (void)_updateText:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)_updateGUID:(id)a3
{
}

- (int64_t)messageID
{
  return self->_messageID;
}

- (void)_updateMessageID:(int64_t)a3
{
  self->_int64_t messageID = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)_updateError:(id)a3
{
}

- (BOOL)isInvitationMessage
{
  return self->_isInvitationMessage;
}

- (void)setIsInvitationMessage:(BOOL)a3
{
  self->_uint64_t isInvitationMessage = a3;
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)_updateFileTransferGUIDs:(id)a3
{
}

- (NSDate)timeDelivered
{
  return self->_timeDelivered;
}

- (void)_updateTimeDelivered:(id)a3
{
}

- (NSDate)timeRead
{
  return self->_timeRead;
}

- (void)_updateTimeRead:(id)a3
{
}

- (NSDate)timePlayed
{
  return self->_timePlayed;
}

- (void)_updateTimePlayed:(id)a3
{
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)_associatedMessageGUID:(id)a3
{
}

- (void)_associatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (_NSRange)associatedMessageRange
{
  NSUInteger length = self->_associatedMessageRange.length;
  NSUInteger location = self->_associatedMessageRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)_associatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)_associatedMessageEmoji:(id)a3
{
}

- (void)_messageSummaryInfo:(id)a3
{
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)_updateBizIntent:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)_updateLocale:(id)a3
{
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (IMMessage)threadOriginator
{
  return self->_threadOriginator;
}

- (NSDictionary)replyCountsByPart
{
  return self->_replyCountsByPart;
}

- (void)setReplyCountsByPart:(id)a3
{
}

- (NSArray)syndicationRanges
{
  return self->_syndicationRanges;
}

- (NSArray)syncedSyndicationRanges
{
  return self->_syncedSyndicationRanges;
}

- (NSDate)dateEdited
{
  return self->_dateEdited;
}

- (void)_updatedDateEdited:(id)a3
{
}

- (void)setPlainBody:(id)a3
{
}

- (void)setBalloonBundleID:(id)a3
{
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
}

- (NSString)associatedBalloonBundleID
{
  return self->_associatedBalloonBundleID;
}

- (NSString)sourceApplicationID
{
  return self->_sourceApplicationID;
}

- (void)setExpressiveSendStyleID:(id)a3
{
}

- (NSDate)timeExpressiveSendPlayed
{
  return self->_timeExpressiveSendPlayed;
}

- (void)setTimeExpressiveSendPlayed:(id)a3
{
}

- (void)setHasMention:(BOOL)a3
{
  self->_hasMention = a3;
}

- (NSData)customTypingIndicatorIcon
{
  return self->_customTypingIndicatorIcon;
}

- (void)setCustomTypingIndicatorIcon:(id)a3
{
}

- (NSString)notificationIDSTokenURI
{
  return self->_notificationIDSTokenURI;
}

- (void)setNotificationIDSTokenURI:(id)a3
{
}

- (BOOL)useStandalone
{
  return self->_useStandalone;
}

- (void)setUseStandalone:(BOOL)a3
{
  self->_useStandalone = a3;
}

- (BOOL)shouldNotifyOnSend
{
  return self->_shouldNotifyOnSend;
}

- (void)setShouldNotifyOnSend:(BOOL)a3
{
  self->_uint64_t shouldNotifyOnSend = a3;
}

- (BOOL)sentViaRemoteIntent
{
  return self->_sentViaRemoteIntent;
}

- (void)setSentViaRemoteIntent:(BOOL)a3
{
  self->_sentViaRemoteIntent = a3;
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

- (NSString)biaReferenceID
{
  return self->_biaReferenceID;
}

- (TUConversationActivity)groupActivity
{
  return self->_groupActivity;
}

- (void)setGroupActivity:(id)a3
{
}

- (unint64_t)sortID
{
  return self->_sortID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivity, 0);
  objc_storeStrong((id *)&self->_biaReferenceID, 0);
  objc_storeStrong((id *)&self->_notificationIDSTokenURI, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_timeExpressiveSendPlayed, 0);
  objc_storeStrong((id *)&self->_expressiveSendStyleID, 0);
  objc_storeStrong((id *)&self->_sourceApplicationID, 0);
  objc_storeStrong((id *)&self->_associatedBalloonBundleID, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
  objc_storeStrong((id *)&self->_balloonBundleID, 0);
  objc_storeStrong((id *)&self->_plainBody, 0);
  objc_storeStrong((id *)&self->_dateEdited, 0);
  objc_storeStrong((id *)&self->_syncedSyndicationRanges, 0);
  objc_storeStrong((id *)&self->_syndicationRanges, 0);
  objc_storeStrong((id *)&self->_replyCountsByPart, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_messageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_timePlayed, 0);
  objc_storeStrong((id *)&self->_timeRead, 0);
  objc_storeStrong((id *)&self->_timeDelivered, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_messageSubject, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

- (BOOL)isRichLinkMessage
{
  BOOL v4 = objc_msgSend__imMessageItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_balloonBundleID(v4, v5, v6, v7);
  char hasPrefix = objc_msgSend_hasPrefix_(v8, v9, *MEMORY[0x1E4F6CC10], v10);

  return hasPrefix;
}

- (id)richLinkDataSourceWithChatContext:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend__imMessageItem(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend__newMessagePartsForMessageItem_chatContext_(IMMessagePartChatItem, v9, (uint64_t)v8, (uint64_t)v4);
  uint64_t v13 = objc_msgSend__transcriptPluginChatItemFromTypeErasedPartChatItems_(self, v11, (uint64_t)v10, v12);
  uint64_t v17 = objc_msgSend_dataSource(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_bundleID(v17, v18, v19, v20);

  if (objc_msgSend_containsString_(v21, v22, *MEMORY[0x1E4F6CC10], v23))
  {
    uint64_t v27 = objc_msgSend_dataSource(v13, v24, v25, v26);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Attempting to access rich link metadata from non-rich link plugin payload. Returning nil.", v30, 2u);
      }
    }
    uint64_t v27 = 0;
  }

  return v27;
}

- (id)_transcriptPluginChatItemFromTypeErasedPartChatItems:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      if (objc_msgSend_count(v5, v6, v7, v8) == 1
        && (objc_msgSend_firstObject(v5, v9, v10, v11),
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v12,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend_firstObject(v5, v14, v15, v16);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (id)_vCardDataWithCLLocation:(id)a3
{
  return (id)MEMORY[0x1F4124708](a3, a2);
}

+ (IMMessage)messageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v17 = objc_msgSend__vCardDataWithCLLocation_(a1, v12, (uint64_t)a3, v13);
  if (v17)
  {
    uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v14, v15, v16);
    uint64_t v21 = objc_msgSend_im_randomTemporaryFileURLWithFileName_(v18, v19, @"CL.loc.vcf", v20);

    uint64_t v55 = (void *)v21;
    objc_msgSend_writeToURL_atomically_(v17, v22, v21, 1);
    uint64_t v26 = objc_msgSend_sharedInstance(IMFileTransferCenter, v23, v24, v25);
    uint64_t v29 = objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(v26, v27, v21, v28);

    id v30 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v54 = objc_msgSend_initWithObjectsAndKeys_(v30, v31, (uint64_t)v29, v32, *MEMORY[0x1E4F6C188], 0);
    id v33 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v35 = objc_msgSend_initWithString_attributes_(v33, v34, *MEMORY[0x1E4F6C110], (uint64_t)v54);
    id v36 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v39 = objc_msgSend_initWithObjects_(v36, v37, (uint64_t)v29, v38, 0);
    objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v35, v40, v41, v42);
    v44 = id v43 = v10;
    id v45 = objc_alloc((Class)a1);
    objc_msgSend_date(MEMORY[0x1E4F1C9C8], v46, v47, v48);
    v50 = id v49 = v11;
    timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v45, v51, 0, (uint64_t)v50, 0, 0, 0, 0, v44, 0, v39, a4, v43, v49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    id v11 = v49;
    id v10 = v43;
  }
  else
  {
    timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = 0;
  }

  return (IMMessage *)timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)textMessageWithLocation:(id)a3 flags:(unint64_t)a4 error:(id)a5 guid:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = IMCurrentLocationURLFromLocation();
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v15 = objc_msgSend_initWithString_(v12, v13, (uint64_t)v11, v14);
    uint64_t v19 = objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v15, v16, v17, v18);
    id v20 = objc_alloc((Class)a1);
    uint64_t v24 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v21, v22, v23);
    timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v20, v25, 0, (uint64_t)v24, 0, 0, 0, 0, v19, 0, 0, a4, v9, v10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = 0;
  }

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)locatingMessageWithGuid:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v12 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v9, v10, v11);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v8, v13, 0, (uint64_t)v12, 0, 0, 0, 0, 0, 0, 0, 8388620, v6, v7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)instantMessageWithAssociatedMessageContent:(id)a3 associatedMessageGUID:(id)a4 associatedMessageType:(int64_t)a5 associatedMessageRange:(_NSRange)a6 associatedMessageEmoji:(id)a7 messageSummaryInfo:(id)a8 threadIdentifier:(id)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc((Class)a1);
  uint64_t v24 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v21, v22, v23);
  uint64_t v28 = objc_msgSend_stringGUID(NSString, v25, v26, v27);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v20, v29, 0, (uint64_t)v24, 0, 0, 0, 0, v19, 0, 0, 5, 0, v28, 0, 0, 0, 0, 0, 0, v18, a5, location, length, v17, v16, v15, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

+ (id)breadcrumbMessageWithText:(id)a3 associatedMessageGUID:(id)a4 balloonBundleID:(id)a5 fileTransferGUIDs:(id)a6 payloadData:(id)a7 threadIdentifier:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc((Class)a1);
  uint64_t v24 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v21, v22, v23);
  uint64_t v28 = objc_msgSend_stringGUID(NSString, v25, v26, v27);
  timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState = objc_msgSend__initWithSender_time_timeRead_timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState_(v20, v29, 0, (uint64_t)v24, 0, 0, 0, 0, v19, 0, v16, 5, 0, v28, 0, 0, v17, v15, 0, 0, v18, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v14, 0, 0, 0);

  return timeDelivered_timePlayed_plainText_text_messageSubject_fileTransferGUIDs_flags_error_guid_messageID_subject_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_associatedMessageGUID_associatedMessageType_associatedMessageRange_associatedMessageEmoji_messageSummaryInfo_threadIdentifier_dateEdited_scheduleType_scheduleState;
}

- (BOOL)isAssociatedMessage
{
  id v4 = objc_msgSend_associatedMessageGUID(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (IMMessage)initWithSender:(id)a3 time:(id)a4 text:(id)a5 messageSubject:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 subject:(id)a11 associatedMessageGUID:(id)a12 associatedMessageType:(int64_t)a13 associatedMessageRange:(_NSRange)a14 associatedMessageInfo:(id)a15
{
  return (IMMessage *)objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_associatedMessageGUID_associatedMessageType_associatedMessageRange_messageSummaryInfo_threadIdentifier_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14.location, a14.length, a15, 0);
}

- (BOOL)isIncomingTypingMessage
{
  uint64_t v4 = MEMORY[0x1E4F6E850];
  uint64_t v5 = objc_msgSend_flags(self, a2, v2, v3);

  return MEMORY[0x1F4181798](v4, sel_isIncomingTypingMessage_, v5, v6);
}

- (BOOL)isCancelTypingMessage
{
  uint64_t v5 = MEMORY[0x1E4F6E850];
  uint64_t v6 = objc_msgSend_flags(self, a2, v2, v3);
  uint64_t hasEditedParts = objc_msgSend_hasEditedParts(self, v7, v8, v9);

  return MEMORY[0x1F4181798](v5, sel_isCancelTypingMessage_isEditedMessage_, v6, hasEditedParts);
}

- (BOOL)isTypingOrCancelTypingMessage
{
  uint64_t v5 = MEMORY[0x1E4F6E850];
  uint64_t v6 = objc_msgSend_flags(self, a2, v2, v3);
  uint64_t hasEditedParts = objc_msgSend_hasEditedParts(self, v7, v8, v9);

  return MEMORY[0x1F4181798](v5, sel_isTypingOrCancelTypingMessage_isEditedMessage_, v6, hasEditedParts);
}

- (BOOL)isIncomingTypingOrCancelTypingMessage
{
  uint64_t v5 = MEMORY[0x1E4F6E850];
  uint64_t v6 = objc_msgSend_flags(self, a2, v2, v3);
  uint64_t hasEditedParts = objc_msgSend_hasEditedParts(self, v7, v8, v9);

  return MEMORY[0x1F4181798](v5, sel_isIncomingTypingOrCancelTypingMessage_isEditedMessage_, v6, hasEditedParts);
}

@end