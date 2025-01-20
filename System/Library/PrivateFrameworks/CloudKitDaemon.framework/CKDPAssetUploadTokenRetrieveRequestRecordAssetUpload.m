@interface CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload
+ (Class)assetFieldsType;
- (BOOL)hasRecordId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordIdentifier)recordId;
- (CKDPRecordType)type;
- (NSMutableArray)assetFields;
- (id)assetFieldsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)assetFieldsCount;
- (unint64_t)hash;
- (void)addAssetFields:(id)a3;
- (void)clearAssetFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetFields:(id)a3;
- (void)setRecordId:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload

- (BOOL)hasRecordId
{
  return self->_recordId != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)clearAssetFields
{
  objc_msgSend_removeAllObjects(self->_assetFields, a2, v2);
}

- (void)addAssetFields:(id)a3
{
  v4 = (const char *)a3;
  assetFields = self->_assetFields;
  v8 = (char *)v4;
  if (!assetFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_assetFields;
    self->_assetFields = v6;

    v4 = v8;
    assetFields = self->_assetFields;
  }
  objc_msgSend_addObject_(assetFields, v4, (uint64_t)v4);
}

- (unint64_t)assetFieldsCount
{
  return objc_msgSend_count(self->_assetFields, a2, v2);
}

- (id)assetFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_assetFields, a2, a3);
}

+ (Class)assetFieldsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload;
  v4 = [(CKDPAssetUploadTokenRetrieveRequestRecordAssetUpload *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  recordId = self->_recordId;
  if (recordId)
  {
    v8 = objc_msgSend_dictionaryRepresentation(recordId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"recordId");
  }
  type = self->_type;
  if (type)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(type, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"type");
  }
  if (objc_msgSend_count(self->_assetFields, v4, v5))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_assetFields, v14, v15);
    v18 = objc_msgSend_initWithCapacity_(v13, v17, v16);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v19 = self->_assetFields;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, v35, 16);
    if (v21)
    {
      uint64_t v24 = v21;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v31 + 1) + 8 * i), v22, v23, (void)v31);
          objc_msgSend_addObject_(v18, v28, (uint64_t)v27);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v31, v35, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v18, @"assetFields");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E5106C((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_recordId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_type) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_assetFields;
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
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  recordId = self->_recordId;
  if (recordId) {
    objc_msgSend_setRecordId_(v17, v4, (uint64_t)recordId);
  }
  type = self->_type;
  if (type) {
    objc_msgSend_setType_(v17, v4, (uint64_t)type);
  }
  if (objc_msgSend_assetFieldsCount(self, v4, (uint64_t)type))
  {
    objc_msgSend_clearAssetFields(v17, v7, v8);
    uint64_t v11 = objc_msgSend_assetFieldsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_assetFieldsAtIndex_(self, v12, i);
        objc_msgSend_addAssetFields_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordId, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_type, v14, (uint64_t)a3);
  uint64_t v16 = (void *)v10[3];
  v10[3] = v15;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = self->_assetFields;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * v23), v20, (uint64_t)a3, (void)v27);
        objc_msgSend_addAssetFields_(v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordId = self->_recordId, uint64_t v9 = v4[2], !((unint64_t)recordId | v9))
     || objc_msgSend_isEqual_(recordId, v7, v9))
    && ((type = self->_type, uint64_t v11 = v4[3], !((unint64_t)type | v11))
     || objc_msgSend_isEqual_(type, v7, v11)))
  {
    assetFields = self->_assetFields;
    uint64_t v13 = v4[1];
    if ((unint64_t)assetFields | v13) {
      char isEqual = objc_msgSend_isEqual_(assetFields, v7, v13);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_recordId, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_type, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_assetFields, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  recordId = self->_recordId;
  uint64_t v7 = *((void *)v5 + 2);
  if (recordId)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(recordId, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setRecordId_(self, v4, v7);
  }
  type = self->_type;
  uint64_t v9 = *((void *)v5 + 3);
  if (type)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(type, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setType_(self, v4, v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v5 + 1);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v17, v21, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addAssetFields_(self, v13, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v17, v21, 16);
    }
    while (v14);
  }
}

- (CKDPRecordIdentifier)recordId
{
  return self->_recordId;
}

- (void)setRecordId:(id)a3
{
}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSMutableArray)assetFields
{
  return self->_assetFields;
}

- (void)setAssetFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_assetFields, 0);
}

@end