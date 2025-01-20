@interface _INPBSetBinarySettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBinaryValue;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSettingMetadata;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetBinarySettingIntent)initWithCoder:(id)a3;
- (_INPBSettingMetadata)settingMetadata;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)binaryValueAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsBinaryValue:(id)a3;
- (int)binaryValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBinaryValue:(int)a3;
- (void)setHasBinaryValue:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetBinarySettingIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)binaryValue
{
  return self->_binaryValue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetBinarySettingIntent *)self hasBinaryValue])
  {
    uint64_t v4 = [(_INPBSetBinarySettingIntent *)self binaryValue];
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55203F0[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"binaryValue"];
  }
  v6 = [(_INPBSetBinarySettingIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBSetBinarySettingIntent *)self settingMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"settingMetadata"];

  v10 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"temporalEventTrigger"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSetBinarySettingIntent *)self hasBinaryValue]) {
    uint64_t v3 = 2654435761 * self->_binaryValue;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBSettingMetadata *)self->_settingMetadata hash];
  return v4 ^ v5 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBSetBinarySettingIntent *)self hasBinaryValue];
  if (v5 != [v4 hasBinaryValue]) {
    goto LABEL_21;
  }
  if ([(_INPBSetBinarySettingIntent *)self hasBinaryValue])
  {
    if ([v4 hasBinaryValue])
    {
      int binaryValue = self->_binaryValue;
      if (binaryValue != [v4 binaryValue]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBSetBinarySettingIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBSetBinarySettingIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBSetBinarySettingIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetBinarySettingIntent *)self settingMetadata];
  v8 = [v4 settingMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBSetBinarySettingIntent *)self settingMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSetBinarySettingIntent *)self settingMetadata];
    v17 = [v4 settingMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];
  v8 = [v4 temporalEventTrigger];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];
    v22 = [v4 temporalEventTrigger];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSetBinarySettingIntent allocWithZone:](_INPBSetBinarySettingIntent, "allocWithZone:") init];
  if ([(_INPBSetBinarySettingIntent *)self hasBinaryValue]) {
    [(_INPBSetBinarySettingIntent *)v5 setBinaryValue:[(_INPBSetBinarySettingIntent *)self binaryValue]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetBinarySettingIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBSetBinarySettingIntent *)v5 setSettingMetadata:v7];

  id v8 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBSetBinarySettingIntent *)v5 setTemporalEventTrigger:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetBinarySettingIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetBinarySettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetBinarySettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetBinarySettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetBinarySettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if ([(_INPBSetBinarySettingIntent *)self hasBinaryValue]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSetBinarySettingIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBSetBinarySettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetBinarySettingIntent *)self settingMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetBinarySettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];

  uint64_t v9 = v11;
  if (v8)
  {
    v10 = [(_INPBSetBinarySettingIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();

    uint64_t v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetBinarySettingIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55203F0[a3 - 1];
  }

  return v3;
}

- (void)setHasBinaryValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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