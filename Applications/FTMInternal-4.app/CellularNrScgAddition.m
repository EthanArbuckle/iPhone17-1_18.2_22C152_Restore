@interface CellularNrScgAddition
+ (Class)drbConfigType;
- (BOOL)hasFreqBandInd;
- (BOOL)hasFreqRange;
- (BOOL)hasIsSrb3Configured;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasReason;
- (BOOL)hasResult;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSrb3Configured;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (NSMutableArray)drbConfigs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drbConfigAtIndex:(unint64_t)a3;
- (unint64_t)drbConfigsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)freqBandInd;
- (unsigned)freqRange;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)reason;
- (unsigned)result;
- (unsigned)subsId;
- (void)addDrbConfig:(id)a3;
- (void)clearDrbConfigs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDrbConfigs:(id)a3;
- (void)setFreqBandInd:(unsigned int)a3;
- (void)setFreqRange:(unsigned int)a3;
- (void)setHasFreqBandInd:(BOOL)a3;
- (void)setHasFreqRange:(BOOL)a3;
- (void)setHasIsSrb3Configured:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsSrb3Configured:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setReason:(unsigned int)a3;
- (void)setResult:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrScgAddition

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setReason:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasResult
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsSrb3Configured:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSrb3Configured = a3;
}

- (void)setHasIsSrb3Configured:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSrb3Configured
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearDrbConfigs
{
}

- (void)addDrbConfig:(id)a3
{
  id v4 = a3;
  drbConfigs = self->_drbConfigs;
  id v8 = v4;
  if (!drbConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_drbConfigs;
    self->_drbConfigs = v6;

    id v4 = v8;
    drbConfigs = self->_drbConfigs;
  }
  [(NSMutableArray *)drbConfigs addObject:v4];
}

- (unint64_t)drbConfigsCount
{
  return (unint64_t)[(NSMutableArray *)self->_drbConfigs count];
}

- (id)drbConfigAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_drbConfigs objectAtIndex:a3];
}

+ (Class)drbConfigType
{
  return (Class)objc_opt_class();
}

- (void)setFreqRange:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_freqRange = a3;
}

- (void)setHasFreqRange:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFreqRange
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFreqBandInd:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_freqBandInd = a3;
}

- (void)setHasFreqBandInd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFreqBandInd
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPsPref
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrScgAddition;
  __int16 v3 = [(CellularNrScgAddition *)&v7 description];
  id v4 = [(CellularNrScgAddition *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v17 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v17 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v18 = +[NSNumber numberWithUnsignedInt:self->_reason];
  [v3 setObject:v18 forKey:@"reason"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_28:
  v19 = +[NSNumber numberWithUnsignedInt:self->_result];
  [v3 setObject:v19 forKey:@"result"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithBool:self->_isSrb3Configured];
    [v3 setObject:v5 forKey:@"is_srb3_configured"];
  }
LABEL_6:
  if ([(NSMutableArray *)self->_drbConfigs count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_drbConfigs, "count")];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    objc_super v7 = self->_drbConfigs;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"drb_config"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    v20 = +[NSNumber numberWithUnsignedInt:self->_freqRange];
    [v3 setObject:v20 forKey:@"freq_range"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_17:
      if ((v13 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_32;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_17;
  }
  v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_freqBandInd, (void)v24);
  [v3 setObject:v21 forKey:@"freq_band_ind"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x80) == 0)
  {
LABEL_18:
    if ((v13 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }
LABEL_32:
  v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId, (void)v24);
  [v3 setObject:v22 forKey:@"subs_id"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) == 0)
  {
LABEL_19:
    if ((v13 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_33:
  v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs, (void)v24);
  [v3 setObject:v23 forKey:@"num_subs"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_psPref, (void)v24);
    [v3 setObject:v14 forKey:@"ps_pref"];
  }
LABEL_21:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003C368((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_drbConfigs;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 2) == 0)
    {
LABEL_15:
      if ((v11 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteUint32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_16:
    if ((v11 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 34) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
LABEL_24:
      *((_DWORD *)v4 + 14) = self->_result;
      *((_WORD *)v4 + 34) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 13) = self->_reason;
  *((_WORD *)v4 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_4:
  if ((has & 0x100) != 0)
  {
LABEL_5:
    *((unsigned char *)v4 + 64) = self->_isSrb3Configured;
    *((_WORD *)v4 + 34) |= 0x100u;
  }
LABEL_6:
  id v12 = v4;
  if ([(CellularNrScgAddition *)self drbConfigsCount])
  {
    [v12 clearDrbConfigs];
    unint64_t v6 = [(CellularNrScgAddition *)self drbConfigsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(CellularNrScgAddition *)self drbConfigAtIndex:i];
        [v12 addDrbConfig:v9];
      }
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = v12;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v12 + 7) = self->_freqRange;
    *((_WORD *)v12 + 34) |= 4u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 2) == 0)
    {
LABEL_12:
      if ((v10 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_28;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v12 + 6) = self->_freqBandInd;
  *((_WORD *)v12 + 34) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_13:
    if ((v10 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_28:
  *((_DWORD *)v12 + 8) = self->_numSubs;
  *((_WORD *)v12 + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v12 + 12) = self->_psPref;
    *((_WORD *)v12 + 34) |= 0x10u;
  }
LABEL_15:
  if (self->_plmn)
  {
    [v12 setPlmn:];
    __int16 v11 = v12;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v11[15] = self->_subsId;
    *((_WORD *)v11 + 34) |= 0x80u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 34) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_reason;
  *((_WORD *)v5 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *((_DWORD *)v5 + 14) = self->_result;
  *((_WORD *)v5 + 34) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    *((unsigned char *)v5 + 64) = self->_isSrb3Configured;
    *((_WORD *)v5 + 34) |= 0x100u;
  }
LABEL_6:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_drbConfigs;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v6 addDrbConfig:v13];

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_freqRange;
    *((_WORD *)v6 + 34) |= 4u;
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 6) = self->_freqBandInd;
  *((_WORD *)v6 + 34) |= 2u;
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_16:
    if ((v14 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_27:
  *((_DWORD *)v6 + 8) = self->_numSubs;
  *((_WORD *)v6 + 34) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    *((_DWORD *)v6 + 12) = self->_psPref;
    *((_WORD *)v6 + 34) |= 0x10u;
  }
LABEL_18:
  id v15 = -[NSData copyWithZone:](self->_plmn, "copyWithZone:", a3, (void)v18);
  v16 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v15;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_subsId;
    *((_WORD *)v6 + 34) |= 0x80u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 34);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_56;
    }
  }
  else if (v6)
  {
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_reason != *((_DWORD *)v4 + 13)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_result != *((_DWORD *)v4 + 14)) {
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) == 0) {
      goto LABEL_56;
    }
    if (self->_isSrb3Configured)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_56;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  drbConfigs = self->_drbConfigs;
  if ((unint64_t)drbConfigs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](drbConfigs, "isEqual:")) {
      goto LABEL_56;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 34);
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_freqRange != *((_DWORD *)v4 + 7)) {
      goto LABEL_56;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_freqBandInd != *((_DWORD *)v4 + 6)) {
      goto LABEL_56;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_numSubs != *((_DWORD *)v4 + 8)) {
      goto LABEL_56;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_psPref != *((_DWORD *)v4 + 12)) {
      goto LABEL_56;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 5))
  {
    if (-[NSData isEqual:](plmn, "isEqual:"))
    {
      __int16 has = (__int16)self->_has;
      goto LABEL_51;
    }
LABEL_56:
    BOOL v11 = 0;
    goto LABEL_57;
  }
