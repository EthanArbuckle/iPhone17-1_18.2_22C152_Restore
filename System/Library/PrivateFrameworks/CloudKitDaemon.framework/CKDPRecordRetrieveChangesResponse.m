@interface CKDPRecordRetrieveChangesResponse
+ (Class)changedDeltasType;
+ (Class)changedRecordType;
+ (Class)changedShareType;
+ (Class)syncObligationsType;
- (BOOL)hasClientChangeToken;
- (BOOL)hasPendingArchivedRecords;
- (BOOL)hasStatus;
- (BOOL)hasSyncContinuationToken;
- (BOOL)hasZoneAttributesChange;
- (BOOL)isEqual:(id)a3;
- (BOOL)pendingArchivedRecords;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordRetrieveChangesResponseZoneAttributesChange)zoneAttributesChange;
- (NSData)clientChangeToken;
- (NSData)syncContinuationToken;
- (NSMutableArray)changedDeltas;
- (NSMutableArray)changedRecords;
- (NSMutableArray)changedShares;
- (NSMutableArray)syncObligations;
- (id)changedDeltasAtIndex:(unint64_t)a3;
- (id)changedRecordAtIndex:(unint64_t)a3;
- (id)changedShareAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (id)syncObligationsAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)changedDeltasCount;
- (unint64_t)changedRecordsCount;
- (unint64_t)changedSharesCount;
- (unint64_t)hash;
- (unint64_t)syncObligationsCount;
- (void)addChangedDeltas:(id)a3;
- (void)addChangedRecord:(id)a3;
- (void)addChangedShare:(id)a3;
- (void)addSyncObligations:(id)a3;
- (void)clearChangedDeltas;
- (void)clearChangedRecords;
- (void)clearChangedShares;
- (void)clearSyncObligations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangedDeltas:(id)a3;
- (void)setChangedRecords:(id)a3;
- (void)setChangedShares:(id)a3;
- (void)setClientChangeToken:(id)a3;
- (void)setHasPendingArchivedRecords:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setPendingArchivedRecords:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setSyncContinuationToken:(id)a3;
- (void)setSyncObligations:(id)a3;
- (void)setZoneAttributesChange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveChangesResponse

- (void)clearChangedRecords
{
  objc_msgSend_removeAllObjects(self->_changedRecords, a2, v2);
}

- (void)addChangedRecord:(id)a3
{
  v4 = (const char *)a3;
  changedRecords = self->_changedRecords;
  v8 = (char *)v4;
  if (!changedRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_changedRecords;
    self->_changedRecords = v6;

    v4 = v8;
    changedRecords = self->_changedRecords;
  }
  objc_msgSend_addObject_(changedRecords, v4, (uint64_t)v4);
}

- (unint64_t)changedRecordsCount
{
  return objc_msgSend_count(self->_changedRecords, a2, v2);
}

- (id)changedRecordAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedRecords, a2, a3);
}

+ (Class)changedRecordType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (BOOL)hasClientChangeToken
{
  return self->_clientChangeToken != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 1;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F6918[a3 - 1];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"inconsistent"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"consistent"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"noPendingChanges"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)clearChangedShares
{
  objc_msgSend_removeAllObjects(self->_changedShares, a2, v2);
}

- (void)addChangedShare:(id)a3
{
  v4 = (const char *)a3;
  changedShares = self->_changedShares;
  v8 = (char *)v4;
  if (!changedShares)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_changedShares;
    self->_changedShares = v6;

    v4 = v8;
    changedShares = self->_changedShares;
  }
  objc_msgSend_addObject_(changedShares, v4, (uint64_t)v4);
}

- (unint64_t)changedSharesCount
{
  return objc_msgSend_count(self->_changedShares, a2, v2);
}

- (id)changedShareAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedShares, a2, a3);
}

+ (Class)changedShareType
{
  return (Class)objc_opt_class();
}

- (void)setPendingArchivedRecords:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pendingArchivedRecords = a3;
}

- (void)setHasPendingArchivedRecords:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPendingArchivedRecords
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearChangedDeltas
{
  objc_msgSend_removeAllObjects(self->_changedDeltas, a2, v2);
}

