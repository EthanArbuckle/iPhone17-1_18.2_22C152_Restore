@interface _INPBSetTemporalSettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAction;
- (BOOL)hasIntentMetadata;
- (BOOL)hasSettingMetadata;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)hasTimeValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRangeValue)timeValue;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetTemporalSettingIntent)initWithCoder:(id)a3;
- (_INPBSettingMetadata)settingMetadata;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)setTimeValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetTemporalSettingIntent

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBSetTemporalSettingIntent *)self hasAction])
  {
    uint64_t v4 = [(_INPBSetTemporalSettingIntent *)self action];
    if ((v4 - 1) >= 3)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5520358 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"action"];
  }
  v6 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"settingMetadata"];

  v10 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"temporalEventTrigger"];

  v12 = [(_INPBSetTemporalSettingIntent *)self timeValue];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"timeValue"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeValue, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBDateTimeRangeValue)timeValue
{
  return self->_timeValue;
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

- (int)action
{
  return self->_action;
}

- (unint64_t)hash
{
  if ([(_INPBSetTemporalSettingIntent *)self hasAction]) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBSettingMetadata *)self->_settingMetadata hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
  return v6 ^ [(_INPBDateTimeRangeValue *)self->_timeValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  int v5 = [(_INPBSetTemporalSettingIntent *)self hasAction];
  if (v5 != [v4 hasAction]) {
    goto LABEL_26;
  }
  if ([(_INPBSetTemporalSettingIntent *)self hasAction])
  {
    if ([v4 hasAction])
    {
      int action = self->_action;
      if (action != [v4 action]) {
        goto LABEL_26;
      }
    }
  }
  v7 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v9 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];
  v8 = [v4 settingMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];
    v17 = [v4 settingMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];
  v8 = [v4 temporalEventTrigger];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];
    v22 = [v4 temporalEventTrigger];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBSetTemporalSettingIntent *)self timeValue];
  v8 = [v4 timeValue];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v24 = [(_INPBSetTemporalSettingIntent *)self timeValue];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    v26 = [(_INPBSetTemporalSettingIntent *)self timeValue];
    v27 = [v4 timeValue];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSetTemporalSettingIntent allocWithZone:](_INPBSetTemporalSettingIntent, "allocWithZone:") init];
  if ([(_INPBSetTemporalSettingIntent *)self hasAction]) {
    [(_INPBSetTemporalSettingIntent *)v5 setAction:[(_INPBSetTemporalSettingIntent *)self action]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetTemporalSettingIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBSetTemporalSettingIntent *)v5 setSettingMetadata:v7];

  id v8 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBSetTemporalSettingIntent *)v5 setTemporalEventTrigger:v8];

  id v9 = [(_INPBDateTimeRangeValue *)self->_timeValue copyWithZone:a3];
  [(_INPBSetTemporalSettingIntent *)v5 setTimeValue:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetTemporalSettingIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetTemporalSettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetTemporalSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetTemporalSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetTemporalSettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  if ([(_INPBSetTemporalSettingIntent *)self hasAction]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];

  if (v4)
  {
    int v5 = [(_INPBSetTemporalSettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSetTemporalSettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];

  if (v8)
  {
    id v9 = [(_INPBSetTemporalSettingIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBSetTemporalSettingIntent *)self timeValue];

  v11 = v13;
  if (v10)
  {
    v12 = [(_INPBSetTemporalSettingIntent *)self timeValue];
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTemporalSettingIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTimeValue
{
  return self->_timeValue != 0;
}

- (void)setTimeValue:(id)a3
{
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
    id v3 = *(&off_1E5520358 + (a3 - 1));
  }

  return v3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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