@interface ACProtobufVariableValue
- (ACProtobufDate)dateValue;
- (ACProtobufURL)urlValue;
- (ACProtobufUUID)uuidValue;
- (ACProtobufVariableValue)initWithObjectValue:(id)a3;
- (ACProtobufVariableValueDictionary)dictionaryValue;
- (ACProtobufVariableValueList)arrayValue;
- (ACProtobufVariableValueList)setValue;
- (BOOL)_setObject:(id)a3;
- (BOOL)hasArrayValue;
- (BOOL)hasDataValue;
- (BOOL)hasDateValue;
- (BOOL)hasDictionaryValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasSetValue;
- (BOOL)hasStringValue;
- (BOOL)hasUnsignedIntegerValue;
- (BOOL)hasUrlValue;
- (BOOL)hasUuidValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)object;
- (int64_t)integerValue;
- (unint64_t)hash;
- (unint64_t)unsignedIntegerValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrayValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionaryValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setHasUnsignedIntegerValue:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setSetValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUnsignedIntegerValue:(unint64_t)a3;
- (void)setUrlValue:(id)a3;
- (void)setUuidValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACProtobufVariableValue

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsignedIntegerValue = a3;
}

- (void)setHasUnsignedIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnsignedIntegerValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasUuidValue
{
  return self->_uuidValue != 0;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasUrlValue
{
  return self->_urlValue != 0;
}

- (BOOL)hasArrayValue
{
  return self->_arrayValue != 0;
}

- (BOOL)hasSetValue
{
  return self->_setValue != 0;
}

- (BOOL)hasDictionaryValue
{
  return self->_dictionaryValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufVariableValue;
  v4 = [(ACProtobufVariableValue *)&v8 description];
  v5 = [(ACProtobufVariableValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v22 = [NSNumber numberWithLongLong:self->_integerValue];
    [v4 setObject:v22 forKey:@"integerValue"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v23 = [NSNumber numberWithUnsignedLongLong:self->_unsignedIntegerValue];
  [v4 setObject:v23 forKey:@"unsignedIntegerValue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v7 forKey:@"doubleValue"];
  }
LABEL_7:
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"dataValue"];
  }
  uuidValue = self->_uuidValue;
  if (uuidValue)
  {
    v10 = [(ACProtobufUUID *)uuidValue dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"uuidValue"];
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v12 = [(ACProtobufDate *)dateValue dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"dateValue"];
  }
  urlValue = self->_urlValue;
  if (urlValue)
  {
    v14 = [(ACProtobufURL *)urlValue dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"urlValue"];
  }
  arrayValue = self->_arrayValue;
  if (arrayValue)
  {
    v16 = [(ACProtobufVariableValueList *)arrayValue dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"arrayValue"];
  }
  setValue = self->_setValue;
  if (setValue)
  {
    v18 = [(ACProtobufVariableValueList *)setValue dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"setValue"];
  }
  dictionaryValue = self->_dictionaryValue;
  if (dictionaryValue)
  {
    v20 = [(ACProtobufVariableValueDictionary *)dictionaryValue dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"dictionaryValue"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufVariableValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_dataValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_uuidValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dateValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_urlValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_arrayValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_setValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    objc_msgSend(v4, "setStringValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_integerValue;
    *((unsigned char *)v4 + 96) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 3) = self->_unsignedIntegerValue;
  *((unsigned char *)v4 + 96) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 96) |= 1u;
  }
LABEL_7:
  if (self->_dataValue)
  {
    objc_msgSend(v6, "setDataValue:");
    id v4 = v6;
  }
  if (self->_uuidValue)
  {
    objc_msgSend(v6, "setUuidValue:");
    id v4 = v6;
  }
  if (self->_dateValue)
  {
    objc_msgSend(v6, "setDateValue:");
    id v4 = v6;
  }
  if (self->_urlValue)
  {
    objc_msgSend(v6, "setUrlValue:");
    id v4 = v6;
  }
  if (self->_arrayValue)
  {
    objc_msgSend(v6, "setArrayValue:");
    id v4 = v6;
  }
  if (self->_setValue)
  {
    objc_msgSend(v6, "setSetValue:");
    id v4 = v6;
  }
  if (self->_dictionaryValue)
  {
    objc_msgSend(v6, "setDictionaryValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_unsignedIntegerValue;
    *(unsigned char *)(v5 + 96) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_integerValue;
  *(unsigned char *)(v5 + 96) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
LABEL_5:
  uint64_t v9 = [(NSData *)self->_dataValue copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  id v11 = [(ACProtobufUUID *)self->_uuidValue copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  id v13 = [(ACProtobufDate *)self->_dateValue copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  id v15 = [(ACProtobufURL *)self->_urlValue copyWithZone:a3];
  v16 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v15;

  id v17 = [(ACProtobufVariableValueList *)self->_arrayValue copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  id v19 = [(ACProtobufVariableValueList *)self->_setValue copyWithZone:a3];
  v20 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v19;

  id v21 = [(ACProtobufVariableValueDictionary *)self->_dictionaryValue copyWithZone:a3];
  v22 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_integerValue != *((void *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_33:
    char v13 = 0;
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_unsignedIntegerValue != *((void *)v4 + 3)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_33;
  }
  dataValue = self->_dataValue;
  if ((unint64_t)dataValue | *((void *)v4 + 5) && !-[NSData isEqual:](dataValue, "isEqual:")) {
    goto LABEL_33;
  }
  uuidValue = self->_uuidValue;
  if ((unint64_t)uuidValue | *((void *)v4 + 11))
  {
    if (!-[ACProtobufUUID isEqual:](uuidValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((void *)v4 + 6))
  {
    if (!-[ACProtobufDate isEqual:](dateValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  urlValue = self->_urlValue;
  if ((unint64_t)urlValue | *((void *)v4 + 10))
  {
    if (!-[ACProtobufURL isEqual:](urlValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  arrayValue = self->_arrayValue;
  if ((unint64_t)arrayValue | *((void *)v4 + 4))
  {
    if (!-[ACProtobufVariableValueList isEqual:](arrayValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  setValue = self->_setValue;
  if ((unint64_t)setValue | *((void *)v4 + 8))
  {
    if (!-[ACProtobufVariableValueList isEqual:](setValue, "isEqual:")) {
      goto LABEL_33;
    }
  }
  dictionaryValue = self->_dictionaryValue;
  if ((unint64_t)dictionaryValue | *((void *)v4 + 7)) {
    char v13 = -[ACProtobufVariableValueDictionary isEqual:](dictionaryValue, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_integerValue;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_unsignedIntegerValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
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
LABEL_13:
  uint64_t v11 = v4 ^ v3 ^ v5 ^ v10 ^ [(NSData *)self->_dataValue hash];
  unint64_t v12 = [(ACProtobufUUID *)self->_uuidValue hash];
  unint64_t v13 = v12 ^ [(ACProtobufDate *)self->_dateValue hash];
  unint64_t v14 = v11 ^ v13 ^ [(ACProtobufURL *)self->_urlValue hash];
  unint64_t v15 = [(ACProtobufVariableValueList *)self->_arrayValue hash];
  unint64_t v16 = v15 ^ [(ACProtobufVariableValueList *)self->_setValue hash];
  return v14 ^ v16 ^ [(ACProtobufVariableValueDictionary *)self->_dictionaryValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (*((void *)v4 + 9))
  {
    -[ACProtobufVariableValue setStringValue:](self, "setStringValue:");
    id v4 = v18;
  }
  char v5 = *((unsigned char *)v4 + 96);
  if ((v5 & 2) != 0)
  {
    self->_integerValue = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 96);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_unsignedIntegerValue = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 96))
  {
LABEL_6:
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 5))
  {
    -[ACProtobufVariableValue setDataValue:](self, "setDataValue:");
    id v4 = v18;
  }
  uuidValue = self->_uuidValue;
  uint64_t v7 = *((void *)v4 + 11);
  if (uuidValue)
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[ACProtobufUUID mergeFrom:](uuidValue, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    -[ACProtobufVariableValue setUuidValue:](self, "setUuidValue:");
  }
  id v4 = v18;
LABEL_18:
  dateValue = self->_dateValue;
  uint64_t v9 = *((void *)v4 + 6);
  if (dateValue)
  {
    if (!v9) {
      goto LABEL_24;
    }
    -[ACProtobufDate mergeFrom:](dateValue, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_24;
    }
    -[ACProtobufVariableValue setDateValue:](self, "setDateValue:");
  }
  id v4 = v18;
LABEL_24:
  urlValue = self->_urlValue;
  uint64_t v11 = *((void *)v4 + 10);
  if (urlValue)
  {
    if (!v11) {
      goto LABEL_30;
    }
    -[ACProtobufURL mergeFrom:](urlValue, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_30;
    }
    -[ACProtobufVariableValue setUrlValue:](self, "setUrlValue:");
  }
  id v4 = v18;
LABEL_30:
  arrayValue = self->_arrayValue;
  uint64_t v13 = *((void *)v4 + 4);
  if (arrayValue)
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[ACProtobufVariableValueList mergeFrom:](arrayValue, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_36;
    }
    -[ACProtobufVariableValue setArrayValue:](self, "setArrayValue:");
  }
  id v4 = v18;
LABEL_36:
  setValue = self->_setValue;
  uint64_t v15 = *((void *)v4 + 8);
  if (setValue)
  {
    if (!v15) {
      goto LABEL_42;
    }
    -[ACProtobufVariableValueList mergeFrom:](setValue, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_42;
    }
    -[ACProtobufVariableValue setSetValue:](self, "setSetValue:");
  }
  id v4 = v18;
LABEL_42:
  dictionaryValue = self->_dictionaryValue;
  uint64_t v17 = *((void *)v4 + 7);
  if (dictionaryValue)
  {
    if (v17) {
      -[ACProtobufVariableValueDictionary mergeFrom:](dictionaryValue, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[ACProtobufVariableValue setDictionaryValue:](self, "setDictionaryValue:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (unint64_t)unsignedIntegerValue
{
  return self->_unsignedIntegerValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (void)setDataValue:(id)a3
{
}

- (ACProtobufUUID)uuidValue
{
  return self->_uuidValue;
}

- (void)setUuidValue:(id)a3
{
}

- (ACProtobufDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (ACProtobufURL)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
}

- (ACProtobufVariableValueList)arrayValue
{
  return self->_arrayValue;
}

- (void)setArrayValue:(id)a3
{
}

- (ACProtobufVariableValueList)setValue
{
  return self->_setValue;
}

- (void)setSetValue:(id)a3
{
}

- (ACProtobufVariableValueDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (void)setDictionaryValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_setValue, 0);
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);

  objc_storeStrong((id *)&self->_arrayValue, 0);
}

- (ACProtobufVariableValue)initWithObjectValue:(id)a3
{
  id v4 = a3;
  char v5 = [(ACProtobufVariableValue *)self init];
  uint64_t v6 = v5;
  if (v5 && [(ACProtobufVariableValue *)v5 _setObject:v4]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_setObject:(id)a3
{
  CFNumberRef v4 = (const __CFNumber *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFNumberType Type = CFNumberGetType(v4);
      if ((unint64_t)Type <= kCFNumberCGFloatType)
      {
        if (((1 << Type) & 0x13060) != 0)
        {
          [(__CFNumber *)v4 doubleValue];
          -[ACProtobufVariableValue setDoubleValue:](self, "setDoubleValue:");
          goto LABEL_28;
        }
        if (Type == kCFNumberCFIndexType)
        {
          [(ACProtobufVariableValue *)self setUnsignedIntegerValue:[(__CFNumber *)v4 unsignedLongLongValue]];
          goto LABEL_28;
        }
      }
      [(ACProtobufVariableValue *)self setIntegerValue:[(__CFNumber *)v4 longLongValue]];
      goto LABEL_28;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ACProtobufVariableValue *)self setDataValue:v4];
      goto LABEL_28;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [[ACProtobufDate alloc] initWithDate:v4];
      [(ACProtobufVariableValue *)self setDateValue:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [[ACProtobufUUID alloc] initWithUUID:v4];
        [(ACProtobufVariableValue *)self setUuidValue:v6];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v7 = [[ACProtobufVariableValueList alloc] initWithSet:v4];
            if (v7)
            {
              uint64_t v6 = (ACProtobufDate *)v7;
              [(ACProtobufVariableValue *)self setSetValue:v7];
              goto LABEL_27;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long double v8 = [[ACProtobufVariableValueList alloc] initWithArray:v4];
              if (v8)
              {
                uint64_t v6 = (ACProtobufDate *)v8;
                [(ACProtobufVariableValue *)self setArrayValue:v8];
                goto LABEL_27;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v9 = [[ACProtobufVariableValueDictionary alloc] initWithDictionary:v4];
                if (v9)
                {
                  uint64_t v6 = (ACProtobufDate *)v9;
                  [(ACProtobufVariableValue *)self setDictionaryValue:v9];
                  goto LABEL_27;
                }
              }
            }
          }
          BOOL v10 = 0;
          goto LABEL_29;
        }
        uint64_t v6 = [[ACProtobufURL alloc] initWithURL:v4];
        [(ACProtobufVariableValue *)self setUrlValue:v6];
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  [(ACProtobufVariableValue *)self setStringValue:v4];
LABEL_28:
  BOOL v10 = 1;
LABEL_29:

  return v10;
}

- (id)object
{
  if ([(ACProtobufVariableValue *)self hasStringValue])
  {
    uint64_t v3 = [(ACProtobufVariableValue *)self stringValue];
LABEL_11:
    char v5 = (void *)v3;
    goto LABEL_12;
  }
  if ([(ACProtobufVariableValue *)self hasIntegerValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ACProtobufVariableValue integerValue](self, "integerValue"));
    goto LABEL_11;
  }
  if ([(ACProtobufVariableValue *)self hasUnsignedIntegerValue])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ACProtobufVariableValue unsignedIntegerValue](self, "unsignedIntegerValue"));
    goto LABEL_11;
  }
  if ([(ACProtobufVariableValue *)self hasDoubleValue])
  {
    CFNumberRef v4 = NSNumber;
    [(ACProtobufVariableValue *)self doubleValue];
    uint64_t v3 = objc_msgSend(v4, "numberWithDouble:");
    goto LABEL_11;
  }
  if ([(ACProtobufVariableValue *)self hasDataValue])
  {
    uint64_t v3 = [(ACProtobufVariableValue *)self dataValue];
    goto LABEL_11;
  }
  if ([(ACProtobufVariableValue *)self hasUuidValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self uuidValue];
    uint64_t v8 = [v7 uuid];
LABEL_27:
    char v5 = (void *)v8;

    goto LABEL_12;
  }
  if ([(ACProtobufVariableValue *)self hasUrlValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self urlValue];
    uint64_t v8 = [v7 url];
    goto LABEL_27;
  }
  if ([(ACProtobufVariableValue *)self hasDateValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self dateValue];
    uint64_t v8 = [v7 date];
    goto LABEL_27;
  }
  if ([(ACProtobufVariableValue *)self hasArrayValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self arrayValue];
    uint64_t v8 = [v7 array];
    goto LABEL_27;
  }
  if ([(ACProtobufVariableValue *)self hasSetValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self setValue];
    uint64_t v8 = [v7 set];
    goto LABEL_27;
  }
  if ([(ACProtobufVariableValue *)self hasDictionaryValue])
  {
    uint64_t v7 = [(ACProtobufVariableValue *)self dictionaryValue];
    uint64_t v8 = [v7 dictionary];
    goto LABEL_27;
  }
  char v5 = 0;
LABEL_12:

  return v5;
}

@end