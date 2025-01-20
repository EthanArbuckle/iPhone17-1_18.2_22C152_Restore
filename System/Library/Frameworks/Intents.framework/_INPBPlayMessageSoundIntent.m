@interface _INPBPlayMessageSoundIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMessageIdentifier;
- (BOOL)hasSoundType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)messageIdentifier;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPlayMessageSoundIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)soundTypeAsString:(int)a3;
- (int)StringAsSoundType:(id)a3;
- (int)soundType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasSoundType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setSoundType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlayMessageSoundIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (int)soundType
{
  return self->_soundType;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if (self->_messageIdentifier)
  {
    v6 = [(_INPBPlayMessageSoundIntent *)self messageIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"messageIdentifier"];
  }
  if ([(_INPBPlayMessageSoundIntent *)self hasSoundType])
  {
    uint64_t v8 = [(_INPBPlayMessageSoundIntent *)self soundType];
    if (v8 == 1)
    {
      v9 = @"OUTGOING_MESSAGE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v9 forKeyedSubscript:@"soundType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  NSUInteger v4 = [(NSString *)self->_messageIdentifier hash];
  if ([(_INPBPlayMessageSoundIntent *)self hasSoundType]) {
    uint64_t v5 = 2654435761 * self->_soundType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPlayMessageSoundIntent *)self messageIdentifier];
  v6 = [v4 messageIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBPlayMessageSoundIntent *)self messageIdentifier];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPlayMessageSoundIntent *)self messageIdentifier];
    v15 = [v4 messageIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBPlayMessageSoundIntent *)self hasSoundType];
  if (v19 == [v4 hasSoundType])
  {
    if (![(_INPBPlayMessageSoundIntent *)self hasSoundType]
      || ![v4 hasSoundType]
      || (int soundType = self->_soundType, soundType == [v4 soundType]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBPlayMessageSoundIntent allocWithZone:](_INPBPlayMessageSoundIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPlayMessageSoundIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSString *)self->_messageIdentifier copyWithZone:a3];
  [(_INPBPlayMessageSoundIntent *)v5 setMessageIdentifier:v7];

  if ([(_INPBPlayMessageSoundIntent *)self hasSoundType]) {
    [(_INPBPlayMessageSoundIntent *)v5 setSoundType:[(_INPBPlayMessageSoundIntent *)self soundType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlayMessageSoundIntent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlayMessageSoundIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlayMessageSoundIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlayMessageSoundIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlayMessageSoundIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];

  if (v4)
  {
    uint64_t v5 = [(_INPBPlayMessageSoundIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPlayMessageSoundIntent *)self messageIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBPlayMessageSoundIntent *)self hasSoundType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayMessageSoundIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsSoundType:(id)a3
{
  return 1;
}

- (id)soundTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"OUTGOING_MESSAGE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasSoundType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSoundType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSoundType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int soundType = a3;
  }
}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (void)setMessageIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  messageIdentifier = self->_messageIdentifier;
  self->_messageIdentifier = v4;

  MEMORY[0x1F41817F8](v4, messageIdentifier);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end