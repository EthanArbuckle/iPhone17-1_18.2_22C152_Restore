@interface HMRemoteEventRouterProtoConnectedClientInfo
- (BOOL)hasConnectedClientIdentifierString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)connectedClientIdentifierString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectedClientIdentifierString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMRemoteEventRouterProtoConnectedClientInfo

- (void).cxx_destruct
{
}

- (void)setConnectedClientIdentifierString:(id)a3
{
}

- (NSString)connectedClientIdentifierString
{
  return self->_connectedClientIdentifierString;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[HMRemoteEventRouterProtoConnectedClientInfo setConnectedClientIdentifierString:](self, "setConnectedClientIdentifierString:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_connectedClientIdentifierString hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    connectedClientIdentifierString = self->_connectedClientIdentifierString;
    if ((unint64_t)connectedClientIdentifierString | v4[1]) {
      char v6 = -[NSString isEqual:](connectedClientIdentifierString, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_connectedClientIdentifierString copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  connectedClientIdentifierString = self->_connectedClientIdentifierString;
  if (connectedClientIdentifierString) {
    [a3 setConnectedClientIdentifierString:connectedClientIdentifierString];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_connectedClientIdentifierString) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMRemoteEventRouterProtoConnectedClientInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  connectedClientIdentifierString = self->_connectedClientIdentifierString;
  if (connectedClientIdentifierString) {
    [v3 setObject:connectedClientIdentifierString forKey:@"connectedClientIdentifierString"];
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMRemoteEventRouterProtoConnectedClientInfo;
  v4 = [(HMRemoteEventRouterProtoConnectedClientInfo *)&v8 description];
  v5 = [(HMRemoteEventRouterProtoConnectedClientInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasConnectedClientIdentifierString
{
  return self->_connectedClientIdentifierString != 0;
}

@end