@interface CKDPMarkAssetBrokenRequest
+ (Class)fileSignatureType;
+ (Class)referenceSignatureType;
+ (id)options;
- (BOOL)hasAffectedRecordType;
- (BOOL)hasBrokenAssetRecordID;
- (BOOL)hasFieldName;
- (BOOL)hasIsPackage;
- (BOOL)hasListIndex;
- (BOOL)hasSkipWriteMissingAssetStatusRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPackage;
- (BOOL)readFrom:(id)a3;
- (BOOL)skipWriteMissingAssetStatusRecord;
- (CKDPRecordIdentifier)brokenAssetRecordID;
- (Class)responseClass;
- (NSMutableArray)fileSignatures;
- (NSMutableArray)referenceSignatures;
- (NSString)affectedRecordType;
- (NSString)fieldName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fileSignatureAtIndex:(unint64_t)a3;
- (id)referenceSignatureAtIndex:(unint64_t)a3;
- (int)listIndex;
- (unint64_t)fileSignaturesCount;
- (unint64_t)hash;
- (unint64_t)referenceSignaturesCount;
- (unsigned)requestTypeCode;
- (void)addFileSignature:(id)a3;
- (void)addReferenceSignature:(id)a3;
- (void)clearFileSignatures;
- (void)clearReferenceSignatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAffectedRecordType:(id)a3;
- (void)setBrokenAssetRecordID:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setFileSignatures:(id)a3;
- (void)setHasIsPackage:(BOOL)a3;
- (void)setHasListIndex:(BOOL)a3;
- (void)setHasSkipWriteMissingAssetStatusRecord:(BOOL)a3;
- (void)setIsPackage:(BOOL)a3;
- (void)setListIndex:(int)a3;
- (void)setReferenceSignatures:(id)a3;
- (void)setSkipWriteMissingAssetStatusRecord:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPMarkAssetBrokenRequest

+ (id)options
{
  if (qword_1EBBCDEF0 != -1) {
    dispatch_once(&qword_1EBBCDEF0, &unk_1F2044410);
  }
  v2 = (void *)qword_1EBBCDEE8;
  return v2;
}

- (BOOL)hasBrokenAssetRecordID
{
  return self->_brokenAssetRecordID != 0;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (void)setListIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_listIndex = a3;
}

- (void)setHasListIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearFileSignatures
{
  objc_msgSend_removeAllObjects(self->_fileSignatures, a2, v2);
}

- (void)addFileSignature:(id)a3
{
  v4 = (const char *)a3;
  fileSignatures = self->_fileSignatures;
  v8 = (char *)v4;
  if (!fileSignatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fileSignatures;
    self->_fileSignatures = v6;

    v4 = v8;
    fileSignatures = self->_fileSignatures;
  }
  objc_msgSend_addObject_(fileSignatures, v4, (uint64_t)v4);
}

- (unint64_t)fileSignaturesCount
{
  return objc_msgSend_count(self->_fileSignatures, a2, v2);
}

- (id)fileSignatureAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fileSignatures, a2, a3);
}

+ (Class)fileSignatureType
{
  return (Class)objc_opt_class();
}

- (void)clearReferenceSignatures
{
  objc_msgSend_removeAllObjects(self->_referenceSignatures, a2, v2);
}

- (void)addReferenceSignature:(id)a3
{
  v4 = (const char *)a3;
  referenceSignatures = self->_referenceSignatures;
  v8 = (char *)v4;
  if (!referenceSignatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_referenceSignatures;
    self->_referenceSignatures = v6;

    v4 = v8;
    referenceSignatures = self->_referenceSignatures;
  }
  objc_msgSend_addObject_(referenceSignatures, v4, (uint64_t)v4);
}

- (unint64_t)referenceSignaturesCount
{
  return objc_msgSend_count(self->_referenceSignatures, a2, v2);
}

- (id)referenceSignatureAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_referenceSignatures, a2, a3);
}

+ (Class)referenceSignatureType
{
  return (Class)objc_opt_class();
}

- (void)setIsPackage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isPackage = a3;
}

- (void)setHasIsPackage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPackage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAffectedRecordType
{
  return self->_affectedRecordType != 0;
}

- (void)setSkipWriteMissingAssetStatusRecord:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_skipWriteMissingAssetStatusRecord = a3;
}

