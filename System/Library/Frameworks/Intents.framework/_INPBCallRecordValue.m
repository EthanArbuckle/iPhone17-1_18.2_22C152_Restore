@interface _INPBCallRecordValue
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasCallCapability;
- (BOOL)hasCallMetrics;
- (BOOL)hasCallType;
- (BOOL)hasCaller;
- (BOOL)hasDateCreated;
- (BOOL)hasIdentifier;
- (BOOL)hasIsCallerIdBlocked;
- (BOOL)hasNumberOfCalls;
- (BOOL)hasPreferredCallProvider;
- (BOOL)hasProviderBundleId;
- (BOOL)hasProviderId;
- (BOOL)hasUnseen;
- (BOOL)isCallerIdBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unseen;
- (NSArray)participants;
- (NSString)identifier;
- (NSString)providerBundleId;
- (NSString)providerId;
- (_INPBCallMetrics)callMetrics;
- (_INPBCallRecordValue)initWithCoder:(id)a3;
- (_INPBContactValue)caller;
- (_INPBDateTime)dateCreated;
- (_INPBInteger)numberOfCalls;
- (id)callCapabilityAsString:(int)a3;
- (id)callTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (id)preferredCallProviderAsString:(int)a3;
- (int)StringAsCallCapability:(id)a3;
- (int)StringAsCallType:(id)a3;
- (int)StringAsPreferredCallProvider:(id)a3;
- (int)callCapability;
- (int)callType;
- (int)preferredCallProvider;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addParticipants:(id)a3;
- (void)clearParticipants;
- (void)encodeWithCoder:(id)a3;
- (void)setCallCapability:(int)a3;
- (void)setCallMetrics:(id)a3;
- (void)setCallType:(int)a3;
- (void)setCaller:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setHasCallCapability:(BOOL)a3;
- (void)setHasCallType:(BOOL)a3;
- (void)setHasIsCallerIdBlocked:(BOOL)a3;
- (void)setHasPreferredCallProvider:(BOOL)a3;
- (void)setHasUnseen:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCallerIdBlocked:(BOOL)a3;
- (void)setNumberOfCalls:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPreferredCallProvider:(int)a3;
- (void)setProviderBundleId:(id)a3;
- (void)setProviderId:(id)a3;
- (void)setUnseen:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallRecordValue

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setHasCallType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBCallRecordValue *)self hasCallCapability]) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(_INPBCallRecordValue *)self callMetrics];

  if (v5)
  {
    v6 = [(_INPBCallRecordValue *)self callMetrics];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBCallRecordValue *)self hasCallType]) {
    PBDataWriterWriteInt32Field();
  }
  v7 = [(_INPBCallRecordValue *)self caller];

  if (v7)
  {
    v8 = [(_INPBCallRecordValue *)self caller];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBCallRecordValue *)self dateCreated];

  if (v9)
  {
    v10 = [(_INPBCallRecordValue *)self dateCreated];
    PBDataWriterWriteSubmessage();
  }
  v11 = [(_INPBCallRecordValue *)self identifier];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBCallRecordValue *)self hasIsCallerIdBlocked]) {
    PBDataWriterWriteBOOLField();
  }
  v12 = [(_INPBCallRecordValue *)self numberOfCalls];

  if (v12)
  {
    v13 = [(_INPBCallRecordValue *)self numberOfCalls];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_participants;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  if ([(_INPBCallRecordValue *)self hasPreferredCallProvider]) {
    PBDataWriterWriteInt32Field();
  }
  v19 = [(_INPBCallRecordValue *)self providerBundleId];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  v20 = [(_INPBCallRecordValue *)self providerId];

  if (v20) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBCallRecordValue *)self hasUnseen]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  int v5 = [(_INPBCallRecordValue *)self hasCallCapability];
  if (v5 != [v4 hasCallCapability]) {
    goto LABEL_58;
  }
  if ([(_INPBCallRecordValue *)self hasCallCapability])
  {
    if ([v4 hasCallCapability])
    {
      int callCapability = self->_callCapability;
      if (callCapability != [v4 callCapability]) {
        goto LABEL_58;
      }
    }
  }
  v7 = [(_INPBCallRecordValue *)self callMetrics];
  v8 = [v4 callMetrics];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v9 = [(_INPBCallRecordValue *)self callMetrics];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBCallRecordValue *)self callMetrics];
    v12 = [v4 callMetrics];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v14 = [(_INPBCallRecordValue *)self hasCallType];
  if (v14 != [v4 hasCallType]) {
    goto LABEL_58;
  }
  if ([(_INPBCallRecordValue *)self hasCallType])
  {
    if ([v4 hasCallType])
    {
      int callType = self->_callType;
      if (callType != [v4 callType]) {
        goto LABEL_58;
      }
    }
  }
  v7 = [(_INPBCallRecordValue *)self caller];
  v8 = [v4 caller];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v16 = [(_INPBCallRecordValue *)self caller];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [(_INPBCallRecordValue *)self caller];
    v19 = [v4 caller];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  v7 = [(_INPBCallRecordValue *)self dateCreated];
  v8 = [v4 dateCreated];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v21 = [(_INPBCallRecordValue *)self dateCreated];
  if (v21)
  {
    long long v22 = (void *)v21;
    long long v23 = [(_INPBCallRecordValue *)self dateCreated];
    long long v24 = [v4 dateCreated];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  v7 = [(_INPBCallRecordValue *)self identifier];
  v8 = [v4 identifier];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v26 = [(_INPBCallRecordValue *)self identifier];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBCallRecordValue *)self identifier];
    v29 = [v4 identifier];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v31 = [(_INPBCallRecordValue *)self hasIsCallerIdBlocked];
  if (v31 != [v4 hasIsCallerIdBlocked]) {
    goto LABEL_58;
  }
  if ([(_INPBCallRecordValue *)self hasIsCallerIdBlocked])
  {
    if ([v4 hasIsCallerIdBlocked])
    {
      int isCallerIdBlocked = self->_isCallerIdBlocked;
      if (isCallerIdBlocked != [v4 isCallerIdBlocked]) {
        goto LABEL_58;
      }
    }
  }
  v7 = [(_INPBCallRecordValue *)self numberOfCalls];
  v8 = [v4 numberOfCalls];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v33 = [(_INPBCallRecordValue *)self numberOfCalls];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_INPBCallRecordValue *)self numberOfCalls];
    v36 = [v4 numberOfCalls];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  v7 = [(_INPBCallRecordValue *)self participants];
  v8 = [v4 participants];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v38 = [(_INPBCallRecordValue *)self participants];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(_INPBCallRecordValue *)self participants];
    v41 = [v4 participants];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v43 = [(_INPBCallRecordValue *)self hasPreferredCallProvider];
  if (v43 != [v4 hasPreferredCallProvider]) {
    goto LABEL_58;
  }
  if ([(_INPBCallRecordValue *)self hasPreferredCallProvider])
  {
    if ([v4 hasPreferredCallProvider])
    {
      int preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != [v4 preferredCallProvider]) {
        goto LABEL_58;
      }
    }
  }
  v7 = [(_INPBCallRecordValue *)self providerBundleId];
  v8 = [v4 providerBundleId];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_57;
  }
  uint64_t v45 = [(_INPBCallRecordValue *)self providerBundleId];
  if (v45)
  {
    v46 = (void *)v45;
    v47 = [(_INPBCallRecordValue *)self providerBundleId];
    v48 = [v4 providerBundleId];
    int v49 = [v47 isEqual:v48];

    if (!v49) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  v7 = [(_INPBCallRecordValue *)self providerId];
  v8 = [v4 providerId];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_57:

    goto LABEL_58;
  }
  uint64_t v50 = [(_INPBCallRecordValue *)self providerId];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(_INPBCallRecordValue *)self providerId];
    v53 = [v4 providerId];
    int v54 = [v52 isEqual:v53];

    if (!v54) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v57 = [(_INPBCallRecordValue *)self hasUnseen];
  if (v57 == [v4 hasUnseen])
  {
    if (![(_INPBCallRecordValue *)self hasUnseen]
      || ![v4 hasUnseen]
      || (int unseen = self->_unseen, unseen == [v4 unseen]))
    {
      BOOL v55 = 1;
      goto LABEL_59;
    }
  }
