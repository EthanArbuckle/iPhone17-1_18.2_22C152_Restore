@interface LIGHTHOUSE_BITACORA_PROTOBitacoraState
- (BOOL)hasCountCustomTargetting;
- (BOOL)hasCountCustomTargettingMet;
- (BOOL)hasCountGeneralTargetting;
- (BOOL)hasCountGeneralTargettingMet;
- (BOOL)hasCountPerformTaskFailed;
- (BOOL)hasCountPerformTaskSucceeded;
- (BOOL)hasCountStopFailed;
- (BOOL)hasCountStopSucceeded;
- (BOOL)hasCountTaskCompletedFailed;
- (BOOL)hasCountTaskCompletedSucceeded;
- (BOOL)hasCountTaskFetchedFailed;
- (BOOL)hasCountTaskFetchedSucceeded;
- (BOOL)hasCountTaskScheduledFailed;
- (BOOL)hasCountTaskScheduledSucceeded;
- (BOOL)hasIsActivated;
- (BOOL)hasIsAllocated;
- (BOOL)hasTrialDeploymentID;
- (BOOL)hasTrialExperimentID;
- (BOOL)hasTrialIdentifierType;
- (BOOL)hasTrialTaskID;
- (BOOL)hasTrialTreatmentID;
- (BOOL)isActivated;
- (BOOL)isAllocated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers)trialIdentifiers;
- (NSString)contextID;
- (NSString)telemetryID;
- (NSString)trialDeploymentID;
- (NSString)trialExperimentID;
- (NSString)trialTaskID;
- (NSString)trialTreatmentID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trialIdentifierTypeAsString:(int)a3;
- (int)StringAsTrialIdentifierType:(id)a3;
- (int)trialIdentifierType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)countCustomTargetting;
- (unsigned)countCustomTargettingMet;
- (unsigned)countGeneralTargetting;
- (unsigned)countGeneralTargettingMet;
- (unsigned)countPerformTaskFailed;
- (unsigned)countPerformTaskSucceeded;
- (unsigned)countStopFailed;
- (unsigned)countStopSucceeded;
- (unsigned)countTaskCompletedFailed;
- (unsigned)countTaskCompletedSucceeded;
- (unsigned)countTaskFetchedFailed;
- (unsigned)countTaskFetchedSucceeded;
- (unsigned)countTaskScheduledFailed;
- (unsigned)countTaskScheduledSucceeded;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextID:(id)a3;
- (void)setCountCustomTargetting:(unsigned int)a3;
- (void)setCountCustomTargettingMet:(unsigned int)a3;
- (void)setCountGeneralTargetting:(unsigned int)a3;
- (void)setCountGeneralTargettingMet:(unsigned int)a3;
- (void)setCountPerformTaskFailed:(unsigned int)a3;
- (void)setCountPerformTaskSucceeded:(unsigned int)a3;
- (void)setCountStopFailed:(unsigned int)a3;
- (void)setCountStopSucceeded:(unsigned int)a3;
- (void)setCountTaskCompletedFailed:(unsigned int)a3;
- (void)setCountTaskCompletedSucceeded:(unsigned int)a3;
- (void)setCountTaskFetchedFailed:(unsigned int)a3;
- (void)setCountTaskFetchedSucceeded:(unsigned int)a3;
- (void)setCountTaskScheduledFailed:(unsigned int)a3;
- (void)setCountTaskScheduledSucceeded:(unsigned int)a3;
- (void)setHasCountCustomTargetting:(BOOL)a3;
- (void)setHasCountCustomTargettingMet:(BOOL)a3;
- (void)setHasCountGeneralTargetting:(BOOL)a3;
- (void)setHasCountGeneralTargettingMet:(BOOL)a3;
- (void)setHasCountPerformTaskFailed:(BOOL)a3;
- (void)setHasCountPerformTaskSucceeded:(BOOL)a3;
- (void)setHasCountStopFailed:(BOOL)a3;
- (void)setHasCountStopSucceeded:(BOOL)a3;
- (void)setHasCountTaskCompletedFailed:(BOOL)a3;
- (void)setHasCountTaskCompletedSucceeded:(BOOL)a3;
- (void)setHasCountTaskFetchedFailed:(BOOL)a3;
- (void)setHasCountTaskFetchedSucceeded:(BOOL)a3;
- (void)setHasCountTaskScheduledFailed:(BOOL)a3;
- (void)setHasCountTaskScheduledSucceeded:(BOOL)a3;
- (void)setHasIsActivated:(BOOL)a3;
- (void)setHasIsAllocated:(BOOL)a3;
- (void)setHasTrialIdentifierType:(BOOL)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setIsAllocated:(BOOL)a3;
- (void)setTelemetryID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrialDeploymentID:(id)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialIdentifierType:(int)a3;
- (void)setTrialIdentifiers:(id)a3;
- (void)setTrialTaskID:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation LIGHTHOUSE_BITACORA_PROTOBitacoraState

