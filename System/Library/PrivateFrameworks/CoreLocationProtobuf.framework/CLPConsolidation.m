@interface CLPConsolidation
- (BOOL)hasPossibleDuplicate;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)possibleDuplicate;
- (BOOL)readFrom:(id)a3;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPossibleDuplicate:(BOOL)a3;
- (void)setPossibleDuplicate:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPConsolidation

- (void)setPossibleDuplicate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_possibleDuplicate = a3;
}

- (void)setHasPossibleDuplicate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPossibleDuplicate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPConsolidation;
  v4 = [(CLPConsolidation *)&v8 description];
  v5 = [(CLPConsolidation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_possibleDuplicate];
    [v3 setObject:v4 forKey:@"possibleDuplicate"];
  }
  version = self->_version;
  if (version) {
    [v3 setObject:version forKey:@"version"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPConsolidationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_version)
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
    v4[16] = self->_possibleDuplicate;
    v4[20] |= 1u;
  }
  if (self->_version)
  {
    id v5 = v4;
    objc_msgSend(v4, "setVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_possibleDuplicate;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_version copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_possibleDuplicate)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 1)) {
    char v5 = -[NSString isEqual:](version, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_possibleDuplicate;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_version hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[20])
  {
    self->_possibleDuplicate = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    char v5 = v4;
    -[CLPConsolidation setVersion:](self, "setVersion:");
    id v4 = v5;
  }
}

- (BOOL)possibleDuplicate
{
  return self->_possibleDuplicate;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end