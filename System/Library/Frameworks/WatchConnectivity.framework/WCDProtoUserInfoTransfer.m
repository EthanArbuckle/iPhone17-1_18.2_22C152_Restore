@interface WCDProtoUserInfoTransfer
- (BOOL)hasClientData;
- (BOOL)hasTransferIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)clientData;
- (NSString)transferIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientData:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setTransferIdentifier:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WCDProtoUserInfoTransfer

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientData
{
  return self->_clientData != 0;
}

- (BOOL)hasTransferIdentifier
{
  return self->_transferIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WCDProtoUserInfoTransfer;
  v4 = [(WCDProtoUserInfoTransfer *)&v8 description];
  v5 = [(WCDProtoUserInfoTransfer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  clientData = self->_clientData;
  if (clientData) {
    [v3 setObject:clientData forKey:@"clientData"];
  }
  transferIdentifier = self->_transferIdentifier;
  if (transferIdentifier) {
    [v3 setObject:transferIdentifier forKey:@"transferIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WCDProtoUserInfoTransferReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_clientData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_transferIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v5 = v4;
  if (self->_clientData)
  {
    objc_msgSend(v4, "setClientData:");
    id v4 = v5;
  }
  if (self->_transferIdentifier)
  {
    objc_msgSend(v5, "setTransferIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_clientData copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_transferIdentifier copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  clientData = self->_clientData;
  if ((unint64_t)clientData | *((void *)v4 + 1) && !-[NSData isEqual:](clientData, "isEqual:")) {
    goto LABEL_11;
  }
  transferIdentifier = self->_transferIdentifier;
  if ((unint64_t)transferIdentifier | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](transferIdentifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_clientData hash] ^ v3;
  return v4 ^ [(NSString *)self->_transferIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[7])
  {
    self->_version = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[WCDProtoUserInfoTransfer setClientData:](self, "setClientData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WCDProtoUserInfoTransfer setTransferIdentifier:](self, "setTransferIdentifier:");
    uint64_t v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (void)setTransferIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifier, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

@end