- (void)setIsAllocated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isAllocated = a3;
}

- (void)setHasIsAllocated:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsAllocated
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsActivated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isActivated = a3;
}

- (void)setHasIsActivated:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsActivated
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountGeneralTargetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_countGeneralTargetting = a3;
}

- (void)setHasCountGeneralTargetting:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCountGeneralTargetting
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCountGeneralTargettingMet:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_countGeneralTargettingMet = a3;
}

- (void)setHasCountGeneralTargettingMet:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCountGeneralTargettingMet
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCountCustomTargetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_countCustomTargetting = a3;
}

- (void)setHasCountCustomTargetting:(BOOL)a3
{
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCountCustomTargetting
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCountCustomTargettingMet:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_countCustomTargettingMet = a3;
}

- (void)setHasCountCustomTargettingMet:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCountCustomTargettingMet
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCountTaskFetchedSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_countTaskFetchedSucceeded = a3;
}

- (void)setHasCountTaskFetchedSucceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasCountTaskFetchedSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCountTaskFetchedFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_countTaskFetchedFailed = a3;
}

- (void)setHasCountTaskFetchedFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasCountTaskFetchedFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCountTaskScheduledSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_countTaskScheduledSucceeded = a3;
}

- (void)setHasCountTaskScheduledSucceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasCountTaskScheduledSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCountTaskScheduledFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_countTaskScheduledFailed = a3;
}

- (void)setHasCountTaskScheduledFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasCountTaskScheduledFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCountTaskCompletedSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_countTaskCompletedSucceeded = a3;
}

- (void)setHasCountTaskCompletedSucceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCountTaskCompletedSucceeded
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCountTaskCompletedFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_countTaskCompletedFailed = a3;
}

- (void)setHasCountTaskCompletedFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCountTaskCompletedFailed
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCountPerformTaskSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_countPerformTaskSucceeded = a3;
}

- (void)setHasCountPerformTaskSucceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCountPerformTaskSucceeded
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCountPerformTaskFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_countPerformTaskFailed = a3;
}

- (void)setHasCountPerformTaskFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasCountPerformTaskFailed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCountStopSucceeded:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_countStopSucceeded = a3;
}

- (void)setHasCountStopSucceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCountStopSucceeded
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCountStopFailed:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_countStopFailed = a3;
}

- (void)setHasCountStopFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCountStopFailed
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)trialIdentifierType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_trialIdentifierType;
  }
  else {
    return 0;
  }
}

- (void)setTrialIdentifierType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_trialIdentifierType = a3;
}

- (void)setHasTrialIdentifierType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($2E176B132DAEB8AB2524947CF859ECFE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTrialIdentifierType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)trialIdentifierTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2653ADDE0[a3];
  }
  return v5;
}

