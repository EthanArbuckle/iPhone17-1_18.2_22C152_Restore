@interface ModelKeyServerAPIResultError
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)message;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIResultError

- (void).cxx_destruct
{
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ModelKeyServerAPIResultError setMessage:](self, "setMessage:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_message hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    message = self->_message;
    if ((unint64_t)message | v4[1]) {
      char v6 = -[NSString isEqual:](message, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_message copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  message = self->_message;
  if (message) {
    [a3 setMessage:message];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIResultErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIResultError;
  v4 = [(ModelKeyServerAPIResultError *)&v8 description];
  v5 = [(ModelKeyServerAPIResultError *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

@end