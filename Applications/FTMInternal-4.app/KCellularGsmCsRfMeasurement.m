@interface KCellularGsmCsRfMeasurement
- (BOOL)hasCsRxlevSub;
- (BOOL)hasCsRxqualSub;
- (BOOL)hasCurrentAntenna;
- (BOOL)hasScellArfcn;
- (BOOL)hasScellBand;
- (BOOL)hasSimplifiedL1State;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)csTxPwrAtIndex:(unint64_t)a3;
- (int)csTxPwrs;
- (unint64_t)csTxPwrsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)csRxlevSub;
- (unsigned)csRxqualSub;
- (unsigned)currentAntenna;
- (unsigned)scellArfcn;
- (unsigned)scellBand;
- (unsigned)simplifiedL1State;
- (unsigned)subsId;
- (void)addCsTxPwr:(int)a3;
- (void)clearCsTxPwrs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCsRxlevSub:(unsigned int)a3;
- (void)setCsRxqualSub:(unsigned int)a3;
- (void)setCsTxPwrs:(int *)a3 count:(unint64_t)a4;
- (void)setCurrentAntenna:(unsigned int)a3;
- (void)setHasCsRxlevSub:(BOOL)a3;
- (void)setHasCsRxqualSub:(BOOL)a3;
- (void)setHasCurrentAntenna:(BOOL)a3;
- (void)setHasScellArfcn:(BOOL)a3;
- (void)setHasScellBand:(BOOL)a3;
- (void)setHasSimplifiedL1State:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setScellArfcn:(unsigned int)a3;
- (void)setScellBand:(unsigned int)a3;
- (void)setSimplifiedL1State:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularGsmCsRfMeasurement

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)KCellularGsmCsRfMeasurement;
  [(KCellularGsmCsRfMeasurement *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScellArfcn:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_scellArfcn = a3;
}

- (void)setHasScellArfcn:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasScellArfcn
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSimplifiedL1State:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_simplifiedL1State = a3;
}

- (void)setHasSimplifiedL1State:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSimplifiedL1State
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCurrentAntenna:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_currentAntenna = a3;
}

- (void)setHasCurrentAntenna:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCurrentAntenna
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (unint64_t)csTxPwrsCount
{
  return self->_csTxPwrs.count;
}

- (int)csTxPwrs
{
  return self->_csTxPwrs.list;
}

- (void)clearCsTxPwrs
{
}

- (void)addCsTxPwr:(int)a3
{
}

- (int)csTxPwrAtIndex:(unint64_t)a3
{
  p_csTxPwrs = &self->_csTxPwrs;
  unint64_t count = self->_csTxPwrs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_csTxPwrs->list[a3];
}

- (void)setCsTxPwrs:(int *)a3 count:(unint64_t)a4
{
}

- (void)setCsRxlevSub:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_csRxlevSub = a3;
}

- (void)setHasCsRxlevSub:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCsRxlevSub
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCsRxqualSub:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_csRxqualSub = a3;
}

- (void)setHasCsRxqualSub:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCsRxqualSub
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setScellBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_scellBand = a3;
}

- (void)setHasScellBand:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScellBand
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSubsId
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularGsmCsRfMeasurement;
  char v3 = [(KCellularGsmCsRfMeasurement *)&v7 description];
  v4 = [(KCellularGsmCsRfMeasurement *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_scellArfcn];
  [v3 setObject:v10 forKey:@"scell_arfcn"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v11 = +[NSNumber numberWithUnsignedInt:self->_simplifiedL1State];
  [v3 setObject:v11 forKey:@"simplified_l1_state"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithUnsignedInt:self->_currentAntenna];
    [v3 setObject:v5 forKey:@"current_antenna"];
  }
LABEL_6:
  v6 = PBRepeatedInt32NSArray();
  [v3 setObject:v6 forKey:@"cs_tx_pwr"];

  char v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedInt:self->_csRxlevSub];
    [v3 setObject:v12 forKey:@"cs_rxlev_sub"];

    char v7 = (char)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x20) == 0) {
        goto LABEL_9;
      }
LABEL_19:
      v14 = +[NSNumber numberWithUnsignedInt:self->_scellBand];
      [v3 setObject:v14 forKey:@"scell_band"];

      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  v13 = +[NSNumber numberWithUnsignedInt:self->_csRxqualSub];
  [v3 setObject:v13 forKey:@"cs_rxqual_sub"];

  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if ((v7 & 0x80) == 0) {
    goto LABEL_10;
  }
LABEL_20:
  v15 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v15 forKey:@"subs_id"];

LABEL_10:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000133D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_csTxPwrs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_csTxPwrs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v6;
      }
      while (v6 < self->_csTxPwrs.count);
    }
    PBDataWriterRecallMark();
  }
  char v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v7 = (char)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 0x20) == 0) {
        goto LABEL_14;
      }
LABEL_22:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_15;
      }
LABEL_23:
      PBDataWriterWriteUint32Field();
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if (v7 < 0) {
    goto LABEL_23;
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_timestamp;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
LABEL_19:
      *((_DWORD *)v4 + 15) = self->_simplifiedL1State;
      *((unsigned char *)v4 + 68) |= 0x40u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_scellArfcn;
  *((unsigned char *)v4 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_19;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 12) = self->_currentAntenna;
    *((unsigned char *)v4 + 68) |= 8u;
  }
