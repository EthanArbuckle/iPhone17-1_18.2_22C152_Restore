@interface RoutingAreaId
- (BOOL)hasEncodedPlmn;
- (BOOL)hasLac;
- (BOOL)hasRac;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodedPlmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lac;
- (unsigned)rac;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncodedPlmn:(id)a3;
- (void)setHasLac:(BOOL)a3;
- (void)setHasRac:(BOOL)a3;
- (void)setLac:(unsigned int)a3;
- (void)setRac:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RoutingAreaId

- (BOOL)hasEncodedPlmn
{
  return self->_encodedPlmn != 0;
}

- (void)setLac:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lac = a3;
}

- (void)setHasLac:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLac
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRac:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rac = a3;
}

- (void)setHasRac:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRac
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RoutingAreaId;
  char v3 = [(RoutingAreaId *)&v7 description];
  v4 = [(RoutingAreaId *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  encodedPlmn = self->_encodedPlmn;
  if (encodedPlmn) {
    [v3 setObject:encodedPlmn forKey:@"encoded_plmn"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_lac];
    [v4 setObject:v7 forKey:@"lac"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_rac];
    [v4 setObject:v8 forKey:@"rac"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004649C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_encodedPlmn)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_encodedPlmn)
  {
    id v6 = v4;
    [v4 setEncodedPlmn];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_lac;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_rac;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_encodedPlmn copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_lac;
    *((unsigned char *)v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_rac;
    *((unsigned char *)v5 + 24) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  encodedPlmn = self->_encodedPlmn;
  if ((unint64_t)encodedPlmn | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](encodedPlmn, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_lac != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_rac != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_encodedPlmn hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_lac;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_rac;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[RoutingAreaId setEncodedPlmn:](self, "setEncodedPlmn:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_lac = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_rac = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)encodedPlmn
{
  return self->_encodedPlmn;
}

- (void)setEncodedPlmn:(id)a3
{
}

- (unsigned)lac
{
  return self->_lac;
}

- (unsigned)rac
{
  return self->_rac;
}

- (void).cxx_destruct
{
}

@end