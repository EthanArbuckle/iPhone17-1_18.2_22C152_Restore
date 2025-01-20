@interface IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo
- (BOOL)hasMessageSummaryInfo;
- (BOOL)hasPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageSummaryInfo;
- (NSData)padding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setMessageSummaryInfo:(id)a3;
- (void)setPadding:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo

- (void)dealloc
{
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo *)self setMessageSummaryInfo:0];
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo *)self setPadding:0];
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo;
  [(IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo *)&v3 dealloc];
}

- (BOOL)hasMessageSummaryInfo
{
  return self->_messageSummaryInfo != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo) {
    [v3 setObject:messageSummaryInfo forKey:@"message_summary_info"];
  }
  padding = self->_padding;
  if (padding) {
    [v4 setObject:padding forKey:@"padding"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_messageSummaryInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_padding)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_messageSummaryInfo) {
    objc_msgSend(a3, "setMessageSummaryInfo:");
  }
  if (self->_padding)
  {
    objc_msgSend(a3, "setPadding:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)[(NSData *)self->_messageSummaryInfo copyWithZone:a3];
  v5[2] = (id)[(NSData *)self->_padding copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    messageSummaryInfo = self->_messageSummaryInfo;
    if (!((unint64_t)messageSummaryInfo | *((void *)a3 + 1))
      || (int v5 = -[NSData isEqual:](messageSummaryInfo, "isEqual:")) != 0)
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
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_messageSummaryInfo hash];
  return [(NSData *)self->_padding hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setMessageSummaryInfo:](self, "setMessageSummaryInfo:");
  }
  if (*((void *)a3 + 2))
  {
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setPadding:](self, "setPadding:");
  }
}

- (NSData)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
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