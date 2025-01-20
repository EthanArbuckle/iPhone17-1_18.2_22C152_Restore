@interface GEOLogMsgStateUserSession
+ (BOOL)isValid:(id)a3;
- (BOOL)didPreviouslyRotate;
- (BOOL)hasAgeOfSessionIdInSeconds;
- (BOOL)hasDeviceLocalSessionId;
- (BOOL)hasDidPreviouslyRotate;
- (BOOL)hasEventTime;
- (BOOL)hasHasRotated;
- (BOOL)hasInitialDeviceSessionId;
- (BOOL)hasLastIcloudSyncDate;
- (BOOL)hasNavSessionId;
- (BOOL)hasNavSessionRelativeTimestamp;
- (BOOL)hasPreSyncSessionId;
- (BOOL)hasRelativeTimestamp;
- (BOOL)hasRotated;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSessionEpoch;
- (BOOL)hasSessionId;
- (BOOL)hasUserCohortValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalTime)eventTime;
- (GEOLogMsgStateUserSession)initWithDictionary:(id)a3;
- (GEOLogMsgStateUserSession)initWithJSON:(id)a3;
- (GEOSessionID)deviceLocalSessionId;
- (GEOSessionID)initialDeviceSessionId;
- (GEOSessionID)navSessionId;
- (GEOSessionID)preSyncSessionId;
- (GEOSessionID)sessionId;
- (double)ageOfSessionIdInSeconds;
- (double)lastIcloudSyncDate;
- (double)navSessionRelativeTimestamp;
- (double)relativeTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)sessionEpoch;
- (unsigned)sequenceNumber;
- (unsigned)userCohortValue;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeOfSessionIdInSeconds:(double)a3;
- (void)setDeviceLocalSessionId:(GEOSessionID)a3;
- (void)setDidPreviouslyRotate:(BOOL)a3;
- (void)setEventTime:(id)a3;
- (void)setHasAgeOfSessionIdInSeconds:(BOOL)a3;
- (void)setHasDeviceLocalSessionId:(BOOL)a3;
- (void)setHasDidPreviouslyRotate:(BOOL)a3;
- (void)setHasHasRotated:(BOOL)a3;
- (void)setHasInitialDeviceSessionId:(BOOL)a3;
- (void)setHasLastIcloudSyncDate:(BOOL)a3;
- (void)setHasNavSessionId:(BOOL)a3;
- (void)setHasNavSessionRelativeTimestamp:(BOOL)a3;
- (void)setHasPreSyncSessionId:(BOOL)a3;
- (void)setHasRelativeTimestamp:(BOOL)a3;
- (void)setHasRotated:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSessionEpoch:(BOOL)a3;
- (void)setHasSessionId:(BOOL)a3;
- (void)setHasUserCohortValue:(BOOL)a3;
- (void)setInitialDeviceSessionId:(GEOSessionID)a3;
- (void)setLastIcloudSyncDate:(double)a3;
- (void)setNavSessionId:(GEOSessionID)a3;
- (void)setNavSessionRelativeTimestamp:(double)a3;
- (void)setPreSyncSessionId:(GEOSessionID)a3;
- (void)setRelativeTimestamp:(double)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setSessionEpoch:(unint64_t)a3;
- (void)setSessionId:(GEOSessionID)a3;
- (void)setUserCohortValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateUserSession

- (void)setEventTime:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_relativeTimestamp = a3;
}

- (void)setSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_sessionId = a3;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_sequenceNumber = a3;
}

- (void)setSessionEpoch:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_sessionEpoch = a3;
}

- (void)setDidPreviouslyRotate:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_didPreviouslyRotate = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterPlaceMark();
    PBDataWriterWriteUint64Field();
    PBDataWriterWriteUint64Field();
    PBDataWriterRecallMark();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_23:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
LABEL_6:
  }
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_eventTime) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_27;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 1) == 0)
  {
LABEL_16:
    if ((v6 & 0x800) == 0) {
      goto LABEL_17;
    }
LABEL_32:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_31:
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x800) != 0) {
    goto LABEL_32;
  }
