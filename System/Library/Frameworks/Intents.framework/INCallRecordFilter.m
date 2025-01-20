@interface INCallRecordFilter
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallCapability)callCapability;
- (INCallRecordFilter)initWithCoder:(id)a3;
- (INCallRecordFilter)initWithParticipants:(NSArray *)participants callTypes:(INCallRecordTypeOptions)callTypes callCapability:(INCallCapability)callCapability;
- (INCallRecordFilter)initWithParticipants:(id)a3 callTypes:(unint64_t)a4 callCapability:(int64_t)a5 preferredCallProvider:(int64_t)a6;
- (INCallRecordTypeOptions)callTypes;
- (NSArray)participants;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)preferredCallProvider;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallRecordFilter

- (void).cxx_destruct
{
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (INCallCapability)callCapability
{
  return self->_callCapability;
}

- (INCallRecordTypeOptions)callTypes
{
  return self->_callTypes;
}

- (NSArray)participants
{
  return self->_participants;
}

- (id)_dictionaryRepresentation
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"participants";
  participants = self->_participants;
  v4 = participants;
  if (!participants)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v4;
  v10[1] = @"callTypes";
  v5 = [NSNumber numberWithUnsignedInteger:self->_callTypes];
  v11[1] = v5;
  v10[2] = @"callCapability";
  v6 = [NSNumber numberWithInteger:self->_callCapability];
  v11[2] = v6;
  v10[3] = @"preferredCallProvider";
  v7 = [NSNumber numberWithInteger:self->_preferredCallProvider];
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  if (!participants) {

  }
  return v8;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCallRecordFilter;
  v6 = [(INCallRecordFilter *)&v11 description];
  v7 = [(INCallRecordFilter *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallRecordFilter *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_participants];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"participants");
  v9 = INCallRecordTypeOptionsGetNames(self->_callTypes);
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"callTypes");

  int64_t callCapability = self->_callCapability;
  objc_super v11 = @"unknown";
  if (callCapability == 2) {
    objc_super v11 = @"videoCall";
  }
  if (callCapability == 1) {
    v12 = @"audioCall";
  }
  else {
    v12 = v11;
  }
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"callCapability");

  unint64_t v14 = self->_preferredCallProvider - 1;
  if (v14 > 2) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E551A370[v14];
  }
  v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"preferredCallProvider");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  participants = self->_participants;
  id v5 = a3;
  [v5 encodeObject:participants forKey:@"participants"];
  [v5 encodeInteger:self->_callTypes forKey:@"callTypes"];
  [v5 encodeInteger:self->_callCapability forKey:@"callCapability"];
  [v5 encodeInteger:self->_preferredCallProvider forKey:@"preferredCallProvider"];
}

- (INCallRecordFilter)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"participants"];

  uint64_t v9 = [v5 decodeIntegerForKey:@"callTypes"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"callCapability"];
  uint64_t v11 = [v5 decodeIntegerForKey:@"preferredCallProvider"];

  v12 = [(INCallRecordFilter *)self initWithParticipants:v8 callTypes:v9 callCapability:v10 preferredCallProvider:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INCallRecordFilter *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      participants = self->_participants;
      BOOL v7 = (participants == v5->_participants || -[NSArray isEqual:](participants, "isEqual:"))
        && self->_callTypes == v5->_callTypes
        && self->_callCapability == v5->_callCapability
        && self->_preferredCallProvider == v5->_preferredCallProvider;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_participants hash];
  v4 = [NSNumber numberWithUnsignedInteger:self->_callTypes];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [NSNumber numberWithInteger:self->_callCapability];
  uint64_t v7 = [v6 hash];
  v8 = [NSNumber numberWithInteger:self->_preferredCallProvider];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (INCallRecordFilter)initWithParticipants:(id)a3 callTypes:(unint64_t)a4 callCapability:(int64_t)a5 preferredCallProvider:(int64_t)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCallRecordFilter;
  uint64_t v11 = [(INCallRecordFilter *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    participants = v11->_participants;
    v11->_participants = (NSArray *)v12;

    v11->_callTypes = a4;
    v11->_int64_t callCapability = a5;
    v11->_preferredCallProvider = a6;
  }

  return v11;
}

- (INCallRecordFilter)initWithParticipants:(NSArray *)participants callTypes:(INCallRecordTypeOptions)callTypes callCapability:(INCallCapability)callCapability
{
  v8 = participants;
  v13.receiver = self;
  v13.super_class = (Class)INCallRecordFilter;
  unint64_t v9 = [(INCallRecordFilter *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [(NSArray *)v8 copy];
    uint64_t v11 = v9->_participants;
    v9->_participants = (NSArray *)v10;

    v9->_callTypes = callTypes;
    v9->_int64_t callCapability = callCapability;
  }

  return v9;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"participants"];
    uint64_t v11 = [v7 decodeObjectsOfClass:v9 from:v10];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"callTypes"];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v13 = v12;
      }
      else {
        objc_super v13 = 0;
      }
    }
    else
    {
      objc_super v13 = 0;
    }
    id v15 = v13;

    uint64_t v16 = INCallRecordTypeOptionsWithNames(v15);
    v17 = [v8 objectForKeyedSubscript:@"callCapability"];
    uint64_t v18 = INCallCapabilityWithString(v17);

    v19 = [v8 objectForKeyedSubscript:@"preferredCallProvider"];
    uint64_t v20 = INPreferredCallProviderWithString(v19);

    unint64_t v14 = (void *)[objc_alloc((Class)a1) initWithParticipants:v11 callTypes:v16 callCapability:v18 preferredCallProvider:v20];
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(INCallRecordFilter *)self participants];
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
  id v4 = [(INCallRecordFilter *)self participants];
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

@end