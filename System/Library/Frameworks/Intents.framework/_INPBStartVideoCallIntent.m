@interface _INPBStartVideoCallIntent
+ (BOOL)supportsSecureCoding;
+ (Class)contactType;
+ (Class)targetContactsType;
- (BOOL)hasAudioRoute;
- (BOOL)hasCallRequestMetadata;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contacts;
- (NSArray)targetContacts;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBStartCallRequestMetadata)callRequestMetadata;
- (_INPBStartVideoCallIntent)initWithCoder:(id)a3;
- (id)audioRouteAsString:(int)a3;
- (id)contactAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)targetContactsAtIndex:(unint64_t)a3;
- (int)StringAsAudioRoute:(id)a3;
- (int)audioRoute;
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
- (void)setHasAudioRoute:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetContacts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartVideoCallIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContacts, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_contacts, 0);

  objc_storeStrong((id *)&self->_callRequestMetadata, 0);
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
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
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartVideoCallIntent *)self hasAudioRoute])
  {
    uint64_t v4 = [(_INPBStartVideoCallIntent *)self audioRoute];
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5517E08[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioRoute"];
  }
  v6 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"callRequestMetadata"];

  if ([(NSArray *)self->_contacts count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = self->_contacts;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"contact"];
  }
  v15 = [(_INPBStartVideoCallIntent *)self intentMetadata];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"intentMetadata"];

  if ([(NSArray *)self->_targetContacts count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v18 = self->_targetContacts;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v25 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"targetContacts"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartVideoCallIntent *)self hasAudioRoute]) {
    uint64_t v3 = 2654435761 * self->_audioRoute;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_contacts hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return v6 ^ [(NSArray *)self->_targetContacts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  int v5 = [(_INPBStartVideoCallIntent *)self hasAudioRoute];
  if (v5 != [v4 hasAudioRoute]) {
    goto LABEL_26;
  }
  if ([(_INPBStartVideoCallIntent *)self hasAudioRoute])
  {
    if ([v4 hasAudioRoute])
    {
      int audioRoute = self->_audioRoute;
      if (audioRoute != [v4 audioRoute]) {
        goto LABEL_26;
      }
    }
  }
  v7 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];
  v8 = [v4 callRequestMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v9 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];
    uint64_t v12 = [v4 callRequestMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBStartVideoCallIntent *)self contacts];
  v8 = [v4 contacts];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBStartVideoCallIntent *)self contacts];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBStartVideoCallIntent *)self contacts];
    v17 = [v4 contacts];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBStartVideoCallIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBStartVideoCallIntent *)self intentMetadata];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [(_INPBStartVideoCallIntent *)self intentMetadata];
    v22 = [v4 intentMetadata];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  v7 = [(_INPBStartVideoCallIntent *)self targetContacts];
  v8 = [v4 targetContacts];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v24 = [(_INPBStartVideoCallIntent *)self targetContacts];
    if (!v24)
    {

LABEL_29:
      BOOL v29 = 1;
      goto LABEL_27;
    }
    long long v25 = (void *)v24;
    long long v26 = [(_INPBStartVideoCallIntent *)self targetContacts];
    long long v27 = [v4 targetContacts];
    char v28 = [v26 isEqual:v27];

    if (v28) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_25:
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBStartVideoCallIntent allocWithZone:](_INPBStartVideoCallIntent, "allocWithZone:") init];
  if ([(_INPBStartVideoCallIntent *)self hasAudioRoute]) {
    [(_INPBStartVideoCallIntent *)v5 setAudioRoute:[(_INPBStartVideoCallIntent *)self audioRoute]];
  }
  id v6 = [(_INPBStartCallRequestMetadata *)self->_callRequestMetadata copyWithZone:a3];
  [(_INPBStartVideoCallIntent *)v5 setCallRequestMetadata:v6];

  v7 = (void *)[(NSArray *)self->_contacts copyWithZone:a3];
  [(_INPBStartVideoCallIntent *)v5 setContacts:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBStartVideoCallIntent *)v5 setIntentMetadata:v8];

  uint64_t v9 = (void *)[(NSArray *)self->_targetContacts copyWithZone:a3];
  [(_INPBStartVideoCallIntent *)v5 setTargetContacts:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartVideoCallIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartVideoCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartVideoCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartVideoCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartVideoCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBStartVideoCallIntent *)self hasAudioRoute]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];

  if (v5)
  {
    id v6 = [(_INPBStartVideoCallIntent *)self callRequestMetadata];
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

  uint64_t v12 = [(_INPBStartVideoCallIntent *)self intentMetadata];

  if (v12)
  {
    int v13 = [(_INPBStartVideoCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
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
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartVideoCallIntentReadFrom(self, (uint64_t)a3);
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
  self->_targetContacts = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
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
  self->_contacts = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
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
    id v3 = off_1E5517E08[a3 - 2];
  }

  return v3;
}

- (void)setHasAudioRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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