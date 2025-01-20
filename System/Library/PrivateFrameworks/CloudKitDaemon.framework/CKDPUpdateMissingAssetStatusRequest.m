@interface CKDPUpdateMissingAssetStatusRequest
+ (Class)packagePutReceiptsType;
+ (id)options;
- (BOOL)hasAssetPutReceipt;
- (BOOL)hasAssetSize;
- (BOOL)hasMissingAssetStatusRecordID;
- (BOOL)hasRecovered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)recovered;
- (CKDPRecordIdentifier)missingAssetStatusRecordID;
- (Class)responseClass;
- (NSMutableArray)packagePutReceipts;
- (NSString)assetPutReceipt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)packagePutReceiptsAtIndex:(unint64_t)a3;
- (int64_t)assetSize;
- (int64_t)packageAssetSizeAtIndex:(unint64_t)a3;
- (int64_t)packageAssetSizes;
- (unint64_t)hash;
- (unint64_t)packageAssetSizesCount;
- (unint64_t)packagePutReceiptsCount;
- (unsigned)requestTypeCode;
- (void)addPackageAssetSize:(int64_t)a3;
- (void)addPackagePutReceipts:(id)a3;
- (void)clearPackageAssetSizes;
- (void)clearPackagePutReceipts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssetPutReceipt:(id)a3;
- (void)setAssetSize:(int64_t)a3;
- (void)setHasAssetSize:(BOOL)a3;
- (void)setHasRecovered:(BOOL)a3;
- (void)setMissingAssetStatusRecordID:(id)a3;
- (void)setPackageAssetSizes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setPackagePutReceipts:(id)a3;
- (void)setRecovered:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUpdateMissingAssetStatusRequest

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPUpdateMissingAssetStatusRequest;
  [(CKDPUpdateMissingAssetStatusRequest *)&v3 dealloc];
}

+ (id)options
{
  if (qword_1EBBCDE40 != -1) {
    dispatch_once(&qword_1EBBCDE40, &unk_1F2043E70);
  }
  v2 = (void *)qword_1EBBCDE38;
  return v2;
}

- (BOOL)hasMissingAssetStatusRecordID
{
  return self->_missingAssetStatusRecordID != 0;
}

- (void)setRecovered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recovered = a3;
}

- (void)setHasRecovered:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecovered
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssetSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assetSize = a3;
}

- (void)setHasAssetSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssetPutReceipt
{
  return self->_assetPutReceipt != 0;
}

- (unint64_t)packageAssetSizesCount
{
  return self->_packageAssetSizes.count;
}

- (int64_t)packageAssetSizes
{
  return self->_packageAssetSizes.list;
}

- (void)clearPackageAssetSizes
{
}

- (void)addPackageAssetSize:(int64_t)a3
{
}

- (int64_t)packageAssetSizeAtIndex:(unint64_t)a3
{
  p_packageAssetSizes = &self->_packageAssetSizes;
  unint64_t count = self->_packageAssetSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", a3, count);
    v10 = objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    objc_msgSend_raise(v10, v11, v12);
  }
  return p_packageAssetSizes->list[a3];
}

- (void)setPackageAssetSizes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (void)clearPackagePutReceipts
{
  objc_msgSend_removeAllObjects(self->_packagePutReceipts, a2, v2);
}

- (void)addPackagePutReceipts:(id)a3
{
  v4 = (const char *)a3;
  packagePutReceipts = self->_packagePutReceipts;
  v8 = (char *)v4;
  if (!packagePutReceipts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_packagePutReceipts;
    self->_packagePutReceipts = v6;

    v4 = v8;
    packagePutReceipts = self->_packagePutReceipts;
  }
  objc_msgSend_addObject_(packagePutReceipts, v4, (uint64_t)v4);
}

- (unint64_t)packagePutReceiptsCount
{
  return objc_msgSend_count(self->_packagePutReceipts, a2, v2);
}

- (id)packagePutReceiptsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_packagePutReceipts, a2, a3);
}

+ (Class)packagePutReceiptsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUpdateMissingAssetStatusRequest;
  v4 = [(CKDPUpdateMissingAssetStatusRequest *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  if (missingAssetStatusRecordID)
  {
    v8 = objc_msgSend_dictionaryRepresentation(missingAssetStatusRecordID, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"missingAssetStatusRecordID");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v11 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_recovered);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"recovered");

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_assetSize);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"assetSize");
  }
  assetPutReceipt = self->_assetPutReceipt;
  if (assetPutReceipt) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)assetPutReceipt, @"assetPutReceipt");
  }
  v16 = PBRepeatedInt64NSArray();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"packageAssetSize");

  packagePutReceipts = self->_packagePutReceipts;
  if (packagePutReceipts) {
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)packagePutReceipts, @"packagePutReceipts");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EE7A8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_missingAssetStatusRecordID) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_assetPutReceipt) {
    PBDataWriterWriteStringField();
  }
  if (self->_packageAssetSizes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v6;
    }
    while (v6 < self->_packageAssetSizes.count);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_packagePutReceipts;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v14, v18, 16);
    }
    while (v10);
  }
}

