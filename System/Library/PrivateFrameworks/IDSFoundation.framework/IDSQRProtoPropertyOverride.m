@interface IDSQRProtoPropertyOverride
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasPropertyName;
- (BOOL)hasPropertyValue;
- (BOOL)hasStringValue;
- (BOOL)hasUint32Value;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertyNameAsString:(int)a3;
- (id)propertyValueAsString:(int)a3;
- (int)StringAsPropertyName:(id)a3;
- (int)StringAsPropertyValue:(id)a3;
- (int)propertyName;
- (int)propertyValue;
- (unint64_t)hash;
- (unsigned)uint32Value;
- (void)clearOneofValuesForPropertyValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasPropertyName:(BOOL)a3;
- (void)setHasPropertyValue:(BOOL)a3;
- (void)setHasUint32Value:(BOOL)a3;
- (void)setPropertyName:(int)a3;
- (void)setPropertyValue:(int)a3;
- (void)setStringValue:(id)a3;
- (void)setUint32Value:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPropertyOverride

- (int)propertyName
{
  if (*(unsigned char *)&self->_has) {
    return self->_propertyName;
  }
  else {
    return 0;
  }
}

- (void)setPropertyName:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_propertyName = a3;
}

- (void)setHasPropertyName:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPropertyName
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)propertyNameAsString:(int)a3
{
  if (a3 >= 3)
  {
    v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
  }
  else
  {
    v4 = *(&off_1E5974FA0 + a3);
  }
  return v4;
}

- (int)StringAsPropertyName:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"server_enforced_disconnection_timeout_seconds", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"multiway_participant_trust_guard_duration_in_millis", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"disconnect_participant_landing_on_old_instance_during_resign", v10))
  {
    int v8 = 2;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)setBoolValue:(BOOL)a3
{
  objc_msgSend_clearOneofValuesForPropertyValue(self, a2, a3, v3);
  *(unsigned char *)&self->_has |= 2u;
  self->_propertyValue = 1;
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
  objc_msgSend_clearOneofValuesForPropertyValue(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 2u;
  self->_propertyValue = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;
}

- (void)setUint32Value:(unsigned int)a3
{
  objc_msgSend_clearOneofValuesForPropertyValue(self, a2, *(uint64_t *)&a3, v3);
  *(unsigned char *)&self->_has |= 2u;
  self->_propertyValue = 3;
  *(unsigned char *)&self->_has |= 4u;
  self->_uint32Value = a3;
}

- (void)setHasUint32Value:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUint32Value
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)propertyValue
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_propertyValue;
  }
  else {
    return 0;
  }
}

- (void)setPropertyValue:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_propertyValue = a3;
}

- (void)setHasPropertyValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPropertyValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)propertyValueAsString:(int)a3
{
  if (a3 >= 4)
  {
    v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
  }
  else
  {
    v4 = *(&off_1E5974FB8 + a3);
  }
  return v4;
}

- (int)StringAsPropertyValue:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PBUNSET", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"BOOL_value", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"string_value", v10))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"uint32_value", v12))
  {
    int v8 = 3;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForPropertyValue
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_propertyValue = 0;
  *(unsigned char *)&self->_has &= ~8u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  *(unsigned char *)&self->_has &= ~4u;
  self->_uint32Value = 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPropertyOverride;
  v4 = [(IDSQRProtoPropertyOverride *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if (has)
  {
    uint64_t propertyName = self->_propertyName;
    if (propertyName >= 3)
    {
      double v10 = objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_propertyName);
    }
    else
    {
      double v10 = *(&off_1E5974FA0 + propertyName);
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v10, v7, @"property_name");

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v11 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_BOOLValue, v7);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, v13, @"BOOL_value");
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)stringValue, v7, @"string_value");
  }
  char v15 = (char)self->_has;
  if ((v15 & 4) != 0)
  {
    v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, self->_uint32Value, v7);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, v18, @"uint32_value");

    char v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    uint64_t propertyValue = self->_propertyValue;
    if (propertyValue >= 4)
    {
      v20 = objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_propertyValue);
    }
    else
    {
      v20 = *(&off_1E5974FB8 + propertyValue);
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v20, v7, @"property_value");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPropertyOverrideReadFrom((uint64_t)self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_propertyValue;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_propertyName;
  *((unsigned char *)v4 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 28) = self->_BOOLValue;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_5:
  stringValue = self->_stringValue;
  if (stringValue)
  {
    v9 = v4;
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue, v6);
    v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[6] = self->_uint32Value;
    *((unsigned char *)v4 + 32) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  int v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = v12;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 12) = self->_propertyValue;
    *(unsigned char *)(v12 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v12 + 8) = self->_propertyName;
  *(unsigned char *)(v12 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(unsigned char *)(v12 + 28) = self->_BOOLValue;
    *(unsigned char *)(v12 + 32) |= 8u;
  }
LABEL_5:
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_stringValue, v13, (uint64_t)a3, v14);
  double v18 = *(void **)(v15 + 16);
  *(void *)(v15 + 16) = v17;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v15 + 24) = self->_uint32Value;
    *(unsigned char *)(v15 + 32) |= 4u;
  }
  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((v4[4] & 2) == 0 || self->_propertyValue != *((_DWORD *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((v4[4] & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_propertyName != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (v4[4])
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[4] & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_BOOLValue)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_27;
    }
  }
  else if ((v4[4] & 8) != 0)
  {
    goto LABEL_27;
  }
  stringValue = self->_stringValue;
  uint64_t v12 = v4[2];
  if (!((unint64_t)stringValue | v12)) {
    goto LABEL_23;
  }
  if (!objc_msgSend_isEqual_(stringValue, v8, v12, v9))
  {
LABEL_27:
    BOOL v13 = 0;
    goto LABEL_28;
  }
  char has = (char)self->_has;
LABEL_23:
  BOOL v13 = (v4[4] & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v4[4] & 4) == 0 || self->_uint32Value != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
    BOOL v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 2654435761 * self->_propertyValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_propertyName;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_BOOLValue;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:
  uint64_t v8 = objc_msgSend_hash(self->_stringValue, a2, v2, v3);
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_uint32Value;
  }
  else {
    uint64_t v9 = 0;
  }
  return v6 ^ v5 ^ v7 ^ v9 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_uint64_t propertyValue = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 32);
    if ((v7 & 1) == 0)
    {
LABEL_3:
      if ((v7 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t propertyName = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_4:
    self->_BOOLValue = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_5:
  uint64_t v8 = *((void *)v4 + 2);
  if (v8)
  {
    id v9 = v4;
    objc_msgSend_setStringValue_(self, v5, v8, v6);
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    self->_uint32Value = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (unsigned)uint32Value
{
  return self->_uint32Value;
}

- (void).cxx_destruct
{
}

@end