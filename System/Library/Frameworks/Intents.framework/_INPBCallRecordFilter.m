@interface _INPBCallRecordFilter
+ (BOOL)supportsSecureCoding;
+ (Class)participantsType;
- (BOOL)hasCallCapability;
- (BOOL)hasPreferredCallProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)participants;
- (_INPBCallRecordFilter)initWithCoder:(id)a3;
- (id)callCapabilityAsString:(int)a3;
- (id)callTypesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)participantsAtIndex:(unint64_t)a3;
- (id)preferredCallProviderAsString:(int)a3;
- (int)StringAsCallCapability:(id)a3;
- (int)StringAsCallTypes:(id)a3;
- (int)StringAsPreferredCallProvider:(id)a3;
- (int)callCapability;
- (int)callTypes;
- (int)callTypesAtIndex:(unint64_t)a3;
- (int)preferredCallProvider;
- (unint64_t)callTypesCount;
- (unint64_t)hash;
- (unint64_t)participantsCount;
- (void)addCallTypes:(int)a3;
- (void)addParticipants:(id)a3;
- (void)clearCallTypes;
- (void)clearParticipants;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCallCapability:(int)a3;
- (void)setCallTypes:(int *)a3 count:(unint64_t)a4;
- (void)setHasCallCapability:(BOOL)a3;
- (void)setHasPreferredCallProvider:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setPreferredCallProvider:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCallRecordFilter

- (void).cxx_destruct
{
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (NSArray)participants
{
  return self->_participants;
}

- (int)callCapability
{
  return self->_callCapability;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBCallRecordFilter *)self hasCallCapability])
  {
    uint64_t v4 = [(_INPBCallRecordFilter *)self callCapability];
    if (v4 == 1)
    {
      v5 = @"AUDIO_CALL";
    }
    else if (v4 == 2)
    {
      v5 = @"VIDEO_CALL";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKeyedSubscript:@"callCapability"];
  }
  if (self->_callTypes.count)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBCallRecordFilter callTypesCount](self, "callTypesCount"));
    if ([(_INPBCallRecordFilter *)self callTypesCount])
    {
      unint64_t v7 = 0;
      do
      {
        unsigned int v8 = self->_callTypes.list[v7] - 2;
        if (v8 < 9 && ((0x1EFu >> v8) & 1) != 0)
        {
          v9 = off_1E5520A80[v8];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_callTypes.list[v7]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v6 addObject:v9];

        ++v7;
      }
      while (v7 < [(_INPBCallRecordFilter *)self callTypesCount]);
    }
    [v3 setObject:v6 forKeyedSubscript:@"callTypes"];
  }
  if ([(NSArray *)self->_participants count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_participants;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"participants"];
  }
  if ([(_INPBCallRecordFilter *)self hasPreferredCallProvider])
  {
    uint64_t v17 = [(_INPBCallRecordFilter *)self preferredCallProvider];
    if ((v17 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5520AC8[(v17 - 2)];
    }
    [v3 setObject:v18 forKeyedSubscript:@"preferredCallProvider"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBCallRecordFilter *)self hasCallCapability]) {
    uint64_t v3 = 2654435761 * self->_callCapability;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = [(NSArray *)self->_participants hash];
  if ([(_INPBCallRecordFilter *)self hasPreferredCallProvider]) {
    uint64_t v6 = 2654435761 * self->_preferredCallProvider;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  int v5 = [(_INPBCallRecordFilter *)self hasCallCapability];
  if (v5 != [v4 hasCallCapability]) {
    goto LABEL_14;
  }
  if ([(_INPBCallRecordFilter *)self hasCallCapability])
  {
    if ([v4 hasCallCapability])
    {
      int callCapability = self->_callCapability;
      if (callCapability != [v4 callCapability]) {
        goto LABEL_14;
      }
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_14;
  }
  unint64_t v7 = [(_INPBCallRecordFilter *)self participants];
  unsigned int v8 = [v4 participants];
  v9 = v8;
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v10 = [(_INPBCallRecordFilter *)self participants];
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = [(_INPBCallRecordFilter *)self participants];
      uint64_t v13 = [v4 participants];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    int v15 = [(_INPBCallRecordFilter *)self hasPreferredCallProvider];
    if (v15 == [v4 hasPreferredCallProvider])
    {
      if (![(_INPBCallRecordFilter *)self hasPreferredCallProvider]
        || ![v4 hasPreferredCallProvider]
        || (int preferredCallProvider = self->_preferredCallProvider,
            preferredCallProvider == [v4 preferredCallProvider]))
      {
        BOOL v16 = 1;
        goto LABEL_15;
      }
    }
  }
  else
  {
  }
LABEL_14:
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBCallRecordFilter allocWithZone:](_INPBCallRecordFilter, "allocWithZone:") init];
  if ([(_INPBCallRecordFilter *)self hasCallCapability]) {
    [(_INPBCallRecordFilter *)v5 setCallCapability:[(_INPBCallRecordFilter *)self callCapability]];
  }
  PBRepeatedInt32Copy();
  uint64_t v6 = (void *)[(NSArray *)self->_participants copyWithZone:a3];
  [(_INPBCallRecordFilter *)v5 setParticipants:v6];

  if ([(_INPBCallRecordFilter *)self hasPreferredCallProvider]) {
    [(_INPBCallRecordFilter *)v5 setPreferredCallProvider:[(_INPBCallRecordFilter *)self preferredCallProvider]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCallRecordFilter *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCallRecordFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCallRecordFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCallRecordFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCallRecordFilter *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBCallRecordFilter *)self clearCallTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBCallRecordFilter;
  [(_INPBCallRecordFilter *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBCallRecordFilter *)self hasCallCapability]) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_callTypes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_callTypes.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_participants;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ([(_INPBCallRecordFilter *)self hasPreferredCallProvider]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCallRecordFilterReadFrom(self, (uint64_t)a3);
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
    id v3 = off_1E5520AC8[a3 - 2];
  }

  return v3;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredCallProvider
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
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

- (int)StringAsCallTypes:(id)a3
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

- (id)callTypesAsString:(int)a3
{
  int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    int v4 = off_1E5520A80[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (int)callTypesAtIndex:(unint64_t)a3
{
  return self->_callTypes.list[a3];
}

- (unint64_t)callTypesCount
{
  return self->_callTypes.count;
}

- (void)addCallTypes:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearCallTypes
{
}

- (int)callTypes
{
  return self->_callTypes.list;
}

- (void)setCallTypes:(int *)a3 count:(unint64_t)a4
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