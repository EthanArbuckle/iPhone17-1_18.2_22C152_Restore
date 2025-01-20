@interface _INPBStartCallIntent
+ (BOOL)supportsSecureCoding;
+ (Class)callGroupsType;
+ (Class)contactsType;
- (BOOL)hasAudioRoute;
- (BOOL)hasCallCapability;
- (BOOL)hasCallRecordFilter;
- (BOOL)hasCallRecordToCallBack;
- (BOOL)hasCallRequestMetadata;
- (BOOL)hasDestinationType;
- (BOOL)hasFaceTimeLink;
- (BOOL)hasIntentMetadata;
- (BOOL)hasIsGroupCall;
- (BOOL)hasNotificationThreadIdentifier;
- (BOOL)hasPreferredCallProvider;
- (BOOL)hasRecordTypeForRedialing;
- (BOOL)hasTtyType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupCall;
- (BOOL)readFrom:(id)a3;
- (NSArray)callGroups;
- (NSArray)contacts;
- (NSString)faceTimeLink;
- (NSString)notificationThreadIdentifier;
- (_INPBCallRecordFilter)callRecordFilter;
- (_INPBCallRecordValue)callRecordToCallBack;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBStartCallIntent)initWithCoder:(id)a3;
- (_INPBStartCallRequestMetadata)callRequestMetadata;
- (id)audioRouteAsString:(int)a3;
- (id)callCapabilityAsString:(int)a3;
- (id)callGroupsAtIndex:(unint64_t)a3;
- (id)contactsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)preferredCallProviderAsString:(int)a3;
- (id)recordTypeForRedialingAsString:(int)a3;
- (id)ttyTypeAsString:(int)a3;
- (int)StringAsAudioRoute:(id)a3;
- (int)StringAsCallCapability:(id)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsPreferredCallProvider:(id)a3;
- (int)StringAsRecordTypeForRedialing:(id)a3;
- (int)StringAsTTYType:(id)a3;
- (int)audioRoute;
- (int)callCapability;
- (int)destinationType;
- (int)preferredCallProvider;
- (int)recordTypeForRedialing;
- (int)ttyType;
- (unint64_t)callGroupsCount;
- (unint64_t)contactsCount;
- (unint64_t)hash;
- (void)addCallGroups:(id)a3;
- (void)addContacts:(id)a3;
- (void)clearCallGroups;
- (void)clearContacts;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setCallCapability:(int)a3;
- (void)setCallGroups:(id)a3;
- (void)setCallRecordFilter:(id)a3;
- (void)setCallRecordToCallBack:(id)a3;
- (void)setCallRequestMetadata:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setFaceTimeLink:(id)a3;
- (void)setHasAudioRoute:(BOOL)a3;
- (void)setHasCallCapability:(BOOL)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasIsGroupCall:(BOOL)a3;
- (void)setHasPreferredCallProvider:(BOOL)a3;
- (void)setHasRecordTypeForRedialing:(BOOL)a3;
- (void)setHasTtyType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setIsGroupCall:(BOOL)a3;
- (void)setNotificationThreadIdentifier:(id)a3;
- (void)setPreferredCallProvider:(int)a3;
- (void)setRecordTypeForRedialing:(int)a3;
- (void)setTtyType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartCallIntent

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_faceTimeLink, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_callRequestMetadata, 0);
  objc_storeStrong((id *)&self->_callRecordToCallBack, 0);
  objc_storeStrong((id *)&self->_callRecordFilter, 0);

  objc_storeStrong((id *)&self->_callGroups, 0);
}

- (int)ttyType
{
  return self->_ttyType;
}

- (int)recordTypeForRedialing
{
  return self->_recordTypeForRedialing;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSString)notificationThreadIdentifier
{
  return self->_notificationThreadIdentifier;
}

- (BOOL)isGroupCall
{
  return self->_isGroupCall;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)faceTimeLink
{
  return self->_faceTimeLink;
}

