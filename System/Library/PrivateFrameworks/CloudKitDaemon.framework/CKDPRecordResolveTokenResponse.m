@interface CKDPRecordResolveTokenResponse
+ (Class)recordType;
- (BOOL)hasContainer;
- (BOOL)hasContainerEnvironment;
- (BOOL)hasRecordZone;
- (BOOL)hasShareMetadata;
- (BOOL)hasShareRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)shareRecord;
- (CKDPShareMetadata)shareMetadata;
- (CKDPZone)recordZone;
- (NSMutableArray)records;
- (NSString)container;
- (id)containerEnvironmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordAtIndex:(unint64_t)a3;
- (int)StringAsContainerEnvironment:(id)a3;
- (int)containerEnvironment;
- (unint64_t)hash;
- (unint64_t)recordsCount;
- (void)addRecord:(id)a3;
- (void)clearRecords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerEnvironment:(int)a3;
- (void)setHasContainerEnvironment:(BOOL)a3;
- (void)setRecordZone:(id)a3;
- (void)setRecords:(id)a3;
- (void)setShareMetadata:(id)a3;
- (void)setShareRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordResolveTokenResponse

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (int)containerEnvironment
{
  if (*(unsigned char *)&self->_has) {
    return self->_containerEnvironment;
  }
  else {
    return 2;
  }
}

- (void)setContainerEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containerEnvironment = a3;
}

- (void)setHasContainerEnvironment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerEnvironment
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)containerEnvironmentAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"production";
  }
  else if (a3 == 2)
  {
    v4 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsContainerEnvironment:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"production") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"sandbox")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (void)clearRecords
{
  objc_msgSend_removeAllObjects(self->_records, a2, v2);
}

- (void)addRecord:(id)a3
{
  v4 = (const char *)a3;
  records = self->_records;
  v8 = (char *)v4;
  if (!records)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_records;
    self->_records = v6;

    v4 = v8;
    records = self->_records;
  }
  objc_msgSend_addObject_(records, v4, (uint64_t)v4);
}

- (unint64_t)recordsCount
{
  return objc_msgSend_count(self->_records, a2, v2);
}

- (id)recordAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_records, a2, a3);
}

+ (Class)recordType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareRecord
{
  return self->_shareRecord != 0;
}

- (BOOL)hasShareMetadata
{
  return self->_shareMetadata != 0;
}