LABEL_17:
  if ((v6 & 0x2000) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
}

- (GEOSessionID)sessionId
{
  p_sessionId = &self->_sessionId;
  unint64_t high = self->_sessionId._high;
  unint64_t low = p_sessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setHasSessionId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSessionId
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (double)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasRelativeTimestamp
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (GEOSessionID)navSessionId
{
  p_navSessionId = &self->_navSessionId;
  unint64_t high = self->_navSessionId._high;
  unint64_t low = p_navSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setNavSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_navSessionId = a3;
}

- (void)setHasNavSessionId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasNavSessionId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (double)navSessionRelativeTimestamp
{
  return self->_navSessionRelativeTimestamp;
}

- (void)setNavSessionRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_navSessionRelativeTimestamp = a3;
}

- (void)setHasNavSessionRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasNavSessionRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (BOOL)hasEventTime
{
  return self->_eventTime != 0;
}

- (GEOLocalTime)eventTime
{
  return self->_eventTime;
}

- (unint64_t)sessionEpoch
{
  return self->_sessionEpoch;
}

- (void)setHasSessionEpoch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasSessionEpoch
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)ageOfSessionIdInSeconds
{
  return self->_ageOfSessionIdInSeconds;
}

- (void)setAgeOfSessionIdInSeconds:(double)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_ageOfSessionIdInSeconds = a3;
}

- (void)setHasAgeOfSessionIdInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasAgeOfSessionIdInSeconds
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (GEOSessionID)preSyncSessionId
{
  p_preSyncSessionId = &self->_preSyncSessionId;
  unint64_t high = self->_preSyncSessionId._high;
  unint64_t low = p_preSyncSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setPreSyncSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_preSyncSessionId = a3;
}

- (void)setHasPreSyncSessionId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasPreSyncSessionId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (GEOSessionID)initialDeviceSessionId
{
  p_initialDeviceSessionId = &self->_initialDeviceSessionId;
  unint64_t high = self->_initialDeviceSessionId._high;
  unint64_t low = p_initialDeviceSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setInitialDeviceSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_initialDeviceSessionId = a3;
}

- (void)setHasInitialDeviceSessionId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasInitialDeviceSessionId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)lastIcloudSyncDate
{
  return self->_lastIcloudSyncDate;
}

- (void)setLastIcloudSyncDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_lastIcloudSyncDate = a3;
}

- (void)setHasLastIcloudSyncDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasLastIcloudSyncDate
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (BOOL)didPreviouslyRotate
{
  return self->_didPreviouslyRotate;
}

- (void)setHasDidPreviouslyRotate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasDidPreviouslyRotate
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (GEOSessionID)deviceLocalSessionId
{
  p_deviceLocalSessionId = &self->_deviceLocalSessionId;
  unint64_t high = self->_deviceLocalSessionId._high;
  unint64_t low = p_deviceLocalSessionId->_low;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (void)setDeviceLocalSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_deviceLocalSessionId = a3;
}

- (void)setHasDeviceLocalSessionId:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasDeviceLocalSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)userCohortValue
{
  return self->_userCohortValue;
}

- (void)setUserCohortValue:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_userCohortValue = a3;
}

- (void)setHasUserCohortValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasUserCohortValue
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (BOOL)hasRotated
{
  return self->_hasRotated;
}

- (void)setHasRotated:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_hasRotated = a3;
}

