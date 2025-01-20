@interface CKDPResponseOperationResultErrorAuxiliaryErrorErrorUserInfoValue
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasBytesValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasInt64Value;
- (BOOL)hasStringValue;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bytesValue;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueAsString:(int)a3;
- (int)StringAsValue:(id)a3;
- (int)value;
- (int64_t)int64Value;
- (unint64_t)hash;
- (void)clearOneofValuesForValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setBytesValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setStringValue:(id)a3;
- (void)setValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperationResultErrorAuxiliaryErrorErrorUserInfoValue

- (void)setDoubleValue:(double)a3
{
  objc_msgSend_clearOneofValuesForValue(self, a2, v3);
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 1;
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

- (void)setInt64Value:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 2;
  *(unsigned char *)&self->_has |= 2u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInt64Value
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 3;
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

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setStringValue:(id)a3
{
  v4 = (NSString *)a3;
  objc_msgSend_clearOneofValuesForValue(self, v5, v6);
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 4;
  stringValue = self->_stringValue;
  self->_stringValue = v4;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setBytesValue:(id)a3
{
  v4 = (NSData *)a3;
  objc_msgSend_clearOneofValuesForValue(self, v5, v6);
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 5;
  bytesValue = self->_bytesValue;
  self->_bytesValue = v4;
}

- (int)value
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_value;
  }
  else {
    return 0;
  }
}

- (void)setValue:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)valueAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F47D8[a3];
  }
  return v3;
}

- (int)StringAsValue:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"doubleValue"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"int64Value"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"BOOLValue"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"stringValue"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"bytesValue"))
  {
    int v6 = 5;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)clearOneofValuesForValue
{
  *(unsigned char *)&self->_has &= ~4u;
  self->_value = 0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_doubleValue = 0.0;
  *(unsigned char *)&self->_has &= ~2u;
  self->_int64Value = 0;
  *(unsigned char *)&self->_has &= ~8u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  bytesValue = self->_bytesValue;
  self->_bytesValue = 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperationResultErrorAuxiliaryErrorErrorUserInfoValue;
  v4 = [(CKDPResponseOperationResultErrorAuxiliaryErrorErrorUserInfoValue *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if (has)
  {
    v14 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v4, v5, self->_doubleValue);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"doubleValue");

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v16 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_int64Value);
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"int64Value");

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    v8 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_BOOLValue);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"BOOLValue");
  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)stringValue, @"stringValue");
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)bytesValue, @"bytesValue");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t value = self->_value;
    if (value >= 6)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_value);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E64F47D8[value];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v13, @"value");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPResponseOperationResultErrorAuxiliaryErrorErrorUserInfoValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bytesValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_value;
    *((unsigned char *)v4 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = *(void *)&self->_doubleValue;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  *((void *)v4 + 2) = self->_int64Value;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)v4 + 44) = self->_BOOLValue;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_6:
  stringValue = self->_stringValue;
  v9 = v4;
  if (stringValue)
  {
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue);
    id v4 = v9;
  }
  bytesValue = self->_bytesValue;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v9, v5, (uint64_t)bytesValue);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_value;
    *(unsigned char *)(v10 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v10 + 16) = self->_int64Value;
      *(unsigned char *)(v10 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v10 + 8) = self->_doubleValue;
  *(unsigned char *)(v10 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v10 + 44) = self->_BOOLValue;
    *(unsigned char *)(v10 + 48) |= 8u;
  }
LABEL_6:
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_stringValue, v11, (uint64_t)a3);
  v15 = (void *)v12[4];
  v12[4] = v14;

  uint64_t v17 = objc_msgSend_copyWithZone_(self->_bytesValue, v16, (uint64_t)a3);
  v18 = (void *)v12[3];
  v12[3] = v17;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_value != *((_DWORD *)v4 + 10)) {
      goto LABEL_29;
    }
  }
  else if ((v4[6] & 4) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[6] & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (v4[6])
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_int64Value != v4[2]) {
      goto LABEL_29;
    }
  }
  else if ((v4[6] & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[6] & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_25;
      }
    }
LABEL_29:
    char isEqual = 0;
    goto LABEL_30;
  }
  if ((v4[6] & 8) != 0) {
    goto LABEL_29;
  }
LABEL_25:
  stringValue = self->_stringValue;
  uint64_t v9 = v4[4];
  if ((unint64_t)stringValue | v9 && !objc_msgSend_isEqual_(stringValue, v7, v9)) {
    goto LABEL_29;
  }
  bytesValue = self->_bytesValue;
  uint64_t v11 = v4[3];
  if ((unint64_t)bytesValue | v11) {
    char isEqual = objc_msgSend_isEqual_(bytesValue, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_30:

  return isEqual;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_value;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double doubleValue = self->_doubleValue;
  double v7 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v7 = self->_doubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_int64Value;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = 0;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_BOOLValue;
LABEL_16:
  uint64_t v13 = v10 ^ v5 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_stringValue, a2, v2);
  return v13 ^ objc_msgSend_hash(self->_bytesValue, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 4) != 0)
  {
    self->_uint64_t value = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double doubleValue = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  self->_int64Value = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_5:
    self->_BOOLValue = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  uint64_t v7 = *((void *)v4 + 4);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setStringValue_(self, v5, v7);
    id v4 = v9;
  }
  uint64_t v8 = *((void *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setBytesValue_(self, v5, v8);
    id v4 = v9;
  }
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
}

@end