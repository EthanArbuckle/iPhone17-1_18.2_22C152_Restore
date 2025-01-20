@interface CKDPQueryFilter
- (BOOL)hasBounds;
- (BOOL)hasFieldName;
- (BOOL)hasFieldValue;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPLocationBound)bounds;
- (CKDPRecordFieldIdentifier)fieldName;
- (CKDPRecordFieldValue)fieldValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setFieldValue:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQueryFilter

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (BOOL)hasFieldValue
{
  return self->_fieldValue != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 0x1E)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F48F8[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"equals"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"notEquals"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"in"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"notIn"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"lessThan"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"lessThanOrEquals"))
  {
    int v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"greaterThan"))
  {
    int v6 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v12, @"greaterThanOrEquals"))
  {
    int v6 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"near"))
  {
    int v6 = 9;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"containsAllTokens"))
  {
    int v6 = 10;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"containsAnyTokens"))
  {
    int v6 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v16, @"listContains"))
  {
    int v6 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"listNotContains"))
  {
    int v6 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v3, v18, @"listContainsAny"))
  {
    int v6 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"listNotContainsAny"))
  {
    int v6 = 15;
  }
  else if (objc_msgSend_isEqualToString_(v3, v20, @"beginsWith"))
  {
    int v6 = 16;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, @"notBeginsWith"))
  {
    int v6 = 17;
  }
  else if (objc_msgSend_isEqualToString_(v3, v22, @"listMemberBeginsWith"))
  {
    int v6 = 18;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, @"notListMemberBeginsWith"))
  {
    int v6 = 19;
  }
  else if (objc_msgSend_isEqualToString_(v3, v24, @"listContainsAll"))
  {
    int v6 = 20;
  }
  else if (objc_msgSend_isEqualToString_(v3, v25, @"listNotContainsAll"))
  {
    int v6 = 21;
  }
  else if (objc_msgSend_isEqualToString_(v3, v26, @"isNull"))
  {
    int v6 = 22;
  }
  else if (objc_msgSend_isEqualToString_(v3, v27, @"notNull"))
  {
    int v6 = 23;
  }
  else if (objc_msgSend_isEqualToString_(v3, v28, @"notEqualsOrNull"))
  {
    int v6 = 24;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, @"notInOrNull"))
  {
    int v6 = 25;
  }
  else if (objc_msgSend_isEqualToString_(v3, v30, @"listNotContainsOrNull"))
  {
    int v6 = 26;
  }
  else if (objc_msgSend_isEqualToString_(v3, v31, @"listNotContainsAnyOrNull"))
  {
    int v6 = 27;
  }
  else if (objc_msgSend_isEqualToString_(v3, v32, @"notBeginsWithOrNull"))
  {
    int v6 = 28;
  }
  else if (objc_msgSend_isEqualToString_(v3, v33, @"notListMemberBeginsWithOrNull"))
  {
    int v6 = 29;
  }
  else if (objc_msgSend_isEqualToString_(v3, v34, @"listNotContainsAllOrNull"))
  {
    int v6 = 30;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQueryFilter;
  v4 = [(CKDPQueryFilter *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  fieldName = self->_fieldName;
  if (fieldName)
  {
    v8 = objc_msgSend_dictionaryRepresentation(fieldName, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"fieldName");
  }
  fieldValue = self->_fieldValue;
  if (fieldValue)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(fieldValue, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"fieldValue");
  }
  bounds = self->_bounds;
  if (bounds)
  {
    v14 = objc_msgSend_dictionaryRepresentation(bounds, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"bounds");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v16 = self->_type - 1;
    if (v16 >= 0x1E)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E64F48F8[v16];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v17, @"type");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E8FE04((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fieldName)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fieldValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bounds)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  fieldName = self->_fieldName;
  id v9 = v4;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v4, v5, (uint64_t)fieldName);
    id v4 = v9;
  }
  fieldValue = self->_fieldValue;
  if (fieldValue)
  {
    objc_msgSend_setFieldValue_(v9, v5, (uint64_t)fieldValue);
    id v4 = v9;
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_setBounds_(v9, v5, (uint64_t)bounds);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_fieldName, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_fieldValue, v14, (uint64_t)a3);
  unsigned int v16 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_bounds, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 32) = self->_type;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  fieldName = self->_fieldName;
  uint64_t v9 = v4[2];
  if ((unint64_t)fieldName | v9)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v9)) {
      goto LABEL_12;
    }
  }
  fieldValue = self->_fieldValue;
  uint64_t v11 = v4[3];
  if ((unint64_t)fieldValue | v11)
  {
    if (!objc_msgSend_isEqual_(fieldValue, v7, v11)) {
      goto LABEL_12;
    }
  }
  bounds = self->_bounds;
  uint64_t v13 = v4[1];
  if ((unint64_t)bounds | v13)
  {
    if (!objc_msgSend_isEqual_(bounds, v7, v13)) {
      goto LABEL_12;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_type == *((_DWORD *)v4 + 8))
    {
      BOOL v14 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v14 = 0;
  }
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_fieldName, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_fieldValue, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_bounds, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_type;
  }
  else {
    uint64_t v11 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  fieldName = self->_fieldName;
  uint64_t v6 = *((void *)v4 + 2);
  id v11 = v4;
  if (fieldName)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(fieldName, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setFieldName_(self, (const char *)v4, v6);
  }
  id v4 = v11;
LABEL_7:
  fieldValue = self->_fieldValue;
  uint64_t v8 = *((void *)v4 + 3);
  if (fieldValue)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(fieldValue, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setFieldValue_(self, (const char *)v4, v8);
  }
  id v4 = v11;
LABEL_13:
  bounds = self->_bounds;
  uint64_t v10 = *((void *)v4 + 1);
  if (bounds)
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_mergeFrom_(bounds, (const char *)v4, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    objc_msgSend_setBounds_(self, (const char *)v4, v10);
  }
  id v4 = v11;
LABEL_19:
  if (*((unsigned char *)v4 + 36))
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordFieldIdentifier)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (CKDPRecordFieldValue)fieldValue
{
  return self->_fieldValue;
}

- (void)setFieldValue:(id)a3
{
}

- (CKDPLocationBound)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end