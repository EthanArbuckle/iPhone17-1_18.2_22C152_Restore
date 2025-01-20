@interface _INPBCreateEventIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasConfirmationReason;
- (BOOL)hasCreatedEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)conflictingEventIdentifiers;
- (_INPBCalendarEvent)createdEvent;
- (_INPBCreateEventIntentResponse)initWithCoder:(id)a3;
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
- (void)setCreatedEvent:(id)a3;
- (void)setHasConfirmationReason:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateEventIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdEvent, 0);

  objc_storeStrong((id *)&self->_conflictingEventIdentifiers, 0);
}

- (_INPBCalendarEvent)createdEvent
{
  return self->_createdEvent;
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
  if ([(_INPBCreateEventIntentResponse *)self hasConfirmationReason])
  {
    uint64_t v4 = [(_INPBCreateEventIntentResponse *)self confirmationReason];
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551F4A8[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"confirmationReason"];
  }
  if (self->_conflictingEventIdentifiers)
  {
    v6 = [(_INPBCreateEventIntentResponse *)self conflictingEventIdentifiers];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"conflictingEventIdentifiers"];
  }
  v8 = [(_INPBCreateEventIntentResponse *)self createdEvent];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"createdEvent"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCreateEventIntentResponse *)self hasConfirmationReason]) {
    uint64_t v3 = 2654435761 * self->_confirmationReason;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSArray *)self->_conflictingEventIdentifiers hash] ^ v3;
  return v4 ^ [(_INPBCalendarEvent *)self->_createdEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBCreateEventIntentResponse *)self hasConfirmationReason];
  if (v5 != [v4 hasConfirmationReason]) {
    goto LABEL_16;
  }
  if ([(_INPBCreateEventIntentResponse *)self hasConfirmationReason])
  {
    if ([v4 hasConfirmationReason])
    {
      int confirmationReason = self->_confirmationReason;
      if (confirmationReason != [v4 confirmationReason]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBCreateEventIntentResponse *)self conflictingEventIdentifiers];
  v8 = [v4 conflictingEventIdentifiers];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBCreateEventIntentResponse *)self conflictingEventIdentifiers];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBCreateEventIntentResponse *)self conflictingEventIdentifiers];
    v12 = [v4 conflictingEventIdentifiers];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBCreateEventIntentResponse *)self createdEvent];
  v8 = [v4 createdEvent];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBCreateEventIntentResponse *)self createdEvent];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBCreateEventIntentResponse *)self createdEvent];
    v17 = [v4 createdEvent];
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
  int v5 = [+[_INPBCreateEventIntentResponse allocWithZone:](_INPBCreateEventIntentResponse, "allocWithZone:") init];
  if ([(_INPBCreateEventIntentResponse *)self hasConfirmationReason]) {
    [(_INPBCreateEventIntentResponse *)v5 setConfirmationReason:[(_INPBCreateEventIntentResponse *)self confirmationReason]];
  }
  v6 = (void *)[(NSArray *)self->_conflictingEventIdentifiers copyWithZone:a3];
  [(_INPBCreateEventIntentResponse *)v5 setConflictingEventIdentifiers:v6];

  id v7 = [(_INPBCalendarEvent *)self->_createdEvent copyWithZone:a3];
  [(_INPBCreateEventIntentResponse *)v5 setCreatedEvent:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateEventIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateEventIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateEventIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateEventIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateEventIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBCreateEventIntentResponse *)self hasConfirmationReason]) {
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

  v10 = [(_INPBCreateEventIntentResponse *)self createdEvent];

  if (v10)
  {
    v11 = [(_INPBCreateEventIntentResponse *)self createdEvent];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateEventIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasCreatedEvent
{
  return self->_createdEvent != 0;
}

- (void)setCreatedEvent:(id)a3
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
  id v4 = (NSArray *)[a3 mutableCopy];
  conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  self->_conflictingEventIdentifiers = v4;

  MEMORY[0x1F41817F8](v4, conflictingEventIdentifiers);
}

- (int)StringAsConfirmationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SCHEDULE_CONFLICT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SEND_INVITATION_TO_PARTICIPANTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DATE_TIME_CLARIFICATION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)confirmationReasonAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551F4A8[a3 - 1];
  }

  return v3;
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