- (int)StringAsTrialIdentifierType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"Unknown", v5, v6))
  {
    int v10 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"experiment", v8, v9))
  {
    int v10 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"BMLT", v12, v13))
  {
    int v10 = 2;
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (BOOL)hasTrialExperimentID
{
  return self->_trialExperimentID != 0;
}

- (BOOL)hasTrialDeploymentID
{
  return self->_trialDeploymentID != 0;
}

- (BOOL)hasTrialTreatmentID
{
  return self->_trialTreatmentID != 0;
}

- (BOOL)hasTrialTaskID
{
  return self->_trialTaskID != 0;
}

- (id)description
{
  id v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)LIGHTHOUSE_BITACORA_PROTOBitacoraState;
  uint64_t v4 = [(LIGHTHOUSE_BITACORA_PROTOBitacoraState *)&v15 description];
  uint64_t v9 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v3, v10, @"%@ %@", v11, v12, v4, v9);

  return v13;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  int v10 = v6;
  telemetryID = self->_telemetryID;
  if (telemetryID) {
    objc_msgSend_setObject_forKey_(v6, v7, (uint64_t)telemetryID, @"telemetryID", v9);
  }
  trialIdentifiers = self->_trialIdentifiers;
  if (trialIdentifiers)
  {
    uint64_t v13 = objc_msgSend_dictionaryRepresentation(trialIdentifiers, v7, (uint64_t)telemetryID, v8, v9);
    objc_msgSend_setObject_forKey_(v10, v14, (uint64_t)v13, @"trialIdentifiers", v15);
  }
  contextID = self->_contextID;
  if (contextID) {
    objc_msgSend_setObject_forKey_(v10, v7, (uint64_t)contextID, @"contextID", v9);
  }
  v17 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, self->_timestamp, v8, v9);
  objc_msgSend_setObject_forKey_(v10, v18, (uint64_t)v17, @"timestamp", v19);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v24 = objc_msgSend_numberWithBool_(NSNumber, v20, self->_isAllocated, v21, v22);
    objc_msgSend_setObject_forKey_(v10, v25, (uint64_t)v24, @"isAllocated", v26);

    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_9;
  }
  v27 = objc_msgSend_numberWithBool_(NSNumber, v20, self->_isActivated, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v28, (uint64_t)v27, @"isActivated", v29);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v30 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countGeneralTargetting, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v31, (uint64_t)v30, @"countGeneralTargetting", v32);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v33 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countGeneralTargettingMet, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v34, (uint64_t)v33, @"countGeneralTargettingMet", v35);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v36 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countCustomTargetting, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v37, (uint64_t)v36, @"countCustomTargetting", v38);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v39 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countCustomTargettingMet, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v40, (uint64_t)v39, @"countCustomTargettingMet", v41);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  v42 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskFetchedSucceeded, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v43, (uint64_t)v42, @"countTaskFetchedSucceeded", v44);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  v45 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskFetchedFailed, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v46, (uint64_t)v45, @"countTaskFetchedFailed", v47);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_34;
  }
LABEL_33:
  v48 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskScheduledSucceeded, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v49, (uint64_t)v48, @"countTaskScheduledSucceeded", v50);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
LABEL_34:
  v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskScheduledFailed, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v52, (uint64_t)v51, @"countTaskScheduledFailed", v53);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_36;
  }
LABEL_35:
  v54 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskCompletedSucceeded, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v55, (uint64_t)v54, @"countTaskCompletedSucceeded", v56);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_37;
  }
LABEL_36:
  v57 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countTaskCompletedFailed, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v58, (uint64_t)v57, @"countTaskCompletedFailed", v59);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_38;
  }
LABEL_37:
  v60 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countPerformTaskSucceeded, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v61, (uint64_t)v60, @"countPerformTaskSucceeded", v62);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_39;
  }
LABEL_38:
  v63 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countPerformTaskFailed, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v64, (uint64_t)v63, @"countPerformTaskFailed", v65);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_40;
  }
LABEL_39:
  v66 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countStopSucceeded, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v67, (uint64_t)v66, @"countStopSucceeded", v68);

  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
LABEL_40:
  v69 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, self->_countStopFailed, v21, v22);
  objc_msgSend_setObject_forKey_(v10, v70, (uint64_t)v69, @"countStopFailed", v71);

  if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t trialIdentifierType = self->_trialIdentifierType;
  if (trialIdentifierType >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, v20, @"(unknown: %i)", v21, v22, self->_trialIdentifierType);
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = off_2653ADDE0[trialIdentifierType];
  }
  objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)v73, @"trialIdentifierType", v22);