- (void)setHasSkipWriteMissingAssetStatusRecord:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSkipWriteMissingAssetStatusRecord
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPMarkAssetBrokenRequest;
  v4 = [(CKDPMarkAssetBrokenRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  brokenAssetRecordID = self->_brokenAssetRecordID;
  if (brokenAssetRecordID)
  {
    v8 = objc_msgSend_dictionaryRepresentation(brokenAssetRecordID, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"brokenAssetRecordID");
  }
  fieldName = self->_fieldName;
  if (fieldName) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)fieldName, @"fieldName");
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v11 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_listIndex);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"listIndex");
  }
  fileSignatures = self->_fileSignatures;
  if (fileSignatures) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)fileSignatures, @"fileSignature");
  }
  referenceSignatures = self->_referenceSignatures;
  if (referenceSignatures) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)referenceSignatures, @"referenceSignature");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isPackage);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"isPackage");
  }
  affectedRecordType = self->_affectedRecordType;
  if (affectedRecordType) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)affectedRecordType, @"affectedRecordType");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v18 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_skipWriteMissingAssetStatusRecord);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"skipWriteMissingAssetStatusRecord");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F5281C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_brokenAssetRecordID) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_fieldName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_fileSignatures;
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
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_referenceSignatures;
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
        PBDataWriterWriteDataField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_affectedRecordType) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (unsigned)requestTypeCode
{
  return 84;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  brokenAssetRecordID = self->_brokenAssetRecordID;
  v28 = v4;
  if (brokenAssetRecordID)
  {
    objc_msgSend_setBrokenAssetRecordID_(v4, v5, (uint64_t)brokenAssetRecordID);
    id v4 = v28;
  }
  fieldName = self->_fieldName;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v28, v5, (uint64_t)fieldName);
    id v4 = v28;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_listIndex;
    v4[60] |= 1u;
  }
  if (objc_msgSend_fileSignaturesCount(self, v5, (uint64_t)fieldName))
  {
    objc_msgSend_clearFileSignatures(v28, v8, v9);
    uint64_t v12 = objc_msgSend_fileSignaturesCount(self, v10, v11);
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = objc_msgSend_fileSignatureAtIndex_(self, v8, i);
        objc_msgSend_addFileSignature_(v28, v16, (uint64_t)v15);
      }
    }
  }
  if (objc_msgSend_referenceSignaturesCount(self, v8, v9))
  {
    objc_msgSend_clearReferenceSignatures(v28, v17, v18);
    uint64_t v21 = objc_msgSend_referenceSignaturesCount(self, v19, v20);
    if (v21)
    {
      uint64_t v22 = v21;
      for (uint64_t j = 0; j != v22; ++j)
      {
        long long v24 = objc_msgSend_referenceSignatureAtIndex_(self, v17, j);
        objc_msgSend_addReferenceSignature_(v28, v25, (uint64_t)v24);
      }
    }
  }
  long long v26 = v28;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v28[56] = self->_isPackage;
    v28[60] |= 2u;
  }
  affectedRecordType = self->_affectedRecordType;
  if (affectedRecordType)
  {
    objc_msgSend_setAffectedRecordType_(v28, v17, (uint64_t)affectedRecordType);
    long long v26 = v28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v26[57] = self->_skipWriteMissingAssetStatusRecord;
    v26[60] |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_brokenAssetRecordID, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_fieldName, v14, (uint64_t)a3);
  uint64_t v16 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 40) = self->_listIndex;
    *(unsigned char *)(v10 + 60) |= 1u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v17 = self->_fileSignatures;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, v48, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v17);
        }
        long long v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v43 + 1) + 8 * i), v20, (uint64_t)a3);
        objc_msgSend_addFileSignature_((void *)v10, v25, (uint64_t)v24);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, v48, 16);
    }
    while (v21);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v26 = self->_referenceSignatures;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, v47, 16);
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v26);
        }
        v33 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v39 + 1) + 8 * j), v29, (uint64_t)a3, (void)v39);
        objc_msgSend_addReferenceSignature_((void *)v10, v34, (uint64_t)v33);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, v47, 16);
    }
    while (v30);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v10 + 56) = self->_isPackage;
    *(unsigned char *)(v10 + 60) |= 2u;
  }
  uint64_t v36 = objc_msgSend_copyWithZone_(self->_affectedRecordType, v35, (uint64_t)a3, (void)v39);
  v37 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v36;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v10 + 57) = self->_skipWriteMissingAssetStatusRecord;
    *(unsigned char *)(v10 + 60) |= 4u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_28;
  }
  brokenAssetRecordID = self->_brokenAssetRecordID;
  uint64_t v9 = v4[2];
  if ((unint64_t)brokenAssetRecordID | v9)
  {
    if (!objc_msgSend_isEqual_(brokenAssetRecordID, v7, v9)) {
      goto LABEL_28;
    }
  }
  fieldName = self->_fieldName;
  uint64_t v11 = v4[3];
  if ((unint64_t)fieldName | v11)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v11)) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_listIndex != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  fileSignatures = self->_fileSignatures;
  uint64_t v13 = v4[4];
  if ((unint64_t)fileSignatures | v13 && !objc_msgSend_isEqual_(fileSignatures, v7, v13)) {
    goto LABEL_28;
  }
  referenceSignatures = self->_referenceSignatures;
  uint64_t v15 = v4[6];
  if ((unint64_t)referenceSignatures | v15)
  {
    if (!objc_msgSend_isEqual_(referenceSignatures, v7, v15)) {
      goto LABEL_28;
    }
  }
  char has = (char)self->_has;
  char v17 = *((unsigned char *)v4 + 60);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_isPackage)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  affectedRecordType = self->_affectedRecordType;
  uint64_t v19 = v4[1];
  if ((unint64_t)affectedRecordType | v19)
  {
    if (!objc_msgSend_isEqual_(affectedRecordType, v7, v19)) {
      goto LABEL_28;
    }
    char has = (char)self->_has;
    char v17 = *((unsigned char *)v4 + 60);
  }
  BOOL v20 = (v17 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v17 & 4) != 0)
    {
      if (self->_skipWriteMissingAssetStatusRecord)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 57))
      {
        goto LABEL_28;
      }
      BOOL v20 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v20 = 0;
  }
