@interface _INPBUpdateAlarmIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)conflictAlarmsType;
- (BOOL)hasUpdatedAlarm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)conflictAlarms;
- (_INPBAlarm)updatedAlarm;
- (_INPBUpdateAlarmIntentResponse)initWithCoder:(id)a3;
- (id)conflictAlarmsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)conflictAlarmsCount;
- (unint64_t)hash;
- (void)addConflictAlarms:(id)a3;
- (void)clearConflictAlarms;
- (void)encodeWithCoder:(id)a3;
- (void)setConflictAlarms:(id)a3;
- (void)setUpdatedAlarm:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUpdateAlarmIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAlarm, 0);

  objc_storeStrong((id *)&self->_conflictAlarms, 0);
}

- (_INPBAlarm)updatedAlarm
{
  return self->_updatedAlarm;
}

- (NSArray)conflictAlarms
{
  return self->_conflictAlarms;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_conflictAlarms count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_conflictAlarms;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"conflictAlarms"];
  }
  v11 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"updatedAlarm"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_conflictAlarms hash];
  return [(_INPBAlarm *)self->_updatedAlarm hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBUpdateAlarmIntentResponse *)self conflictAlarms];
  uint64_t v6 = [v4 conflictAlarms];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBUpdateAlarmIntentResponse *)self conflictAlarms];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBUpdateAlarmIntentResponse *)self conflictAlarms];
    v10 = [v4 conflictAlarms];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];
  uint64_t v6 = [v4 updatedAlarm];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];
    long long v15 = [v4 updatedAlarm];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBUpdateAlarmIntentResponse allocWithZone:](_INPBUpdateAlarmIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSArray *)self->_conflictAlarms copyWithZone:a3];
  [(_INPBUpdateAlarmIntentResponse *)v5 setConflictAlarms:v6];

  id v7 = [(_INPBAlarm *)self->_updatedAlarm copyWithZone:a3];
  [(_INPBUpdateAlarmIntentResponse *)v5 setUpdatedAlarm:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUpdateAlarmIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUpdateAlarmIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUpdateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUpdateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUpdateAlarmIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_conflictAlarms;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];

  if (v10)
  {
    int v11 = [(_INPBUpdateAlarmIntentResponse *)self updatedAlarm];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateAlarmIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUpdatedAlarm
{
  return self->_updatedAlarm != 0;
}

- (void)setUpdatedAlarm:(id)a3
{
}

- (id)conflictAlarmsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_conflictAlarms objectAtIndexedSubscript:a3];
}

- (unint64_t)conflictAlarmsCount
{
  return [(NSArray *)self->_conflictAlarms count];
}

- (void)addConflictAlarms:(id)a3
{
  id v4 = a3;
  conflictAlarms = self->_conflictAlarms;
  id v8 = v4;
  if (!conflictAlarms)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_conflictAlarms;
    self->_conflictAlarms = v6;

    id v4 = v8;
    conflictAlarms = self->_conflictAlarms;
  }
  [(NSArray *)conflictAlarms addObject:v4];
}

- (void)clearConflictAlarms
{
}

- (void)setConflictAlarms:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  conflictAlarms = self->_conflictAlarms;
  self->_conflictAlarms = v4;

  MEMORY[0x1F41817F8](v4, conflictAlarms);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)conflictAlarmsType
{
  return (Class)objc_opt_class();
}

@end