LABEL_45:
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID) {
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialExperimentID, @"trialExperimentID", v22);
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID) {
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialDeploymentID, @"trialDeploymentID", v22);
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID) {
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialTreatmentID, @"trialTreatmentID", v22);
  }
  trialTaskID = self->_trialTaskID;
  if (trialTaskID) {
    objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)trialTaskID, @"trialTaskID", v22);
  }
  return v10;
}

- (BOOL)readFrom:(id)a3
{
  return LIGHTHOUSE_BITACORA_PROTOBitacoraStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_telemetryID) {
    sub_2545862E8();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (!self->_trialIdentifiers) {
    sub_254586314();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_contextID) {
    sub_254586340();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  }
  uint64_t v6 = v7;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
    if ((*(unsigned char *)&has & 8) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_23:
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
LABEL_24:
  if (self->_trialExperimentID)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v7;
  }
  if (self->_trialDeploymentID)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v7;
  }
  if (self->_trialTreatmentID)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v7;
  }
  if (self->_trialTaskID)
  {
    PBDataWriterWriteStringField();
    uint64_t v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v22 = a3;
  objc_msgSend_setTelemetryID_(v22, v4, (uint64_t)self->_telemetryID, v5, v6);
  objc_msgSend_setTrialIdentifiers_(v22, v7, (uint64_t)self->_trialIdentifiers, v8, v9);
  objc_msgSend_setContextID_(v22, v10, (uint64_t)self->_contextID, v11, v12);
  v16 = v22;
  *((void *)v22 + 1) = self->_timestamp;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *((unsigned char *)v22 + 137) = self->_isAllocated;
    *((_DWORD *)v22 + 35) |= 0x10000u;
    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v22 + 136) = self->_isActivated;
  *((_DWORD *)v22 + 35) |= 0x8000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v22 + 8) = self->_countGeneralTargetting;
  *((_DWORD *)v22 + 35) |= 4u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v22 + 9) = self->_countGeneralTargettingMet;
  *((_DWORD *)v22 + 35) |= 8u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v22 + 6) = self->_countCustomTargetting;
  *((_DWORD *)v22 + 35) |= 1u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v22 + 7) = self->_countCustomTargettingMet;
  *((_DWORD *)v22 + 35) |= 2u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v22 + 17) = self->_countTaskFetchedSucceeded;
  *((_DWORD *)v22 + 35) |= 0x800u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v22 + 16) = self->_countTaskFetchedFailed;
  *((_DWORD *)v22 + 35) |= 0x400u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v22 + 19) = self->_countTaskScheduledSucceeded;
  *((_DWORD *)v22 + 35) |= 0x2000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v22 + 18) = self->_countTaskScheduledFailed;
  *((_DWORD *)v22 + 35) |= 0x1000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v22 + 15) = self->_countTaskCompletedSucceeded;
  *((_DWORD *)v22 + 35) |= 0x200u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v22 + 14) = self->_countTaskCompletedFailed;
  *((_DWORD *)v22 + 35) |= 0x100u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v22 + 11) = self->_countPerformTaskSucceeded;
  *((_DWORD *)v22 + 35) |= 0x20u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v22 + 10) = self->_countPerformTaskFailed;
  *((_DWORD *)v22 + 35) |= 0x10u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v22 + 13) = self->_countStopSucceeded;
  *((_DWORD *)v22 + 35) |= 0x80u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_45:
  *((_DWORD *)v22 + 12) = self->_countStopFailed;
  *((_DWORD *)v22 + 35) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *((_DWORD *)v22 + 26) = self->_trialIdentifierType;
    *((_DWORD *)v22 + 35) |= 0x4000u;
  }
