@interface SrvStatDuration
- (BOOL)hasDurationMs;
- (BOOL)hasRat;
- (BOOL)hasStat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ratAsString:(int)a3;
- (id)statAsString:(int)a3;
- (int)StringAsRat:(id)a3;
- (int)StringAsStat:(id)a3;
- (int)rat;
- (int)stat;
- (unint64_t)hash;
- (unsigned)durationMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasStat:(BOOL)a3;
- (void)setRat:(int)a3;
- (void)setStat:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SrvStatDuration

- (int)rat
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)ratAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287400 + a3);
  }

  return v3;
}

- (int)StringAsRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AWD_SS_RAT_NO_SERVICE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_CDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_GSM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_WCDMA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_LTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_HDR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_LTE_V2"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_UMTS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_EHRPD"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AWD_SS_RAT_MAX"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)stat
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_stat;
  }
  else {
    return 0;
  }
}

- (void)setStat:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_stat = a3;
}

- (void)setHasStat:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStat
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)statAsString:(int)a3
{
  if (a3 >= 9)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287450 + a3);
  }

  return v3;
}

- (int)StringAsStat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AWD_SS_STAT_NO_SERVICE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_LIMITED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_CAMPED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_LIMITED_REGIONAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_PWR_SAVE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_CS_ONLY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_PS_ONLY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_CS_PS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AWD_SS_STAT_MAX"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
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
  v7.super_class = (Class)SrvStatDuration;
  id v3 = [(SrvStatDuration *)&v7 description];
  int v4 = [(SrvStatDuration *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t rat = self->_rat;
    if (rat >= 0xA)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_rat];
    }
    else
    {
      v8 = *(&off_100287400 + rat);
    }
    [v3 setObject:v8 forKey:@"rat"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t stat = self->_stat;
  if (stat >= 9)
  {
    v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_stat];
  }
  else
  {
    v10 = *(&off_100287450 + stat);
  }
  [v3 setObject:v10 forKey:@"stat"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v5 forKey:@"duration_ms"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100067C0C((uint64_t)self, (uint64_t)a3);
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
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
  if ((has & 2) != 0)
  {
    v4[3] = self->_rat;
    *((unsigned char *)v4 + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_stat;
  *((unsigned char *)v4 + 20) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[2] = self->_durationMs;
    *((unsigned char *)v4 + 20) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_rat;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_stat;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_durationMs;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_rat != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_stat != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_durationMs != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_rat;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_stat;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_durationMs;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t rat = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t stat = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 20))
  {
LABEL_4:
    self->_durationMs = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

@end