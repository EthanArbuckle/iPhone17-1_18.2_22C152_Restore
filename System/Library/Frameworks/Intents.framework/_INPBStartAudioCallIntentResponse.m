@interface _INPBStartAudioCallIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAudioRoute;
- (BOOL)hasMetrics;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)targetContacts;
- (NSString)status;
- (_INPBCallMetrics)metrics;
- (_INPBStartAudioCallIntentResponse)initWithCoder:(id)a3;
- (id)audioRouteAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)targetContactsAtIndex:(unint64_t)a3;
- (int)StringAsAudioRoute:(id)a3;
- (int)audioRoute;
- (unint64_t)hash;
- (unint64_t)targetContactsCount;
- (void)addTargetContacts:(id)a3;
- (void)clearTargetContacts;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setHasAudioRoute:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setStatus:(id)a3;
- (void)setTargetContacts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStartAudioCallIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContacts, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

- (NSArray)targetContacts
{
  return self->_targetContacts;
}

- (NSString)status
{
  return self->_status;
}

- (_INPBCallMetrics)metrics
{
  return self->_metrics;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBStartAudioCallIntentResponse *)self hasAudioRoute])
  {
    uint64_t v4 = [(_INPBStartAudioCallIntentResponse *)self audioRoute];
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551A5B8[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioRoute"];
  }
  v6 = [(_INPBStartAudioCallIntentResponse *)self metrics];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"metrics"];

  if (self->_status)
  {
    v8 = [(_INPBStartAudioCallIntentResponse *)self status];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"status"];
  }
  if (self->_targetContacts)
  {
    v10 = [(_INPBStartAudioCallIntentResponse *)self targetContacts];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"targetContacts"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBStartAudioCallIntentResponse *)self hasAudioRoute]) {
    uint64_t v3 = 2654435761 * self->_audioRoute;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBCallMetrics *)self->_metrics hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_status hash];
  return v4 ^ v5 ^ [(NSArray *)self->_targetContacts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBStartAudioCallIntentResponse *)self hasAudioRoute];
  if (v5 != [v4 hasAudioRoute]) {
    goto LABEL_21;
  }
  if ([(_INPBStartAudioCallIntentResponse *)self hasAudioRoute])
  {
    if ([v4 hasAudioRoute])
    {
      int audioRoute = self->_audioRoute;
      if (audioRoute != [v4 audioRoute]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBStartAudioCallIntentResponse *)self metrics];
  v8 = [v4 metrics];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBStartAudioCallIntentResponse *)self metrics];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBStartAudioCallIntentResponse *)self metrics];
    v12 = [v4 metrics];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBStartAudioCallIntentResponse *)self status];
  v8 = [v4 status];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBStartAudioCallIntentResponse *)self status];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBStartAudioCallIntentResponse *)self status];
    v17 = [v4 status];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBStartAudioCallIntentResponse *)self targetContacts];
  v8 = [v4 targetContacts];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBStartAudioCallIntentResponse *)self targetContacts];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBStartAudioCallIntentResponse *)self targetContacts];
    v22 = [v4 targetContacts];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBStartAudioCallIntentResponse allocWithZone:](_INPBStartAudioCallIntentResponse, "allocWithZone:") init];
  if ([(_INPBStartAudioCallIntentResponse *)self hasAudioRoute]) {
    [(_INPBStartAudioCallIntentResponse *)v5 setAudioRoute:[(_INPBStartAudioCallIntentResponse *)self audioRoute]];
  }
  id v6 = [(_INPBCallMetrics *)self->_metrics copyWithZone:a3];
  [(_INPBStartAudioCallIntentResponse *)v5 setMetrics:v6];

  v7 = (void *)[(NSString *)self->_status copyWithZone:a3];
  [(_INPBStartAudioCallIntentResponse *)v5 setStatus:v7];

  v8 = (void *)[(NSArray *)self->_targetContacts copyWithZone:a3];
  [(_INPBStartAudioCallIntentResponse *)v5 setTargetContacts:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStartAudioCallIntentResponse *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStartAudioCallIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStartAudioCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStartAudioCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStartAudioCallIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBStartAudioCallIntentResponse *)self hasAudioRoute]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBStartAudioCallIntentResponse *)self metrics];

  if (v5)
  {
    id v6 = [(_INPBStartAudioCallIntentResponse *)self metrics];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBStartAudioCallIntentResponse *)self status];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_targetContacts;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartAudioCallIntentResponseReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)setStatus:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  status = self->_status;
  self->_status = v4;

  MEMORY[0x1F41817F8](v4, status);
}

- (BOOL)hasMetrics
{
  return self->_metrics != 0;
}

- (void)setMetrics:(id)a3
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
    id v3 = off_1E551A5B8[a3 - 2];
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

@end