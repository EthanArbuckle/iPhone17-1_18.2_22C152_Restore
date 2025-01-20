@interface KCInitialMessageData
- (BOOL)hasPrepareMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)prepareMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrepareMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCInitialMessageData

- (void).cxx_destruct
{
}

- (void)setPrepareMessage:(id)a3
{
}

- (NSData)prepareMessage
{
  return self->_prepareMessage;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[KCInitialMessageData setPrepareMessage:](self, "setPrepareMessage:");
  }
}

- (unint64_t)hash
{
  return [(NSData *)self->_prepareMessage hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    prepareMessage = self->_prepareMessage;
    if ((unint64_t)prepareMessage | v4[1]) {
      char v6 = -[NSData isEqual:](prepareMessage, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_prepareMessage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  prepareMessage = self->_prepareMessage;
  if (prepareMessage) {
    [a3 setPrepareMessage:prepareMessage];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_prepareMessage) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return KCInitialMessageDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  prepareMessage = self->_prepareMessage;
  if (prepareMessage) {
    [v3 setObject:prepareMessage forKey:@"prepareMessage"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCInitialMessageData;
  v4 = [(KCInitialMessageData *)&v8 description];
  v5 = [(KCInitialMessageData *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPrepareMessage
{
  return self->_prepareMessage != 0;
}

@end