- (void)setHasHasRotated:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasHasRotated
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateUserSession;
  id v4 = [(GEOLogMsgStateUserSession *)&v8 description];
  v5 = [(GEOLogMsgStateUserSession *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateUserSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_79;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 0x10) != 0)
  {
    v12 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 72));
    if (a2) {
      v13 = @"sessionId";
    }
    else {
      v13 = @"session_id";
    }
    [v4 setObject:v12 forKey:v13];

    __int16 v5 = *(_WORD *)(a1 + 148);
    if ((v5 & 0x400) == 0)
    {
LABEL_4:
      if ((v5 & 0x100) == 0) {
        goto LABEL_5;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)(a1 + 148) & 0x400) == 0)
  {
    goto LABEL_4;
  }
  v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
  if (a2) {
    v15 = @"sequenceNumber";
  }
  else {
    v15 = @"sequence_number";
  }
  [v4 setObject:v14 forKey:v15];

  __int16 v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_22:
  v16 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
  if (a2) {
    v17 = @"relativeTimestamp";
  }
  else {
    v17 = @"relative_timestamp";
  }
  [v4 setObject:v16 forKey:v17];

  __int16 v5 = *(_WORD *)(a1 + 148);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_26:
  v18 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 40));
  if (a2) {
    v19 = @"navSessionId";
  }
  else {
    v19 = @"nav_session_id";
  }
  [v4 setObject:v18 forKey:v19];

  if ((*(_WORD *)(a1 + 148) & 0x80) != 0)
  {
LABEL_7:
    __int16 v6 = [NSNumber numberWithDouble:*(double *)(a1 + 112)];
    if (a2) {
      v7 = @"navSessionRelativeTimestamp";
    }
    else {
      v7 = @"nav_session_relative_timestamp";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_11:
  objc_super v8 = [(id)a1 eventTime];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"eventTime";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"event_time";
    }
    [v4 setObject:v10 forKey:v11];
  }
  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x200) != 0)
  {
    v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 128)];
    if (a2) {
      v22 = @"sessionEpoch";
    }
    else {
      v22 = @"session_epoch";
    }
    [v4 setObject:v21 forKey:v22];

    __int16 v20 = *(_WORD *)(a1 + 148);
    if ((v20 & 0x20) == 0)
    {
LABEL_35:
      if ((v20 & 8) == 0) {
        goto LABEL_36;
      }
      goto LABEL_51;
    }
  }
  else if ((v20 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  v23 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  if (a2) {
    v24 = @"ageOfSessionIdInSeconds";
  }
  else {
    v24 = @"age_of_session_id_in_seconds";
  }
  [v4 setObject:v23 forKey:v24];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 8) == 0)
  {
LABEL_36:
    if ((v20 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_55;
  }
LABEL_51:
  v25 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 56));
  if (a2) {
    v26 = @"preSyncSessionId";
  }
  else {
    v26 = @"pre_sync_session_id";
  }
  [v4 setObject:v25 forKey:v26];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 2) == 0)
  {
LABEL_37:
    if ((v20 & 0x40) == 0) {
      goto LABEL_38;
    }
    goto LABEL_59;
  }
LABEL_55:
  v27 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 24));
  if (a2) {
    v28 = @"initialDeviceSessionId";
  }
  else {
    v28 = @"initial_device_session_id";
  }
  [v4 setObject:v27 forKey:v28];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x40) == 0)
  {
LABEL_38:
    if ((v20 & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_63;
  }
LABEL_59:
  v29 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
  if (a2) {
    v30 = @"lastIcloudSyncDate";
  }
  else {
    v30 = @"last_icloud_sync_date";
  }
  [v4 setObject:v29 forKey:v30];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x1000) == 0)
  {
LABEL_39:
    if ((v20 & 1) == 0) {
      goto LABEL_40;
    }
    goto LABEL_67;
  }
LABEL_63:
  v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
  if (a2) {
    v32 = @"didPreviouslyRotate";
  }
  else {
    v32 = @"did_previously_rotate";
  }
  [v4 setObject:v31 forKey:v32];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 1) == 0)
  {
LABEL_40:
    if ((v20 & 0x800) == 0) {
      goto LABEL_41;
    }
LABEL_71:
    v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
    if (a2) {
      v36 = @"userCohortValue";
    }
    else {
      v36 = @"user_cohort_value";
    }
    [v4 setObject:v35 forKey:v36];

    if ((*(_WORD *)(a1 + 148) & 0x2000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_75;
  }
LABEL_67:
  v33 = _GEOSessionIDDictionaryRepresentation((void *)(a1 + 8));
  if (a2) {
    v34 = @"deviceLocalSessionId";
  }
  else {
    v34 = @"device_local_session_id";
  }
  [v4 setObject:v33 forKey:v34];

  __int16 v20 = *(_WORD *)(a1 + 148);
  if ((v20 & 0x800) != 0) {
    goto LABEL_71;
  }
LABEL_41:
  if ((v20 & 0x2000) != 0)
  {
LABEL_75:
    v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 145)];
    if (a2) {
      v38 = @"hasRotated";
    }
    else {
      v38 = @"has_rotated";
    }
    [v4 setObject:v37 forKey:v38];
  }
