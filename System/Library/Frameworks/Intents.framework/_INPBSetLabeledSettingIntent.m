@interface _INPBSetLabeledSettingIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLabeledValue;
- (BOOL)hasSettingMetadata;
- (BOOL)hasTemporalEventTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)labeledValue;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSetLabeledSettingIntent)initWithCoder:(id)a3;
- (_INPBSettingMetadata)settingMetadata;
- (_INPBTemporalEventTrigger)temporalEventTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLabeledValue:(id)a3;
- (void)setSettingMetadata:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSetLabeledSettingIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_labeledValue, 0);

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

- (NSString)labeledValue
{
  return self->_labeledValue;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if (self->_labeledValue)
  {
    v6 = [(_INPBSetLabeledSettingIntent *)self labeledValue];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"labeledValue"];
  }
  v8 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"settingMetadata"];

  v10 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"temporalEventTrigger"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  NSUInteger v4 = [(NSString *)self->_labeledValue hash] ^ v3;
  unint64_t v5 = [(_INPBSettingMetadata *)self->_settingMetadata hash];
  return v4 ^ v5 ^ [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetLabeledSettingIntent *)self labeledValue];
  v6 = [v4 labeledValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSetLabeledSettingIntent *)self labeledValue];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSetLabeledSettingIntent *)self labeledValue];
    v15 = [v4 labeledValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];
  v6 = [v4 settingMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];
    v20 = [v4 settingMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];
  v6 = [v4 temporalEventTrigger];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];
    v25 = [v4 temporalEventTrigger];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSetLabeledSettingIntent allocWithZone:](_INPBSetLabeledSettingIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSetLabeledSettingIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSString *)self->_labeledValue copyWithZone:a3];
  [(_INPBSetLabeledSettingIntent *)v5 setLabeledValue:v7];

  id v8 = [(_INPBSettingMetadata *)self->_settingMetadata copyWithZone:a3];
  [(_INPBSetLabeledSettingIntent *)v5 setSettingMetadata:v8];

  id v9 = [(_INPBTemporalEventTrigger *)self->_temporalEventTrigger copyWithZone:a3];
  [(_INPBSetLabeledSettingIntent *)v5 setTemporalEventTrigger:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSetLabeledSettingIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSetLabeledSettingIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSetLabeledSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSetLabeledSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSetLabeledSettingIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];

  if (v4)
  {
    unint64_t v5 = [(_INPBSetLabeledSettingIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSetLabeledSettingIntent *)self labeledValue];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];

  if (v7)
  {
    id v8 = [(_INPBSetLabeledSettingIntent *)self settingMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];

  if (v9)
  {
    v10 = [(_INPBSetLabeledSettingIntent *)self temporalEventTrigger];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetLabeledSettingIntentReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end