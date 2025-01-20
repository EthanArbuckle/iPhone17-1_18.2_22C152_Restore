@interface _INPBCallInvite
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasCallURL;
- (BOOL)hasInviteType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (_INPBCallInvite)initWithCoder:(id)a3;
- (_INPBURLValue)callURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)inviteTypeAsString:(int)a3;
- (id)participantsAtIndex:(unint64_t)a3;
- (int)StringAsInviteType:(id)a3;
- (int)inviteType;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setCallURL:(id)a3;
- (void)setHasInviteType:(BOOL)a3;
- (void)setInviteType:(int)a3;
- (void)setParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallInvite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_callURL, 0);
}

- (NSArray)participants
{
  return self->_participants;
}

- (int)inviteType
{
  return self->_inviteType;
}

- (_INPBURLValue)callURL
{
  return self->_callURL;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCallInvite *)self callURL];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"callURL"];

  if ([(_INPBCallInvite *)self hasInviteType])
  {
    uint64_t v6 = [(_INPBCallInvite *)self inviteType];
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5520FB0[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"inviteType"];
  }
  if ([(NSArray *)self->_participants count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_participants;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"participants"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBURLValue *)self->_callURL hash];
  if ([(_INPBCallInvite *)self hasInviteType]) {
    uint64_t v4 = 2654435761 * self->_inviteType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_participants hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  v5 = [(_INPBCallInvite *)self callURL];
  uint64_t v6 = [v4 callURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_15;
  }
  uint64_t v7 = [(_INPBCallInvite *)self callURL];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCallInvite *)self callURL];
    uint64_t v10 = [v4 callURL];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  int v12 = [(_INPBCallInvite *)self hasInviteType];
  if (v12 != [v4 hasInviteType]) {
    goto LABEL_16;
  }
  if ([(_INPBCallInvite *)self hasInviteType])
  {
    if ([v4 hasInviteType])
    {
      int inviteType = self->_inviteType;
      if (inviteType != [v4 inviteType]) {
        goto LABEL_16;
      }
    }
  }
  v5 = [(_INPBCallInvite *)self participants];
  uint64_t v6 = [v4 participants];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_INPBCallInvite *)self participants];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    long long v16 = [(_INPBCallInvite *)self participants];
    long long v17 = [v4 participants];
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
  v5 = [+[_INPBCallInvite allocWithZone:](_INPBCallInvite, "allocWithZone:") init];
  id v6 = [(_INPBURLValue *)self->_callURL copyWithZone:a3];
  [(_INPBCallInvite *)v5 setCallURL:v6];

  if ([(_INPBCallInvite *)self hasInviteType]) {
    [(_INPBCallInvite *)v5 setInviteType:[(_INPBCallInvite *)self inviteType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCallInvite *)v5 setParticipants:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallInvite *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallInvite)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallInvite *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallInvite *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallInvite *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBCallInvite *)self callURL];

  if (v5)
  {
    id v6 = [(_INPBCallInvite *)self callURL];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCallInvite *)self hasInviteType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_participants;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallInviteReadFrom(self, (uint64_t)a3);
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

- (int)StringAsInviteType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"RING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LINK"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)inviteTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520FB0[a3 - 1];
  }

  return v3;
}

- (void)setHasInviteType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInviteType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInviteType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int inviteType = a3;
  }
}

- (BOOL)hasCallURL
{
  return self->_callURL != 0;
}

- (void)setCallURL:(id)a3
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