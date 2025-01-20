@interface _INPBCallGroupConversation
+ (BOOL)supportsSecureCoding;
+ (Class)otherParticipantsType;
- (BOOL)hasCallGroup;
- (BOOL)hasCaller;
- (BOOL)hasConversationId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)otherParticipants;
- (NSString)conversationId;
- (_INPBCallGroup)callGroup;
- (_INPBCallGroupConversation)initWithCoder:(id)a3;
- (_INPBContactValue)caller;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)otherParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)otherParticipantsCount;
- (void)addOtherParticipants:(id)a3;
- (void)clearOtherParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setCallGroup:(id)a3;
- (void)setCaller:(id)a3;
- (void)setConversationId:(id)a3;
- (void)setOtherParticipants:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallGroupConversation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherParticipants, 0);
  objc_storeStrong((id *)&self->_conversationId, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_callGroup, 0);
}

- (NSArray)otherParticipants
{
  return self->_otherParticipants;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (_INPBContactValue)caller
{
  return self->_caller;
}

- (_INPBCallGroup)callGroup
{
  return self->_callGroup;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCallGroupConversation *)self callGroup];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"callGroup"];

  v6 = [(_INPBCallGroupConversation *)self caller];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"caller"];

  if (self->_conversationId)
  {
    v8 = [(_INPBCallGroupConversation *)self conversationId];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"conversationId"];
  }
  if ([(NSArray *)self->_otherParticipants count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_otherParticipants;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"otherParticipants"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCallGroup *)self->_callGroup hash];
  unint64_t v4 = [(_INPBContactValue *)self->_caller hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_conversationId hash];
  return v4 ^ v5 ^ [(NSArray *)self->_otherParticipants hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(_INPBCallGroupConversation *)self callGroup];
  v6 = [v4 callGroup];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBCallGroupConversation *)self callGroup];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCallGroupConversation *)self callGroup];
    v10 = [v4 callGroup];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCallGroupConversation *)self caller];
  v6 = [v4 caller];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBCallGroupConversation *)self caller];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBCallGroupConversation *)self caller];
    v15 = [v4 caller];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCallGroupConversation *)self conversationId];
  v6 = [v4 conversationId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBCallGroupConversation *)self conversationId];
  if (v17)
  {
    long long v18 = (void *)v17;
    long long v19 = [(_INPBCallGroupConversation *)self conversationId];
    long long v20 = [v4 conversationId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBCallGroupConversation *)self otherParticipants];
  v6 = [v4 otherParticipants];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBCallGroupConversation *)self otherParticipants];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBCallGroupConversation *)self otherParticipants];
    v25 = [v4 otherParticipants];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBCallGroupConversation allocWithZone:](_INPBCallGroupConversation, "allocWithZone:") init];
  id v6 = [(_INPBCallGroup *)self->_callGroup copyWithZone:a3];
  [(_INPBCallGroupConversation *)v5 setCallGroup:v6];

  id v7 = [(_INPBContactValue *)self->_caller copyWithZone:a3];
  [(_INPBCallGroupConversation *)v5 setCaller:v7];

  v8 = (void *)[(NSString *)self->_conversationId copyWithZone:a3];
  [(_INPBCallGroupConversation *)v5 setConversationId:v8];

  v9 = (void *)[(NSArray *)self->_otherParticipants copyWithZone:a3];
  [(_INPBCallGroupConversation *)v5 setOtherParticipants:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallGroupConversation *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallGroupConversation)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallGroupConversation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallGroupConversation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallGroupConversation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_INPBCallGroupConversation *)self callGroup];

  if (v5)
  {
    id v6 = [(_INPBCallGroupConversation *)self callGroup];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBCallGroupConversation *)self caller];

  if (v7)
  {
    v8 = [(_INPBCallGroupConversation *)self caller];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBCallGroupConversation *)self conversationId];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_otherParticipants;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallGroupConversationReadFrom(self, (uint64_t)a3);
}

- (id)otherParticipantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_otherParticipants objectAtIndexedSubscript:a3];
}

- (unint64_t)otherParticipantsCount
{
  return [(NSArray *)self->_otherParticipants count];
}

- (void)addOtherParticipants:(id)a3
{
  id v4 = a3;
  otherParticipants = self->_otherParticipants;
  id v8 = v4;
  if (!otherParticipants)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_otherParticipants;
    self->_otherParticipants = v6;

    id v4 = v8;
    otherParticipants = self->_otherParticipants;
  }
  [(NSArray *)otherParticipants addObject:v4];
}

- (void)clearOtherParticipants
{
}

- (void)setOtherParticipants:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  otherParticipants = self->_otherParticipants;
  self->_otherParticipants = v4;

  MEMORY[0x1F41817F8](v4, otherParticipants);
}

- (BOOL)hasConversationId
{
  return self->_conversationId != 0;
}

- (void)setConversationId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  conversationId = self->_conversationId;
  self->_conversationId = v4;

  MEMORY[0x1F41817F8](v4, conversationId);
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

+ (Class)otherParticipantsType
{
  return (Class)objc_opt_class();
}

@end