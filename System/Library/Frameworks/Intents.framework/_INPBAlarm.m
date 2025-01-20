@interface _INPBAlarm
+ (BOOL)supportsSecureCoding;
- (BOOL)enabled;
- (BOOL)firing;
- (BOOL)hasDateTime;
- (BOOL)hasEnabled;
- (BOOL)hasFiring;
- (BOOL)hasIdentifier;
- (BOOL)hasLabel;
- (BOOL)hasSleepAlarmAttribute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_INPBAlarm)initWithCoder:(id)a3;
- (_INPBDataString)label;
- (_INPBDateTime)dateTime;
- (_INPBSleepAlarmAttribute)sleepAlarmAttribute;
- (id)alarmRepeatScheduleOptionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAlarmRepeatScheduleOptions:(id)a3;
- (int)alarmRepeatScheduleOptions;
- (int)alarmRepeatScheduleOptionsAtIndex:(unint64_t)a3;
- (unint64_t)alarmRepeatScheduleOptionsCount;
- (unint64_t)hash;
- (void)addAlarmRepeatScheduleOptions:(int)a3;
- (void)clearAlarmRepeatScheduleOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmRepeatScheduleOptions:(int *)a3 count:(unint64_t)a4;
- (void)setDateTime:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFiring:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasFiring:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSleepAlarmAttribute:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAlarm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarmAttribute, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_dateTime, 0);
}

- (_INPBSleepAlarmAttribute)sleepAlarmAttribute
{
  return self->_sleepAlarmAttribute;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)firing
{
  return self->_firing;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_INPBDateTime)dateTime
{
  return self->_dateTime;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_alarmRepeatScheduleOptions.count)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBAlarm alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    if ([(_INPBAlarm *)self alarmRepeatScheduleOptionsCount])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = self->_alarmRepeatScheduleOptions.list[v5];
        if (v6 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_alarmRepeatScheduleOptions.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v7 = off_1E55207F8[v6];
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBAlarm *)self alarmRepeatScheduleOptionsCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"alarmRepeatScheduleOptions"];
  }
  v8 = [(_INPBAlarm *)self dateTime];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dateTime"];

  if ([(_INPBAlarm *)self hasEnabled])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBAlarm enabled](self, "enabled"));
    [v3 setObject:v10 forKeyedSubscript:@"enabled"];
  }
  if ([(_INPBAlarm *)self hasFiring])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBAlarm firing](self, "firing"));
    [v3 setObject:v11 forKeyedSubscript:@"firing"];
  }
  if (self->_identifier)
  {
    v12 = [(_INPBAlarm *)self identifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"identifier"];
  }
  v14 = [(_INPBAlarm *)self label];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"label"];

  v16 = [(_INPBAlarm *)self sleepAlarmAttribute];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"sleepAlarmAttribute"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(_INPBDateTime *)self->_dateTime hash];
  if ([(_INPBAlarm *)self hasEnabled]) {
    uint64_t v5 = 2654435761 * self->_enabled;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBAlarm *)self hasFiring]) {
    uint64_t v6 = 2654435761 * self->_firing;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_identifier hash];
  unint64_t v8 = [(_INPBDataString *)self->_label hash];
  return v7 ^ v8 ^ [(_INPBSleepAlarmAttribute *)self->_sleepAlarmAttribute hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt32IsEqual()) {
    goto LABEL_31;
  }
  uint64_t v5 = [(_INPBAlarm *)self dateTime];
  uint64_t v6 = [v4 dateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBAlarm *)self dateTime];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_INPBAlarm *)self dateTime];
    v10 = [v4 dateTime];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v12 = [(_INPBAlarm *)self hasEnabled];
  if (v12 != [v4 hasEnabled]) {
    goto LABEL_31;
  }
  if ([(_INPBAlarm *)self hasEnabled])
  {
    if ([v4 hasEnabled])
    {
      int enabled = self->_enabled;
      if (enabled != [v4 enabled]) {
        goto LABEL_31;
      }
    }
  }
  int v14 = [(_INPBAlarm *)self hasFiring];
  if (v14 != [v4 hasFiring]) {
    goto LABEL_31;
  }
  if ([(_INPBAlarm *)self hasFiring])
  {
    if ([v4 hasFiring])
    {
      int firing = self->_firing;
      if (firing != [v4 firing]) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v5 = [(_INPBAlarm *)self identifier];
  uint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v16 = [(_INPBAlarm *)self identifier];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(_INPBAlarm *)self identifier];
    v19 = [v4 identifier];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAlarm *)self label];
  uint64_t v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v21 = [(_INPBAlarm *)self label];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(_INPBAlarm *)self label];
    v24 = [v4 label];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAlarm *)self sleepAlarmAttribute];
  uint64_t v6 = [v4 sleepAlarmAttribute];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v26 = [(_INPBAlarm *)self sleepAlarmAttribute];
    if (!v26)
    {

LABEL_34:
      BOOL v31 = 1;
      goto LABEL_32;
    }
    v27 = (void *)v26;
    v28 = [(_INPBAlarm *)self sleepAlarmAttribute];
    v29 = [v4 sleepAlarmAttribute];
    char v30 = [v28 isEqual:v29];

    if (v30) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v31 = 0;