LABEL_19:
  trialExperimentID = self->_trialExperimentID;
  if (trialExperimentID)
  {
    objc_msgSend_setTrialExperimentID_(v22, v13, (uint64_t)trialExperimentID, v14, v15);
    v16 = v22;
  }
  trialDeploymentID = self->_trialDeploymentID;
  if (trialDeploymentID)
  {
    objc_msgSend_setTrialDeploymentID_(v22, v13, (uint64_t)trialDeploymentID, v14, v15);
    v16 = v22;
  }
  trialTreatmentID = self->_trialTreatmentID;
  if (trialTreatmentID)
  {
    objc_msgSend_setTrialTreatmentID_(v22, v13, (uint64_t)trialTreatmentID, v14, v15);
    v16 = v22;
  }
  trialTaskID = self->_trialTaskID;
  if (trialTaskID)
  {
    objc_msgSend_setTrialTaskID_(v22, v13, (uint64_t)trialTaskID, v14, v15);
    v16 = v22;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  uint64_t v14 = objc_msgSend_init(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_telemetryID, v15, (uint64_t)a3, v16, v17);
  uint64_t v19 = *(void **)(v14 + 80);
  *(void *)(v14 + 80) = v18;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_trialIdentifiers, v20, (uint64_t)a3, v21, v22);
  v24 = *(void **)(v14 + 112);
  *(void *)(v14 + 112) = v23;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_contextID, v25, (uint64_t)a3, v26, v27);
  uint64_t v29 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v28;

  *(void *)(v14 + 8) = self->_timestamp;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(unsigned char *)(v14 + 137) = self->_isAllocated;
    *(_DWORD *)(v14 + 140) |= 0x10000u;
    $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
    if ((*(_WORD *)&has & 0x8000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x8000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v14 + 136) = self->_isActivated;
  *(_DWORD *)(v14 + 140) |= 0x8000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v14 + 32) = self->_countGeneralTargetting;
  *(_DWORD *)(v14 + 140) |= 4u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v14 + 36) = self->_countGeneralTargettingMet;
  *(_DWORD *)(v14 + 140) |= 8u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v14 + 24) = self->_countCustomTargetting;
  *(_DWORD *)(v14 + 140) |= 1u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v14 + 28) = self->_countCustomTargettingMet;
  *(_DWORD *)(v14 + 140) |= 2u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v14 + 68) = self->_countTaskFetchedSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x800u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v14 + 64) = self->_countTaskFetchedFailed;
  *(_DWORD *)(v14 + 140) |= 0x400u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v14 + 76) = self->_countTaskScheduledSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x2000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v14 + 72) = self->_countTaskScheduledFailed;
  *(_DWORD *)(v14 + 140) |= 0x1000u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v14 + 60) = self->_countTaskCompletedSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x200u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v14 + 56) = self->_countTaskCompletedFailed;
  *(_DWORD *)(v14 + 140) |= 0x100u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v14 + 44) = self->_countPerformTaskSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x20u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v14 + 40) = self->_countPerformTaskFailed;
  *(_DWORD *)(v14 + 140) |= 0x10u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
LABEL_35:
    *(_DWORD *)(v14 + 48) = self->_countStopFailed;
    *(_DWORD *)(v14 + 140) |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_34:
  *(_DWORD *)(v14 + 52) = self->_countStopSucceeded;
  *(_DWORD *)(v14 + 140) |= 0x80u;
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) != 0) {
    goto LABEL_35;
  }
LABEL_17:
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_18:
    *(_DWORD *)(v14 + 104) = self->_trialIdentifierType;
    *(_DWORD *)(v14 + 140) |= 0x4000u;
  }
