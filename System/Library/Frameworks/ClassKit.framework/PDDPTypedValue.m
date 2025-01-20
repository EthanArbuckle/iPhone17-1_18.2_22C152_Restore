@interface PDDPTypedValue
+ (Class)stringListValueType;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDateValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasEncryptionScheme;
- (BOOL)hasInt64Value;
- (BOOL)hasStringValue;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stringListValues;
- (NSString)stringValue;
- (PDDPDate)dateValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringListValueAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)encryptionScheme;
- (int)type;
- (int64_t)int64Value;
- (unint64_t)hash;
- (unint64_t)stringListValuesCount;
- (void)addStringListValue:(id)a3;
- (void)clearStringListValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDateValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setEncryptionScheme:(int)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasEncryptionScheme:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setStringListValues:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPTypedValue

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F6068[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STRING_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STRING_LIST_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DATE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DATE_LIST_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INT64_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"INT64_LIST_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DOUBLE_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DOUBLE_LIST_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BOOLEAN_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BOOLEAN_LIST_TYPE"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setEncryptionScheme:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_encryptionScheme = a3;
}

- (void)setHasEncryptionScheme:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEncryptionScheme
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)clearStringListValues
{
}

- (void)addStringListValue:(id)a3
{
  id v4 = a3;
  stringListValues = self->_stringListValues;
  id v8 = v4;
  if (!stringListValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stringListValues;
    self->_stringListValues = v6;

    id v4 = v8;
    stringListValues = self->_stringListValues;
  }
  [(NSMutableArray *)stringListValues addObject:v4];
}

- (unint64_t)stringListValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_stringListValues count];
}

- (id)stringListValueAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_stringListValues objectAtIndex:a3];
}

