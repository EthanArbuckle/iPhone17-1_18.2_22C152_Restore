@interface IMAssociatedMessageItem
+ (BOOL)supportsSecureCoding;
- (BOOL)_updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3;
- (BOOL)isAssociatedMessageItem;
- (BOOL)isAvailabilityReplySupported;
- (BOOL)isBreadcrumb;
- (BOOL)isEmojiSticker;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastMessageCandidate;
- (BOOL)isMessageAcknowledgment;
- (BOOL)isSticker;
- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3;
- (IMAssociatedMessageItem)initWithCoder:(id)a3;
- (IMAssociatedMessageItem)initWithDictionary:(id)a3 hint:(id)a4;
- (IMAssociatedMessageItem)initWithMessageItem:(id)a3;
- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 associatedMessageEmoji:(id)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16;
- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 messageSummaryInfo:(id)a14 threadIdentifier:(id)a15;
- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 bizIntent:(id)a33 locale:(id)a34 biaReferenceID:(id)a35 messageSummaryInfo:(id)a36 partCount:(unint64_t)a37 threadIdentifier:(id)a38 scheduleType:(unint64_t)a39 scheduleState:(unint64_t)a40;
- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37;
- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39;
- (IMEmojiSticker)emojiSticker;
- (IMTapback)tapback;
- (NSArray)consumedSessionPayloads;
- (NSAttributedString)associatedMessagePartText;
- (NSString)associatedMessageEffect;
- (NSString)associatedMessageEmoji;
- (NSString)associatedMessageGUID;
- (_NSRange)associatedMessageRange;
- (id)copyDictionaryRepresentation;
- (id)copyForBackwardsCompatibility;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)emojiString;
- (int64_t)associatedMessageType;
- (int64_t)fileTransferReloadStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedMessageEffect:(id)a3;
- (void)setAssociatedMessageEmoji:(id)a3;
- (void)setAssociatedMessageGUID:(id)a3;
- (void)setAssociatedMessagePartText:(id)a3;
- (void)setAssociatedMessageRange:(_NSRange)a3;
- (void)setAssociatedMessageType:(int64_t)a3;
- (void)setConsumedSessionPayloads:(id)a3;
- (void)setEmojiSticker:(id)a3;
- (void)setFileTransferReloadStatus:(int64_t)a3;
- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3;
- (void)setTapback:(id)a3;
@end

@implementation IMAssociatedMessageItem

- (id)copyDictionaryRepresentation
{
  v13.receiver = self;
  v13.super_class = (Class)IMAssociatedMessageItem;
  v3 = [(IMMessageItem *)&v13 copyDictionaryRepresentation];
  v4 = v3;
  associatedMessageGUID = self->_associatedMessageGUID;
  if (associatedMessageGUID) {
    CFDictionarySetValue(v3, @"associatedMessageGUID", associatedMessageGUID);
  }
  v6 = [NSNumber numberWithLongLong:self->_associatedMessageType];
  if (v6) {
    CFDictionarySetValue(v4, @"associatedMessageType", v6);
  }

  v7 = [NSNumber numberWithUnsignedInteger:self->_associatedMessageRange.location];
  if (v7) {
    CFDictionarySetValue(v4, @"associatedMessageRangeLocation", v7);
  }

  v8 = [NSNumber numberWithUnsignedInteger:self->_associatedMessageRange.length];
  if (v8) {
    CFDictionarySetValue(v4, @"associatedMessageRangeLength", v8);
  }

  associatedMessageEmoji = self->_associatedMessageEmoji;
  if (associatedMessageEmoji) {
    CFDictionarySetValue(v4, @"associatedMessageEmoji", associatedMessageEmoji);
  }
  consumedSessionPayloads = self->_consumedSessionPayloads;
  if (consumedSessionPayloads) {
    CFDictionarySetValue(v4, @"consumedSessionPayloads", consumedSessionPayloads);
  }
  if ([(IMAssociatedMessageItem *)self associatedMessageType] == 3)
  {
    v11 = [(IMMessageItem *)self bodyData];
    if (v11) {
      CFDictionarySetValue(v4, @"bodyData", v11);
    }
  }
  return v4;
}

