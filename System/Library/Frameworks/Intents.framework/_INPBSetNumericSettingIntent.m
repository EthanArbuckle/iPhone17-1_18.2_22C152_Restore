@interface _INPBSetNumericSettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAction;
- (BOOL)hasBoundedValue;
- (BOOL)hasIntentMetadata;
- (BOOL)hasNumericValue;
- (BOOL)hasSettingMetadata;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBNumericSettingValue)numericValue;
- (_INPBSetNumericSettingIntent)initWithCoder:(id)a3;
- (_INPBSettingMetadata)settingMetadata;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)actionAsString:(int)a3;
- (id)boundedValueAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAction:(id)a3;
- (int)StringAsBoundedValue:(id)a3;
- (int)action;
- (int)boundedValue;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int)a3;
- (void)setBoundedValue:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasBoundedValue:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setNumericValue:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetNumericSettingIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);

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

- (_INPBNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)boundedValue
{
  return self->_boundedValue;
}

- (int)action
{
  return self->_action;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetNumericSettingIntent *)self hasAction])
  {
    uint64_t v4 = [(_INPBSetNumericSettingIntent *)self action];
    if ((v4 - 1) >= 3)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5520388 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"action"];
  }
  if ([(_INPBSetNumericSettingIntent *)self hasBoundedValue])
  {
    uint64_t v6 = [(_INPBSetNumericSettingIntent *)self boundedValue];
    if ((v6 - 1) >= 3)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E55203A0 + (v6 - 1));
    }
    [v3 setObject:v7 forKeyedSubscript:@"boundedValue"];
  }
  v8 = [(_INPBSetNumericSettingIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  v10 = [(_INPBSetNumericSettingIntent *)self numericValue];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"numericValue"];

  v12 = [(_INPBSetNumericSettingIntent *)self settingMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"settingMetadata"];

  v14 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"temporalEventTrigger"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBSetNumericSettingIntent *)self hasAction]) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBSetNumericSettingIntent *)self hasBoundedValue]) {
    uint64_t v4 = 2654435761 * self->_boundedValue;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v6 = [(_INPBNumericSettingValue *)self->_numericValue hash];
  unint64_t v7 = v5 ^ v6 ^ [(_INPBSettingMetadata *)self->_settingMetadata hash];
  return v7 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  int v5 = [(_INPBSetNumericSettingIntent *)self hasAction];
  if (v5 != [v4 hasAction]) {
    goto LABEL_30;
  }
  if ([(_INPBSetNumericSettingIntent *)self hasAction])
  {
    if ([v4 hasAction])
    {
      int action = self->_action;
      if (action != [v4 action]) {
        goto LABEL_30;
      }
    }
  }
  int v7 = [(_INPBSetNumericSettingIntent *)self hasBoundedValue];
  if (v7 != [v4 hasBoundedValue]) {
    goto LABEL_30;
  }
  if ([(_INPBSetNumericSettingIntent *)self hasBoundedValue])
  {
    if ([v4 hasBoundedValue])
    {
      int boundedValue = self->_boundedValue;
      if (boundedValue != [v4 boundedValue]) {
        goto LABEL_30;
      }
    }
  }
  v9 = [(_INPBSetNumericSettingIntent *)self intentMetadata];
  v10 = [v4 intentMetadata];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v11 = [(_INPBSetNumericSettingIntent *)self intentMetadata];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(_INPBSetNumericSettingIntent *)self intentMetadata];
    v14 = [v4 intentMetadata];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  v9 = [(_INPBSetNumericSettingIntent *)self numericValue];
  v10 = [v4 numericValue];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v16 = [(_INPBSetNumericSettingIntent *)self numericValue];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBSetNumericSettingIntent *)self numericValue];
    v19 = [v4 numericValue];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  v9 = [(_INPBSetNumericSettingIntent *)self settingMetadata];
  v10 = [v4 settingMetadata];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_29;
  }
  uint64_t v21 = [(_INPBSetNumericSettingIntent *)self settingMetadata];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBSetNumericSettingIntent *)self settingMetadata];
    v24 = [v4 settingMetadata];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  v9 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];
  v10 = [v4 temporalEventTrigger];
  if ((v9 == 0) != (v10 != 0))
  {
    uint64_t v26 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];
    if (!v26)
    {

LABEL_33:
      BOOL v31 = 1;
      goto LABEL_31;
    }
    v27 = (void *)v26;
    v28 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];
    v29 = [v4 temporalEventTrigger];
    char v30 = [v28 isEqual:v29];

    if (v30) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v31 = 0;
LABEL_31:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSetNumericSettingIntent allocWithZone:](_INPBSetNumericSettingIntent, "allocWithZone:") init];
  if ([(_INPBSetNumericSettingIntent *)self hasAction]) {
    [(_INPBSetNumericSettingIntent *)v5 setAction:[(_INPBSetNumericSettingIntent *)self action]];
  }
  if ([(_INPBSetNumericSettingIntent *)self hasBoundedValue]) {
    [(_INPBSetNumericSettingIntent *)v5 setBoundedValue:[(_INPBSetNumericSettingIntent *)self boundedValue]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetNumericSettingIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBNumericSettingValue *)self->_numericValue copyWithZone:a3];
  [(_INPBSetNumericSettingIntent *)v5 setNumericValue:v7];

  id v8 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBSetNumericSettingIntent *)v5 setSettingMetadata:v8];

  id v9 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBSetNumericSettingIntent *)v5 setTemporalEventTrigger:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetNumericSettingIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetNumericSettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetNumericSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetNumericSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetNumericSettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  if ([(_INPBSetNumericSettingIntent *)self hasAction]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSetNumericSettingIntent *)self hasBoundedValue]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSetNumericSettingIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBSetNumericSettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetNumericSettingIntent *)self numericValue];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetNumericSettingIntent *)self numericValue];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetNumericSettingIntent *)self settingMetadata];

  if (v8)
  {
    id v9 = [(_INPBSetNumericSettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];

  uint64_t v11 = v13;
  if (v10)
  {
    v12 = [(_INPBSetNumericSettingIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();

    uint64_t v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetNumericSettingIntentReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasNumericValue
{
  return self->_numericValue != 0;
}

- (void)setNumericValue:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
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
    id v3 = *(&off_1E55203A0 + (a3 - 1));
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

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SET"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INCREASE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DECREASE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)actionAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520388 + (a3 - 1));
  }

  return v3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAction:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int action = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end