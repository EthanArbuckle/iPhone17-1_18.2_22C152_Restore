@interface CPLCKAvailabilityRequest
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
- (void)setFeature:(int)a3;
- (void)setHasFeature:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCKAvailabilityRequest

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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCKAvailabilityRequest;
  v3 = [(CPLCKAvailabilityRequest *)&v7 description];
  v4 = [(CPLCKAvailabilityRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = sub_100047594(self->_feature);
    [v3 setObject:v4 forKey:@"feature"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCKAvailabilityRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_feature;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_feature;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_feature == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_feature;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_feature = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)feature
{
  return self->_feature;
}

@end