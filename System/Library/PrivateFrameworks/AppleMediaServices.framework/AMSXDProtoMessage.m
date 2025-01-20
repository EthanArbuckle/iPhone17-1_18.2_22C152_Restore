@interface AMSXDProtoMessage
- (BOOL)hasLogKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageData;
- (NSString)logKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMessageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMSXDProtoMessage

- (BOOL)hasLogKey
{
  return self->_logKey != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AMSXDProtoMessage;
  v3 = [(AMSXDProtoMessage *)&v7 description];
  v4 = [(AMSXDProtoMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }
  logKey = self->_logKey;
  if (logKey) {
    [v4 setObject:logKey forKey:@"logKey"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000633B8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_messageData) {
    sub_1000CB774();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_logKey) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setMessageData:self->_messageData];
  if (self->_logKey) {
    objc_msgSend(v4, "setLogKey:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_messageData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_logKey copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((messageData = self->_messageData, !((unint64_t)messageData | v4[2]))
     || -[NSData isEqual:](messageData, "isEqual:")))
  {
    logKey = self->_logKey;
    if ((unint64_t)logKey | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](logKey, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_messageData hash];
  return [(NSString *)self->_logKey hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[AMSXDProtoMessage setMessageData:](self, "setMessageData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[AMSXDProtoMessage setLogKey:](self, "setLogKey:");
    id v4 = v5;
  }
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end