- (BOOL)isLastMessageCandidate
{
  return [(IMAssociatedMessageItem *)self associatedMessageType] != 3;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMAssociatedMessageItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v21.receiver = self;
      v21.super_class = (Class)IMAssociatedMessageItem;
      if (![(IMMessageItem *)&v21 isEqual:v5])
      {
        unsigned __int8 v10 = 0;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v6 = 544;
      associatedMessageGUID = self->_associatedMessageGUID;
      v8 = [(IMAssociatedMessageItem *)v5 associatedMessageGUID];
      if (associatedMessageGUID == v8
        || (v9 = self->_associatedMessageGUID,
            [(IMAssociatedMessageItem *)v5 associatedMessageGUID],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            [(NSString *)v9 isEqualToString:v6]))
      {
        int64_t associatedMessageType = self->_associatedMessageType;
        if (associatedMessageType == [(IMAssociatedMessageItem *)v5 associatedMessageType]
          && (self->_associatedMessageRange.location == [(IMAssociatedMessageItem *)v5 associatedMessageRange]? (BOOL v13 = self->_associatedMessageRange.length == v12): (BOOL v13 = 0), v13))
        {
          consumedSessionPayloads = self->_consumedSessionPayloads;
          uint64_t v16 = [(IMAssociatedMessageItem *)v5 consumedSessionPayloads];
          if (consumedSessionPayloads == (NSArray *)v16)
          {

            unsigned __int8 v10 = 1;
          }
          else
          {
            v17 = (void *)v16;
            v18 = self->_consumedSessionPayloads;
            v19 = [(IMAssociatedMessageItem *)v5 consumedSessionPayloads];
            unsigned __int8 v10 = [(NSArray *)v18 isEqualToArray:v19];
          }
        }
        else
        {
          unsigned __int8 v10 = 0;
        }
        if (associatedMessageGUID == v8) {
          goto LABEL_18;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_18:
      goto LABEL_19;
    }
    v20.receiver = self;
    v20.super_class = (Class)IMAssociatedMessageItem;
    unsigned __int8 v10 = [(IMMessageItem *)&v20 isEqual:v4];
  }
LABEL_20:

  return v10;
}

- (_NSRange)associatedMessageRange
{
  p_associatedMessageRange = &self->_associatedMessageRange;
  NSUInteger location = self->_associatedMessageRange.location;
  NSUInteger length = p_associatedMessageRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (IMAssociatedMessageItem)initWithDictionary:(id)a3 hint:(id)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IMAssociatedMessageItem;
  v7 = [(IMMessageItem *)&v22 initWithDictionary:v6 hint:a4];
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [v6 objectForKey:@"associatedMessageGUID"];
    uint64_t v10 = [v9 copy];
    associatedMessageGUID = v8->_associatedMessageGUID;
    v8->_associatedMessageGUID = (NSString *)v10;

    uint64_t v12 = [v6 objectForKey:@"associatedMessageType"];
    v8->_int64_t associatedMessageType = [v12 longLongValue];

    BOOL v13 = [v6 objectForKeyedSubscript:@"associatedMessageRangeLocation"];
    v8->_associatedMessageRange.NSUInteger location = [v13 integerValue];

    v14 = [v6 objectForKeyedSubscript:@"associatedMessageRangeLength"];
    v8->_associatedMessageRange.NSUInteger length = [v14 integerValue];

    v15 = [v6 objectForKey:@"associatedMessageEmoji"];
    uint64_t v16 = [v15 copy];
    associatedMessageEmoji = v8->_associatedMessageEmoji;
    v8->_associatedMessageEmoji = (NSString *)v16;

    v18 = [v6 objectForKey:@"consumedSessionPayloads"];
    uint64_t v19 = [v18 copy];
    consumedSessionPayloads = v8->_consumedSessionPayloads;
    v8->_consumedSessionPayloads = (NSArray *)v19;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSticker, 0);
  objc_storeStrong((id *)&self->_tapback, 0);
  objc_storeStrong((id *)&self->_consumedSessionPayloads, 0);
  objc_storeStrong((id *)&self->_associatedMessageEmoji, 0);

  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
}

- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 messageSummaryInfo:(id)a14 threadIdentifier:(id)a15
{
  id v20 = a11;
  id v21 = a14;
  v28.receiver = self;
  v28.super_class = (Class)IMAssociatedMessageItem;
  objc_super v22 = [(IMMessageItem *)&v28 initWithSender:a3 time:a4 body:a5 attributes:a6 fileTransferGUIDs:a7 flags:a8 error:a9 guid:a10 type:0 threadIdentifier:a15];
  if (v22)
  {
    uint64_t v23 = [v20 copy];
    associatedMessageGUID = v22->_associatedMessageGUID;
    v22->_associatedMessageGUID = (NSString *)v23;

    v22->_int64_t associatedMessageType = a12;
    v22->_associatedMessageRange = a13;
    [(IMMessageItem *)v22 setMessageSummaryInfo:v21];
  }

  return v22;
}

- (IMAssociatedMessageItem)initWithSender:(id)a3 time:(id)a4 body:(id)a5 attributes:(id)a6 fileTransferGUIDs:(id)a7 flags:(unint64_t)a8 error:(id)a9 guid:(id)a10 associatedMessageGUID:(id)a11 associatedMessageType:(int64_t)a12 associatedMessageRange:(_NSRange)a13 associatedMessageEmoji:(id)a14 messageSummaryInfo:(id)a15 threadIdentifier:(id)a16
{
  id v20 = a11;
  id v29 = a14;
  id v21 = a15;
  v30.receiver = self;
  v30.super_class = (Class)IMAssociatedMessageItem;
  objc_super v22 = [(IMMessageItem *)&v30 initWithSender:a3 time:a4 body:a5 attributes:a6 fileTransferGUIDs:a7 flags:a8 error:a9 guid:a10 type:0 threadIdentifier:a16];
  if (v22)
  {
    uint64_t v23 = [v20 copy];
    associatedMessageGUID = v22->_associatedMessageGUID;
    v22->_associatedMessageGUID = (NSString *)v23;

    v22->_int64_t associatedMessageType = a12;
    v22->_associatedMessageRange = a13;
    objc_storeStrong((id *)&v22->_associatedMessageEmoji, a14);
    [(IMMessageItem *)v22 setMessageSummaryInfo:v21];
  }

  return v22;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37
{
  id v38 = a29;
  id v39 = a35;
  v50.receiver = self;
  v50.super_class = (Class)IMAssociatedMessageItem;
  v40 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v50, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a32,
          a33,
          a34,
          a28,
          0,
          a37,
          0,
          0,
          a36,
          0,
          0,
          0);
  if (v40)
  {
    uint64_t v41 = [v38 copy];
    associatedMessageGUID = v40->_associatedMessageGUID;
    v40->_associatedMessageGUID = (NSString *)v41;

    v40->_int64_t associatedMessageType = a30;
    v40->_associatedMessageRange = a31;
    [(IMMessageItem *)v40 setMessageSummaryInfo:v39];
  }

  return v40;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 bizIntent:(id)a32 locale:(id)a33 biaReferenceID:(id)a34 messageSummaryInfo:(id)a35 partCount:(unint64_t)a36 threadIdentifier:(id)a37 scheduleType:(unint64_t)a38 scheduleState:(unint64_t)a39
{
  id v40 = a29;
  id v41 = a35;
  v52.receiver = self;
  v52.super_class = (Class)IMAssociatedMessageItem;
  v42 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v52, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a32,
          a33,
          a34,
          a28,
          0,
          a37,
          0,
          0,
          a36,
          0,
          a38,
          a39);
  if (v42)
  {
    uint64_t v43 = [v40 copy];
    associatedMessageGUID = v42->_associatedMessageGUID;
    v42->_associatedMessageGUID = (NSString *)v43;

    v42->_int64_t associatedMessageType = a30;
    v42->_associatedMessageRange = a31;
    [(IMMessageItem *)v42 setMessageSummaryInfo:v41];
  }

  return v42;
}

