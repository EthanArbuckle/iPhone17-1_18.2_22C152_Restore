@interface CKDPFieldActionInsertIntoList
+ (Class)valueType;
- (BOOL)hasInsertAfter;
- (BOOL)hasPosition;
- (BOOL)insertAfter;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPListPosition)position;
- (NSMutableArray)values;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValue:(id)a3;
- (void)clearValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInsertAfter:(BOOL)a3;
- (void)setInsertAfter:(BOOL)a3;
- (void)setPosition:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPFieldActionInsertIntoList

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (void)setInsertAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_insertAfter = a3;
}

- (void)setHasInsertAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInsertAfter
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearValues
{
  objc_msgSend_removeAllObjects(self->_values, a2, v2);
}

- (void)addValue:(id)a3
{
  v4 = (const char *)a3;
  values = self->_values;
  v8 = (char *)v4;
  if (!values)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_values;
    self->_values = v6;

    v4 = v8;
    values = self->_values;
  }
  objc_msgSend_addObject_(values, v4, (uint64_t)v4);
}

- (unint64_t)valuesCount
{
  return objc_msgSend_count(self->_values, a2, v2);
}

- (id)valueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_values, a2, a3);
}

+ (Class)valueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPFieldActionInsertIntoList;
  v4 = [(CKDPFieldActionInsertIntoList *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  position = self->_position;
  if (position)
  {
    v8 = objc_msgSend_dictionaryRepresentation(position, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"position");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_insertAfter);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"insert_after");
  }
  if (objc_msgSend_count(self->_values, v4, v5))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(self->_values, v13, v14);
    v17 = objc_msgSend_initWithCapacity_(v12, v16, v15);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v18 = self->_values;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v30, v34, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v18);
          }
          v26 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v30 + 1) + 8 * i), v21, v22, (void)v30);
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v30, v34, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, @"value");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E27718((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_position) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_values;
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
  id v4 = a3;
  position = self->_position;
  uint64_t v17 = v4;
  if (position)
  {
    objc_msgSend_setPosition_(v4, v5, (uint64_t)position);
    id v4 = v17;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_insertAfter;
    v4[28] |= 1u;
  }
  if (objc_msgSend_valuesCount(self, v5, (uint64_t)position))
  {
    objc_msgSend_clearValues(v17, v7, v8);
    uint64_t v11 = objc_msgSend_valuesCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_valueAtIndex_(self, v12, i);
        objc_msgSend_addValue_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_position, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 24) = self->_insertAfter;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_values;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * i), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addValue_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  position = self->_position;
  uint64_t v9 = v4[1];
  if ((unint64_t)position | v9)
  {
    if (!objc_msgSend_isEqual_(position, v7, v9)) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_insertAfter)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char isEqual = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  values = self->_values;
  uint64_t v13 = v4[2];
  if ((unint64_t)values | v13) {
    char isEqual = objc_msgSend_isEqual_(values, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_9:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_position, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_insertAfter;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ objc_msgSend_hash(self->_values, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  position = self->_position;
  uint64_t v7 = *((void *)v5 + 1);
  if (position)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(position, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setPosition_(self, v4, v7);
  }
  if (*((unsigned char *)v5 + 28))
  {
    self->_insertAfter = *((unsigned char *)v5 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addValue_(self, v11, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }
}

- (CKDPListPosition)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
}

- (BOOL)insertAfter
{
  return self->_insertAfter;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_position, 0);
}

@end