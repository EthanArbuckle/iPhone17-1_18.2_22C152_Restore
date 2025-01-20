@interface CellularWcdmaRrcConnCount
+ (Class)connReqRelType;
- (BOOL)hasDrbEstComp;
- (BOOL)hasDurationSeconds;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasRrcSetupComp;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)connReqRels;
- (id)connReqRelAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)connReqRelsCount;
- (unint64_t)establishCausesCount;
- (unint64_t)hash;
- (unint64_t)releaseCausesCount;
- (unint64_t)rlfCauseSensorsCount;
- (unint64_t)rlfCausesCount;
- (unint64_t)rrcConnReqCausesCount;
- (unint64_t)timestamp;
- (unsigned)drbEstComp;
- (unsigned)durationSeconds;
- (unsigned)establishCauseAtIndex:(unint64_t)a3;
- (unsigned)establishCauses;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)releaseCauseAtIndex:(unint64_t)a3;
- (unsigned)releaseCauses;
- (unsigned)rlfCauseAtIndex:(unint64_t)a3;
- (unsigned)rlfCauseSensorAtIndex:(unint64_t)a3;
- (unsigned)rlfCauseSensors;
- (unsigned)rlfCauses;
- (unsigned)rrcConnReqCauseAtIndex:(unint64_t)a3;
- (unsigned)rrcConnReqCauses;
- (unsigned)rrcSetupComp;
- (unsigned)subsId;
- (void)addConnReqRel:(id)a3;
- (void)addEstablishCause:(unsigned int)a3;
- (void)addReleaseCause:(unsigned int)a3;
- (void)addRlfCause:(unsigned int)a3;
- (void)addRlfCauseSensor:(unsigned int)a3;
- (void)addRrcConnReqCause:(unsigned int)a3;
- (void)clearConnReqRels;
- (void)clearEstablishCauses;
- (void)clearReleaseCauses;
- (void)clearRlfCauseSensors;
- (void)clearRlfCauses;
- (void)clearRrcConnReqCauses;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnReqRels:(id)a3;
- (void)setDrbEstComp:(unsigned int)a3;
- (void)setDurationSeconds:(unsigned int)a3;
- (void)setEstablishCauses:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasDrbEstComp:(BOOL)a3;
- (void)setHasDurationSeconds:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasRrcSetupComp:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReleaseCauses:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRlfCauseSensors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRlfCauses:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcConnReqCauses:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setRrcSetupComp:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularWcdmaRrcConnCount

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CellularWcdmaRrcConnCount;
  [(CellularWcdmaRrcConnCount *)&v3 dealloc];
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

- (void)setDurationSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)rrcConnReqCausesCount
{
  return self->_rrcConnReqCauses.count;
}

- (unsigned)rrcConnReqCauses
{
  return self->_rrcConnReqCauses.list;
}

- (void)clearRrcConnReqCauses
{
}

- (void)addRrcConnReqCause:(unsigned int)a3
{
}

- (unsigned)rrcConnReqCauseAtIndex:(unint64_t)a3
{
  p_rrcConnReqCauses = &self->_rrcConnReqCauses;
  unint64_t count = self->_rrcConnReqCauses.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rrcConnReqCauses->list[a3];
}

- (void)setRrcConnReqCauses:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setRrcSetupComp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rrcSetupComp = a3;
}

- (void)setHasRrcSetupComp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRrcSetupComp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDrbEstComp:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_drbEstComp = a3;
}

- (void)setHasDrbEstComp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDrbEstComp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)rlfCauseSensorsCount
{
  return self->_rlfCauseSensors.count;
}

- (unsigned)rlfCauseSensors
{
  return self->_rlfCauseSensors.list;
}

- (void)clearRlfCauseSensors
{
}

- (void)addRlfCauseSensor:(unsigned int)a3
{
}

- (unsigned)rlfCauseSensorAtIndex:(unint64_t)a3
{
  p_rlfCauseSensors = &self->_rlfCauseSensors;
  unint64_t count = self->_rlfCauseSensors.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rlfCauseSensors->list[a3];
}

- (void)setRlfCauseSensors:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)establishCausesCount
{
  return self->_establishCauses.count;
}

- (unsigned)establishCauses
{
  return self->_establishCauses.list;
}

- (void)clearEstablishCauses
{
}

- (void)addEstablishCause:(unsigned int)a3
{
}

- (unsigned)establishCauseAtIndex:(unint64_t)a3
{
  p_establishCauses = &self->_establishCauses;
  unint64_t count = self->_establishCauses.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_establishCauses->list[a3];
}

- (void)setEstablishCauses:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)releaseCausesCount
{
  return self->_releaseCauses.count;
}

- (unsigned)releaseCauses
{
  return self->_releaseCauses.list;
}

