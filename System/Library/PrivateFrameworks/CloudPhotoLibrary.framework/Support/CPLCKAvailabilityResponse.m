@interface CPLCKAvailabilityResponse
- (BOOL)allowed;
- (BOOL)hasAllowed;
- (BOOL)hasFeature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureAsString:(int)a3;
- (int)StringAsFeature:(id)a3;
- (int)feature;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowed:(BOOL)a3;
- (void)setFeature:(int)a3;
- (void)setHasAllowed:(BOOL)a3;
- (void)setHasFeature:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCKAvailabilityResponse

- (void)setFeature:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feature = a3;
}

- (void)setHasFeature:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeature
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)featureAsString:(int)a3
{
  return sub_100047594(a3);
}

- (int)StringAsFeature:(id)a3
{
  return sub_100047658(a3);
}

- (void)setAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_allowed = a3;
}

- (void)setHasAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCKAvailabilityResponse;
  char v3 = [(CPLCKAvailabilityResponse *)&v7 description];
  v4 = [(CPLCKAvailabilityResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = sub_100047594(self->_feature);
    [v3 setObject:v5 forKey:@"feature"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_allowed];
    [v3 setObject:v6 forKey:@"allowed"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCKAvailabilityResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_feature;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 12) = self->_allowed;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_feature;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_allowed;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_feature != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_9;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }
    if (self->_allowed)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_9;
    }
    BOOL v5 = 1;
  }
LABEL_10:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_feature;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_allowed;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_feature = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_allowed = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)feature
{
  return self->_feature;
}

- (BOOL)allowed
{
  return self->_allowed;
}

@end