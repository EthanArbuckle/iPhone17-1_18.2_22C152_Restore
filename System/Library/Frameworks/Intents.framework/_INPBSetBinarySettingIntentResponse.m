@interface _INPBSetBinarySettingIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasErrorDetail;
- (BOOL)hasOldValue;
- (BOOL)hasUpdatedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDetail;
- (_INPBSetBinarySettingIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)oldValueAsString:(int)a3;
- (id)updatedValueAsString:(int)a3;
- (int)StringAsOldValue:(id)a3;
- (int)StringAsUpdatedValue:(id)a3;
- (int)oldValue;
- (int)updatedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorDetail:(id)a3;
- (void)setHasOldValue:(BOOL)a3;
- (void)setHasUpdatedValue:(BOOL)a3;
- (void)setOldValue:(int)a3;
- (void)setUpdatedValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetBinarySettingIntentResponse

- (void).cxx_destruct
{
}

- (int)updatedValue
{
  return self->_updatedValue;
}

- (int)oldValue
{
  return self->_oldValue;
}

- (NSString)errorDetail
{
  return self->_errorDetail;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_errorDetail)
  {
    v4 = [(_INPBSetBinarySettingIntentResponse *)self errorDetail];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"errorDetail"];
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasOldValue])
  {
    uint64_t v6 = [(_INPBSetBinarySettingIntentResponse *)self oldValue];
    if ((v6 - 1) >= 3)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E55201E0 + (v6 - 1));
    }
    [v3 setObject:v7 forKeyedSubscript:@"oldValue"];
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue])
  {
    uint64_t v8 = [(_INPBSetBinarySettingIntentResponse *)self updatedValue];
    if ((v8 - 1) >= 3)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    }
    else
    {
      v9 = *(&off_1E55201E0 + (v8 - 1));
    }
    [v3 setObject:v9 forKeyedSubscript:@"updatedValue"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_errorDetail hash];
  if ([(_INPBSetBinarySettingIntentResponse *)self hasOldValue]) {
    uint64_t v4 = 2654435761 * self->_oldValue;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue]) {
    uint64_t v5 = 2654435761 * self->_updatedValue;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  uint64_t v5 = [(_INPBSetBinarySettingIntentResponse *)self errorDetail];
  uint64_t v6 = [v4 errorDetail];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBSetBinarySettingIntentResponse *)self errorDetail];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBSetBinarySettingIntentResponse *)self errorDetail];
      v11 = [v4 errorDetail];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    int v13 = [(_INPBSetBinarySettingIntentResponse *)self hasOldValue];
    if (v13 == [v4 hasOldValue])
    {
      if (![(_INPBSetBinarySettingIntentResponse *)self hasOldValue]
        || ![v4 hasOldValue]
        || (int oldValue = self->_oldValue, oldValue == [v4 oldValue]))
      {
        int v15 = [(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue];
        if (v15 == [v4 hasUpdatedValue])
        {
          if (![(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue]
            || ![v4 hasUpdatedValue]
            || (int updatedValue = self->_updatedValue, updatedValue == [v4 updatedValue]))
          {
            BOOL v16 = 1;
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_13:
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBSetBinarySettingIntentResponse allocWithZone:](_INPBSetBinarySettingIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_errorDetail copyWithZone:a3];
  [(_INPBSetBinarySettingIntentResponse *)v5 setErrorDetail:v6];

  if ([(_INPBSetBinarySettingIntentResponse *)self hasOldValue]) {
    [(_INPBSetBinarySettingIntentResponse *)v5 setOldValue:[(_INPBSetBinarySettingIntentResponse *)self oldValue]];
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue]) {
    [(_INPBSetBinarySettingIntentResponse *)v5 setUpdatedValue:[(_INPBSetBinarySettingIntentResponse *)self updatedValue]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetBinarySettingIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetBinarySettingIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetBinarySettingIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetBinarySettingIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetBinarySettingIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_INPBSetBinarySettingIntentResponse *)self errorDetail];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasOldValue]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetBinarySettingIntentResponse *)self hasUpdatedValue]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetBinarySettingIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsUpdatedValue:(id)a3
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

- (id)updatedValueAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E55201E0 + (a3 - 1));
  }

  return v3;
}

- (void)setHasUpdatedValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdatedValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUpdatedValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int updatedValue = a3;
  }
}

- (int)StringAsOldValue:(id)a3
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

- (id)oldValueAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E55201E0 + (a3 - 1));
  }

  return v3;
}

- (void)setHasOldValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOldValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOldValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int oldValue = a3;
  }
}

- (BOOL)hasErrorDetail
{
  return self->_errorDetail != 0;
}

- (void)setErrorDetail:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  errorDetail = self->_errorDetail;
  self->_errorDetail = v4;

  MEMORY[0x1F41817F8](v4, errorDetail);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end