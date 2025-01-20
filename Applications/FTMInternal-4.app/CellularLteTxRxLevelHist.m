@interface CellularLteTxRxLevelHist
+ (Class)rxHistType;
+ (Class)txHistType;
- (BOOL)hasDuration;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)rxHists;
- (NSMutableArray)txHists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rxHistAtIndex:(unint64_t)a3;
- (id)txHistAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rxHistsCount;
- (unint64_t)timestamp;
- (unint64_t)txHistsCount;
- (unsigned)duration;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addRxHist:(id)a3;
- (void)addTxHist:(id)a3;
- (void)clearRxHists;
- (void)clearTxHists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setRxHists:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxHists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteTxRxLevelHist

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

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearTxHists
{
}

- (void)addTxHist:(id)a3
{
  id v4 = a3;
  txHists = self->_txHists;
  id v8 = v4;
  if (!txHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_txHists;
    self->_txHists = v6;

    id v4 = v8;
    txHists = self->_txHists;
  }
  [(NSMutableArray *)txHists addObject:v4];
}

- (unint64_t)txHistsCount
{
  return (unint64_t)[(NSMutableArray *)self->_txHists count];
}

- (id)txHistAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_txHists objectAtIndex:a3];
}

+ (Class)txHistType
{
  return (Class)objc_opt_class();
}

- (void)clearRxHists
{
}

- (void)addRxHist:(id)a3
{
  id v4 = a3;
  rxHists = self->_rxHists;
  id v8 = v4;
  if (!rxHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rxHists;
    self->_rxHists = v6;

    id v4 = v8;
    rxHists = self->_rxHists;
  }
  [(NSMutableArray *)rxHists addObject:v4];
}

- (unint64_t)rxHistsCount
{
  return (unint64_t)[(NSMutableArray *)self->_rxHists count];
}

- (id)rxHistAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_rxHists objectAtIndex:a3];
}

+ (Class)rxHistType
{
  return (Class)objc_opt_class();
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteTxRxLevelHist;
  char v3 = [(CellularLteTxRxLevelHist *)&v7 description];
  id v4 = [(CellularLteTxRxLevelHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_duration];
    [v3 setObject:v6 forKey:@"duration"];
  }
  if ([(NSMutableArray *)self->_txHists count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_txHists, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = self->_txHists;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"tx_hist"];
  }
  if ([(NSMutableArray *)self->_rxHists count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_rxHists, "count")];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v15 = self->_rxHists;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"rx_hist"];
  }
  char v21 = (char)self->_has;
  if ((v21 & 4) != 0)
  {
    v22 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v22 forKey:@"num_subs"];

    char v21 = (char)self->_has;
  }
  if ((v21 & 8) != 0)
  {
    v23 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v23 forKey:@"ps_pref"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v25 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v25 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100131318((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_txHists;
  id v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_rxHists;
  v12 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      v13 = (char *)[(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if ((v16 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_duration;
    *((unsigned char *)v4 + 64) |= 2u;
  }
  id v16 = v4;
  if ([(CellularLteTxRxLevelHist *)self txHistsCount])
  {
    [v16 clearTxHists];
    unint64_t v6 = [(CellularLteTxRxLevelHist *)self txHistsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteTxRxLevelHist *)self txHistAtIndex:i];
        [v16 addTxHist:v9];
      }
    }
  }
  if ([(CellularLteTxRxLevelHist *)self rxHistsCount])
  {
    [v16 clearRxHists];
    unint64_t v10 = [(CellularLteTxRxLevelHist *)self rxHistsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        v13 = [(CellularLteTxRxLevelHist *)self rxHistAtIndex:j];
        [v16 addRxHist:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  v15 = v16;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v16 + 5) = self->_numSubs;
    *((unsigned char *)v16 + 64) |= 4u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *((_DWORD *)v16 + 8) = self->_psPref;
    *((unsigned char *)v16 + 64) |= 8u;
  }
  if (self->_plmn)
  {
    [v16 setPlmn:];
    v15 = v16;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v15[12] = self->_subsId;
    *((unsigned char *)v15 + 64) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_duration;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = self->_txHists;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
        [v6 addTxHist:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v14 = self->_rxHists;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addRxHist:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  char v20 = (char)self->_has;
  if ((v20 & 4) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_numSubs;
    *((unsigned char *)v6 + 64) |= 4u;
    char v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((unsigned char *)v6 + 64) |= 8u;
  }
  id v21 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v24);
  long long v22 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v21;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((unsigned char *)v6 + 64) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 4)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_33;
  }
  txHists = self->_txHists;
  if ((unint64_t)txHists | *((void *)v4 + 7) && !-[NSMutableArray isEqual:](txHists, "isEqual:")) {
    goto LABEL_33;
  }
  rxHists = self->_rxHists;
  if ((unint64_t)rxHists | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](rxHists, "isEqual:")) {
      goto LABEL_33;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_33;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_33:
      BOOL v9 = 0;
      goto LABEL_34;
    }
    char has = (char)self->_has;
  }
  BOOL v9 = (*((unsigned char *)v4 + 64) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_subsId != *((_DWORD *)v4 + 12)) {
      goto LABEL_33;
    }
    BOOL v9 = 1;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_duration;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_txHists hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_rxHists hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v7 = 2654435761 * self->_numSubs;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v8 = 2654435761 * self->_psPref;
      goto LABEL_11;
    }
  }
  uint64_t v8 = 0;
LABEL_11:
  unint64_t v9 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v10 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 64);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((v6 & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 7);
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CellularLteTxRxLevelHist *)self addTxHist:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v5 + 5);
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[CellularLteTxRxLevelHist addRxHist:](self, "addRxHist:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = *((unsigned char *)v5 + 64);
  if ((v17 & 4) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v17 = *((unsigned char *)v5 + 64);
  }
  if ((v17 & 8) != 0)
  {
    self->_psPref = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v5 + 3)) {
    -[CellularLteTxRxLevelHist setPlmn:](self, "setPlmn:");
  }
  if ((*((unsigned char *)v5 + 64) & 0x10) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSMutableArray)txHists
{
  return self->_txHists;
}

- (void)setTxHists:(id)a3
{
}

- (NSMutableArray)rxHists
{
  return self->_rxHists;
}

- (void)setRxHists:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txHists, 0);
  objc_storeStrong((id *)&self->_rxHists, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end