@interface KCellularLteRsrpRsrqSinr
+ (Class)instValuesType;
- (BOOL)hasAvgValues;
- (BOOL)hasCallId;
- (BOOL)hasDurationMs;
- (BOOL)hasLastXSeconds;
- (BOOL)hasLastYSamples;
- (BOOL)hasNumSamples;
- (BOOL)hasSamplePeriodMs;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instValues;
- (NSString)callId;
- (RsrpRsrqSinr)avgValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instValuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instValuesCount;
- (unint64_t)timestamp;
- (unsigned)durationMs;
- (unsigned)lastXSeconds;
- (unsigned)lastYSamples;
- (unsigned)numSamples;
- (unsigned)samplePeriodMs;
- (unsigned)subsId;
- (void)addInstValues:(id)a3;
- (void)clearInstValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgValues:(id)a3;
- (void)setCallId:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasLastXSeconds:(BOOL)a3;
- (void)setHasLastYSamples:(BOOL)a3;
- (void)setHasNumSamples:(BOOL)a3;
- (void)setHasSamplePeriodMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstValues:(id)a3;
- (void)setLastXSeconds:(unsigned int)a3;
- (void)setLastYSamples:(unsigned int)a3;
- (void)setNumSamples:(unsigned int)a3;
- (void)setSamplePeriodMs:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularLteRsrpRsrqSinr

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

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (void)setLastXSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_lastXSeconds = a3;
}

- (void)setHasLastXSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastXSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLastYSamples:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_lastYSamples = a3;
}

- (void)setHasLastYSamples:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastYSamples
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSamplePeriodMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_samplePeriodMs = a3;
}

- (void)setHasSamplePeriodMs:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSamplePeriodMs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumSamples:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numSamples = a3;
}

- (void)setHasNumSamples:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumSamples
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasAvgValues
{
  return self->_avgValues != 0;
}

- (void)clearInstValues
{
}

- (void)addInstValues:(id)a3
{
  id v4 = a3;
  instValues = self->_instValues;
  id v8 = v4;
  if (!instValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_instValues;
    self->_instValues = v6;

    id v4 = v8;
    instValues = self->_instValues;
  }
  [(NSMutableArray *)instValues addObject:v4];
}

- (unint64_t)instValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_instValues count];
}

- (id)instValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_instValues objectAtIndex:a3];
}

