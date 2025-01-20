@interface KCellularLteTxPower
+ (Class)txPowerInfoType;
- (BOOL)hasLastPcellDlBand;
- (BOOL)hasLastPcellDlBw;
- (BOOL)hasLastScellUlBand;
- (BOOL)hasLastScellUlBw;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasVolteCallId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)txPowerInfos;
- (NSString)volteCallId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lastPcellDlBwAsString:(int)a3;
- (id)lastScellUlBwAsString:(int)a3;
- (id)txPowerInfoAtIndex:(unint64_t)a3;
- (int)StringAsLastPcellDlBw:(id)a3;
- (int)StringAsLastScellUlBw:(id)a3;
- (int)lastPcellDlBw;
- (int)lastScellUlBw;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)txPowerInfosCount;
- (unsigned)lastPcellDlBand;
- (unsigned)lastScellUlBand;
- (unsigned)subsId;
- (void)addTxPowerInfo:(id)a3;
- (void)clearTxPowerInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLastPcellDlBand:(BOOL)a3;
- (void)setHasLastPcellDlBw:(BOOL)a3;
- (void)setHasLastScellUlBand:(BOOL)a3;
- (void)setHasLastScellUlBw:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLastPcellDlBand:(unsigned int)a3;
- (void)setLastPcellDlBw:(int)a3;
- (void)setLastScellUlBand:(unsigned int)a3;
- (void)setLastScellUlBw:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxPowerInfos:(id)a3;
- (void)setVolteCallId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteTxPower

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

- (void)clearTxPowerInfos
{
}

- (void)addTxPowerInfo:(id)a3
{
  id v4 = a3;
  txPowerInfos = self->_txPowerInfos;
  id v8 = v4;
  if (!txPowerInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_txPowerInfos;
    self->_txPowerInfos = v6;

    id v4 = v8;
    txPowerInfos = self->_txPowerInfos;
  }
  [(NSMutableArray *)txPowerInfos addObject:v4];
}

- (unint64_t)txPowerInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_txPowerInfos count];
}

- (id)txPowerInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_txPowerInfos objectAtIndex:a3];
}

+ (Class)txPowerInfoType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasVolteCallId
{
  return self->_volteCallId != 0;
}

- (void)setLastPcellDlBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastPcellDlBand = a3;
}

- (void)setHasLastPcellDlBand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastPcellDlBand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)lastPcellDlBw
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_lastPcellDlBw;
  }
  else {
    return 0;
  }
}

- (void)setLastPcellDlBw:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_lastPcellDlBw = a3;
}

- (void)setHasLastPcellDlBw:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastPcellDlBw
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)lastPcellDlBwAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287358 + a3);
  }

  return v3;
}

- (int)StringAsLastPcellDlBw:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"N6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"N15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"N25"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"N50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"N75"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"N100"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLastScellUlBand:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_lastScellUlBand = a3;
}

- (void)setHasLastScellUlBand:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastScellUlBand
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)lastScellUlBw
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_lastScellUlBw;
  }
  else {
    return 0;
  }
}

- (void)setLastScellUlBw:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_lastScellUlBw = a3;
}

- (void)setHasLastScellUlBw:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLastScellUlBw
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)lastScellUlBwAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287358 + a3);
  }

  return v3;
}