LABEL_79:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateUserSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateUserSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateUserSession *)-[GEOLogMsgStateUserSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        __int16 v6 = @"sessionId";
      }
      else {
        __int16 v6 = @"session_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v7, &v40);
        objc_msgSend(a1, "setSessionId:", v40, v41);
      }

      if (a3) {
        objc_super v8 = @"sequenceNumber";
      }
      else {
        objc_super v8 = @"sequence_number";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        v10 = @"relativeTimestamp";
      }
      else {
        v10 = @"relative_timestamp";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setRelativeTimestamp:");
      }

      if (a3) {
        v12 = @"navSessionId";
      }
      else {
        v12 = @"nav_session_id";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v13, &v40);
        objc_msgSend(a1, "setNavSessionId:", v40, v41);
      }

      if (a3) {
        v14 = @"navSessionRelativeTimestamp";
      }
      else {
        v14 = @"nav_session_relative_timestamp";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 doubleValue];
        objc_msgSend(a1, "setNavSessionRelativeTimestamp:");
      }

      if (a3) {
        v16 = @"eventTime";
      }
      else {
        v16 = @"event_time";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOLocalTime alloc];
        if (a3) {
          uint64_t v19 = [(GEOLocalTime *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOLocalTime *)v18 initWithDictionary:v17];
        }
        __int16 v20 = (void *)v19;
        [a1 setEventTime:v19];
      }
      if (a3) {
        v21 = @"sessionEpoch";
      }
      else {
        v21 = @"session_epoch";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSessionEpoch:", objc_msgSend(v22, "unsignedLongLongValue"));
      }

      if (a3) {
        v23 = @"ageOfSessionIdInSeconds";
      }
      else {
        v23 = @"age_of_session_id_in_seconds";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v24 doubleValue];
        objc_msgSend(a1, "setAgeOfSessionIdInSeconds:");
      }

      if (a3) {
        v25 = @"preSyncSessionId";
      }
      else {
        v25 = @"pre_sync_session_id";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v26, &v40);
        objc_msgSend(a1, "setPreSyncSessionId:", v40, v41);
      }

      if (a3) {
        v27 = @"initialDeviceSessionId";
      }
      else {
        v27 = @"initial_device_session_id";
      }
      v28 = [v5 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v28, &v40);
        objc_msgSend(a1, "setInitialDeviceSessionId:", v40, v41);
      }

      if (a3) {
        v29 = @"lastIcloudSyncDate";
      }
      else {
        v29 = @"last_icloud_sync_date";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v30 doubleValue];
        objc_msgSend(a1, "setLastIcloudSyncDate:");
      }

      if (a3) {
        v31 = @"didPreviouslyRotate";
      }
      else {
        v31 = @"did_previously_rotate";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDidPreviouslyRotate:", objc_msgSend(v32, "BOOLValue"));
      }

      if (a3) {
        v33 = @"deviceLocalSessionId";
      }
      else {
        v33 = @"device_local_session_id";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v34, &v40);
        objc_msgSend(a1, "setDeviceLocalSessionId:", v40, v41);
      }

      if (a3) {
        v35 = @"userCohortValue";
      }
      else {
        v35 = @"user_cohort_value";
      }
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUserCohortValue:", objc_msgSend(v36, "unsignedIntValue"));
      }

      if (a3) {
        v37 = @"hasRotated";
      }
      else {
        v37 = @"has_rotated";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasRotated:", objc_msgSend(v38, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateUserSession)initWithJSON:(id)a3
{
  return (GEOLogMsgStateUserSession *)-[GEOLogMsgStateUserSession _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateUserSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateUserSessionReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  v7 = (char *)a3;
  [(GEOLogMsgStateUserSession *)self readAll:0];
  id v4 = v7;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(GEOSessionID *)(v7 + 72) = self->_sessionId;
    *((_WORD *)v7 + 74) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v7 + 34) = self->_sequenceNumber;
  *((_WORD *)v7 + 74) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v7 + 15) = *(void *)&self->_relativeTimestamp;
  *((_WORD *)v7 + 74) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_25:
  *(GEOSessionID *)(v7 + 40) = self->_navSessionId;
  *((_WORD *)v7 + 74) |= 4u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_6:
    *((void *)v7 + 14) = *(void *)&self->_navSessionRelativeTimestamp;
    *((_WORD *)v7 + 74) |= 0x80u;
  }
