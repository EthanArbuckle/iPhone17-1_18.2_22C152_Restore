@interface CKDPQuerySort
- (BOOL)hasCoordinate;
- (BOOL)hasFieldName;
- (BOOL)hasOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPLocationCoordinate)coordinate;
- (CKDPRecordFieldIdentifier)fieldName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)orderAsString:(int)a3;
- (int)StringAsOrder:(id)a3;
- (int)order;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setFieldName:(id)a3;
- (void)setHasOrder:(BOOL)a3;
- (void)setOrder:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQuerySort

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (int)order
{
  if (*(unsigned char *)&self->_has) {
    return self->_order;
  }
  else {
    return 1;
  }
}

- (void)setOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_order = a3;
}

- (void)setHasOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)orderAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"ascending";
  }
  else if (a3 == 2)
  {
    v4 = @"descending";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsOrder:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"ascending") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"descending")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQuerySort;
  v4 = [(CKDPQuerySort *)&v11 description];
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
  if (*(unsigned char *)&self->_has)
  {
    int order = self->_order;
    if (order == 1)
    {
      objc_super v11 = @"ascending";
      objc_msgSend_setObject_forKey_(v6, v4, @"ascending", @"order");
    }
    else if (order == 2)
    {
      objc_super v11 = @"descending";
      objc_msgSend_setObject_forKey_(v6, v4, @"descending", @"order");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_order);
      objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"order");
    }
  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v14 = objc_msgSend_dictionaryRepresentation(coordinate, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"coordinate");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D834D0((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  fieldName = self->_fieldName;
  id v8 = v4;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v4, v5, (uint64_t)fieldName);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_order;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  coordinate = self->_coordinate;
  if (coordinate)
  {
    objc_msgSend_setCoordinate_(v8, v5, (uint64_t)coordinate);
    id v4 = v8;
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

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_order;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_coordinate, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_11;
  }
  fieldName = self->_fieldName;
  uint64_t v9 = v4[2];
  if ((unint64_t)fieldName | v9)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_order != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  coordinate = self->_coordinate;
  uint64_t v11 = v4[1];
  if ((unint64_t)coordinate | v11) {
    char isEqual = objc_msgSend_isEqual_(coordinate, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_fieldName, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_order;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ objc_msgSend_hash(self->_coordinate, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  fieldName = self->_fieldName;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
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
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 28))
  {
    self->_int order = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  coordinate = self->_coordinate;
  uint64_t v8 = *((void *)v4 + 1);
  if (coordinate)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(coordinate, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setCoordinate_(self, (const char *)v4, v8);
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

- (CKDPLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end