LABEL_58:
  BOOL v55 = 0;
LABEL_59:

  return v55;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCallRecordValue *)self hasCallCapability])
  {
    uint64_t v4 = [(_INPBCallRecordValue *)self callCapability];
    if (v4 == 1)
    {
      int v5 = @"AUDIO_CALL";
    }
    else if (v4 == 2)
    {
      int v5 = @"VIDEO_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"callCapability"];
  }
  v6 = [(_INPBCallRecordValue *)self callMetrics];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"callMetrics"];

  if ([(_INPBCallRecordValue *)self hasCallType])
  {
    uint64_t v8 = [(_INPBCallRecordValue *)self callType];
    int v9 = v8 - 2;
    if (v8 - 2) < 9 && ((0x1EFu >> v9))
    {
      v10 = off_1E551C758[v9];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v10 forKeyedSubscript:@"callType"];
  }
  v11 = [(_INPBCallRecordValue *)self caller];
  v12 = [v11 dictionaryRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"caller"];

  int v13 = [(_INPBCallRecordValue *)self dateCreated];
  int v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"dateCreated"];

  if (self->_identifier)
  {
    uint64_t v15 = [(_INPBCallRecordValue *)self identifier];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"identifier"];
  }
  if ([(_INPBCallRecordValue *)self hasIsCallerIdBlocked])
  {
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCallRecordValue isCallerIdBlocked](self, "isCallerIdBlocked"));
    [v3 setObject:v17 forKeyedSubscript:@"isCallerIdBlocked"];
  }
  uint64_t v18 = [(_INPBCallRecordValue *)self numberOfCalls];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"numberOfCalls"];

  if ([(NSArray *)self->_participants count])
  {
    int v20 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v21 = self->_participants;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"participants"];
  }
  if ([(_INPBCallRecordValue *)self hasPreferredCallProvider])
  {
    uint64_t v27 = [(_INPBCallRecordValue *)self preferredCallProvider];
    if ((v27 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E551C7A0[(v27 - 2)];
    }
    [v3 setObject:v28 forKeyedSubscript:@"preferredCallProvider"];
  }
  if (self->_providerBundleId)
  {
    v29 = [(_INPBCallRecordValue *)self providerBundleId];
    int v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"providerBundleId"];
  }
  if (self->_providerId)
  {
    int v31 = [(_INPBCallRecordValue *)self providerId];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"providerId"];
  }
  if ([(_INPBCallRecordValue *)self hasUnseen])
  {
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBCallRecordValue unseen](self, "unseen"));
    [v3 setObject:v33 forKeyedSubscript:@"unseen"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCallRecordValue *)self hasCallCapability]) {
    uint64_t v16 = 2654435761 * self->_callCapability;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v15 = [(_INPBCallMetrics *)self->_callMetrics hash];
  if ([(_INPBCallRecordValue *)self hasCallType]) {
    uint64_t v14 = 2654435761 * self->_callType;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v13 = [(_INPBContactValue *)self->_caller hash];
  unint64_t v3 = [(_INPBDateTime *)self->_dateCreated hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  if ([(_INPBCallRecordValue *)self hasIsCallerIdBlocked]) {
    uint64_t v5 = 2654435761 * self->_isCallerIdBlocked;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_INPBInteger *)self->_numberOfCalls hash];
  uint64_t v7 = [(NSArray *)self->_participants hash];
  if ([(_INPBCallRecordValue *)self hasPreferredCallProvider]) {
    uint64_t v8 = 2654435761 * self->_preferredCallProvider;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_providerBundleId hash];
  NSUInteger v10 = [(NSString *)self->_providerId hash];
  if ([(_INPBCallRecordValue *)self hasUnseen]) {
    uint64_t v11 = 2654435761 * self->_unseen;
  }
  else {
    uint64_t v11 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v3 = off_1E551C7A0[a3 - 2];
  }

  return v3;
}

- (id)callTypeAsString:(int)a3
{
  int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    NSUInteger v4 = off_1E551C758[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    NSUInteger v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  participants = self->_participants;
  id v8 = v4;
  if (!participants)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_participants;
    self->_participants = v6;

    id v4 = v8;
    participants = self->_participants;
  }
  [(NSArray *)participants addObject:v4];
}

- (_INPBCallRecordValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  unint64_t v6 = (_INPBCallRecordValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        unint64_t v6 = (_INPBCallRecordValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallRecordValue *)self initWithData:v6];

    unint64_t v6 = self;
  }

  return v6;
}

