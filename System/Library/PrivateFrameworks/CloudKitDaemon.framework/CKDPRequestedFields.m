@interface CKDPRequestedFields
+ (Class)fieldsType;
+ (Class)listFieldType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)fields;
- (NSMutableArray)listFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldsAtIndex:(unint64_t)a3;
- (id)listFieldAtIndex:(unint64_t)a3;
- (unint64_t)fieldsCount;
- (unint64_t)hash;
- (unint64_t)listFieldsCount;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)addFields:(id)a3;
- (void)addListField:(id)a3;
- (void)clearFields;
- (void)clearListFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFields:(id)a3;
- (void)setListFields:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRequestedFields

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v9 = objc_msgSend_fields(self, v7, v8);
  uint64_t v12 = objc_msgSend_count(v9, v10, v11);
  v15 = objc_msgSend_listFields(self, v13, v14);
  unint64_t v18 = objc_msgSend_count(v15, v16, v17) + v12;

  v19 = sub_1C4EB6188();
  objc_msgSend_writeData_(v6, v20, (uint64_t)v19);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v23 = objc_msgSend_fields(self, v21, v22);
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v52, v57, 16);
  int v47 = a4;
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = 0;
    uint64_t v29 = *(void *)v53;
    uint64_t v30 = (a4 + 1);
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend__CKLogToFileHandle_atDepth_(*(void **)(*((void *)&v52 + 1) + 8 * i), v26, (uint64_t)v6, v30);
        if (v28 + 1 + i < v18)
        {
          v32 = sub_1C4EB61DC();
          objc_msgSend_writeData_(v6, v33, (uint64_t)v32);
        }
      }
      v28 += v27;
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v52, v57, 16);
    }
    while (v27);
  }
  else
  {
    uint64_t v28 = 0;
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v36 = objc_msgSend_listFields(self, v34, v35);
  uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v48, v56, 16);
  if (v38)
  {
    uint64_t v40 = v38;
    uint64_t v41 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v36);
        }
        objc_msgSend__CKLogToFileHandle_atDepth_(*(void **)(*((void *)&v48 + 1) + 8 * j), v39, (uint64_t)v6, (v47 + 1));
        if (v28 + 1 + j < v18)
        {
          v43 = sub_1C4EB61DC();
          objc_msgSend_writeData_(v6, v44, (uint64_t)v43);
        }
      }
      v28 += v40;
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v48, v56, 16);
    }
    while (v40);
  }

  v45 = sub_1C4EB6230();
  objc_msgSend_writeData_(v6, v46, (uint64_t)v45);
}

- (void)clearFields
{
  objc_msgSend_removeAllObjects(self->_fields, a2, v2);
}

- (void)addFields:(id)a3
{
  v4 = (const char *)a3;
  fields = self->_fields;
  uint64_t v8 = (char *)v4;
  if (!fields)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fields;
    self->_fields = v6;

    v4 = v8;
    fields = self->_fields;
  }
  objc_msgSend_addObject_(fields, v4, (uint64_t)v4);
}

- (unint64_t)fieldsCount
{
  return objc_msgSend_count(self->_fields, a2, v2);
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fields, a2, a3);
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (void)clearListFields
{
  objc_msgSend_removeAllObjects(self->_listFields, a2, v2);
}

- (void)addListField:(id)a3
{
  v4 = (const char *)a3;
  listFields = self->_listFields;
  uint64_t v8 = (char *)v4;
  if (!listFields)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_listFields;
    self->_listFields = v6;

    v4 = v8;
    listFields = self->_listFields;
  }
  objc_msgSend_addObject_(listFields, v4, (uint64_t)v4);
}

- (unint64_t)listFieldsCount
{
  return objc_msgSend_count(self->_listFields, a2, v2);
}

- (id)listFieldAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_listFields, a2, a3);
}

+ (Class)listFieldType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestedFields;
  v4 = [(CKDPRequestedFields *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_fields, v5, v6))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_fields, v10, v11);
    uint64_t v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v15 = self->_fields;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v48, v53, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v48 + 1) + 8 * i), v18, v19);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v48, v53, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v14, @"fields");
  }
  if (objc_msgSend_count(self->_listFields, v7, v8))
  {
    id v26 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v29 = objc_msgSend_count(self->_listFields, v27, v28);
    v31 = objc_msgSend_initWithCapacity_(v26, v30, v29);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v32 = self->_listFields;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v44, v52, 16);
    if (v34)
    {
      uint64_t v37 = v34;
      uint64_t v38 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v45 != v38) {
            objc_enumerationMutation(v32);
          }
          uint64_t v40 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v44 + 1) + 8 * j), v35, v36, (void)v44);
          objc_msgSend_addObject_(v31, v41, (uint64_t)v40);
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v44, v52, 16);
      }
      while (v37);
    }

    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v31, @"list_field");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestedFieldsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = self->_fields;
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

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_listFields;
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
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  if (objc_msgSend_fieldsCount(self, v4, v5))
  {
    objc_msgSend_clearFields(v25, v6, v7);
    uint64_t v10 = objc_msgSend_fieldsCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_fieldsAtIndex_(self, v6, i);
        objc_msgSend_addFields_(v25, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_listFieldsCount(self, v6, v7))
  {
    objc_msgSend_clearListFields(v25, v15, v16);
    uint64_t v19 = objc_msgSend_listFieldsCount(self, v17, v18);
    if (v19)
    {
      uint64_t v21 = v19;
      for (uint64_t j = 0; j != v21; ++j)
      {
        long long v23 = objc_msgSend_listFieldAtIndex_(self, v20, j);
        objc_msgSend_addListField_(v25, v24, (uint64_t)v23);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v11 = self->_fields;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v34, v39, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v34 + 1) + 8 * v17), v14, (uint64_t)a3);
        objc_msgSend_addFields_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v34, v39, 16);
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v20 = self->_listFields;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v38, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (void)v30);
        objc_msgSend_addListField_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v38, 16);
    }
    while (v24);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((fields = self->_fields, uint64_t v9 = v4[1], !((unint64_t)fields | v9))
     || objc_msgSend_isEqual_(fields, v7, v9)))
  {
    listFields = self->_listFields;
    uint64_t v11 = v4[2];
    if ((unint64_t)listFields | v11) {
      char isEqual = objc_msgSend_isEqual_(listFields, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_fields, a2, v2);
  return objc_msgSend_hash(self->_listFields, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4[1];
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addFields_(self, v8, *(void *)(*((void *)&v23 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v23, v28, 16);
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v4[2];
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addListField_(self, v15, *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v19, v27, 16);
    }
    while (v16);
  }
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (NSMutableArray)listFields
{
  return self->_listFields;
}

- (void)setListFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listFields, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end