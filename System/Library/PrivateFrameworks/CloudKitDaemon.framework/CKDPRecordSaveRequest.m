@interface CKDPRecordSaveRequest
+ (Class)conflictLosersToResolveType;
+ (Class)fieldsToDeleteIfExistOnMergeType;
+ (id)options;
- (BOOL)hasConflictLoserUpdate;
- (BOOL)hasEtag;
- (BOOL)hasMerge;
- (BOOL)hasParentChainProtectionInfoTag;
- (BOOL)hasRecord;
- (BOOL)hasRecordProtectionInfoTag;
- (BOOL)hasRequestedFields;
- (BOOL)hasSaveSemantics;
- (BOOL)hasShareEtag;
- (BOOL)hasShareIDUpdate;
- (BOOL)hasZoneProtectionInfoTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)merge;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)record;
- (CKDPRecordSaveRequestConflictLoserUpdate)conflictLoserUpdate;
- (CKDPRecordSaveRequestShareIdUpdate)shareIDUpdate;
- (CKDPRequestedFields)requestedFields;
- (Class)responseClass;
- (NSMutableArray)conflictLosersToResolves;
- (NSMutableArray)fieldsToDeleteIfExistOnMerges;
- (NSString)etag;
- (NSString)parentChainProtectionInfoTag;
- (NSString)recordProtectionInfoTag;
- (NSString)shareEtag;
- (NSString)zoneProtectionInfoTag;
- (id)conflictLosersToResolveAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldsToDeleteIfExistOnMergeAtIndex:(unint64_t)a3;
- (id)saveSemanticsAsString:(int)a3;
- (int)StringAsSaveSemantics:(id)a3;
- (int)saveSemantics;
- (unint64_t)conflictLosersToResolvesCount;
- (unint64_t)fieldsToDeleteIfExistOnMergesCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)addConflictLosersToResolve:(id)a3;
- (void)addFieldsToDeleteIfExistOnMerge:(id)a3;
- (void)clearConflictLosersToResolves;
- (void)clearFieldsToDeleteIfExistOnMerges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConflictLoserUpdate:(id)a3;
- (void)setConflictLosersToResolves:(id)a3;
- (void)setEtag:(id)a3;
- (void)setFieldsToDeleteIfExistOnMerges:(id)a3;
- (void)setHasMerge:(BOOL)a3;
- (void)setHasSaveSemantics:(BOOL)a3;
- (void)setMerge:(BOOL)a3;
- (void)setParentChainProtectionInfoTag:(id)a3;
- (void)setRecord:(id)a3;
- (void)setRecordProtectionInfoTag:(id)a3;
- (void)setRequestedFields:(id)a3;
- (void)setSaveSemantics:(int)a3;
- (void)setShareEtag:(id)a3;
- (void)setShareIDUpdate:(id)a3;
- (void)setZoneProtectionInfoTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordSaveRequest

+ (id)options
{
  if (qword_1EBBCDDB0 != -1) {
    dispatch_once(&qword_1EBBCDDB0, &unk_1F2043570);
  }
  v2 = (void *)qword_1EBBCDDA8;
  return v2;
}

- (BOOL)hasRecord
{
  return self->_record != 0;
}

- (void)setMerge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_merge = a3;
}

- (void)setHasMerge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMerge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearFieldsToDeleteIfExistOnMerges
{
  objc_msgSend_removeAllObjects(self->_fieldsToDeleteIfExistOnMerges, a2, v2);
}

- (void)addFieldsToDeleteIfExistOnMerge:(id)a3
{
  v4 = (const char *)a3;
  fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  v8 = (char *)v4;
  if (!fieldsToDeleteIfExistOnMerges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fieldsToDeleteIfExistOnMerges;
    self->_fieldsToDeleteIfExistOnMerges = v6;

    v4 = v8;
    fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  }
  objc_msgSend_addObject_(fieldsToDeleteIfExistOnMerges, v4, (uint64_t)v4);
}

- (unint64_t)fieldsToDeleteIfExistOnMergesCount
{
  return objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, a2, v2);
}

- (id)fieldsToDeleteIfExistOnMergeAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldsToDeleteIfExistOnMerges, a2, a3);
}

+ (Class)fieldsToDeleteIfExistOnMergeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasConflictLoserUpdate
{
  return self->_conflictLoserUpdate != 0;
}

- (int)saveSemantics
{
  if (*(unsigned char *)&self->_has) {
    return self->_saveSemantics;
  }
  else {
    return 3;
  }
}