- (int)StringAsPreferredCallProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TELEPHONY_PROVIDER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FACETIME_PROVIDER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THIRD_PARTY_PROVIDER"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_providerBundleId, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_numberOfCalls, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_caller, 0);

  objc_storeStrong((id *)&self->_callMetrics, 0);
}

- (BOOL)unseen
{
  return self->_unseen;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (NSString)providerBundleId
{
  return self->_providerBundleId;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSArray)participants
{
  return self->_participants;
}

- (_INPBInteger)numberOfCalls
{
  return self->_numberOfCalls;
}

- (BOOL)isCallerIdBlocked
{
  return self->_isCallerIdBlocked;
}

- (_INPBDateTime)dateCreated
{
  return self->_dateCreated;
}

- (_INPBContactValue)caller
{
  return self->_caller;
}

- (int)callType
{
  return self->_callType;
}

- (_INPBCallMetrics)callMetrics
{
  return self->_callMetrics;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBCallRecordValue allocWithZone:](_INPBCallRecordValue, "allocWithZone:") init];
  if ([(_INPBCallRecordValue *)self hasCallCapability]) {
    [(_INPBCallRecordValue *)v5 setCallCapability:[(_INPBCallRecordValue *)self callCapability]];
  }
  id v6 = [(_INPBCallMetrics *)self->_callMetrics copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setCallMetrics:v6];

  if ([(_INPBCallRecordValue *)self hasCallType]) {
    [(_INPBCallRecordValue *)v5 setCallType:[(_INPBCallRecordValue *)self callType]];
  }
  id v7 = [(_INPBContactValue *)self->_caller copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setCaller:v7];

  id v8 = [(_INPBDateTime *)self->_dateCreated copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setDateCreated:v8];

  NSUInteger v9 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setIdentifier:v9];

  if ([(_INPBCallRecordValue *)self hasIsCallerIdBlocked]) {
    [(_INPBCallRecordValue *)v5 setIsCallerIdBlocked:[(_INPBCallRecordValue *)self isCallerIdBlocked]];
  }
  id v10 = [(_INPBInteger *)self->_numberOfCalls copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setNumberOfCalls:v10];

  uint64_t v11 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setParticipants:v11];

  if ([(_INPBCallRecordValue *)self hasPreferredCallProvider]) {
    [(_INPBCallRecordValue *)v5 setPreferredCallProvider:[(_INPBCallRecordValue *)self preferredCallProvider]];
  }
  v12 = (void *)[(NSString *)self->_providerBundleId copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setProviderBundleId:v12];

  unint64_t v13 = (void *)[(NSString *)self->_providerId copyWithZone:a3];
  [(_INPBCallRecordValue *)v5 setProviderId:v13];

  if ([(_INPBCallRecordValue *)self hasUnseen]) {
    [(_INPBCallRecordValue *)v5 setUnseen:[(_INPBCallRecordValue *)self unseen]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallRecordValue *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallRecordValueReadFrom(self, (uint64_t)a3);
}

- (void)setHasUnseen:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUnseen
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUnseen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int unseen = a3;
}

