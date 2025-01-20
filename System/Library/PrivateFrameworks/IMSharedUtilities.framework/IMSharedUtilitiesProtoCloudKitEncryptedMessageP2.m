@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageP2
- (BOOL)hasPadding;
- (BOOL)hasThreadIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)padding;
- (NSString)threadIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setPadding:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageP2

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 *)self setThreadIdentifier:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP2;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 *)&v3 dealloc];
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

- (BOOL)hasThreadIdentifier
{
  return self->_threadIdentifier != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP2;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_version), @"version");
  }
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier) {
    [v3 setObject:threadIdentifier forKey:@"thread_identifier"];
  }
  padding = self->_padding;
  if (padding) {
    [v3 setObject:padding forKey:@"padding"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageP2ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_threadIdentifier) {
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
    *((_DWORD *)a3 + 6) = self->_version;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if (self->_threadIdentifier) {
    objc_msgSend(a3, "setThreadIdentifier:");
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
    *(_DWORD *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 28) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSString *)self->_threadIdentifier copyWithZone:a3];
  *(void *)(v6 + 8) = [(NSData *)self->_padding copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_version != *((_DWORD *)a3 + 6)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    threadIdentifier = self->_threadIdentifier;
    if (!((unint64_t)threadIdentifier | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](threadIdentifier, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((void *)a3 + 1))
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
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_threadIdentifier hash] ^ v3;
  return v4 ^ [(NSData *)self->_padding hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 28))
  {
    self->_version = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 setThreadIdentifier:](self, "setThreadIdentifier:");
  }
  if (*((void *)a3 + 1))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP2 setPadding:](self, "setPadding:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
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