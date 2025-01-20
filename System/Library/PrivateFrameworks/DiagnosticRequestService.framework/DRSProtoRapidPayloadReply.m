@interface DRSProtoRapidPayloadReply
- (BOOL)hasFailureReason;
- (BOOL)hasReplyPayload;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)replyPayload;
- (NSString)failureReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setReplyPayload:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoRapidPayloadReply

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasFailureReason
{
  return self->_failureReason != 0;
}

- (BOOL)hasReplyPayload
{
  return self->_replyPayload != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoRapidPayloadReply;
  v4 = [(DRSProtoRapidPayloadReply *)&v8 description];
  v5 = [(DRSProtoRapidPayloadReply *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  failureReason = self->_failureReason;
  if (failureReason) {
    [v3 setObject:failureReason forKey:@"failure_reason"];
  }
  replyPayload = self->_replyPayload;
  if (replyPayload) {
    [v3 setObject:replyPayload forKey:@"reply_payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRapidPayloadReplyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_failureReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_replyPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_success;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_failureReason)
  {
    objc_msgSend(v4, "setFailureReason:");
    id v4 = v5;
  }
  if (self->_replyPayload)
  {
    objc_msgSend(v5, "setReplyPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_success;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_failureReason copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSData *)self->_replyPayload copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_success)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  failureReason = self->_failureReason;
  if ((unint64_t)failureReason | *((void *)v4 + 1)
    && !-[NSString isEqual:](failureReason, "isEqual:"))
  {
    goto LABEL_14;
  }
  replyPayload = self->_replyPayload;
  if ((unint64_t)replyPayload | *((void *)v4 + 2)) {
    char v7 = -[NSData isEqual:](replyPayload, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_success;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_failureReason hash] ^ v3;
  return v4 ^ [(NSData *)self->_replyPayload hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[28])
  {
    self->_success = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[DRSProtoRapidPayloadReply setFailureReason:](self, "setFailureReason:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[DRSProtoRapidPayloadReply setReplyPayload:](self, "setReplyPayload:");
    NSUInteger v4 = v5;
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
}

- (NSData)replyPayload
{
  return self->_replyPayload;
}

- (void)setReplyPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyPayload, 0);

  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end