@interface _INPBPayloadConfirmation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAddTasksIntentTargetTaskListConfirmationReason;
- (BOOL)hasConfirmationItem;
- (BOOL)hasReason;
- (BOOL)hasSendAnnouncementIntentAnnouncementConfirmationReason;
- (BOOL)hasStartCallIntentContactsConfirmationReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBPayloadConfirmation)initWithCoder:(id)a3;
- (_INPBSelectionItem)confirmationItem;
- (id)addTasksIntentTargetTaskListConfirmationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (id)sendAnnouncementIntentAnnouncementConfirmationReasonAsString:(int)a3;
- (id)startCallIntentContactsConfirmationReasonAsString:(int)a3;
- (int)StringAsAddTasksIntentTargetTaskListConfirmationReason:(id)a3;
- (int)StringAsReason:(id)a3;
- (int)StringAsSendAnnouncementIntentAnnouncementConfirmationReason:(id)a3;
- (int)StringAsStartCallIntentContactsConfirmationReason:(id)a3;
- (int)addTasksIntentTargetTaskListConfirmationReason;
- (int)reason;
- (int)sendAnnouncementIntentAnnouncementConfirmationReason;
- (int)startCallIntentContactsConfirmationReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAddTasksIntentTargetTaskListConfirmationReason:(int)a3;
- (void)setConfirmationItem:(id)a3;
- (void)setHasAddTasksIntentTargetTaskListConfirmationReason:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasSendAnnouncementIntentAnnouncementConfirmationReason:(BOOL)a3;
- (void)setHasStartCallIntentContactsConfirmationReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)setSendAnnouncementIntentAnnouncementConfirmationReason:(int)a3;
- (void)setStartCallIntentContactsConfirmationReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPayloadConfirmation

- (void).cxx_destruct
{
}

- (int)addTasksIntentTargetTaskListConfirmationReason
{
  return self->_addTasksIntentTargetTaskListConfirmationReason;
}

- (int)reason
{
  return self->_reason;
}

- (int)startCallIntentContactsConfirmationReason
{
  return self->_startCallIntentContactsConfirmationReason;
}

- (_INPBSelectionItem)confirmationItem
{
  return self->_confirmationItem;
}

