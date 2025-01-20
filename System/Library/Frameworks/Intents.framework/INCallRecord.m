@interface INCallRecord
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCallCapability)callCapability;
- (INCallRecord)initWithCoder:(id)a3;
- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen;
- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls;
- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen participants:(NSArray *)participants numberOfCalls:(NSNumber *)numberOfCalls isCallerIdBlocked:(NSNumber *)isCallerIdBlocked;
- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen;
- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls;
- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 callRecordType:(int64_t)a5 callCapability:(int64_t)a6 callDuration:(id)a7 unseen:(id)a8 preferredCallProvider:(int64_t)a9 participants:(id)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14;
- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 numberOfCalls:(id)a10 isCallerIdBlocked:(id)a11;
- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12;
- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14;
- (INCallRecordType)callRecordType;
- (INPerson)caller;
- (NSArray)participants;
- (NSDate)dateCreated;
- (NSNumber)callDuration;
- (NSNumber)isCallerIdBlocked;
- (NSNumber)numberOfCalls;
- (NSNumber)unseen;
- (NSString)description;
- (NSString)identifier;
- (NSString)providerBundleId;
- (NSString)providerId;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)preferredCallProvider;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCallRecord

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 numberOfCalls:(id)a10 isCallerIdBlocked:(id)a11
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (a5)
  {
    v27[0] = a5;
    v21 = (void *)MEMORY[0x1E4F1C978];
    id v22 = a5;
    a5 = [v21 arrayWithObjects:v27 count:1];
  }
  v23 = [(INCallRecord *)self initWithIdentifier:v15 dateCreated:v16 callRecordType:a6 callCapability:a7 callDuration:v17 unseen:v18 participants:a5 numberOfCalls:v19 isCallerIdBlocked:v20];

  return v23;
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  if (a5)
  {
    v33[0] = a5;
    v25 = (void *)MEMORY[0x1E4F1C978];
    id v26 = a5;
    v27 = [v25 arrayWithObjects:v33 count:1];
  }
  else
  {
    v27 = 0;
  }
  v28 = [(INCallRecord *)self initWithIdentifier:v17 dateCreated:v18 callRecordType:a6 callCapability:a7 callDuration:v19 unseen:v20 preferredCallProvider:a10 participants:v27 numberOfCalls:v21 providerId:v22 providerBundleId:v23 isCallerIdBlocked:v24];

  return v28;
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 caller:(id)a5 callRecordType:(int64_t)a6 callCapability:(int64_t)a7 callDuration:(id)a8 unseen:(id)a9 preferredCallProvider:(int64_t)a10 numberOfCalls:(id)a11 providerId:(id)a12
{
  return [(INCallRecord *)self initWithIdentifier:a3 dateCreated:a4 caller:a5 callRecordType:a6 callCapability:a7 callDuration:a8 unseen:a9 preferredCallProvider:a10 numberOfCalls:a11 providerId:a12 providerBundleId:0 isCallerIdBlocked:0];
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INCallRecord(Deprecated) *)self caller];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(INCallRecord *)self participants];
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
  id v4 = [(INCallRecord(Deprecated) *)self caller];
  v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(INCallRecord *)self participants];
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
  objc_storeStrong((id *)&self->_providerBundleId, 0);
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_isCallerIdBlocked, 0);
  objc_storeStrong((id *)&self->_numberOfCalls, 0);
  objc_storeStrong((id *)&self->_unseen, 0);
  objc_storeStrong((id *)&self->_callDuration, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)providerBundleId
{
  return self->_providerBundleId;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (INPerson)caller
{
  return self->_caller;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSNumber)isCallerIdBlocked
{
  return self->_isCallerIdBlocked;
}

- (NSNumber)numberOfCalls
{
  return self->_numberOfCalls;
}

- (INCallCapability)callCapability
{
  return self->_callCapability;
}

- (NSNumber)unseen
{
  return self->_unseen;
}

- (NSNumber)callDuration
{
  return self->_callDuration;
}

- (INCallRecordType)callRecordType
{
  return self->_callRecordType;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_dictionaryRepresentation
{
  v32[12] = *MEMORY[0x1E4F143B8];
  uint64_t identifier = (uint64_t)self->_identifier;
  uint64_t v30 = identifier;
  v31[0] = @"identifier";
  if (!identifier)
  {
    uint64_t identifier = [MEMORY[0x1E4F1CA98] null];
  }
  id v23 = (void *)identifier;
  v32[0] = identifier;
  v31[1] = @"dateCreated";
  uint64_t dateCreated = (uint64_t)self->_dateCreated;
  uint64_t v29 = dateCreated;
  if (!dateCreated)
  {
    uint64_t dateCreated = [MEMORY[0x1E4F1CA98] null];
  }
  id v22 = (void *)dateCreated;
  v32[1] = dateCreated;
  v31[2] = @"callRecordType";
  v28 = [NSNumber numberWithInteger:self->_callRecordType];
  v32[2] = v28;
  v31[3] = @"callDuration";
  uint64_t callDuration = (uint64_t)self->_callDuration;
  uint64_t v27 = callDuration;
  if (!callDuration)
  {
    uint64_t callDuration = [MEMORY[0x1E4F1CA98] null];
  }
  id v21 = (void *)callDuration;
  v32[3] = callDuration;
  v31[4] = @"unseen";
  uint64_t unseen = (uint64_t)self->_unseen;
  uint64_t v26 = unseen;
  if (!unseen)
  {
    uint64_t unseen = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)unseen;
  v32[4] = unseen;
  v31[5] = @"callCapability";
  v25 = [NSNumber numberWithInteger:self->_callCapability];
  v32[5] = v25;
  v31[6] = @"numberOfCalls";
  numberOfCalls = self->_numberOfCalls;
  uint64_t v8 = (uint64_t)numberOfCalls;
  if (!numberOfCalls)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[6] = v8;
  v31[7] = @"preferredCallProvider";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", self->_preferredCallProvider, v8);
  v32[7] = v9;
  v31[8] = @"providerId";
  providerId = self->_providerId;
  long long v11 = providerId;
  if (!providerId)
  {
    long long v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[8] = v11;
  v31[9] = @"providerBundleId";
  providerBundleId = self->_providerBundleId;
  id v13 = providerBundleId;
  if (!providerBundleId)
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[9] = v13;
  v31[10] = @"isCallerIdBlocked";
  isCallerIdBlocked = self->_isCallerIdBlocked;
  long long v15 = isCallerIdBlocked;
  if (!isCallerIdBlocked)
  {
    long long v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[10] = v15;
  v31[11] = @"participants";
  participants = self->_participants;
  long long v17 = participants;
  if (!participants)
  {
    long long v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[11] = v17;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
  if (participants)
  {
    if (isCallerIdBlocked) {
      goto LABEL_21;
    }
  }
  else
  {

    if (isCallerIdBlocked)
    {
LABEL_21:
      if (providerBundleId) {
        goto LABEL_22;
      }
LABEL_38:

      if (providerId) {
        goto LABEL_23;
      }
      goto LABEL_39;
    }
  }

  if (!providerBundleId) {
    goto LABEL_38;
  }
LABEL_22:
  if (providerId) {
    goto LABEL_23;
  }
LABEL_39:

LABEL_23:
  if (!numberOfCalls) {

  }
  if (!v26) {
  if (!v27)
  }

  if (!v29) {
  if (!v30)
  }

  return v24;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCallRecord;
  v6 = [(INCallRecord *)&v11 description];
  uint64_t v7 = [(INCallRecord *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INCallRecord *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_identifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"identifier");

  uint64_t v9 = [v6 encodeObject:self->_dateCreated];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"dateCreated");

  unint64_t v10 = self->_callRecordType - 1;
  if (v10 > 7) {
    objc_super v11 = @"unknown";
  }
  else {
    objc_super v11 = off_1E5518D60[v10];
  }
  long long v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"callRecordType");

  id v13 = [v6 encodeObject:self->_callDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"callDuration");

  long long v14 = [v6 encodeObject:self->_unseen];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"unseen");

  int64_t callCapability = self->_callCapability;
  long long v16 = @"unknown";
  if (callCapability == 2) {
    long long v16 = @"videoCall";
  }
  if (callCapability == 1) {
    long long v17 = @"audioCall";
  }
  else {
    long long v17 = v16;
  }
  long long v18 = v17;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"callCapability");

  id v19 = [v6 encodeObject:self->_numberOfCalls];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"numberOfCalls");

  unint64_t v20 = self->_preferredCallProvider - 1;
  if (v20 > 2) {
    id v21 = @"unknown";
  }
  else {
    id v21 = off_1E551A370[v20];
  }
  id v22 = v21;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"preferredCallProvider");

  id v23 = [v6 encodeObject:self->_providerId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"providerId");

  id v24 = [v6 encodeObject:self->_providerBundleId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"providerBundleId");

  v25 = [v6 encodeObject:self->_isCallerIdBlocked];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"isCallerIdBlocked");

  uint64_t v26 = [v6 encodeObject:self->_participants];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, @"participants");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_dateCreated forKey:@"dateCreated"];
  [v5 encodeInteger:self->_callRecordType forKey:@"callRecordType"];
  [v5 encodeObject:self->_callDuration forKey:@"callDuration"];
  [v5 encodeObject:self->_unseen forKey:@"unseen"];
  [v5 encodeInteger:self->_callCapability forKey:@"callCapability"];
  [v5 encodeObject:self->_numberOfCalls forKey:@"numberOfCalls"];
  [v5 encodeInteger:self->_preferredCallProvider forKey:@"preferredCallProvider"];
  [v5 encodeObject:self->_providerId forKey:@"providerId"];
  [v5 encodeObject:self->_providerBundleId forKey:@"providerBundleId"];
  [v5 encodeObject:self->_isCallerIdBlocked forKey:@"isCallerIdBlocked"];
  [v5 encodeObject:self->_participants forKey:@"participants"];
}

