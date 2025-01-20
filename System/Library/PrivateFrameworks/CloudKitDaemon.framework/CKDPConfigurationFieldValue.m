@interface CKDPConfigurationFieldValue
+ (Class)fieldValuesType;
+ (Class)listValuesType;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasBytesValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasLongValue;
- (BOOL)hasStringValue;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bytesValue;
- (NSMutableArray)fieldValues;
- (NSMutableArray)listValues;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldValuesAtIndex:(unint64_t)a3;
- (id)listValuesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)longValue;
- (unint64_t)fieldValuesCount;
- (unint64_t)hash;
- (unint64_t)listValuesCount;
- (void)addFieldValues:(id)a3;
- (void)addListValues:(id)a3;
- (void)clearFieldValues;
- (void)clearListValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setBytesValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFieldValues:(id)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasLongValue:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setListValues:(id)a3;
- (void)setLongValue:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPConfigurationFieldValue

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F70B8[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"bytesType"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"BOOLType"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"longType"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"doubleType"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"stringType"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"fieldType"))
  {
    int v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"listType"))
  {
    int v6 = 7;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLongValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_longValue = a3;
}

- (void)setHasLongValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)clearFieldValues
{
  objc_msgSend_removeAllObjects(self->_fieldValues, a2, v2);
}

- (void)addFieldValues:(id)a3
{
  v4 = (const char *)a3;
  fieldValues = self->_fieldValues;
  v8 = (char *)v4;
  if (!fieldValues)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fieldValues;
    self->_fieldValues = v6;

    v4 = v8;
    fieldValues = self->_fieldValues;
  }
  objc_msgSend_addObject_(fieldValues, v4, (uint64_t)v4);
}

- (unint64_t)fieldValuesCount
{
  return objc_msgSend_count(self->_fieldValues, a2, v2);
}

- (id)fieldValuesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldValues, a2, a3);
}

+ (Class)fieldValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearListValues
{
  objc_msgSend_removeAllObjects(self->_listValues, a2, v2);
}

- (void)addListValues:(id)a3
{
  v4 = (const char *)a3;
  listValues = self->_listValues;
  v8 = (char *)v4;
  if (!listValues)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_listValues;
    self->_listValues = v6;

    v4 = v8;
    listValues = self->_listValues;
  }
  objc_msgSend_addObject_(listValues, v4, (uint64_t)v4);
}

- (unint64_t)listValuesCount
{
  return objc_msgSend_count(self->_listValues, a2, v2);
}

- (id)listValuesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_listValues, a2, a3);
}

+ (Class)listValuesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPConfigurationFieldValue;
  v4 = [(CKDPConfigurationFieldValue *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v6 = self->_type - 1;
    if (v6 >= 7)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E64F70B8[v6];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, @"type");
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)bytesValue, @"bytesValue");
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v50 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_BOOLValue);
    objc_msgSend_setObject_forKey_(v5, v51, (uint64_t)v50, @"BOOLValue");

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v52 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_longValue);
  objc_msgSend_setObject_forKey_(v5, v53, (uint64_t)v52, @"longValue");

  if (*(unsigned char *)&self->_has)
  {
LABEL_11:
    v10 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v4, (uint64_t)bytesValue, self->_doubleValue);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"doubleValue");
  }
LABEL_12:
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, @"stringValue");
  }
  if (objc_msgSend_count(self->_fieldValues, v4, (uint64_t)stringValue))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v18 = objc_msgSend_count(self->_fieldValues, v16, v17);
    v20 = objc_msgSend_initWithCapacity_(v15, v19, v18);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v21 = self->_fieldValues;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v58, v63, 16);
    if (v23)
    {
      uint64_t v26 = v23;
      uint64_t v27 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v59 != v27) {
            objc_enumerationMutation(v21);
          }
          v29 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v58 + 1) + 8 * i), v24, v25);
          objc_msgSend_addObject_(v20, v30, (uint64_t)v29);
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v58, v63, 16);
      }
      while (v26);
    }

    objc_msgSend_setObject_forKey_(v5, v31, (uint64_t)v20, @"fieldValues");
  }
  if (objc_msgSend_count(self->_listValues, v13, v14))
  {
    id v32 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v35 = objc_msgSend_count(self->_listValues, v33, v34);
    v37 = objc_msgSend_initWithCapacity_(v32, v36, v35);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v38 = self->_listValues;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v54, v62, 16);
    if (v40)
    {
      uint64_t v43 = v40;
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v38);
          }
          v46 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v54 + 1) + 8 * j), v41, v42);
          objc_msgSend_addObject_(v37, v47, (uint64_t)v46);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v54, v62, 16);
      }
      while (v43);
    }

    objc_msgSend_setObject_forKey_(v5, v48, (uint64_t)v37, @"listValues");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F70C24((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bytesValue) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned int v6 = self->_fieldValues;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, v29, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v24, v29, 16);
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = self->_listValues;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v20, v28, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v19, (uint64_t)&v20, v28, 16);
    }
    while (v16);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[14] = self->_type;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  bytesValue = self->_bytesValue;
  v28 = v4;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v4, v5, (uint64_t)bytesValue);
    id v4 = v28;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 60) = self->_BOOLValue;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_longValue;
  *((unsigned char *)v4 + 64) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 64) |= 1u;
  }
