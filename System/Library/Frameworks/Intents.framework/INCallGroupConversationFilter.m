@interface INCallGroupConversationFilter
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallGroup)callGroup;
- (INCallGroupConversationFilter)initWithCaller:(id)a3 participants:(id)a4 matchCallerAndParticipantsExactly:(id)a5 callGroup:(id)a6;
- (INCallGroupConversationFilter)initWithCoder:(id)a3;
- (INPerson)caller;
- (NSArray)participants;
- (NSNumber)matchCallerAndParticipantsExactly;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallGroupConversationFilter

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCallGroupConversationFilter *)self caller];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(INCallGroupConversationFilter *)self participants];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_intents_updateContainerWithCache:", v4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INCallGroupConversationFilter *)self caller];
  v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(INCallGroupConversationFilter *)self participants];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "_intents_cacheableObjects");
        [v3 unionSet:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v3 count]) {
    long long v12 = v3;
  }
  else {
    long long v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callGroup, 0);
  objc_storeStrong((id *)&self->_matchCallerAndParticipantsExactly, 0);
  objc_storeStrong((id *)&self->_participants, 0);

  objc_storeStrong((id *)&self->_caller, 0);
}

- (INCallGroup)callGroup
{
  return self->_callGroup;
}

- (NSNumber)matchCallerAndParticipantsExactly
{
  return self->_matchCallerAndParticipantsExactly;
}

- (NSArray)participants
{
  return self->_participants;
}

- (INPerson)caller
{
  return self->_caller;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"caller";
  caller = self->_caller;
  id v4 = caller;
  if (!caller)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"participants";
  participants = self->_participants;
  v6 = participants;
  if (!participants)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"matchCallerAndParticipantsExactly";
  matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
  uint64_t v8 = matchCallerAndParticipantsExactly;
  if (!matchCallerAndParticipantsExactly)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"callGroup";
  callGroup = self->_callGroup;
  uint64_t v10 = callGroup;
  if (!callGroup)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (callGroup)
  {
    if (matchCallerAndParticipantsExactly) {
      goto LABEL_11;
    }
  }
  else
  {

    if (matchCallerAndParticipantsExactly)
    {
LABEL_11:
      if (participants) {
        goto LABEL_12;
      }
LABEL_18:

      if (caller) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!participants) {
    goto LABEL_18;
  }
LABEL_12:
  if (caller) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCallGroupConversationFilter;
  v6 = [(INCallGroupConversationFilter *)&v11 description];
  uint64_t v7 = [(INCallGroupConversationFilter *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallGroupConversationFilter *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_caller];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"caller");

  uint64_t v9 = [v6 encodeObject:self->_participants];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"participants");

  uint64_t v10 = [v6 encodeObject:self->_matchCallerAndParticipantsExactly];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"matchCallerAndParticipantsExactly");

  objc_super v11 = [v6 encodeObject:self->_callGroup];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"callGroup");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  caller = self->_caller;
  id v5 = a3;
  [v5 encodeObject:caller forKey:@"caller"];
  [v5 encodeObject:self->_participants forKey:@"participants"];
  [v5 encodeObject:self->_matchCallerAndParticipantsExactly forKey:@"matchCallerAndParticipantsExactly"];
  [v5 encodeObject:self->_callGroup forKey:@"callGroup"];
}

- (INCallGroupConversationFilter)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caller"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"participants"];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchCallerAndParticipantsExactly"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callGroup"];

  long long v12 = [(INCallGroupConversationFilter *)self initWithCaller:v5 participants:v9 matchCallerAndParticipantsExactly:v10 callGroup:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCallGroupConversationFilter *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      caller = self->_caller;
      BOOL v10 = 0;
      if (caller == v5->_caller || -[INPerson isEqual:](caller, "isEqual:"))
      {
        participants = self->_participants;
        if (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        {
          matchCallerAndParticipantsExactly = self->_matchCallerAndParticipantsExactly;
          if (matchCallerAndParticipantsExactly == v5->_matchCallerAndParticipantsExactly
            || -[NSNumber isEqual:](matchCallerAndParticipantsExactly, "isEqual:"))
          {
            callGroup = self->_callGroup;
            if (callGroup == v5->_callGroup || -[INCallGroup isEqual:](callGroup, "isEqual:")) {
              BOOL v10 = 1;
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPerson *)self->_caller hash];
  uint64_t v4 = [(NSArray *)self->_participants hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_matchCallerAndParticipantsExactly hash];
  return v4 ^ v5 ^ [(INCallGroup *)self->_callGroup hash];
}

- (INCallGroupConversationFilter)initWithCaller:(id)a3 participants:(id)a4 matchCallerAndParticipantsExactly:(id)a5 callGroup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INCallGroupConversationFilter;
  long long v14 = [(INCallGroupConversationFilter *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    caller = v14->_caller;
    v14->_caller = (INPerson *)v15;

    uint64_t v17 = [v11 copy];
    participants = v14->_participants;
    v14->_participants = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    matchCallerAndParticipantsExactly = v14->_matchCallerAndParticipantsExactly;
    v14->_matchCallerAndParticipantsExactly = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    callGroup = v14->_callGroup;
    v14->_callGroup = (INCallGroup *)v21;
  }
  return v14;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [v8 objectForKeyedSubscript:@"caller"];
    id v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    id v13 = [v8 objectForKeyedSubscript:@"participants"];
    long long v14 = [v7 decodeObjectsOfClass:v12 from:v13];

    uint64_t v15 = [v8 objectForKeyedSubscript:@"matchCallerAndParticipantsExactly"];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"callGroup"];
    long long v18 = [v7 decodeObjectOfClass:v16 from:v17];

    uint64_t v19 = (void *)[objc_alloc((Class)a1) initWithCaller:v11 participants:v14 matchCallerAndParticipantsExactly:v15 callGroup:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end