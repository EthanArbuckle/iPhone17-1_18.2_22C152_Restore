@interface _INPBAnswerCallIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAudioRoute;
- (BOOL)hasCallIdentifier;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)callIdentifier;
- (_INPBAnswerCallIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)audioRouteAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAudioRoute:(id)a3;
- (int)audioRoute;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioRoute:(int)a3;
- (void)setCallIdentifier:(id)a3;
- (void)setHasAudioRoute:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAnswerCallIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (int)audioRoute
{
  return self->_audioRoute;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBAnswerCallIntent *)self hasAudioRoute])
  {
    uint64_t v4 = [(_INPBAnswerCallIntent *)self audioRoute];
    if ((v4 - 2) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E551F3F8[(v4 - 2)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"audioRoute"];
  }
  if (self->_callIdentifier)
  {
    v6 = [(_INPBAnswerCallIntent *)self callIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"callIdentifier"];
  }
  v8 = [(_INPBAnswerCallIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBAnswerCallIntent *)self hasAudioRoute]) {
    uint64_t v3 = 2654435761 * self->_audioRoute;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_callIdentifier hash] ^ v3;
  return v4 ^ [(_INPBIntentMetadata *)self->_intentMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBAnswerCallIntent *)self hasAudioRoute];
  if (v5 != [v4 hasAudioRoute]) {
    goto LABEL_16;
  }
  if ([(_INPBAnswerCallIntent *)self hasAudioRoute])
  {
    if ([v4 hasAudioRoute])
    {
      int audioRoute = self->_audioRoute;
      if (audioRoute != [v4 audioRoute]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBAnswerCallIntent *)self callIdentifier];
  v8 = [v4 callIdentifier];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBAnswerCallIntent *)self callIdentifier];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBAnswerCallIntent *)self callIdentifier];
    v12 = [v4 callIdentifier];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBAnswerCallIntent *)self intentMetadata];
  v8 = [v4 intentMetadata];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBAnswerCallIntent *)self intentMetadata];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBAnswerCallIntent *)self intentMetadata];
    v17 = [v4 intentMetadata];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBAnswerCallIntent allocWithZone:](_INPBAnswerCallIntent, "allocWithZone:") init];
  if ([(_INPBAnswerCallIntent *)self hasAudioRoute]) {
    [(_INPBAnswerCallIntent *)v5 setAudioRoute:[(_INPBAnswerCallIntent *)self audioRoute]];
  }
  v6 = (void *)[(NSString *)self->_callIdentifier copyWithZone:a3];
  [(_INPBAnswerCallIntent *)v5 setCallIdentifier:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBAnswerCallIntent *)v5 setIntentMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAnswerCallIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAnswerCallIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAnswerCallIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAnswerCallIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAnswerCallIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(_INPBAnswerCallIntent *)self hasAudioRoute]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBAnswerCallIntent *)self callIdentifier];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBAnswerCallIntent *)self intentMetadata];

  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(_INPBAnswerCallIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();

    id v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnswerCallIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasCallIdentifier
{
  return self->_callIdentifier != 0;
}

- (void)setCallIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  callIdentifier = self->_callIdentifier;
  self->_callIdentifier = v4;

  MEMORY[0x1F41817F8](v4, callIdentifier);
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
    id v3 = off_1E551F3F8[a3 - 2];
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