- (IMAssociatedMessageItem)initWithSenderInfo:(id)a3 time:(id)a4 timeRead:(id)a5 timeDelivered:(id)a6 timePlayed:(id)a7 subject:(id)a8 body:(id)a9 bodyData:(id)a10 attributes:(id)a11 fileTransferGUIDs:(id)a12 flags:(unint64_t)a13 guid:(id)a14 messageID:(int64_t)a15 account:(id)a16 accountID:(id)a17 service:(id)a18 handle:(id)a19 roomName:(id)a20 unformattedID:(id)a21 countryCode:(id)a22 expireState:(int64_t)a23 balloonBundleID:(id)a24 payloadData:(id)a25 expressiveSendStyleID:(id)a26 timeExpressiveSendPlayed:(id)a27 errorType:(unsigned int)a28 associatedMessageGUID:(id)a29 associatedMessageType:(int64_t)a30 associatedMessageRange:(_NSRange)a31 associatedMessageEmoji:(id)a32 bizIntent:(id)a33 locale:(id)a34 biaReferenceID:(id)a35 messageSummaryInfo:(id)a36 partCount:(unint64_t)a37 threadIdentifier:(id)a38 scheduleType:(unint64_t)a39 scheduleState:(unint64_t)a40
{
  id v41 = a29;
  id v42 = a32;
  v54.receiver = self;
  v54.super_class = (Class)IMAssociatedMessageItem;
  id v43 = a36;
  v44 = -[IMMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:bizIntent:locale:biaReferenceID:errorType:type:threadIdentifier:syndicationRanges:syncedSyndicationRanges:partCount:dateEdited:scheduleType:scheduleState:](&v54, sel_initWithSenderInfo_time_timeRead_timeDelivered_timePlayed_subject_body_bodyData_attributes_fileTransferGUIDs_flags_guid_messageID_account_accountID_service_handle_roomName_unformattedID_countryCode_expireState_balloonBundleID_payloadData_expressiveSendStyleID_timeExpressiveSendPlayed_bizIntent_locale_biaReferenceID_errorType_type_threadIdentifier_syndicationRanges_syncedSyndicationRanges_partCount_dateEdited_scheduleType_scheduleState_, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          a33,
          a34,
          a35,
          a28,
          0,
          a38,
          0,
          0,
          a37,
          0,
          a39,
          a40);
  if (v44)
  {
    uint64_t v45 = [v41 copy];
    associatedMessageGUID = v44->_associatedMessageGUID;
    v44->_associatedMessageGUID = (NSString *)v45;

    v44->_int64_t associatedMessageType = a30;
    v44->_associatedMessageRange = a31;
    objc_storeStrong((id *)&v44->_associatedMessageEmoji, a32);
    [(IMMessageItem *)v44 setMessageSummaryInfo:v43];
  }

  return v44;
}