- (void)setSaveSemantics:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_saveSemantics = a3;
}

- (void)setHasSaveSemantics:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSaveSemantics
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)saveSemanticsAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F4188[a3 - 1];
  }
  return v3;
}

- (int)StringAsSaveSemantics:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"failIfOutdated"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"failIfExists"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"override"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasZoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag != 0;
}

- (BOOL)hasRecordProtectionInfoTag
{
  return self->_recordProtectionInfoTag != 0;
}

- (void)clearConflictLosersToResolves
{
  objc_msgSend_removeAllObjects(self->_conflictLosersToResolves, a2, v2);
}

- (void)addConflictLosersToResolve:(id)a3
{
  v4 = (const char *)a3;
  conflictLosersToResolves = self->_conflictLosersToResolves;
  v8 = (char *)v4;
  if (!conflictLosersToResolves)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_conflictLosersToResolves;
    self->_conflictLosersToResolves = v6;

    v4 = v8;
    conflictLosersToResolves = self->_conflictLosersToResolves;
  }
  objc_msgSend_addObject_(conflictLosersToResolves, v4, (uint64_t)v4);
}

- (unint64_t)conflictLosersToResolvesCount
{
  return objc_msgSend_count(self->_conflictLosersToResolves, a2, v2);
}

- (id)conflictLosersToResolveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLosersToResolves, a2, a3);
}

+ (Class)conflictLosersToResolveType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareEtag
{
  return self->_shareEtag != 0;
}

- (BOOL)hasShareIDUpdate
{
  return self->_shareIDUpdate != 0;
}

- (BOOL)hasParentChainProtectionInfoTag
{
  return self->_parentChainProtectionInfoTag != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordSaveRequest;
  v4 = [(CKDPRecordSaveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  record = self->_record;
  if (record)
  {
    v8 = objc_msgSend_dictionaryRepresentation(record, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"record");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_merge);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"merge");
  }
  if (objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, v4, v5))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_fieldsToDeleteIfExistOnMerges, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v19 = self->_fieldsToDeleteIfExistOnMerges;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v48, v52, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v49 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v48 + 1) + 8 * i), v22, v23);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v48, v52, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, @"fieldsToDeleteIfExistOnMerge");
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)etag, @"etag");
  }
  conflictLoserUpdate = self->_conflictLoserUpdate;
  if (conflictLoserUpdate)
  {
    v32 = objc_msgSend_dictionaryRepresentation(conflictLoserUpdate, v12, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, @"conflictLoserUpdate");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v34 = self->_saveSemantics - 1;
    if (v34 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v12, @"(unknown: %i)", self->_saveSemantics);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E64F4188[v34];
    }
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v35, @"saveSemantics");
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)zoneProtectionInfoTag, @"zoneProtectionInfoTag");
  }
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  if (recordProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)recordProtectionInfoTag, @"recordProtectionInfoTag");
  }
  conflictLosersToResolves = self->_conflictLosersToResolves;
  if (conflictLosersToResolves) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)conflictLosersToResolves, @"conflictLosersToResolve");
  }
  shareEtag = self->_shareEtag;
  if (shareEtag) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)shareEtag, @"shareEtag");
  }
  shareIDUpdate = self->_shareIDUpdate;
  if (shareIDUpdate)
  {
    v41 = objc_msgSend_dictionaryRepresentation(shareIDUpdate, v12, (uint64_t)shareEtag);
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, @"shareIDUpdate");
  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  if (parentChainProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)parentChainProtectionInfoTag, @"parentChainProtectionInfoTag");
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    v45 = objc_msgSend_dictionaryRepresentation(requestedFields, v12, (uint64_t)parentChainProtectionInfoTag);
    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v45, @"requestedFields");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E48B70((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_record) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_fieldsToDeleteIfExistOnMerges;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if (self->_etag) {
    PBDataWriterWriteStringField();
  }
  if (self->_conflictLoserUpdate) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_zoneProtectionInfoTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordProtectionInfoTag) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_conflictLosersToResolves;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

  if (self->_shareEtag) {
    PBDataWriterWriteStringField();
  }
  if (self->_shareIDUpdate) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_parentChainProtectionInfoTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_requestedFields) {
    PBDataWriterWriteSubmessage();
  }
}

