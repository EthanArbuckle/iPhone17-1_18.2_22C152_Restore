@interface IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange
- (BOOL)hasOtherHandle;
- (BOOL)hasPadding;
- (BOOL)hasParticipantChangeType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)otherHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)participantChangeType;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasParticipantChangeType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setOtherHandle:(id)a3;
- (void)setPadding:(id)a3;
- (void)setParticipantChangeType:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange *)self setOtherHandle:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange;
  [(IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange *)&v3 dealloc];
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setParticipantChangeType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantChangeType = a3;
}

- (void)setHasParticipantChangeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantChangeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOtherHandle
{
  return self->_otherHandle != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_participantChangeType), @"participant_change_type");
  }
  otherHandle = self->_otherHandle;
  if (otherHandle) {
    [v3 setObject:otherHandle forKey:@"other_handle"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedParticipantChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_otherHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_padding)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_version;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_participantChangeType;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_otherHandle) {
    objc_msgSend(a3, "setOtherHandle:");
  }
  if (self->_padding)
  {
    objc_msgSend(a3, "setPadding:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_participantChangeType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_otherHandle copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_version != *((_DWORD *)a3 + 8)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_participantChangeType != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_16;
    }
    otherHandle = self->_otherHandle;
    if (!((unint64_t)otherHandle | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](otherHandle, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSData isEqual:](padding, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_participantChangeType;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_otherHandle hash];
  return v5 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if (v5)
  {
    self->_participantChangeType = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setOtherHandle:](self, "setOtherHandle:");
  }
  if (*((void *)a3 + 3))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)participantChangeType
{
  return self->_participantChangeType;
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

@end