- (IMAssociatedMessageItem)initWithMessageItem:(id)a3
{
  id v3 = a3;
  v47 = [v3 senderInfo];
  v46 = [v3 time];
  uint64_t v45 = [v3 timeRead];
  v44 = [v3 timeDelivered];
  id v43 = [v3 timePlayed];
  id v41 = [v3 subject];
  id v42 = [v3 body];
  id v40 = [v3 bodyData];
  id v39 = [v3 fileTransferGUIDs];
  uint64_t v29 = [v3 flags];
  v37 = [v3 guid];
  uint64_t v28 = [v3 messageID];
  id v38 = [v3 account];
  v35 = [v3 accountID];
  v34 = [v3 service];
  v27 = [v3 handle];
  v36 = [v3 roomName];
  v26 = [v3 unformattedID];
  v25 = [v3 countryCode];
  uint64_t v24 = [v3 expireState];
  v33 = [v3 balloonBundleID];
  uint64_t v23 = [v3 payloadData];
  objc_super v22 = [v3 expressiveSendStyleID];
  v32 = [v3 timeExpressiveSendPlayed];
  int v21 = [v3 errorCode];
  id v20 = [v3 associatedMessageGUID];
  uint64_t v19 = [v3 associatedMessageType];
  uint64_t v4 = [v3 associatedMessageRange];
  uint64_t v17 = v5;
  uint64_t v18 = v4;
  uint64_t v16 = [v3 associatedMessageEmoji];
  v15 = [v3 bizIntent];
  id v6 = [v3 locale];
  v7 = [v3 biaReferenceID];
  v8 = [v3 messageSummaryInfo];
  uint64_t v9 = [v3 partCount];
  uint64_t v10 = [v3 threadIdentifier];
  uint64_t v11 = [v3 scheduleType];
  uint64_t v12 = [v3 scheduleState];

  LODWORD(v14) = v21;
  v31 = -[IMAssociatedMessageItem initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:scheduleType:scheduleState:](self, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:associatedMessageEmoji:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:scheduleType:scheduleState:", v47, v46, v45, v44, v43, v41, v42, v40, 0, v39, v29, v37, v28,
          v38,
          v35,
          v34,
          v27,
          v36,
          v26,
          v25,
          v24,
          v33,
          v23,
          v22,
          v32,
          v14,
          v20,
          v19,
          v18,
          v17,
          v16,
          v15,
          v6,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12);

  return v31;
}

