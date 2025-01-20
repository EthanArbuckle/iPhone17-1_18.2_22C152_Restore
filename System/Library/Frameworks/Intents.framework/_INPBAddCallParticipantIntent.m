@interface _INPBAddCallParticipantIntent
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (_INPBAddCallParticipantIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAddCallParticipantIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)participants
{
  return self->_participants;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAddCallParticipantIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_participants count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_participants;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"participants"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(NSArray *)self->_participants hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBAddCallParticipantIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBAddCallParticipantIntent *)self intentMetadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBAddCallParticipantIntent *)self intentMetadata];
    uint64_t v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBAddCallParticipantIntent *)self participants];
  v6 = [v4 participants];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBAddCallParticipantIntent *)self participants];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBAddCallParticipantIntent *)self participants];
    long long v15 = [v4 participants];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBAddCallParticipantIntent allocWithZone:](_INPBAddCallParticipantIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBAddCallParticipantIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBAddCallParticipantIntent *)v5 setParticipants:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAddCallParticipantIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAddCallParticipantIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAddCallParticipantIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAddCallParticipantIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAddCallParticipantIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBAddCallParticipantIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBAddCallParticipantIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
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
  return _INPBAddCallParticipantIntentReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
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