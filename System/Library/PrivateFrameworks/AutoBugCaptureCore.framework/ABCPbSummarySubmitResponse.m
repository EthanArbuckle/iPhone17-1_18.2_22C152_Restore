@interface ABCPbSummarySubmitResponse
- (BOOL)hasMessage;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)description;
- (NSString)message;
- (NSString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessage:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSummarySubmitResponse

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSummarySubmitResponse;
  v4 = [(ABCPbSummarySubmitResponse *)&v8 description];
  v5 = [(ABCPbSummarySubmitResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  status = self->_status;
  if (status) {
    [v3 setObject:status forKey:@"status"];
  }
  message = self->_message;
  if (message) {
    [v4 setObject:message forKey:@"message"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySubmitResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_status)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_message)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_status)
  {
    objc_msgSend(v4, "setStatus:");
    id v4 = v5;
  }
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_status copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_message copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((status = self->_status, !((unint64_t)status | v4[2]))
     || -[NSString isEqual:](status, "isEqual:")))
  {
    message = self->_message;
    if ((unint64_t)message | v4[1]) {
      char v7 = -[NSString isEqual:](message, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_status hash];
  return [(NSString *)self->_message hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[ABCPbSummarySubmitResponse setStatus:](self, "setStatus:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[ABCPbSummarySubmitResponse setMessage:](self, "setMessage:");
    id v4 = v5;
  }
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end