- (int)StringAsLastScellUlBw:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"N6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"N15"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"N25"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"N50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"N75"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"N100"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularLteTxPower;
  char v3 = [(KCellularLteTxPower *)&v7 description];
  int v4 = [(KCellularLteTxPower *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_txPowerInfos count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_txPowerInfos, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v6 = self->_txPowerInfos;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"tx_power_info"];
  }
  volteCallId = self->_volteCallId;
  if (volteCallId) {
    [v3 setObject:volteCallId forKey:@"volte_call_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_lastPcellDlBand];
    [v3 setObject:v16 forKey:@"last_pcell_dl_band"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  uint64_t lastPcellDlBw = self->_lastPcellDlBw;
  if (lastPcellDlBw >= 6)
  {
    v18 = +[NSString stringWithFormat:@"(unknown: %i)", self->_lastPcellDlBw];
  }
  else
  {
    v18 = *(&off_100287358 + lastPcellDlBw);
  }
  [v3 setObject:v18 forKey:@"last_pcell_dl_bw"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  v19 = +[NSNumber numberWithUnsignedInt:self->_lastScellUlBand];
  [v3 setObject:v19 forKey:@"last_scell_ul_band"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_29:
  uint64_t lastScellUlBw = self->_lastScellUlBw;
  if (lastScellUlBw >= 6)
  {
    v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_lastScellUlBw];
  }
  else
  {
    v21 = *(&off_100287358 + lastScellUlBw);
  }
  [v3 setObject:v21 forKey:@"last_scell_ul_bw"];

  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_19:
  v14 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v14 forKey:@"subs_id"];

LABEL_20:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006298C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_txPowerInfos;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_volteCallId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
LABEL_22:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_16:
  if ((has & 0x20) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v10 = v4;
  if ([(KCellularLteTxPower *)self txPowerInfosCount])
  {
    [v10 clearTxPowerInfos];
    unint64_t v5 = [(KCellularLteTxPower *)self txPowerInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(KCellularLteTxPower *)self txPowerInfoAtIndex:i];
        [v10 addTxPowerInfo:v8];
      }
    }
  }
  if (self->_volteCallId) {
    [v10 setVolteCallId:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 4) = self->_lastPcellDlBand;
    *((unsigned char *)v10 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v10 + 6) = self->_lastScellUlBand;
  *((unsigned char *)v10 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v10 + 5) = self->_lastPcellDlBw;
  *((unsigned char *)v10 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  *((_DWORD *)v10 + 7) = self->_lastScellUlBw;
  *((unsigned char *)v10 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *((_DWORD *)v10 + 8) = self->_subsId;
    *((unsigned char *)v10 + 56) |= 0x20u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_txPowerInfos;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) copyWithZone:a3];
        [v6 addTxPowerInfo:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v13 = [(NSString *)self->_volteCallId copyWithZone:a3];
  long long v14 = (void *)*((void *)v6 + 6);
  *((void *)v6 + 6) = v13;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_lastPcellDlBand;
    *((unsigned char *)v6 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v6 + 6) = self->_lastScellUlBand;
  *((unsigned char *)v6 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
LABEL_20:
    *((_DWORD *)v6 + 7) = self->_lastScellUlBw;
    *((unsigned char *)v6 + 56) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v6;
    }
    goto LABEL_15;
  }
LABEL_19:
  *((_DWORD *)v6 + 5) = self->_lastPcellDlBw;
  *((unsigned char *)v6 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_14:
  if ((has & 0x20) != 0)
  {
LABEL_15:
    *((_DWORD *)v6 + 8) = self->_subsId;
    *((unsigned char *)v6 + 56) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_35:
    BOOL v7 = 0;
    goto LABEL_36;
  }
  txPowerInfos = self->_txPowerInfos;
  if ((unint64_t)txPowerInfos | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](txPowerInfos, "isEqual:"))
  {
    goto LABEL_35;
  }
  volteCallId = self->_volteCallId;
  if ((unint64_t)volteCallId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](volteCallId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_lastPcellDlBand != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_lastScellUlBand != *((_DWORD *)v4 + 6)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_lastPcellDlBw != *((_DWORD *)v4 + 5)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_lastScellUlBw != *((_DWORD *)v4 + 7)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
    BOOL v7 = 1;
  }
LABEL_36:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_txPowerInfos hash];
  NSUInteger v5 = [(NSString *)self->_volteCallId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_lastPcellDlBand;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v7 = 2654435761 * self->_lastScellUlBand;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_lastPcellDlBw;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_12:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_lastScellUlBw;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 56))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[KCellularLteTxPower addTxPowerInfo:](self, "addTxPowerInfo:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (*((void *)v5 + 6)) {
    -[KCellularLteTxPower setVolteCallId:](self, "setVolteCallId:");
  }
  char v11 = *((unsigned char *)v5 + 56);
  if ((v11 & 2) != 0)
  {
    self->_lastPcellDlBand = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v11 = *((unsigned char *)v5 + 56);
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v5 + 56) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_lastScellUlBand = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v11 = *((unsigned char *)v5 + 56);
  if ((v11 & 4) == 0)
  {
LABEL_15:
    if ((v11 & 0x10) == 0) {
      goto LABEL_16;
    }
LABEL_22:
    self->_uint64_t lastScellUlBw = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
    if ((*((unsigned char *)v5 + 56) & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_21:
  self->_uint64_t lastPcellDlBw = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v11 = *((unsigned char *)v5 + 56);
  if ((v11 & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_16:
  if ((v11 & 0x20) != 0)
  {
LABEL_17:
    self->_subsId = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_18:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)txPowerInfos
{
  return self->_txPowerInfos;
}

- (void)setTxPowerInfos:(id)a3
{
}

- (NSString)volteCallId
{
  return self->_volteCallId;
}

- (void)setVolteCallId:(id)a3
{
}

- (unsigned)lastPcellDlBand
{
  return self->_lastPcellDlBand;
}

- (unsigned)lastScellUlBand
{
  return self->_lastScellUlBand;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volteCallId, 0);

  objc_storeStrong((id *)&self->_txPowerInfos, 0);
}

@end