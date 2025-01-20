@interface _INPBHomeAttributeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLeanValue;
- (BOOL)hasBooleanValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasLimitValue;
- (BOOL)hasRangeValue;
- (BOOL)hasStringValue;
- (BOOL)hasUnit;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (_INPBHomeAttributeRange)rangeValue;
- (_INPBHomeAttributeValue)initWithCoder:(id)a3;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)limitValueAsString:(int)a3;
- (id)unitAsString:(int)a3;
- (id)valueTypeAsString:(int)a3;
- (int)StringAsLimitValue:(id)a3;
- (int)StringAsUnit:(id)a3;
- (int)StringAsValueType:(id)a3;
- (int)limitValue;
- (int)unit;
- (int)valueType;
- (int64_t)integerValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBooleanValue:(BOOL)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBooleanValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setHasLimitValue:(BOOL)a3;
- (void)setHasUnit:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setLimitValue:(int)a3;
- (void)setRangeValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUnit:(int)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeAttributeValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_rangeValue, 0);
}

- (int)valueType
{
  return self->_valueType;
}

- (int)unit
{
  return self->_unit;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_INPBHomeAttributeRange)rangeValue
{
  return self->_rangeValue;
}

- (int)limitValue
{
  return self->_limitValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeAttributeValue *)self hasBooleanValue])
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBHomeAttributeValue BOOLeanValue](self, "BOOLeanValue"));
    [v3 setObject:v4 forKeyedSubscript:@"BOOLeanValue"];
  }
  if ([(_INPBHomeAttributeValue *)self hasDoubleValue])
  {
    v5 = NSNumber;
    [(_INPBHomeAttributeValue *)self doubleValue];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"doubleValue"];
  }
  if ([(_INPBHomeAttributeValue *)self hasIntegerValue])
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[_INPBHomeAttributeValue integerValue](self, "integerValue"));
    [v3 setObject:v7 forKeyedSubscript:@"integerValue"];
  }
  if ([(_INPBHomeAttributeValue *)self hasLimitValue])
  {
    uint64_t v8 = [(_INPBHomeAttributeValue *)self limitValue];
    if (v8 == 1)
    {
      v9 = @"MIN";
    }
    else if (v8 == 2)
    {
      v9 = @"MAX";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v9 forKeyedSubscript:@"limitValue"];
  }
  v10 = [(_INPBHomeAttributeValue *)self rangeValue];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"rangeValue"];

  if (self->_stringValue)
  {
    v12 = [(_INPBHomeAttributeValue *)self stringValue];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"stringValue"];
  }
  if ([(_INPBHomeAttributeValue *)self hasUnit])
  {
    uint64_t v14 = [(_INPBHomeAttributeValue *)self unit];
    if ((v14 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5517BD0[(v14 - 1)];
    }
    [v3 setObject:v15 forKeyedSubscript:@"unit"];
  }
  if ([(_INPBHomeAttributeValue *)self hasValueType])
  {
    uint64_t v16 = [(_INPBHomeAttributeValue *)self valueType];
    if (v16 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5517BF8[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"valueType"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeAttributeValue *)self hasBooleanValue]) {
    uint64_t v3 = 2654435761 * self->_BOOLeanValue;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBHomeAttributeValue *)self hasDoubleValue])
  {
    double doubleValue = self->_doubleValue;
    double v5 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v5 = self->_doubleValue;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v8 += (unint64_t)v7;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ([(_INPBHomeAttributeValue *)self hasIntegerValue]) {
    uint64_t v9 = 2654435761 * self->_integerValue;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBHomeAttributeValue *)self hasLimitValue]) {
    uint64_t v10 = 2654435761 * self->_limitValue;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(_INPBHomeAttributeRange *)self->_rangeValue hash];
  NSUInteger v12 = [(NSString *)self->_stringValue hash];
  if ([(_INPBHomeAttributeValue *)self hasUnit]) {
    uint64_t v13 = 2654435761 * self->_unit;
  }
  else {
    uint64_t v13 = 0;
  }
  if ([(_INPBHomeAttributeValue *)self hasValueType]) {
    uint64_t v14 = 2654435761 * self->_valueType;
  }
  else {
    uint64_t v14 = 0;
  }
  return v8 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  int v5 = [(_INPBHomeAttributeValue *)self hasBooleanValue];
  if (v5 != [v4 hasBooleanValue]) {
    goto LABEL_28;
  }
  if ([(_INPBHomeAttributeValue *)self hasBooleanValue])
  {
    if ([v4 hasBooleanValue])
    {
      int BOOLeanValue = self->_BOOLeanValue;
      if (BOOLeanValue != [v4 BOOLeanValue]) {
        goto LABEL_28;
      }
    }
  }
  int v7 = [(_INPBHomeAttributeValue *)self hasDoubleValue];
  if (v7 != [v4 hasDoubleValue]) {
    goto LABEL_28;
  }
  if ([(_INPBHomeAttributeValue *)self hasDoubleValue])
  {
    if ([v4 hasDoubleValue])
    {
      double doubleValue = self->_doubleValue;
      [v4 doubleValue];
      if (doubleValue != v9) {
        goto LABEL_28;
      }
    }
  }
  int v10 = [(_INPBHomeAttributeValue *)self hasIntegerValue];
  if (v10 != [v4 hasIntegerValue]) {
    goto LABEL_28;
  }
  if ([(_INPBHomeAttributeValue *)self hasIntegerValue])
  {
    if ([v4 hasIntegerValue])
    {
      int64_t integerValue = self->_integerValue;
      if (integerValue != [v4 integerValue]) {
        goto LABEL_28;
      }
    }
  }
  int v12 = [(_INPBHomeAttributeValue *)self hasLimitValue];
  if (v12 != [v4 hasLimitValue]) {
    goto LABEL_28;
  }
  if ([(_INPBHomeAttributeValue *)self hasLimitValue])
  {
    if ([v4 hasLimitValue])
    {
      int limitValue = self->_limitValue;
      if (limitValue != [v4 limitValue]) {
        goto LABEL_28;
      }
    }
  }
  uint64_t v14 = [(_INPBHomeAttributeValue *)self rangeValue];
  v15 = [v4 rangeValue];
  if ((v14 == 0) == (v15 != 0)) {
    goto LABEL_27;
  }
  uint64_t v16 = [(_INPBHomeAttributeValue *)self rangeValue];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBHomeAttributeValue *)self rangeValue];
    v19 = [v4 rangeValue];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  uint64_t v14 = [(_INPBHomeAttributeValue *)self stringValue];
  v15 = [v4 stringValue];
  if ((v14 == 0) == (v15 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v21 = [(_INPBHomeAttributeValue *)self stringValue];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBHomeAttributeValue *)self stringValue];
    v24 = [v4 stringValue];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  int v28 = [(_INPBHomeAttributeValue *)self hasUnit];
  if (v28 == [v4 hasUnit])
  {
    if (![(_INPBHomeAttributeValue *)self hasUnit]
      || ![v4 hasUnit]
      || (int unit = self->_unit, unit == [v4 unit]))
    {
      int v30 = [(_INPBHomeAttributeValue *)self hasValueType];
      if (v30 == [v4 hasValueType])
      {
        if (![(_INPBHomeAttributeValue *)self hasValueType]
          || ![v4 hasValueType]
          || (int valueType = self->_valueType, valueType == [v4 valueType]))
        {
          BOOL v26 = 1;
          goto LABEL_29;
        }
      }
    }
  }
