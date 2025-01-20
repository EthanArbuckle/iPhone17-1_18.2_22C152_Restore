@interface ASCodableWithdrawInviteRequest
- (BOOL)hasHandshakeToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)handshakeToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandshakeToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableWithdrawInviteRequest

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableWithdrawInviteRequest;
  v4 = [(ASCodableWithdrawInviteRequest *)&v8 description];
  v5 = [(ASCodableWithdrawInviteRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken) {
    [v3 setObject:handshakeToken forKey:@"handshakeToken"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableWithdrawInviteRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_handshakeToken) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  handshakeToken = self->_handshakeToken;
  if (handshakeToken) {
    [a3 setHandshakeToken:handshakeToken];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_handshakeToken copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    handshakeToken = self->_handshakeToken;
    if ((unint64_t)handshakeToken | v4[1]) {
      char v6 = -[NSString isEqual:](handshakeToken, "isEqual:");
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

- (unint64_t)hash
{
  return [(NSString *)self->_handshakeToken hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ASCodableWithdrawInviteRequest setHandshakeToken:](self, "setHandshakeToken:");
  }
}

- (NSString)handshakeToken
{
  return self->_handshakeToken;
}

- (void)setHandshakeToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end