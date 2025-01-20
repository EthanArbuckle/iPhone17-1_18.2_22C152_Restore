@interface _INPBCreateAlarmIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCreatedAlarm;
- (BOOL)hasSuccessCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBAlarm)createdAlarm;
- (_INPBCreateAlarmIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)successCodeAsString:(int)a3;
- (int)StringAsSuccessCode:(id)a3;
- (int)successCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedAlarm:(id)a3;
- (void)setHasSuccessCode:(BOOL)a3;
- (void)setSuccessCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateAlarmIntentResponse

- (void).cxx_destruct
{
}

- (int)successCode
{
  return self->_successCode;
}

- (_INPBAlarm)createdAlarm
{
  return self->_createdAlarm;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"createdAlarm"];

  if ([(_INPBCreateAlarmIntentResponse *)self hasSuccessCode])
  {
    uint64_t v6 = [(_INPBCreateAlarmIntentResponse *)self successCode];
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55207E0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"successCode"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAlarm *)self->_createdAlarm hash];
  if ([(_INPBCreateAlarmIntentResponse *)self hasSuccessCode]) {
    uint64_t v4 = 2654435761 * self->_successCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];
  uint64_t v6 = [v4 createdAlarm];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];
      v11 = [v4 createdAlarm];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBCreateAlarmIntentResponse *)self hasSuccessCode];
    if (v13 == [v4 hasSuccessCode])
    {
      if (![(_INPBCreateAlarmIntentResponse *)self hasSuccessCode]
        || ![v4 hasSuccessCode]
        || (int successCode = self->_successCode, successCode == [v4 successCode]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCreateAlarmIntentResponse allocWithZone:](_INPBCreateAlarmIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBAlarm *)self->_createdAlarm copyWithZone:a3];
  [(_INPBCreateAlarmIntentResponse *)v5 setCreatedAlarm:v6];

  if ([(_INPBCreateAlarmIntentResponse *)self hasSuccessCode]) {
    [(_INPBCreateAlarmIntentResponse *)v5 setSuccessCode:[(_INPBCreateAlarmIntentResponse *)self successCode]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateAlarmIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateAlarmIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateAlarmIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];

  if (v4)
  {
    v5 = [(_INPBCreateAlarmIntentResponse *)self createdAlarm];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCreateAlarmIntentResponse *)self hasSuccessCode]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateAlarmIntentResponseReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSuccessCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALARM_CREATED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DUPLICATE_ALARM_EXISTS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DUPLICATE_ALARM_ENABLED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)successCodeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55207E0[a3];
  }

  return v3;
}

- (void)setHasSuccessCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSuccessCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccessCode:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int successCode = a3;
  }
}

- (BOOL)hasCreatedAlarm
{
  return self->_createdAlarm != 0;
}

- (void)setCreatedAlarm:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end