@interface IMSharedUtilitiesProtoCloudKitEncryptedMessage
- (BOOL)hasAssociatedMessageGuid;
- (BOOL)hasAssociatedMessageRangeLength;
- (BOOL)hasAssociatedMessageRangeLocation;
- (BOOL)hasAssociatedMessageType;
- (BOOL)hasBaloonBundleId;
- (BOOL)hasExpireState;
- (BOOL)hasExpressiveSendId;
- (BOOL)hasMessageBody;
- (BOOL)hasMessageBodyData;
- (BOOL)hasMessageSubject;
- (BOOL)hasMessageSummaryInfo;
- (BOOL)hasPadding;
- (BOOL)hasPayloadData;
- (BOOL)hasTimeDelivered;
- (BOOL)hasTimeExpressiveSentPlayed;
- (BOOL)hasTimePlayed;
- (BOOL)hasTimeRead;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageBodyData;
- (NSData)messageSummaryInfo;
- (NSData)padding;
- (NSData)payloadData;
- (NSString)associatedMessageGuid;
- (NSString)baloonBundleId;
- (NSString)expressiveSendId;
- (NSString)messageBody;
- (NSString)messageSubject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)associatedMessageType;
- (unint64_t)expireState;
- (unint64_t)hash;
- (unint64_t)timeDelivered;
- (unint64_t)timeExpressiveSentPlayed;
- (unint64_t)timePlayed;
- (unint64_t)timeRead;
- (unsigned)associatedMessageRangeLength;
- (unsigned)associatedMessageRangeLocation;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedMessageGuid:(id)a3;
- (void)setAssociatedMessageRangeLength:(unsigned int)a3;
- (void)setAssociatedMessageRangeLocation:(unsigned int)a3;
- (void)setAssociatedMessageType:(int64_t)a3;
- (void)setBaloonBundleId:(id)a3;
- (void)setExpireState:(unint64_t)a3;
- (void)setExpressiveSendId:(id)a3;
- (void)setHasAssociatedMessageRangeLength:(BOOL)a3;
- (void)setHasAssociatedMessageRangeLocation:(BOOL)a3;
- (void)setHasAssociatedMessageType:(BOOL)a3;
- (void)setHasExpireState:(BOOL)a3;
- (void)setHasTimeDelivered:(BOOL)a3;
- (void)setHasTimeExpressiveSentPlayed:(BOOL)a3;
- (void)setHasTimePlayed:(BOOL)a3;
- (void)setHasTimeRead:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMessageBody:(id)a3;
- (void)setMessageBodyData:(id)a3;
- (void)setMessageSubject:(id)a3;
- (void)setMessageSummaryInfo:(id)a3;
- (void)setPadding:(id)a3;
- (void)setPayloadData:(id)a3;
- (void)setTimeDelivered:(unint64_t)a3;
- (void)setTimeExpressiveSentPlayed:(unint64_t)a3;
- (void)setTimePlayed:(unint64_t)a3;
- (void)setTimeRead:(unint64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessage

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setMessageSubject:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setMessageBody:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setMessageBodyData:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setBaloonBundleId:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setPayloadData:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setMessageSummaryInfo:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setExpressiveSendId:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setPadding:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)self setAssociatedMessageGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessage;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessage *)&v3 dealloc];
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMessageSubject
{
  return self->_messageSubject != 0;
}

- (BOOL)hasMessageBody
{
  return self->_messageBody != 0;
}

- (BOOL)hasMessageBodyData
{
  return self->_messageBodyData != 0;
}

- (BOOL)hasBaloonBundleId
{
  return self->_baloonBundleId != 0;
}

- (BOOL)hasPayloadData
{
  return self->_payloadData != 0;
}

- (BOOL)hasMessageSummaryInfo
{
  return self->_messageSummaryInfo != 0;
}

- (BOOL)hasExpressiveSendId
{
  return self->_expressiveSendId != 0;
}

- (void)setTimeRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeRead = a3;
}

- (void)setHasTimeRead:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeRead
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimePlayed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timePlayed = a3;
}

- (void)setHasTimePlayed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimePlayed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTimeExpressiveSentPlayed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timeExpressiveSentPlayed = a3;
}

