@interface NCSetIrisModeRequest
- (BOOL)hasIrisMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)irisModeAsString:(int)a3;
- (int)StringAsIrisMode:(id)a3;
- (int)irisMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIrisMode:(BOOL)a3;
- (void)setIrisMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetIrisModeRequest

- (int)irisMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_irisMode;
  }
  else {
    return 0;
  }
}

- (void)setIrisMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_irisMode = a3;
}

- (void)setHasIrisMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIrisMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)irisModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100030520[a3];
  }
  return v3;
}

- (int)StringAsIrisMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"On"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Auto"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NCSetIrisModeRequest;
  id v3 = [(NCSetIrisModeRequest *)&v7 description];
  int v4 = [(NCSetIrisModeRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t irisMode = self->_irisMode;
    if (irisMode >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_irisMode];
    }
    else
    {
      v5 = off_100030520[irisMode];
    }
    [v3 setObject:v5 forKey:@"irisMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000B17C((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_irisMode;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_irisMode;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_irisMode == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_irisMode;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t irisMode = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end