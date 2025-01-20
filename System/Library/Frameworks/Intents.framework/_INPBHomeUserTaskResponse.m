@interface _INPBHomeUserTaskResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTaskOutcome;
- (BOOL)hasUserTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBHomeUserTask)userTask;
- (_INPBHomeUserTaskResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)taskOutcomeAsString:(int)a3;
- (int)StringAsTaskOutcome:(id)a3;
- (int)taskOutcome;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasTaskOutcome:(BOOL)a3;
- (void)setTaskOutcome:(int)a3;
- (void)setUserTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeUserTaskResponse

- (void).cxx_destruct
{
}

- (_INPBHomeUserTask)userTask
{
  return self->_userTask;
}

- (int)taskOutcome
{
  return self->_taskOutcome;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeUserTaskResponse *)self hasTaskOutcome])
  {
    uint64_t v4 = [(_INPBHomeUserTaskResponse *)self taskOutcome];
    if ((v4 - 1) >= 0x17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551EFF0[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"taskOutcome"];
  }
  v6 = [(_INPBHomeUserTaskResponse *)self userTask];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"userTask"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeUserTaskResponse *)self hasTaskOutcome]) {
    uint64_t v3 = 2654435761 * self->_taskOutcome;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBHomeUserTask *)self->_userTask hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBHomeUserTaskResponse *)self hasTaskOutcome];
    if (v5 == [v4 hasTaskOutcome])
    {
      if (![(_INPBHomeUserTaskResponse *)self hasTaskOutcome]
        || ![v4 hasTaskOutcome]
        || (int taskOutcome = self->_taskOutcome, taskOutcome == [v4 taskOutcome]))
      {
        v7 = [(_INPBHomeUserTaskResponse *)self userTask];
        v8 = [v4 userTask];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBHomeUserTaskResponse *)self userTask];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBHomeUserTaskResponse *)self userTask];
          v13 = [v4 userTask];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBHomeUserTaskResponse allocWithZone:](_INPBHomeUserTaskResponse, "allocWithZone:") init];
  if ([(_INPBHomeUserTaskResponse *)self hasTaskOutcome]) {
    [(_INPBHomeUserTaskResponse *)v5 setTaskOutcome:[(_INPBHomeUserTaskResponse *)self taskOutcome]];
  }
  id v6 = [(_INPBHomeUserTask *)self->_userTask copyWithZone:a3];
  [(_INPBHomeUserTaskResponse *)v5 setUserTask:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeUserTaskResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeUserTaskResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeUserTaskResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeUserTaskResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeUserTaskResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBHomeUserTaskResponse *)self hasTaskOutcome]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBHomeUserTaskResponse *)self userTask];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBHomeUserTaskResponse *)self userTask];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeUserTaskResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUserTask
{
  return self->_userTask != 0;
}

- (void)setUserTask:(id)a3
{
}

- (int)StringAsTaskOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUCCESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UNSUPPORTED_ATTRIBUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"READ_ONLY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ALREADY_AT_MAX_VALUE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ALREADY_AT_MIN_VALUE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UNREACHABLE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FAILURE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SET_TO_MAX_VALUE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SET_TO_MIN_VALUE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LARGER_THAN_MAX_VALUE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SMALLER_THAN_MIN_VALUE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NO_REMOTE_ACCESS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NO_MATCHING_ATTRIBUTE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH_IS_OFF"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"WIFI_IS_OFF"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"BRIDGED_ACCESSORY_UNREACHABLE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"IN_PROGRESS"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SCENE_NOT_SET_UP"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SECURING_FAILURE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH_WAKEUP"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"UNLOCK_REQUIRED"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SECURED_ACCESS_DENIED"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"CALIBRATION_IN_PROGRESS"])
  {
    int v4 = 23;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)taskOutcomeAsString:(int)a3
{
  if ((a3 - 1) >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551EFF0[a3 - 1];
  }

  return v3;
}

- (void)setHasTaskOutcome:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskOutcome
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskOutcome:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int taskOutcome = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end