- (void)clearReleaseCauses
{
}

- (void)addReleaseCause:(unsigned int)a3
{
}

- (unsigned)releaseCauseAtIndex:(unint64_t)a3
{
  p_releaseCauses = &self->_releaseCauses;
  unint64_t count = self->_releaseCauses.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_releaseCauses->list[a3];
}

- (void)setReleaseCauses:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rlfCausesCount
{
  return self->_rlfCauses.count;
}

- (unsigned)rlfCauses
{
  return self->_rlfCauses.list;
}

- (void)clearRlfCauses
{
}

- (void)addRlfCause:(unsigned int)a3
{
}

- (unsigned)rlfCauseAtIndex:(unint64_t)a3
{
  p_rlfCauses = &self->_rlfCauses;
  unint64_t count = self->_rlfCauses.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_rlfCauses->list[a3];
}

- (void)setRlfCauses:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearConnReqRels
{
}

- (void)addConnReqRel:(id)a3
{
  id v4 = a3;
  connReqRels = self->_connReqRels;
  id v8 = v4;
  if (!connReqRels)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_connReqRels;
    self->_connReqRels = v6;

    id v4 = v8;
    connReqRels = self->_connReqRels;
  }
  [(NSMutableArray *)connReqRels addObject:v4];
}

- (unint64_t)connReqRelsCount
{
  return (unint64_t)[(NSMutableArray *)self->_connReqRels count];
}

- (id)connReqRelAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_connReqRels objectAtIndex:a3];
}

+ (Class)connReqRelType
{
  return (Class)objc_opt_class();
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
  v7.super_class = (Class)CellularWcdmaRrcConnCount;
  char v3 = [(CellularWcdmaRrcConnCount *)&v7 description];
  id v4 = [(CellularWcdmaRrcConnCount *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_durationSeconds];
    [v3 setObject:v6 forKey:@"duration_seconds"];
  }
  objc_super v7 = PBRepeatedUInt32NSArray();
  [v3 setObject:v7 forKey:@"rrc_conn_req_cause"];

  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_rrcSetupComp];
    [v3 setObject:v9 forKey:@"rrc_setup_comp"];

    char v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    v10 = +[NSNumber numberWithUnsignedInt:self->_drbEstComp];
    [v3 setObject:v10 forKey:@"drb_est_comp"];
  }
  v11 = PBRepeatedUInt32NSArray();
  [v3 setObject:v11 forKey:@"rlf_cause_sensor"];

  v12 = PBRepeatedUInt32NSArray();
  [v3 setObject:v12 forKey:@"establish_cause"];

  v13 = PBRepeatedUInt32NSArray();
  [v3 setObject:v13 forKey:@"release_cause"];

  v14 = PBRepeatedUInt32NSArray();
  [v3 setObject:v14 forKey:@"rlf_cause"];

  if ([(NSMutableArray *)self->_connReqRels count])
  {
    id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_connReqRels, "count")];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = self->_connReqRels;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"conn_req_rel"];
  }
  char v22 = (char)self->_has;
  if ((v22 & 0x40) != 0)
  {
    v26 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v26 forKey:@"subs_id"];

    char v22 = (char)self->_has;
    if ((v22 & 8) == 0)
    {
LABEL_20:
      if ((v22 & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_20;
  }
  v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (void)v28);
  [v3 setObject:v27 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_21:
    v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (void)v28);
    [v3 setObject:v23 forKey:@"ps_pref"];
  }
