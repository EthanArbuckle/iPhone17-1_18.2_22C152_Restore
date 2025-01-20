@interface LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent
- (BOOL)eventSucceeded;
- (BOOL)hasContextID;
- (BOOL)hasEventSucceeded;
- (BOOL)hasEventType;
- (BOOL)hasTimestamp;
- (BOOL)hasTrialIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (NSString)contextID;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextID:(id)a3;
- (void)setEventSucceeded:(BOOL)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventSucceeded:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setTrialIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent

- (BOOL)hasTrialIdentifiers
{
  return self->_trialIdentifiers != 0;
}

- (BOOL)hasContextID
{
  return self->_contextID != 0;
}

- (void)setTimestamp:(double)a3
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

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2653ADDC0[a3];
  }
  return v5;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"Unknown", v5, v6))
  {
    int v10 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"allocation", v8, v9))
  {
    int v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"activation", v12, v13))
  {
    int v10 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"deactivation", v15, v16))
  {
    int v10 = 3;
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)setEventSucceeded:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventSucceeded = a3;
}

- (void)setHasEventSucceeded:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventSucceeded
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent;
  uint64_t v4 = [(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEvent *)&v15 description];
  uint64_t v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  int v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  trialIdentifiers = self->_trialIdentifiers;
  if (trialIdentifiers)
  {
    uint64_t v12 = objc_msgSend_dictionaryRepresentation(trialIdentifiers, v6, v7, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v13, (uint64_t)v12, @"trialIdentifiers", v14);
  }
  contextID = self->_contextID;
  if (contextID) {
    objc_msgSend_setObject_forKey_(v10, v6, (uint64_t)contextID, @"contextID", v9);
  }
  char has = (char)self->_has;
  if (has)
  {
    v21 = objc_msgSend_numberWithDouble_(NSNumber, v6, (uint64_t)contextID, v8, v9, self->_timestamp);
    objc_msgSend_setObject_forKey_(v10, v22, (uint64_t)v21, @"timestamp", v23);

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  uint64_t eventType = self->_eventType;
  if (eventType >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v8, v9, self->_eventType);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_2653ADDC0[eventType];
  }
  objc_msgSend_setObject_forKey_(v10, v6, (uint64_t)v25, @"eventType", v9);

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  v17 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_eventSucceeded, v8, v9);
  objc_msgSend_setObject_forKey_(v10, v18, (uint64_t)v17, @"eventSucceeded", v19);

LABEL_9:
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialdEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_trialIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  id v11 = v4;
  if (trialIdentifiers)
  {
    objc_msgSend_setTrialIdentifiers_(v4, v5, (uint64_t)trialIdentifiers, v6, v7);
    id v4 = v11;
  }
  contextID = self->_contextID;
  if (contextID)
  {
    objc_msgSend_setContextID_(v11, v5, (uint64_t)contextID, v6, v7);
    id v4 = v11;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 6) = self->_eventType;
  *((unsigned char *)v4 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 40) = self->_eventSucceeded;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v15, (uint64_t)a3, v16, v17);
  uint64_t v19 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_contextID, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v23;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v14 + 24) = self->_eventType;
    *(unsigned char *)(v14 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v14;
    }
    goto LABEL_4;
  }
  *(double *)(v14 + 8) = self->_timestamp;
  *(unsigned char *)(v14 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v14 + 40) = self->_eventSucceeded;
    *(unsigned char *)(v14 + 44) |= 4u;
  }
  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)) {
    goto LABEL_18;
  }
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v13 = v4[4];
  if ((unint64_t)trialIdentifiers | v13)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v13, v10, v11)) {
      goto LABEL_18;
    }
  }
  contextID = self->_contextID;
  uint64_t v15 = v4[2];
  if ((unint64_t)contextID | v15)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v15, v10, v11)) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v16 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0)
    {
LABEL_18:
      BOOL v16 = 0;
      goto LABEL_19;
    }
    if (self->_eventSucceeded)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_18;
    }
    BOOL v16 = 1;
  }
LABEL_19:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_trialIdentifiers, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_contextID, v7, v8, v9, v10);
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v15 = -timestamp;
    if (timestamp >= 0.0) {
      double v15 = self->_timestamp;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v18 = 2654435761 * self->_eventType;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v19 = 0;
    return v11 ^ v6 ^ v13 ^ v18 ^ v19;
  }
  uint64_t v18 = 0;
  if ((has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v19 = 2654435761 * self->_eventSucceeded;
  return v11 ^ v6 ^ v13 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v8 = *((void *)v4 + 4);
  id v11 = v4;
  if (trialIdentifiers)
  {
    if (!v8) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(trialIdentifiers, (const char *)v4, v8, v5, v6);
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    objc_msgSend_setTrialIdentifiers_(self, (const char *)v4, v8, v5, v6);
  }
  id v4 = v11;
LABEL_7:
  uint64_t v9 = *((void *)v4 + 2);
  if (v9)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v9, v5, v6);
    id v4 = v11;
  }
  char v10 = *((unsigned char *)v4 + 44);
  if (v10)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)v4 + 44);
    if ((v10 & 2) == 0)
    {
LABEL_11:
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_uint64_t eventType = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_12:
    self->_eventSucceeded = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_13:
  MEMORY[0x270F9A758]();
}

- (LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (void)setTrialIdentifiers:(id)a3
{
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)eventSucceeded
{
  return self->_eventSucceeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end