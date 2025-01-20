@interface CellularServiceStatusHist
+ (Class)srvStatType;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSimHplmn;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalDurationMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSData)simHplmn;
- (NSMutableArray)srvStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)srvStatAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)srvStatsCount;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (unsigned)totalDurationMs;
- (void)addSrvStat:(id)a3;
- (void)clearSrvStats;
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
- (void)setSimHplmn:(id)a3;
- (void)setSrvStats:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalDurationMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularServiceStatusHist

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

- (void)clearSrvStats
{
}

- (void)addSrvStat:(id)a3
{
  id v4 = a3;
  srvStats = self->_srvStats;
  id v8 = v4;
  if (!srvStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_srvStats;
    self->_srvStats = v6;

    id v4 = v8;
    srvStats = self->_srvStats;
  }
  [(NSMutableArray *)srvStats addObject:v4];
}

- (unint64_t)srvStatsCount
{
  return (unint64_t)[(NSMutableArray *)self->_srvStats count];
}

- (id)srvStatAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_srvStats objectAtIndex:a3];
}

+ (Class)srvStatType
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

- (BOOL)hasSimHplmn
{
  return self->_simHplmn != 0;
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
  v7.super_class = (Class)CellularServiceStatusHist;
  char v3 = [(CellularServiceStatusHist *)&v7 description];
  id v4 = [(CellularServiceStatusHist *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_srvStats count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_srvStats, "count")];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = self->_srvStats;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"srv_stat"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v14 forKey:@"num_subs"];
  }
  simHplmn = self->_simHplmn;
  if (simHplmn) {
    [v3 setObject:simHplmn forKey:@"sim_hplmn"];
  }
  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v17 forKey:@"subs_id"];

    char v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v18 forKey:@"ps_pref"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A5330((uint64_t)self, (uint64_t)a3);
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
  v6 = self->_srvStats;
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_simHplmn) {
    PBDataWriterWriteDataField();
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
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
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_totalDurationMs;
    *((unsigned char *)v4 + 64) |= 0x10u;
  }
  id v12 = v4;
  if ([(CellularServiceStatusHist *)self srvStatsCount])
  {
    [v12 clearSrvStats];
    unint64_t v6 = [(CellularServiceStatusHist *)self srvStatsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularServiceStatusHist *)self srvStatAtIndex:i];
        [v12 addSrvStat:v9];
      }
    }
  }
  id v10 = v12;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v12 + 4) = self->_numSubs;
    *((unsigned char *)v12 + 64) |= 2u;
  }
  if (self->_simHplmn)
  {
    [v12 setSimHplmn];
    id v10 = v12;
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    v10[14] = self->_subsId;
    *((unsigned char *)v10 + 64) |= 8u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    v10[8] = self->_psPref;
    *((unsigned char *)v10 + 64) |= 4u;
  }
  if (self->_plmn)
  {
    [v12 setPlmn:];
    id v10 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 64) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_totalDurationMs;
    *((unsigned char *)v5 + 64) |= 0x10u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = self->_srvStats;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) copyWithZone:a3];
        [v6 addSrvStat:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_numSubs;
    *((unsigned char *)v6 + 64) |= 2u;
  }
  id v14 = -[NSData copyWithZone:](self->_simHplmn, "copyWithZone:", a3, (void)v20);
  long long v15 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_subsId;
    *((unsigned char *)v6 + 64) |= 8u;
    char v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    *((_DWORD *)v6 + 8) = self->_psPref;
    *((unsigned char *)v6 + 64) |= 4u;
  }
  id v17 = [(NSData *)self->_plmn copyWithZone:a3];
  v18 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_totalDurationMs != *((_DWORD *)v4 + 15)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  srvStats = self->_srvStats;
  if ((unint64_t)srvStats | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](srvStats, "isEqual:")) {
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_35;
  }
  simHplmn = self->_simHplmn;
  if ((unint64_t)simHplmn | *((void *)v4 + 5))
  {
    if (-[NSData isEqual:](simHplmn, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_35:
    unsigned __int8 v9 = 0;
    goto LABEL_36;
  }
LABEL_23:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_35;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3)) {
    unsigned __int8 v9 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_36:

  return v9;
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
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_srvStats hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = (unint64_t)[(NSData *)self->_simHplmn hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v8 = 2654435761 * self->_subsId;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 64);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_totalDurationMs = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 6);
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
        -[CellularServiceStatusHist addSrvStat:](self, "addSrvStat:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if ((v5[16] & 2) != 0)
  {
    self->_numSubs = v5[4];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 5)) {
    -[CellularServiceStatusHist setSimHplmn:](self, "setSimHplmn:");
  }
  char v12 = *((unsigned char *)v5 + 64);
  if ((v12 & 8) != 0)
  {
    self->_subsId = v5[14];
    *(unsigned char *)&self->_has |= 8u;
    char v12 = *((unsigned char *)v5 + 64);
  }
  if ((v12 & 4) != 0)
  {
    self->_psPref = v5[8];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 3)) {
    -[CellularServiceStatusHist setPlmn:](self, "setPlmn:");
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

- (NSMutableArray)srvStats
{
  return self->_srvStats;
}

- (void)setSrvStats:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (NSData)simHplmn
{
  return self->_simHplmn;
}

- (void)setSimHplmn:(id)a3
{
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
  objc_storeStrong((id *)&self->_srvStats, 0);
  objc_storeStrong((id *)&self->_simHplmn, 0);

  objc_storeStrong((id *)&self->_plmn, 0);
}

@end