LABEL_22:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100049574((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_rrcConnReqCauses.count)
  {
    uint64_t v22 = 0;
    PBDataWriterPlaceMark();
    if (self->_rrcConnReqCauses.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rrcConnReqCauses.count);
    }
    PBDataWriterRecallMark();
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v7 = (char)self->_has;
  }
  if ((v7 & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_rlfCauseSensors.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v8;
    }
    while (v8 < self->_rlfCauseSensors.count);
  }
  if (self->_establishCauses.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < self->_establishCauses.count);
  }
  if (self->_releaseCauses.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < self->_releaseCauses.count);
  }
  if (self->_rlfCauses.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v11;
    }
    while (v11 < self->_rlfCauses.count);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = self->_connReqRels;
  v13 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      v14 = (char *)[(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v14);
  }

  char v17 = (char)self->_has;
  if ((v17 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v17 = (char)self->_has;
    if ((v17 & 8) == 0)
    {
LABEL_35:
      if ((v17 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_36:
  }
    PBDataWriterWriteUint32Field();
LABEL_37:
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
    v4[16] = self->_timestamp;
    *((unsigned char *)v4 + 180) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_durationSeconds;
    *((unsigned char *)v4 + 180) |= 4u;
  }
  id v28 = v4;
  if ([(CellularWcdmaRrcConnCount *)self rrcConnReqCausesCount])
  {
    [v28 clearRrcConnReqCauses];
    unint64_t v6 = [(CellularWcdmaRrcConnCount *)self rrcConnReqCausesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v28 addRrcConnReqCause:[self rrcConnReqCauseAtIndex:i]];
    }
  }
  char v9 = (char)self->_has;
  if ((v9 & 0x20) != 0)
  {
    *((_DWORD *)v28 + 43) = self->_rrcSetupComp;
    *((unsigned char *)v28 + 180) |= 0x20u;
    char v9 = (char)self->_has;
  }
  if ((v9 & 2) != 0)
  {
    *((_DWORD *)v28 + 36) = self->_drbEstComp;
    *((unsigned char *)v28 + 180) |= 2u;
  }
  if ([(CellularWcdmaRrcConnCount *)self rlfCauseSensorsCount])
  {
    [v28 clearRlfCauseSensors];
    unint64_t v10 = [(CellularWcdmaRrcConnCount *)self rlfCauseSensorsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [v28 addRlfCauseSensor:[self rlfCauseSensorAtIndex:j]];
    }
  }
  if ([(CellularWcdmaRrcConnCount *)self establishCausesCount])
  {
    [v28 clearEstablishCauses];
    unint64_t v13 = [(CellularWcdmaRrcConnCount *)self establishCausesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        [v28 addEstablishCause:[self establishCauseAtIndex:k]];
    }
  }
  if ([(CellularWcdmaRrcConnCount *)self releaseCausesCount])
  {
    [v28 clearReleaseCauses];
    unint64_t v16 = [(CellularWcdmaRrcConnCount *)self releaseCausesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        [v28 addReleaseCause:[self releaseCauseAtIndex:m]];
    }
  }
  if ([(CellularWcdmaRrcConnCount *)self rlfCausesCount])
  {
    [v28 clearRlfCauses];
    unint64_t v19 = [(CellularWcdmaRrcConnCount *)self rlfCausesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t n = 0; n != v20; ++n)
        [v28 addRlfCause:[self rlfCauseAtIndex:n]];
    }
  }
  if ([(CellularWcdmaRrcConnCount *)self connReqRelsCount])
  {
    [v28 clearConnReqRels];
    unint64_t v22 = [(CellularWcdmaRrcConnCount *)self connReqRelsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
      {
        v25 = [(CellularWcdmaRrcConnCount *)self connReqRelAtIndex:ii];
        [v28 addConnReqRel:v25];
      }
    }
  }
  char v26 = (char)self->_has;
  v27 = v28;
  if ((v26 & 0x40) != 0)
  {
    *((_DWORD *)v28 + 44) = self->_subsId;
    *((unsigned char *)v28 + 180) |= 0x40u;
    char v26 = (char)self->_has;
    if ((v26 & 8) == 0)
    {
LABEL_35:
      if ((v26 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v28 + 38) = self->_numSubs;
  *((unsigned char *)v28 + 180) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_36:
    *((_DWORD *)v28 + 42) = self->_psPref;
    *((unsigned char *)v28 + 180) |= 0x10u;
  }
LABEL_37:
  if (self->_plmn)
  {
    [v28 setPlmn:];
    v27 = v28;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[16] = self->_timestamp;
    *((unsigned char *)v5 + 180) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 37) = self->_durationSeconds;
    *((unsigned char *)v5 + 180) |= 4u;
  }
  PBRepeatedUInt32Copy();
  char v8 = (char)self->_has;
  if ((v8 & 0x20) != 0)
  {
    v6[43] = self->_rrcSetupComp;
    *((unsigned char *)v6 + 180) |= 0x20u;
    char v8 = (char)self->_has;
  }
  if ((v8 & 2) != 0)
  {
    v6[36] = self->_drbEstComp;
    *((unsigned char *)v6 + 180) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v9 = self->_connReqRels;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) copyWithZone:a3];
        [v6 addConnReqRel:v14];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  char v15 = (char)self->_has;
  if ((v15 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_18;
    }
LABEL_22:
    v6[38] = self->_numSubs;
    *((unsigned char *)v6 + 180) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v6[44] = self->_subsId;
  *((unsigned char *)v6 + 180) |= 0x40u;
  char v15 = (char)self->_has;
  if ((v15 & 8) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  if ((v15 & 0x10) != 0)
  {
LABEL_19:
    v6[42] = self->_psPref;
    *((unsigned char *)v6 + 180) |= 0x10u;
  }
LABEL_20:
  id v16 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v19);
  unint64_t v17 = (void *)*((void *)v6 + 20);
  *((void *)v6 + 20) = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 180) & 1) == 0 || self->_timestamp != *((void *)v4 + 16)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 180))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 4) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 37)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_46:
    unsigned __int8 v7 = 0;
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 0x20) == 0 || self->_rrcSetupComp != *((_DWORD *)v4 + 43)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 2) == 0 || self->_drbEstComp != *((_DWORD *)v4 + 36)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 2) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  connReqRels = self->_connReqRels;
  if ((unint64_t)connReqRels | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](connReqRels, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 44)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 38)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 180) & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 42)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 180) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  plmuint64_t n = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 20)) {
    unsigned __int8 v7 = -[NSData isEqual:](plmn, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v17 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v16 = 2654435761 * self->_durationSeconds;
      goto LABEL_6;
    }
  }
  uint64_t v16 = 0;