- (int)destinationType
{
  return self->_destinationType;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (_INPBStartCallRequestMetadata)callRequestMetadata
{
  return self->_callRequestMetadata;
}

- (_INPBCallRecordValue)callRecordToCallBack
{
  return self->_callRecordToCallBack;
}

- (_INPBCallRecordFilter)callRecordFilter
{
  return self->_callRecordFilter;
}

- (NSArray)callGroups
{
  return self->_callGroups;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartCallIntent *)self hasAudioRoute])
  {
    uint64_t v4 = [(_INPBStartCallIntent *)self audioRoute];
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551F4C8[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioRoute"];
  }
  if ([(_INPBStartCallIntent *)self hasCallCapability])
  {
    uint64_t v6 = [(_INPBStartCallIntent *)self callCapability];
    if (v6 == 1)
    {
      v7 = @"AUDIO_CALL";
    }
    else if (v6 == 2)
    {
      v7 = @"VIDEO_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKeyedSubscript:@"callCapability"];
  }
  if ([(NSArray *)self->_callGroups count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v9 = self->_callGroups;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"callGroups"];
  }
  v15 = [(_INPBStartCallIntent *)self callRecordFilter];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"callRecordFilter"];

  v17 = [(_INPBStartCallIntent *)self callRecordToCallBack];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"callRecordToCallBack"];

  v19 = [(_INPBStartCallIntent *)self callRequestMetadata];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"callRequestMetadata"];

  if ([(NSArray *)self->_contacts count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v22 = self->_contacts;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v45 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"contacts"];
  }
  if ([(_INPBStartCallIntent *)self hasDestinationType])
  {
    uint64_t v28 = [(_INPBStartCallIntent *)self destinationType];
    if ((v28 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E551F4E0[(v28 - 1)];
    }
    [v3 setObject:v29 forKeyedSubscript:@"destinationType"];
  }
  if (self->_faceTimeLink)
  {
    v30 = [(_INPBStartCallIntent *)self faceTimeLink];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"faceTimeLink"];
  }
  v32 = [(_INPBStartCallIntent *)self intentMetadata];
  v33 = [v32 dictionaryRepresentation];
  [v3 setObject:v33 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBStartCallIntent *)self hasIsGroupCall])
  {
    v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBStartCallIntent isGroupCall](self, "isGroupCall"));
    [v3 setObject:v34 forKeyedSubscript:@"isGroupCall"];
  }
  if (self->_notificationThreadIdentifier)
  {
    v35 = [(_INPBStartCallIntent *)self notificationThreadIdentifier];
    v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"notificationThreadIdentifier"];
  }
  if ([(_INPBStartCallIntent *)self hasPreferredCallProvider])
  {
    uint64_t v37 = [(_INPBStartCallIntent *)self preferredCallProvider];
    if ((v37 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E551F508[(v37 - 2)];
    }
    [v3 setObject:v38 forKeyedSubscript:@"preferredCallProvider"];
  }
  if ([(_INPBStartCallIntent *)self hasRecordTypeForRedialing])
  {
    uint64_t v39 = [(_INPBStartCallIntent *)self recordTypeForRedialing];
    int v40 = v39 - 2;
    if (v39 - 2) < 9 && ((0x1EFu >> v40))
    {
      v41 = off_1E551F520[v40];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v41 forKeyedSubscript:@"recordTypeForRedialing"];
  }
  if ([(_INPBStartCallIntent *)self hasTtyType])
  {
    uint64_t v42 = [(_INPBStartCallIntent *)self ttyType];
    if (v42 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E551F568[v42];
    }
    [v3 setObject:v43 forKeyedSubscript:@"ttyType"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartCallIntent *)self hasAudioRoute]) {
    uint64_t v18 = 2654435761 * self->_audioRoute;
  }
  else {
    uint64_t v18 = 0;
  }
  if ([(_INPBStartCallIntent *)self hasCallCapability]) {
    uint64_t v17 = 2654435761 * self->_callCapability;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v16 = [(NSArray *)self->_callGroups hash];
  unint64_t v15 = [(_INPBCallRecordFilter *)self->_callRecordFilter hash];
  unint64_t v14 = [(_INPBCallRecordValue *)self->_callRecordToCallBack hash];
  unint64_t v13 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata hash];
  uint64_t v3 = [(NSArray *)self->_contacts hash];
  if ([(_INPBStartCallIntent *)self hasDestinationType]) {
    uint64_t v4 = 2654435761 * self->_destinationType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_faceTimeLink hash];
  unint64_t v6 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBStartCallIntent *)self hasIsGroupCall]) {
    uint64_t v7 = 2654435761 * self->_isGroupCall;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_notificationThreadIdentifier hash];
  if ([(_INPBStartCallIntent *)self hasPreferredCallProvider]) {
    uint64_t v9 = 2654435761 * self->_preferredCallProvider;
  }
  else {
    uint64_t v9 = 0;
  }
  if ([(_INPBStartCallIntent *)self hasRecordTypeForRedialing]) {
    uint64_t v10 = 2654435761 * self->_recordTypeForRedialing;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBStartCallIntent *)self hasTtyType]) {
    uint64_t v11 = 2654435761 * self->_ttyType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  int v5 = [(_INPBStartCallIntent *)self hasAudioRoute];
  if (v5 != [v4 hasAudioRoute]) {
    goto LABEL_58;
  }
  if ([(_INPBStartCallIntent *)self hasAudioRoute])
  {
    if ([v4 hasAudioRoute])
    {
      int audioRoute = self->_audioRoute;
      if (audioRoute != [v4 audioRoute]) {
        goto LABEL_58;
      }
    }
  }
  int v7 = [(_INPBStartCallIntent *)self hasCallCapability];
  if (v7 != [v4 hasCallCapability]) {
    goto LABEL_58;
  }
  if ([(_INPBStartCallIntent *)self hasCallCapability])
  {
    if ([v4 hasCallCapability])
    {
      int callCapability = self->_callCapability;
      if (callCapability != [v4 callCapability]) {
        goto LABEL_58;
      }
    }
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self callGroups];
  uint64_t v10 = [v4 callGroups];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v11 = [(_INPBStartCallIntent *)self callGroups];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    unint64_t v13 = [(_INPBStartCallIntent *)self callGroups];
    unint64_t v14 = [v4 callGroups];
    int v15 = [v13 isEqual:v14];

    if (!v15) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self callRecordFilter];
  uint64_t v10 = [v4 callRecordFilter];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v16 = [(_INPBStartCallIntent *)self callRecordFilter];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [(_INPBStartCallIntent *)self callRecordFilter];
    v19 = [v4 callRecordFilter];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self callRecordToCallBack];
  uint64_t v10 = [v4 callRecordToCallBack];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v21 = [(_INPBStartCallIntent *)self callRecordToCallBack];
  if (v21)
  {
    v22 = (void *)v21;
    uint64_t v23 = [(_INPBStartCallIntent *)self callRecordToCallBack];
    uint64_t v24 = [v4 callRecordToCallBack];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self callRequestMetadata];
  uint64_t v10 = [v4 callRequestMetadata];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v26 = [(_INPBStartCallIntent *)self callRequestMetadata];
  if (v26)
  {
    v27 = (void *)v26;
    uint64_t v28 = [(_INPBStartCallIntent *)self callRequestMetadata];
    v29 = [v4 callRequestMetadata];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self contacts];
  uint64_t v10 = [v4 contacts];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v31 = [(_INPBStartCallIntent *)self contacts];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBStartCallIntent *)self contacts];
    v34 = [v4 contacts];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v36 = [(_INPBStartCallIntent *)self hasDestinationType];
  if (v36 != [v4 hasDestinationType]) {
    goto LABEL_58;
  }
  if ([(_INPBStartCallIntent *)self hasDestinationType])
  {
    if ([v4 hasDestinationType])
    {
      int destinationType = self->_destinationType;
      if (destinationType != [v4 destinationType]) {
        goto LABEL_58;
      }
    }
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self faceTimeLink];
  uint64_t v10 = [v4 faceTimeLink];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v38 = [(_INPBStartCallIntent *)self faceTimeLink];
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    int v40 = [(_INPBStartCallIntent *)self faceTimeLink];
    v41 = [v4 faceTimeLink];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self intentMetadata];
  uint64_t v10 = [v4 intentMetadata];
  if ((v9 == 0) == (v10 != 0)) {
    goto LABEL_57;
  }
  uint64_t v43 = [(_INPBStartCallIntent *)self intentMetadata];
  if (v43)
  {
    v44 = (void *)v43;
    long long v45 = [(_INPBStartCallIntent *)self intentMetadata];
    long long v46 = [v4 intentMetadata];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v48 = [(_INPBStartCallIntent *)self hasIsGroupCall];
  if (v48 != [v4 hasIsGroupCall]) {
    goto LABEL_58;
  }
  if ([(_INPBStartCallIntent *)self hasIsGroupCall])
  {
    if ([v4 hasIsGroupCall])
    {
      int isGroupCall = self->_isGroupCall;
      if (isGroupCall != [v4 isGroupCall]) {
        goto LABEL_58;
      }
    }
  }
  uint64_t v9 = [(_INPBStartCallIntent *)self notificationThreadIdentifier];
  uint64_t v10 = [v4 notificationThreadIdentifier];
  if ((v9 == 0) == (v10 != 0))
  {
LABEL_57:

    goto LABEL_58;
  }
  uint64_t v50 = [(_INPBStartCallIntent *)self notificationThreadIdentifier];
  if (v50)
  {
    long long v51 = (void *)v50;
    long long v52 = [(_INPBStartCallIntent *)self notificationThreadIdentifier];
    v53 = [v4 notificationThreadIdentifier];
    int v54 = [v52 isEqual:v53];

    if (!v54) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v57 = [(_INPBStartCallIntent *)self hasPreferredCallProvider];
  if (v57 == [v4 hasPreferredCallProvider])
  {
    if (![(_INPBStartCallIntent *)self hasPreferredCallProvider]
      || ![v4 hasPreferredCallProvider]
      || (int preferredCallProvider = self->_preferredCallProvider,
          preferredCallProvider == [v4 preferredCallProvider]))
    {
      int v59 = [(_INPBStartCallIntent *)self hasRecordTypeForRedialing];
      if (v59 == [v4 hasRecordTypeForRedialing])
      {
        if (![(_INPBStartCallIntent *)self hasRecordTypeForRedialing]
          || ![v4 hasRecordTypeForRedialing]
          || (int recordTypeForRedialing = self->_recordTypeForRedialing,
              recordTypeForRedialing == [v4 recordTypeForRedialing]))
        {
          int v61 = [(_INPBStartCallIntent *)self hasTtyType];
          if (v61 == [v4 hasTtyType])
          {
            if (![(_INPBStartCallIntent *)self hasTtyType]
              || ![v4 hasTtyType]
              || (int ttyType = self->_ttyType, ttyType == [v4 ttyType]))
            {
              BOOL v55 = 1;
              goto LABEL_59;
            }
          }
        }
      }
    }
  }
LABEL_58:
  BOOL v55 = 0;
LABEL_59:

  return v55;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBStartCallIntent allocWithZone:](_INPBStartCallIntent, "allocWithZone:") init];
  if ([(_INPBStartCallIntent *)self hasAudioRoute]) {
    [(_INPBStartCallIntent *)v5 setAudioRoute:[(_INPBStartCallIntent *)self audioRoute]];
  }
  if ([(_INPBStartCallIntent *)self hasCallCapability]) {
    [(_INPBStartCallIntent *)v5 setCallCapability:[(_INPBStartCallIntent *)self callCapability]];
  }
  unint64_t v6 = (void *)[(NSArray *)self->_callGroups copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setCallGroups:v6];

  id v7 = [(_INPBCallRecordFilter *)self->_callRecordFilter copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setCallRecordFilter:v7];

  id v8 = [(_INPBCallRecordValue *)self->_callRecordToCallBack copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setCallRecordToCallBack:v8];

  id v9 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setCallRequestMetadata:v9];

  uint64_t v10 = (void *)[(NSArray *)self->_contacts copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setContacts:v10];

  if ([(_INPBStartCallIntent *)self hasDestinationType]) {
    [(_INPBStartCallIntent *)v5 setDestinationType:[(_INPBStartCallIntent *)self destinationType]];
  }
  uint64_t v11 = (void *)[(NSString *)self->_faceTimeLink copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setFaceTimeLink:v11];

  id v12 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setIntentMetadata:v12];

  if ([(_INPBStartCallIntent *)self hasIsGroupCall]) {
    [(_INPBStartCallIntent *)v5 setIsGroupCall:[(_INPBStartCallIntent *)self isGroupCall]];
  }
  unint64_t v13 = (void *)[(NSString *)self->_notificationThreadIdentifier copyWithZone:a3];
  [(_INPBStartCallIntent *)v5 setNotificationThreadIdentifier:v13];

  if ([(_INPBStartCallIntent *)self hasPreferredCallProvider]) {
    [(_INPBStartCallIntent *)v5 setPreferredCallProvider:[(_INPBStartCallIntent *)self preferredCallProvider]];
  }
  if ([(_INPBStartCallIntent *)self hasRecordTypeForRedialing]) {
    [(_INPBStartCallIntent *)v5 setRecordTypeForRedialing:[(_INPBStartCallIntent *)self recordTypeForRedialing]];
  }
  if ([(_INPBStartCallIntent *)self hasTtyType]) {
    [(_INPBStartCallIntent *)v5 setTtyType:[(_INPBStartCallIntent *)self ttyType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartCallIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBStartCallIntent *)self hasAudioRoute]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartCallIntent *)self hasCallCapability]) {
    PBDataWriterWriteInt32Field();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v5 = self->_callGroups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_INPBStartCallIntent *)self callRecordFilter];

  if (v10)
  {
    uint64_t v11 = [(_INPBStartCallIntent *)self callRecordFilter];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBStartCallIntent *)self callRecordToCallBack];

  if (v12)
  {
    unint64_t v13 = [(_INPBStartCallIntent *)self callRecordToCallBack];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(_INPBStartCallIntent *)self callRequestMetadata];

  if (v14)
  {
    int v15 = [(_INPBStartCallIntent *)self callRequestMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = self->_contacts;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }

  if ([(_INPBStartCallIntent *)self hasDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v21 = [(_INPBStartCallIntent *)self faceTimeLink];

  if (v21) {
    PBDataWriterWriteStringField();
  }
  v22 = [(_INPBStartCallIntent *)self intentMetadata];

  if (v22)
  {
    uint64_t v23 = [(_INPBStartCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBStartCallIntent *)self hasIsGroupCall]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v24 = [(_INPBStartCallIntent *)self notificationThreadIdentifier];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBStartCallIntent *)self hasPreferredCallProvider]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartCallIntent *)self hasRecordTypeForRedialing]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartCallIntent *)self hasTtyType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsTTYType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Direct"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Relay"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)ttyTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551F568[a3];
  }

  return v3;
}

