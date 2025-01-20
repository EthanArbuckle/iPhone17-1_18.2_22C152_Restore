@interface IDSQRProtoPutMaterialIndication
+ (Class)materialsType;
- (BOOL)hasMissingMaterial;
- (BOOL)hasTxnId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoPutMaterialErrorIndication)missingMaterial;
- (NSMutableArray)materials;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)materialsCount;
- (unint64_t)txnId;
- (void)addMaterials:(id)a3;
- (void)clearMaterials;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTxnId:(BOOL)a3;
- (void)setMaterials:(id)a3;
- (void)setMissingMaterial:(id)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPutMaterialIndication

- (void)clearMaterials
{
  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)addMaterials:(id)a3
{
  v4 = (const char *)a3;
  materials = self->_materials;
  v9 = (char *)v4;
  if (!materials)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_materials;
    self->_materials = v7;

    v4 = v9;
    materials = self->_materials;
  }
  objc_msgSend_addObject_(materials, v4, (uint64_t)v4, v5);
}

- (unint64_t)materialsCount
{
  return objc_msgSend_count(self->_materials, a2, v2, v3);
}

- (id)materialsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_materials, a2, a3, v3);
}

+ (Class)materialsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMissingMaterial
{
  return self->_missingMaterial != 0;
}

- (void)setTxnId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPutMaterialIndication;
  v4 = [(IDSQRProtoPutMaterialIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (objc_msgSend_count(self->_materials, v6, v7, v8))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v16 = objc_msgSend_count(self->_materials, v13, v14, v15);
    v19 = objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v20 = self->_materials;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v43, v22, v47, 16);
    if (v23)
    {
      uint64_t v27 = v23;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v20);
          }
          v30 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v43 + 1) + 8 * i), v24, v25, v26, (void)v43);
          objc_msgSend_addObject_(v19, v31, (uint64_t)v30, v32);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v24, (uint64_t)&v43, v26, v47, 16);
      }
      while (v27);
    }

    objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v19, v34, @"materials");
  }
  missingMaterial = self->_missingMaterial;
  if (missingMaterial)
  {
    v36 = objc_msgSend_dictionaryRepresentation(missingMaterial, v9, v10, v11);
    objc_msgSend_setObject_forKey_(v5, v37, (uint64_t)v36, v38, @"missing_material");
  }
  if (*(unsigned char *)&self->_has)
  {
    v39 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, self->_txnId, v11);
    objc_msgSend_setObject_forKey_(v5, v40, (uint64_t)v39, v41, @"txn_id");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPutMaterialIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_materials;
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

  if (self->_missingMaterial) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (objc_msgSend_materialsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterials(v20, v7, v8, v9);
    uint64_t v13 = objc_msgSend_materialsCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        long long v16 = objc_msgSend_materialsAtIndex_(self, v7, i, v9);
        objc_msgSend_addMaterials_(v20, v17, (uint64_t)v16, v18);
      }
    }
  }
  missingMaterial = self->_missingMaterial;
  if (missingMaterial) {
    objc_msgSend_setMissingMaterial_(v20, v7, (uint64_t)missingMaterial, v9);
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v20 + 1) = self->_txnId;
    *((unsigned char *)v20 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = self->_materials;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v30, v15, v34, 16);
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v31;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v13);
        }
        double v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v21), v17, (uint64_t)a3, v18, (void)v30);
        objc_msgSend_addMaterials_((void *)v12, v23, (uint64_t)v22, v24);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v30, v18, v34, 16);
    }
    while (v19);
  }

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_missingMaterial, v25, (uint64_t)a3, v26);
  uint64_t v28 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v27;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_txnId;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_10;
  }
  materials = self->_materials;
  uint64_t v11 = v4[2];
  if ((unint64_t)materials | v11)
  {
    if (!objc_msgSend_isEqual_(materials, v8, v11, v9)) {
      goto LABEL_10;
    }
  }
  missingMaterial = self->_missingMaterial;
  uint64_t v13 = v4[3];
  if ((unint64_t)missingMaterial | v13)
  {
    if (!objc_msgSend_isEqual_(missingMaterial, v8, v13, v9)) {
      goto LABEL_10;
    }
  }
  BOOL v14 = (v4[4] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) != 0 && self->_txnId == v4[1])
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_materials, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_missingMaterial, v6, v7, v8);
  if (*(unsigned char *)&self->_has) {
    unint64_t v10 = 2654435761u * self->_txnId;
  }
  else {
    unint64_t v10 = 0;
  }
  return v9 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v18, v7, v22, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addMaterials_(self, v9, *(void *)(*((void *)&v18 + 1) + 8 * i), v10, (void)v18);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v18, v10, v22, 16);
    }
    while (v11);
  }

  missingMaterial = self->_missingMaterial;
  uint64_t v17 = *((void *)v4 + 3);
  if (missingMaterial)
  {
    if (v17) {
      objc_msgSend_mergeFrom_(missingMaterial, v14, v17, v15);
    }
  }
  else if (v17)
  {
    objc_msgSend_setMissingMaterial_(self, v14, v17, v15);
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_txnId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)materials
{
  return self->_materials;
}

- (void)setMaterials:(id)a3
{
}

- (IDSQRProtoPutMaterialErrorIndication)missingMaterial
{
  return self->_missingMaterial;
}

- (void)setMissingMaterial:(id)a3
{
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingMaterial, 0);
  objc_storeStrong((id *)&self->_materials, 0);
}

@end