@interface CKCDPCodeServiceRequestDatabaseOwner
- (BOOL)hasIdentifier;
- (BOOL)hasNumericValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifierAsString:(int)a3;
- (int)StringAsIdentifier:(id)a3;
- (int)identifier;
- (unint64_t)hash;
- (unint64_t)numericValue;
- (void)clearOneofValuesForIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasNumericValue:(BOOL)a3;
- (void)setIdentifier:(int)a3;
- (void)setNumericValue:(unint64_t)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestDatabaseOwner

- (void)setNumericValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_identifier = 1;
  *(unsigned char *)&self->_has |= 1u;
  self->_numericValue = a3;
}

- (void)setHasNumericValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumericValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setStringValue:(id)a3
{
  v4 = (NSString *)a3;
  objc_msgSend_clearOneofValuesForIdentifier(self, v5, v6);
  *(unsigned char *)&self->_has |= 2u;
  self->_identifier = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;
}

- (int)identifier
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_identifier;
  }
  else {
    return 0;
  }
}

- (void)setIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)identifierAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F8888[a3];
  }
  return v3;
}

- (int)StringAsIdentifier:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"numericValue"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"stringValue"))
  {
    int v6 = 2;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForIdentifier
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_identifier = 0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_numericValue = 0;
  self->_stringValue = 0;
  MEMORY[0x1F41817F8]();
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestDatabaseOwner;
  v4 = [(CKCDPCodeServiceRequestDatabaseOwner *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v4, self->_numericValue);
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"numericValue");
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, @"stringValue");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t identifier = self->_identifier;
    if (identifier >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_identifier);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E64F8888[identifier];
    }
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v10, @"Identifier");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C50171F0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_identifier;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_numericValue;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  stringValue = self->_stringValue;
  if (stringValue)
  {
    v8 = v4;
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 16) = self->_identifier;
    *(unsigned char *)(v10 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v10 + 8) = self->_numericValue;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_stringValue, v11, (uint64_t)a3);
  v15 = (void *)v12[3];
  v12[3] = v14;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_identifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if ((v4[4] & 2) != 0)
  {
LABEL_14:
    char isEqual = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_numericValue != v4[1]) {
      goto LABEL_14;
    }
  }
  else if (v4[4])
  {
    goto LABEL_14;
  }
  stringValue = self->_stringValue;
  uint64_t v9 = v4[3];
  if ((unint64_t)stringValue | v9) {
    char isEqual = objc_msgSend_isEqual_(stringValue, v7, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_15:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_identifier;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    return v4 ^ v3 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_numericValue;
  return v4 ^ v3 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t identifier = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if (v6)
  {
    self->_numericValue = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 3);
  if (v7)
  {
    id v8 = v4;
    objc_msgSend_setStringValue_(self, v5, v7);
    id v4 = v8;
  }
}

- (unint64_t)numericValue
{
  return self->_numericValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end