- (void)setHasTtyType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTtyType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTtyType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xBF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x40;
    self->_int ttyType = a3;
  }
}

- (int)StringAsRecordTypeForRedialing:(id)a3
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

- (id)recordTypeForRedialingAsString:(int)a3
{
  int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    int v4 = off_1E551F520[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasRecordTypeForRedialing:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRecordTypeForRedialing
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRecordTypeForRedialing:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int recordTypeForRedialing = a3;
  }
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

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551F508[a3 - 2];
  }

  return v3;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPreferredCallProvider
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int preferredCallProvider = a3;
  }
}

- (BOOL)hasNotificationThreadIdentifier
{
  return self->_notificationThreadIdentifier != 0;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  notificationThreadIdentifier = self->_notificationThreadIdentifier;
  self->_notificationThreadIdentifier = v4;

  MEMORY[0x1F41817F8](v4, notificationThreadIdentifier);
}

- (void)setHasIsGroupCall:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsGroupCall
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsGroupCall:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isGroupCall = a3;
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasFaceTimeLink
{
  return self->_faceTimeLink != 0;
}

- (void)setFaceTimeLink:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  faceTimeLink = self->_faceTimeLink;
  self->_faceTimeLink = v4;

  MEMORY[0x1F41817F8](v4, faceTimeLink);
}