+ (Class)stringListValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (void)setInt64Value:(int64_t)a3
{
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

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPTypedValue;
  char v3 = [(PDDPTypedValue *)&v7 description];
  id v4 = [(PDDPTypedValue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 0xB)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else
    {
      v6 = off_1001F6068[type];
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_encryptionScheme];
    [v3 setObject:v7 forKey:@"encryption_scheme"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"string_value"];
  }
  stringListValues = self->_stringListValues;
  if (stringListValues) {
    [v3 setObject:stringListValues forKey:@"string_list_value"];
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v11 = [(PDDPDate *)dateValue dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"date_value"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    v15 = +[NSNumber numberWithLongLong:self->_int64Value];
    [v3 setObject:v15 forKey:@"int64_value"];

    char v12 = (char)self->_has;
    if ((v12 & 1) == 0)
    {
LABEL_16:
      if ((v12 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_16;
  }
  v16 = +[NSNumber numberWithDouble:self->_doubleValue];
  [v3 setObject:v16 forKey:@"double_value"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_17:
    v13 = +[NSNumber numberWithBool:self->_BOOLValue];
    [v3 setObject:v13 forKey:@"BOOL_value"];
  }
LABEL_18:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10014AA8C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_stringListValues;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (self->_dateValue) {
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_18;
    }
LABEL_22:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  PBDataWriterWriteInt64Field();
  char v11 = (char)self->_has;
  if (v11) {
    goto LABEL_22;
  }
LABEL_18:
  if ((v11 & 0x10) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_type;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[8] = self->_encryptionScheme;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  id v11 = v4;
  if (self->_stringValue) {
    objc_msgSend(v4, "setStringValue:");
  }
  if ([(PDDPTypedValue *)self stringListValuesCount])
  {
    [v11 clearStringListValues];
    unint64_t v6 = [(PDDPTypedValue *)self stringListValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PDDPTypedValue *)self stringListValueAtIndex:i];
        [v11 addStringListValue:v9];
      }
    }
  }
  if (self->_dateValue) {
    objc_msgSend(v11, "setDateValue:");
  }
  char v10 = (char)self->_has;
  if ((v10 & 2) != 0)
  {
    *((void *)v11 + 2) = self->_int64Value;
    *((unsigned char *)v11 + 64) |= 2u;
    char v10 = (char)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_15:
      if ((v10 & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v11 + 1) = *(void *)&self->_doubleValue;
  *((unsigned char *)v11 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *((unsigned char *)v11 + 60) = self->_BOOLValue;
    *((unsigned char *)v11 + 64) |= 0x10u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[14] = self->_type;
    *((unsigned char *)v5 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[8] = self->_encryptionScheme;
    *((unsigned char *)v5 + 64) |= 4u;
  }
  id v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  uint64_t v9 = (void *)v6[6];
  v6[6] = v8;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v10 = self->_stringListValues;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [v6 addStringListValue:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  id v16 = [(PDDPDate *)self->_dateValue copyWithZone:a3];
  v17 = (void *)v6[3];
  v6[3] = v16;

  char v18 = (char)self->_has;
  if ((v18 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    v6[1] = *(void *)&self->_doubleValue;
    *((unsigned char *)v6 + 64) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v6;
    }
    goto LABEL_15;
  }
  v6[2] = self->_int64Value;
  *((unsigned char *)v6 + 64) |= 2u;
  char v18 = (char)self->_has;
  if (v18) {
    goto LABEL_18;
  }
LABEL_14:
  if ((v18 & 0x10) != 0)
  {
LABEL_15:
    *((unsigned char *)v6 + 60) = self->_BOOLValue;
    *((unsigned char *)v6 + 64) |= 0x10u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_encryptionScheme != *((_DWORD *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_30;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 6)
    && !-[NSString isEqual:](stringValue, "isEqual:"))
  {
    goto LABEL_30;
  }
  stringListValues = self->_stringListValues;
  if ((unint64_t)stringListValues | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](stringListValues, "isEqual:")) {
      goto LABEL_30;
    }
  }
  dateValue = self->_dateValue;
  if ((unint64_t)dateValue | *((void *)v4 + 3))
  {
    if (!-[PDDPDate isEqual:](dateValue, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_int64Value != *((void *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_30;
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0)
    {
LABEL_30:
      BOOL v8 = 0;
      goto LABEL_31;
    }
    if (self->_BOOLValue)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_30;
    }
    BOOL v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_encryptionScheme;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_stringValue hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_stringListValues hash];
  unint64_t v7 = [(PDDPDate *)self->_dateValue hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_int64Value;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_13:
    unint64_t v14 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
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
  if ((has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_BOOLValue;
  }
  else {
    uint64_t v15 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 8) != 0)
  {
    self->_uint64_t type = v4[14];
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 64);
  }
  if ((v6 & 4) != 0)
  {
    self->_encryptionScheme = v4[8];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 6)) {
    -[PDDPTypedValue setStringValue:](self, "setStringValue:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *((id *)v5 + 5);
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        -[PDDPTypedValue addStringListValue:](self, "addStringListValue:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  dateValue = self->_dateValue;
  uint64_t v13 = *((void *)v5 + 3);
  if (dateValue)
  {
    if (v13) {
      -[PDDPDate mergeFrom:](dateValue, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[PDDPTypedValue setDateValue:](self, "setDateValue:");
  }
  char v14 = *((unsigned char *)v5 + 64);
  if ((v14 & 2) == 0)
  {
    if ((v5[16] & 1) == 0) {
      goto LABEL_21;
    }
LABEL_25:
    self->_double doubleValue = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    if ((v5[16] & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  self->_int64Value = *((void *)v5 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v14 = *((unsigned char *)v5 + 64);
  if (v14) {
    goto LABEL_25;
  }
LABEL_21:
  if ((v14 & 0x10) != 0)
  {
LABEL_22:
    self->_BOOLValue = *((unsigned char *)v5 + 60);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_23:
}

- (int)encryptionScheme
{
  return self->_encryptionScheme;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSMutableArray)stringListValues
{
  return self->_stringListValues;
}

- (void)setStringListValues:(id)a3
{
}

- (PDDPDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_stringListValues, 0);

  objc_storeStrong((id *)&self->_dateValue, 0);
}

@end