- (int)sendAnnouncementIntentAnnouncementConfirmationReason
{
  return self->_sendAnnouncementIntentAnnouncementConfirmationReason;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason])
  {
    uint64_t v4 = [(_INPBPayloadConfirmation *)self sendAnnouncementIntentAnnouncementConfirmationReason];
    if (v4 == 1)
    {
      v5 = @"DURATION_ABOVE_MAX_THRESHOLD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"announcementConfirmationReason"];
  }
  v6 = [(_INPBPayloadConfirmation *)self confirmationItem];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"confirmationItem"];

  if ([(_INPBPayloadConfirmation *)self hasStartCallIntentContactsConfirmationReason])
  {
    uint64_t v8 = [(_INPBPayloadConfirmation *)self startCallIntentContactsConfirmationReason];
    if ((v8 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5519668[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"contactsConfirmationReason"];
  }
  if ([(_INPBPayloadConfirmation *)self hasReason])
  {
    uint64_t v10 = [(_INPBPayloadConfirmation *)self reason];
    if (v10 == 1)
    {
      v11 = @"ConfirmationReasonNone";
    }
    else if (v10 == 1000)
    {
      v11 = @"ConfirmationReasonExtension";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v11 forKeyedSubscript:@"reason"];
  }
  if ([(_INPBPayloadConfirmation *)self hasAddTasksIntentTargetTaskListConfirmationReason])
  {
    uint64_t v12 = [(_INPBPayloadConfirmation *)self addTasksIntentTargetTaskListConfirmationReason];
    if (v12 == 1)
    {
      v13 = @"LIST_SHOULD_BE_CREATED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v13 forKeyedSubscript:@"targetTaskListConfirmationReason"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason])
  {
    uint64_t v3 = 2654435761 * self->_sendAnnouncementIntentAnnouncementConfirmationReason;
  }
  else
  {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBSelectionItem *)self->_confirmationItem hash];
  if ([(_INPBPayloadConfirmation *)self hasStartCallIntentContactsConfirmationReason])
  {
    uint64_t v5 = 2654435761 * self->_startCallIntentContactsConfirmationReason;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(_INPBPayloadConfirmation *)self hasReason]) {
    uint64_t v6 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([(_INPBPayloadConfirmation *)self hasAddTasksIntentTargetTaskListConfirmationReason])
  {
    uint64_t v7 = 2654435761 * self->_addTasksIntentTargetTaskListConfirmationReason;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason];
  if (v5 != [v4 hasSendAnnouncementIntentAnnouncementConfirmationReason]) {
    goto LABEL_21;
  }
  if ([(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason])
  {
    if ([v4 hasSendAnnouncementIntentAnnouncementConfirmationReason])
    {
      int sendAnnouncementIntentAnnouncementConfirmationReason = self->_sendAnnouncementIntentAnnouncementConfirmationReason;
      if (sendAnnouncementIntentAnnouncementConfirmationReason != [v4 sendAnnouncementIntentAnnouncementConfirmationReason])goto LABEL_21; {
    }
      }
  }
  uint64_t v7 = [(_INPBPayloadConfirmation *)self confirmationItem];
  uint64_t v8 = [v4 confirmationItem];
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v10 = [(_INPBPayloadConfirmation *)self confirmationItem];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(_INPBPayloadConfirmation *)self confirmationItem];
      v13 = [v4 confirmationItem];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    int v15 = [(_INPBPayloadConfirmation *)self hasStartCallIntentContactsConfirmationReason];
    if (v15 == [v4 hasStartCallIntentContactsConfirmationReason])
    {
      if (!-[_INPBPayloadConfirmation hasStartCallIntentContactsConfirmationReason](self, "hasStartCallIntentContactsConfirmationReason")|| ![v4 hasStartCallIntentContactsConfirmationReason]|| (int startCallIntentContactsConfirmationReason = self->_startCallIntentContactsConfirmationReason, startCallIntentContactsConfirmationReason == objc_msgSend(v4, "startCallIntentContactsConfirmationReason")))
      {
        int v17 = [(_INPBPayloadConfirmation *)self hasReason];
        if (v17 == [v4 hasReason])
        {
          if (![(_INPBPayloadConfirmation *)self hasReason]
            || ![v4 hasReason]
            || (int reason = self->_reason, reason == [v4 reason]))
          {
            int v19 = [(_INPBPayloadConfirmation *)self hasAddTasksIntentTargetTaskListConfirmationReason];
            if (v19 == [v4 hasAddTasksIntentTargetTaskListConfirmationReason])
            {
              if (!-[_INPBPayloadConfirmation hasAddTasksIntentTargetTaskListConfirmationReason](self, "hasAddTasksIntentTargetTaskListConfirmationReason")|| ![v4 hasAddTasksIntentTargetTaskListConfirmationReason]|| (int addTasksIntentTargetTaskListConfirmationReason = self->_addTasksIntentTargetTaskListConfirmationReason, addTasksIntentTargetTaskListConfirmationReason == objc_msgSend(v4, "addTasksIntentTargetTaskListConfirmationReason")))
              {
                BOOL v20 = 1;
                goto LABEL_22;
              }
            }
          }
        }
      }
    }
  }
  else
  {
  }
LABEL_21:
  BOOL v20 = 0;
LABEL_22:

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPayloadConfirmation allocWithZone:](_INPBPayloadConfirmation, "allocWithZone:") init];
  if ([(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason])
  {
    [(_INPBPayloadConfirmation *)v5 setSendAnnouncementIntentAnnouncementConfirmationReason:[(_INPBPayloadConfirmation *)self sendAnnouncementIntentAnnouncementConfirmationReason]];
  }
  id v6 = [(_INPBSelectionItem *)self->_confirmationItem copyWithZone:a3];
  [(_INPBPayloadConfirmation *)v5 setConfirmationItem:v6];

  if ([(_INPBPayloadConfirmation *)self hasStartCallIntentContactsConfirmationReason])
  {
    [(_INPBPayloadConfirmation *)v5 setStartCallIntentContactsConfirmationReason:[(_INPBPayloadConfirmation *)self startCallIntentContactsConfirmationReason]];
  }
  if ([(_INPBPayloadConfirmation *)self hasReason]) {
    [(_INPBPayloadConfirmation *)v5 setReason:[(_INPBPayloadConfirmation *)self reason]];
  }
  if ([(_INPBPayloadConfirmation *)self hasAddTasksIntentTargetTaskListConfirmationReason])
  {
    [(_INPBPayloadConfirmation *)v5 setAddTasksIntentTargetTaskListConfirmationReason:[(_INPBPayloadConfirmation *)self addTasksIntentTargetTaskListConfirmationReason]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPayloadConfirmation *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPayloadConfirmation)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPayloadConfirmation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPayloadConfirmation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPayloadConfirmation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_INPBPayloadConfirmation *)self hasSendAnnouncementIntentAnnouncementConfirmationReason])
  {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBPayloadConfirmation *)self confirmationItem];

  if (v4)
  {
    int v5 = [(_INPBPayloadConfirmation *)self confirmationItem];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPayloadConfirmation *)self hasStartCallIntentContactsConfirmationReason])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadConfirmation *)self hasReason]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPayloadConfirmation *)self hasAddTasksIntentTargetTaskListConfirmationReason])
  {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayloadConfirmationReadFrom(self, (uint64_t)a3);
}

- (int)StringAsAddTasksIntentTargetTaskListConfirmationReason:(id)a3
{
  return 1;
}

- (id)addTasksIntentTargetTaskListConfirmationReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"LIST_SHOULD_BE_CREATED";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasAddTasksIntentTargetTaskListConfirmationReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAddTasksIntentTargetTaskListConfirmationReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAddTasksIntentTargetTaskListConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int addTasksIntentTargetTaskListConfirmationReason = a3;
  }
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConfirmationReasonNone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConfirmationReasonExtension"])
  {
    int v4 = 1000;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)reasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ConfirmationReasonNone";
  }
  else if (a3 == 1000)
  {
    int v4 = @"ConfirmationReasonExtension";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int reason = a3;
  }
}

- (int)StringAsStartCallIntentContactsConfirmationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INVALID_NUMBER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TOP_MATCH_HANDLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TOP_MATCH_NAME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_CONTACTS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOUND_IN_APPS_TOP_MATCH_NAME"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)startCallIntentContactsConfirmationReasonAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5519668[a3 - 1];
  }

  return v3;
}

- (void)setHasStartCallIntentContactsConfirmationReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartCallIntentContactsConfirmationReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStartCallIntentContactsConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int startCallIntentContactsConfirmationReason = a3;
  }
}

- (BOOL)hasConfirmationItem
{
  return self->_confirmationItem != 0;
}

- (void)setConfirmationItem:(id)a3
{
}

- (int)StringAsSendAnnouncementIntentAnnouncementConfirmationReason:(id)a3
{
  return 1;
}

- (id)sendAnnouncementIntentAnnouncementConfirmationReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"DURATION_ABOVE_MAX_THRESHOLD";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSendAnnouncementIntentAnnouncementConfirmationReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendAnnouncementIntentAnnouncementConfirmationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSendAnnouncementIntentAnnouncementConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int sendAnnouncementIntentAnnouncementConfirmationReason = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end