- (void)setHasTimeExpressiveSentPlayed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimeExpressiveSentPlayed
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (void)setTimeDelivered:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeDelivered = a3;
}

- (void)setHasTimeDelivered:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeDelivered
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setExpireState:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_expireState = a3;
}

- (void)setHasExpireState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExpireState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_associatedMessageType = a3;
}

- (void)setHasAssociatedMessageType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAssociatedMessageType
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAssociatedMessageGuid
{
  return self->_associatedMessageGuid != 0;
}

- (void)setAssociatedMessageRangeLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_associatedMessageRangeLocation = a3;
}

- (void)setHasAssociatedMessageRangeLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAssociatedMessageRangeLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAssociatedMessageRangeLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_associatedMessageRangeLength = a3;
}

- (void)setHasAssociatedMessageRangeLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAssociatedMessageRangeLength
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessage description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
  }
  messageSubject = self->_messageSubject;
  if (messageSubject) {
    [v3 setObject:messageSubject forKey:@"message_subject"];
  }
  messageBody = self->_messageBody;
  if (messageBody) {
    [v3 setObject:messageBody forKey:@"message_body"];
  }
  messageBodyData = self->_messageBodyData;
  if (messageBodyData) {
    [v3 setObject:messageBodyData forKey:@"message_body_data"];
  }
  baloonBundleId = self->_baloonBundleId;
  if (baloonBundleId) {
    [v3 setObject:baloonBundleId forKey:@"baloon_bundle_id"];
  }
  payloadData = self->_payloadData;
  if (payloadData) {
    [v3 setObject:payloadData forKey:@"payload_data"];
  }
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo) {
    [v3 setObject:messageSummaryInfo forKey:@"message_summary_info"];
  }
  expressiveSendId = self->_expressiveSendId;
  if (expressiveSendId) {
    [v3 setObject:expressiveSendId forKey:@"expressive_send_id"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timeRead), @"time_read");
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timePlayed), @"time_played");
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_20:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timeExpressiveSentPlayed), @"time_expressive_sent_played");
LABEL_21:
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timeDelivered), @"time_delivered");
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_25:
      if ((v13 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_expireState), @"expire_state");
  if (*(_WORD *)&self->_has) {
LABEL_26:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_associatedMessageType), @"associated_message_type");
LABEL_27:
  associatedMessageGuid = self->_associatedMessageGuid;
  if (associatedMessageGuid) {
    [v3 setObject:associatedMessageGuid forKey:@"associated_message_guid"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_associatedMessageRangeLocation), @"associated_message_range_location");
    __int16 v15 = (__int16)self->_has;
  }
  if ((v15 & 0x40) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_associatedMessageRangeLength), @"associated_message_range_length");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_messageSubject) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageBody) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageBodyData) {
    PBDataWriterWriteDataField();
  }
  if (self->_baloonBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_payloadData) {
    PBDataWriterWriteDataField();
  }
  if (self->_messageSummaryInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_expressiveSendId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint64Field();
LABEL_21:
  if (self->_padding) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_25:
      if ((v5 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint64Field();
  if (*(_WORD *)&self->_has) {
LABEL_26:
  }
    PBDataWriterWriteInt64Field();
LABEL_27:
  if (self->_associatedMessageGuid) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_version;
    *((_WORD *)a3 + 70) |= 0x100u;
  }
  if (self->_messageSubject) {
    objc_msgSend(a3, "setMessageSubject:");
  }
  if (self->_messageBody) {
    objc_msgSend(a3, "setMessageBody:");
  }
  if (self->_messageBodyData) {
    objc_msgSend(a3, "setMessageBodyData:");
  }
  if (self->_baloonBundleId) {
    objc_msgSend(a3, "setBaloonBundleId:");
  }
  if (self->_payloadData) {
    objc_msgSend(a3, "setPayloadData:");
  }
  if (self->_messageSummaryInfo) {
    objc_msgSend(a3, "setMessageSummaryInfo:");
  }
  if (self->_expressiveSendId) {
    objc_msgSend(a3, "setExpressiveSendId:");
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_timeRead;
    *((_WORD *)a3 + 70) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  *((void *)a3 + 5) = self->_timePlayed;
  *((_WORD *)a3 + 70) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_20:
    *((void *)a3 + 4) = self->_timeExpressiveSentPlayed;
    *((_WORD *)a3 + 70) |= 8u;
  }
LABEL_21:
  if (self->_padding) {
    objc_msgSend(a3, "setPadding:");
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timeDelivered;
    *((_WORD *)a3 + 70) |= 4u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_25:
      if ((v6 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_25;
  }
  *((void *)a3 + 2) = self->_expireState;
  *((_WORD *)a3 + 70) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_26:
    *((void *)a3 + 1) = self->_associatedMessageType;
    *((_WORD *)a3 + 70) |= 1u;
  }
LABEL_27:
  if (self->_associatedMessageGuid) {
    objc_msgSend(a3, "setAssociatedMessageGuid:");
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_associatedMessageRangeLocation;
    *((_WORD *)a3 + 70) |= 0x80u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_associatedMessageRangeLength;
    *((_WORD *)a3 + 70) |= 0x40u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_version;
    *(_WORD *)(v5 + 140) |= 0x100u;
  }

  *(void *)(v6 + 104) = [(NSString *)self->_messageSubject copyWithZone:a3];
  *(void *)(v6 + 88) = [(NSString *)self->_messageBody copyWithZone:a3];

  *(void *)(v6 + 96) = [(NSData *)self->_messageBodyData copyWithZone:a3];
  *(void *)(v6 + 72) = [(NSString *)self->_baloonBundleId copyWithZone:a3];

  *(void *)(v6 + 128) = [(NSData *)self->_payloadData copyWithZone:a3];
  *(void *)(v6 + 112) = [(NSData *)self->_messageSummaryInfo copyWithZone:a3];

  *(void *)(v6 + 80) = [(NSString *)self->_expressiveSendId copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_timeRead;
    *(_WORD *)(v6 + 140) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 40) = self->_timePlayed;
  *(_WORD *)(v6 + 140) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(void *)(v6 + 32) = self->_timeExpressiveSentPlayed;
    *(_WORD *)(v6 + 140) |= 8u;
  }
LABEL_7:

  *(void *)(v6 + 120) = [(NSData *)self->_padding copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_timeDelivered;
    *(_WORD *)(v6 + 140) |= 4u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_9;
  }
  *(void *)(v6 + 16) = self->_expireState;
  *(_WORD *)(v6 + 140) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    *(void *)(v6 + 8) = self->_associatedMessageType;
    *(_WORD *)(v6 + 140) |= 1u;
  }
LABEL_11:

  *(void *)(v6 + 56) = [(NSString *)self->_associatedMessageGuid copyWithZone:a3];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_associatedMessageRangeLocation;
    *(_WORD *)(v6 + 140) |= 0x80u;
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_associatedMessageRangeLength;
    *(_WORD *)(v6 + 140) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 70) & 0x100) == 0 || self->_version != *((_DWORD *)a3 + 34)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 70) & 0x100) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    messageSubject = self->_messageSubject;
    if (!((unint64_t)messageSubject | *((void *)a3 + 13))
      || (int v5 = -[NSString isEqual:](messageSubject, "isEqual:")) != 0)
    {
      messageBody = self->_messageBody;
      if (!((unint64_t)messageBody | *((void *)a3 + 11))
        || (int v5 = -[NSString isEqual:](messageBody, "isEqual:")) != 0)
      {
        messageBodyData = self->_messageBodyData;
        if (!((unint64_t)messageBodyData | *((void *)a3 + 12))
          || (int v5 = -[NSData isEqual:](messageBodyData, "isEqual:")) != 0)
        {
          baloonBundleId = self->_baloonBundleId;
          if (!((unint64_t)baloonBundleId | *((void *)a3 + 9))
            || (int v5 = -[NSString isEqual:](baloonBundleId, "isEqual:")) != 0)
          {
            payloadData = self->_payloadData;
            if (!((unint64_t)payloadData | *((void *)a3 + 16))
              || (int v5 = -[NSData isEqual:](payloadData, "isEqual:")) != 0)
            {
              messageSummaryInfo = self->_messageSummaryInfo;
              if (!((unint64_t)messageSummaryInfo | *((void *)a3 + 14))
                || (int v5 = -[NSData isEqual:](messageSummaryInfo, "isEqual:")) != 0)
              {
                expressiveSendId = self->_expressiveSendId;
                if (!((unint64_t)expressiveSendId | *((void *)a3 + 10))
                  || (int v5 = -[NSString isEqual:](expressiveSendId, "isEqual:")) != 0)
                {
                  __int16 has = (__int16)self->_has;
                  __int16 v14 = *((_WORD *)a3 + 70);
                  if ((has & 0x20) != 0)
                  {
                    if ((v14 & 0x20) == 0 || self->_timeRead != *((void *)a3 + 6)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v14 & 0x20) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 0x10) != 0)
                  {
                    if ((v14 & 0x10) == 0 || self->_timePlayed != *((void *)a3 + 5)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v14 & 0x10) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 8) != 0)
                  {
                    if ((v14 & 8) == 0 || self->_timeExpressiveSentPlayed != *((void *)a3 + 4)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v14 & 8) != 0)
                  {
                    goto LABEL_66;
                  }
                  padding = self->_padding;
                  if ((unint64_t)padding | *((void *)a3 + 15))
                  {
                    int v5 = -[NSData isEqual:](padding, "isEqual:");
                    if (!v5) {
                      return v5;
                    }
                    __int16 has = (__int16)self->_has;
                  }
                  __int16 v16 = *((_WORD *)a3 + 70);
                  if ((has & 4) != 0)
                  {
                    if ((v16 & 4) == 0 || self->_timeDelivered != *((void *)a3 + 3)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v16 & 4) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 2) != 0)
                  {
                    if ((v16 & 2) == 0 || self->_expireState != *((void *)a3 + 2)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v16 & 2) != 0)
                  {
                    goto LABEL_66;
                  }
                  if (has)
                  {
                    if ((v16 & 1) == 0 || self->_associatedMessageType != *((void *)a3 + 1)) {
                      goto LABEL_66;
                    }
                  }
                  else if (v16)
                  {
                    goto LABEL_66;
                  }
                  associatedMessageGuid = self->_associatedMessageGuid;
                  if ((unint64_t)associatedMessageGuid | *((void *)a3 + 7))
                  {
                    int v5 = -[NSString isEqual:](associatedMessageGuid, "isEqual:");
                    if (!v5) {
                      return v5;
                    }
                    __int16 has = (__int16)self->_has;
                  }
                  __int16 v18 = *((_WORD *)a3 + 70);
                  if ((has & 0x80) != 0)
                  {
                    if ((v18 & 0x80) == 0 || self->_associatedMessageRangeLocation != *((_DWORD *)a3 + 17)) {
                      goto LABEL_66;
                    }
                  }
                  else if ((v18 & 0x80) != 0)
                  {
                    goto LABEL_66;
                  }
                  LOBYTE(v5) = (v18 & 0x40) == 0;
                  if ((has & 0x40) != 0)
                  {
                    if ((v18 & 0x40) == 0 || self->_associatedMessageRangeLength != *((_DWORD *)a3 + 16)) {
                      goto LABEL_66;
                    }
                    LOBYTE(v5) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v25 = 2654435761 * self->_version;
  }
  else {
    uint64_t v25 = 0;
  }
  NSUInteger v24 = [(NSString *)self->_messageSubject hash];
  NSUInteger v23 = [(NSString *)self->_messageBody hash];
  uint64_t v22 = [(NSData *)self->_messageBodyData hash];
  NSUInteger v21 = [(NSString *)self->_baloonBundleId hash];
  uint64_t v20 = [(NSData *)self->_payloadData hash];
  uint64_t v19 = [(NSData *)self->_messageSummaryInfo hash];
  NSUInteger v17 = [(NSString *)self->_expressiveSendId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    unint64_t v4 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v5 = 0;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  unint64_t v4 = 2654435761u * self->_timeRead;
  if ((has & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v5 = 2654435761u * self->_timePlayed;
  if ((has & 8) != 0)
  {
LABEL_7:
    unint64_t v6 = 2654435761u * self->_timeExpressiveSentPlayed;
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v6 = 0;
LABEL_11:
  uint64_t v7 = [(NSData *)self->_padding hash];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
    unint64_t v9 = 0;
    if ((v8 & 2) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    unint64_t v10 = 0;
    if (v8) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  unint64_t v9 = 2654435761u * self->_timeDelivered;
  if ((v8 & 2) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  unint64_t v10 = 2654435761u * self->_expireState;
  if (v8)
  {
LABEL_14:
    uint64_t v11 = 2654435761 * self->_associatedMessageType;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v11 = 0;
LABEL_18:
  NSUInteger v12 = [(NSString *)self->_associatedMessageGuid hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    uint64_t v14 = 2654435761 * self->_associatedMessageRangeLocation;
    if ((v13 & 0x40) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v15 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  uint64_t v14 = 0;
  if ((v13 & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v15 = 2654435761 * self->_associatedMessageRangeLength;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_WORD *)a3 + 70) & 0x100) != 0)
  {
    self->_version = *((_DWORD *)a3 + 34);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 13)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSubject:](self, "setMessageSubject:");
  }
  if (*((void *)a3 + 11)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBody:](self, "setMessageBody:");
  }
  if (*((void *)a3 + 12)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBodyData:](self, "setMessageBodyData:");
  }
  if (*((void *)a3 + 9)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setBaloonBundleId:](self, "setBaloonBundleId:");
  }
  if (*((void *)a3 + 16)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPayloadData:](self, "setPayloadData:");
  }
  if (*((void *)a3 + 14)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSummaryInfo:](self, "setMessageSummaryInfo:");
  }
  if (*((void *)a3 + 10)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setExpressiveSendId:](self, "setExpressiveSendId:");
  }
  __int16 v5 = *((_WORD *)a3 + 70);
  if ((v5 & 0x20) != 0)
  {
    self->_timeRead = *((void *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)a3 + 70);
    if ((v5 & 0x10) == 0)
    {
LABEL_19:
      if ((v5 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_timePlayed = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 70) & 8) != 0)
  {
LABEL_20:
    self->_timeExpressiveSentPlayed = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_21:
  if (*((void *)a3 + 15)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPadding:](self, "setPadding:");
  }
  __int16 v6 = *((_WORD *)a3 + 70);
  if ((v6 & 4) != 0)
  {
    self->_timeDelivered = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v6 = *((_WORD *)a3 + 70);
    if ((v6 & 2) == 0)
    {
LABEL_25:
      if ((v6 & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_25;
  }
  self->_expireState = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)a3 + 70))
  {
LABEL_26:
    self->_associatedMessageType = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_27:
  if (*((void *)a3 + 7)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setAssociatedMessageGuid:](self, "setAssociatedMessageGuid:");
  }
  __int16 v7 = *((_WORD *)a3 + 70);
  if ((v7 & 0x80) != 0)
  {
    self->_associatedMessageRangeLocation = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v7 = *((_WORD *)a3 + 70);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_associatedMessageRangeLength = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x40u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)messageSubject
{
  return self->_messageSubject;
}

- (void)setMessageSubject:(id)a3
{
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
}

- (NSData)messageBodyData
{
  return self->_messageBodyData;
}

- (void)setMessageBodyData:(id)a3
{
}

- (NSString)baloonBundleId
{
  return self->_baloonBundleId;
}

- (void)setBaloonBundleId:(id)a3
{
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
}

- (NSData)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
}

- (NSString)expressiveSendId
{
  return self->_expressiveSendId;
}

- (void)setExpressiveSendId:(id)a3
{
}

- (unint64_t)timeRead
{
  return self->_timeRead;
}

- (unint64_t)timePlayed
{
  return self->_timePlayed;
}

- (unint64_t)timeExpressiveSentPlayed
{
  return self->_timeExpressiveSentPlayed;
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (unint64_t)timeDelivered
{
  return self->_timeDelivered;
}

- (unint64_t)expireState
{
  return self->_expireState;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (NSString)associatedMessageGuid
{
  return self->_associatedMessageGuid;
}

- (void)setAssociatedMessageGuid:(id)a3
{
}

- (unsigned)associatedMessageRangeLocation
{
  return self->_associatedMessageRangeLocation;
}

- (unsigned)associatedMessageRangeLength
{
  return self->_associatedMessageRangeLength;
}

@end