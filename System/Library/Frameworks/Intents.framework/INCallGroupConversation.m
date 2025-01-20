@interface INCallGroupConversation
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallGroup)callGroup;
- (INCallGroupConversation)initWithCoder:(id)a3;
- (INCallGroupConversation)initWithConversationId:(id)a3 caller:(id)a4 otherParticipants:(id)a5 callGroup:(id)a6;
- (INPerson)caller;
- (NSArray)otherParticipants;
- (NSString)conversationId;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallGroupConversation

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCallGroupConversation *)self caller];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(INCallGroupConversation *)self otherParticipants];
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
  id v4 = [(INCallGroupConversation *)self caller];
  v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(INCallGroupConversation *)self otherParticipants];
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
  objc_storeStrong((id *)&self->_otherParticipants, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_conversationId, 0);
}

- (INCallGroup)callGroup
{
  return self->_callGroup;
}

- (NSArray)otherParticipants
{
  return self->_otherParticipants;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSString)conversationId
{
  return self->_conversationId;
}

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"conversationId";
  conversationId = self->_conversationId;
  id v4 = conversationId;
  if (!conversationId)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"caller";
  caller = self->_caller;
  v6 = caller;
  if (!caller)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"otherParticipants";
  otherParticipants = self->_otherParticipants;
  uint64_t v8 = otherParticipants;
  if (!otherParticipants)
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
    if (otherParticipants) {
      goto LABEL_11;
    }
  }
  else
  {

    if (otherParticipants)
    {
LABEL_11:
      if (caller) {
        goto LABEL_12;
      }
LABEL_18:

      if (conversationId) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!caller) {
    goto LABEL_18;
  }
LABEL_12:
  if (conversationId) {
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
  v11.super_class = (Class)INCallGroupConversation;
  v6 = [(INCallGroupConversation *)&v11 description];
  uint64_t v7 = [(INCallGroupConversation *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallGroupConversation *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_conversationId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"conversationId");

  uint64_t v9 = [v6 encodeObject:self->_caller];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"caller");

  uint64_t v10 = [v6 encodeObject:self->_otherParticipants];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"otherParticipants");

  objc_super v11 = [v6 encodeObject:self->_callGroup];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"callGroup");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  conversationId = self->_conversationId;
  id v5 = a3;
  [v5 encodeObject:conversationId forKey:@"conversationId"];
  [v5 encodeObject:self->_caller forKey:@"caller"];
  [v5 encodeObject:self->_otherParticipants forKey:@"otherParticipants"];
  [v5 encodeObject:self->_callGroup forKey:@"callGroup"];
}

- (INCallGroupConversation)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"conversationId"];

  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"caller"];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  long long v12 = [v10 setWithArray:v11];
  id v13 = [v5 decodeObjectOfClasses:v12 forKey:@"otherParticipants"];

  long long v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"callGroup"];

  long long v15 = [(INCallGroupConversation *)self initWithConversationId:v8 caller:v9 otherParticipants:v13 callGroup:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCallGroupConversation *)a3;
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
      conversationId = self->_conversationId;
      BOOL v10 = 0;
      if (conversationId == v5->_conversationId || -[NSString isEqual:](conversationId, "isEqual:"))
      {
        caller = self->_caller;
        if (caller == v5->_caller || -[INPerson isEqual:](caller, "isEqual:"))
        {
          otherParticipants = self->_otherParticipants;
          if (otherParticipants == v5->_otherParticipants
            || -[NSArray isEqual:](otherParticipants, "isEqual:"))
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
  NSUInteger v3 = [(NSString *)self->_conversationId hash];
  unint64_t v4 = [(INPerson *)self->_caller hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_otherParticipants hash];
  return v4 ^ v5 ^ [(INCallGroup *)self->_callGroup hash];
}

- (INCallGroupConversation)initWithConversationId:(id)a3 caller:(id)a4 otherParticipants:(id)a5 callGroup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)INCallGroupConversation;
  long long v14 = [(INCallGroupConversation *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    conversationId = v14->_conversationId;
    v14->_conversationId = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    caller = v14->_caller;
    v14->_caller = (INPerson *)v17;

    uint64_t v19 = [v12 copy];
    otherParticipants = v14->_otherParticipants;
    v14->_otherParticipants = (NSArray *)v19;

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
    uint64_t v9 = [v8 objectForKeyedSubscript:@"conversationId"];
    uint64_t v10 = objc_opt_class();
    id v11 = [v8 objectForKeyedSubscript:@"caller"];
    id v12 = [v7 decodeObjectOfClass:v10 from:v11];

    uint64_t v13 = objc_opt_class();
    long long v14 = [v8 objectForKeyedSubscript:@"otherParticipants"];
    uint64_t v15 = [v7 decodeObjectsOfClass:v13 from:v14];

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"callGroup"];
    long long v18 = [v7 decodeObjectOfClass:v16 from:v17];

    uint64_t v19 = (void *)[objc_alloc((Class)a1) initWithConversationId:v9 caller:v12 otherParticipants:v15 callGroup:v18];
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