LABEL_51:
  __int16 v10 = *((_WORD *)v4 + 34);
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_subsId != *((_DWORD *)v4 + 15)) {
      goto LABEL_56;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x80) == 0;
  }
LABEL_57:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v17 = 2654435761u * self->_timestamp;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_reason;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_result;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_isSrb3Configured;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v5 = 0;
LABEL_10:
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_drbConfigs hash];
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_freqRange;
    if ((v7 & 2) != 0)
    {
LABEL_12:
      uint64_t v9 = 2654435761 * self->_freqBandInd;
      if ((v7 & 8) != 0) {
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v10 = 0;
      if ((v7 & 0x10) != 0) {
        goto LABEL_14;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((v7 & 2) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
  if ((v7 & 8) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v10 = 2654435761 * self->_numSubs;
  if ((v7 & 0x10) != 0)
  {
LABEL_14:
    uint64_t v11 = 2654435761 * self->_psPref;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
LABEL_19:
  unint64_t v12 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v13 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v13 = 0;
  }
  return v16 ^ v17 ^ v4 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11 ^ v6 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 34);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 34);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_reason = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 34);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_25:
  self->_result = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
LABEL_5:
    self->_isSrb3Configured = *((unsigned char *)v4 + 64);
    *(_WORD *)&self->_has |= 0x100u;
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
        -[CellularNrScgAddition addDrbConfig:](self, "addDrbConfig:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  __int16 v12 = *((_WORD *)v5 + 34);
  if ((v12 & 4) != 0)
  {
    self->_freqRange = *((_DWORD *)v5 + 7);
    *(_WORD *)&self->_has |= 4u;
    __int16 v12 = *((_WORD *)v5 + 34);
    if ((v12 & 2) == 0)
    {
LABEL_15:
      if ((v12 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_15;
  }
  self->_freqBandInd = *((_DWORD *)v5 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v12 = *((_WORD *)v5 + 34);
  if ((v12 & 8) == 0)
  {
LABEL_16:
    if ((v12 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  self->_numSubs = *((_DWORD *)v5 + 8);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 34) & 0x10) != 0)
  {
LABEL_17:
    self->_psPref = *((_DWORD *)v5 + 12);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((void *)v5 + 5)) {
    -[CellularNrScgAddition setPlmn:](self, "setPlmn:");
  }
  if ((*((_WORD *)v5 + 34) & 0x80) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 15);
    *(_WORD *)&self->_has |= 0x80u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)reason
{
  return self->_reason;
}

- (unsigned)result
{
  return self->_result;
}

- (BOOL)isSrb3Configured
{
  return self->_isSrb3Configured;
}

- (NSMutableArray)drbConfigs
{
  return self->_drbConfigs;
}

- (void)setDrbConfigs:(id)a3
{
}

- (unsigned)freqRange
{
  return self->_freqRange;
}

- (unsigned)freqBandInd
{
  return self->_freqBandInd;
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

  objc_storeStrong((id *)&self->_drbConfigs, 0);
}

@end