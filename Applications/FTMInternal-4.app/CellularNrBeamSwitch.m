@interface CellularNrBeamSwitch
+ (Class)newBeamInfoType;
+ (Class)oldBeamInfoType;
- (BOOL)hasBandInd;
- (BOOL)hasDopplerEstimate;
- (BOOL)hasDurationBeforeSwitch;
- (BOOL)hasMotionState;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)oldBeamInfos;
- (NSMutableArray)thenewBeamInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)motionStateAsString:(int)a3;
- (id)newBeamInfoAtIndex:(unint64_t)a3;
- (id)oldBeamInfoAtIndex:(unint64_t)a3;
- (int)StringAsMotionState:(id)a3;
- (int)motionState;
- (unint64_t)hash;
- (unint64_t)newBeamInfosCount;
- (unint64_t)oldBeamInfosCount;
- (unint64_t)timestamp;
- (unsigned)bandInd;
- (unsigned)dopplerEstimate;
- (unsigned)durationBeforeSwitch;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)subsId;
- (void)addNewBeamInfo:(id)a3;
- (void)addOldBeamInfo:(id)a3;
- (void)clearNewBeamInfos;
- (void)clearOldBeamInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBandInd:(unsigned int)a3;
- (void)setDopplerEstimate:(unsigned int)a3;
- (void)setDurationBeforeSwitch:(unsigned int)a3;
- (void)setHasBandInd:(BOOL)a3;
- (void)setHasDopplerEstimate:(BOOL)a3;
- (void)setHasDurationBeforeSwitch:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMotionState:(int)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setOldBeamInfos:(id)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setThenewBeamInfos:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrBeamSwitch

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

- (void)setDurationBeforeSwitch:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_durationBeforeSwitch = a3;
}

- (void)setHasDurationBeforeSwitch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDurationBeforeSwitch
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearOldBeamInfos
{
}

- (void)addOldBeamInfo:(id)a3
{
  id v4 = a3;
  oldBeamInfos = self->_oldBeamInfos;
  id v8 = v4;
  if (!oldBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_oldBeamInfos;
    self->_oldBeamInfos = v6;

    id v4 = v8;
    oldBeamInfos = self->_oldBeamInfos;
  }
  [(NSMutableArray *)oldBeamInfos addObject:v4];
}

- (unint64_t)oldBeamInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_oldBeamInfos count];
}

- (id)oldBeamInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_oldBeamInfos objectAtIndex:a3];
}

+ (Class)oldBeamInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearNewBeamInfos
{
}

- (void)addNewBeamInfo:(id)a3
{
  id v4 = a3;
  thenewBeamInfos = self->_thenewBeamInfos;
  id v8 = v4;
  if (!thenewBeamInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_thenewBeamInfos;
    self->_thenewBeamInfos = v6;

    id v4 = v8;
    thenewBeamInfos = self->_thenewBeamInfos;
  }
  [(NSMutableArray *)thenewBeamInfos addObject:v4];
}

- (unint64_t)newBeamInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_thenewBeamInfos count];
}

- (id)newBeamInfoAtIndex:(unint64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)newBeamInfoType
{
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (int)motionState
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_motionState;
  }
  else {
    return 0;
  }
}

- (void)setMotionState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMotionState
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287FD8 + a3);
  }

  return v3;
}

- (int)StringAsMotionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MOTION_ST_STATIONARY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_MOVING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_PEDESTRIAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_DRIVING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MOTION_ST_SEMISTATIONARY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDopplerEstimate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dopplerEstimate = a3;
}

- (void)setHasDopplerEstimate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDopplerEstimate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBandInd:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bandInd = a3;
}