LABEL_6:
  uint64_t v3 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v4 = 2654435761 * self->_rrcSetupComp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v5 = 2654435761 * self->_drbEstComp;
      goto LABEL_11;
    }
  }
  uint64_t v5 = 0;
LABEL_11:
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_connReqRels hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = 2654435761 * self->_subsId;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v13 = 2654435761 * self->_psPref;
LABEL_18:
  unint64_t v14 = v16 ^ v17 ^ v4 ^ v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v10;
  return v14 ^ v12 ^ v13 ^ (unint64_t)[(NSData *)self->_plmn hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 180);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 180);
  }
  if ((v6 & 4) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 37);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v7 = (char *)[v4 rrcConnReqCausesCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[CellularWcdmaRrcConnCount addRrcConnReqCause:](self, "addRrcConnReqCause:", [v5 rrcConnReqCauseAtIndex:i]);
  }
  char v10 = *((unsigned char *)v5 + 180);
  if ((v10 & 0x20) != 0)
  {
    self->_rrcSetupComp = *((_DWORD *)v5 + 43);
    *(unsigned char *)&self->_has |= 0x20u;
    char v10 = *((unsigned char *)v5 + 180);
  }
  if ((v10 & 2) != 0)
  {
    self->_drbEstComp = *((_DWORD *)v5 + 36);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v11 = (char *)[v5 rlfCauseSensorsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[CellularWcdmaRrcConnCount addRlfCauseSensor:](self, "addRlfCauseSensor:", [v5 rlfCauseSensorAtIndex:j]);
  }
  unint64_t v14 = (char *)[v5 establishCausesCount];
  if (v14)
  {
    char v15 = v14;
    for (uint64_t k = 0; k != v15; ++k)
      -[CellularWcdmaRrcConnCount addEstablishCause:](self, "addEstablishCause:", [v5 establishCauseAtIndex:k]);
  }
  unint64_t v17 = (char *)[v5 releaseCausesCount];
  if (v17)
  {
    long long v18 = v17;
    for (uint64_t m = 0; m != v18; ++m)
      -[CellularWcdmaRrcConnCount addReleaseCause:](self, "addReleaseCause:", [v5 releaseCauseAtIndex:m]);
  }
  long long v20 = (char *)[v5 rlfCausesCount];
  if (v20)
  {
    long long v21 = v20;
    for (uint64_t n = 0; n != v21; ++n)
      -[CellularWcdmaRrcConnCount addRlfCause:](self, "addRlfCause:", [v5 rlfCauseAtIndex:n]);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = *((id *)v5 + 17);
  id v24 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (iuint64_t i = 0; ii != v25; iuint64_t i = (char *)ii + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        -[CellularWcdmaRrcConnCount addConnReqRel:](self, "addConnReqRel:", *(void *)(*((void *)&v29 + 1) + 8 * (void)ii), (void)v29);
      }
      id v25 = [v23 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v25);
  }

  char v28 = *((unsigned char *)v5 + 180);
  if ((v28 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 44);
    *(unsigned char *)&self->_has |= 0x40u;
    char v28 = *((unsigned char *)v5 + 180);
    if ((v28 & 8) == 0)
    {
LABEL_33:
      if ((v28 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v5 + 180) & 8) == 0)
  {
    goto LABEL_33;
  }
  self->_numSubs = *((_DWORD *)v5 + 38);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v5 + 180) & 0x10) != 0)
  {
LABEL_34:
    self->_psPref = *((_DWORD *)v5 + 42);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_35:
  if (*((void *)v5 + 20)) {
    -[CellularWcdmaRrcConnCount setPlmn:](self, "setPlmn:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (unsigned)rrcSetupComp
{
  return self->_rrcSetupComp;
}

- (unsigned)drbEstComp
{
  return self->_drbEstComp;
}

- (NSMutableArray)connReqRels
{
  return self->_connReqRels;
}

- (void)setConnReqRels:(id)a3
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
  objc_storeStrong((id *)&self->_plmn, 0);

  objc_storeStrong((id *)&self->_connReqRels, 0);
}

@end