LABEL_29:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_brokenAssetRecordID, a2, v2);
  uint64_t v9 = objc_msgSend_hash(self->_fieldName, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_listIndex;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = objc_msgSend_hash(self->_fileSignatures, v7, v8);
  uint64_t v16 = objc_msgSend_hash(self->_referenceSignatures, v12, v13);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v17 = 2654435761 * self->_isPackage;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = objc_msgSend_hash(self->_affectedRecordType, v14, v15);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_skipWriteMissingAssetStatusRecord;
  }
  else {
    uint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  brokenAssetRecordID = self->_brokenAssetRecordID;
  uint64_t v7 = *((void *)v5 + 2);
  if (brokenAssetRecordID)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(brokenAssetRecordID, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setBrokenAssetRecordID_(self, v4, v7);
  }
  uint64_t v8 = *((void *)v5 + 3);
  if (v8) {
    objc_msgSend_setFieldName_(self, v4, v8);
  }
  if (*((unsigned char *)v5 + 60))
  {
    self->_listIndex = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = *((id *)v5 + 4);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v29, v34, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addFileSignature_(self, v12, *(void *)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v29, v34, 16);
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = *((id *)v5 + 6);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v25, v33, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addReferenceSignature_(self, v19, *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v25, v33, 16);
    }
    while (v20);
  }

  if ((*((unsigned char *)v5 + 60) & 2) != 0)
  {
    self->_isPackage = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v24 = *((void *)v5 + 1);
  if (v24) {
    objc_msgSend_setAffectedRecordType_(self, v23, v24);
  }
  if ((*((unsigned char *)v5 + 60) & 4) != 0)
  {
    self->_skipWriteMissingAssetStatusRecord = *((unsigned char *)v5 + 57);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (CKDPRecordIdentifier)brokenAssetRecordID
{
  return self->_brokenAssetRecordID;
}

- (void)setBrokenAssetRecordID:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (int)listIndex
{
  return self->_listIndex;
}

- (NSMutableArray)fileSignatures
{
  return self->_fileSignatures;
}

- (void)setFileSignatures:(id)a3
{
}

- (NSMutableArray)referenceSignatures
{
  return self->_referenceSignatures;
}

- (void)setReferenceSignatures:(id)a3
{
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (NSString)affectedRecordType
{
  return self->_affectedRecordType;
}

- (void)setAffectedRecordType:(id)a3
{
}

- (BOOL)skipWriteMissingAssetStatusRecord
{
  return self->_skipWriteMissingAssetStatusRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignatures, 0);
  objc_storeStrong((id *)&self->_fileSignatures, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_brokenAssetRecordID, 0);
  objc_storeStrong((id *)&self->_affectedRecordType, 0);
}

@end