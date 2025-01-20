@interface _INPBUpdateEventIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConfirmationReason;
- (BOOL)hasUpdatedEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)conflictingEventIdentifiers;
- (_INPBCalendarEvent)updatedEvent;
- (_INPBUpdateEventIntentResponse)initWithCoder:(id)a3;
- (id)confirmationReasonAsString:(int)a3;
- (id)conflictingEventIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsConfirmationReason:(id)a3;
- (int)confirmationReason;
- (unint64_t)conflictingEventIdentifiersCount;
- (unint64_t)hash;
- (void)addConflictingEventIdentifiers:(id)a3;
- (void)clearConflictingEventIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setConfirmationReason:(int)a3;
- (void)setConflictingEventIdentifiers:(id)a3;
- (void)setHasConfirmationReason:(BOOL)a3;
- (void)setUpdatedEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUpdateEventIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedEvent, 0);

  objc_storeStrong((id *)&self->_conflictingEventIdentifiers, 0);
}

- (_INPBCalendarEvent)updatedEvent
{
  return self->_updatedEvent;
}

- (NSArray)conflictingEventIdentifiers
{
  return self->_conflictingEventIdentifiers;
}

- (int)confirmationReason
{
  return self->_confirmationReason;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBUpdateEventIntentResponse *)self hasConfirmationReason])
  {
    uint64_t v4 = [(_INPBUpdateEventIntentResponse *)self confirmationReason];
    if (v4 == 1)
    {
      v5 = @"SCHEDULE_CONFLICT";
    }
    else if (v4 == 2)
    {
      v5 = @"UPDATE_ALL_RECURRENCES";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"confirmationReason"];
  }
  if (self->_conflictingEventIdentifiers)
  {
    v6 = [(_INPBUpdateEventIntentResponse *)self conflictingEventIdentifiers];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"conflictingEventIdentifiers"];
  }
  v8 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"updatedEvent"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBUpdateEventIntentResponse *)self hasConfirmationReason]) {
    uint64_t v3 = 2654435761 * self->_confirmationReason;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_conflictingEventIdentifiers hash] ^ v3;
  return v4 ^ [(_INPBCalendarEvent *)self->_updatedEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBUpdateEventIntentResponse *)self hasConfirmationReason];
  if (v5 != [v4 hasConfirmationReason]) {
    goto LABEL_16;
  }
  if ([(_INPBUpdateEventIntentResponse *)self hasConfirmationReason])
  {
    if ([v4 hasConfirmationReason])
    {
      int confirmationReason = self->_confirmationReason;
      if (confirmationReason != [v4 confirmationReason]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBUpdateEventIntentResponse *)self conflictingEventIdentifiers];
  v8 = [v4 conflictingEventIdentifiers];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBUpdateEventIntentResponse *)self conflictingEventIdentifiers];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBUpdateEventIntentResponse *)self conflictingEventIdentifiers];
    v12 = [v4 conflictingEventIdentifiers];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];
  v8 = [v4 updatedEvent];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];
    v17 = [v4 updatedEvent];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBUpdateEventIntentResponse allocWithZone:](_INPBUpdateEventIntentResponse, "allocWithZone:") init];
  if ([(_INPBUpdateEventIntentResponse *)self hasConfirmationReason]) {
    [(_INPBUpdateEventIntentResponse *)v5 setConfirmationReason:[(_INPBUpdateEventIntentResponse *)self confirmationReason]];
  }
  v6 = (void *)[(NSArray *)self->_conflictingEventIdentifiers copyWithZone:a3];
  [(_INPBUpdateEventIntentResponse *)v5 setConflictingEventIdentifiers:v6];

  id v7 = [(_INPBCalendarEvent *)self->_updatedEvent copyWithZone:a3];
  [(_INPBUpdateEventIntentResponse *)v5 setUpdatedEvent:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUpdateEventIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUpdateEventIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUpdateEventIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUpdateEventIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUpdateEventIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBUpdateEventIntentResponse *)self hasConfirmationReason]) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = self->_conflictingEventIdentifiers;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];

  if (v10)
  {
    v11 = [(_INPBUpdateEventIntentResponse *)self updatedEvent];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateEventIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUpdatedEvent
{
  return self->_updatedEvent != 0;
}

- (void)setUpdatedEvent:(id)a3
{
}

- (id)conflictingEventIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_conflictingEventIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)conflictingEventIdentifiersCount
{
  return [(NSArray *)self->_conflictingEventIdentifiers count];
}

- (void)addConflictingEventIdentifiers:(id)a3
{
  id v4 = a3;
  conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  id v8 = v4;
  if (!conflictingEventIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_conflictingEventIdentifiers;
    self->_conflictingEventIdentifiers = v6;

    id v4 = v8;
    conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  }
  [(NSArray *)conflictingEventIdentifiers addObject:v4];
}

- (void)clearConflictingEventIdentifiers
{
}

- (void)setConflictingEventIdentifiers:(id)a3
{
  self->_conflictingEventIdentifiers = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsConfirmationReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"SCHEDULE_CONFLICT"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"UPDATE_ALL_RECURRENCES"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)confirmationReasonAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"SCHEDULE_CONFLICT";
  }
  else if (a3 == 2)
  {
    int v4 = @"UPDATE_ALL_RECURRENCES";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfirmationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setConfirmationReason:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int confirmationReason = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end