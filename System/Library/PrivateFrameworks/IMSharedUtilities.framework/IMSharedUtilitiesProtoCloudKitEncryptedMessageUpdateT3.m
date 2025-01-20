@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3
- (BOOL)hasChatid;
- (BOOL)hasMsgid;
- (BOOL)hasPadding;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)chatid;
- (NSString)msgid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChatid:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMsgid:(id)a3;
- (void)setPadding:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 *)self setMsgid:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 *)self setChatid:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 *)&v3 dealloc];
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMsgid
{
  return self->_msgid != 0;
}

- (BOOL)hasChatid
{
  return self->_chatid != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
  }
  msgid = self->_msgid;
  if (msgid) {
    [v3 setObject:msgid forKey:@"msgid"];
  }
  chatid = self->_chatid;
  if (chatid) {
    [v3 setObject:chatid forKey:@"chatid"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_msgid) {
    PBDataWriterWriteStringField();
  }
  if (self->_chatid) {
    PBDataWriterWriteStringField();
  }
  if (self->_padding)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 8) = self->_version;
    *((unsigned char *)a3 + 36) |= 1u;
  }
  if (self->_msgid) {
    objc_msgSend(a3, "setMsgid:");
  }
  if (self->_chatid) {
    objc_msgSend(a3, "setChatid:");
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
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(unsigned char *)(v5 + 36) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_msgid copyWithZone:a3];
  *(void *)(v6 + 8) = [(NSString *)self->_chatid copyWithZone:a3];

  *(void *)(v6 + 24) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_version != *((_DWORD *)a3 + 8)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    msgid = self->_msgid;
    if (!((unint64_t)msgid | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](msgid, "isEqual:")) != 0)
    {
      chatid = self->_chatid;
      if (!((unint64_t)chatid | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](chatid, "isEqual:")) != 0)
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
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_msgid hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_chatid hash];
  return v4 ^ v5 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 36))
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setMsgid:](self, "setMsgid:");
  }
  if (*((void *)a3 + 1)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setChatid:](self, "setChatid:");
  }
  if (*((void *)a3 + 3))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)msgid
{
  return self->_msgid;
}

- (void)setMsgid:(id)a3
{
}

- (NSString)chatid
{
  return self->_chatid;
}

- (void)setChatid:(id)a3
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