@interface _INPBStartAudioCallIntent
+ (BOOL)supportsSecureCoding;
+ (Class)contactType;
+ (Class)targetContactsType;
- (BOOL)hasAudioRoute;
- (BOOL)hasCallRequestMetadata;
- (BOOL)hasDestinationType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPreferredCallProvider;
- (BOOL)hasRecordTypeForRedialing;
- (BOOL)hasTtyType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contacts;
- (NSArray)targetContacts;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBStartAudioCallIntent)initWithCoder:(id)a3;
- (_INPBStartCallRequestMetadata)callRequestMetadata;
- (id)audioRouteAsString:(int)a3;
- (id)contactAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)preferredCallProviderAsString:(int)a3;
- (id)recordTypeForRedialingAsString:(int)a3;
- (id)targetContactsAtIndex:(unint64_t)a3;
- (id)ttyTypeAsString:(int)a3;
- (int)StringAsAudioRoute:(id)a3;
- (int)StringAsDestinationType:(id)a3;
- (int)StringAsPreferredCallProvider:(id)a3;
- (int)StringAsRecordTypeForRedialing:(id)a3;
- (int)StringAsTTYType:(id)a3;
- (int)audioRoute;
- (int)destinationType;
- (int)preferredCallProvider;
- (int)recordTypeForRedialing;
- (int)ttyType;
- (unint64_t)contactsCount;
- (unint64_t)hash;
- (unint64_t)targetContactsCount;
- (void)addContact:(id)a3;
- (void)addTargetContacts:(id)a3;
- (void)clearContacts;
- (void)clearTargetContacts;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setCallRequestMetadata:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDestinationType:(int)a3;
- (void)setHasAudioRoute:(BOOL)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)setHasPreferredCallProvider:(BOOL)a3;
- (void)setHasRecordTypeForRedialing:(BOOL)a3;
- (void)setHasTtyType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPreferredCallProvider:(int)a3;
- (void)setRecordTypeForRedialing:(int)a3;
- (void)setTargetContacts:(id)a3;
- (void)setTtyType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartAudioCallIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContacts, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_storeStrong((id *)&self->_callRequestMetadata, 0);
}

- (int)ttyType
{
  return self->_ttyType;
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
}

