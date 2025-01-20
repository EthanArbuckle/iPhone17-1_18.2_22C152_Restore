@interface VCCCMessage
- (BOOL)hasPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)payload;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)transactionID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPayload:(id)a3;
- (void)setTopic:(id)a3;
- (void)setTransactionID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCCCMessage

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCCCMessage *)self setTopic:0];
  [(VCCCMessage *)self setPayload:0];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessage;
  [(VCCCMessage *)&v3 dealloc];
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCCCMessage description](&v3, sel_description), -[VCCCMessage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_transactionID), @"transactionID");
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCCMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteStringField();
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_transactionID;
  [a3 setTopic:self->_topic];
  if (self->_payload)
  {
    objc_msgSend(a3, "setPayload:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_transactionID;

  *(void *)(v5 + 24) = [(NSString *)self->_topic copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSData *)self->_payload copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_transactionID == *((void *)a3 + 1))
    {
      topic = self->_topic;
      if (!((unint64_t)topic | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](topic, "isEqual:")) != 0)
      {
        payload = self->_payload;
        if ((unint64_t)payload | *((void *)a3 + 2))
        {
          LOBYTE(v5) = -[NSData isEqual:](payload, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = 2654435761u * self->_transactionID;
  NSUInteger v4 = [(NSString *)self->_topic hash];
  return v4 ^ [(NSData *)self->_payload hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  self->_transactionID = *((void *)a3 + 1);
  if (*((void *)a3 + 3)) {
    -[VCCCMessage setTopic:](self, "setTopic:");
  }
  if (*((void *)a3 + 2))
  {
    -[VCCCMessage setPayload:](self, "setPayload:");
  }
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

@end