LABEL_19:
  uint64_t v34 = objc_msgSend_copyWithZone_(self->_trialExperimentID, v30, (uint64_t)a3, v31, v32);
  uint64_t v35 = *(void **)(v14 + 96);
  *(void *)(v14 + 96) = v34;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_trialDeploymentID, v36, (uint64_t)a3, v37, v38);
  v40 = *(void **)(v14 + 88);
  *(void *)(v14 + 88) = v39;

  uint64_t v44 = objc_msgSend_copyWithZone_(self->_trialTreatmentID, v41, (uint64_t)a3, v42, v43);
  v45 = *(void **)(v14 + 128);
  *(void *)(v14 + 128) = v44;

  uint64_t v49 = objc_msgSend_copyWithZone_(self->_trialTaskID, v46, (uint64_t)a3, v47, v48);
  uint64_t v50 = *(void **)(v14 + 120);
  *(void *)(v14 + 120) = v49;

  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7, v8)) {
    goto LABEL_108;
  }
  telemetryID = self->_telemetryID;
  uint64_t v13 = v4[10];
  if ((unint64_t)telemetryID | v13)
  {
    if (!objc_msgSend_isEqual_(telemetryID, v9, v13, v10, v11)) {
      goto LABEL_108;
    }
  }
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v15 = v4[14];
  if ((unint64_t)trialIdentifiers | v15)
  {
    if (!objc_msgSend_isEqual_(trialIdentifiers, v9, v15, v10, v11)) {
      goto LABEL_108;
    }
  }
  contextID = self->_contextID;
  uint64_t v17 = v4[2];
  if ((unint64_t)contextID | v17)
  {
    if (!objc_msgSend_isEqual_(contextID, v9, v17, v10, v11)) {
      goto LABEL_108;
    }
  }
  if (self->_timestamp != v4[1]) {
    goto LABEL_108;
  }
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  int v19 = *((_DWORD *)v4 + 35);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0) {
      goto LABEL_108;
    }
    if (self->_isAllocated)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_108;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) != 0)
    {
      if (self->_isActivated)
      {
        if (!*((unsigned char *)v4 + 136)) {
          goto LABEL_108;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_25;
      }
    }
LABEL_108:
    char isEqual = 0;
    goto LABEL_109;
  }
  if ((v19 & 0x8000) != 0) {
    goto LABEL_108;
  }