- (unsigned)requestTypeCode
{
  return 5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  record = self->_record;
  v35 = v4;
  if (record)
  {
    objc_msgSend_setRecord_(v4, v5, (uint64_t)record);
    id v4 = v35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[104] = self->_merge;
    v4[108] |= 2u;
  }
  if (objc_msgSend_fieldsToDeleteIfExistOnMergesCount(self, v5, (uint64_t)record))
  {
    objc_msgSend_clearFieldsToDeleteIfExistOnMerges(v35, v7, v8);
    uint64_t v11 = objc_msgSend_fieldsToDeleteIfExistOnMergesCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_fieldsToDeleteIfExistOnMergeAtIndex_(self, v7, i);
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_(v35, v15, (uint64_t)v14);
      }
    }
  }
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setEtag_(v35, v7, (uint64_t)etag);
  }
  conflictLoserUpdate = self->_conflictLoserUpdate;
  v18 = v35;
  if (conflictLoserUpdate)
  {
    objc_msgSend_setConflictLoserUpdate_(v35, v7, (uint64_t)conflictLoserUpdate);
    v18 = v35;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v18 + 18) = self->_saveSemantics;
    v18[108] |= 1u;
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag) {
    objc_msgSend_setZoneProtectionInfoTag_(v35, v7, (uint64_t)zoneProtectionInfoTag);
  }
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  if (recordProtectionInfoTag) {
    objc_msgSend_setRecordProtectionInfoTag_(v35, v7, (uint64_t)recordProtectionInfoTag);
  }
  if (objc_msgSend_conflictLosersToResolvesCount(self, v7, (uint64_t)recordProtectionInfoTag))
  {
    objc_msgSend_clearConflictLosersToResolves(v35, v21, v22);
    uint64_t v25 = objc_msgSend_conflictLosersToResolvesCount(self, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        v28 = objc_msgSend_conflictLosersToResolveAtIndex_(self, v21, j);
        objc_msgSend_addConflictLosersToResolve_(v35, v29, (uint64_t)v28);
      }
    }
  }
  shareEtag = self->_shareEtag;
  if (shareEtag) {
    objc_msgSend_setShareEtag_(v35, v21, (uint64_t)shareEtag);
  }
  shareIDUpdate = self->_shareIDUpdate;
  v32 = v35;
  if (shareIDUpdate)
  {
    objc_msgSend_setShareIDUpdate_(v35, v21, (uint64_t)shareIDUpdate);
    v32 = v35;
  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  if (parentChainProtectionInfoTag)
  {
    objc_msgSend_setParentChainProtectionInfoTag_(v35, v21, (uint64_t)parentChainProtectionInfoTag);
    v32 = v35;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v35, v21, (uint64_t)requestedFields);
    v32 = v35;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_record, v11, (uint64_t)a3);
  id v13 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v10 + 104) = self->_merge;
    *(unsigned char *)(v10 + 108) |= 2u;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v14 = self->_fieldsToDeleteIfExistOnMerges;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v61, v66, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v14);
        }
        long long v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v61 + 1) + 8 * i), v17, (uint64_t)a3);
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v61, v66, 16);
    }
    while (v18);
  }

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_etag, v23, (uint64_t)a3);
  uint64_t v25 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_conflictLoserUpdate, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v27;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 72) = self->_saveSemantics;
    *(unsigned char *)(v10 + 108) |= 1u;
  }
  uint64_t v30 = objc_msgSend_copyWithZone_(self->_zoneProtectionInfoTag, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v30;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_recordProtectionInfoTag, v32, (uint64_t)a3);
  unsigned int v34 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v33;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v35 = self->_conflictLosersToResolves;
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v57, v65, 16);
  if (v37)
  {
    uint64_t v39 = v37;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v35);
        }
        v42 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v57 + 1) + 8 * j), v38, (uint64_t)a3, (void)v57);
        objc_msgSend_addConflictLosersToResolve_((void *)v10, v43, (uint64_t)v42);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v57, v65, 16);
    }
    while (v39);
  }

  uint64_t v45 = objc_msgSend_copyWithZone_(self->_shareEtag, v44, (uint64_t)a3);
  v46 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v45;

  uint64_t v48 = objc_msgSend_copyWithZone_(self->_shareIDUpdate, v47, (uint64_t)a3);
  long long v49 = *(void **)(v10 + 88);
  *(void *)(v10 + 88) = v48;

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_parentChainProtectionInfoTag, v50, (uint64_t)a3);
  v52 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v51;

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_requestedFields, v53, (uint64_t)a3);
  v55 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v54;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_37;
  }
  record = self->_record;
  uint64_t v9 = v4[6];
  if ((unint64_t)record | v9)
  {
    if (!objc_msgSend_isEqual_(record, v7, v9)) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) != 0)
    {
      if (self->_merge)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_37;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_12;
      }
    }