- (void)addChangedDeltas:(id)a3
{
  v4 = (const char *)a3;
  changedDeltas = self->_changedDeltas;
  v8 = (char *)v4;
  if (!changedDeltas)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_changedDeltas;
    self->_changedDeltas = v6;

    v4 = v8;
    changedDeltas = self->_changedDeltas;
  }
  objc_msgSend_addObject_(changedDeltas, v4, (uint64_t)v4);
}

- (unint64_t)changedDeltasCount
{
  return objc_msgSend_count(self->_changedDeltas, a2, v2);
}

- (id)changedDeltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_changedDeltas, a2, a3);
}

+ (Class)changedDeltasType
{
  return (Class)objc_opt_class();
}

- (void)clearSyncObligations
{
  objc_msgSend_removeAllObjects(self->_syncObligations, a2, v2);
}

- (void)addSyncObligations:(id)a3
{
  v4 = (const char *)a3;
  syncObligations = self->_syncObligations;
  v8 = (char *)v4;
  if (!syncObligations)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_syncObligations;
    self->_syncObligations = v6;

    v4 = v8;
    syncObligations = self->_syncObligations;
  }
  objc_msgSend_addObject_(syncObligations, v4, (uint64_t)v4);
}

- (unint64_t)syncObligationsCount
{
  return objc_msgSend_count(self->_syncObligations, a2, v2);
}

- (id)syncObligationsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_syncObligations, a2, a3);
}

