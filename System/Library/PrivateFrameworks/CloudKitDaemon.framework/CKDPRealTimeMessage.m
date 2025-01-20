@interface CKDPRealTimeMessage
+ (Class)associatedMergeableDeltasType;
+ (Class)deleteRecordidsType;
+ (Class)saveRecordsType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)associatedMergeableDeltas;
- (NSMutableArray)deleteRecordids;
- (NSMutableArray)saveRecords;
- (id)associatedMergeableDeltasAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deleteRecordidsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)saveRecordsAtIndex:(unint64_t)a3;
- (int)version;
- (unint64_t)associatedMergeableDeltasCount;
- (unint64_t)deleteRecordidsCount;
- (unint64_t)hash;
- (unint64_t)saveRecordsCount;
- (void)addAssociatedMergeableDeltas:(id)a3;
- (void)addDeleteRecordids:(id)a3;
- (void)addSaveRecords:(id)a3;
- (void)clearAssociatedMergeableDeltas;
- (void)clearDeleteRecordids;
- (void)clearSaveRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedMergeableDeltas:(id)a3;
- (void)setDeleteRecordids:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSaveRecords:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRealTimeMessage

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearSaveRecords
{
  objc_msgSend_removeAllObjects(self->_saveRecords, a2, v2);
}

- (void)addSaveRecords:(id)a3
{
  v4 = (const char *)a3;
  saveRecords = self->_saveRecords;
  v8 = (char *)v4;
  if (!saveRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_saveRecords;
    self->_saveRecords = v6;

    v4 = v8;
    saveRecords = self->_saveRecords;
  }
  objc_msgSend_addObject_(saveRecords, v4, (uint64_t)v4);
}

- (unint64_t)saveRecordsCount
{
  return objc_msgSend_count(self->_saveRecords, a2, v2);
}

- (id)saveRecordsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_saveRecords, a2, a3);
}

+ (Class)saveRecordsType
{
  return (Class)objc_opt_class();
}

- (void)clearDeleteRecordids
{
  objc_msgSend_removeAllObjects(self->_deleteRecordids, a2, v2);
}

- (void)addDeleteRecordids:(id)a3
{
  v4 = (const char *)a3;
  deleteRecordids = self->_deleteRecordids;
  v8 = (char *)v4;
  if (!deleteRecordids)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_deleteRecordids;
    self->_deleteRecordids = v6;

    v4 = v8;
    deleteRecordids = self->_deleteRecordids;
  }
  objc_msgSend_addObject_(deleteRecordids, v4, (uint64_t)v4);
}

- (unint64_t)deleteRecordidsCount
{
  return objc_msgSend_count(self->_deleteRecordids, a2, v2);
}

- (id)deleteRecordidsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deleteRecordids, a2, a3);
}

+ (Class)deleteRecordidsType
{
  return (Class)objc_opt_class();
}

- (void)clearAssociatedMergeableDeltas
{
  objc_msgSend_removeAllObjects(self->_associatedMergeableDeltas, a2, v2);
}

- (void)addAssociatedMergeableDeltas:(id)a3
{
  v4 = (const char *)a3;
  associatedMergeableDeltas = self->_associatedMergeableDeltas;
  v8 = (char *)v4;
  if (!associatedMergeableDeltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_associatedMergeableDeltas;
    self->_associatedMergeableDeltas = v6;

    v4 = v8;
    associatedMergeableDeltas = self->_associatedMergeableDeltas;
  }
  objc_msgSend_addObject_(associatedMergeableDeltas, v4, (uint64_t)v4);
}

- (unint64_t)associatedMergeableDeltasCount
{
  return objc_msgSend_count(self->_associatedMergeableDeltas, a2, v2);
}

- (id)associatedMergeableDeltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_associatedMergeableDeltas, a2, a3);
}

