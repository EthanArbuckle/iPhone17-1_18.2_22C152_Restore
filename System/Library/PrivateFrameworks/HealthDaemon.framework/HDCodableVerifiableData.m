@interface HDCodableVerifiableData
- (BOOL)hasDataValue;
- (BOOL)hasIssuerIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSString)issuerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIssuerIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableVerifiableData

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasIssuerIdentifier
{
  return self->_issuerIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableVerifiableData;
  v4 = [(HDCodableVerifiableData *)&v8 description];
  v5 = [(HDCodableVerifiableData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v3 setObject:dataValue forKey:@"dataValue"];
  }
  issuerIdentifier = self->_issuerIdentifier;
  if (issuerIdentifier) {
    [v3 setObject:issuerIdentifier forKey:@"issuerIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableVerifiableDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_issuerIdentifier)
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
    v4[1] = self->_type;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_dataValue)
  {
    objc_msgSend(v4, "setDataValue:");
    id v4 = v5;
  }
  if (self->_issuerIdentifier)
  {
    objc_msgSend(v5, "setIssuerIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_type;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_dataValue copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_issuerIdentifier copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_type != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 2) && !-[NSData isEqual:](dataValue, "isEqual:")) {
    goto LABEL_11;
  }
  issuerIdentifier = self->_issuerIdentifier;
  if ((unint64_t)issuerIdentifier | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](issuerIdentifier, "isEqual:");
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
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_dataValue hash] ^ v3;
  return v4 ^ [(NSString *)self->_issuerIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[4])
  {
    self->_type = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (v4[2])
  {
    -[HDCodableVerifiableData setDataValue:](self, "setDataValue:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    -[HDCodableVerifiableData setIssuerIdentifier:](self, "setIssuerIdentifier:");
    uint64_t v4 = v5;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);

  objc_storeStrong((id *)&self->_dataValue, 0);
}

@end