+ (Class)syncObligationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasZoneAttributesChange
{
  return self->_zoneAttributesChange != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponse;
  v4 = [(CKDPRecordRetrieveChangesResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_changedRecords, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_changedRecords, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v14 = self->_changedRecords;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v104, v111, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v105 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v104 + 1) + 8 * i), v17, v18);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v104, v111, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"changedRecord");
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken) {
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)syncContinuationToken, @"syncContinuationToken");
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken) {
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)clientChangeToken, @"clientChangeToken");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v27 = self->_status - 1;
    if (v27 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v7, @"(unknown: %i)", self->_status);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E64F6918[v27];
    }
    objc_msgSend_setObject_forKey_(v4, v7, (uint64_t)v28, @"status");
  }
  if (objc_msgSend_count(self->_changedShares, v7, (uint64_t)clientChangeToken))
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v34 = objc_msgSend_count(self->_changedShares, v32, v33);
    v36 = objc_msgSend_initWithCapacity_(v31, v35, v34);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v37 = self->_changedShares;
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v100, v110, 16);
    if (v39)
    {
      uint64_t v42 = v39;
      uint64_t v43 = *(void *)v101;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v101 != v43) {
            objc_enumerationMutation(v37);
          }
          v45 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v100 + 1) + 8 * j), v40, v41);
          objc_msgSend_addObject_(v36, v46, (uint64_t)v45);
        }
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v100, v110, 16);
      }
      while (v42);
    }

    objc_msgSend_setObject_forKey_(v4, v47, (uint64_t)v36, @"changedShare");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v48 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v29, self->_pendingArchivedRecords);
    objc_msgSend_setObject_forKey_(v4, v49, (uint64_t)v48, @"pendingArchivedRecords");
  }
  if (objc_msgSend_count(self->_changedDeltas, v29, v30))
  {
    id v52 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v55 = objc_msgSend_count(self->_changedDeltas, v53, v54);
    v57 = objc_msgSend_initWithCapacity_(v52, v56, v55);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v58 = self->_changedDeltas;
    uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v96, v109, 16);
    if (v60)
    {
      uint64_t v63 = v60;
      uint64_t v64 = *(void *)v97;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v97 != v64) {
            objc_enumerationMutation(v58);
          }
          v66 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v96 + 1) + 8 * k), v61, v62);
          objc_msgSend_addObject_(v57, v67, (uint64_t)v66);
        }
        uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v96, v109, 16);
      }
      while (v63);
    }

    objc_msgSend_setObject_forKey_(v4, v68, (uint64_t)v57, @"changedDeltas");
  }
  if (objc_msgSend_count(self->_syncObligations, v50, v51))
  {
    id v71 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v74 = objc_msgSend_count(self->_syncObligations, v72, v73);
    v76 = objc_msgSend_initWithCapacity_(v71, v75, v74);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v77 = self->_syncObligations;
    uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v92, v108, 16);
    if (v79)
    {
      uint64_t v82 = v79;
      uint64_t v83 = *(void *)v93;
      do
      {
        for (uint64_t m = 0; m != v82; ++m)
        {
          if (*(void *)v93 != v83) {
            objc_enumerationMutation(v77);
          }
          v85 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v92 + 1) + 8 * m), v80, v81);
          objc_msgSend_addObject_(v76, v86, (uint64_t)v85);
        }
        uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v80, (uint64_t)&v92, v108, 16);
      }
      while (v82);
    }

    objc_msgSend_setObject_forKey_(v4, v87, (uint64_t)v76, @"syncObligations");
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  if (zoneAttributesChange)
  {
    v89 = objc_msgSend_dictionaryRepresentation(zoneAttributesChange, v69, v70);
    objc_msgSend_setObject_forKey_(v4, v90, (uint64_t)v89, @"zoneAttributesChange");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F41DF8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v5 = self->_changedRecords;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, v52, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v45, v52, 16);
    }
    while (v8);
  }

  if (self->_syncContinuationToken) {
    PBDataWriterWriteDataField();
  }
  if (self->_clientChangeToken) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v12 = self->_changedShares;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v51, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v41, v51, 16);
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v19 = self->_changedDeltas;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v50, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v37, v50, 16);
    }
    while (v22);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = self->_syncObligations;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, v49, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v33, v49, 16);
    }
    while (v29);
  }

  if (self->_zoneAttributesChange) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v45 = a3;
  if (objc_msgSend_changedRecordsCount(self, v4, v5))
  {
    objc_msgSend_clearChangedRecords(v45, v6, v7);
    uint64_t v10 = objc_msgSend_changedRecordsCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_changedRecordAtIndex_(self, v6, i);
        objc_msgSend_addChangedRecord_(v45, v14, (uint64_t)v13);
      }
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken) {
    objc_msgSend_setSyncContinuationToken_(v45, v6, (uint64_t)syncContinuationToken);
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken) {
    objc_msgSend_setClientChangeToken_(v45, v6, (uint64_t)clientChangeToken);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v45 + 10) = self->_status;
    *((unsigned char *)v45 + 76) |= 1u;
  }
  if (objc_msgSend_changedSharesCount(self, v6, (uint64_t)clientChangeToken))
  {
    objc_msgSend_clearChangedShares(v45, v17, v18);
    uint64_t v21 = objc_msgSend_changedSharesCount(self, v19, v20);
    if (v21)
    {
      uint64_t v22 = v21;
      for (uint64_t j = 0; j != v22; ++j)
      {
        uint64_t v24 = objc_msgSend_changedShareAtIndex_(self, v17, j);
        objc_msgSend_addChangedShare_(v45, v25, (uint64_t)v24);
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v45 + 72) = self->_pendingArchivedRecords;
    *((unsigned char *)v45 + 76) |= 2u;
  }
  if (objc_msgSend_changedDeltasCount(self, v17, v18))
  {
    objc_msgSend_clearChangedDeltas(v45, v26, v27);
    uint64_t v30 = objc_msgSend_changedDeltasCount(self, v28, v29);
    if (v30)
    {
      uint64_t v31 = v30;
      for (uint64_t k = 0; k != v31; ++k)
      {
        long long v33 = objc_msgSend_changedDeltasAtIndex_(self, v26, k);
        objc_msgSend_addChangedDeltas_(v45, v34, (uint64_t)v33);
      }
    }
  }
  if (objc_msgSend_syncObligationsCount(self, v26, v27))
  {
    objc_msgSend_clearSyncObligations(v45, v35, v36);
    uint64_t v39 = objc_msgSend_syncObligationsCount(self, v37, v38);
    if (v39)
    {
      uint64_t v40 = v39;
      for (uint64_t m = 0; m != v40; ++m)
      {
        long long v42 = objc_msgSend_syncObligationsAtIndex_(self, v35, m);
        objc_msgSend_addSyncObligations_(v45, v43, (uint64_t)v42);
      }
    }
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  if (zoneAttributesChange) {
    objc_msgSend_setZoneAttributesChange_(v45, v35, (uint64_t)zoneAttributesChange);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v11 = self->_changedRecords;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v69, v76, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v70 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v69 + 1) + 8 * i), v14, (uint64_t)a3);
        objc_msgSend_addChangedRecord_((void *)v10, v19, (uint64_t)v18);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v69, v76, 16);
    }
    while (v15);
  }

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v20, (uint64_t)a3);
  uint64_t v22 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_clientChangeToken, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 40) = self->_status;
    *(unsigned char *)(v10 + 76) |= 1u;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v26 = self->_changedShares;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v65, v75, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v66 != v31) {
          objc_enumerationMutation(v26);
        }
        long long v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v65 + 1) + 8 * j), v29, (uint64_t)a3);
        objc_msgSend_addChangedShare_((void *)v10, v34, (uint64_t)v33);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v65, v75, 16);
    }
    while (v30);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v10 + 72) = self->_pendingArchivedRecords;
    *(unsigned char *)(v10 + 76) |= 2u;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v35 = self->_changedDeltas;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v61, v74, 16);
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v35);
        }
        long long v42 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v61 + 1) + 8 * k), v38, (uint64_t)a3);
        objc_msgSend_addChangedDeltas_((void *)v10, v43, (uint64_t)v42);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v61, v74, 16);
    }
    while (v39);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v44 = self->_syncObligations;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v57, v73, 16);
  if (v46)
  {
    uint64_t v48 = v46;
    uint64_t v49 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v58 != v49) {
          objc_enumerationMutation(v44);
        }
        uint64_t v51 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v57 + 1) + 8 * m), v47, (uint64_t)a3, (void)v57);
        objc_msgSend_addSyncObligations_((void *)v10, v52, (uint64_t)v51);
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v57, v73, 16);
    }
    while (v48);
  }

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_zoneAttributesChange, v53, (uint64_t)a3);
  uint64_t v55 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v54;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_30;
  }
  changedRecords = self->_changedRecords;
  uint64_t v9 = v4[2];
  if ((unint64_t)changedRecords | v9)
  {
    if (!objc_msgSend_isEqual_(changedRecords, v7, v9)) {
      goto LABEL_30;
    }
  }
  syncContinuationToken = self->_syncContinuationToken;
  uint64_t v11 = v4[6];
  if ((unint64_t)syncContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v11)) {
      goto LABEL_30;
    }
  }
  clientChangeToken = self->_clientChangeToken;
  uint64_t v13 = v4[4];
  if ((unint64_t)clientChangeToken | v13)
  {
    if (!objc_msgSend_isEqual_(clientChangeToken, v7, v13)) {
      goto LABEL_30;
    }
  }
  char has = (char)self->_has;
  char v15 = *((unsigned char *)v4 + 76);
  if (has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_status != *((_DWORD *)v4 + 10)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_30;
  }
  changedShares = self->_changedShares;
  uint64_t v17 = v4[3];
  if ((unint64_t)changedShares | v17)
  {
    if (!objc_msgSend_isEqual_(changedShares, v7, v17)) {
      goto LABEL_30;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 76);
  }
  if ((has & 2) != 0)
  {
    if ((v15 & 2) != 0)
    {
      if (self->_pendingArchivedRecords)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_30;
        }
        goto LABEL_24;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_24;
      }
    }
