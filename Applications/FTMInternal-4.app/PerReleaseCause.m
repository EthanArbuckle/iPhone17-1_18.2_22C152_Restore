@interface PerReleaseCause
- (BOOL)hasMrab;
- (BOOL)hasNumCalls;
- (BOOL)hasReleaseCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mrabAsString:(int)a3;
- (int)StringAsMrab:(id)a3;
- (int)mrab;
- (int)releaseCause;
- (unint64_t)hash;
- (unsigned)numCalls;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMrab:(BOOL)a3;
- (void)setHasNumCalls:(BOOL)a3;
- (void)setHasReleaseCause:(BOOL)a3;
- (void)setMrab:(int)a3;
- (void)setNumCalls:(unsigned int)a3;
- (void)setReleaseCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PerReleaseCause

- (void)setReleaseCause:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_releaseCause = a3;
}

- (void)setHasReleaseCause:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReleaseCause
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)mrab
{
  if (*(unsigned char *)&self->_has) {
    return self->_mrab;
  }
  else {
    return 0;
  }
}

- (void)setMrab:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mrab = a3;
}

- (void)setHasMrab:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMrab
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)mrabAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1002874F8 + a3);
  }

  return v3;
}

- (int)StringAsMrab:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MRAB_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MRAB_EVER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MRAB_END"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNumCalls:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numCalls = a3;
}

- (void)setHasNumCalls:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumCalls
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PerReleaseCause;
  char v3 = [(PerReleaseCause *)&v7 description];
  int v4 = [(PerReleaseCause *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_releaseCause];
    [v3 setObject:v7 forKey:@"release_cause"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t mrab = self->_mrab;
  if (mrab >= 3)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mrab];
  }
  else
  {
    v9 = *(&off_1002874F8 + mrab);
  }
  [v3 setObject:v9 forKey:@"mrab"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithUnsignedInt:self->_numCalls];
  [v3 setObject:v5 forKey:@"num_calls"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007D274((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_releaseCause;
    *((unsigned char *)v4 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_mrab;
  *((unsigned char *)v4 + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_numCalls;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_releaseCause;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 2) = self->_mrab;
  *((unsigned char *)result + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_numCalls;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_releaseCause != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_mrab != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_numCalls != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_releaseCause;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_mrab;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_numCalls;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_releaseCause = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t mrab = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_numCalls = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (int)releaseCause
{
  return self->_releaseCause;
}

- (unsigned)numCalls
{
  return self->_numCalls;
}

@end