- (unsigned)requestTypeCode
{
  return 80;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  id v28 = v4;
  if (missingAssetStatusRecordID)
  {
    objc_msgSend_setMissingAssetStatusRecordID_(v4, v5, (uint64_t)missingAssetStatusRecordID);
    id v4 = v28;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_recovered;
    *((unsigned char *)v4 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 4) = self->_assetSize;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  assetPutReceipt = self->_assetPutReceipt;
  if (assetPutReceipt) {
    objc_msgSend_setAssetPutReceipt_(v28, v5, (uint64_t)assetPutReceipt);
  }
  if (objc_msgSend_packageAssetSizesCount(self, v5, (uint64_t)assetPutReceipt))
  {
    objc_msgSend_clearPackageAssetSizes(v28, v9, v10);
    uint64_t v13 = objc_msgSend_packageAssetSizesCount(self, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_packageAssetSizeAtIndex_(self, v9, i);
        objc_msgSend_addPackageAssetSize_(v28, v17, v16);
      }
    }
  }
  if (objc_msgSend_packagePutReceiptsCount(self, v9, v10))
  {
    objc_msgSend_clearPackagePutReceipts(v28, v18, v19);
    uint64_t v22 = objc_msgSend_packagePutReceiptsCount(self, v20, v21);
    if (v22)
    {
      uint64_t v24 = v22;
      for (uint64_t j = 0; j != v24; ++j)
      {
        v26 = objc_msgSend_packagePutReceiptsAtIndex_(self, v23, j);
        objc_msgSend_addPackagePutReceipts_(v28, v27, (uint64_t)v26);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_missingAssetStatusRecordID, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 64) = self->_recovered;
    *(unsigned char *)(v10 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v10 + 32) = self->_assetSize;
    *(unsigned char *)(v10 + 68) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_assetPutReceipt, v14, (uint64_t)a3);
  long long v17 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v16;

  PBRepeatedInt64Copy();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v18 = self->_packagePutReceipts;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, v32, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v18);
        }
        v25 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v28 + 1) + 8 * i), v21, (uint64_t)a3, (void)v28);
        objc_msgSend_addPackagePutReceipts_((void *)v10, v26, (uint64_t)v25);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, v32, 16);
    }
    while (v22);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_22;
  }
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  uint64_t v9 = v4[6];
  if ((unint64_t)missingAssetStatusRecordID | v9)
  {
    if (!objc_msgSend_isEqual_(missingAssetStatusRecordID, v7, v9)) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) != 0)
    {
      if (self->_recovered)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_22;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_12;
      }
    }
LABEL_22:
    char isEqual = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0) {
    goto LABEL_22;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_assetSize != v4[4]) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_22;
  }
  assetPutReceipt = self->_assetPutReceipt;
  uint64_t v11 = v4[5];
  if ((unint64_t)assetPutReceipt | v11 && !objc_msgSend_isEqual_(assetPutReceipt, v7, v11)
    || !PBRepeatedInt64IsEqual())
  {
    goto LABEL_22;
  }
  packagePutReceipts = self->_packagePutReceipts;
  uint64_t v14 = v4[7];
  if ((unint64_t)packagePutReceipts | v14) {
    char isEqual = objc_msgSend_isEqual_(packagePutReceipts, v12, v14);
  }
  else {
    char isEqual = 1;
  }
LABEL_23:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_missingAssetStatusRecordID, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_recovered;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_assetSize;
LABEL_6:
  uint64_t v9 = v7 ^ v4 ^ v8 ^ objc_msgSend_hash(self->_assetPutReceipt, v5, v6);
  uint64_t v10 = PBRepeatedInt64Hash();
  return v9 ^ v10 ^ objc_msgSend_hash(self->_packagePutReceipts, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  missingAssetStatusRecordID = self->_missingAssetStatusRecordID;
  uint64_t v7 = *((void *)v5 + 6);
  if (missingAssetStatusRecordID)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(missingAssetStatusRecordID, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setMissingAssetStatusRecordID_(self, v4, v7);
  }
  char v8 = *((unsigned char *)v5 + 68);
  if ((v8 & 2) != 0)
  {
    self->_recovered = *((unsigned char *)v5 + 64);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v5 + 68);
  }
  if (v8)
  {
    self->_assetSize = *((void *)v5 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v9 = *((void *)v5 + 5);
  if (v9) {
    objc_msgSend_setAssetPutReceipt_(self, v4, v9);
  }
  uint64_t v10 = objc_msgSend_packageAssetSizesCount(v5, v4, v9);
  if (v10)
  {
    uint64_t v12 = v10;
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v14 = objc_msgSend_packageAssetSizeAtIndex_(v5, v11, i);
      objc_msgSend_addPackageAssetSize_(self, v15, v14);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v5 + 7);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, v27, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend_addPackagePutReceipts_(self, v19, *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v23, v27, 16);
    }
    while (v20);
  }
}

- (CKDPRecordIdentifier)missingAssetStatusRecordID
{
  return self->_missingAssetStatusRecordID;
}

- (void)setMissingAssetStatusRecordID:(id)a3
{
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (int64_t)assetSize
{
  return self->_assetSize;
}

- (NSString)assetPutReceipt
{
  return self->_assetPutReceipt;
}

- (void)setAssetPutReceipt:(id)a3
{
}

- (NSMutableArray)packagePutReceipts
{
  return self->_packagePutReceipts;
}

- (void)setPackagePutReceipts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packagePutReceipts, 0);
  objc_storeStrong((id *)&self->_missingAssetStatusRecordID, 0);
  objc_storeStrong((id *)&self->_assetPutReceipt, 0);
}

@end