LABEL_9:
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setStringValue_(v28, v5, (uint64_t)stringValue);
  }
  if (objc_msgSend_fieldValuesCount(self, v5, (uint64_t)stringValue))
  {
    objc_msgSend_clearFieldValues(v28, v9, v10);
    uint64_t v13 = objc_msgSend_fieldValuesCount(self, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_fieldValuesAtIndex_(self, v9, i);
        objc_msgSend_addFieldValues_(v28, v17, (uint64_t)v16);
      }
    }
  }
  if (objc_msgSend_listValuesCount(self, v9, v10))
  {
    objc_msgSend_clearListValues(v28, v18, v19);
    uint64_t v22 = objc_msgSend_listValuesCount(self, v20, v21);
    if (v22)
    {
      uint64_t v24 = v22;
      for (uint64_t j = 0; j != v24; ++j)
      {
        long long v26 = objc_msgSend_listValuesAtIndex_(self, v23, j);
        objc_msgSend_addListValues_(v28, v27, (uint64_t)v26);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v10 + 56) = self->_type;
    *(unsigned char *)(v10 + 64) |= 4u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_bytesValue, v11, (uint64_t)a3);
  uint64_t v14 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v13;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v12 + 60) = self->_BOOLValue;
    *(unsigned char *)(v12 + 64) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v12 + 16) = self->_longValue;
  *(unsigned char *)(v12 + 64) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *(double *)(v12 + 8) = self->_doubleValue;
    *(unsigned char *)(v12 + 64) |= 1u;
  }
LABEL_7:
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_stringValue, v15, (uint64_t)a3);
  uint64_t v18 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v17;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v19 = self->_fieldValues;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v42, v47, 16);
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v19);
        }
        long long v26 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v42 + 1) + 8 * i), v22, (uint64_t)a3);
        objc_msgSend_addFieldValues_((void *)v12, v27, (uint64_t)v26);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v42, v47, 16);
    }
    while (v23);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v28 = self->_listValues;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v38, v46, 16);
  if (v30)
  {
    uint64_t v32 = v30;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(v28);
        }
        uint64_t v35 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v38 + 1) + 8 * j), v31, (uint64_t)a3, (void)v38);
        objc_msgSend_addListValues_((void *)v12, v36, (uint64_t)v35);
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v38, v46, 16);
    }
    while (v32);
  }

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_34;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 64);
  if ((has & 4) != 0)
  {
    if ((v4[8] & 4) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_34;
    }
  }
  else if ((v4[8] & 4) != 0)
  {
    goto LABEL_34;
  }
  bytesValue = self->_bytesValue;
  uint64_t v11 = v4[3];
  if ((unint64_t)bytesValue | v11)
  {
    if (!objc_msgSend_isEqual_(bytesValue, v7, v11)) {
      goto LABEL_34;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 64);
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_34;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_18;
      }
    }
LABEL_34:
    char isEqual = 0;
    goto LABEL_35;
  }
  if ((v9 & 8) != 0) {
    goto LABEL_34;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_longValue != v4[2]) {
      goto LABEL_34;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_34;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (v9)
  {
    goto LABEL_34;
  }
  stringValue = self->_stringValue;
  uint64_t v13 = v4[6];
  if ((unint64_t)stringValue | v13 && !objc_msgSend_isEqual_(stringValue, v7, v13)) {
    goto LABEL_34;
  }
  fieldValues = self->_fieldValues;
  uint64_t v15 = v4[4];
  if ((unint64_t)fieldValues | v15)
  {
    if (!objc_msgSend_isEqual_(fieldValues, v7, v15)) {
      goto LABEL_34;
    }
  }
  listValues = self->_listValues;
  uint64_t v17 = v4[5];
  if ((unint64_t)listValues | v17) {
    char isEqual = objc_msgSend_isEqual_(listValues, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_35:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v7 = objc_msgSend_hash(self->_bytesValue, a2, v2);
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v14 = 0;
    goto LABEL_16;
  }
  uint64_t v8 = 2654435761 * self->_BOOLValue;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_longValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double doubleValue = self->_doubleValue;
  double v11 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v11 = self->_doubleValue;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_16:
  unint64_t v15 = v7 ^ v4 ^ v8 ^ v9 ^ v14;
  uint64_t v16 = objc_msgSend_hash(self->_stringValue, v5, v6);
  uint64_t v19 = v15 ^ v16 ^ objc_msgSend_hash(self->_fieldValues, v17, v18);
  return v19 ^ objc_msgSend_hash(self->_listValues, v20, v21);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = v4;
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v7 = *((void *)v4 + 3);
  if (v7) {
    objc_msgSend_setBytesValue_(self, v5, v7);
  }
  char v8 = *((unsigned char *)v6 + 64);
  if ((v8 & 8) != 0)
  {
    self->_BOOLValue = *((unsigned char *)v6 + 60);
    *(unsigned char *)&self->_has |= 8u;
    char v8 = *((unsigned char *)v6 + 64);
    if ((v8 & 2) == 0)
    {
LABEL_7:
      if ((v8 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v6 + 64) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_longValue = *((void *)v6 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v6 + 64))
  {
LABEL_8:
    self->_double doubleValue = *((double *)v6 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
  uint64_t v9 = *((void *)v6 + 6);
  if (v9) {
    objc_msgSend_setStringValue_(self, v5, v9);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = *((id *)v6 + 4);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v28, v33, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addFieldValues_(self, v13, *(void *)(*((void *)&v28 + 1) + 8 * i));
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v28, v33, 16);
    }
    while (v14);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = *((id *)v6 + 5);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, v32, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend_addListValues_(self, v20, *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v24, v32, 16);
    }
    while (v21);
  }
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (int64_t)longValue
{
  return self->_longValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSMutableArray)fieldValues
{
  return self->_fieldValues;
}

- (void)setFieldValues:(id)a3
{
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (void)setListValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_fieldValues, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

@end