+ (Class)instValuesType
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)KCellularLteRsrpRsrqSinr;
  char v3 = [(KCellularLteRsrpRsrqSinr *)&v7 description];
  id v4 = [(KCellularLteRsrpRsrqSinr *)self dictionaryRepresentation];
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
  callId = self->_callId;
  if (callId) {
    [v3 setObject:callId forKey:@"call_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = +[NSNumber numberWithUnsignedInt:self->_lastXSeconds];
    [v3 setObject:v19 forKey:@"last_x_seconds"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v20 = +[NSNumber numberWithUnsignedInt:self->_lastYSamples];
  [v3 setObject:v20 forKey:@"last_y_samples"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v21 = +[NSNumber numberWithUnsignedInt:self->_samplePeriodMs];
  [v3 setObject:v21 forKey:@"sample_period_ms"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_30:
  v22 = +[NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v22 forKey:@"duration_ms"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_numSamples];
    [v3 setObject:v7 forKey:@"num_samples"];
  }
LABEL_11:
  avgValues = self->_avgValues;
  if (avgValues)
  {
    v9 = [(RsrpRsrqSinr *)avgValues dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"avg_values"];
  }
  if ([(NSMutableArray *)self->_instValues count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_instValues, "count")];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_instValues;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"inst_values"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v17 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v17 forKey:@"subs_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001435DC((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x40) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_callId) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
  if (self->_avgValues) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v7 = self->_instValues;
  id v8 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      v9 = (char *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_subsId;
    *((unsigned char *)v4 + 68) |= 0x40u;
  }
  v11 = v4;
  if (self->_callId)
  {
    [v4 setCallId:];
    id v4 = v11;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_lastXSeconds;
    *((unsigned char *)v4 + 68) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_lastYSamples;
  *((unsigned char *)v4 + 68) |= 8u;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 15) = self->_samplePeriodMs;
  *((unsigned char *)v4 + 68) |= 0x20u;
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  *((_DWORD *)v4 + 8) = self->_durationMs;
  *((unsigned char *)v4 + 68) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 14) = self->_numSamples;
    *((unsigned char *)v4 + 68) |= 0x10u;
  }
LABEL_13:
  if (self->_avgValues) {
    [v11 setAvgValues:];
  }
  if ([(KCellularLteRsrpRsrqSinr *)self instValuesCount])
  {
    [v11 clearInstValues];
    unint64_t v7 = [(KCellularLteRsrpRsrqSinr *)self instValuesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(KCellularLteRsrpRsrqSinr *)self instValuesAtIndex:i];
        [v11 addInstValues:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_subsId;
    *((unsigned char *)v5 + 68) |= 0x40u;
  }
  id v8 = [(NSString *)self->_callId copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_lastXSeconds;
    *((unsigned char *)v6 + 68) |= 4u;
    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 13) = self->_lastYSamples;
  *((unsigned char *)v6 + 68) |= 8u;
  char v10 = (char)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_8:
    if ((v10 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v6 + 15) = self->_samplePeriodMs;
  *((unsigned char *)v6 + 68) |= 0x20u;
  char v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_9:
    if ((v10 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_22:
  *((_DWORD *)v6 + 8) = self->_durationMs;
  *((unsigned char *)v6 + 68) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v6 + 14) = self->_numSamples;
    *((unsigned char *)v6 + 68) |= 0x10u;
  }
LABEL_11:
  id v11 = [(RsrpRsrqSinr *)self->_avgValues copyWithZone:a3];
  long long v12 = (void *)v6[2];
  v6[2] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_instValues;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [v20 copyWithZone:a3];
        [v6 addInstValues:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 16)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](callId, "isEqual:"))
    {
LABEL_44:
      unsigned __int8 v9 = 0;
      goto LABEL_45;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_lastXSeconds != *((_DWORD *)v4 + 12)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_lastYSamples != *((_DWORD *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0 || self->_samplePeriodMs != *((_DWORD *)v4 + 15)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_numSamples != *((_DWORD *)v4 + 14)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  avgValues = self->_avgValues;
  if ((unint64_t)avgValues | *((void *)v4 + 2) && !-[RsrpRsrqSinr isEqual:](avgValues, "isEqual:")) {
    goto LABEL_44;
  }
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((void *)v4 + 5)) {
    unsigned __int8 v9 = -[NSMutableArray isEqual:](instValues, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_45:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_subsId;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_callId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_lastXSeconds;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_lastYSamples;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_samplePeriodMs;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v10 = 0;
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_durationMs;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_numSamples;
LABEL_17:
  unint64_t v11 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
  unint64_t v12 = [(RsrpRsrqSinr *)self->_avgValues hash];
  return v11 ^ v12 ^ (unint64_t)[(NSMutableArray *)self->_instValues hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 68);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 3)) {
    -[KCellularLteRsrpRsrqSinr setCallId:](self, "setCallId:");
  }
  char v7 = *((unsigned char *)v5 + 68);
  if ((v7 & 4) != 0)
  {
    self->_lastXSeconds = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v5 + 68);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v5 + 68) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_lastYSamples = *((_DWORD *)v5 + 13);
  *(unsigned char *)&self->_has |= 8u;
  char v7 = *((unsigned char *)v5 + 68);
  if ((v7 & 0x20) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_samplePeriodMs = *((_DWORD *)v5 + 15);
  *(unsigned char *)&self->_has |= 0x20u;
  char v7 = *((unsigned char *)v5 + 68);
  if ((v7 & 2) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_19:
  self->_durationMs = *((_DWORD *)v5 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v5 + 68) & 0x10) != 0)
  {
LABEL_12:
    self->_numSamples = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_13:
  avgValues = self->_avgValues;
  uint64_t v9 = *((void *)v5 + 2);
  if (avgValues)
  {
    if (v9) {
      -[RsrpRsrqSinr mergeFrom:](avgValues, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[KCellularLteRsrpRsrqSinr setAvgValues:](self, "setAvgValues:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v5 + 5);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[KCellularLteRsrpRsrqSinr addInstValues:](self, "addInstValues:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
}

- (unsigned)lastXSeconds
{
  return self->_lastXSeconds;
}

- (unsigned)lastYSamples
{
  return self->_lastYSamples;
}

- (unsigned)samplePeriodMs
{
  return self->_samplePeriodMs;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)numSamples
{
  return self->_numSamples;
}

- (RsrpRsrqSinr)avgValues
{
  return self->_avgValues;
}

- (void)setAvgValues:(id)a3
{
}

- (NSMutableArray)instValues
{
  return self->_instValues;
}

- (void)setInstValues:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instValues, 0);
  objc_storeStrong((id *)&self->_callId, 0);

  objc_storeStrong((id *)&self->_avgValues, 0);
}

@end