LABEL_32:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBAlarm allocWithZone:](_INPBAlarm, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  id v6 = [(_INPBDateTime *)self->_dateTime copyWithZone:a3];
  [(_INPBAlarm *)v5 setDateTime:v6];

  if ([(_INPBAlarm *)self hasEnabled]) {
    [(_INPBAlarm *)v5 setEnabled:[(_INPBAlarm *)self enabled]];
  }
  if ([(_INPBAlarm *)self hasFiring]) {
    [(_INPBAlarm *)v5 setFiring:[(_INPBAlarm *)self firing]];
  }
  uint64_t v7 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBAlarm *)v5 setIdentifier:v7];

  id v8 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBAlarm *)v5 setLabel:v8];

  id v9 = [(_INPBSleepAlarmAttribute *)self->_sleepAlarmAttribute copyWithZone:a3];
  [(_INPBAlarm *)v5 setSleepAlarmAttribute:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAlarm *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAlarm)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAlarm *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAlarm *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAlarm *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBAlarm *)self clearAlarmRepeatScheduleOptions];
  v3.receiver = self;
  v3.super_class = (Class)_INPBAlarm;
  [(_INPBAlarm *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  if (self->_alarmRepeatScheduleOptions.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_alarmRepeatScheduleOptions.count);
  }
  uint64_t v5 = [(_INPBAlarm *)self dateTime];

  if (v5)
  {
    id v6 = [(_INPBAlarm *)self dateTime];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBAlarm *)self hasEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBAlarm *)self hasFiring]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(_INPBAlarm *)self identifier];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  id v8 = [(_INPBAlarm *)self label];

  if (v8)
  {
    id v9 = [(_INPBAlarm *)self label];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBAlarm *)self sleepAlarmAttribute];

  int v11 = v13;
  if (v10)
  {
    int v12 = [(_INPBAlarm *)self sleepAlarmAttribute];
    PBDataWriterWriteSubmessage();

    int v11 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAlarmReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasSleepAlarmAttribute
{
  return self->_sleepAlarmAttribute != 0;
}

- (void)setSleepAlarmAttribute:(id)a3
{
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  unint64_t v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (void)setHasFiring:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFiring
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFiring:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int firing = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int enabled = a3;
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setDateTime:(id)a3
{
}

- (int)StringAsAlarmRepeatScheduleOptions:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)alarmRepeatScheduleOptionsAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55207F8[a3];
  }

  return v3;
}

- (int)alarmRepeatScheduleOptionsAtIndex:(unint64_t)a3
{
  return self->_alarmRepeatScheduleOptions.list[a3];
}

- (unint64_t)alarmRepeatScheduleOptionsCount
{
  return self->_alarmRepeatScheduleOptions.count;
}

- (void)addAlarmRepeatScheduleOptions:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearAlarmRepeatScheduleOptions
{
}

- (int)alarmRepeatScheduleOptions
{
  return self->_alarmRepeatScheduleOptions.list;
}

- (void)setAlarmRepeatScheduleOptions:(int *)a3 count:(unint64_t)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end