- (int)StringAsDestinationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NORMAL_DESTINATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_DESTINATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VOICEMAIL_DESTINATION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REDIAL_DESTINATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CALL_BACK_DESTINATION"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)destinationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551F4E0[a3 - 1];
  }

  return v3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDestinationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDestinationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int destinationType = a3;
  }
}

- (id)contactsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contacts objectAtIndexedSubscript:a3];
}

- (unint64_t)contactsCount
{
  return [(NSArray *)self->_contacts count];
}

- (void)addContacts:(id)a3
{
  id v4 = a3;
  contacts = self->_contacts;
  id v8 = v4;
  if (!contacts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contacts;
    self->_contacts = v6;

    id v4 = v8;
    contacts = self->_contacts;
  }
  [(NSArray *)contacts addObject:v4];
}

- (void)clearContacts
{
}

- (void)setContacts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  contacts = self->_contacts;
  self->_contacts = v4;

  MEMORY[0x1F41817F8](v4, contacts);
}

- (BOOL)hasCallRequestMetadata
{
  return self->_callRequestMetadata != 0;
}

- (void)setCallRequestMetadata:(id)a3
{
}

- (BOOL)hasCallRecordToCallBack
{
  return self->_callRecordToCallBack != 0;
}

- (void)setCallRecordToCallBack:(id)a3
{
}

