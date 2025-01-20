@interface NCSetHDRModeResponse
- (BOOL)hasHdrMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hdrModeAsString:(int)a3;
- (int)StringAsHdrMode:(id)a3;
- (int)hdrMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHdrMode:(BOOL)a3;
- (void)setHdrMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NCSetHDRModeResponse

- (int)hdrMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_hdrMode;
  }
  else {
    return 0;
  }
}

- (void)setHdrMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hdrMode = a3;
}

- (void)setHasHdrMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHdrMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)hdrModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100030E70 + a3);
  }
  return v3;
}

- (int)StringAsHdrMode:(id)a3
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
  v7.super_class = (Class)NCSetHDRModeResponse;
  id v3 = [(NCSetHDRModeResponse *)&v7 description];
  int v4 = [(NCSetHDRModeResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t hdrMode = self->_hdrMode;
    if (hdrMode >= 3)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_hdrMode];
    }
    else
    {
      v5 = *(&off_100030E70 + hdrMode);
    }
    [v3 setObject:v5 forKey:@"hdrMode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100020D78((uint64_t)self, (uint64_t)a3);
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
    *((_DWORD *)a3 + 2) = self->_hdrMode;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_hdrMode;
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
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_hdrMode == *((_DWORD *)v4 + 2))
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
    return 2654435761 * self->_hdrMode;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_uint64_t hdrMode = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end