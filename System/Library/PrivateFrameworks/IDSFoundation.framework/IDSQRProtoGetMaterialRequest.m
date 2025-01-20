@interface IDSQRProtoGetMaterialRequest
+ (Class)materialOwnersType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)materialOwners;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialOwnersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)materialOwnersCount;
- (void)addMaterialOwners:(id)a3;
- (void)clearMaterialOwners;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMaterialOwners:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoGetMaterialRequest

- (void)clearMaterialOwners
{
  objc_msgSend_removeAllObjects(self->_materialOwners, a2, v2, v3);
}

- (void)addMaterialOwners:(id)a3
{
  v4 = (const char *)a3;
  materialOwners = self->_materialOwners;
  v9 = (char *)v4;
  if (!materialOwners)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = self->_materialOwners;
    self->_materialOwners = v7;

    v4 = v9;
    materialOwners = self->_materialOwners;
  }
  objc_msgSend_addObject_(materialOwners, v4, (uint64_t)v4, v5);
}

- (unint64_t)materialOwnersCount
{
  return objc_msgSend_count(self->_materialOwners, a2, v2, v3);
}

- (id)materialOwnersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_materialOwners, a2, a3, v3);
}

+ (Class)materialOwnersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoGetMaterialRequest;
  v4 = [(IDSQRProtoGetMaterialRequest *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (objc_msgSend_count(self->_materialOwners, v6, v7, v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_materialOwners, v10, v11, v12);
    v16 = objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v17 = self->_materialOwners;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v33, v19, v37, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v17);
          }
          v27 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v33 + 1) + 8 * i), v21, v22, v23, (void)v33);
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v33, v23, v37, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, @"material_owners");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoGetMaterialRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_materialOwners;
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
  id v21 = a3;
  if (objc_msgSend_materialOwnersCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterialOwners(v21, v7, v8, v9);
    uint64_t v13 = objc_msgSend_materialOwnersCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v16 = v13;
      for (uint64_t i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_materialOwnersAtIndex_(self, v14, i, v15);
        objc_msgSend_addMaterialOwners_(v21, v19, (uint64_t)v18, v20);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  double v12 = objc_msgSend_init(v8, v9, v10, v11);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v13 = self->_materialOwners;
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
        uint64_t v22 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v26 + 1) + 8 * v21), v17, (uint64_t)a3, v18, (void)v26);
        objc_msgSend_addMaterialOwners_(v12, v23, (uint64_t)v22, v24);

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
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    materialOwners = self->_materialOwners;
    uint64_t v11 = v4[1];
    if ((unint64_t)materialOwners | v11) {
      char isEqual = objc_msgSend_isEqual_(materialOwners, v8, v11, v9);
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
  return objc_msgSend_hash(self->_materialOwners, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, v6, v17, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_addMaterialOwners_(self, v8, *(void *)(*((void *)&v13 + 1) + 8 * v12++), v9, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v13, v9, v17, 16);
    }
    while (v10);
  }
}

- (NSMutableArray)materialOwners
{
  return self->_materialOwners;
}

- (void)setMaterialOwners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end