- (BOOL)hasCallRecordFilter
{
  return self->_callRecordFilter != 0;
}

- (void)setCallRecordFilter:(id)a3
{
}

- (id)callGroupsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_callGroups objectAtIndexedSubscript:a3];
}

- (unint64_t)callGroupsCount
{
  return [(NSArray *)self->_callGroups count];
}

- (void)addCallGroups:(id)a3
{
  id v4 = a3;
  callGroups = self->_callGroups;
  id v8 = v4;
  if (!callGroups)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_callGroups;
    self->_callGroups = v6;

    id v4 = v8;
    callGroups = self->_callGroups;
  }
  [(NSArray *)callGroups addObject:v4];
}

- (void)clearCallGroups
{
}

- (void)setCallGroups:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  callGroups = self->_callGroups;
  self->_callGroups = v4;

  MEMORY[0x1F41817F8](v4, callGroups);
}

- (id)callCapabilityAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"AUDIO_CALL";
  }
  else if (a3 == 2)
  {
    id v4 = @"VIDEO_CALL";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasCallCapability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCallCapability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCallCapability:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int callCapability = a3;
  }
}

- (int)StringAsAudioRoute:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SPEAKERPHONE_AUDIO_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BLUETOOTH_AUDIO_ROUTE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HEY_SIRI_AUDIO_ROUTE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 2;
  }

  return v4;
}

- (id)audioRouteAsString:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551F4C8[a3 - 2];
  }

  return v3;
}

- (void)setHasAudioRoute:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAudioRoute:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int audioRoute = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)contactsType
{
  return (Class)objc_opt_class();
}

+ (Class)callGroupsType
{
  return (Class)objc_opt_class();
}

@end