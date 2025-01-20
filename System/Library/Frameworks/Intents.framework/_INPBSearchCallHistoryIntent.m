@interface _INPBSearchCallHistoryIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCallType;
- (BOOL)hasDateCreated;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPreferredCallProvider;
- (BOOL)hasRecipient;
- (BOOL)hasTargetContact;
- (BOOL)hasUnseen;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unseen;
- (_INPBContact)recipient;
- (_INPBContact)targetContact;
- (_INPBDateTimeRange)dateCreated;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchCallHistoryIntent)initWithCoder:(id)a3;
- (id)callCapabilitiesAsString:(int)a3;
- (id)callTypeAsString:(int)a3;
- (id)callTypesAsString:(int)a3;
- (id)capabilitiesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)preferredCallProviderAsString:(int)a3;
- (int)StringAsCallCapabilities:(id)a3;
- (int)StringAsCallType:(id)a3;
- (int)StringAsCallTypes:(id)a3;
- (int)StringAsCapabilities:(id)a3;
- (int)StringAsPreferredCallProvider:(id)a3;
- (int)callCapabilities;
- (int)callCapabilitiesAtIndex:(unint64_t)a3;
- (int)callType;
- (int)callTypes;
- (int)callTypesAtIndex:(unint64_t)a3;
- (int)capabilities;
- (int)capabilitiesAtIndex:(unint64_t)a3;
- (int)preferredCallProvider;
- (unint64_t)callCapabilitiesCount;
- (unint64_t)callTypesCount;
- (unint64_t)capabilitiesCount;
- (unint64_t)hash;
- (void)addCallCapabilities:(int)a3;
- (void)addCallTypes:(int)a3;
- (void)addCapabilities:(int)a3;
- (void)clearCallCapabilities;
- (void)clearCallTypes;
- (void)clearCapabilities;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCallCapabilities:(int *)a3 count:(unint64_t)a4;
- (void)setCallType:(int)a3;
- (void)setCallTypes:(int *)a3 count:(unint64_t)a4;
- (void)setCapabilities:(int *)a3 count:(unint64_t)a4;
- (void)setDateCreated:(id)a3;
- (void)setHasCallType:(BOOL)a3;
- (void)setHasPreferredCallProvider:(BOOL)a3;
- (void)setHasUnseen:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPreferredCallProvider:(int)a3;
- (void)setRecipient:(id)a3;
- (void)setTargetContact:(id)a3;
- (void)setUnseen:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchCallHistoryIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContact, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_dateCreated, 0);
}

- (BOOL)unseen
{
  return self->_unseen;
}

- (_INPBContact)targetContact
{
  return self->_targetContact;
}