LABEL_37:
    char isEqual = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 108) & 2) != 0) {
    goto LABEL_37;
  }
LABEL_12:
  fieldsToDeleteIfExistOnMerges = self->_fieldsToDeleteIfExistOnMerges;
  uint64_t v11 = v4[4];
  if ((unint64_t)fieldsToDeleteIfExistOnMerges | v11
    && !objc_msgSend_isEqual_(fieldsToDeleteIfExistOnMerges, v7, v11))
  {
    goto LABEL_37;
  }
  etag = self->_etag;
  uint64_t v13 = v4[3];
  if ((unint64_t)etag | v13)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v13)) {
      goto LABEL_37;
    }
  }
  conflictLoserUpdate = self->_conflictLoserUpdate;
  uint64_t v15 = v4[1];
  if ((unint64_t)conflictLoserUpdate | v15)
  {
    if (!objc_msgSend_isEqual_(conflictLoserUpdate, v7, v15)) {
      goto LABEL_37;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_saveSemantics != *((_DWORD *)v4 + 18)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
    goto LABEL_37;
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  uint64_t v17 = v4[12];
  if ((unint64_t)zoneProtectionInfoTag | v17
    && !objc_msgSend_isEqual_(zoneProtectionInfoTag, v7, v17))
  {
    goto LABEL_37;
  }
  recordProtectionInfoTag = self->_recordProtectionInfoTag;
  uint64_t v19 = v4[7];
  if ((unint64_t)recordProtectionInfoTag | v19)
  {
    if (!objc_msgSend_isEqual_(recordProtectionInfoTag, v7, v19)) {
      goto LABEL_37;
    }
  }
  conflictLosersToResolves = self->_conflictLosersToResolves;
  uint64_t v21 = v4[2];
  if ((unint64_t)conflictLosersToResolves | v21)
  {
    if (!objc_msgSend_isEqual_(conflictLosersToResolves, v7, v21)) {
      goto LABEL_37;
    }
  }
  shareEtag = self->_shareEtag;
  uint64_t v23 = v4[10];
  if ((unint64_t)shareEtag | v23)
  {
    if (!objc_msgSend_isEqual_(shareEtag, v7, v23)) {
      goto LABEL_37;
    }
  }
  shareIDUpdate = self->_shareIDUpdate;
  uint64_t v25 = v4[11];
  if ((unint64_t)shareIDUpdate | v25)
  {
    if (!objc_msgSend_isEqual_(shareIDUpdate, v7, v25)) {
      goto LABEL_37;
    }
  }
  parentChainProtectionInfoTag = self->_parentChainProtectionInfoTag;
  uint64_t v27 = v4[5];
  if ((unint64_t)parentChainProtectionInfoTag | v27)
  {
    if (!objc_msgSend_isEqual_(parentChainProtectionInfoTag, v7, v27)) {
      goto LABEL_37;
    }
  }
  requestedFields = self->_requestedFields;
  uint64_t v29 = v4[8];
  if ((unint64_t)requestedFields | v29) {
    char isEqual = objc_msgSend_isEqual_(requestedFields, v7, v29);
  }
  else {
    char isEqual = 1;
  }
LABEL_38:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_record, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_merge;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend_hash(self->_fieldsToDeleteIfExistOnMerges, v4, v5);
  uint64_t v11 = objc_msgSend_hash(self->_etag, v9, v10);
  uint64_t v14 = objc_msgSend_hash(self->_conflictLoserUpdate, v12, v13);
  if (*(unsigned char *)&self->_has) {
    uint64_t v17 = 2654435761 * self->_saveSemantics;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v7 ^ v6 ^ v8 ^ v11 ^ v14 ^ v17 ^ objc_msgSend_hash(self->_zoneProtectionInfoTag, v15, v16);
  uint64_t v21 = objc_msgSend_hash(self->_recordProtectionInfoTag, v19, v20);
  uint64_t v24 = v21 ^ objc_msgSend_hash(self->_conflictLosersToResolves, v22, v23);
  uint64_t v27 = v24 ^ objc_msgSend_hash(self->_shareEtag, v25, v26);
  uint64_t v30 = v18 ^ v27 ^ objc_msgSend_hash(self->_shareIDUpdate, v28, v29);
  uint64_t v33 = objc_msgSend_hash(self->_parentChainProtectionInfoTag, v31, v32);
  return v30 ^ v33 ^ objc_msgSend_hash(self->_requestedFields, v34, v35);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  record = self->_record;
  uint64_t v7 = *((void *)v5 + 6);
  if (record)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(record, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setRecord_(self, v4, v7);
  }
  if ((*((unsigned char *)v5 + 108) & 2) != 0)
  {
    self->_merge = *((unsigned char *)v5 + 104);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = *((id *)v5 + 4);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v44, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addFieldsToDeleteIfExistOnMerge_(self, v11, *(void *)(*((void *)&v39 + 1) + 8 * i));
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v44, 16);
    }
    while (v12);
  }

  uint64_t v16 = *((void *)v5 + 3);
  if (v16) {
    objc_msgSend_setEtag_(self, v15, v16);
  }
  conflictLoserUpdate = self->_conflictLoserUpdate;
  uint64_t v18 = *((void *)v5 + 1);
  if (conflictLoserUpdate)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(conflictLoserUpdate, v15, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setConflictLoserUpdate_(self, v15, v18);
  }
  if (*((unsigned char *)v5 + 108))
  {
    self->_saveSemantics = *((_DWORD *)v5 + 18);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v19 = *((void *)v5 + 12);
  if (v19) {
    objc_msgSend_setZoneProtectionInfoTag_(self, v15, v19);
  }
  uint64_t v20 = *((void *)v5 + 7);
  if (v20) {
    objc_msgSend_setRecordProtectionInfoTag_(self, v15, v20);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = *((id *)v5 + 2);
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, v43, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend_addConflictLosersToResolve_(self, v24, *(void *)(*((void *)&v35 + 1) + 8 * j), (void)v35);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, v43, 16);
    }
    while (v25);
  }

  uint64_t v29 = *((void *)v5 + 10);
  if (v29) {
    objc_msgSend_setShareEtag_(self, v28, v29);
  }
  shareIDUpdate = self->_shareIDUpdate;
  uint64_t v31 = *((void *)v5 + 11);
  if (shareIDUpdate)
  {
    if (v31) {
      objc_msgSend_mergeFrom_(shareIDUpdate, v28, v31);
    }
  }
  else if (v31)
  {
    objc_msgSend_setShareIDUpdate_(self, v28, v31);
  }
  uint64_t v32 = *((void *)v5 + 5);
  if (v32) {
    objc_msgSend_setParentChainProtectionInfoTag_(self, v28, v32);
  }
  requestedFields = self->_requestedFields;
  uint64_t v34 = *((void *)v5 + 8);
  if (requestedFields)
  {
    if (v34) {
      objc_msgSend_mergeFrom_(requestedFields, v28, v34);
    }
  }
  else if (v34)
  {
    objc_msgSend_setRequestedFields_(self, v28, v34);
  }
}