- (INCallRecord)initWithCoder:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v29 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateCreated"];
  uint64_t v27 = [v4 decodeIntegerForKey:@"callRecordType"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callDuration"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unseen"];
  uint64_t v26 = [v4 decodeIntegerForKey:@"callCapability"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfCalls"];
  uint64_t v25 = [v4 decodeIntegerForKey:@"preferredCallProvider"];
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  long long v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"providerId"];

  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  long long v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  long long v17 = [v4 decodeObjectOfClasses:v16 forKey:@"providerBundleId"];

  long long v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCallerIdBlocked"];
  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v21 = [v19 setWithArray:v20];
  id v22 = [v4 decodeObjectOfClasses:v21 forKey:@"participants"];

  id v23 = [(INCallRecord *)self initWithIdentifier:v29 dateCreated:v28 callRecordType:v27 callCapability:v26 callDuration:v7 unseen:v8 preferredCallProvider:v25 participants:v22 numberOfCalls:v9 providerId:v13 providerBundleId:v17 isCallerIdBlocked:v18];
  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INCallRecord *)a3;
  if (v4 == self)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t identifier = self->_identifier;
      if (identifier != v5->_identifier && !-[NSString isEqual:](identifier, "isEqual:")) {
        goto LABEL_27;
      }
      uint64_t dateCreated = self->_dateCreated;
      if (dateCreated != v5->_dateCreated && !-[NSDate isEqual:](dateCreated, "isEqual:")) {
        goto LABEL_27;
      }
      if (self->_callRecordType == v5->_callRecordType
        && ((uint64_t callDuration = self->_callDuration, callDuration == v5->_callDuration)
         || -[NSNumber isEqual:](callDuration, "isEqual:"))
        && ((uint64_t unseen = self->_unseen, unseen == v5->_unseen) || -[NSNumber isEqual:](unseen, "isEqual:"))
        && self->_callCapability == v5->_callCapability
        && ((numberOfCalls = self->_numberOfCalls, numberOfCalls == v5->_numberOfCalls)
         || -[NSNumber isEqual:](numberOfCalls, "isEqual:"))
        && self->_preferredCallProvider == v5->_preferredCallProvider
        && ((providerId = self->_providerId, providerId == v5->_providerId)
         || -[NSString isEqual:](providerId, "isEqual:"))
        && ((providerBundleId = self->_providerBundleId, providerBundleId == v5->_providerBundleId)
         || -[NSString isEqual:](providerBundleId, "isEqual:"))
        && ((isCallerIdBlocked = self->_isCallerIdBlocked, isCallerIdBlocked == v5->_isCallerIdBlocked)
         || -[NSNumber isEqual:](isCallerIdBlocked, "isEqual:"))
        && ((participants = self->_participants, participants == v5->_participants)
         || -[NSArray isEqual:](participants, "isEqual:")))
      {
        BOOL v15 = 1;
      }
      else
      {
LABEL_27:
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSDate *)self->_dateCreated hash] ^ v3;
  uint64_t v5 = [NSNumber numberWithInteger:self->_callRecordType];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = v4 ^ [(NSNumber *)self->_callDuration hash] ^ v6;
  uint64_t v8 = [(NSNumber *)self->_unseen hash];
  uint64_t v9 = [NSNumber numberWithInteger:self->_callCapability];
  uint64_t v10 = v7 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(NSNumber *)self->_numberOfCalls hash];
  long long v12 = [NSNumber numberWithInteger:self->_preferredCallProvider];
  uint64_t v13 = v11 ^ [v12 hash];
  NSUInteger v14 = v10 ^ v13 ^ [(NSString *)self->_providerId hash];
  NSUInteger v15 = [(NSString *)self->_providerBundleId hash];
  uint64_t v16 = v15 ^ [(NSNumber *)self->_isCallerIdBlocked hash];
  unint64_t v17 = v14 ^ v16 ^ [(NSArray *)self->_participants hash];

  return v17;
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls
{
  return [(INCallRecord *)self initWithIdentifier:identifier dateCreated:dateCreated callRecordType:callRecordType callCapability:callCapability callDuration:callDuration unseen:unseen preferredCallProvider:0 participants:0 numberOfCalls:numberOfCalls providerId:0 providerBundleId:0 isCallerIdBlocked:0];
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen
{
  return [(INCallRecord *)self initWithIdentifier:identifier dateCreated:dateCreated callRecordType:callRecordType callCapability:callCapability callDuration:callDuration unseen:unseen preferredCallProvider:0 participants:0 numberOfCalls:0 providerId:0 providerBundleId:0 isCallerIdBlocked:0];
}

- (INCallRecord)initWithIdentifier:(id)a3 dateCreated:(id)a4 callRecordType:(int64_t)a5 callCapability:(int64_t)a6 callDuration:(id)a7 unseen:(id)a8 preferredCallProvider:(int64_t)a9 participants:(id)a10 numberOfCalls:(id)a11 providerId:(id)a12 providerBundleId:(id)a13 isCallerIdBlocked:(id)a14
{
  id v48 = a3;
  id v47 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v49.receiver = self;
  v49.super_class = (Class)INCallRecord;
  uint64_t v26 = [(INCallRecord *)&v49 init];
  if (v26)
  {
    uint64_t v27 = [v48 copy];
    uint64_t identifier = v26->_identifier;
    v26->_uint64_t identifier = (NSString *)v27;

    uint64_t v29 = [v47 copy];
    uint64_t dateCreated = v26->_dateCreated;
    v26->_uint64_t dateCreated = (NSDate *)v29;

    v26->_callRecordType = a5;
    uint64_t v31 = [v19 copy];
    uint64_t callDuration = v26->_callDuration;
    v26->_uint64_t callDuration = (NSNumber *)v31;

    uint64_t v33 = [v20 copy];
    uint64_t unseen = v26->_unseen;
    v26->_uint64_t unseen = (NSNumber *)v33;

    v26->_int64_t callCapability = a6;
    uint64_t v35 = [v22 copy];
    numberOfCalls = v26->_numberOfCalls;
    v26->_numberOfCalls = (NSNumber *)v35;

    v26->_preferredCallProvider = a9;
    uint64_t v37 = [v23 copy];
    providerId = v26->_providerId;
    v26->_providerId = (NSString *)v37;

    uint64_t v39 = [v24 copy];
    providerBundleId = v26->_providerBundleId;
    v26->_providerBundleId = (NSString *)v39;

    uint64_t v41 = [v25 copy];
    isCallerIdBlocked = v26->_isCallerIdBlocked;
    v26->_isCallerIdBlocked = (NSNumber *)v41;

    uint64_t v43 = [v21 copy];
    participants = v26->_participants;
    v26->_participants = (NSArray *)v43;
  }
  return v26;
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen participants:(NSArray *)participants numberOfCalls:(NSNumber *)numberOfCalls isCallerIdBlocked:(NSNumber *)isCallerIdBlocked
{
  unint64_t v17 = identifier;
  long long v18 = dateCreated;
  id v19 = callDuration;
  id v20 = unseen;
  id v21 = participants;
  id v22 = numberOfCalls;
  id v23 = isCallerIdBlocked;
  v40.receiver = self;
  v40.super_class = (Class)INCallRecord;
  id v24 = [(INCallRecord *)&v40 init];
  if (v24)
  {
    uint64_t v25 = [(NSString *)v17 copy];
    uint64_t v26 = v24->_identifier;
    v24->_uint64_t identifier = (NSString *)v25;

    uint64_t v27 = [(NSDate *)v18 copy];
    v28 = v24->_dateCreated;
    v24->_uint64_t dateCreated = (NSDate *)v27;

    v24->_callRecordType = callRecordType;
    uint64_t v29 = [(NSNumber *)v19 copy];
    uint64_t v30 = v24->_callDuration;
    v24->_uint64_t callDuration = (NSNumber *)v29;

    uint64_t v31 = [(NSNumber *)v20 copy];
    v32 = v24->_unseen;
    v24->_uint64_t unseen = (NSNumber *)v31;

    v24->_int64_t callCapability = callCapability;
    uint64_t v33 = [(NSNumber *)v22 copy];
    v34 = v24->_numberOfCalls;
    v24->_numberOfCalls = (NSNumber *)v33;

    uint64_t v35 = [(NSNumber *)v23 copy];
    v36 = v24->_isCallerIdBlocked;
    v24->_isCallerIdBlocked = (NSNumber *)v35;

    uint64_t v37 = [(NSArray *)v21 copy];
    v38 = v24->_participants;
    v24->_participants = (NSArray *)v37;
  }
  return v24;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v31 = [v8 objectForKeyedSubscript:@"identifier"];
    v34 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"dateCreated"];
    uint64_t v33 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"callRecordType"];
    uint64_t v29 = INCallRecordTypeWithString(v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 objectForKeyedSubscript:@"callDuration"];
    v28 = [v7 decodeObjectOfClass:v12 from:v13];

    v32 = [v8 objectForKeyedSubscript:@"unseen"];
    NSUInteger v14 = [v8 objectForKeyedSubscript:@"callCapability"];
    uint64_t v30 = INCallCapabilityWithString(v14);

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v8 objectForKeyedSubscript:@"numberOfCalls"];
    uint64_t v27 = [v7 decodeObjectOfClass:v15 from:v16];

    unint64_t v17 = [v8 objectForKeyedSubscript:@"preferredCallProvider"];
    uint64_t v18 = INPreferredCallProviderWithString(v17);

    uint64_t v26 = [v8 objectForKeyedSubscript:@"providerId"];
    id v19 = [v8 objectForKeyedSubscript:@"providerBundleId"];
    id v20 = [v8 objectForKeyedSubscript:@"isCallerIdBlocked"];
    uint64_t v21 = objc_opt_class();
    id v22 = [v8 objectForKeyedSubscript:@"participants"];
    id v23 = [v7 decodeObjectsOfClass:v21 from:v22];

    id v24 = (void *)[[v34 alloc] initWithIdentifier:v31 dateCreated:v33 callRecordType:v29 callCapability:v30 callDuration:v28 unseen:v32 preferredCallProvider:v18 participants:v23 numberOfCalls:v27 providerId:v26 providerBundleId:v19 isCallerIdBlocked:v20];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen numberOfCalls:(NSNumber *)numberOfCalls
{
  return [(INCallRecord *)self initWithIdentifier:identifier dateCreated:dateCreated caller:caller callRecordType:callRecordType callCapability:callCapability callDuration:callDuration unseen:unseen numberOfCalls:numberOfCalls isCallerIdBlocked:0];
}

- (INCallRecord)initWithIdentifier:(NSString *)identifier dateCreated:(NSDate *)dateCreated caller:(INPerson *)caller callRecordType:(INCallRecordType)callRecordType callCapability:(INCallCapability)callCapability callDuration:(NSNumber *)callDuration unseen:(NSNumber *)unseen
{
  return [(INCallRecord *)self initWithIdentifier:identifier dateCreated:dateCreated caller:caller callRecordType:callRecordType callCapability:callCapability callDuration:callDuration unseen:unseen numberOfCalls:0 isCallerIdBlocked:0];
}

@end