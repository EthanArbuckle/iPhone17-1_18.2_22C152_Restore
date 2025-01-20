@interface _INPBGetSettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConfirmationValue;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSettingMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBGetSettingIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSettingMetadata)settingMetadata;
- (id)confirmationValueAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsConfirmationValue:(id)a3;
- (int)confirmationValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationValue:(int)a3;
- (void)setHasConfirmationValue:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetSettingIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingMetadata, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)confirmationValue
{
  return self->_confirmationValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBGetSettingIntent *)self hasConfirmationValue])
  {
    uint64_t v4 = [(_INPBGetSettingIntent *)self confirmationValue];
    if ((v4 - 1) >= 3)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5520370 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"confirmationValue"];
  }
  v6 = [(_INPBGetSettingIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBGetSettingIntent *)self settingMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"settingMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBGetSettingIntent *)self hasConfirmationValue]) {
    uint64_t v3 = 2654435761 * self->_confirmationValue;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(_INPBSettingMetadata *)self->_settingMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBGetSettingIntent *)self hasConfirmationValue];
  if (v5 != [v4 hasConfirmationValue]) {
    goto LABEL_16;
  }
  if ([(_INPBGetSettingIntent *)self hasConfirmationValue])
  {
    if ([v4 hasConfirmationValue])
    {
      int confirmationValue = self->_confirmationValue;
      if (confirmationValue != [v4 confirmationValue]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBGetSettingIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBGetSettingIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBGetSettingIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBGetSettingIntent *)self settingMetadata];
  v8 = [v4 settingMetadata];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBGetSettingIntent *)self settingMetadata];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBGetSettingIntent *)self settingMetadata];
    v17 = [v4 settingMetadata];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBGetSettingIntent allocWithZone:](_INPBGetSettingIntent, "allocWithZone:") init];
  if ([(_INPBGetSettingIntent *)self hasConfirmationValue]) {
    [(_INPBGetSettingIntent *)v5 setConfirmationValue:[(_INPBGetSettingIntent *)self confirmationValue]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBGetSettingIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBGetSettingIntent *)v5 setSettingMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetSettingIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetSettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetSettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if ([(_INPBGetSettingIntent *)self hasConfirmationValue]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBGetSettingIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBGetSettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBGetSettingIntent *)self settingMetadata];

  uint64_t v7 = v9;
  if (v6)
  {
    v8 = [(_INPBGetSettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();

    uint64_t v7 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetSettingIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (void)setSettingMetadata:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (int)StringAsConfirmationValue:(id)a3
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

- (id)confirmationValueAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520370 + (a3 - 1));
  }

  return v3;
}

- (void)setHasConfirmationValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirmationValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirmationValue:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int confirmationValue = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end