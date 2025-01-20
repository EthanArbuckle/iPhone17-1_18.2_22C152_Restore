@interface TxHist
- (BOOL)hasChanType;
- (BOOL)hasMinTxLevel;
- (BOOL)hasWorkMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)chanTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChanType:(id)a3;
- (int)chanType;
- (int)minTxLevel;
- (unint64_t)hash;
- (unint64_t)numTxLevelsCount;
- (unsigned)numTxLevelAtIndex:(unint64_t)a3;
- (unsigned)numTxLevels;
- (unsigned)workMode;
- (void)addNumTxLevel:(unsigned int)a3;
- (void)clearNumTxLevels;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChanType:(int)a3;
- (void)setHasChanType:(BOOL)a3;
- (void)setHasMinTxLevel:(BOOL)a3;
- (void)setHasWorkMode:(BOOL)a3;
- (void)setMinTxLevel:(int)a3;
- (void)setNumTxLevels:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWorkMode:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TxHist

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)TxHist;
  [(TxHist *)&v3 dealloc];
}

- (int)chanType
{
  if (*(unsigned char *)&self->_has) {
    return self->_chanType;
  }
  else {
    return 0;
  }
}

- (void)setChanType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_chanType = a3;
}

- (void)setHasChanType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChanType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)chanTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"PUSCH";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"PUCCH";
  }
  return v4;
}

- (int)StringAsChanType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PUCCH"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"PUSCH"];
  }

  return v4;
}

- (void)setWorkMode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_workMode = a3;
}

- (void)setHasWorkMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWorkMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinTxLevel:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minTxLevel = a3;
}

- (void)setHasMinTxLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinTxLevel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)numTxLevelsCount
{
  return self->_numTxLevels.count;
}

- (unsigned)numTxLevels
{
  return self->_numTxLevels.list;
}

- (void)clearNumTxLevels
{
}

- (void)addNumTxLevel:(unsigned int)a3
{
}

- (unsigned)numTxLevelAtIndex:(unint64_t)a3
{
  p_numTxLevels = &self->_numTxLevels;
  unint64_t count = self->_numTxLevels.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_numTxLevels->list[a3];
}

- (void)setNumTxLevels:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TxHist;
  char v3 = [(TxHist *)&v7 description];
  int v4 = [(TxHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    int chanType = self->_chanType;
    if (chanType)
    {
      if (chanType == 1)
      {
        v6 = @"PUSCH";
      }
      else
      {
        v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_chanType];
      }
    }
    else
    {
      v6 = @"PUCCH";
    }
    [v3 setObject:v6 forKey:@"chan_type"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_workMode];
    [v3 setObject:v7 forKey:@"work_mode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithInt:self->_minTxLevel];
    [v3 setObject:v8 forKey:@"min_tx_level"];
  }
  v9 = PBRepeatedUInt32NSArray();
  [v3 setObject:v9 forKey:@"num_tx_level"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000241B4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteSint32Field();
LABEL_5:
  p_numTxLevels = &self->_numTxLevels;
  if (p_numTxLevels->count)
  {
    PBDataWriterPlaceMark();
    if (p_numTxLevels->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < p_numTxLevels->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    v4[10] = self->_workMode;
    *((unsigned char *)v4 + 44) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v4[8] = self->_chanType;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[9] = self->_minTxLevel;
    *((unsigned char *)v4 + 44) |= 2u;
  }
LABEL_5:
  id v9 = v4;
  if ([(TxHist *)self numTxLevelsCount])
  {
    [v9 clearNumTxLevels];
    unint64_t v6 = [(TxHist *)self numTxLevelsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addNumTxLevel:[self numTxLevelAtIndex:i]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v4 + 10) = self->_workMode;
    *((unsigned char *)v4 + 44) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 8) = self->_chanType;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 9) = self->_minTxLevel;
    *((unsigned char *)v4 + 44) |= 2u;
  }
LABEL_5:
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_chanType != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_18:
    char IsEqual = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_workMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_minTxLevel != *((_DWORD *)v4 + 9)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  char IsEqual = PBRepeatedUInt32IsEqual();
LABEL_19:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ PBRepeatedUInt32Hash();
  }
  uint64_t v2 = 2654435761 * self->_chanType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_workMode;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_minTxLevel;
  return v3 ^ v2 ^ v4 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_int chanType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_workMode = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_4:
    self->_minTxLevel = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v9 = v4;
  unint64_t v6 = (char *)[v4 numTxLevelsCount];
  if (v6)
  {
    unint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[TxHist addNumTxLevel:](self, "addNumTxLevel:", [v9 numTxLevelAtIndex:i]);
  }
}

- (unsigned)workMode
{
  return self->_workMode;
}

- (int)minTxLevel
{
  return self->_minTxLevel;
}

@end