LABEL_28:
  BOOL v26 = 0;
LABEL_29:

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBHomeAttributeValue allocWithZone:](_INPBHomeAttributeValue, "allocWithZone:") init];
  if ([(_INPBHomeAttributeValue *)self hasBooleanValue]) {
    [(_INPBHomeAttributeValue *)v5 setBooleanValue:[(_INPBHomeAttributeValue *)self BOOLeanValue]];
  }
  if ([(_INPBHomeAttributeValue *)self hasDoubleValue])
  {
    [(_INPBHomeAttributeValue *)self doubleValue];
    -[_INPBHomeAttributeValue setDoubleValue:](v5, "setDoubleValue:");
  }
  if ([(_INPBHomeAttributeValue *)self hasIntegerValue]) {
    [(_INPBHomeAttributeValue *)v5 setIntegerValue:[(_INPBHomeAttributeValue *)self integerValue]];
  }
  if ([(_INPBHomeAttributeValue *)self hasLimitValue]) {
    [(_INPBHomeAttributeValue *)v5 setLimitValue:[(_INPBHomeAttributeValue *)self limitValue]];
  }
  id v6 = [(_INPBHomeAttributeRange *)self->_rangeValue copyWithZone:a3];
  [(_INPBHomeAttributeValue *)v5 setRangeValue:v6];

  int v7 = (void *)[(NSString *)self->_stringValue copyWithZone:a3];
  [(_INPBHomeAttributeValue *)v5 setStringValue:v7];

  if ([(_INPBHomeAttributeValue *)self hasUnit]) {
    [(_INPBHomeAttributeValue *)v5 setUnit:[(_INPBHomeAttributeValue *)self unit]];
  }
  if ([(_INPBHomeAttributeValue *)self hasValueType]) {
    [(_INPBHomeAttributeValue *)v5 setValueType:[(_INPBHomeAttributeValue *)self valueType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeAttributeValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeAttributeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeAttributeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeAttributeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeAttributeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBHomeAttributeValue *)self hasBooleanValue]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBHomeAttributeValue *)self hasDoubleValue]) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_INPBHomeAttributeValue *)self hasIntegerValue]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBHomeAttributeValue *)self hasLimitValue]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBHomeAttributeValue *)self rangeValue];

  if (v4)
  {
    int v5 = [(_INPBHomeAttributeValue *)self rangeValue];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBHomeAttributeValue *)self stringValue];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBHomeAttributeValue *)self hasUnit]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBHomeAttributeValue *)self hasValueType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAttributeValueReadFrom(self, (uint64_t)a3);
}

- (int)StringAsValueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BOOLEAN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DOUBLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTEGER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LIMIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RANGE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)valueTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517BF8[a3];
  }

  return v3;
}

- (void)setHasValueType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasValueType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setValueType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int valueType = a3;
  }
}

- (int)StringAsUnit:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PERCENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAHRENHEIT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CELSIUS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LUX"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SECONDS"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)unitAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517BD0[a3 - 1];
  }

  return v3;
}

- (void)setHasUnit:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUnit
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUnit:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int unit = a3;
  }
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setStringValue:(id)a3
{
  self->_stringValue = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasRangeValue
{
  return self->_rangeValue != 0;
}

- (void)setRangeValue:(id)a3
{
}

- (int)StringAsLimitValue:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"MIN"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"MAX"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)limitValueAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"MIN";
  }
  else if (a3 == 2)
  {
    int v4 = @"MAX";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasLimitValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLimitValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLimitValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int limitValue = a3;
  }
}

- (void)setHasIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t integerValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double doubleValue = a3;
}

- (void)setHasBooleanValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBooleanValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBooleanValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int BOOLeanValue = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end