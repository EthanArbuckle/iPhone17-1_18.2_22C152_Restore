@interface CellularLteRrcStateHist
+ (Class)stateHistType;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalDurationMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)stateHists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateHistAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stateHistsCount;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (unsigned)totalDurationMs;
- (void)addStateHist:(id)a3;
- (void)clearStateHists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalDurationMs:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setStateHists:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalDurationMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteRrcStateHist

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

- (void)setTotalDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalDurationMs = a3;
}

- (void)setHasTotalDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalDurationMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearStateHists
{
}

- (void)addStateHist:(id)a3
{
  id v4 = a3;
  stateHists = self->_stateHists;
  id v8 = v4;
  if (!stateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stateHists;
    self->_stateHists = v6;

    id v4 = v8;
    stateHists = self->_stateHists;
  }
  [(NSMutableArray *)stateHists addObject:v4];
}

- (unint64_t)stateHistsCount
{
  return (unint64_t)[(NSMutableArray *)self->_stateHists count];
}

- (id)stateHistAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_stateHists objectAtIndex:a3];
}

+ (Class)stateHistType
{
  return (Class)objc_opt_class();
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteRrcStateHist;
  char v3 = [(CellularLteRrcStateHist *)&v7 description];
  id v4 = [(CellularLteRrcStateHist *)self dictionaryRepresentation];
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
  if ((has & 0x10) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_totalDurationMs];
    [v3 setObject:v6 forKey:@"total_duration_ms"];
  }
  if ([(NSMutableArray *)self->_stateHists count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_stateHists, "count")];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = self->_stateHists;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [v20 dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"state_hist"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 2) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v18 forKey:@"num_subs"];

    char v14 = (char)self->_has;
    if ((v14 & 8) == 0)
    {
LABEL_16:
      if ((v14 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_16;
  }
  v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (void)v20);
  [v3 setObject:v19 forKey:@"subs_id"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_17:
    v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (void)v20);
    [v3 setObject:v15 forKey:@"ps_pref"];
  }
LABEL_18:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008AFE4((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_stateHists;
  id v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_totalDurationMs;
    *((unsigned char *)v4 + 56) |= 0x10u;
  }
  id v12 = v4;
  if ([(CellularLteRrcStateHist *)self stateHistsCount])
  {
    [v12 clearStateHists];
    unint64_t v6 = [(CellularLteRrcStateHist *)self stateHistsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteRrcStateHist *)self stateHistAtIndex:i];
        [v12 addStateHist:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  char v11 = v12;
  if ((v10 & 2) != 0)
  {
    *((_DWORD *)v12 + 4) = self->_numSubs;
    *((unsigned char *)v12 + 56) |= 2u;
    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_11:
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v12 + 12) = self->_subsId;
  *((unsigned char *)v12 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_DWORD *)v12 + 8) = self->_psPref;
    *((unsigned char *)v12 + 56) |= 4u;
  }
LABEL_13:
  if (self->_plmn)
  {
    [v12 setPlmn:];
    char v11 = v12;
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
    *((unsigned char *)v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 13) = self->_totalDurationMs;
    *((unsigned char *)v5 + 56) |= 0x10u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_stateHists;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v18 copyWithZone:a3];
        [v6 addStateHist:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_has;
  if ((v14 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    *((_DWORD *)v6 + 12) = self->_subsId;
    *((unsigned char *)v6 + 56) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 4) = self->_numSubs;
  *((unsigned char *)v6 + 56) |= 2u;
  char v14 = (char)self->_has;
  if ((v14 & 8) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  if ((v14 & 4) != 0)
  {
LABEL_15:
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((unsigned char *)v6 + 56) |= 4u;
  }
LABEL_16:
  id v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v18);
  v16 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_totalDurationMs != *((_DWORD *)v4 + 13)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  stateHists = self->_stateHists;
  if ((unint64_t)stateHists | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stateHists, "isEqual:"))
    {
LABEL_32:
      unsigned __int8 v8 = 0;
      goto LABEL_33;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 12)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_32;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_totalDurationMs;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_stateHists hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v6 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 56);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 56);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_totalDurationMs = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CellularLteRrcStateHist addStateHist:](self, "addStateHist:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v5 + 56);
  if ((v12 & 2) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v12 = *((unsigned char *)v5 + 56);
    if ((v12 & 8) == 0)
    {
LABEL_14:
      if ((v12 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v5 + 56) & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_subsId = *((_DWORD *)v5 + 12);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v5 + 56) & 4) != 0)
  {
LABEL_15:
    self->_psPref = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_16:
  if (*((void *)v5 + 3)) {
    -[CellularLteRrcStateHist setPlmn:](self, "setPlmn:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDurationMs
{
  return self->_totalDurationMs;
}

- (NSMutableArray)stateHists
{
  return self->_stateHists;
}

- (void)setStateHists:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHists, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end