- (CKDPRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (BOOL)merge
{
  return self->_merge;
}

- (NSMutableArray)fieldsToDeleteIfExistOnMerges
{
  return self->_fieldsToDeleteIfExistOnMerges;
}

- (void)setFieldsToDeleteIfExistOnMerges:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPRecordSaveRequestConflictLoserUpdate)conflictLoserUpdate
{
  return self->_conflictLoserUpdate;
}

- (void)setConflictLoserUpdate:(id)a3
{
}

- (NSString)zoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag;
}

- (void)setZoneProtectionInfoTag:(id)a3
{
}

- (NSString)recordProtectionInfoTag
{
  return self->_recordProtectionInfoTag;
}

- (void)setRecordProtectionInfoTag:(id)a3
{
}

- (NSMutableArray)conflictLosersToResolves
{
  return self->_conflictLosersToResolves;
}

- (void)setConflictLosersToResolves:(id)a3
{
}

- (NSString)shareEtag
{
  return self->_shareEtag;
}

- (void)setShareEtag:(id)a3
{
}

- (CKDPRecordSaveRequestShareIdUpdate)shareIDUpdate
{
  return self->_shareIDUpdate;
}

- (void)setShareIDUpdate:(id)a3
{
}

- (NSString)parentChainProtectionInfoTag
{
  return self->_parentChainProtectionInfoTag;
}

- (void)setParentChainProtectionInfoTag:(id)a3
{
}

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_shareIDUpdate, 0);
  objc_storeStrong((id *)&self->_shareEtag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_parentChainProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_fieldsToDeleteIfExistOnMerges, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_conflictLosersToResolves, 0);
  objc_storeStrong((id *)&self->_conflictLoserUpdate, 0);
}

@end