- (BOOL)hasRecordZone
{
  return self->_recordZone != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordResolveTokenResponse;
  v4 = [(CKDPRecordResolveTokenResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  container = self->_container;
  if (container) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)container, @"container");
  }
  if (*(unsigned char *)&self->_has)
  {
    int containerEnvironment = self->_containerEnvironment;
    if (containerEnvironment == 1)
    {
      v9 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"containerEnvironment");
    }
    else if (containerEnvironment == 2)
    {
      v9 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"containerEnvironment");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_containerEnvironment);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"containerEnvironment");
    }
  }
  if (objc_msgSend_count(self->_records, v5, (uint64_t)container))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_records, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v19 = self->_records;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v40, v44, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v40 + 1) + 8 * i), v22, v23);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v40, v44, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, @"record");
  }
  shareRecord = self->_shareRecord;
  if (shareRecord)
  {
    v31 = objc_msgSend_dictionaryRepresentation(shareRecord, v11, v12);
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, @"shareRecord");
  }
  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    v34 = objc_msgSend_dictionaryRepresentation(shareMetadata, v11, v12);
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, @"shareMetadata");
  }
  recordZone = self->_recordZone;
  if (recordZone)
  {
    v37 = objc_msgSend_dictionaryRepresentation(recordZone, v11, v12);
    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v37, @"recordZone");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D47B98((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_container) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_records;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_shareRecord) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_shareMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordZone) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  container = self->_container;
  id v20 = v4;
  if (container)
  {
    objc_msgSend_setContainer_(v4, v5, (uint64_t)container);
    id v4 = v20;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_containerEnvironment;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (objc_msgSend_recordsCount(self, v5, (uint64_t)container))
  {
    objc_msgSend_clearRecords(v20, v7, v8);
    uint64_t v11 = objc_msgSend_recordsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_recordAtIndex_(self, v7, i);
        objc_msgSend_addRecord_(v20, v15, (uint64_t)v14);
      }
    }
  }
  shareRecord = self->_shareRecord;
  if (shareRecord) {
    objc_msgSend_setShareRecord_(v20, v7, (uint64_t)shareRecord);
  }
  shareMetadata = self->_shareMetadata;
  v18 = v20;
  if (shareMetadata)
  {
    objc_msgSend_setShareMetadata_(v20, v7, (uint64_t)shareMetadata);
    v18 = v20;
  }
  recordZone = self->_recordZone;
  if (recordZone)
  {
    objc_msgSend_setRecordZone_(v20, v7, (uint64_t)recordZone);
    v18 = v20;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_container, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_containerEnvironment;
    *(unsigned char *)(v10 + 56) |= 1u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v14 = self->_records;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v33, v37, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v33 + 1) + 8 * i), v17, (uint64_t)a3, (void)v33);
        objc_msgSend_addRecord_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v33, v37, 16);
    }
    while (v18);
  }

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_shareRecord, v23, (uint64_t)a3);
  uint64_t v25 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_shareMetadata, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_recordZone, v29, (uint64_t)a3);
  v31 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v30;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_17;
  }
  container = self->_container;
  uint64_t v9 = v4[1];
  if ((unint64_t)container | v9)
  {
    if (!objc_msgSend_isEqual_(container, v7, v9)) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[7] & 1) == 0 || self->_containerEnvironment != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (v4[7])
  {
LABEL_17:
    char isEqual = 0;
    goto LABEL_18;
  }
  records = self->_records;
  uint64_t v11 = v4[4];
  if ((unint64_t)records | v11 && !objc_msgSend_isEqual_(records, v7, v11)) {
    goto LABEL_17;
  }
  shareRecord = self->_shareRecord;
  uint64_t v13 = v4[6];
  if ((unint64_t)shareRecord | v13)
  {
    if (!objc_msgSend_isEqual_(shareRecord, v7, v13)) {
      goto LABEL_17;
    }
  }
  shareMetadata = self->_shareMetadata;
  uint64_t v15 = v4[5];
  if ((unint64_t)shareMetadata | v15)
  {
    if (!objc_msgSend_isEqual_(shareMetadata, v7, v15)) {
      goto LABEL_17;
    }
  }
  recordZone = self->_recordZone;
  uint64_t v17 = v4[3];
  if ((unint64_t)recordZone | v17) {
    char isEqual = objc_msgSend_isEqual_(recordZone, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_container, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_containerEnvironment;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 ^ v4;
  uint64_t v9 = objc_msgSend_hash(self->_records, v5, v6);
  uint64_t v12 = v8 ^ v9 ^ objc_msgSend_hash(self->_shareRecord, v10, v11);
  uint64_t v15 = objc_msgSend_hash(self->_shareMetadata, v13, v14);
  return v12 ^ v15 ^ objc_msgSend_hash(self->_recordZone, v16, v17);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 1);
  if (v6) {
    objc_msgSend_setContainer_(self, v4, v6);
  }
  if (*((unsigned char *)v5 + 56))
  {
    self->_int containerEnvironment = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = *((id *)v5 + 4);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, v25, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_addRecord_(self, v10, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, v25, 16);
    }
    while (v11);
  }

  shareRecord = self->_shareRecord;
  uint64_t v16 = *((void *)v5 + 6);
  if (shareRecord)
  {
    if (v16) {
      objc_msgSend_mergeFrom_(shareRecord, v14, v16);
    }
  }
  else if (v16)
  {
    objc_msgSend_setShareRecord_(self, v14, v16);
  }
  shareMetadata = self->_shareMetadata;
  uint64_t v18 = *((void *)v5 + 5);
  if (shareMetadata)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(shareMetadata, v14, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setShareMetadata_(self, v14, v18);
  }
  recordZone = self->_recordZone;
  uint64_t v20 = *((void *)v5 + 3);
  if (recordZone)
  {
    if (v20) {
      objc_msgSend_mergeFrom_(recordZone, v14, v20);
    }
  }
  else if (v20)
  {
    objc_msgSend_setRecordZone_(self, v14, v20);
  }
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (CKDPRecord)shareRecord
{
  return self->_shareRecord;
}

- (void)setShareRecord:(id)a3
{
}

- (CKDPShareMetadata)shareMetadata
{
  return self->_shareMetadata;
}

- (void)setShareMetadata:(id)a3
{
}

- (CKDPZone)recordZone
{
  return self->_recordZone;
}

- (void)setRecordZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRecord, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end