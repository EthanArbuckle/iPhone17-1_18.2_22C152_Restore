@interface _INPBCallGroupConversationFilter
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasCallGroup;
- (BOOL)hasCaller;
- (BOOL)hasMatchCallerAndParticipantsExactly;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchCallerAndParticipantsExactly;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (_INPBCallGroup)callGroup;
- (_INPBCallGroupConversationFilter)initWithCoder:(id)a3;
- (_INPBContact)caller;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setCallGroup:(id)a3;
- (void)setCaller:(id)a3;
- (void)setHasMatchCallerAndParticipantsExactly:(BOOL)a3;
- (void)setMatchCallerAndParticipantsExactly:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallGroupConversationFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_callGroup, 0);
}

- (NSArray)participants
{
  return self->_participants;
}

- (BOOL)matchCallerAndParticipantsExactly
{
  return self->_matchCallerAndParticipantsExactly;
}

- (_INPBContact)caller
{
  return self->_caller;
}

- (_INPBCallGroup)callGroup
{
  return self->_callGroup;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCallGroupConversationFilter *)self callGroup];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"callGroup"];

  v6 = [(_INPBCallGroupConversationFilter *)self caller];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"caller"];

  if ([(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCallGroupConversationFilter matchCallerAndParticipantsExactly](self, "matchCallerAndParticipantsExactly"));
    [v3 setObject:v8 forKeyedSubscript:@"matchCallerAndParticipantsExactly"];
  }
  if ([(NSArray *)self->_participants count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_participants;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"participants"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCallGroup *)self->_callGroup hash];
  unint64_t v4 = [(_INPBContact *)self->_caller hash];
  if ([(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly])
  {
    uint64_t v5 = 2654435761 * self->_matchCallerAndParticipantsExactly;
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_participants hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  uint64_t v5 = [(_INPBCallGroupConversationFilter *)self callGroup];
  v6 = [v4 callGroup];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBCallGroupConversationFilter *)self callGroup];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCallGroupConversationFilter *)self callGroup];
    v10 = [v4 callGroup];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBCallGroupConversationFilter *)self caller];
  v6 = [v4 caller];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v12 = [(_INPBCallGroupConversationFilter *)self caller];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_INPBCallGroupConversationFilter *)self caller];
    v15 = [v4 caller];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v17 = [(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly];
  if (v17 != [v4 hasMatchCallerAndParticipantsExactly]) {
    goto LABEL_21;
  }
  if ([(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly])
  {
    if ([v4 hasMatchCallerAndParticipantsExactly])
    {
      int matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
      if (matchCallerAndParticipantsExactly != [v4 matchCallerAndParticipantsExactly]) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v5 = [(_INPBCallGroupConversationFilter *)self participants];
  v6 = [v4 participants];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBCallGroupConversationFilter *)self participants];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    long long v20 = (void *)v19;
    v21 = [(_INPBCallGroupConversationFilter *)self participants];
    uint64_t v22 = [v4 participants];
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
  uint64_t v5 = [+[_INPBCallGroupConversationFilter allocWithZone:](_INPBCallGroupConversationFilter, "allocWithZone:") init];
  id v6 = [(_INPBCallGroup *)self->_callGroup copyWithZone:a3];
  [(_INPBCallGroupConversationFilter *)v5 setCallGroup:v6];

  id v7 = [(_INPBContact *)self->_caller copyWithZone:a3];
  [(_INPBCallGroupConversationFilter *)v5 setCaller:v7];

  if ([(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly])
  {
    [(_INPBCallGroupConversationFilter *)v5 setMatchCallerAndParticipantsExactly:[(_INPBCallGroupConversationFilter *)self matchCallerAndParticipantsExactly]];
  }
  v8 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCallGroupConversationFilter *)v5 setParticipants:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallGroupConversationFilter *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallGroupConversationFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallGroupConversationFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallGroupConversationFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallGroupConversationFilter *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBCallGroupConversationFilter *)self callGroup];

  if (v5)
  {
    id v6 = [(_INPBCallGroupConversationFilter *)self callGroup];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBCallGroupConversationFilter *)self caller];

  if (v7)
  {
    v8 = [(_INPBCallGroupConversationFilter *)self caller];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCallGroupConversationFilter *)self hasMatchCallerAndParticipantsExactly])
  {
    PBDataWriterWriteBOOLField();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_participants;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupConversationFilterReadFrom(self, (uint64_t)a3);
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_participants objectAtIndexedSubscript:a3];
}

- (unint64_t)participantsCount
{
  return [(NSArray *)self->_participants count];
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSArray *)participants addObject:v4];
}

- (void)clearParticipants
{
}

- (void)setParticipants:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  participants = self->_participants;
  self->_participants = v4;

  MEMORY[0x1F41817F8](v4, participants);
}

- (void)setHasMatchCallerAndParticipantsExactly:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMatchCallerAndParticipantsExactly
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMatchCallerAndParticipantsExactly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int matchCallerAndParticipantsExactly = a3;
}

- (BOOL)hasCaller
{
  return self->_caller != 0;
}

- (void)setCaller:(id)a3
{
}

- (BOOL)hasCallGroup
{
  return self->_callGroup != 0;
}

- (void)setCallGroup:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)participantsType
{
  return (Class)objc_opt_class();
}

@end