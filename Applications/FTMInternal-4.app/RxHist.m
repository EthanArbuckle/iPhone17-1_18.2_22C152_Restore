@interface RxHist
- (BOOL)hasAgcMode;
- (BOOL)hasAntenna;
- (BOOL)hasMinRxLevel;
- (BOOL)hasWorkMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)agcModeAsString:(int)a3;
- (id)antennaAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAgcMode:(id)a3;
- (int)StringAsAntenna:(id)a3;
- (int)agcMode;
- (int)antenna;
- (int)minRxLevel;
- (unint64_t)hash;
- (unint64_t)numRxLevelsCount;
- (unsigned)numRxLevelAtIndex:(unint64_t)a3;
- (unsigned)numRxLevels;
- (unsigned)workMode;
- (void)addNumRxLevel:(unsigned int)a3;
- (void)clearNumRxLevels;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAgcMode:(int)a3;
- (void)setAntenna:(int)a3;
- (void)setHasAgcMode:(BOOL)a3;
- (void)setHasAntenna:(BOOL)a3;
- (void)setHasMinRxLevel:(BOOL)a3;
- (void)setHasWorkMode:(BOOL)a3;
- (void)setMinRxLevel:(int)a3;
- (void)setNumRxLevels:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWorkMode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RxHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)RxHist;
  [(RxHist *)&v3 dealloc];
}

- (int)agcMode
{
  if (*(unsigned char *)&self->_has) {
    return self->_agcMode;
  }
  else {
    return 0;
  }
}

- (void)setAgcMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_agcMode = a3;
}

- (void)setHasAgcMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgcMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)agcModeAsString:(int)a3
{
  if a3 < 0x10 && ((0x807Fu >> a3))
  {
    objc_super v3 = *(&off_100287990 + a3);
  }
  else
  {
    objc_super v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsAgcMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FREQ_SCAN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INIT_ACQ"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRAFFIC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PBCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTER_FREQ"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ONLINE_DRX"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OFFLINE_DRX"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OFF"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)antenna
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_antenna;
  }
  else {
    return 0;
  }
}

- (void)setAntenna:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_antenna = a3;
}

- (void)setHasAntenna:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAntenna
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)antennaAsString:(int)a3
{
  if (a3 >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287A10 + a3);
  }

  return v3;
}

- (int)StringAsAntenna:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RX_0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RX_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RX_BOTH"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setWorkMode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_workMode = a3;
}

- (void)setHasWorkMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWorkMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMinRxLevel:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_minRxLevel = a3;
}

- (void)setHasMinRxLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinRxLevel
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)numRxLevelsCount
{
  return self->_numRxLevels.count;
}

- (unsigned)numRxLevels
{
  return self->_numRxLevels.list;
}

- (void)clearNumRxLevels
{
}

- (void)addNumRxLevel:(unsigned int)a3
{
}

- (unsigned)numRxLevelAtIndex:(unint64_t)a3
{
  p_numRxLevels = &self->_numRxLevels;
  unint64_t count = self->_numRxLevels.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_numRxLevels->list[a3];
}

- (void)setNumRxLevels:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RxHist;
  char v3 = [(RxHist *)&v7 description];
  int v4 = [(RxHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t agcMode = self->_agcMode;
    if agcMode < 0x10 && ((0x807Fu >> agcMode))
    {
      v6 = *(&off_100287990 + agcMode);
    }
    else
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_agcMode];
    }
    [v3 setObject:v6 forKey:@"agc_mode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t antenna = self->_antenna;
    if (antenna >= 3)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_antenna];
    }
    else
    {
      v8 = *(&off_100287A10 + antenna);
    }
    [v3 setObject:v8 forKey:@"antenna"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_workMode];
    [v3 setObject:v9 forKey:@"work_mode"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v10 = +[NSNumber numberWithInt:self->_minRxLevel];
    [v3 setObject:v10 forKey:@"min_rx_level"];
  }
  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"num_rx_level"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000C2D00((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteSint32Field();
LABEL_6:
  p_numRxLevels = &self->_numRxLevels;
  if (p_numRxLevels->count)
  {
    PBDataWriterPlaceMark();
    if (p_numRxLevels->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_numRxLevels->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_agcMode;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_15:
      v4[11] = self->_workMode;
      *((unsigned char *)v4 + 48) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_antenna;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    v4[10] = self->_minRxLevel;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_6:
  id v9 = v4;
  if ([(RxHist *)self numRxLevelsCount])
  {
    [v9 clearNumRxLevels];
    unint64_t v6 = [(RxHist *)self numRxLevelsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addNumRxLevel:[self numRxLevelAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = self->_agcMode;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v4 + 11) = self->_workMode;
      *((unsigned char *)v4 + 48) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_antenna;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 10) = self->_minRxLevel;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_6:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_agcMode != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_23:
    char IsEqual = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_antenna != *((_DWORD *)v4 + 9)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_workMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_minRxLevel != *((_DWORD *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_23;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_24:

  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_agcMode;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_antenna;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash();
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_workMode;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_minRxLevel;
  return v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_uint64_t agcMode = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t antenna = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  self->_workMode = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_5:
    self->_minRxLevel = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  id v9 = v4;
  unint64_t v6 = (char *)[v4 numRxLevelsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[RxHist addNumRxLevel:](self, "addNumRxLevel:", [v9 numRxLevelAtIndex:i]);
  }
}

- (unsigned)workMode
{
  return self->_workMode;
}

- (int)minRxLevel
{
  return self->_minRxLevel;
}

@end