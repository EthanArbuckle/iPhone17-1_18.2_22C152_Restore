@interface HDCodableClinicalGateway
- (BOOL)hasMessageVersion;
- (BOOL)hasRawContent;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)rawContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessageVersion:(id)a3;
- (void)setRawContent:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableClinicalGateway

- (BOOL)hasRawContent
{
  return self->_rawContent != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableClinicalGateway;
  v4 = [(HDCodableClinicalGateway *)&v8 description];
  v5 = [(HDCodableClinicalGateway *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  rawContent = self->_rawContent;
  if (rawContent) {
    [v3 setObject:rawContent forKey:@"rawContent"];
  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v7 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"messageVersion"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v9 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalGatewayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_rawContent)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_rawContent)
  {
    objc_msgSend(v4, "setRawContent:");
    id v4 = v5;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_rawContent copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((rawContent = self->_rawContent, !((unint64_t)rawContent | v4[2]))
     || -[NSData isEqual:](rawContent, "isEqual:"))
    && ((messageVersion = self->_messageVersion, !((unint64_t)messageVersion | v4[1]))
     || -[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[3]) {
      char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_rawContent hash];
  unint64_t v4 = [(HDCodableMessageVersion *)self->_messageVersion hash] ^ v3;
  return v4 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[HDCodableClinicalGateway setRawContent:](self, "setRawContent:");
    unint64_t v4 = v9;
  }
  messageVersion = self->_messageVersion;
  uint64_t v6 = v4[1];
  if (messageVersion)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[HDCodableClinicalGateway setMessageVersion:](self, "setMessageVersion:");
  }
  unint64_t v4 = v9;
LABEL_9:
  syncIdentity = self->_syncIdentity;
  uint64_t v8 = v4[3];
  if (syncIdentity)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HDCodableClinicalGateway setSyncIdentity:](self, "setSyncIdentity:");
  }
  unint64_t v4 = v9;
LABEL_15:
}

- (NSData)rawContent
{
  return self->_rawContent;
}

- (void)setRawContent:(id)a3
{
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_rawContent, 0);

  objc_storeStrong((id *)&self->_messageVersion, 0);
}

@end