- (_INPBContact)recipient
{
  return self->_recipient;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (int)callType
{
  return self->_callType;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_callCapabilities.count)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent callCapabilitiesCount](self, "callCapabilitiesCount"));
    if ([(_INPBSearchCallHistoryIntent *)self callCapabilitiesCount])
    {
      unint64_t v5 = 0;
      do
      {
        int v6 = self->_callCapabilities.list[v5];
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
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_callCapabilities.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v4 addObject:v7];

        ++v5;
      }
      while (v5 < [(_INPBSearchCallHistoryIntent *)self callCapabilitiesCount]);
    }
    [v3 setObject:v4 forKeyedSubscript:@"callCapabilities"];
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasCallType])
  {
    uint64_t v8 = [(_INPBSearchCallHistoryIntent *)self callType];
    int v9 = v8 - 2;
    if (v8 - 2) < 9 && ((0x1EFu >> v9))
    {
      v10 = off_1E551AF00[v9];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v10 forKeyedSubscript:@"callType"];
  }
  if (self->_callTypes.count)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent callTypesCount](self, "callTypesCount"));
    if ([(_INPBSearchCallHistoryIntent *)self callTypesCount])
    {
      unint64_t v12 = 0;
      do
      {
        unsigned int v13 = self->_callTypes.list[v12] - 2;
        if (v13 < 9 && ((0x1EFu >> v13) & 1) != 0)
        {
          v14 = off_1E551AF00[v13];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_callTypes.list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < [(_INPBSearchCallHistoryIntent *)self callTypesCount]);
    }
    [v3 setObject:v11 forKeyedSubscript:@"callTypes"];
  }
  if (self->_capabilities.count)
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent capabilitiesCount](self, "capabilitiesCount"));
    if ([(_INPBSearchCallHistoryIntent *)self capabilitiesCount])
    {
      unint64_t v16 = 0;
      do
      {
        int v17 = self->_capabilities.list[v16];
        if (v17 == 1)
        {
          v18 = @"AUDIO_CALL";
        }
        else if (v17 == 2)
        {
          v18 = @"VIDEO_CALL";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_capabilities.list[v16]);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v15 addObject:v18];

        ++v16;
      }
      while (v16 < [(_INPBSearchCallHistoryIntent *)self capabilitiesCount]);
    }
    [v3 setObject:v15 forKeyedSubscript:@"capabilities"];
  }
  v19 = [(_INPBSearchCallHistoryIntent *)self dateCreated];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"dateCreated"];

  v21 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider])
  {
    uint64_t v23 = [(_INPBSearchCallHistoryIntent *)self preferredCallProvider];
    if ((v23 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E551AF48[(v23 - 2)];
    }
    [v3 setObject:v24 forKeyedSubscript:@"preferredCallProvider"];
  }
  v25 = [(_INPBSearchCallHistoryIntent *)self recipient];
  v26 = [v25 dictionaryRepresentation];
  [v3 setObject:v26 forKeyedSubscript:@"recipient"];

  v27 = [(_INPBSearchCallHistoryIntent *)self targetContact];
  v28 = [v27 dictionaryRepresentation];
  [v3 setObject:v28 forKeyedSubscript:@"targetContact"];

  if ([(_INPBSearchCallHistoryIntent *)self hasUnseen])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSearchCallHistoryIntent unseen](self, "unseen"));
    [v3 setObject:v29 forKeyedSubscript:@"unseen"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v13 = PBRepeatedInt32Hash();
  if ([(_INPBSearchCallHistoryIntent *)self hasCallType]) {
    uint64_t v3 = 2654435761 * self->_callType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = PBRepeatedInt32Hash();
  unint64_t v6 = [(_INPBDateTimeRange *)self->_dateCreated hash];
  unint64_t v7 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider]) {
    uint64_t v8 = 2654435761 * self->_preferredCallProvider;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(_INPBContact *)self->_recipient hash];
  unint64_t v10 = [(_INPBContact *)self->_targetContact hash];
  if ([(_INPBSearchCallHistoryIntent *)self hasUnseen]) {
    uint64_t v11 = 2654435761 * self->_unseen;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_33;
  }
  int v5 = [(_INPBSearchCallHistoryIntent *)self hasCallType];
  if (v5 != [v4 hasCallType]) {
    goto LABEL_33;
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasCallType])
  {
    if ([v4 hasCallType])
    {
      int callType = self->_callType;
      if (callType != [v4 callType]) {
        goto LABEL_33;
      }
    }
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_33;
  }
  unint64_t v7 = [(_INPBSearchCallHistoryIntent *)self dateCreated];
  uint64_t v8 = [v4 dateCreated];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_32;
  }
  uint64_t v9 = [(_INPBSearchCallHistoryIntent *)self dateCreated];
  if (v9)
  {
    unint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBSearchCallHistoryIntent *)self dateCreated];
    unint64_t v12 = [v4 dateCreated];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];
  uint64_t v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_32;
  }
  uint64_t v14 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];
  if (v14)
  {
    v15 = (void *)v14;
    unint64_t v16 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];
    int v17 = [v4 intentMetadata];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  int v19 = [(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider];
  if (v19 != [v4 hasPreferredCallProvider]) {
    goto LABEL_33;
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider])
  {
    if ([v4 hasPreferredCallProvider])
    {
      int preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != [v4 preferredCallProvider]) {
        goto LABEL_33;
      }
    }
  }
  unint64_t v7 = [(_INPBSearchCallHistoryIntent *)self recipient];
  uint64_t v8 = [v4 recipient];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_32;
  }
  uint64_t v21 = [(_INPBSearchCallHistoryIntent *)self recipient];
  if (v21)
  {
    v22 = (void *)v21;
    uint64_t v23 = [(_INPBSearchCallHistoryIntent *)self recipient];
    v24 = [v4 recipient];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  unint64_t v7 = [(_INPBSearchCallHistoryIntent *)self targetContact];
  uint64_t v8 = [v4 targetContact];
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v26 = [(_INPBSearchCallHistoryIntent *)self targetContact];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(_INPBSearchCallHistoryIntent *)self targetContact];
    v29 = [v4 targetContact];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  int v33 = [(_INPBSearchCallHistoryIntent *)self hasUnseen];
  if (v33 == [v4 hasUnseen])
  {
    if (![(_INPBSearchCallHistoryIntent *)self hasUnseen]
      || ![v4 hasUnseen]
      || (int unseen = self->_unseen, unseen == [v4 unseen]))
    {
      BOOL v31 = 1;
      goto LABEL_34;
    }
  }
LABEL_33:
  BOOL v31 = 0;
