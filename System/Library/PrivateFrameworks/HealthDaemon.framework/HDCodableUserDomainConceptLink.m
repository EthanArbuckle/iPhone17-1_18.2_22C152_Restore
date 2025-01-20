@interface HDCodableUserDomainConceptLink
- (BOOL)hasTargetUUID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)targetUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setTargetUUID:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConceptLink

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

- (BOOL)hasTargetUUID
{
  return self->_targetUUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConceptLink;
  v4 = [(HDCodableUserDomainConceptLink *)&v8 description];
  v5 = [(HDCodableUserDomainConceptLink *)self dictionaryRepresentation];
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
  targetUUID = self->_targetUUID;
  if (targetUUID) {
    [v3 setObject:targetUUID forKey:@"targetUUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptLinkReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_targetUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_type;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_targetUUID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setTargetUUID:");
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
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_targetUUID copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  targetUUID = self->_targetUUID;
  if ((unint64_t)targetUUID | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](targetUUID, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_type;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_targetUUID hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[3])
  {
    self->_type = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[HDCodableUserDomainConceptLink setTargetUUID:](self, "setTargetUUID:");
    id v4 = v5;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)targetUUID
{
  return self->_targetUUID;
}

- (void)setTargetUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end