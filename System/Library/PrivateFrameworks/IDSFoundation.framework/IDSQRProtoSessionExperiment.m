@interface IDSQRProtoSessionExperiment
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasExperimentName;
- (BOOL)hasInt32Value;
- (BOOL)hasStringValue;
- (BOOL)hasTestValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)experimentName;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)testValueAsString:(int)a3;
- (int)StringAsTestValue:(id)a3;
- (int)int32Value;
- (int)testValue;
- (unint64_t)hash;
- (void)clearOneofValuesForTestValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setExperimentName:(id)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasInt32Value:(BOOL)a3;
- (void)setHasTestValue:(BOOL)a3;
- (void)setInt32Value:(int)a3;
- (void)setStringValue:(id)a3;
- (void)setTestValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSessionExperiment

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  objc_msgSend_clearOneofValuesForTestValue(self, a2, a3, v3);
  *(unsigned char *)&self->_has |= 2u;
  self->_testValue = 1;
  *(unsigned char *)&self->_has |= 4u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setStringValue:(id)a3
{
  v4 = (NSString *)a3;
  objc_msgSend_clearOneofValuesForTestValue(self, v5, v6, v7);
  *(unsigned char *)&self->_has |= 2u;
  self->_testValue = 2;
  stringValue = self->_stringValue;
  self->_stringValue = v4;
}

- (void)setInt32Value:(int)a3
{
  objc_msgSend_clearOneofValuesForTestValue(self, a2, *(uint64_t *)&a3, v3);
  *(unsigned char *)&self->_has |= 2u;
  self->_testValue = 3;
  *(unsigned char *)&self->_has |= 1u;
  self->_int32Value = a3;
}

- (void)setHasInt32Value:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInt32Value
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)testValue
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_testValue;
  }
  else {
    return 0;
  }
}

- (void)setTestValue:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_testValue = a3;
}

- (void)setHasTestValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTestValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)testValueAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5973C60[a3];
  }
  return v4;
}

- (int)StringAsTestValue:(id)a3
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
  else if (objc_msgSend_isEqualToString_(v3, v11, @"int32_value", v12))
  {
    int v8 = 3;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)clearOneofValuesForTestValue
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_testValue = 0;
  *(unsigned char *)&self->_has &= ~4u;
  self->_BOOLValue = 0;
  stringValue = self->_stringValue;
  self->_stringValue = 0;

  *(unsigned char *)&self->_has &= ~1u;
  self->_int32Value = 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoSessionExperiment;
  v4 = [(IDSQRProtoSessionExperiment *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = v5;
  experimentName = self->_experimentName;
  if (experimentName) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)experimentName, v7, @"experiment_name");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    double v10 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_BOOLValue, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, @"BOOL_value");
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)stringValue, v7, @"string_value");
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = objc_msgSend_numberWithInt_(NSNumber, v6, self->_int32Value, v7);
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, v17, @"int32_value");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t testValue = self->_testValue;
    if (testValue >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"(unknown: %i)", v7, self->_testValue);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E5973C60[testValue];
    }
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)v19, v7, @"test_value");
  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionExperimentReadFrom((uint64_t)self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_experimentName)
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
    v4[8] = self->_testValue;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_BOOLValue;
    *((unsigned char *)v4 + 40) |= 4u;
  }
  stringValue = self->_stringValue;
  double v10 = v4;
  if (stringValue)
  {
    objc_msgSend_setStringValue_(v4, v5, (uint64_t)stringValue, v6);
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_int32Value;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  experimentName = self->_experimentName;
  if (experimentName)
  {
    objc_msgSend_setExperimentName_(v10, v5, (uint64_t)experimentName, v6);
    id v4 = v10;
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
    *(_DWORD *)(v12 + 32) = self->_testValue;
    *(unsigned char *)(v12 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v12 + 36) = self->_BOOLValue;
    *(unsigned char *)(v12 + 40) |= 4u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_stringValue, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v17;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v15 + 16) = self->_int32Value;
    *(unsigned char *)(v15 + 40) |= 1u;
  }
  uint64_t v21 = objc_msgSend_copyWithZone_(self->_experimentName, v19, (uint64_t)a3, v20);
  v22 = *(void **)(v15 + 8);
  *(void *)(v15 + 8) = v21;

  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_25;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((v4[5] & 2) == 0 || self->_testValue != *((_DWORD *)v4 + 8)) {
      goto LABEL_25;
    }
  }
  else if ((v4[5] & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[5] & 4) == 0) {
      goto LABEL_25;
    }
    if (self->_BOOLValue)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_25;
    }
  }
  else if ((v4[5] & 4) != 0)
  {
    goto LABEL_25;
  }
  stringValue = self->_stringValue;
  uint64_t v12 = v4[3];
  if (!((unint64_t)stringValue | v12)) {
    goto LABEL_18;
  }
  if (!objc_msgSend_isEqual_(stringValue, v8, v12, v9))
  {
LABEL_25:
    char isEqual = 0;
    goto LABEL_26;
  }
  char has = (char)self->_has;
LABEL_18:
  if (has)
  {
    if ((v4[5] & 1) == 0 || self->_int32Value != *((_DWORD *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (v4[5])
  {
    goto LABEL_25;
  }
  experimentName = self->_experimentName;
  uint64_t v14 = v4[1];
  if ((unint64_t)experimentName | v14) {
    char isEqual = objc_msgSend_isEqual_(experimentName, v8, v14, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_26:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_testValue;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_BOOLValue;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = objc_msgSend_hash(self->_stringValue, a2, v2, v3);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_int32Value;
  }
  else {
    uint64_t v11 = 0;
  }
  return v6 ^ v5 ^ v11 ^ v7 ^ objc_msgSend_hash(self->_experimentName, v8, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_uint64_t testValue = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 40);
  }
  if ((v7 & 4) != 0)
  {
    self->_BOOLValue = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v8 = *((void *)v4 + 3);
  id v10 = v4;
  if (v8)
  {
    objc_msgSend_setStringValue_(self, v5, v8, v6);
    id v4 = v10;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_int32Value = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v9 = *((void *)v4 + 1);
  if (v9)
  {
    objc_msgSend_setExperimentName_(self, v5, v9, v6);
    id v4 = v10;
  }
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int)int32Value
{
  return self->_int32Value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
}

@end