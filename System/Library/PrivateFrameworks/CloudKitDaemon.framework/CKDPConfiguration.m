@interface CKDPConfiguration
+ (Class)fieldsType;
- (BOOL)hasCreated;
- (BOOL)hasExpires;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)fields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldsAtIndex:(unint64_t)a3;
- (unint64_t)created;
- (unint64_t)expires;
- (unint64_t)fieldsCount;
- (unint64_t)hash;
- (void)addFields:(id)a3;
- (void)clearFields;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreated:(unint64_t)a3;
- (void)setExpires:(unint64_t)a3;
- (void)setFields:(id)a3;
- (void)setHasCreated:(BOOL)a3;
- (void)setHasExpires:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPConfiguration

- (void)clearFields
{
  objc_msgSend_removeAllObjects(self->_fields, a2, v2);
}

- (void)addFields:(id)a3
{
  v4 = (const char *)a3;
  fields = self->_fields;
  v8 = (char *)v4;
  if (!fields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

- (void)setCreated:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_created = a3;
}

- (void)setHasCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpires:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expires = a3;
}

- (void)setHasExpires:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpires
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPConfiguration;
  v4 = [(CKDPConfiguration *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (objc_msgSend_count(self->_fields, v5, v6))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = objc_msgSend_count(self->_fields, v9, v10);
    v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v14 = self->_fields;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, v35, 16);
    if (v16)
    {
      uint64_t v19 = v16;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v14);
          }
          v22 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v31 + 1) + 8 * i), v17, v18, (void)v31);
          objc_msgSend_addObject_(v13, v23, (uint64_t)v22);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v31, v35, 16);
      }
      while (v19);
    }

    objc_msgSend_setObject_forKey_(v4, v24, (uint64_t)v13, @"fields");
  }
  char has = (char)self->_has;
  if (has)
  {
    v26 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v7, self->_created);
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, @"created");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v28 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v7, self->_expires);
    objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v28, @"expires");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        goto LABEL_50;
      }
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
        goto LABEL_50;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        unint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          uint64_t v29 = *v4;
          unint64_t v30 = *(void *)((char *)a3 + v29);
          if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v30);
          *(void *)((char *)a3 + v29) = v30 + 1;
          v23 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0) {
            goto LABEL_45;
          }
          v27 += 7;
          BOOL v15 = v28++ >= 9;
          if (v15)
          {
            unint64_t v23 = 0;
            goto LABEL_47;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_45:
        if (*((unsigned char *)a3 + *v6)) {
          unint64_t v23 = 0;
        }
LABEL_47:
        uint64_t v33 = 8;
LABEL_48:
        *(Class *)((char *)&self->super.super.isa + v33) = (Class)v23;
        goto LABEL_49;
      }
      if (v18 == 1)
      {
        uint64_t v19 = objc_alloc_init(CKDPConfigurationField);
        objc_msgSend_addFields_(self, v20, (uint64_t)v19);
        if (!PBReaderPlaceMark() || !sub_1C4DF6328((uint64_t)v19, (uint64_t)a3))
        {

          LOBYTE(v32) = 0;
          return v32;
        }
        PBReaderRecallMark();
      }
      else
      {
        int v32 = PBReaderSkipValueWithTag();
        if (!v32) {
          return v32;
        }
      }
LABEL_49:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        goto LABEL_50;
      }
    }
    char v21 = 0;
    unsigned int v22 = 0;
    unint64_t v23 = 0;
    *(unsigned char *)&self->_has |= 2u;
    while (1)
    {
      uint64_t v24 = *v4;
      unint64_t v25 = *(void *)((char *)a3 + v24);
      if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5)) {
        break;
      }
      char v26 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
      *(void *)((char *)a3 + v24) = v25 + 1;
      v23 |= (unint64_t)(v26 & 0x7F) << v21;
      if ((v26 & 0x80) == 0) {
        goto LABEL_41;
      }
      v21 += 7;
      BOOL v15 = v22++ >= 9;
      if (v15)
      {
        unint64_t v23 = 0;
        goto LABEL_43;
      }
    }
    *((unsigned char *)a3 + *v6) = 1;
LABEL_41:
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v23 = 0;
    }
LABEL_43:
    uint64_t v33 = 16;
    goto LABEL_48;
  }
LABEL_50:
  LOBYTE(v32) = *((unsigned char *)a3 + *v6) == 0;
  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_fields;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, v17, 16);
    }
    while (v8);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  if (objc_msgSend_fieldsCount(self, v4, v5))
  {
    objc_msgSend_clearFields(v17, v6, v7);
    uint64_t v10 = objc_msgSend_fieldsCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_fieldsAtIndex_(self, v11, i);
        objc_msgSend_addFields_(v17, v15, (uint64_t)v14);
      }
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v17 + 1) = self->_created;
    *((unsigned char *)v17 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v17 + 2) = self->_expires;
    *((unsigned char *)v17 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v11 = self->_fields;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, v26, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v22 + 1) + 8 * i), v14, (uint64_t)a3, (void)v22);
        objc_msgSend_addFields_((void *)v10, v19, (uint64_t)v18);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v22, v26, 16);
    }
    while (v15);
  }

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v10 + 8) = self->_created;
    *(unsigned char *)(v10 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v10 + 16) = self->_expires;
    *(unsigned char *)(v10 + 32) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  fields = self->_fields;
  uint64_t v9 = v4[3];
  if ((unint64_t)fields | v9)
  {
    if (!objc_msgSend_isEqual_(fields, v7, v9)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_created != v4[1]) {
      goto LABEL_13;
    }
  }
  else if (v4[4])
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  BOOL v10 = (v4[4] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_expires != v4[2]) {
      goto LABEL_13;
    }
    BOOL v10 = 1;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_fields, a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v5 = 2654435761u * self->_created;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    return v5 ^ v4 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_expires;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_addFields_(self, v8, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v4 + 32);
  if (v12)
  {
    self->_created = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v12 = *((unsigned char *)v4 + 32);
  }
  if ((v12 & 2) != 0)
  {
    self->_expires = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (unint64_t)created
{
  return self->_created;
}

- (unint64_t)expires
{
  return self->_expires;
}

- (void).cxx_destruct
{
}

@end