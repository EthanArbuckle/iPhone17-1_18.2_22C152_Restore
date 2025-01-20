@interface _INPBGetSettingResponseData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBinaryValue;
- (BOOL)hasBoundedValue;
- (BOOL)hasLabeledValue;
- (BOOL)hasNumericValue;
- (BOOL)hasSettingMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)labeledValue;
- (_INPBGetSettingResponseData)initWithCoder:(id)a3;
- (_INPBNumericSettingValue)numericValue;
- (_INPBSettingMetadata)settingMetadata;
- (id)binaryValueAsString:(int)a3;
- (id)boundedValueAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsBinaryValue:(id)a3;
- (int)StringAsBoundedValue:(id)a3;
- (int)binaryValue;
- (int)boundedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBinaryValue:(int)a3;
- (void)setBoundedValue:(int)a3;
- (void)setHasBinaryValue:(BOOL)a3;
- (void)setHasBoundedValue:(BOOL)a3;
- (void)setLabeledValue:(id)a3;
- (void)setNumericValue:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetSettingResponseData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);

  objc_storeStrong((id *)&self->_labeledValue, 0);
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (NSString)labeledValue
{
  return self->_labeledValue;
}

- (int)boundedValue
{
  return self->_boundedValue;
}

- (int)binaryValue
{
  return self->_binaryValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBGetSettingResponseData *)self hasBinaryValue])
  {
    uint64_t v4 = [(_INPBGetSettingResponseData *)self binaryValue];
    if ((v4 - 1) >= 3)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5520258 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"binaryValue"];
  }
  if ([(_INPBGetSettingResponseData *)self hasBoundedValue])
  {
    uint64_t v6 = [(_INPBGetSettingResponseData *)self boundedValue];
    if ((v6 - 1) >= 3)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E5520270 + (v6 - 1));
    }
    [v3 setObject:v7 forKeyedSubscript:@"boundedValue"];
  }
  if (self->_labeledValue)
  {
    v8 = [(_INPBGetSettingResponseData *)self labeledValue];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"labeledValue"];
  }
  v10 = [(_INPBGetSettingResponseData *)self numericValue];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"numericValue"];

  v12 = [(_INPBGetSettingResponseData *)self settingMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"settingMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBGetSettingResponseData *)self hasBinaryValue]) {
    uint64_t v3 = 2654435761 * self->_binaryValue;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBGetSettingResponseData *)self hasBoundedValue]) {
    uint64_t v4 = 2654435761 * self->_boundedValue;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_labeledValue hash];
  unint64_t v6 = [(_INPBNumericSettingValue *)self->_numericValue hash];
  return v5 ^ v6 ^ [(_INPBSettingMetadata *)self->_settingMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  int v5 = [(_INPBGetSettingResponseData *)self hasBinaryValue];
  if (v5 != [v4 hasBinaryValue]) {
    goto LABEL_25;
  }
  if ([(_INPBGetSettingResponseData *)self hasBinaryValue])
  {
    if ([v4 hasBinaryValue])
    {
      int binaryValue = self->_binaryValue;
      if (binaryValue != [v4 binaryValue]) {
        goto LABEL_25;
      }
    }
  }
  int v7 = [(_INPBGetSettingResponseData *)self hasBoundedValue];
  if (v7 != [v4 hasBoundedValue]) {
    goto LABEL_25;
  }
  if ([(_INPBGetSettingResponseData *)self hasBoundedValue])
  {
    if ([v4 hasBoundedValue])
    {
      int boundedValue = self->_boundedValue;
      if (boundedValue != [v4 boundedValue]) {
        goto LABEL_25;
      }
    }
  }
  v9 = [(_INPBGetSettingResponseData *)self labeledValue];
  v10 = [v4 labeledValue];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_24;
  }
  uint64_t v11 = [(_INPBGetSettingResponseData *)self labeledValue];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBGetSettingResponseData *)self labeledValue];
    v14 = [v4 labeledValue];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  v9 = [(_INPBGetSettingResponseData *)self numericValue];
  v10 = [v4 numericValue];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_24;
  }
  uint64_t v16 = [(_INPBGetSettingResponseData *)self numericValue];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBGetSettingResponseData *)self numericValue];
    v19 = [v4 numericValue];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  v9 = [(_INPBGetSettingResponseData *)self settingMetadata];
  v10 = [v4 settingMetadata];
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v21 = [(_INPBGetSettingResponseData *)self settingMetadata];
    if (!v21)
    {

LABEL_28:
      BOOL v26 = 1;
      goto LABEL_26;
    }
    v22 = (void *)v21;
    v23 = [(_INPBGetSettingResponseData *)self settingMetadata];
    v24 = [v4 settingMetadata];
    char v25 = [v23 isEqual:v24];

    if (v25) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v26 = 0;
LABEL_26:

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBGetSettingResponseData allocWithZone:](_INPBGetSettingResponseData, "allocWithZone:") init];
  if ([(_INPBGetSettingResponseData *)self hasBinaryValue]) {
    [(_INPBGetSettingResponseData *)v5 setBinaryValue:[(_INPBGetSettingResponseData *)self binaryValue]];
  }
  if ([(_INPBGetSettingResponseData *)self hasBoundedValue]) {
    [(_INPBGetSettingResponseData *)v5 setBoundedValue:[(_INPBGetSettingResponseData *)self boundedValue]];
  }
  unint64_t v6 = (void *)[(NSString *)self->_labeledValue copyWithZone:a3];
  [(_INPBGetSettingResponseData *)v5 setLabeledValue:v6];

  id v7 = [(_INPBNumericSettingValue *)self->_numericValue copyWithZone:a3];
  [(_INPBGetSettingResponseData *)v5 setNumericValue:v7];

  id v8 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBGetSettingResponseData *)v5 setSettingMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetSettingResponseData *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetSettingResponseData)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetSettingResponseData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetSettingResponseData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetSettingResponseData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if ([(_INPBGetSettingResponseData *)self hasBinaryValue]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBGetSettingResponseData *)self hasBoundedValue]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBGetSettingResponseData *)self labeledValue];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBGetSettingResponseData *)self numericValue];

  if (v5)
  {
    id v6 = [(_INPBGetSettingResponseData *)self numericValue];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBGetSettingResponseData *)self settingMetadata];

  id v8 = v10;
  if (v7)
  {
    v9 = [(_INPBGetSettingResponseData *)self settingMetadata];
    PBDataWriterWriteSubmessage();

    id v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetSettingResponseDataReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (void)setSettingMetadata:(id)a3
{
}

- (BOOL)hasNumericValue
{
  return self->_numericValue != 0;
}

- (void)setNumericValue:(id)a3
{
}

- (BOOL)hasLabeledValue
{
  return self->_labeledValue != 0;
}

- (void)setLabeledValue:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  labeledValue = self->_labeledValue;
  self->_labeledValue = v4;

  MEMORY[0x1F41817F8](v4, labeledValue);
}

- (int)StringAsBoundedValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MIN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MEDIAN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)boundedValueAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520270 + (a3 - 1));
  }

  return v3;
}

- (void)setHasBoundedValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBoundedValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBoundedValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int boundedValue = a3;
  }
}

- (int)StringAsBinaryValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OFF"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TOGGLE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)binaryValueAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520258 + (a3 - 1));
  }

  return v3;
}

- (void)setHasBinaryValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBinaryValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBinaryValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int binaryValue = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end