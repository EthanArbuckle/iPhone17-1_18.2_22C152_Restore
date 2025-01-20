@interface CellularLteTxCapHist
+ (Class)capHistType;
- (BOOL)hasDuration;
- (BOOL)hasHwProductId;
- (BOOL)hasHwSku;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)capHists;
- (id)capHistAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)capHistsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)duration;
- (unsigned)hwProductId;
- (unsigned)hwSku;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addCapHist:(id)a3;
- (void)clearCapHists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapHists:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHwProductId:(BOOL)a3;
- (void)setHasHwSku:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHwProductId:(unsigned int)a3;
- (void)setHwSku:(unsigned int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularLteTxCapHist

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

- (void)setHwSku:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hwSku = a3;
}

- (void)setHasHwSku:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHwSku
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHwProductId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hwProductId = a3;
}

- (void)setHasHwProductId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHwProductId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearCapHists
{
}

- (void)addCapHist:(id)a3
{
  id v4 = a3;
  capHists = self->_capHists;
  id v8 = v4;
  if (!capHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_capHists;
    self->_capHists = v6;

    id v4 = v8;
    capHists = self->_capHists;
  }
  [(NSMutableArray *)capHists addObject:v4];
}

- (unint64_t)capHistsCount
{
  return (unint64_t)[(NSMutableArray *)self->_capHists count];
}

- (id)capHistAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_capHists objectAtIndex:a3];
}

+ (Class)capHistType
{
  return (Class)objc_opt_class();
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
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
  *(unsigned char *)&self->_has |= 0x20u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularLteTxCapHist;
  char v3 = [(CellularLteTxCapHist *)&v7 description];
  id v4 = [(CellularLteTxCapHist *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v19 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v19 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v20 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v20 forKey:@"duration"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_28:
  v21 = +[NSNumber numberWithUnsignedInt:self->_hwSku];
  [v3 setObject:v21 forKey:@"hw_sku"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithUnsignedInt:self->_hwProductId];
    [v3 setObject:v5 forKey:@"hw_product_id"];
  }
LABEL_6:
  if ([(NSMutableArray *)self->_capHists count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_capHists, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    objc_super v7 = self->_capHists;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"cap_hist"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v13 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
    [v3 setObject:v13 forKey:@"num_subs"];
  }
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x40) != 0)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v16 forKey:@"subs_id"];

    char v15 = (char)self->_has;
  }
  if ((v15 & 0x20) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v17 forKey:@"ps_pref"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100121978((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_capHists;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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

  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
  }
  if ((v11 & 0x20) != 0) {
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
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_23:
      *((_DWORD *)v4 + 8) = self->_hwSku;
      *((unsigned char *)v4 + 56) |= 8u;
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
  *((_DWORD *)v4 + 6) = self->_duration;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_23;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 7) = self->_hwProductId;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_6:
  id v12 = v4;
  if ([(CellularLteTxCapHist *)self capHistsCount])
  {
    [v12 clearCapHists];
    unint64_t v6 = [(CellularLteTxCapHist *)self capHistsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularLteTxCapHist *)self capHistAtIndex:i];
        [v12 addCapHist:v9];
      }
    }
  }
  uint64_t v10 = v12;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v12 + 9) = self->_numSubs;
    *((unsigned char *)v12 + 56) |= 0x10u;
  }
  if (self->_plmn)
  {
    [v12 setPlmn:];
    uint64_t v10 = v12;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v10[13] = self->_subsId;
    *((unsigned char *)v10 + 56) |= 0x40u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    v10[12] = self->_psPref;
    *((unsigned char *)v10 + 56) |= 0x20u;
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
    *((unsigned char *)v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_duration;
  *((unsigned char *)v5 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  *((_DWORD *)v5 + 8) = self->_hwSku;
  *((unsigned char *)v5 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 7) = self->_hwProductId;
    *((unsigned char *)v5 + 56) |= 4u;
  }
LABEL_6:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_capHists;
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
        [v6 addCapHist:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 9) = self->_numSubs;
    *((unsigned char *)v6 + 56) |= 0x10u;
  }
  id v14 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v18);
  long long v15 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v14;

  char v16 = (char)self->_has;
  if ((v16 & 0x40) != 0)
  {
    *((_DWORD *)v6 + 13) = self->_subsId;
    *((unsigned char *)v6 + 56) |= 0x40u;
    char v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((unsigned char *)v6 + 56) |= 0x20u;
  }
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
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_hwSku != *((_DWORD *)v4 + 8)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_hwProductId != *((_DWORD *)v4 + 7)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_42;
  }
  capHists = self->_capHists;
  if ((unint64_t)capHists | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](capHists, "isEqual:")) {
      goto LABEL_42;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_numSubs != *((_DWORD *)v4 + 9)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_33;
    }
LABEL_42:
    BOOL v8 = 0;
    goto LABEL_43;
  }
LABEL_33:
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 13)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  BOOL v8 = (*((unsigned char *)v4 + 56) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_42;
    }
    BOOL v8 = 1;
  }
LABEL_43:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_duration;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_hwSku;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_hwProductId;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  unint64_t v7 = (unint64_t)[(NSMutableArray *)self->_capHists hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v8 = 2654435761 * self->_numSubs;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v10 = 2654435761 * self->_subsId;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v11 = 2654435761 * self->_psPref;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 56);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 56);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 56);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_24:
  self->_hwSku = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
LABEL_5:
    self->_hwProductId = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 2);
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
        -[CellularLteTxCapHist addCapHist:](self, "addCapHist:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if ((v5[14] & 0x10) != 0)
  {
    self->_numSubs = v5[9];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 5)) {
    -[CellularLteTxCapHist setPlmn:](self, "setPlmn:");
  }
  char v12 = *((unsigned char *)v5 + 56);
  if ((v12 & 0x40) != 0)
  {
    self->_subsId = v5[13];
    *(unsigned char *)&self->_has |= 0x40u;
    char v12 = *((unsigned char *)v5 + 56);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_psPref = v5[12];
    *(unsigned char *)&self->_has |= 0x20u;
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

- (unsigned)hwSku
{
  return self->_hwSku;
}

- (unsigned)hwProductId
{
  return self->_hwProductId;
}

- (NSMutableArray)capHists
{
  return self->_capHists;
}

- (void)setCapHists:(id)a3
{
}

- (unsigned)numSubs
{
  return self->_numSubs;
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

- (unsigned)psPref
{
  return self->_psPref;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_capHists, 0);
}

@end