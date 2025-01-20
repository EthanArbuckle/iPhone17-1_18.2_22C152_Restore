@interface LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent
- (BOOL)hasActivityScheduleStatus;
- (BOOL)hasContextID;
- (BOOL)hasTaskCompleted;
- (BOOL)hasTaskFetched;
- (BOOL)hasTaskScheduled;
- (BOOL)hasTimestamp;
- (BOOL)hasTrialIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (LIGHTHOUSE_BITACORA_PROTOScheduleStatus)activityScheduleStatus;
- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskCompleted;
- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskFetched;
- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskScheduled;
- (NSString)contextID;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityScheduleStatus:(id)a3;
- (void)setContextID:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTaskCompleted:(id)a3;
- (void)setTaskFetched:(id)a3;
- (void)setTaskScheduled:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTrialIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent

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

- (BOOL)hasActivityScheduleStatus
{
  return self->_activityScheduleStatus != 0;
}

- (BOOL)hasTaskFetched
{
  return self->_taskFetched != 0;
}

- (BOOL)hasTaskScheduled
{
  return self->_taskScheduled != 0;
}

- (BOOL)hasTaskCompleted
{
  return self->_taskCompleted != 0;
}

- (id)description
{
  v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent;
  v4 = [(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEvent *)&v15 description];
  v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
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
  if (*(unsigned char *)&self->_has)
  {
    v16 = objc_msgSend_numberWithDouble_(NSNumber, v6, (uint64_t)contextID, v8, v9, self->_timestamp);
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, @"timestamp", v18);
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  if (activityScheduleStatus)
  {
    v20 = objc_msgSend_dictionaryRepresentation(activityScheduleStatus, v6, (uint64_t)contextID, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v21, (uint64_t)v20, @"activityScheduleStatus", v22);
  }
  taskFetched = self->_taskFetched;
  if (taskFetched)
  {
    v24 = objc_msgSend_dictionaryRepresentation(taskFetched, v6, (uint64_t)contextID, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v24, @"taskFetched", v26);
  }
  taskScheduled = self->_taskScheduled;
  if (taskScheduled)
  {
    v28 = objc_msgSend_dictionaryRepresentation(taskScheduled, v6, (uint64_t)contextID, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v29, (uint64_t)v28, @"taskScheduled", v30);
  }
  taskCompleted = self->_taskCompleted;
  if (taskCompleted)
  {
    v32 = objc_msgSend_dictionaryRepresentation(taskCompleted, v6, (uint64_t)contextID, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v33, (uint64_t)v32, @"taskCompleted", v34);
  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerMlruntimedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_trialIdentifiers)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_contextID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_activityScheduleStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_taskFetched)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_taskScheduled)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_taskCompleted)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  id v14 = v4;
  if (trialIdentifiers)
  {
    objc_msgSend_setTrialIdentifiers_(v4, v5, (uint64_t)trialIdentifiers, v6, v7);
    id v4 = v14;
  }
  contextID = self->_contextID;
  if (contextID)
  {
    objc_msgSend_setContextID_(v14, v5, (uint64_t)contextID, v6, v7);
    id v4 = v14;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  if (activityScheduleStatus)
  {
    objc_msgSend_setActivityScheduleStatus_(v14, v5, (uint64_t)activityScheduleStatus, v6, v7);
    id v4 = v14;
  }
  taskFetched = self->_taskFetched;
  if (taskFetched)
  {
    objc_msgSend_setTaskFetched_(v14, v5, (uint64_t)taskFetched, v6, v7);
    id v4 = v14;
  }
  taskScheduled = self->_taskScheduled;
  if (taskScheduled)
  {
    objc_msgSend_setTaskScheduled_(v14, v5, (uint64_t)taskScheduled, v6, v7);
    id v4 = v14;
  }
  taskCompleted = self->_taskCompleted;
  if (taskCompleted)
  {
    objc_msgSend_setTaskCompleted_(v14, v5, (uint64_t)taskCompleted, v6, v7);
    id v4 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v15, (uint64_t)a3, v16, v17);
  v19 = *(void **)(v14 + 56);
  *(void *)(v14 + 56) = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_contextID, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v23;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v14 + 8) = self->_timestamp;
    *(unsigned char *)(v14 + 64) |= 1u;
  }
  uint64_t v28 = objc_msgSend_copyWithZone_(self->_activityScheduleStatus, v25, (uint64_t)a3, v26, v27);
  v29 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v28;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_taskFetched, v30, (uint64_t)a3, v31, v32);
  uint64_t v34 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v33;

  uint64_t v38 = objc_msgSend_copyWithZone_(self->_taskScheduled, v35, (uint64_t)a3, v36, v37);
  v39 = *(void **)(v14 + 48);
  *(void *)(v14 + 48) = v38;

  uint64_t v43 = objc_msgSend_copyWithZone_(self->_taskCompleted, v40, (uint64_t)a3, v41, v42);
  v44 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v43;

  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)) {
    goto LABEL_19;
  }
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v13 = v4[7];
  if ((unint64_t)trialIdentifiers | v13)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v13, v10, v11)) {
      goto LABEL_19;
    }
  }
  contextID = self->_contextID;
  uint64_t v15 = v4[3];
  if ((unint64_t)contextID | v15)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v15, v10, v11)) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[8] & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (v4[8])
  {
LABEL_19:
    char isEqual = 0;
    goto LABEL_20;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  uint64_t v17 = v4[2];
  if ((unint64_t)activityScheduleStatus | v17
    && !objc_msgSend_isEqual_(activityScheduleStatus, v9, v17, v10, v11))
  {
    goto LABEL_19;
  }
  taskFetched = self->_taskFetched;
  uint64_t v19 = v4[5];
  if ((unint64_t)taskFetched | v19)
  {
    if (!objc_msgSend_isEqual_(taskFetched, v9, v19, v10, v11)) {
      goto LABEL_19;
    }
  }
  taskScheduled = self->_taskScheduled;
  uint64_t v21 = v4[6];
  if ((unint64_t)taskScheduled | v21)
  {
    if (!objc_msgSend_isEqual_(taskScheduled, v9, v21, v10, v11)) {
      goto LABEL_19;
    }
  }
  taskCompleted = self->_taskCompleted;
  uint64_t v23 = v4[4];
  if ((unint64_t)taskCompleted | v23) {
    char isEqual = objc_msgSend_isEqual_(taskCompleted, v9, v23, v10, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_20:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_trialIdentifiers, a2, v2, v3, v4);
  uint64_t v15 = objc_msgSend_hash(self->_contextID, v7, v8, v9, v10);
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v18 = -timestamp;
    if (timestamp >= 0.0) {
      double v18 = self->_timestamp;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  uint64_t v21 = v15 ^ v6 ^ v16 ^ objc_msgSend_hash(self->_activityScheduleStatus, v11, v12, v13, v14);
  uint64_t v26 = objc_msgSend_hash(self->_taskFetched, v22, v23, v24, v25);
  uint64_t v31 = v26 ^ objc_msgSend_hash(self->_taskScheduled, v27, v28, v29, v30);
  return v21 ^ v31 ^ objc_msgSend_hash(self->_taskCompleted, v32, v33, v34, v35);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v8 = *((void *)v4 + 7);
  id v18 = v4;
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
  id v4 = v18;
LABEL_7:
  uint64_t v9 = *((void *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v9, v5, v6);
    id v4 = v18;
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  activityScheduleStatus = self->_activityScheduleStatus;
  uint64_t v11 = *((void *)v4 + 2);
  if (activityScheduleStatus)
  {
    if (!v11) {
      goto LABEL_17;
    }
    objc_msgSend_mergeFrom_(activityScheduleStatus, (const char *)v4, v11, v5, v6);
  }
  else
  {
    if (!v11) {
      goto LABEL_17;
    }
    objc_msgSend_setActivityScheduleStatus_(self, (const char *)v4, v11, v5, v6);
  }
  id v4 = v18;
LABEL_17:
  taskFetched = self->_taskFetched;
  uint64_t v13 = *((void *)v4 + 5);
  if (taskFetched)
  {
    if (!v13) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(taskFetched, (const char *)v4, v13, v5, v6);
  }
  else
  {
    if (!v13) {
      goto LABEL_23;
    }
    objc_msgSend_setTaskFetched_(self, (const char *)v4, v13, v5, v6);
  }
  id v4 = v18;
LABEL_23:
  taskScheduled = self->_taskScheduled;
  uint64_t v15 = *((void *)v4 + 6);
  if (taskScheduled)
  {
    if (!v15) {
      goto LABEL_29;
    }
    objc_msgSend_mergeFrom_(taskScheduled, (const char *)v4, v15, v5, v6);
  }
  else
  {
    if (!v15) {
      goto LABEL_29;
    }
    objc_msgSend_setTaskScheduled_(self, (const char *)v4, v15, v5, v6);
  }
  id v4 = v18;
LABEL_29:
  taskCompleted = self->_taskCompleted;
  uint64_t v17 = *((void *)v4 + 4);
  if (taskCompleted)
  {
    if (v17) {
      objc_msgSend_mergeFrom_(taskCompleted, (const char *)v4, v17, v5, v6);
    }
  }
  else if (v17)
  {
    objc_msgSend_setTaskCompleted_(self, (const char *)v4, v17, v5, v6);
  }
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

- (LIGHTHOUSE_BITACORA_PROTOScheduleStatus)activityScheduleStatus
{
  return self->_activityScheduleStatus;
}

- (void)setActivityScheduleStatus:(id)a3
{
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskFetched
{
  return self->_taskFetched;
}

- (void)setTaskFetched:(id)a3
{
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskScheduled
{
  return self->_taskScheduled;
}

- (void)setTaskScheduled:(id)a3
{
}

- (LIGHTHOUSE_BITACORA_PROTOTaskEvent)taskCompleted
{
  return self->_taskCompleted;
}

- (void)setTaskCompleted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_taskScheduled, 0);
  objc_storeStrong((id *)&self->_taskFetched, 0);
  objc_storeStrong((id *)&self->_taskCompleted, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_activityScheduleStatus, 0);
}

@end