LABEL_30:
    char isEqual = 0;
    goto LABEL_31;
  }
  if ((v15 & 2) != 0) {
    goto LABEL_30;
  }
LABEL_24:
  changedDeltas = self->_changedDeltas;
  uint64_t v19 = v4[1];
  if ((unint64_t)changedDeltas | v19 && !objc_msgSend_isEqual_(changedDeltas, v7, v19)) {
    goto LABEL_30;
  }
  syncObligations = self->_syncObligations;
  uint64_t v21 = v4[7];
  if ((unint64_t)syncObligations | v21)
  {
    if (!objc_msgSend_isEqual_(syncObligations, v7, v21)) {
      goto LABEL_30;
    }
  }
  zoneAttributesChange = self->_zoneAttributesChange;
  uint64_t v23 = v4[8];
  if ((unint64_t)zoneAttributesChange | v23) {
    char isEqual = objc_msgSend_isEqual_(zoneAttributesChange, v7, v23);
  }
  else {
    char isEqual = 1;
  }
LABEL_31:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_changedRecords, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_syncContinuationToken, v5, v6);
  uint64_t v12 = objc_msgSend_hash(self->_clientChangeToken, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_status;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = objc_msgSend_hash(self->_changedShares, v10, v11);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_pendingArchivedRecords;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v7 ^ v4 ^ v12 ^ v13;
  uint64_t v19 = v14 ^ v17 ^ objc_msgSend_hash(self->_changedDeltas, v15, v16);
  uint64_t v22 = v18 ^ v19 ^ objc_msgSend_hash(self->_syncObligations, v20, v21);
  return v22 ^ objc_msgSend_hash(self->_zoneAttributesChange, v23, v24);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v51, v58, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addChangedRecord_(self, v8, *(void *)(*((void *)&v51 + 1) + 8 * i));
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v51, v58, 16);
    }
    while (v9);
  }

  uint64_t v13 = *((void *)v4 + 6);
  if (v13) {
    objc_msgSend_setSyncContinuationToken_(self, v12, v13);
  }
  uint64_t v14 = *((void *)v4 + 4);
  if (v14) {
    objc_msgSend_setClientChangeToken_(self, v12, v14);
  }
  if (*((unsigned char *)v4 + 76))
  {
    self->_status = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = *((id *)v4 + 3);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v47, v57, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend_addChangedShare_(self, v18, *(void *)(*((void *)&v47 + 1) + 8 * j));
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v47, v57, 16);
    }
    while (v19);
  }

  if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    self->_pendingArchivedRecords = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v22 = *((id *)v4 + 1);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v56, 16);
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_addChangedDeltas_(self, v25, *(void *)(*((void *)&v43 + 1) + 8 * k));
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v56, 16);
    }
    while (v26);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = *((id *)v4 + 7);
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v39, v55, 16);
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v29);
        }
        objc_msgSend_addSyncObligations_(self, v32, *(void *)(*((void *)&v39 + 1) + 8 * m), (void)v39);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v32, (uint64_t)&v39, v55, 16);
    }
    while (v33);
  }

  zoneAttributesChange = self->_zoneAttributesChange;
  uint64_t v38 = *((void *)v4 + 8);
  if (zoneAttributesChange)
  {
    if (v38) {
      objc_msgSend_mergeFrom_(zoneAttributesChange, v36, v38);
    }
  }
  else if (v38)
  {
    objc_msgSend_setZoneAttributesChange_(self, v36, v38);
  }
}

