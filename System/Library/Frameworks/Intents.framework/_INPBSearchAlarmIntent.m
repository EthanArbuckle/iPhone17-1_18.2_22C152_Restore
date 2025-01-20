@interface _INPBSearchAlarmIntent
+ (BOOL)supportsSecureCoding;
+ (Class)alarmsType;
- (BOOL)hasAlarmSearch;
- (BOOL)hasAlarmSearchType;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alarms;
- (_INPBAlarmSearch)alarmSearch;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchAlarmIntent)initWithCoder:(id)a3;
- (id)alarmSearchTypeAsString:(int)a3;
- (id)alarmsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAlarmSearchType:(id)a3;
- (int)alarmSearchType;
- (unint64_t)alarmsCount;
- (unint64_t)hash;
- (void)addAlarms:(id)a3;
- (void)clearAlarms;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setAlarmSearchType:(int)a3;
- (void)setAlarms:(id)a3;
- (void)setHasAlarmSearchType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchAlarmIntent

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

- (int)alarmSearchType
{
  return self->_alarmSearchType;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchAlarmIntent *)self alarmSearch];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"alarmSearch"];

  if ([(_INPBSearchAlarmIntent *)self hasAlarmSearchType])
  {
    uint64_t v6 = [(_INPBSearchAlarmIntent *)self alarmSearchType];
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5520970[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"alarmSearchType"];
  }
  if ([(NSArray *)self->_alarms count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_alarms;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"alarms"];
  }
  v15 = [(_INPBSearchAlarmIntent *)self intentMetadata];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAlarmSearch *)self->_alarmSearch hash];
  if ([(_INPBSearchAlarmIntent *)self hasAlarmSearchType]) {
    uint64_t v4 = 2654435761 * self->_alarmSearchType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  uint64_t v6 = [(NSArray *)self->_alarms hash];
  return v5 ^ v6 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  unint64_t v5 = [(_INPBSearchAlarmIntent *)self alarmSearch];
  uint64_t v6 = [v4 alarmSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBSearchAlarmIntent *)self alarmSearch];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSearchAlarmIntent *)self alarmSearch];
    uint64_t v10 = [v4 alarmSearch];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSearchAlarmIntent *)self hasAlarmSearchType];
  if (v12 != [v4 hasAlarmSearchType]) {
    goto LABEL_21;
  }
  if ([(_INPBSearchAlarmIntent *)self hasAlarmSearchType])
  {
    if ([v4 hasAlarmSearchType])
    {
      int alarmSearchType = self->_alarmSearchType;
      if (alarmSearchType != [v4 alarmSearchType]) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchAlarmIntent *)self alarms];
  uint64_t v6 = [v4 alarms];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBSearchAlarmIntent *)self alarms];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSearchAlarmIntent *)self alarms];
    v17 = [v4 alarms];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchAlarmIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBSearchAlarmIntent *)self intentMetadata];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    long long v20 = (void *)v19;
    long long v21 = [(_INPBSearchAlarmIntent *)self intentMetadata];
    v22 = [v4 intentMetadata];
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
  unint64_t v5 = [+[_INPBSearchAlarmIntent allocWithZone:](_INPBSearchAlarmIntent, "allocWithZone:") init];
  id v6 = [(_INPBAlarmSearch *)self->_alarmSearch copyWithZone:a3];
  [(_INPBSearchAlarmIntent *)v5 setAlarmSearch:v6];

  if ([(_INPBSearchAlarmIntent *)self hasAlarmSearchType]) {
    [(_INPBSearchAlarmIntent *)v5 setAlarmSearchType:[(_INPBSearchAlarmIntent *)self alarmSearchType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_alarms copyWithZone:a3];
  [(_INPBSearchAlarmIntent *)v5 setAlarms:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchAlarmIntent *)v5 setIntentMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchAlarmIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchAlarmIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchAlarmIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBSearchAlarmIntent *)self alarmSearch];

  if (v5)
  {
    id v6 = [(_INPBSearchAlarmIntent *)self alarmSearch];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchAlarmIntent *)self hasAlarmSearchType]) {
    PBDataWriterWriteInt32Field();
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

  int v12 = [(_INPBSearchAlarmIntent *)self intentMetadata];

  if (v12)
  {
    v13 = [(_INPBSearchAlarmIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchAlarmIntentReadFrom(self, (uint64_t)a3);
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

- (int)StringAsAlarmSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FIND"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WHEN_IS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HOW_LONG_UNTIL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"READ"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOW_MANY"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)alarmSearchTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520970[a3];
  }

  return v3;
}

- (void)setHasAlarmSearchType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlarmSearchType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAlarmSearchType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int alarmSearchType = a3;
  }
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