+ (Class)associatedMergeableDeltasType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRealTimeMessage;
  v4 = [(CKDPRealTimeMessage *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_version);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"version");
  }
  if (objc_msgSend_count(self->_saveRecords, v4, v5))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = objc_msgSend_count(self->_saveRecords, v12, v13);
    v16 = objc_msgSend_initWithCapacity_(v11, v15, v14);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v17 = self->_saveRecords;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v73, v79, 16);
    if (v19)
    {
      uint64_t v22 = v19;
      uint64_t v23 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v74 != v23) {
            objc_enumerationMutation(v17);
          }
          v25 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v73 + 1) + 8 * i), v20, v21);
          objc_msgSend_addObject_(v16, v26, (uint64_t)v25);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v73, v79, 16);
      }
      while (v22);
    }

    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v16, @"save_records");
  }
  if (objc_msgSend_count(self->_deleteRecordids, v9, v10))
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v33 = objc_msgSend_count(self->_deleteRecordids, v31, v32);
    v35 = objc_msgSend_initWithCapacity_(v30, v34, v33);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v36 = self->_deleteRecordids;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v69, v78, 16);
    if (v38)
    {
      uint64_t v41 = v38;
      uint64_t v42 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v70 != v42) {
            objc_enumerationMutation(v36);
          }
          v44 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v69 + 1) + 8 * j), v39, v40);
          objc_msgSend_addObject_(v35, v45, (uint64_t)v44);
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v69, v78, 16);
      }
      while (v41);
    }

    objc_msgSend_setObject_forKey_(v6, v46, (uint64_t)v35, @"delete_recordids");
  }
  if (objc_msgSend_count(self->_associatedMergeableDeltas, v28, v29))
  {
    id v47 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v50 = objc_msgSend_count(self->_associatedMergeableDeltas, v48, v49);
    v52 = objc_msgSend_initWithCapacity_(v47, v51, v50);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v53 = self->_associatedMergeableDeltas;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v65, v77, 16);
    if (v55)
    {
      uint64_t v58 = v55;
      uint64_t v59 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v66 != v59) {
            objc_enumerationMutation(v53);
          }
          v61 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v65 + 1) + 8 * k), v56, v57, (void)v65);
          objc_msgSend_addObject_(v52, v62, (uint64_t)v61);
        }
        uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v65, v77, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v52, @"associated_mergeable_deltas");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (1)
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_38;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_40;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_38:
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v20) = 0;
          }