LABEL_7:
  if (self->_eventTime)
  {
    objc_msgSend(v7, "setEventTime:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x200) != 0)
  {
    *((void *)v4 + 16) = self->_sessionEpoch;
    *((_WORD *)v4 + 74) |= 0x200u;
    __int16 v6 = (__int16)self->_flags;
    if ((v6 & 0x20) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_29;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 11) = *(void *)&self->_ageOfSessionIdInSeconds;
  *((_WORD *)v4 + 74) |= 0x20u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(GEOSessionID *)(v4 + 56) = self->_preSyncSessionId;
  *((_WORD *)v4 + 74) |= 8u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 2) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(GEOSessionID *)(v4 + 24) = self->_initialDeviceSessionId;
  *((_WORD *)v4 + 74) |= 2u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 13) = *(void *)&self->_lastIcloudSyncDate;
  *((_WORD *)v4 + 74) |= 0x40u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x1000) == 0)
  {
LABEL_15:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[144] = self->_didPreviouslyRotate;
  *((_WORD *)v4 + 74) |= 0x1000u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 1) == 0)
  {
LABEL_16:
    if ((v6 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(GEOSessionID *)(v4 + 8) = self->_deviceLocalSessionId;
  *((_WORD *)v4 + 74) |= 1u;
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 0x800) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_34:
  *((_DWORD *)v4 + 35) = self->_userCohortValue;
  *((_WORD *)v4 + 74) |= 0x800u;
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_18:
    v4[145] = self->_hasRotated;
    *((_WORD *)v4 + 74) |= 0x2000u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(GEOSessionID *)(v5 + 72) = self->_sessionId;
    *(_WORD *)(v5 + 148) |= 0x10u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x400) == 0)
    {
LABEL_3:
      if ((flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 136) = self->_sequenceNumber;
  *(_WORD *)(v5 + 148) |= 0x400u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 120) = self->_relativeTimestamp;
  *(_WORD *)(v5 + 148) |= 0x100u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_21:
  *(GEOSessionID *)(v5 + 40) = self->_navSessionId;
  *(_WORD *)(v5 + 148) |= 4u;
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
LABEL_6:
    *(double *)(v5 + 112) = self->_navSessionRelativeTimestamp;
    *(_WORD *)(v5 + 148) |= 0x80u;
  }
