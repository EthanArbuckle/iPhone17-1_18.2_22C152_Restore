@interface INCallInvite
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallInvite)initWithCoder:(id)a3;
- (INCallInvite)initWithParticipants:(id)a3 inviteType:(int64_t)a4 callURL:(id)a5;
- (NSArray)participants;
- (NSString)description;
- (NSURL)callURL;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)inviteType;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallInvite

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(INCallInvite *)self participants];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(INCallInvite *)self participants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    long long v10 = v3;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callURL, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

- (NSURL)callURL
{
  return self->_callURL;
}

- (int64_t)inviteType
{
  return self->_inviteType;
}

- (NSArray)participants
{
  return self->_participants;
}

- (id)_dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"participants";
  participants = self->_participants;
  id v4 = participants;
  if (!participants)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"inviteType";
  uint64_t v5 = [NSNumber numberWithInteger:self->_inviteType];
  v11[1] = v5;
  v10[2] = @"callURL";
  callURL = self->_callURL;
  uint64_t v7 = callURL;
  if (!callURL)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (!callURL) {

  }
  if (!participants) {

  }
  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCallInvite;
  uint64_t v6 = [(INCallInvite *)&v11 description];
  uint64_t v7 = [(INCallInvite *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallInvite *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_participants];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"participants");

  unint64_t v9 = self->_inviteType - 1;
  if (v9 > 2) {
    long long v10 = @"unknown";
  }
  else {
    long long v10 = off_1E5520FC8[v9];
  }
  objc_super v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"inviteType");

  long long v12 = [v6 encodeObject:self->_callURL];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"callURL");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  participants = self->_participants;
  id v5 = a3;
  [v5 encodeObject:participants forKey:@"participants"];
  [v5 encodeInteger:self->_inviteType forKey:@"inviteType"];
  [v5 encodeObject:self->_callURL forKey:@"callURL"];
}

- (INCallInvite)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v7 = [v4 setWithArray:v6];
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"participants"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"inviteType"];
  long long v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"callURL"];

  objc_super v11 = [(INCallInvite *)self initWithParticipants:v8 inviteType:v9 callURL:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCallInvite *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      participants = self->_participants;
      BOOL v8 = 0;
      if ((participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        && self->_inviteType == v5->_inviteType)
      {
        callURL = self->_callURL;
        if (callURL == v5->_callURL || -[NSURL isEqual:](callURL, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_participants hash];
  id v4 = [NSNumber numberWithInteger:self->_inviteType];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSURL *)self->_callURL hash];

  return v6;
}

- (INCallInvite)initWithParticipants:(id)a3 inviteType:(int64_t)a4 callURL:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INCallInvite;
  long long v10 = [(INCallInvite *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    participants = v10->_participants;
    v10->_participants = (NSArray *)v11;

    v10->_inviteType = a4;
    uint64_t v13 = [v9 copy];
    callURL = v10->_callURL;
    v10->_callURL = (NSURL *)v13;
  }
  return v10;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    long long v10 = [v8 objectForKeyedSubscript:@"participants"];
    uint64_t v11 = [v7 decodeObjectsOfClass:v9 from:v10];

    long long v12 = [v8 objectForKeyedSubscript:@"inviteType"];
    uint64_t v13 = INCallInviteTypeWithString(v12);

    uint64_t v14 = objc_opt_class();
    long long v15 = [v8 objectForKeyedSubscript:@"callURL"];
    objc_super v16 = [v7 decodeObjectOfClass:v14 from:v15];

    v17 = (void *)[objc_alloc((Class)a1) initWithParticipants:v11 inviteType:v13 callURL:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end