- (BOOL)hasProviderId
{
  return self->_providerId != 0;
}

- (void)setProviderId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  providerId = self->_providerId;
  self->_providerId = v4;

  MEMORY[0x1F41817F8](v4, providerId);
}

- (BOOL)hasProviderBundleId
{
  return self->_providerBundleId != 0;
}

- (void)setProviderBundleId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  providerBundleId = self->_providerBundleId;
  self->_providerBundleId = v4;

  MEMORY[0x1F41817F8](v4, providerBundleId);
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredCallProvider
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int preferredCallProvider = a3;
  }
}

- (id)participantsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_participants objectAtIndexedSubscript:a3];
}

- (unint64_t)participantsCount
{
  return [(NSArray *)self->_participants count];
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

- (BOOL)hasNumberOfCalls
{
  return self->_numberOfCalls != 0;
}

- (void)setNumberOfCalls:(id)a3
{
}

- (void)setHasIsCallerIdBlocked:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsCallerIdBlocked
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsCallerIdBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isCallerIdBlocked = a3;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setDateCreated:(id)a3
{
}

- (BOOL)hasCaller
{
  return self->_caller != 0;
}

- (void)setCaller:(id)a3
{
}

- (int)StringAsCallType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OUTGOING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MISSED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RECEIVED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LATEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VOICEMAIL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RINGING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"IN_PROGRESS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ON_HOLD"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (BOOL)hasCallType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCallType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int callType = a3;
  }
}

- (BOOL)hasCallMetrics
{
  return self->_callMetrics != 0;
}

- (void)setCallMetrics:(id)a3
{
}

- (int)StringAsCallCapability:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"AUDIO_CALL"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"VIDEO_CALL"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)callCapabilityAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"AUDIO_CALL";
  }
  else if (a3 == 2)
  {
    int v4 = @"VIDEO_CALL";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasCallCapability:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallCapability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCallCapability:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int callCapability = a3;
  }
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