LABEL_7:
  id v8 = [(GEOLocalTime *)self->_eventTime copyWithZone:a3];
  v9 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v8;

  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x200) != 0)
  {
    *(void *)(v6 + 128) = self->_sessionEpoch;
    *(_WORD *)(v6 + 148) |= 0x200u;
    __int16 v10 = (__int16)self->_flags;
    if ((v10 & 0x20) == 0)
    {
LABEL_9:
      if ((v10 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v6 + 88) = self->_ageOfSessionIdInSeconds;
  *(_WORD *)(v6 + 148) |= 0x20u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 8) == 0)
  {
LABEL_10:
    if ((v10 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(GEOSessionID *)(v6 + 56) = self->_preSyncSessionId;
  *(_WORD *)(v6 + 148) |= 8u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 2) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(GEOSessionID *)(v6 + 24) = self->_initialDeviceSessionId;
  *(_WORD *)(v6 + 148) |= 2u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x40) == 0)
  {
LABEL_12:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v6 + 104) = self->_lastIcloudSyncDate;
  *(_WORD *)(v6 + 148) |= 0x40u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x1000) == 0)
  {
LABEL_13:
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v6 + 144) = self->_didPreviouslyRotate;
  *(_WORD *)(v6 + 148) |= 0x1000u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 1) == 0)
  {
LABEL_14:
    if ((v10 & 0x800) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *(_DWORD *)(v6 + 140) = self->_userCohortValue;
    *(_WORD *)(v6 + 148) |= 0x800u;
    if ((*(_WORD *)&self->_flags & 0x2000) == 0) {
      return (id)v6;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(GEOSessionID *)(v6 + 8) = self->_deviceLocalSessionId;
  *(_WORD *)(v6 + 148) |= 1u;
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x800) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((v10 & 0x2000) != 0)
  {
LABEL_16:
    *(unsigned char *)(v6 + 145) = self->_hasRotated;
    *(_WORD *)(v6 + 148) |= 0x2000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  [(GEOLogMsgStateUserSession *)self readAll:1];
  [v4 readAll:1];
  $8F2985508D0FA6360DDB7B7543041657 flags = self->_flags;
  int v6 = v4[74];
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_93;
    }
    if (self->_sessionId._high != *((void *)v4 + 9) || self->_sessionId._low != *((void *)v4 + 10)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 34)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_relativeTimestamp != *((double *)v4 + 15)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_DWORD *)&flags & v6 & 4) == 0
    || (self->_navSessionId._high == *((void *)v4 + 5)
      ? (BOOL v8 = self->_navSessionId._low == *((void *)v4 + 6))
      : (BOOL v8 = 0),
        !v8))
  {
    if (((*(_DWORD *)&flags | v6) & 4) != 0) {
      goto LABEL_93;
    }
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_navSessionRelativeTimestamp != *((double *)v4 + 14)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  eventTime = self->_eventTime;
  if ((unint64_t)eventTime | *((void *)v4 + 12))
  {
    if (!-[GEOLocalTime isEqual:](eventTime, "isEqual:")) {
      goto LABEL_93;
    }
    $8F2985508D0FA6360DDB7B7543041657 flags = self->_flags;
    int v6 = v4[74];
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_sessionEpoch != *((void *)v4 + 16)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_ageOfSessionIdInSeconds != *((double *)v4 + 11)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&flags & 8) != 0 && (v6 & 8) != 0)
  {
    if (self->_preSyncSessionId._high != *((void *)v4 + 7) || self->_preSyncSessionId._low != *((void *)v4 + 8)) {
      goto LABEL_93;
    }
  }
  else if (((*(_DWORD *)&flags | v6) & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&flags & 2) != 0 && (v6 & 2) != 0)
  {
    if (self->_initialDeviceSessionId._high != *((void *)v4 + 3)
      || self->_initialDeviceSessionId._low != *((void *)v4 + 4))
    {
      goto LABEL_93;
    }
  }
  else if (((*(_DWORD *)&flags | v6) & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_lastIcloudSyncDate != *((double *)v4 + 13)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0) {
      goto LABEL_93;
    }
    if (self->_didPreviouslyRotate)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_93;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  if (*(unsigned char *)&flags & 1) != 0 && (v6)
  {
    if (self->_deviceLocalSessionId._high != *((void *)v4 + 1)
      || self->_deviceLocalSessionId._low != *((void *)v4 + 2))
    {
      goto LABEL_93;
    }
  }
  else if ((*(_DWORD *)&flags | v6))
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_userCohortValue != *((_DWORD *)v4 + 35)) {
      goto LABEL_93;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) != 0)
    {
      if (self->_hasRotated)
      {
        if (!*((unsigned char *)v4 + 145)) {
          goto LABEL_93;
        }
      }
      else if (*((unsigned char *)v4 + 145))
      {
        goto LABEL_93;
      }
      BOOL v13 = 1;
      goto LABEL_94;
    }