- (void)setHasBandInd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBandInd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrBeamSwitch;
  char v3 = [(CellularNrBeamSwitch *)&v7 description];
  int v4 = [(CellularNrBeamSwitch *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_durationBeforeSwitch];
    [v3 setObject:v6 forKey:@"duration_before_switch"];
  }
  if ([(NSMutableArray *)self->_oldBeamInfos count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_oldBeamInfos, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = self->_oldBeamInfos;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"old_beam_info"];
  }
  if ([(NSMutableArray *)self->_thenewBeamInfos count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_thenewBeamInfos, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v15 = self->_thenewBeamInfos;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"new_beam_info"];
  }
  char v21 = (char)self->_has;
  if ((v21 & 0x10) != 0)
  {
    uint64_t motionState = self->_motionState;
    if (motionState >= 5)
    {
      v26 = +[NSString stringWithFormat:@"(unknown: %i)", self->_motionState];
    }
    else
    {
      v26 = *(&off_100287FD8 + motionState);
    }
    [v3 setObject:v26 forKey:@"motion_state"];

    char v21 = (char)self->_has;
    if ((v21 & 4) == 0)
    {
LABEL_25:
      if ((v21 & 2) == 0) {
        goto LABEL_26;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  v27 = +[NSNumber numberWithUnsignedInt:self->_dopplerEstimate];
  [v3 setObject:v27 forKey:@"doppler_estimate"];

  char v21 = (char)self->_has;
  if ((v21 & 2) == 0)
  {
LABEL_26:
    if ((v21 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  v28 = +[NSNumber numberWithUnsignedInt:self->_bandInd];
  [v3 setObject:v28 forKey:@"band_ind"];

  char v21 = (char)self->_has;
  if ((v21 & 0x80) == 0)
  {
LABEL_27:
    if ((v21 & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  v29 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v29 forKey:@"subs_id"];

  char v21 = (char)self->_has;
  if ((v21 & 0x20) == 0)
  {
LABEL_28:
    if ((v21 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_42:
  v30 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v30 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    v22 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v22 forKey:@"ps_pref"];
  }
LABEL_30:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000EFCAC((uint64_t)self, (uint64_t)a3);
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
  if ((has & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_oldBeamInfos;
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
  uint64_t v11 = self->_thenewBeamInfos;
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
  if ((v16 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v16 = (char)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_21:
      if ((v16 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  char v16 = (char)self->_has;
  if ((v16 & 2) == 0)
  {
LABEL_22:
    if ((v16 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  char v16 = (char)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_23:
    if ((v16 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
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
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_durationBeforeSwitch;
    *((unsigned char *)v4 + 72) |= 8u;
  }
  id v16 = v4;
  if ([(CellularNrBeamSwitch *)self oldBeamInfosCount])
  {
    [v16 clearOldBeamInfos];
    unint64_t v6 = [(CellularNrBeamSwitch *)self oldBeamInfosCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularNrBeamSwitch *)self oldBeamInfoAtIndex:i];
        [v16 addOldBeamInfo:v9];
      }
    }
  }
  if ([(CellularNrBeamSwitch *)self newBeamInfosCount])
  {
    [v16 clearNewBeamInfos];
    unint64_t v10 = [(CellularNrBeamSwitch *)self newBeamInfosCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        id v13 = [(CellularNrBeamSwitch *)self newBeamInfoAtIndex:j];
        [v16 addNewBeamInfo:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  v15 = v16;
  if ((v14 & 0x10) != 0)
  {
    *((_DWORD *)v16 + 7) = self->_motionState;
    *((unsigned char *)v16 + 72) |= 0x10u;
    char v14 = (char)self->_has;
    if ((v14 & 4) == 0)
    {
LABEL_15:
      if ((v14 & 2) == 0) {
        goto LABEL_16;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v16 + 5) = self->_dopplerEstimate;
  *((unsigned char *)v16 + 72) |= 4u;
  char v14 = (char)self->_has;
  if ((v14 & 2) == 0)
  {
LABEL_16:
    if ((v14 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v16 + 4) = self->_bandInd;
  *((unsigned char *)v16 + 72) |= 2u;
  char v14 = (char)self->_has;
  if ((v14 & 0x20) == 0)
  {
LABEL_17:
    if ((v14 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_29:
  *((_DWORD *)v16 + 10) = self->_numSubs;
  *((unsigned char *)v16 + 72) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    *((_DWORD *)v16 + 16) = self->_psPref;
    *((unsigned char *)v16 + 72) |= 0x40u;
  }
LABEL_19:
  if (self->_plmn)
  {
    [v16 setPlmn:];
    v15 = v16;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v15[17] = self->_subsId;
    *((unsigned char *)v15 + 72) |= 0x80u;
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
    *((unsigned char *)v5 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_durationBeforeSwitch;
    *((unsigned char *)v5 + 72) |= 8u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = self->_oldBeamInfos;
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
        [v6 addOldBeamInfo:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v14 = self->_thenewBeamInfos;
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
        [v6 addNewBeamInfo:v19];
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  char v20 = (char)self->_has;
  if ((v20 & 0x10) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_motionState;
    *((unsigned char *)v6 + 72) |= 0x10u;
    char v20 = (char)self->_has;
    if ((v20 & 4) == 0)
    {
LABEL_21:
      if ((v20 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v6 + 5) = self->_dopplerEstimate;
  *((unsigned char *)v6 + 72) |= 4u;
  char v20 = (char)self->_has;
  if ((v20 & 2) == 0)
  {
LABEL_22:
    if ((v20 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v6 + 4) = self->_bandInd;
  *((unsigned char *)v6 + 72) |= 2u;
  char v20 = (char)self->_has;
  if ((v20 & 0x20) == 0)
  {
LABEL_23:
    if ((v20 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_31:
  *((_DWORD *)v6 + 10) = self->_numSubs;
  *((unsigned char *)v6 + 72) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *((_DWORD *)v6 + 16) = self->_psPref;
    *((unsigned char *)v6 + 72) |= 0x40u;
  }
LABEL_25:
  id v21 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v24);
  long long v22 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v21;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_subsId;
    *((unsigned char *)v6 + 72) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[72] & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (v4[72])
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[72] & 8) == 0 || self->_durationBeforeSwitch != *((_DWORD *)v4 + 6)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 8) != 0)
  {
    goto LABEL_49;
  }
  oldBeamInfos = self->_oldBeamInfos;
  if ((unint64_t)oldBeamInfos | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](oldBeamInfos, "isEqual:"))
  {
    goto LABEL_49;
  }
  thenewBeamInfos = self->_thenewBeamInfos;
  if ((unint64_t)thenewBeamInfos | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](thenewBeamInfos, "isEqual:")) {
      goto LABEL_49;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((v4[72] & 0x10) == 0 || self->_motionState != *((_DWORD *)v4 + 7)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[72] & 4) == 0 || self->_dopplerEstimate != *((_DWORD *)v4 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[72] & 2) == 0 || self->_bandInd != *((_DWORD *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[72] & 0x20) == 0 || self->_numSubs != *((_DWORD *)v4 + 10)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[72] & 0x40) == 0 || self->_psPref != *((_DWORD *)v4 + 16)) {
      goto LABEL_49;
    }
  }
  else if ((v4[72] & 0x40) != 0)
  {
    goto LABEL_49;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_49:
      BOOL v10 = 0;
      goto LABEL_50;
    }
    char has = (char)self->_has;
  }
  int v9 = v4[72];
  if (has < 0)
  {
    if ((v9 & 0x80000000) == 0 || self->_subsId != *((_DWORD *)v4 + 17)) {
      goto LABEL_49;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = v9 >= 0;
  }
LABEL_50:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v15 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      id v3 = [(NSMutableArray *)self->_oldBeamInfos hash];
      goto LABEL_6;
    }
  }
  id v3 = [(NSMutableArray *)self->_oldBeamInfos hash];
LABEL_6:
  unint64_t v4 = (unint64_t)v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_thenewBeamInfos hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_motionState;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_dopplerEstimate;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_bandInd;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_psPref;
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v10 = 0;
LABEL_17:
  unint64_t v11 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v12 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v12 = 0;
  }
  return v14 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (char *)a3;
  unint64_t v5 = v4;
  char v6 = v4[72];
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = v4[72];
  }
  if ((v6 & 8) != 0)
  {
    self->_durationBeforeSwitch = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *((id *)v4 + 6);
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
        [(CellularNrBeamSwitch *)self addOldBeamInfo:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = *((id *)v5 + 4);
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
        -[CellularNrBeamSwitch addNewBeamInfo:](self, "addNewBeamInfo:", *(void *)(*((void *)&v18 + 1) + 8 * (void)j), (void)v18);
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  char v17 = v5[72];
  if ((v17 & 0x10) != 0)
  {
    self->_uint64_t motionState = *((_DWORD *)v5 + 7);
    *(unsigned char *)&self->_has |= 0x10u;
    char v17 = v5[72];
    if ((v17 & 4) == 0)
    {
LABEL_21:
      if ((v17 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }
  else if ((v5[72] & 4) == 0)
  {
    goto LABEL_21;
  }
  self->_dopplerEstimate = *((_DWORD *)v5 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v17 = v5[72];
  if ((v17 & 2) == 0)
  {
LABEL_22:
    if ((v17 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_bandInd = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v17 = v5[72];
  if ((v17 & 0x20) == 0)
  {
LABEL_23:
    if ((v17 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_33:
  self->_numSubs = *((_DWORD *)v5 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((v5[72] & 0x40) != 0)
  {
LABEL_24:
    self->_psPref = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_25:
  if (*((void *)v5 + 7)) {
    -[CellularNrBeamSwitch setPlmn:](self, "setPlmn:");
  }
  if (v5[72] < 0)
  {
    self->_subsId = *((_DWORD *)v5 + 17);
    *(unsigned char *)&self->_has |= 0x80u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationBeforeSwitch
{
  return self->_durationBeforeSwitch;
}

- (NSMutableArray)oldBeamInfos
{
  return self->_oldBeamInfos;
}

- (void)setOldBeamInfos:(id)a3
{
}

- (NSMutableArray)thenewBeamInfos
{
  return self->_thenewBeamInfos;
}

- (void)setThenewBeamInfos:(id)a3
{
}

- (unsigned)dopplerEstimate
{
  return self->_dopplerEstimate;
}

- (unsigned)bandInd
{
  return self->_bandInd;
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
  objc_storeStrong((id *)&self->_oldBeamInfos, 0);

  objc_storeStrong((id *)&self->_thenewBeamInfos, 0);
}

@end