LABEL_34:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBSearchCallHistoryIntent allocWithZone:](_INPBSearchCallHistoryIntent, "allocWithZone:") init];
  PBRepeatedInt32Copy();
  if ([(_INPBSearchCallHistoryIntent *)self hasCallType]) {
    [(_INPBSearchCallHistoryIntent *)v5 setCallType:[(_INPBSearchCallHistoryIntent *)self callType]];
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  id v6 = [(_INPBDateTimeRange *)self->_dateCreated copyWithZone:a3];
  [(_INPBSearchCallHistoryIntent *)v5 setDateCreated:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchCallHistoryIntent *)v5 setIntentMetadata:v7];

  if ([(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider]) {
    [(_INPBSearchCallHistoryIntent *)v5 setPreferredCallProvider:[(_INPBSearchCallHistoryIntent *)self preferredCallProvider]];
  }
  id v8 = [(_INPBContact *)self->_recipient copyWithZone:a3];
  [(_INPBSearchCallHistoryIntent *)v5 setRecipient:v8];

  id v9 = [(_INPBContact *)self->_targetContact copyWithZone:a3];
  [(_INPBSearchCallHistoryIntent *)v5 setTargetContact:v9];

  if ([(_INPBSearchCallHistoryIntent *)self hasUnseen]) {
    [(_INPBSearchCallHistoryIntent *)v5 setUnseen:[(_INPBSearchCallHistoryIntent *)self unseen]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchCallHistoryIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchCallHistoryIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchCallHistoryIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchCallHistoryIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchCallHistoryIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBSearchCallHistoryIntent *)self clearCallCapabilities];
  [(_INPBSearchCallHistoryIntent *)self clearCallTypes];
  [(_INPBSearchCallHistoryIntent *)self clearCapabilities];
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchCallHistoryIntent;
  [(_INPBSearchCallHistoryIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  if (self->_callCapabilities.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_callCapabilities.count);
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasCallType]) {
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
  if (self->_capabilities.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_capabilities.count);
  }
  uint64_t v7 = [(_INPBSearchCallHistoryIntent *)self dateCreated];

  if (v7)
  {
    id v8 = [(_INPBSearchCallHistoryIntent *)self dateCreated];
    PBDataWriterWriteSubmessage();
  }
  id v9 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];

  if (v9)
  {
    unint64_t v10 = [(_INPBSearchCallHistoryIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasPreferredCallProvider]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v11 = [(_INPBSearchCallHistoryIntent *)self recipient];

  if (v11)
  {
    unint64_t v12 = [(_INPBSearchCallHistoryIntent *)self recipient];
    PBDataWriterWriteSubmessage();
  }
  int v13 = [(_INPBSearchCallHistoryIntent *)self targetContact];

  if (v13)
  {
    uint64_t v14 = [(_INPBSearchCallHistoryIntent *)self targetContact];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchCallHistoryIntent *)self hasUnseen]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchCallHistoryIntentReadFrom(self, (uint64_t)a3);
}

- (void)setHasUnseen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnseen
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUnseen:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int unseen = a3;
}

- (BOOL)hasTargetContact
{
  return self->_targetContact != 0;
}

- (void)setTargetContact:(id)a3
{
}

- (BOOL)hasRecipient
{
  return self->_recipient != 0;
}

- (void)setRecipient:(id)a3
{
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
    id v3 = off_1E551AF48[a3 - 2];
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

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setDateCreated:(id)a3
{
}

- (int)StringAsCapabilities:(id)a3
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

- (id)capabilitiesAsString:(int)a3
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

- (int)capabilitiesAtIndex:(unint64_t)a3
{
  return self->_capabilities.list[a3];
}

- (unint64_t)capabilitiesCount
{
  return self->_capabilities.count;
}

- (void)addCapabilities:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearCapabilities
{
}

- (int)capabilities
{
  return self->_capabilities.list;
}

- (void)setCapabilities:(int *)a3 count:(unint64_t)a4
{
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
    int v4 = off_1E551AF00[v3];
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

- (id)callTypeAsString:(int)a3
{
  int v3 = a3 - 2;
  if (a3 - 2) < 9 && ((0x1EFu >> v3))
  {
    int v4 = off_1E551AF00[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setHasCallType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCallType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCallType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int callType = a3;
  }
}

- (int)StringAsCallCapabilities:(id)a3
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

- (id)callCapabilitiesAsString:(int)a3
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

- (int)callCapabilitiesAtIndex:(unint64_t)a3
{
  return self->_callCapabilities.list[a3];
}

- (unint64_t)callCapabilitiesCount
{
  return self->_callCapabilities.count;
}

- (void)addCallCapabilities:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearCallCapabilities
{
}

- (int)callCapabilities
{
  return self->_callCapabilities.list;
}

- (void)setCallCapabilities:(int *)a3 count:(unint64_t)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end