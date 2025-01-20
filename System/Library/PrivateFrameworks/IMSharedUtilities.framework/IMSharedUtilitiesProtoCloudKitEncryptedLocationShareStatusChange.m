@interface IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange
- (BOOL)hasOtherHandle;
- (BOOL)hasPadding;
- (BOOL)hasShareDirection;
- (BOOL)hasShareStatus;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)otherHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)shareDirection;
- (int64_t)shareStatus;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasShareDirection:(BOOL)a3;
- (void)setHasShareStatus:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setOtherHandle:(id)a3;
- (void)setPadding:(id)a3;
- (void)setShareDirection:(int64_t)a3;
- (void)setShareStatus:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange *)self setOtherHandle:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange;
  [(IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange *)&v3 dealloc];
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

- (void)setShareStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shareStatus = a3;
}

- (void)setHasShareStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShareStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShareDirection:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shareDirection = a3;
}

- (void)setHasShareDirection:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShareDirection
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
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_shareStatus), @"share_status");
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_shareDirection), @"share_direction");
LABEL_5:
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
  return IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
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
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_version;
    *((unsigned char *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_shareStatus;
  *((unsigned char *)a3 + 44) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)a3 + 1) = self->_shareDirection;
    *((unsigned char *)a3 + 44) |= 1u;
  }
LABEL_5:
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_shareStatus;
    *(unsigned char *)(v5 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 40) = self->_version;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_shareDirection;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
LABEL_5:

  *(void *)(v6 + 24) = [(NSString *)self->_otherHandle copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_version != *((_DWORD *)a3 + 10)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_shareStatus != *((void *)a3 + 2)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_21;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_shareDirection != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_21;
    }
    otherHandle = self->_otherHandle;
    if (!((unint64_t)otherHandle | *((void *)a3 + 3))
      || (int v5 = -[NSString isEqual:](otherHandle, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((void *)a3 + 4))
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
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_shareStatus;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_shareDirection;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_otherHandle hash];
  return v6 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_shareStatus = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 44))
  {
LABEL_4:
    self->_shareDirection = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)a3 + 3)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setOtherHandle:](self, "setOtherHandle:");
  }
  if (*((void *)a3 + 4))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)shareStatus
{
  return self->_shareStatus;
}

- (int64_t)shareDirection
{
  return self->_shareDirection;
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