- (IMAssociatedMessageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMAssociatedMessageItem;
  uint64_t v5 = [(IMMessageItem *)&v25 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedMessageGUID"];
    uint64_t v7 = [v6 copy];
    associatedMessageGUID = v5->_associatedMessageGUID;
    v5->_associatedMessageGUID = (NSString *)v7;

    v5->_int64_t associatedMessageType = [v4 decodeInt64ForKey:@"associatedMessageType"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedMessageRange"];
    v5->_associatedMessageRange.NSUInteger location = [v9 rangeValue];
    v5->_associatedMessageRange.NSUInteger length = v10;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedMessageEmoji"];
    uint64_t v12 = [v11 copy];
    associatedMessageEmoji = v5->_associatedMessageEmoji;
    v5->_associatedMessageEmoji = (NSString *)v12;

    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    int v21 = [v4 decodeObjectOfClasses:v20 forKey:@"consumedSessionPayloads"];
    uint64_t v22 = [v21 copy];
    consumedSessionPayloads = v5->_consumedSessionPayloads;
    v5->_consumedSessionPayloads = (NSArray *)v22;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMAssociatedMessageItem;
  id v4 = a3;
  [(IMMessageItem *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedMessageGUID, @"associatedMessageGUID", v6.receiver, v6.super_class);
  [v4 encodeInt64:self->_associatedMessageType forKey:@"associatedMessageType"];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_associatedMessageRange.location, self->_associatedMessageRange.length);
  [v4 encodeObject:v5 forKey:@"associatedMessageRange"];

  [v4 encodeObject:self->_associatedMessageEmoji forKey:@"associatedMessageEmoji"];
  [v4 encodeObject:self->_consumedSessionPayloads forKey:@"consumedSessionPayloads"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IMAssociatedMessageItem;
  id v4 = [(IMMessageItem *)&v10 copyWithZone:a3];
  uint64_t v5 = [(IMAssociatedMessageItem *)self associatedMessageGUID];
  [v4 setAssociatedMessageGUID:v5];

  objc_msgSend(v4, "setAssociatedMessageType:", -[IMAssociatedMessageItem associatedMessageType](self, "associatedMessageType"));
  uint64_t v6 = [(IMAssociatedMessageItem *)self associatedMessageRange];
  objc_msgSend(v4, "setAssociatedMessageRange:", v6, v7);
  v8 = [(IMAssociatedMessageItem *)self associatedMessageEmoji];
  [v4 setAssociatedMessageEmoji:v8];

  return v4;
}

- (id)copyForBackwardsCompatibility
{
  v8.receiver = self;
  v8.super_class = (Class)IMAssociatedMessageItem;
  id v3 = [(IMMessageItem *)&v8 copyForBackwardsCompatibility];
  if ([(IMAssociatedMessageItem *)self associatedMessageType] == 3007)
  {
    [v3 setFileTransferGUIDs:0];
    id v4 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v5 = [v3 body];
    uint64_t v6 = (void *)[v4 initWithAttributedString:v5];

    objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E4F6C188], 0, objc_msgSend(v6, "length"));
    [v3 setBody:v6];
  }
  [v3 setAssociatedMessageGUID:0];
  objc_msgSend(v3, "setAssociatedMessageRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  [v3 setAssociatedMessageType:0];
  [v3 setAssociatedMessageEmoji:0];
  return v3;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)IMAssociatedMessageItem;
  id v4 = [(IMMessageItem *)&v10 description];
  associatedMessageGUID = self->_associatedMessageGUID;
  int64_t associatedMessageType = self->_associatedMessageType;
  uint64_t v7 = NSStringFromRange(self->_associatedMessageRange);
  objc_super v8 = [v3 stringWithFormat:@"%@ associatedMessageGUID: %@, associatedMessageType: %lld, range: %@", v4, associatedMessageGUID, associatedMessageType, v7];

  return v8;
}

- (BOOL)isAssociatedMessageItem
{
  return 1;
}

- (BOOL)isMessageAcknowledgment
{
  unint64_t v2 = self->_associatedMessageType & 0xFFFFFFFFFFFFFFF8;
  return v2 == 3000 || v2 == 2000;
}

- (BOOL)isBreadcrumb
{
  return [(IMAssociatedMessageItem *)self associatedMessageType] == 2
      || [(IMAssociatedMessageItem *)self associatedMessageType] == 3;
}

- (BOOL)isSticker
{
  return ([(IMAssociatedMessageItem *)self associatedMessageType] & 0xFFFFFFFFFFFFFFFELL) == 1000;
}

- (IMTapback)tapback
{
  int64_t v3 = [(IMAssociatedMessageItem *)self associatedMessageType];
  if ((unint64_t)(v3 - 3000) >= 6 && (unint64_t)(v3 - 2000) > 5)
  {
    int64_t v6 = [(IMAssociatedMessageItem *)self associatedMessageType];
    if (v6 == 3006 || v6 == 2006)
    {
      uint64_t v7 = [IMEmojiTapback alloc];
      objc_super v8 = [(IMAssociatedMessageItem *)self associatedMessageEmoji];
      id v4 = [(IMEmojiTapback *)v7 initWithEmoji:v8 isRemoved:([(IMAssociatedMessageItem *)self associatedMessageType] & 0xFFFFFFFFFFFFFFF8) == 3000];
    }
    else
    {
      int64_t v9 = [(IMAssociatedMessageItem *)self associatedMessageType];
      if (v9 == 3007 || v9 == 2007)
      {
        objc_super v10 = [(IMMessageItem *)self fileTransferGUIDs];
        uint64_t v11 = [v10 firstObject];

        if (v11)
        {
          id v4 = [[IMStickerTapback alloc] initWithTransferGUID:v11 isRemoved:([(IMAssociatedMessageItem *)self associatedMessageType] & 0xFFFFFFFFFFFFFFF8) == 3000];
        }
        else
        {
          uint64_t v12 = IMLogHandleForCategory("IMAssociatedMessageItem");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1A09F1808(v12);
          }

          id v4 = 0;
        }
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = [[IMClassicTapback alloc] initWithAssociatedMessageType:[(IMAssociatedMessageItem *)self associatedMessageType]];
  }

  return (IMTapback *)v4;
}

- (id)emojiString
{
  if ([(IMAssociatedMessageItem *)self associatedMessageType] == 1001)
  {
    int64_t v3 = [(IMMessageItem *)self body];
    id v4 = [v3 string];
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6C110] withString:&stru_1EF2CAD28];

    if (objc_msgSend(v5, "__im_hasEmoji")) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:

  return v5;
}

- (IMEmojiSticker)emojiSticker
{
  unint64_t v2 = [(IMAssociatedMessageItem *)self emojiString];
  if (v2)
  {
    int64_t v3 = [IMEmojiSticker alloc];
    id v4 = +[IMEmojiSticker defaultEmojiStickerPackID];
    uint64_t v5 = [(IMEmojiSticker *)v3 initWithEmojiString:v2 stickerPackID:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEmojiSticker
{
  unint64_t v2 = [(IMAssociatedMessageItem *)self emojiString];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSAttributedString)associatedMessagePartText
{
  unint64_t v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = objc_msgSend(v2, "__imami_attributedStringForKey:", @"ampt");

  return (NSAttributedString *)v3;
}

- (void)setAssociatedMessagePartText:(id)a3
{
  id v9 = a3;
  id v4 = [(IMMessageItem *)self messageSummaryInfo];
  if (v9)
  {
    if ([v4 count]) {
      id v5 = (id)[v4 mutableCopy];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v7 = v5;
    objc_msgSend(v5, "__imami_setAttributedString:forKey:", v9, @"ampt");
  }
  else
  {
    int64_t v6 = [v4 objectForKey:@"ampt"];

    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v7 = (void *)[v4 mutableCopy];
    [v7 removeObjectForKey:@"ampt"];
  }
  objc_super v8 = (void *)[v7 copy];
  [(IMMessageItem *)self setMessageSummaryInfo:v8];

LABEL_9:
}

- (NSString)associatedMessageEffect
{
  unint64_t v2 = [(IMMessageItem *)self messageSummaryInfo];
  BOOL v3 = [v2 objectForKey:@"ame"];

  return (NSString *)v3;
}

- (void)setAssociatedMessageEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(IMMessageItem *)self messageSummaryInfo];
  int64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v9 = v8;

  [v9 setObject:v4 forKeyedSubscript:@"ame"];
  [(IMMessageItem *)self setMessageSummaryInfo:v9];
}

- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3
{
  self->_fileTransferReloadStatus = a3;
}

- (BOOL)_updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(IMAssociatedMessageItem *)self associatedMessagePartText];
  if ([v5 length])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = sub_1A07778CC;
    uint64_t v17 = sub_1A0777754;
    id v18 = 0;
    id v18 = v5;
    uint64_t v9 = 0;
    objc_super v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1A0835CF8;
    v8[3] = &unk_1E5A11A58;
    v8[4] = &v13;
    v8[5] = &v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    if (*((unsigned char *)v10 + 24)) {
      [(IMAssociatedMessageItem *)self setAssociatedMessagePartText:v14[5]];
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

- (BOOL)updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:(id)a3
{
  BOOL v3 = self;
  v7.receiver = self;
  v7.super_class = (Class)IMAssociatedMessageItem;
  id v4 = a3;
  unsigned __int8 v5 = [(IMMessageItem *)&v7 updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:v4];
  LOBYTE(v3) = -[IMAssociatedMessageItem _updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:](v3, "_updateAssociatedMessagePartTextReplacingTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:", v4, v7.receiver, v7.super_class);

  return v5 | v3;
}

- (void)setAssociatedMessageGUID:(id)a3
{
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_int64_t associatedMessageType = a3;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (void)setAssociatedMessageEmoji:(id)a3
{
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
}

- (void)setTapback:(id)a3
{
}

- (void)setEmojiSticker:(id)a3
{
}

- (int64_t)fileTransferReloadStatus
{
  return self->_fileTransferReloadStatus;
}

- (void)setFileTransferReloadStatus:(int64_t)a3
{
  self->_fileTransferReloadStatus = a3;
}

- (BOOL)isAvailabilityReplySupported
{
  return 0;
}

@end