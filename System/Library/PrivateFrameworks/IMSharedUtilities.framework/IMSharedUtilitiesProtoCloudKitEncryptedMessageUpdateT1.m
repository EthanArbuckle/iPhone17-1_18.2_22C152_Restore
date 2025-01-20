@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1
- (BOOL)hasMsgid;
- (BOOL)hasPadding;
- (BOOL)hasThreadGuid;
- (BOOL)hasThreadPart;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)msgid;
- (NSString)threadGuid;
- (NSString)threadPart;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMsgid:(id)a3;
- (void)setPadding:(id)a3;
- (void)setThreadGuid:(id)a3;
- (void)setThreadPart:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 *)self setMsgid:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 *)self setThreadGuid:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 *)self setThreadPart:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 *)&v3 dealloc];
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

- (BOOL)hasThreadGuid
{
  return self->_threadGuid != 0;
}

- (BOOL)hasThreadPart
{
  return self->_threadPart != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  threadGuid = self->_threadGuid;
  if (threadGuid) {
    [v3 setObject:threadGuid forKey:@"thread_guid"];
  }
  threadPart = self->_threadPart;
  if (threadPart) {
    [v3 setObject:threadPart forKey:@"thread_part"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_msgid) {
    PBDataWriterWriteStringField();
  }
  if (self->_threadGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_threadPart) {
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
    *((_DWORD *)a3 + 10) = self->_version;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_msgid) {
    objc_msgSend(a3, "setMsgid:");
  }
  if (self->_threadGuid) {
    objc_msgSend(a3, "setThreadGuid:");
  }
  if (self->_threadPart) {
    objc_msgSend(a3, "setThreadPart:");
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
    *(_DWORD *)(v5 + 40) = self->_version;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 8) = [(NSString *)self->_msgid copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_threadGuid copyWithZone:a3];

  *(void *)(v6 + 32) = [(NSString *)self->_threadPart copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_version != *((_DWORD *)a3 + 10)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    msgid = self->_msgid;
    if (!((unint64_t)msgid | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](msgid, "isEqual:")) != 0)
    {
      threadGuid = self->_threadGuid;
      if (!((unint64_t)threadGuid | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](threadGuid, "isEqual:")) != 0)
      {
        threadPart = self->_threadPart;
        if (!((unint64_t)threadPart | *((void *)a3 + 4))
          || (int v5 = -[NSString isEqual:](threadPart, "isEqual:")) != 0)
        {
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
  NSUInteger v5 = [(NSString *)self->_threadGuid hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_threadPart hash];
  return v6 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 setMsgid:](self, "setMsgid:");
  }
  if (*((void *)a3 + 3)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 setThreadGuid:](self, "setThreadGuid:");
  }
  if (*((void *)a3 + 4)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 setThreadPart:](self, "setThreadPart:");
  }
  if (*((void *)a3 + 2))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT1 setPadding:](self, "setPadding:");
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

- (NSString)threadGuid
{
  return self->_threadGuid;
}

- (void)setThreadGuid:(id)a3
{
}

- (NSString)threadPart
{
  return self->_threadPart;
}

- (void)setThreadPart:(id)a3
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