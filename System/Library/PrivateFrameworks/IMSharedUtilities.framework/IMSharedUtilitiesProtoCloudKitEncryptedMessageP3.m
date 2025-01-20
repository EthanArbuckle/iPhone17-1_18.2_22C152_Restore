@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageP3
- (BOOL)hasCmmAssetOffset;
- (BOOL)hasCmmState;
- (BOOL)hasPadding;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)cmmAssetOffset;
- (unsigned)cmmState;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCmmAssetOffset:(unsigned int)a3;
- (void)setCmmState:(unsigned int)a3;
- (void)setHasCmmAssetOffset:(BOOL)a3;
- (void)setHasCmmState:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPadding:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageP3

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP3 *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP3;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP3 *)&v3 dealloc];
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

- (void)setCmmState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cmmState = a3;
}

- (void)setHasCmmState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCmmState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCmmAssetOffset:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cmmAssetOffset = a3;
}

- (void)setHasCmmAssetOffset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCmmAssetOffset
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP3;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP3 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP3 dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cmmState), @"cmm_state");
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cmmAssetOffset), @"cmm_asset_offset");
LABEL_5:
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageP3ReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
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
    *((_DWORD *)a3 + 6) = self->_version;
    *((unsigned char *)a3 + 28) |= 4u;
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
  *((_DWORD *)a3 + 3) = self->_cmmState;
  *((unsigned char *)a3 + 28) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)a3 + 2) = self->_cmmAssetOffset;
    *((unsigned char *)a3 + 28) |= 1u;
  }
LABEL_5:
  padding = self->_padding;
  if (padding) {
    [a3 setPadding:padding];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 12) = self->_cmmState;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_version;
  *(unsigned char *)(v5 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_cmmAssetOffset;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
LABEL_5:

  v6[2] = [(NSData *)self->_padding copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_version != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_cmmState != *((_DWORD *)a3 + 3)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_19;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_cmmAssetOffset != *((_DWORD *)a3 + 2)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
      goto LABEL_19;
    }
    padding = self->_padding;
    if ((unint64_t)padding | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSData isEqual:](padding, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSData *)self->_padding hash];
  }
  uint64_t v2 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_cmmState;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_cmmAssetOffset;
  return v3 ^ v2 ^ v4 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cmmState = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 28))
  {
LABEL_4:
    self->_cmmAssetOffset = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP3 setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)cmmState
{
  return self->_cmmState;
}

- (unsigned)cmmAssetOffset
{
  return self->_cmmAssetOffset;
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

@end