- (int)recordTypeForRedialing
{
  return self->_recordTypeForRedialing;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
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

- (int)audioRoute
{
  return self->_audioRoute;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartAudioCallIntent *)self hasAudioRoute])
  {
    uint64_t v4 = [(_INPBStartAudioCallIntent *)self audioRoute];
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551BA78[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioRoute"];
  }
  v6 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"callRequestMetadata"];

  if ([(NSArray *)self->_contacts count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v9 = self->_contacts;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"contact"];
  }
  if ([(_INPBStartAudioCallIntent *)self hasDestinationType])
  {
    uint64_t v15 = [(_INPBStartAudioCallIntent *)self destinationType];
    if ((v15 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E551BA90[(v15 - 1)];
    }
    [v3 setObject:v16 forKeyedSubscript:@"destinationType"];
  }
  v17 = [(_INPBStartAudioCallIntent *)self intentMetadata];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBStartAudioCallIntent *)self hasPreferredCallProvider])
  {
    uint64_t v19 = [(_INPBStartAudioCallIntent *)self preferredCallProvider];
    if ((v19 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E551BAB8[(v19 - 2)];
    }
    [v3 setObject:v20 forKeyedSubscript:@"preferredCallProvider"];
  }
  if ([(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing])
  {
    uint64_t v21 = [(_INPBStartAudioCallIntent *)self recordTypeForRedialing];
    int v22 = v21 - 2;
    if (v21 - 2) < 9 && ((0x1EFu >> v22))
    {
      v23 = off_1E551BAD0[v22];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v23 forKeyedSubscript:@"recordTypeForRedialing"];
  }
  if ([(NSArray *)self->_targetContacts count])
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v25 = self->_targetContacts;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [*(id *)(*((void *)&v34 + 1) + 8 * j) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKeyedSubscript:@"targetContacts"];
  }
  if ([(_INPBStartAudioCallIntent *)self hasTtyType])
  {
    uint64_t v31 = [(_INPBStartAudioCallIntent *)self ttyType];
    if (v31 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E551BB18[v31];
    }
    [v3 setObject:v32 forKeyedSubscript:@"ttyType"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartAudioCallIntent *)self hasAudioRoute]) {
    uint64_t v3 = 2654435761 * self->_audioRoute;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata hash];
  uint64_t v5 = [(NSArray *)self->_contacts hash];
  if ([(_INPBStartAudioCallIntent *)self hasDestinationType]) {
    uint64_t v6 = 2654435761 * self->_destinationType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBStartAudioCallIntent *)self hasPreferredCallProvider]) {
    uint64_t v8 = 2654435761 * self->_preferredCallProvider;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing]) {
    uint64_t v9 = 2654435761 * self->_recordTypeForRedialing;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSArray *)self->_targetContacts hash];
  if ([(_INPBStartAudioCallIntent *)self hasTtyType]) {
    uint64_t v11 = 2654435761 * self->_ttyType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  int v5 = [(_INPBStartAudioCallIntent *)self hasAudioRoute];
  if (v5 != [v4 hasAudioRoute]) {
    goto LABEL_38;
  }
  if ([(_INPBStartAudioCallIntent *)self hasAudioRoute])
  {
    if ([v4 hasAudioRoute])
    {
      int audioRoute = self->_audioRoute;
      if (audioRoute != [v4 audioRoute]) {
        goto LABEL_38;
      }
    }
  }
  unint64_t v7 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];
  uint64_t v8 = [v4 callRequestMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_37;
  }
  uint64_t v9 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];
    uint64_t v12 = [v4 callRequestMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBStartAudioCallIntent *)self contacts];
  uint64_t v8 = [v4 contacts];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_37;
  }
  uint64_t v14 = [(_INPBStartAudioCallIntent *)self contacts];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    v16 = [(_INPBStartAudioCallIntent *)self contacts];
    v17 = [v4 contacts];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int v19 = [(_INPBStartAudioCallIntent *)self hasDestinationType];
  if (v19 != [v4 hasDestinationType]) {
    goto LABEL_38;
  }
  if ([(_INPBStartAudioCallIntent *)self hasDestinationType])
  {
    if ([v4 hasDestinationType])
    {
      int destinationType = self->_destinationType;
      if (destinationType != [v4 destinationType]) {
        goto LABEL_38;
      }
    }
  }
  unint64_t v7 = [(_INPBStartAudioCallIntent *)self intentMetadata];
  uint64_t v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_37;
  }
  uint64_t v21 = [(_INPBStartAudioCallIntent *)self intentMetadata];
  if (v21)
  {
    int v22 = (void *)v21;
    v23 = [(_INPBStartAudioCallIntent *)self intentMetadata];
    v24 = [v4 intentMetadata];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int v26 = [(_INPBStartAudioCallIntent *)self hasPreferredCallProvider];
  if (v26 != [v4 hasPreferredCallProvider]) {
    goto LABEL_38;
  }
  if ([(_INPBStartAudioCallIntent *)self hasPreferredCallProvider])
  {
    if ([v4 hasPreferredCallProvider])
    {
      int preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != [v4 preferredCallProvider]) {
        goto LABEL_38;
      }
    }
  }
  int v28 = [(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing];
  if (v28 != [v4 hasRecordTypeForRedialing]) {
    goto LABEL_38;
  }
  if ([(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing])
  {
    if ([v4 hasRecordTypeForRedialing])
    {
      int recordTypeForRedialing = self->_recordTypeForRedialing;
      if (recordTypeForRedialing != [v4 recordTypeForRedialing]) {
        goto LABEL_38;
      }
    }
  }
  unint64_t v7 = [(_INPBStartAudioCallIntent *)self targetContacts];
  uint64_t v8 = [v4 targetContacts];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v30 = [(_INPBStartAudioCallIntent *)self targetContacts];
  if (v30)
  {
    uint64_t v31 = (void *)v30;
    v32 = [(_INPBStartAudioCallIntent *)self targetContacts];
    v33 = [v4 targetContacts];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int v37 = [(_INPBStartAudioCallIntent *)self hasTtyType];
  if (v37 == [v4 hasTtyType])
  {
    if (![(_INPBStartAudioCallIntent *)self hasTtyType]
      || ![v4 hasTtyType]
      || (int ttyType = self->_ttyType, ttyType == [v4 ttyType]))
    {
      BOOL v35 = 1;
      goto LABEL_39;
    }
  }
LABEL_38:
  BOOL v35 = 0;
LABEL_39:

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBStartAudioCallIntent allocWithZone:](_INPBStartAudioCallIntent, "allocWithZone:") init];
  if ([(_INPBStartAudioCallIntent *)self hasAudioRoute]) {
    [(_INPBStartAudioCallIntent *)v5 setAudioRoute:[(_INPBStartAudioCallIntent *)self audioRoute]];
  }
  id v6 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata copyWithZone:a3];
  [(_INPBStartAudioCallIntent *)v5 setCallRequestMetadata:v6];

  unint64_t v7 = (void *)[(NSArray *)self->_contacts copyWithZone:a3];
  [(_INPBStartAudioCallIntent *)v5 setContacts:v7];

  if ([(_INPBStartAudioCallIntent *)self hasDestinationType]) {
    [(_INPBStartAudioCallIntent *)v5 setDestinationType:[(_INPBStartAudioCallIntent *)self destinationType]];
  }
  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBStartAudioCallIntent *)v5 setIntentMetadata:v8];

  if ([(_INPBStartAudioCallIntent *)self hasPreferredCallProvider]) {
    [(_INPBStartAudioCallIntent *)v5 setPreferredCallProvider:[(_INPBStartAudioCallIntent *)self preferredCallProvider]];
  }
  if ([(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing]) {
    [(_INPBStartAudioCallIntent *)v5 setRecordTypeForRedialing:[(_INPBStartAudioCallIntent *)self recordTypeForRedialing]];
  }
  uint64_t v9 = (void *)[(NSArray *)self->_targetContacts copyWithZone:a3];
  [(_INPBStartAudioCallIntent *)v5 setTargetContacts:v9];

  if ([(_INPBStartAudioCallIntent *)self hasTtyType]) {
    [(_INPBStartAudioCallIntent *)v5 setTtyType:[(_INPBStartAudioCallIntent *)self ttyType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartAudioCallIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartAudioCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartAudioCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartAudioCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartAudioCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBStartAudioCallIntent *)self hasAudioRoute]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];

  if (v5)
  {
    id v6 = [(_INPBStartAudioCallIntent *)self callRequestMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = self->_contacts;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  if ([(_INPBStartAudioCallIntent *)self hasDestinationType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v12 = [(_INPBStartAudioCallIntent *)self intentMetadata];

  if (v12)
  {
    int v13 = [(_INPBStartAudioCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBStartAudioCallIntent *)self hasPreferredCallProvider]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBStartAudioCallIntent *)self hasRecordTypeForRedialing]) {
    PBDataWriterWriteInt32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v14 = self->_targetContacts;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  if ([(_INPBStartAudioCallIntent *)self hasTtyType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartAudioCallIntentReadFrom(self, (uint64_t)a3);
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
    id v3 = off_1E551BB18[a3];
  }

  return v3;
}

- (void)setHasTtyType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTtyType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTtyType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int ttyType = a3;
  }
}

- (id)targetContactsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_targetContacts objectAtIndexedSubscript:a3];
}

