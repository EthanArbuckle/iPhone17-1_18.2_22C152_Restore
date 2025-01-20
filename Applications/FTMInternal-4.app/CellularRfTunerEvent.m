@interface CellularRfTunerEvent
- (BOOL)hasElapsedMs;
- (BOOL)hasNewState;
- (BOOL)hasOldState;
- (BOOL)hasSubsId;
- (BOOL)hasTimeoutMs;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TunerState)oldState;
- (TunerState)thenewState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)elapsedMs;
- (unsigned)subsId;
- (unsigned)timeoutMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setElapsedMs:(unsigned int)a3;
- (void)setHasElapsedMs:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimeoutMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOldState:(id)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setThenewState:(id)a3;
- (void)setTimeoutMs:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularRfTunerEvent

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

- (BOOL)hasOldState
{
  return self->_oldState != 0;
}

- (BOOL)hasNewState
{
  return self->_thenewState != 0;
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasElapsedMs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeoutMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timeoutMs = a3;
}

- (void)setHasTimeoutMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeoutMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularRfTunerEvent;
  char v3 = [(CellularRfTunerEvent *)&v7 description];
  v4 = [(CellularRfTunerEvent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  oldState = self->_oldState;
  if (oldState)
  {
    v6 = [(TunerState *)oldState dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"old_state"];
  }
  thenewState = self->_thenewState;
  if (thenewState)
  {
    v8 = [(TunerState *)thenewState dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"new_state"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithUnsignedInt:self->_elapsedMs];
    [v3 setObject:v12 forKey:@"elapsed_ms"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v13 = +[NSNumber numberWithUnsignedInt:self->_timeoutMs];
  [v3 setObject:v13 forKey:@"timeout_ms"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    v10 = +[NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v10 forKey:@"subs_id"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100088924((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_oldState) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_thenewState) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  v6 = v4;
  if (self->_oldState)
  {
    [v4 setOldState:];
    v4 = v6;
  }
  if (self->_thenewState)
  {
    [v6 setThenewState:];
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_elapsedMs;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 11) = self->_timeoutMs;
  *((unsigned char *)v4 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 10) = self->_subsId;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(TunerState *)self->_oldState copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(TunerState *)self->_thenewState copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v6 + 11) = self->_timeoutMs;
    *((unsigned char *)v6 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v6;
    }
    goto LABEL_6;
  }
  *((_DWORD *)v6 + 4) = self->_elapsedMs;
  *((unsigned char *)v6 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((unsigned char *)v6 + 48) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_25:
    BOOL v7 = 0;
    goto LABEL_26;
  }
  oldState = self->_oldState;
  if ((unint64_t)oldState | *((void *)v4 + 4) && !-[TunerState isEqual:](oldState, "isEqual:")) {
    goto LABEL_25;
  }
  thenewState = self->_thenewState;
  if ((unint64_t)thenewState | *((void *)v4 + 3))
  {
    if (!-[TunerState isEqual:](thenewState, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_timeoutMs != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_25;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
    BOOL v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(TunerState *)self->_oldState hash];
  unint64_t v5 = [(TunerState *)self->_thenewState hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v6 = 2654435761 * self->_elapsedMs;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_timeoutMs;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[6])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  oldState = self->_oldState;
  uint64_t v7 = v5[4];
  v11 = v5;
  if (oldState)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[TunerState mergeFrom:](oldState, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CellularRfTunerEvent setOldState:](self, "setOldState:");
  }
  unint64_t v5 = v11;
LABEL_9:
  thenewState = self->_thenewState;
  uint64_t v9 = v5[3];
  if (thenewState)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[TunerState mergeFrom:](thenewState, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[CellularRfTunerEvent setThenewState:](self, "setThenewState:");
  }
  unint64_t v5 = v11;
LABEL_15:
  char v10 = *((unsigned char *)v5 + 48);
  if ((v10 & 2) != 0)
  {
    self->_elapsedMs = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v5 + 48);
    if ((v10 & 8) == 0)
    {
LABEL_17:
      if ((v10 & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v5[6] & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_timeoutMs = *((_DWORD *)v5 + 11);
  *(unsigned char *)&self->_has |= 8u;
  if ((v5[6] & 4) != 0)
  {
LABEL_18:
    self->_subsId = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_19:

  _objc_release_x1();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (TunerState)oldState
{
  return self->_oldState;
}

- (void)setOldState:(id)a3
{
}

- (TunerState)thenewState
{
  return self->_thenewState;
}

- (void)setThenewState:(id)a3
{
}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)timeoutMs
{
  return self->_timeoutMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldState, 0);

  objc_storeStrong((id *)&self->_thenewState, 0);
}

@end