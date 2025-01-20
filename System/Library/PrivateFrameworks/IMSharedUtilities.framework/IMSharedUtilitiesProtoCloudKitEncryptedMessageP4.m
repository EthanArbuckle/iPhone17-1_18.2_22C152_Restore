@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageP4
- (BOOL)hasActualParentChatId;
- (BOOL)hasActualService;
- (BOOL)hasAssociatedMessageEmoji;
- (BOOL)hasPadding;
- (BOOL)hasScheduleState;
- (BOOL)hasScheduleType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)actualParentChatId;
- (NSString)actualService;
- (NSString)associatedMessageEmoji;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)scheduleState;
- (unsigned)scheduleType;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActualParentChatId:(id)a3;
- (void)setActualService:(id)a3;
- (void)setAssociatedMessageEmoji:(id)a3;
- (void)setHasScheduleState:(BOOL)a3;
- (void)setHasScheduleType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPadding:(id)a3;
- (void)setScheduleState:(unsigned int)a3;
- (void)setScheduleType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageP4

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 *)self setAssociatedMessageEmoji:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 *)self setPadding:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 *)self setActualService:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 *)self setActualParentChatId:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP4;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 *)&v3 dealloc];
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAssociatedMessageEmoji
{
  return self->_associatedMessageEmoji != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (BOOL)hasActualService
{
  return self->_actualService != 0;
}

- (void)setScheduleType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scheduleType = a3;
}

- (void)setHasScheduleType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheduleType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScheduleState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_scheduleState = a3;
}

- (void)setHasScheduleState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScheduleState
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasActualParentChatId
{
  return self->_actualParentChatId != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP4;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
  }
  associatedMessageEmoji = self->_associatedMessageEmoji;
  if (associatedMessageEmoji) {
    [v3 setObject:associatedMessageEmoji forKey:@"associated_message_emoji"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  actualService = self->_actualService;
  if (actualService) {
    [v3 setObject:actualService forKey:@"actual_service"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_scheduleType), @"schedule_type");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_scheduleState), @"schedule_state");
  }
  actualParentChatId = self->_actualParentChatId;
  if (actualParentChatId) {
    [v3 setObject:actualParentChatId forKey:@"actual_parent_chat_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageP4ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_associatedMessageEmoji) {
    PBDataWriterWriteStringField();
  }
  if (self->_padding) {
    PBDataWriterWriteDataField();
  }
  if (self->_actualService) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_actualParentChatId)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_version;
    *((unsigned char *)a3 + 52) |= 4u;
  }
  if (self->_associatedMessageEmoji) {
    objc_msgSend(a3, "setAssociatedMessageEmoji:");
  }
  if (self->_padding) {
    objc_msgSend(a3, "setPadding:");
  }
  if (self->_actualService) {
    objc_msgSend(a3, "setActualService:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_scheduleType;
    *((unsigned char *)a3 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)a3 + 10) = self->_scheduleState;
    *((unsigned char *)a3 + 52) |= 1u;
  }
  if (self->_actualParentChatId)
  {
    objc_msgSend(a3, "setActualParentChatId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_version;
    *(unsigned char *)(v5 + 52) |= 4u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_associatedMessageEmoji copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSData *)self->_padding copyWithZone:a3];

  *(void *)(v6 + 16) = [(NSString *)self->_actualService copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_scheduleType;
    *(unsigned char *)(v6 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v6 + 40) = self->_scheduleState;
    *(unsigned char *)(v6 + 52) |= 1u;
  }

  *(void *)(v6 + 8) = [(NSString *)self->_actualParentChatId copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_version != *((_DWORD *)a3 + 12)) {
        goto LABEL_25;
      }
    }
    else if ((*((unsigned char *)a3 + 52) & 4) != 0)
    {
LABEL_25:
      LOBYTE(v5) = 0;
      return v5;
    }
    associatedMessageEmoji = self->_associatedMessageEmoji;
    if (!((unint64_t)associatedMessageEmoji | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](associatedMessageEmoji, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if (!((unint64_t)padding | *((void *)a3 + 4)) || (int v5 = -[NSData isEqual:](padding, "isEqual:")) != 0)
      {
        actualService = self->_actualService;
        if (!((unint64_t)actualService | *((void *)a3 + 2))
          || (int v5 = -[NSString isEqual:](actualService, "isEqual:")) != 0)
        {
          if ((*(unsigned char *)&self->_has & 2) != 0)
          {
            if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_scheduleType != *((_DWORD *)a3 + 11)) {
              goto LABEL_25;
            }
          }
          else if ((*((unsigned char *)a3 + 52) & 2) != 0)
          {
            goto LABEL_25;
          }
          if (*(unsigned char *)&self->_has)
          {
            if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_scheduleState != *((_DWORD *)a3 + 10)) {
              goto LABEL_25;
            }
          }
          else if (*((unsigned char *)a3 + 52))
          {
            goto LABEL_25;
          }
          actualParentChatId = self->_actualParentChatId;
          if ((unint64_t)actualParentChatId | *((void *)a3 + 1))
          {
            LOBYTE(v5) = -[NSString isEqual:](actualParentChatId, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_associatedMessageEmoji hash];
  uint64_t v5 = [(NSData *)self->_padding hash];
  NSUInteger v6 = [(NSString *)self->_actualService hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_scheduleType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_actualParentChatId hash];
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_scheduleState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_actualParentChatId hash];
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 52) & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 3)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setAssociatedMessageEmoji:](self, "setAssociatedMessageEmoji:");
  }
  if (*((void *)a3 + 4)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setPadding:](self, "setPadding:");
  }
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualService:](self, "setActualService:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 2) != 0)
  {
    self->_scheduleType = *((_DWORD *)a3 + 11);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 52);
  }
  if (v5)
  {
    self->_scheduleState = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualParentChatId:](self, "setActualParentChatId:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)setAssociatedMessageEmoji:(id)a3
{
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (NSString)actualService
{
  return self->_actualService;
}

- (void)setActualService:(id)a3
{
}

- (unsigned)scheduleType
{
  return self->_scheduleType;
}

- (unsigned)scheduleState
{
  return self->_scheduleState;
}

- (NSString)actualParentChatId
{
  return self->_actualParentChatId;
}

- (void)setActualParentChatId:(id)a3
{
}

@end