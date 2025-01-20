@interface IDSQRProtoExperimentOverride
- (BOOL)hasExperimentId;
- (BOOL)hasExperimentName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)value;
- (NSString)experimentName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)experimentIdAsString:(int)a3;
- (int)StringAsExperimentId:(id)a3;
- (int)experimentId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExperimentId:(int)a3;
- (void)setExperimentName:(id)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoExperimentOverride

- (int)experimentId
{
  if (*(unsigned char *)&self->_has) {
    return self->_experimentId;
  }
  else {
    return 0;
  }
}

- (void)setExperimentId:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_experimentId = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExperimentId
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)experimentIdAsString:(int)a3
{
  if (a3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v4, a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"TRANSPORT_LEVEL_ENCRYPTION_DISABLED";
  }
  return v5;
}

- (int)StringAsExperimentId:(id)a3
{
  objc_msgSend_isEqualToString_(a3, a2, @"TRANSPORT_LEVEL_ENCRYPTION_DISABLED", v3);
  return 0;
}

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (void)setValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoExperimentOverride;
  double v4 = [(IDSQRProtoExperimentOverride *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    if (self->_experimentId)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_experimentId);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, @"experiment_id");
    }
    else
    {
      v8 = @"TRANSPORT_LEVEL_ENCRYPTION_DISABLED";
      objc_msgSend_setObject_forKey_(v6, v5, @"TRANSPORT_LEVEL_ENCRYPTION_DISABLED", v7, @"experiment_id");
    }
  }
  experimentName = self->_experimentName;
  if (experimentName) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)experimentName, v7, @"experiment_name");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_value, v7);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, @"value");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoExperimentOverrideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_experimentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_experimentId;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_value;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  experimentName = self->_experimentName;
  if (experimentName)
  {
    v9 = v4;
    objc_msgSend_setExperimentName_(v4, v5, (uint64_t)experimentName, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v12 + 8) = self->_experimentId;
    *(unsigned char *)(v12 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v12 + 24) = self->_value;
    *(unsigned char *)(v12 + 28) |= 2u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_experimentName, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[2];
  v15[2] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_experimentId != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 28) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_value)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_11;
  }
LABEL_17:
  experimentName = self->_experimentName;
  uint64_t v13 = v4[2];
  if ((unint64_t)experimentName | v13) {
    char isEqual = objc_msgSend_isEqual_(experimentName, v8, v13, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_experimentId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v5 ^ v4 ^ objc_msgSend_hash(self->_experimentName, a2, v2, v3);
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_value;
  return v5 ^ v4 ^ objc_msgSend_hash(self->_experimentName, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = *((unsigned char *)v4 + 28);
  if (v7)
  {
    self->_experimentId = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_value = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v8 = *((void *)v4 + 2);
  if (v8)
  {
    id v9 = v4;
    objc_msgSend_setExperimentName_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
}

- (BOOL)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end