LABEL_40:
          self->_version = v20;
          goto LABEL_41;
        case 2u:
          v25 = objc_alloc_init(CKDPRealTimeMessageSaveRecord);
          objc_msgSend_addSaveRecords_(self, v26, (uint64_t)v25);
          if (!PBReaderPlaceMark() || (sub_1C4E2ACFC((uint64_t)v25, (uint64_t)a3) & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_36;
        case 3u:
          v25 = objc_alloc_init(CKDPRealTimeMessageDeleteRecordID);
          objc_msgSend_addDeleteRecordids_(self, v27, (uint64_t)v25);
          if (!PBReaderPlaceMark() || (sub_1C4DF1124((uint64_t)v25, (uint64_t)a3) & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_36;
        case 4u:
          v25 = objc_alloc_init(CKDPRealTimeMessageAssociatedMergeableDeltas);
          objc_msgSend_addAssociatedMergeableDeltas_(self, v28, (uint64_t)v25);
          if (!PBReaderPlaceMark() || !sub_1C4E2BB28((id *)&v25->super.super.isa, (uint64_t)a3))
          {
LABEL_43:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_36:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_42;
          }
          break;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_41;
      }
    }
  }
LABEL_42:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_saveRecords;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = self->_deleteRecordids;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unsigned int v19 = self->_associatedMergeableDeltas;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v35 = v4;
  if (objc_msgSend_saveRecordsCount(self, v5, v6))
  {
    objc_msgSend_clearSaveRecords(v35, v7, v8);
    uint64_t v11 = objc_msgSend_saveRecordsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t v14 = objc_msgSend_saveRecordsAtIndex_(self, v7, i);
        objc_msgSend_addSaveRecords_(v35, v15, (uint64_t)v14);
      }
    }
  }
  if (objc_msgSend_deleteRecordidsCount(self, v7, v8))
  {
    objc_msgSend_clearDeleteRecordids(v35, v16, v17);
    uint64_t v20 = objc_msgSend_deleteRecordidsCount(self, v18, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      for (uint64_t j = 0; j != v21; ++j)
      {
        uint64_t v23 = objc_msgSend_deleteRecordidsAtIndex_(self, v16, j);
        objc_msgSend_addDeleteRecordids_(v35, v24, (uint64_t)v23);
      }
    }
  }
  if (objc_msgSend_associatedMergeableDeltasCount(self, v16, v17))
  {
    objc_msgSend_clearAssociatedMergeableDeltas(v35, v25, v26);
    uint64_t v29 = objc_msgSend_associatedMergeableDeltasCount(self, v27, v28);
    if (v29)
    {
      uint64_t v31 = v29;
      for (uint64_t k = 0; k != v31; ++k)
      {
        long long v33 = objc_msgSend_associatedMergeableDeltasAtIndex_(self, v30, k);
        objc_msgSend_addAssociatedMergeableDeltas_(v35, v34, (uint64_t)v33);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v11 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 32) = self->_version;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = self->_saveRecords;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v48, v54, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v49;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v48 + 1) + 8 * v18), v15, (uint64_t)a3);
        objc_msgSend_addSaveRecords_(v11, v20, (uint64_t)v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v48, v54, 16);
    }
    while (v16);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v21 = self->_deleteRecordids;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v44, v53, 16);
  if (v23)
  {
    uint64_t v25 = v23;
    uint64_t v26 = *(void *)v45;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v44 + 1) + 8 * v27), v24, (uint64_t)a3);
        objc_msgSend_addDeleteRecordids_(v11, v29, (uint64_t)v28);

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v44, v53, 16);
    }
    while (v25);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v30 = self->_associatedMergeableDeltas;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v40, v52, 16);
  if (v32)
  {
    uint64_t v34 = v32;
    uint64_t v35 = *(void *)v41;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v41 != v35) {
          objc_enumerationMutation(v30);
        }
        long long v37 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v40 + 1) + 8 * v36), v33, (uint64_t)a3, (void)v40);
        objc_msgSend_addAssociatedMergeableDeltas_(v11, v38, (uint64_t)v37);

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v40, v52, 16);
    }
    while (v34);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  saveRecords = self->_saveRecords;
  uint64_t v9 = v4[3];
  if ((unint64_t)saveRecords | v9 && !objc_msgSend_isEqual_(saveRecords, v7, v9)) {
    goto LABEL_13;
  }
  deleteRecordids = self->_deleteRecordids;
  uint64_t v11 = v4[2];
  if ((unint64_t)deleteRecordids | v11)
  {
    if (!objc_msgSend_isEqual_(deleteRecordids, v7, v11)) {
      goto LABEL_13;
    }
  }
  associatedMergeableDeltas = self->_associatedMergeableDeltas;
  uint64_t v13 = v4[1];
  if ((unint64_t)associatedMergeableDeltas | v13) {
    char isEqual = objc_msgSend_isEqual_(associatedMergeableDeltas, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_saveRecords, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_deleteRecordids, v6, v7);
  return v5 ^ v8 ^ objc_msgSend_hash(self->_associatedMergeableDeltas, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 36))
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, v41, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_addSaveRecords_(self, v9, *(void *)(*((void *)&v35 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v35, v41, 16);
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v5[2];
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v31, v40, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend_addDeleteRecordids_(self, v16, *(void *)(*((void *)&v31 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v31, v40, 16);
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v5[1];
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v27, v39, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend_addAssociatedMergeableDeltas_(self, v23, *(void *)(*((void *)&v27 + 1) + 8 * v26++), (void)v27);
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v27, v39, 16);
    }
    while (v24);
  }
}

- (int)version
{
  return self->_version;
}

- (NSMutableArray)saveRecords
{
  return self->_saveRecords;
}

- (void)setSaveRecords:(id)a3
{
}

- (NSMutableArray)deleteRecordids
{
  return self->_deleteRecordids;
}

- (void)setDeleteRecordids:(id)a3
{
}

- (NSMutableArray)associatedMergeableDeltas
{
  return self->_associatedMergeableDeltas;
}

- (void)setAssociatedMergeableDeltas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRecords, 0);
  objc_storeStrong((id *)&self->_deleteRecordids, 0);
  objc_storeStrong((id *)&self->_associatedMergeableDeltas, 0);
}

@end