LABEL_6:
  id v10 = v4;
  if ([(KCellularGsmCsRfMeasurement *)self csTxPwrsCount])
  {
    [v10 clearCsTxPwrs];
    unint64_t v6 = [(KCellularGsmCsRfMeasurement *)self csTxPwrsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v10 addCsTxPwr:[self csTxPwrAtIndex:i]];
    }
  }
  char v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v10 + 10) = self->_csRxlevSub;
    *((unsigned char *)v10 + 68) |= 2u;
    char v9 = (char)self->_has;
    if ((v9 & 4) == 0)
    {
LABEL_12:
      if ((v9 & 0x20) == 0) {
        goto LABEL_13;
      }
LABEL_23:
      *((_DWORD *)v10 + 14) = self->_scellBand;
      *((unsigned char *)v10 + 68) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v10 + 11) = self->_csRxqualSub;
  *((unsigned char *)v10 + 68) |= 4u;
  char v9 = (char)self->_has;
  if ((v9 & 0x20) != 0) {
    goto LABEL_23;
  }
LABEL_13:
  if ((v9 & 0x80) == 0) {
    goto LABEL_14;
  }
LABEL_24:
  *((_DWORD *)v10 + 16) = self->_subsId;
  *((unsigned char *)v10 + 68) |= 0x80u;
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = v4;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_timestamp;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_scellArfcn;
  *((unsigned char *)v4 + 68) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v4 + 15) = self->_simplifiedL1State;
  *((unsigned char *)v4 + 68) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 12) = self->_currentAntenna;
    *((unsigned char *)v4 + 68) |= 8u;
  }
LABEL_6:
  PBRepeatedInt32Copy();
  char v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    v5[10] = self->_csRxlevSub;
    *((unsigned char *)v5 + 68) |= 2u;
    char v7 = (char)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_8:
      if ((v7 & 0x20) == 0) {
        goto LABEL_9;
      }
LABEL_17:
      v5[14] = self->_scellBand;
      *((unsigned char *)v5 + 68) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        return v5;
      }
LABEL_18:
      v5[16] = self->_subsId;
      *((unsigned char *)v5 + 68) |= 0x80u;
      return v5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  v5[11] = self->_csRxqualSub;
  *((unsigned char *)v5 + 68) |= 4u;
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if (v7 < 0) {
    goto LABEL_18;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[68] & 1) == 0 || self->_timestamp != *((void *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if (v4[68])
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[68] & 0x10) == 0 || self->_scellArfcn != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[68] & 0x40) == 0 || self->_simplifiedL1State != *((_DWORD *)v4 + 15)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[68] & 8) == 0 || self->_currentAntenna != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 8) != 0)
  {
    goto LABEL_42;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_42:
    BOOL v5 = 0;
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[68] & 2) == 0 || self->_csRxlevSub != *((_DWORD *)v4 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[68] & 4) == 0 || self->_csRxqualSub != *((_DWORD *)v4 + 11)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[68] & 0x20) == 0 || self->_scellBand != *((_DWORD *)v4 + 14)) {
      goto LABEL_42;
    }
  }
  else if ((v4[68] & 0x20) != 0)
  {
    goto LABEL_42;
  }
  BOOL v5 = v4[68] >= 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v4[68] & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_42;
    }
    BOOL v5 = 1;
  }
LABEL_43:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_scellArfcn;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_simplifiedL1State;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_currentAntenna;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_csRxlevSub;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_12:
      uint64_t v9 = 2654435761 * self->_csRxqualSub;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v10 = 0;
      if ((*(unsigned char *)&self->_has & 0x80) != 0) {
        goto LABEL_14;
      }
LABEL_18:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_scellBand;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v11 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 68);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_scellArfcn = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  self->_simplifiedL1State = *((_DWORD *)v4 + 15);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
LABEL_5:
    self->_currentAntenna = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  uint64_t v10 = (unsigned int *)v4;
  uint64_t v6 = (char *)[v4 csTxPwrsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[KCellularGsmCsRfMeasurement addCsTxPwr:](self, "addCsTxPwr:", [v10 csTxPwrAtIndex:i]);
  }
  char v9 = *((unsigned char *)v10 + 68);
  if ((v9 & 2) != 0)
  {
    self->_csRxlevSub = v10[10];
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v10 + 68);
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x20) == 0) {
        goto LABEL_12;
      }
LABEL_22:
      self->_scellBand = v10[14];
      *(unsigned char *)&self->_has |= 0x20u;
      if ((v10[17] & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_23;
    }
  }
  else if ((v10[17] & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_csRxqualSub = v10[11];
  *(unsigned char *)&self->_has |= 4u;
  char v9 = *((unsigned char *)v10 + 68);
  if ((v9 & 0x20) != 0) {
    goto LABEL_22;
  }
LABEL_12:
  if ((v9 & 0x80) == 0) {
    goto LABEL_13;
  }
LABEL_23:
  self->_subsId = v10[16];
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_13:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)scellArfcn
{
  return self->_scellArfcn;
}

- (unsigned)simplifiedL1State
{
  return self->_simplifiedL1State;
}

- (unsigned)currentAntenna
{
  return self->_currentAntenna;
}

- (unsigned)csRxlevSub
{
  return self->_csRxlevSub;
}

- (unsigned)csRxqualSub
{
  return self->_csRxqualSub;
}

- (unsigned)scellBand
{
  return self->_scellBand;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end