LABEL_93:
    BOOL v13 = 0;
    goto LABEL_94;
  }
  BOOL v13 = (v6 & 0x2000) == 0;
LABEL_94:

  return v13;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateUserSession *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    uint64_t v37 = PBHashBytes();
    __int16 flags = (__int16)self->_flags;
  }
  else
  {
    uint64_t v37 = 0;
  }
  if ((flags & 0x400) != 0)
  {
    uint64_t v36 = 2654435761 * self->_sequenceNumber;
    if ((flags & 0x100) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v36 = 0;
  if ((flags & 0x100) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double relativeTimestamp = self->_relativeTimestamp;
  double v5 = -relativeTimestamp;
  if (relativeTimestamp >= 0.0) {
    double v5 = self->_relativeTimestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  unint64_t v35 = v8;
  if ((flags & 4) != 0)
  {
    uint64_t v34 = PBHashBytes();
    if ((*(_WORD *)&self->_flags & 0x80) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    unint64_t v13 = 0;
    goto LABEL_24;
  }
  uint64_t v34 = 0;
  if ((flags & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  double navSessionRelativeTimestamp = self->_navSessionRelativeTimestamp;
  double v10 = -navSessionRelativeTimestamp;
  if (navSessionRelativeTimestamp >= 0.0) {
    double v10 = self->_navSessionRelativeTimestamp;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_24:
  unint64_t v33 = [(GEOLocalTime *)self->_eventTime hash];
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 0x200) != 0)
  {
    unint64_t v32 = 2654435761u * self->_sessionEpoch;
    if ((v14 & 0x20) != 0) {
      goto LABEL_26;
    }
LABEL_31:
    unint64_t v19 = 0;
    goto LABEL_34;
  }
  unint64_t v32 = 0;
  if ((v14 & 0x20) == 0) {
    goto LABEL_31;
  }
LABEL_26:
  double ageOfSessionIdInSeconds = self->_ageOfSessionIdInSeconds;
  double v16 = -ageOfSessionIdInSeconds;
  if (ageOfSessionIdInSeconds >= 0.0) {
    double v16 = self->_ageOfSessionIdInSeconds;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_34:
  if ((v14 & 8) == 0)
  {
    uint64_t v20 = 0;
    if ((v14 & 2) != 0) {
      goto LABEL_36;
    }
LABEL_42:
    uint64_t v21 = 0;
    if ((v14 & 0x40) != 0) {
      goto LABEL_37;
    }
LABEL_43:
    unint64_t v26 = 0;
    goto LABEL_46;
  }
  uint64_t v20 = PBHashBytes();
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 2) == 0) {
    goto LABEL_42;
  }
LABEL_36:
  uint64_t v21 = PBHashBytes();
  __int16 v14 = (__int16)self->_flags;
  if ((v14 & 0x40) == 0) {
    goto LABEL_43;
  }
LABEL_37:
  double lastIcloudSyncDate = self->_lastIcloudSyncDate;
  double v23 = -lastIcloudSyncDate;
  if (lastIcloudSyncDate >= 0.0) {
    double v23 = self->_lastIcloudSyncDate;
  }
  long double v24 = floor(v23 + 0.5);
  double v25 = (v23 - v24) * 1.84467441e19;
  unint64_t v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0) {
      v26 += (unint64_t)v25;
    }
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_46:
  if ((v14 & 0x1000) != 0)
  {
    uint64_t v27 = 2654435761 * self->_didPreviouslyRotate;
    if (v14)
    {
LABEL_48:
      uint64_t v28 = PBHashBytes();
      __int16 v14 = (__int16)self->_flags;
      if ((v14 & 0x800) != 0) {
        goto LABEL_49;
      }
LABEL_53:
      uint64_t v29 = 0;
      if ((v14 & 0x2000) != 0) {
        goto LABEL_50;
      }
LABEL_54:
      uint64_t v30 = 0;
      return v36 ^ v37 ^ v35 ^ v34 ^ v13 ^ v32 ^ v19 ^ v20 ^ v21 ^ v26 ^ v27 ^ v28 ^ v29 ^ v33 ^ v30;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if (v14) {
      goto LABEL_48;
    }
  }
  uint64_t v28 = 0;
  if ((v14 & 0x800) == 0) {
    goto LABEL_53;
  }
LABEL_49:
  uint64_t v29 = 2654435761 * self->_userCohortValue;
  if ((v14 & 0x2000) == 0) {
    goto LABEL_54;
  }
LABEL_50:
  uint64_t v30 = 2654435761 * self->_hasRotated;
  return v36 ^ v37 ^ v35 ^ v34 ^ v13 ^ v32 ^ v19 ^ v20 ^ v21 ^ v26 ^ v27 ^ v28 ^ v29 ^ v33 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  v9 = (char *)a3;
  [v9 readAll:0];
  id v4 = v9;
  __int16 v5 = *((_WORD *)v9 + 74);
  if ((v5 & 0x10) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v9 + 72);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v5 = *((_WORD *)v9 + 74);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((_WORD *)v9 + 74) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_sequenceNumber = *((_DWORD *)v9 + 34);
  *(_WORD *)&self->_flags |= 0x400u;
  __int16 v5 = *((_WORD *)v9 + 74);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double relativeTimestamp = *((double *)v9 + 15);
  *(_WORD *)&self->_flags |= 0x100u;
  __int16 v5 = *((_WORD *)v9 + 74);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_navSessionId = *(GEOSessionID *)(v9 + 40);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v9 + 74) & 0x80) != 0)
  {
LABEL_6:
    self->_double navSessionRelativeTimestamp = *((double *)v9 + 14);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_7:
  eventTime = self->_eventTime;
  uint64_t v7 = *((void *)v9 + 12);
  if (eventTime)
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[GEOLocalTime mergeFrom:](eventTime, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[GEOLogMsgStateUserSession setEventTime:](self, "setEventTime:");
  }
  id v4 = v9;
LABEL_18:
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x200) != 0)
  {
    self->_sessionEpoch = *((void *)v4 + 16);
    *(_WORD *)&self->_flags |= 0x200u;
    __int16 v8 = *((_WORD *)v4 + 74);
    if ((v8 & 0x20) == 0)
    {
LABEL_20:
      if ((v8 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  self->_double ageOfSessionIdInSeconds = *((double *)v4 + 11);
  *(_WORD *)&self->_flags |= 0x20u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 8) == 0)
  {
LABEL_21:
    if ((v8 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_preSyncSessionId = *(GEOSessionID *)(v4 + 56);
  *(_WORD *)&self->_flags |= 8u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 2) == 0)
  {
LABEL_22:
    if ((v8 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_initialDeviceSessionId = *(GEOSessionID *)(v4 + 24);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x40) == 0)
  {
LABEL_23:
    if ((v8 & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double lastIcloudSyncDate = *((double *)v4 + 13);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x1000) == 0)
  {
LABEL_24:
    if ((v8 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_didPreviouslyRotate = v4[144];
  *(_WORD *)&self->_flags |= 0x1000u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 1) == 0)
  {
LABEL_25:
    if ((v8 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_deviceLocalSessionId = *(GEOSessionID *)(v4 + 8);
  *(_WORD *)&self->_flags |= 1u;
  __int16 v8 = *((_WORD *)v4 + 74);
  if ((v8 & 0x800) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_38:
  self->_userCohortValue = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_flags |= 0x800u;
  if ((*((_WORD *)v4 + 74) & 0x2000) != 0)
  {
LABEL_27:
    self->_hasRotated = v4[145];
    *(_WORD *)&self->_flags |= 0x2000u;
  }
LABEL_28:
}

@end