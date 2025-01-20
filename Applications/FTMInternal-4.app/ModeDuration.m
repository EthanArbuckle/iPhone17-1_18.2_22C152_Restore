@interface ModeDuration
- (BOOL)hasDurationMs;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (unsigned)durationMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModeDuration

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mode;
  }
  else {
    return -1;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)modeAsString:(int)a3
{
  if ((a3 + 1) >= 0xD)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_100288580[a3 + 1];
  }

  return v3;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SYS_OPRT_MODE_NONE"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_PWROFF"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_FTM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_AMPS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_CDMA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_ONLINE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_LPM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_RESET"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_NET_TEST_GW"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_OFFLINE_IF_NOT_FTM"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_PSEUDO_ONLINE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SYS_OPRT_MODE_RESET_MODEM"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModeDuration;
  id v3 = [(ModeDuration *)&v7 description];
  int v4 = [(ModeDuration *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = self->_mode + 1;
    if (v5 >= 0xD)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_mode];
    }
    else
    {
      v6 = off_100288580[v5];
    }
    [v3 setObject:v6 forKey:@"mode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_durationMs];
    [v3 setObject:v7 forKey:@"duration_ms"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10013881C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_mode;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_durationMs;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_mode;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_durationMs;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_durationMs != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_mode;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_durationMs;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_mode = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_durationMs = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

@end