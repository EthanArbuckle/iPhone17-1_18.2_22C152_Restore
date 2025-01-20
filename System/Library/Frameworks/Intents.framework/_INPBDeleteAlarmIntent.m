@interface _INPBDeleteAlarmIntent
+ (BOOL)supportsSecureCoding;
+ (Class)alarmsType;
- (BOOL)hasAlarmSearch;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alarms;
- (_INPBAlarmSearch)alarmSearch;
- (_INPBDeleteAlarmIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)alarmsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)alarmsCount;
- (unint64_t)hash;
- (void)addAlarms:(id)a3;
- (void)clearAlarms;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteAlarmIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_alarms, 0);

  objc_storeStrong((id *)&self->_alarmSearch, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDeleteAlarmIntent *)self alarmSearch];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"alarmSearch"];

  if ([(NSArray *)self->_alarms count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_alarms;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"alarms"];
  }
  v13 = [(_INPBDeleteAlarmIntent *)self intentMetadata];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAlarmSearch *)self->_alarmSearch hash];
  uint64_t v4 = [(NSArray *)self->_alarms hash] ^ v3;
  return v4 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBDeleteAlarmIntent *)self alarmSearch];
  v6 = [v4 alarmSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBDeleteAlarmIntent *)self alarmSearch];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBDeleteAlarmIntent *)self alarmSearch];
    uint64_t v10 = [v4 alarmSearch];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBDeleteAlarmIntent *)self alarms];
  v6 = [v4 alarms];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBDeleteAlarmIntent *)self alarms];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBDeleteAlarmIntent *)self alarms];
    v15 = [v4 alarms];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBDeleteAlarmIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBDeleteAlarmIntent *)self intentMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    long long v18 = (void *)v17;
    long long v19 = [(_INPBDeleteAlarmIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBDeleteAlarmIntent allocWithZone:](_INPBDeleteAlarmIntent, "allocWithZone:") init];
  id v6 = [(_INPBAlarmSearch *)self->_alarmSearch copyWithZone:a3];
  [(_INPBDeleteAlarmIntent *)v5 setAlarmSearch:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_alarms copyWithZone:a3];
  [(_INPBDeleteAlarmIntent *)v5 setAlarms:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBDeleteAlarmIntent *)v5 setIntentMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteAlarmIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteAlarmIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteAlarmIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBDeleteAlarmIntent *)self alarmSearch];

  if (v5)
  {
    id v6 = [(_INPBDeleteAlarmIntent *)self alarmSearch];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_alarms;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(_INPBDeleteAlarmIntent *)self intentMetadata];

  if (v12)
  {
    v13 = [(_INPBDeleteAlarmIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteAlarmIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (id)alarmsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alarms objectAtIndexedSubscript:a3];
}

- (unint64_t)alarmsCount
{
  return [(NSArray *)self->_alarms count];
}

- (void)addAlarms:(id)a3
{
  id v4 = a3;
  alarms = self->_alarms;
  id v8 = v4;
  if (!alarms)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alarms;
    self->_alarms = v6;

    id v4 = v8;
    alarms = self->_alarms;
  }
  [(NSArray *)alarms addObject:v4];
}

- (void)clearAlarms
{
}

- (void)setAlarms:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  alarms = self->_alarms;
  self->_alarms = v4;

  MEMORY[0x1F41817F8](v4, alarms);
}

- (BOOL)hasAlarmSearch
{
  return self->_alarmSearch != 0;
}

- (void)setAlarmSearch:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)alarmsType
{
  return (Class)objc_opt_class();
}

@end