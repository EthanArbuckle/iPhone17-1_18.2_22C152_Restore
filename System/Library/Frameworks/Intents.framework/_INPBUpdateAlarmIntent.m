@interface _INPBUpdateAlarmIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAlarm;
- (BOOL)hasAlarmSearch;
- (BOOL)hasIntentMetadata;
- (BOOL)hasOperation;
- (BOOL)hasProposedLabel;
- (BOOL)hasProposedTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBAlarm)alarm;
- (_INPBAlarmSearch)alarmSearch;
- (_INPBDataString)proposedLabel;
- (_INPBDateTimeRange)proposedTime;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBUpdateAlarmIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)operationAsString:(int)a3;
- (int)StringAsOperation:(id)a3;
- (int)operation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarm:(id)a3;
- (void)setAlarmSearch:(id)a3;
- (void)setHasOperation:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setOperation:(int)a3;
- (void)setProposedLabel:(id)a3;
- (void)setProposedTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUpdateAlarmIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_proposedLabel, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_alarmSearch, 0);

  objc_storeStrong((id *)&self->_alarm, 0);
}

- (_INPBDateTimeRange)proposedTime
{
  return self->_proposedTime;
}

- (_INPBDataString)proposedLabel
{
  return self->_proposedLabel;
}

- (int)operation
{
  return self->_operation;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (_INPBAlarm)alarm
{
  return self->_alarm;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBUpdateAlarmIntent *)self alarm];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"alarm"];

  v6 = [(_INPBUpdateAlarmIntent *)self alarmSearch];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"alarmSearch"];

  v8 = [(_INPBUpdateAlarmIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBUpdateAlarmIntent *)self hasOperation])
  {
    uint64_t v10 = [(_INPBUpdateAlarmIntent *)self operation];
    if (v10 == 1)
    {
      v11 = @"UPDATE_LABEL";
    }
    else if (v10 == 2)
    {
      v11 = @"UPDATE_TIME";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v11 forKeyedSubscript:@"operation"];
  }
  v12 = [(_INPBUpdateAlarmIntent *)self proposedLabel];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"proposedLabel"];

  v14 = [(_INPBUpdateAlarmIntent *)self proposedTime];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"proposedTime"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAlarm *)self->_alarm hash];
  unint64_t v4 = [(_INPBAlarmSearch *)self->_alarmSearch hash];
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBUpdateAlarmIntent *)self hasOperation]) {
    uint64_t v6 = 2654435761 * self->_operation;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v8 = [(_INPBDataString *)self->_proposedLabel hash];
  return v7 ^ v8 ^ [(_INPBDateTimeRange *)self->_proposedTime hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBUpdateAlarmIntent *)self alarm];
  uint64_t v6 = [v4 alarm];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBUpdateAlarmIntent *)self alarm];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_INPBUpdateAlarmIntent *)self alarm];
    uint64_t v10 = [v4 alarm];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBUpdateAlarmIntent *)self alarmSearch];
  uint64_t v6 = [v4 alarmSearch];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v12 = [(_INPBUpdateAlarmIntent *)self alarmSearch];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBUpdateAlarmIntent *)self alarmSearch];
    v15 = [v4 alarmSearch];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBUpdateAlarmIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v17 = [(_INPBUpdateAlarmIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBUpdateAlarmIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v22 = [(_INPBUpdateAlarmIntent *)self hasOperation];
  if (v22 != [v4 hasOperation]) {
    goto LABEL_31;
  }
  if ([(_INPBUpdateAlarmIntent *)self hasOperation])
  {
    if ([v4 hasOperation])
    {
      int operation = self->_operation;
      if (operation != [v4 operation]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBUpdateAlarmIntent *)self proposedLabel];
  uint64_t v6 = [v4 proposedLabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v24 = [(_INPBUpdateAlarmIntent *)self proposedLabel];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBUpdateAlarmIntent *)self proposedLabel];
    v27 = [v4 proposedLabel];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBUpdateAlarmIntent *)self proposedTime];
  uint64_t v6 = [v4 proposedTime];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBUpdateAlarmIntent *)self proposedTime];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(_INPBUpdateAlarmIntent *)self proposedTime];
    v32 = [v4 proposedTime];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBUpdateAlarmIntent allocWithZone:](_INPBUpdateAlarmIntent, "allocWithZone:") init];
  id v6 = [(_INPBAlarm *)self->_alarm copyWithZone:a3];
  [(_INPBUpdateAlarmIntent *)v5 setAlarm:v6];

  id v7 = [(_INPBAlarmSearch *)self->_alarmSearch copyWithZone:a3];
  [(_INPBUpdateAlarmIntent *)v5 setAlarmSearch:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBUpdateAlarmIntent *)v5 setIntentMetadata:v8];

  if ([(_INPBUpdateAlarmIntent *)self hasOperation]) {
    [(_INPBUpdateAlarmIntent *)v5 setOperation:[(_INPBUpdateAlarmIntent *)self operation]];
  }
  id v9 = [(_INPBDataString *)self->_proposedLabel copyWithZone:a3];
  [(_INPBUpdateAlarmIntent *)v5 setProposedLabel:v9];

  id v10 = [(_INPBDateTimeRange *)self->_proposedTime copyWithZone:a3];
  [(_INPBUpdateAlarmIntent *)v5 setProposedTime:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUpdateAlarmIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUpdateAlarmIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUpdateAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUpdateAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUpdateAlarmIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_INPBUpdateAlarmIntent *)self alarm];

  if (v4)
  {
    unint64_t v5 = [(_INPBUpdateAlarmIntent *)self alarm];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBUpdateAlarmIntent *)self alarmSearch];

  if (v6)
  {
    uint64_t v7 = [(_INPBUpdateAlarmIntent *)self alarmSearch];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBUpdateAlarmIntent *)self intentMetadata];

  if (v8)
  {
    id v9 = [(_INPBUpdateAlarmIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBUpdateAlarmIntent *)self hasOperation]) {
    PBDataWriterWriteInt32Field();
  }
  id v10 = [(_INPBUpdateAlarmIntent *)self proposedLabel];

  if (v10)
  {
    int v11 = [(_INPBUpdateAlarmIntent *)self proposedLabel];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBUpdateAlarmIntent *)self proposedTime];

  v13 = v15;
  if (v12)
  {
    v14 = [(_INPBUpdateAlarmIntent *)self proposedTime];
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateAlarmIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasProposedTime
{
  return self->_proposedTime != 0;
}

- (void)setProposedTime:(id)a3
{
}

- (BOOL)hasProposedLabel
{
  return self->_proposedLabel != 0;
}

- (void)setProposedLabel:(id)a3
{
}

- (int)StringAsOperation:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"UPDATE_LABEL"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"UPDATE_TIME"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)operationAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"UPDATE_LABEL";
  }
  else if (a3 == 2)
  {
    int v4 = @"UPDATE_TIME";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasOperation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOperation:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int operation = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasAlarmSearch
{
  return self->_alarmSearch != 0;
}

- (void)setAlarmSearch:(id)a3
{
}

- (BOOL)hasAlarm
{
  return self->_alarm != 0;
}

- (void)setAlarm:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end