- (unint64_t)targetContactsCount
{
  return [(NSArray *)self->_targetContacts count];
}

- (void)addTargetContacts:(id)a3
{
  id v4 = a3;
  targetContacts = self->_targetContacts;
  id v8 = v4;
  if (!targetContacts)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_targetContacts;
    self->_targetContacts = v6;

    id v4 = v8;
    targetContacts = self->_targetContacts;
  }
  [(NSArray *)targetContacts addObject:v4];
}

- (void)clearTargetContacts
{
}

- (void)setTargetContacts:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  targetContacts = self->_targetContacts;
  self->_targetContacts = v4;

  MEMORY[0x1F41817F8](v4, targetContacts);
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
    int v4 = off_1E551BAD0[v3];
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
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRecordTypeForRedialing
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRecordTypeForRedialing:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
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
    id v3 = off_1E551BAB8[a3 - 2];
  }

  return v3;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreferredCallProvider
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int preferredCallProvider = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
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
    id v3 = off_1E551BA90[a3 - 1];
  }

  return v3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDestinationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDestinationType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int destinationType = a3;
  }
}

- (id)contactAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contacts objectAtIndexedSubscript:a3];
}

- (unint64_t)contactsCount
{
  return [(NSArray *)self->_contacts count];
}

- (void)addContact:(id)a3
{
  id v4 = a3;
  contacts = self->_contacts;
  id v8 = v4;
  if (!contacts)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
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
    id v3 = off_1E551BA78[a3 - 2];
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

+ (Class)targetContactsType
{
  return (Class)objc_opt_class();
}

+ (Class)contactType
{
  return (Class)objc_opt_class();
}

@end