- (NSMutableArray)changedRecords
{
  return self->_changedRecords;
}

- (void)setChangedRecords:(id)a3
{
}

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (void)setSyncContinuationToken:(id)a3
{
}

- (NSData)clientChangeToken
{
  return self->_clientChangeToken;
}

- (void)setClientChangeToken:(id)a3
{
}

- (NSMutableArray)changedShares
{
  return self->_changedShares;
}

- (void)setChangedShares:(id)a3
{
}

- (BOOL)pendingArchivedRecords
{
  return self->_pendingArchivedRecords;
}

- (NSMutableArray)changedDeltas
{
  return self->_changedDeltas;
}

- (void)setChangedDeltas:(id)a3
{
}

- (NSMutableArray)syncObligations
{
  return self->_syncObligations;
}

- (void)setSyncObligations:(id)a3
{
}

- (CKDPRecordRetrieveChangesResponseZoneAttributesChange)zoneAttributesChange
{
  return self->_zoneAttributesChange;
}

- (void)setZoneAttributesChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneAttributesChange, 0);
  objc_storeStrong((id *)&self->_syncObligations, 0);
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_changedShares, 0);
  objc_storeStrong((id *)&self->_changedRecords, 0);
  objc_storeStrong((id *)&self->_changedDeltas, 0);
}

@end