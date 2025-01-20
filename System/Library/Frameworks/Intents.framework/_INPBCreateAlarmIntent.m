@interface _INPBCreateAlarmIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasLabel;
- (BOOL)hasRelativeOffsetInMinutes;
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateAlarmIntent)initWithCoder:(id)a3;
- (_INPBDataString)label;
- (_INPBDateTimeRange)time;
- (_INPBIntentMetadata)intentMetadata;
- (id)alarmRepeatScheduleOptionsAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAlarmRepeatScheduleOptions:(id)a3;
- (int)alarmRepeatScheduleOptions;
- (int)alarmRepeatScheduleOptionsAtIndex:(unint64_t)a3;
- (int)relativeOffsetInMinutes;
- (unint64_t)alarmRepeatScheduleOptionsCount;
- (unint64_t)hash;
- (void)addAlarmRepeatScheduleOptions:(int)a3;
- (void)clearAlarmRepeatScheduleOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmRepeatScheduleOptions:(int *)a3 count:(unint64_t)a4;
- (void)setHasRelativeOffsetInMinutes:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRelativeOffsetInMinutes:(int)a3;
- (void)setTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateAlarmIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBDateTimeRange)time
{
  return self->_time;
}

- (int)relativeOffsetInMinutes
{
  return self->_relativeOffsetInMinutes;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_alarmRepeatScheduleOptions.count)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBCreateAlarmIntent alarmRepeatScheduleOptionsCount](self, "alarmRepeatScheduleOptionsCount"));
    if ([(_INPBCreateAlarmIntent *)self alarmRepeatScheduleOptionsCount])
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
          v7 = off_1E55206F0[v6];
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBCreateAlarmIntent *)self alarmRepeatScheduleOptionsCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"alarmRepeatScheduleOptions"];
  }
  v8 = [(_INPBCreateAlarmIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  v10 = [(_INPBCreateAlarmIntent *)self label];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"label"];

  if ([(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes])
  {
    v12 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBCreateAlarmIntent relativeOffsetInMinutes](self, "relativeOffsetInMinutes"));
    [v3 setObject:v12 forKeyedSubscript:@"relativeOffsetInMinutes"];
  }
  v13 = [(_INPBCreateAlarmIntent *)self time];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"time"];

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v5 = [(_INPBDataString *)self->_label hash];
  if ([(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes]) {
    uint64_t v6 = 2654435761 * self->_relativeOffsetInMinutes;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(_INPBDateTimeRange *)self->_time hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedInt32IsEqual()) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBCreateAlarmIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBCreateAlarmIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCreateAlarmIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateAlarmIntent *)self label];
  uint64_t v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBCreateAlarmIntent *)self label];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCreateAlarmIntent *)self label];
    v15 = [v4 label];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v17 = [(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes];
  if (v17 != [v4 hasRelativeOffsetInMinutes]) {
    goto LABEL_22;
  }
  if ([(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes])
  {
    if ([v4 hasRelativeOffsetInMinutes])
    {
      int relativeOffsetInMinutes = self->_relativeOffsetInMinutes;
      if (relativeOffsetInMinutes != [v4 relativeOffsetInMinutes]) {
        goto LABEL_22;
      }
    }
  }
  unint64_t v5 = [(_INPBCreateAlarmIntent *)self time];
  uint64_t v6 = [v4 time];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBCreateAlarmIntent *)self time];
    if (!v19)
    {

LABEL_25:
      BOOL v24 = 1;
      goto LABEL_23;
    }
    v20 = (void *)v19;
    v21 = [(_INPBCreateAlarmIntent *)self time];
    v22 = [v4 time];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v24 = 0;
LABEL_23:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBCreateAlarmIntent allocWithZone:](_INPBCreateAlarmIntent, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateAlarmIntent *)v5 setIntentMetadata:v6];

  id v7 = [(_INPBDataString *)self->_label copyWithZone:a3];
  [(_INPBCreateAlarmIntent *)v5 setLabel:v7];

  if ([(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes]) {
    [(_INPBCreateAlarmIntent *)v5 setRelativeOffsetInMinutes:[(_INPBCreateAlarmIntent *)self relativeOffsetInMinutes]];
  }
  id v8 = [(_INPBDateTimeRange *)self->_time copyWithZone:a3];
  [(_INPBCreateAlarmIntent *)v5 setTime:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateAlarmIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateAlarmIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateAlarmIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBCreateAlarmIntent *)self clearAlarmRepeatScheduleOptions];
  v3.receiver = self;
  v3.super_class = (Class)_INPBCreateAlarmIntent;
  [(_INPBCreateAlarmIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
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
  unint64_t v5 = [(_INPBCreateAlarmIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBCreateAlarmIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBCreateAlarmIntent *)self label];

  if (v7)
  {
    id v8 = [(_INPBCreateAlarmIntent *)self label];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCreateAlarmIntent *)self hasRelativeOffsetInMinutes]) {
    PBDataWriterWriteInt32Field();
  }
  v9 = [(_INPBCreateAlarmIntent *)self time];

  v10 = v12;
  if (v9)
  {
    int v11 = [(_INPBCreateAlarmIntent *)self time];
    PBDataWriterWriteSubmessage();

    v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateAlarmIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setTime:(id)a3
{
}

- (void)setHasRelativeOffsetInMinutes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelativeOffsetInMinutes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRelativeOffsetInMinutes:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int relativeOffsetInMinutes = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
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
    id v3 = off_1E55206F0[a3];
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