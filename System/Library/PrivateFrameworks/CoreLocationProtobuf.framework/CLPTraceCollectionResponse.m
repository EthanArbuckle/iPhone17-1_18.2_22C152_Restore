@interface CLPTraceCollectionResponse
- (BOOL)hasMsg;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)msg;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMsg:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPTraceCollectionResponse

- (BOOL)hasMsg
{
  return self->_msg != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPTraceCollectionResponse;
  v4 = [(CLPTraceCollectionResponse *)&v8 description];
  v5 = [(CLPTraceCollectionResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithBool:self->_success];
  [v3 setObject:v4 forKey:@"success"];

  msg = self->_msg;
  if (msg) {
    [v3 setObject:msg forKey:@"msg"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPTraceCollectionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_msg) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 16) = self->_success;
  msg = self->_msg;
  if (msg) {
    [a3 setMsg:msg];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 16) = self->_success;
  uint64_t v6 = [(NSString *)self->_msg copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  if (self->_success)
  {
    if (*((unsigned char *)v4 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  if (*((unsigned char *)v4 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  msg = self->_msg;
  if ((unint64_t)msg | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](msg, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_success;
  return [(NSString *)self->_msg hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_success = *((unsigned char *)a3 + 16);
  if (*((void *)a3 + 1)) {
    -[CLPTraceCollectionResponse setMsg:](self, "setMsg:");
  }
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)msg
{
  return self->_msg;
}

- (void)setMsg:(id)a3
{
}

- (void).cxx_destruct
{
}

@end