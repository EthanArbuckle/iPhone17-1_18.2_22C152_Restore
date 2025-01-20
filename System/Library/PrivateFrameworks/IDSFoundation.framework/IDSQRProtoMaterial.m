@interface IDSQRProtoMaterial
+ (Class)materialInfoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)materialInfos;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialInfoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)materialInfosCount;
- (unint64_t)ownerParticipantId;
- (unint64_t)receiverParticipantId;
- (void)addMaterialInfo:(id)a3;
- (void)clearMaterialInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMaterialInfos:(id)a3;
- (void)setOwnerParticipantId:(unint64_t)a3;
- (void)setReceiverParticipantId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoMaterial

- (void)clearMaterialInfos
{
  objc_msgSend_removeAllObjects(self->_materialInfos, a2, v2, v3);
}

- (void)addMaterialInfo:(id)a3
{
  v4 = (const char *)a3;
  materialInfos = self->_materialInfos;
  v9 = (char *)v4;
  if (!materialInfos)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_materialInfos;
    self->_materialInfos = v7;

    v4 = v9;
    materialInfos = self->_materialInfos;
  }
  objc_msgSend_addObject_(materialInfos, v4, (uint64_t)v4, v5);
}

- (unint64_t)materialInfosCount
{
  return objc_msgSend_count(self->_materialInfos, a2, v2, v3);
}

- (id)materialInfoAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_materialInfos, a2, a3, v3);
}

+ (Class)materialInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoMaterial;
  v4 = [(IDSQRProtoMaterial *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_ownerParticipantId, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"owner_participant_id");

  objc_super v13 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v11, self->_receiverParticipantId, v12);
  objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, v15, @"receiver_participant_id");

  if (objc_msgSend_count(self->_materialInfos, v16, v17, v18))
  {
    id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = objc_msgSend_count(self->_materialInfos, v20, v21, v22);
    v26 = objc_msgSend_initWithCapacity_(v19, v24, v23, v25);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v27 = self->_materialInfos;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v43, v29, v47, 16);
    if (v30)
    {
      uint64_t v34 = v30;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v27);
          }
          v37 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v43 + 1) + 8 * i), v31, v32, v33, (void)v43);
          objc_msgSend_addObject_(v26, v38, (uint64_t)v37, v39);
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v31, (uint64_t)&v43, v33, v47, 16);
      }
      while (v34);
    }

    objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v26, v41, @"material_info");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = self->_materialInfos;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v7, v18, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v14, v13, v18, 16);
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[1] = self->_ownerParticipantId;
  id v22 = v4;
  v4[2] = self->_receiverParticipantId;
  if (objc_msgSend_materialInfosCount(self, v5, v6, v7))
  {
    objc_msgSend_clearMaterialInfos(v22, v8, v9, v10);
    uint64_t v14 = objc_msgSend_materialInfosCount(self, v11, v12, v13);
    if (v14)
    {
      uint64_t v17 = v14;
      for (uint64_t i = 0; i != v17; ++i)
      {
        uint64_t v19 = objc_msgSend_materialInfoAtIndex_(self, v15, i, v16);
        objc_msgSend_addMaterialInfo_(v22, v20, (uint64_t)v19, v21);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = self->_ownerParticipantId;
  v12[2] = self->_receiverParticipantId;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v13 = self->_materialInfos;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v15, v30, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v13);
        }
        id v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v26 + 1) + 8 * v21), v17, (uint64_t)a3, v18, (void)v26);
        objc_msgSend_addMaterialInfo_(v12, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v26, v18, v30, 16);
    }
    while (v19);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && self->_ownerParticipantId == v4[1]
    && self->_receiverParticipantId == v4[2])
  {
    materialInfos = self->_materialInfos;
    uint64_t v11 = v4[3];
    if ((unint64_t)materialInfos | v11) {
      char isEqual = objc_msgSend_isEqual_(materialInfos, v8, v11, v9);
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
  unint64_t v4 = (2654435761u * self->_receiverParticipantId) ^ (2654435761u * self->_ownerParticipantId);
  return v4 ^ objc_msgSend_hash(self->_materialInfos, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_ownerParticipantId = *((void *)v4 + 1);
  self->_receiverParticipantId = *((void *)v4 + 2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v7, v18, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addMaterialInfo_(self, v9, *(void *)(*((void *)&v14 + 1) + 8 * v13++), v10, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v14, v10, v18, 16);
    }
    while (v11);
  }
}

- (unint64_t)ownerParticipantId
{
  return self->_ownerParticipantId;
}

- (void)setOwnerParticipantId:(unint64_t)a3
{
  self->_ownerParticipantId = a3;
}

- (unint64_t)receiverParticipantId
{
  return self->_receiverParticipantId;
}

- (void)setReceiverParticipantId:(unint64_t)a3
{
  self->_receiverParticipantId = a3;
}

- (NSMutableArray)materialInfos
{
  return self->_materialInfos;
}

- (void)setMaterialInfos:(id)a3
{
}

- (void).cxx_destruct
{
}

@end