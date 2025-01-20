@interface CellularNrUlPdcpStats
+ (Class)drbType;
+ (Class)srbType;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)drbs;
- (NSMutableArray)srbs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drbAtIndex:(unint64_t)a3;
- (id)srbAtIndex:(unint64_t)a3;
- (unint64_t)drbsCount;
- (unint64_t)hash;
- (unint64_t)srbsCount;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addDrb:(id)a3;
- (void)addSrb:(id)a3;
- (void)clearDrbs;
- (void)clearSrbs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDrbs:(id)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSrbs:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrUlPdcpStats

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

- (void)clearDrbs
{
}

- (void)addDrb:(id)a3
{
  id v4 = a3;
  drbs = self->_drbs;
  id v8 = v4;
  if (!drbs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_drbs;
    self->_drbs = v6;

    id v4 = v8;
    drbs = self->_drbs;
  }
  [(NSMutableArray *)drbs addObject:v4];
}

- (unint64_t)drbsCount
{
  return (unint64_t)[(NSMutableArray *)self->_drbs count];
}

- (id)drbAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_drbs objectAtIndex:a3];
}

+ (Class)drbType
{
  return (Class)objc_opt_class();
}

- (void)clearSrbs
{
}

- (void)addSrb:(id)a3
{
  id v4 = a3;
  srbs = self->_srbs;
  id v8 = v4;
  if (!srbs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_srbs;
    self->_srbs = v6;

    id v4 = v8;
    srbs = self->_srbs;
  }
  [(NSMutableArray *)srbs addObject:v4];
}

- (unint64_t)srbsCount
{
  return (unint64_t)[(NSMutableArray *)self->_srbs count];
}

- (id)srbAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_srbs objectAtIndex:a3];
}

+ (Class)srbType
{
  return (Class)objc_opt_class();
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
  v7.super_class = (Class)CellularNrUlPdcpStats;
  char v3 = [(CellularNrUlPdcpStats *)&v7 description];
  id v4 = [(CellularNrUlPdcpStats *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_drbs count])
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_drbs, "count")];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v6 = self->_drbs;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"drb"];
  }
  if ([(NSMutableArray *)self->_srbs count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_srbs, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v13 = self->_srbs;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) dictionaryRepresentation:v25];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"srb"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v23 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v23 forKey:@"subs_id"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_23;
  }
  v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (void)v25);
  [v3 setObject:v24 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (void)v25);
    [v3 setObject:v20 forKey:@"ps_pref"];
  }
LABEL_25:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000F4D14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_drbs;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_srbs;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      id v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_19:
      if ((has & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_20:
  }
    PBDataWriterWriteUint32Field();
LABEL_21:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  id v15 = v4;
  if ([(CellularNrUlPdcpStats *)self drbsCount])
  {
    [v15 clearDrbs];
    unint64_t v5 = [(CellularNrUlPdcpStats *)self drbsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(CellularNrUlPdcpStats *)self drbAtIndex:i];
        [v15 addDrb:v8];
      }
    }
  }
  if ([(CellularNrUlPdcpStats *)self srbsCount])
  {
    [v15 clearSrbs];
    unint64_t v9 = [(CellularNrUlPdcpStats *)self srbsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        id v12 = [(CellularNrUlPdcpStats *)self srbAtIndex:j];
        [v15 addSrb:v12];
      }
    }
  }
  char has = (char)self->_has;
  id v14 = v15;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v15 + 14) = self->_subsId;
    *((unsigned char *)v15 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v15 + 6) = self->_numSubs;
  *((unsigned char *)v15 + 60) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_14:
    *((_DWORD *)v15 + 10) = self->_psPref;
    *((unsigned char *)v15 + 60) |= 4u;
  }
LABEL_15:
  if (self->_plmn)
  {
    [v15 setPlmn:];
    id v14 = v15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = self->_drbs;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v6 addDrb:v12];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = self->_srbs;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) copyWithZone:a3];
        [v6 addSrb:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_19;
    }
LABEL_23:
    *((_DWORD *)v6 + 6) = self->_numSubs;
    *((unsigned char *)v6 + 60) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  *((_DWORD *)v6 + 14) = self->_subsId;
  *((unsigned char *)v6 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  if ((has & 4) != 0)
  {
LABEL_20:
    *((_DWORD *)v6 + 10) = self->_psPref;
    *((unsigned char *)v6 + 60) |= 4u;
  }
LABEL_21:
  id v20 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v23);
  long long v21 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v20;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_28:
    unsigned __int8 v8 = 0;
    goto LABEL_29;
  }
  drbs = self->_drbs;
  if ((unint64_t)drbs | *((void *)v4 + 2) && !-[NSMutableArray isEqual:](drbs, "isEqual:")) {
    goto LABEL_28;
  }
  srbs = self->_srbs;
  if ((unint64_t)srbs | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](srbs, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_subsId != *((_DWORD *)v4 + 14)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 6)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_psPref != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_drbs hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_srbs hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (unint64_t)[(NSData *)self->_plmn hash];
  }
  uint64_t v6 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 60))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CellularNrUlPdcpStats *)self addDrb:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v5 + 6);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[CellularNrUlPdcpStats addSrb:](self, "addSrb:", *(void *)(*((void *)&v17 + 1) + 8 * (void)j), (void)v17);
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = *((unsigned char *)v5 + 60);
  if ((v16 & 8) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v16 = *((unsigned char *)v5 + 60);
    if ((v16 & 2) == 0)
    {
LABEL_19:
      if ((v16 & 4) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v5 + 60) & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_numSubs = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v5 + 60) & 4) != 0)
  {
LABEL_20:
    self->_psPref = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_21:
  if (*((void *)v5 + 4)) {
    -[CellularNrUlPdcpStats setPlmn:](self, "setPlmn:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)drbs
{
  return self->_drbs;
}

- (void)setDrbs:(id)a3
{
}

- (NSMutableArray)srbs
{
  return self->_srbs;
}

- (void)setSrbs:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srbs, 0);
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_drbs, 0);
}

@end