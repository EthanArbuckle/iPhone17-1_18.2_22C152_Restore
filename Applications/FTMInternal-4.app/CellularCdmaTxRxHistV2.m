@interface CellularCdmaTxRxHistV2
+ (Class)perBandType;
- (BOOL)hasDuration;
- (BOOL)hasNid;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSid;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)perBands;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)perBandAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)perBandsCount;
- (unint64_t)timestamp;
- (unsigned)duration;
- (unsigned)nid;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)sid;
- (unsigned)subsId;
- (void)addPerBand:(id)a3;
- (void)clearPerBands;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasNid:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSid:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNid:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPerBands:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSid:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularCdmaTxRxHistV2

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

- (void)clearPerBands
{
}

- (void)addPerBand:(id)a3
{
  id v4 = a3;
  perBands = self->_perBands;
  id v8 = v4;
  if (!perBands)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_perBands;
    self->_perBands = v6;

    id v4 = v8;
    perBands = self->_perBands;
  }
  [(NSMutableArray *)perBands addObject:v4];
}

- (unint64_t)perBandsCount
{
  return (unint64_t)[(NSMutableArray *)self->_perBands count];
}

- (id)perBandAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_perBands objectAtIndex:a3];
}

+ (Class)perBandType
{
  return (Class)objc_opt_class();
}

- (void)setSid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_sid = a3;
}

- (void)setHasSid:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSid
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNid:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nid = a3;
}

- (void)setHasNid:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNid
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularCdmaTxRxHistV2;
  char v3 = [(CellularCdmaTxRxHistV2 *)&v7 description];
  id v4 = [(CellularCdmaTxRxHistV2 *)self dictionaryRepresentation];
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
  if ([(NSMutableArray *)self->_perBands count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_perBands, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = self->_perBands;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(*(id *)(*((void *)&v22 + 1) + 8 * i)) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"per_band"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x20) != 0)
  {
    v18 = +[NSNumber numberWithUnsignedInt:self->_sid];
    [v3 setObject:v18 forKey:@"sid"];

    char v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_16:
      if ((v14 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nid, (void)v22);
  [v3 setObject:v19 forKey:@"nid"];

  char v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_17:
    if ((v14 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
LABEL_27:
  v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (void)v22);
  [v3 setObject:v20 forKey:@"num_subs"];

  char v14 = (char)self->_has;
  if ((v14 & 0x40) == 0)
  {
LABEL_18:
    if ((v14 & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_28:
  v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (void)v22);
  [v3 setObject:v21 forKey:@"subs_id"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (void)v22);
    [v3 setObject:v15 forKey:@"ps_pref"];
  }
LABEL_20:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100010EEC((uint64_t)self, (uint64_t)a3);
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
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_perBands;
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
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
    if ((v11 & 4) == 0)
    {
LABEL_14:
      if ((v11 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  char v11 = (char)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_15:
    if ((v11 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  char v11 = (char)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_16:
    if ((v11 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
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
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_duration;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  id v12 = v4;
  if ([(CellularCdmaTxRxHistV2 *)self perBandsCount])
  {
    [v12 clearPerBands];
    unint64_t v6 = [(CellularCdmaTxRxHistV2 *)self perBandsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularCdmaTxRxHistV2 *)self perBandAtIndex:i];
        [v12 addPerBand:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  char v11 = v12;
  if ((v10 & 0x20) != 0)
  {
    *((_DWORD *)v12 + 13) = self->_sid;
    *((unsigned char *)v12 + 60) |= 0x20u;
    char v10 = (char)self->_has;
    if ((v10 & 4) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v12 + 5) = self->_nid;
  *((unsigned char *)v12 + 60) |= 4u;
  char v10 = (char)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v12 + 6) = self->_numSubs;
  *((unsigned char *)v12 + 60) |= 8u;
  char v10 = (char)self->_has;
  if ((v10 & 0x40) == 0)
  {
LABEL_13:
    if ((v10 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  *((_DWORD *)v12 + 14) = self->_subsId;
  *((unsigned char *)v12 + 60) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v12 + 12) = self->_psPref;
    *((unsigned char *)v12 + 60) |= 0x10u;
  }
LABEL_15:
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
    *((unsigned char *)v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_duration;
    *((unsigned char *)v5 + 60) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_perBands;
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
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) copyWithZone:a3];
        [v6 addPerBand:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  char v14 = (char)self->_has;
  if ((v14 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_sid;
    *((unsigned char *)v6 + 60) |= 0x20u;
    char v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_14:
      if ((v14 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v6 + 5) = self->_nid;
  *((unsigned char *)v6 + 60) |= 4u;
  char v14 = (char)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_15:
    if ((v14 & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_22:
    *((_DWORD *)v6 + 14) = self->_subsId;
    *((unsigned char *)v6 + 60) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_21:
  *((_DWORD *)v6 + 6) = self->_numSubs;
  *((unsigned char *)v6 + 60) |= 8u;
  char v14 = (char)self->_has;
  if ((v14 & 0x40) != 0) {
    goto LABEL_22;
  }
LABEL_16:
  if ((v14 & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((unsigned char *)v6 + 60) |= 0x10u;
  }
LABEL_18:
  id v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v18);
  v16 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v15;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_42;
  }
  perBands = self->_perBands;
  if ((unint64_t)perBands | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](perBands, "isEqual:"))
    {
LABEL_42:
      unsigned __int8 v8 = 0;
      goto LABEL_43;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_sid != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_nid != *((_DWORD *)v4 + 5)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5)) {
    unsigned __int8 v8 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_43:

  return v8;
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
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_perBands hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v6 = 2654435761 * self->_sid;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_nid;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_numSubs;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 60);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 4);
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
        -[CellularCdmaTxRxHistV2 addPerBand:](self, "addPerBand:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v5 + 60);
  if ((v12 & 0x20) != 0)
  {
    self->_sid = *((_DWORD *)v5 + 13);
    *(unsigned char *)&self->_has |= 0x20u;
    char v12 = *((unsigned char *)v5 + 60);
    if ((v12 & 4) == 0)
    {
LABEL_14:
      if ((v12 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v5 + 60) & 4) == 0)
  {
    goto LABEL_14;
  }
  self->_nid = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v12 = *((unsigned char *)v5 + 60);
  if ((v12 & 8) == 0)
  {
LABEL_15:
    if ((v12 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_numSubs = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v12 = *((unsigned char *)v5 + 60);
  if ((v12 & 0x40) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_24:
  self->_subsId = *((_DWORD *)v5 + 14);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v5 + 60) & 0x10) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((void *)v5 + 5)) {
    -[CellularCdmaTxRxHistV2 setPlmn:](self, "setPlmn:");
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

- (NSMutableArray)perBands
{
  return self->_perBands;
}

- (void)setPerBands:(id)a3
{
}

- (unsigned)sid
{
  return self->_sid;
}

- (unsigned)nid
{
  return self->_nid;
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
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_perBands, 0);
}

@end