LABEL_25:
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_countGeneralTargetting != *((_DWORD *)v4 + 8)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_countGeneralTargettingMet != *((_DWORD *)v4 + 9)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_108;
  }
  if (*(unsigned char *)&has)
  {
    if ((v19 & 1) == 0 || self->_countCustomTargetting != *((_DWORD *)v4 + 6)) {
      goto LABEL_108;
    }
  }
  else if (v19)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_countCustomTargettingMet != *((_DWORD *)v4 + 7)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0 || self->_countTaskFetchedSucceeded != *((_DWORD *)v4 + 17)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0 || self->_countTaskFetchedFailed != *((_DWORD *)v4 + 16)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_countTaskScheduledSucceeded != *((_DWORD *)v4 + 19)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_countTaskScheduledFailed != *((_DWORD *)v4 + 18)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_countTaskCompletedSucceeded != *((_DWORD *)v4 + 15)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v19 & 0x100) == 0 || self->_countTaskCompletedFailed != *((_DWORD *)v4 + 14)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x100) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_countPerformTaskSucceeded != *((_DWORD *)v4 + 11)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_countPerformTaskFailed != *((_DWORD *)v4 + 10)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_countStopSucceeded != *((_DWORD *)v4 + 13)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_108;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0 || self->_countStopFailed != *((_DWORD *)v4 + 12)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_108;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v19 & 0x4000) == 0 || self->_trialIdentifierType != *((_DWORD *)v4 + 26)) {
      goto LABEL_108;
    }
  }
  else if ((v19 & 0x4000) != 0)
  {
    goto LABEL_108;
  }
  trialExperimentID = self->_trialExperimentID;
  uint64_t v21 = v4[12];
  if ((unint64_t)trialExperimentID | v21
    && !objc_msgSend_isEqual_(trialExperimentID, v9, v21, v10, v11))
  {
    goto LABEL_108;
  }
  trialDeploymentID = self->_trialDeploymentID;
  uint64_t v23 = v4[11];
  if ((unint64_t)trialDeploymentID | v23)
  {
    if (!objc_msgSend_isEqual_(trialDeploymentID, v9, v23, v10, v11)) {
      goto LABEL_108;
    }
  }
  trialTreatmentID = self->_trialTreatmentID;
  uint64_t v25 = v4[16];
  if ((unint64_t)trialTreatmentID | v25)
  {
    if (!objc_msgSend_isEqual_(trialTreatmentID, v9, v25, v10, v11)) {
      goto LABEL_108;
    }
  }
  trialTaskID = self->_trialTaskID;
  uint64_t v27 = v4[15];
  if ((unint64_t)trialTaskID | v27) {
    char isEqual = objc_msgSend_isEqual_(trialTaskID, v9, v27, v10, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_109:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_telemetryID, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_trialIdentifiers, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_hash(self->_contextID, v12, v13, v14, v15);
  $2E176B132DAEB8AB2524947CF859ECFE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t v18 = 2654435761 * self->_isAllocated;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      uint64_t v19 = 2654435761 * self->_isActivated;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v20 = 2654435761 * self->_countGeneralTargetting;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v21 = 2654435761 * self->_countGeneralTargettingMet;
    if (*(unsigned char *)&has) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v21 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_6:
    uint64_t v22 = 2654435761 * self->_countCustomTargetting;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_7:
    uint64_t v23 = 2654435761 * self->_countCustomTargettingMet;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_8:
    uint64_t v24 = 2654435761 * self->_countTaskFetchedSucceeded;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v25 = 2654435761 * self->_countTaskFetchedFailed;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_10:
    uint64_t v26 = 2654435761 * self->_countTaskScheduledSucceeded;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_11:
    uint64_t v27 = 2654435761 * self->_countTaskScheduledFailed;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v28 = 2654435761 * self->_countTaskCompletedSucceeded;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_13:
    uint64_t v29 = 2654435761 * self->_countTaskCompletedFailed;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v30 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_27:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v30 = 2654435761 * self->_countPerformTaskSucceeded;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_15:
    uint64_t v31 = 2654435761 * self->_countPerformTaskFailed;
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v31 = 0;
LABEL_30:
  if ((*(unsigned char *)&has & 0x80) != 0) {
    uint64_t v32 = 2654435761 * self->_countStopSucceeded;
  }
  else {
    uint64_t v32 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0) {
    uint64_t v33 = 2654435761 * self->_countStopFailed;
  }
  else {
    uint64_t v33 = 0;
  }
  if ((*(_WORD *)&has & 0x4000) != 0) {
    uint64_t v34 = 2654435761 * self->_trialIdentifierType;
  }
  else {
    uint64_t v34 = 0;
  }
  unint64_t v35 = v11 ^ v6 ^ v16 ^ v18 ^ v19 ^ (2654435761u * self->_timestamp);
  uint64_t v36 = v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ objc_msgSend_hash(self->_trialExperimentID, (const char *)v27, v28, v29, v30);
  uint64_t v41 = v35 ^ v36 ^ objc_msgSend_hash(self->_trialDeploymentID, v37, v38, v39, v40);
  uint64_t v46 = objc_msgSend_hash(self->_trialTreatmentID, v42, v43, v44, v45);
  return v41 ^ v46 ^ objc_msgSend_hash(self->_trialTaskID, v47, v48, v49, v50);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 10);
  id v16 = v4;
  if (v7)
  {
    objc_msgSend_setTelemetryID_(self, (const char *)v4, v7, v5, v6);
    id v4 = v16;
  }
  trialIdentifiers = self->_trialIdentifiers;
  uint64_t v9 = *((void *)v4 + 14);
  if (trialIdentifiers)
  {
    if (!v9) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(trialIdentifiers, (const char *)v4, v9, v5, v6);
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    objc_msgSend_setTrialIdentifiers_(self, (const char *)v4, v9, v5, v6);
  }
  id v4 = v16;
LABEL_9:
  uint64_t v10 = *((void *)v4 + 2);
  if (v10)
  {
    objc_msgSend_setContextID_(self, (const char *)v4, v10, v5, v6);
    id v4 = v16;
  }
  self->_timestamp = *((void *)v4 + 1);
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x10000) != 0)
  {
    self->_isAllocated = *((unsigned char *)v4 + 137);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v11 = *((_DWORD *)v4 + 35);
    if ((v11 & 0x8000) == 0)
    {
LABEL_13:
      if ((v11 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_42;
    }
  }
  else if ((v11 & 0x8000) == 0)
  {
    goto LABEL_13;
  }
  self->_isActivated = *((unsigned char *)v4 + 136);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 4) == 0)
  {
LABEL_14:
    if ((v11 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_countGeneralTargetting = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 4u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 8) == 0)
  {
LABEL_15:
    if ((v11 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_countGeneralTargettingMet = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 8u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    if ((v11 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_countCustomTargetting = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 1u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 2) == 0)
  {
LABEL_17:
    if ((v11 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_countCustomTargettingMet = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 2u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x800) == 0)
  {
LABEL_18:
    if ((v11 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_countTaskFetchedSucceeded = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x800u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x400) == 0)
  {
LABEL_19:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_countTaskFetchedFailed = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x400u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x2000) == 0)
  {
LABEL_20:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_countTaskScheduledSucceeded = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x1000) == 0)
  {
LABEL_21:
    if ((v11 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_countTaskScheduledFailed = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x200) == 0)
  {
LABEL_22:
    if ((v11 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_countTaskCompletedSucceeded = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x200u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x100) == 0)
  {
LABEL_23:
    if ((v11 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_countTaskCompletedFailed = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x100u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x20) == 0)
  {
LABEL_24:
    if ((v11 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_countPerformTaskSucceeded = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x20u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x10) == 0)
  {
LABEL_25:
    if ((v11 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_countPerformTaskFailed = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x10u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x80) == 0)
  {
LABEL_26:
    if ((v11 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_countStopSucceeded = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x80u;
  int v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x40) == 0)
  {
LABEL_27:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_55:
  self->_countStopFailed = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 35) & 0x4000) != 0)
  {
LABEL_28:
    self->_uint64_t trialIdentifierType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_29:
  uint64_t v12 = *((void *)v4 + 12);
  if (v12)
  {
    objc_msgSend_setTrialExperimentID_(self, (const char *)v4, v12, v5, v6);
    id v4 = v16;
  }
  uint64_t v13 = *((void *)v4 + 11);
  if (v13)
  {
    objc_msgSend_setTrialDeploymentID_(self, (const char *)v4, v13, v5, v6);
    id v4 = v16;
  }
  uint64_t v14 = *((void *)v4 + 16);
  if (v14)
  {
    objc_msgSend_setTrialTreatmentID_(self, (const char *)v4, v14, v5, v6);
    id v4 = v16;
  }
  uint64_t v15 = *((void *)v4 + 15);
  if (v15) {
    objc_msgSend_setTrialTaskID_(self, (const char *)v4, v15, v5, v6);
  }
  MEMORY[0x270F9A758]();
}

- (NSString)telemetryID
{
  return self->_telemetryID;
}

- (void)setTelemetryID:(id)a3
{
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

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (BOOL)isAllocated
{
  return self->_isAllocated;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (unsigned)countGeneralTargetting
{
  return self->_countGeneralTargetting;
}

- (unsigned)countGeneralTargettingMet
{
  return self->_countGeneralTargettingMet;
}

- (unsigned)countCustomTargetting
{
  return self->_countCustomTargetting;
}

- (unsigned)countCustomTargettingMet
{
  return self->_countCustomTargettingMet;
}

- (unsigned)countTaskFetchedSucceeded
{
  return self->_countTaskFetchedSucceeded;
}

- (unsigned)countTaskFetchedFailed
{
  return self->_countTaskFetchedFailed;
}

- (unsigned)countTaskScheduledSucceeded
{
  return self->_countTaskScheduledSucceeded;
}

- (unsigned)countTaskScheduledFailed
{
  return self->_countTaskScheduledFailed;
}

- (unsigned)countTaskCompletedSucceeded
{
  return self->_countTaskCompletedSucceeded;
}

- (unsigned)countTaskCompletedFailed
{
  return self->_countTaskCompletedFailed;
}

- (unsigned)countPerformTaskSucceeded
{
  return self->_countPerformTaskSucceeded;
}

- (unsigned)countPerformTaskFailed
{
  return self->_countPerformTaskFailed;
}

- (unsigned)countStopSucceeded
{
  return self->_countStopSucceeded;
}

- (unsigned)countStopFailed
{
  return self->_countStopFailed;
}

- (NSString)trialExperimentID
{
  return self->_trialExperimentID;
}

- (void)setTrialExperimentID:(id)a3
{
}

- (NSString)trialDeploymentID
{
  return self->_trialDeploymentID;
}

- (void)setTrialDeploymentID:(id)a3
{
}

- (NSString)trialTreatmentID
{
  return self->_trialTreatmentID;
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (NSString)trialTaskID
{
  return self->_trialTaskID;
}

- (void)setTrialTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialTaskID, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialDeploymentID, 0);
  objc_storeStrong((id *)&self->_telemetryID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end