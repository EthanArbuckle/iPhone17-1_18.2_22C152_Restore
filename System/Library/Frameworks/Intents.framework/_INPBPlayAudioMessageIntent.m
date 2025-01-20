@interface _INPBPlayAudioMessageIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMessageIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)messageIdentifier;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPlayAudioMessageIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPlayAudioMessageIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
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
  v4 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if (self->_messageIdentifier)
  {
    v6 = [(_INPBPlayAudioMessageIntent *)self messageIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"messageIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(NSString *)self->_messageIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBPlayAudioMessageIntent *)self messageIdentifier];
  v6 = [v4 messageIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBPlayAudioMessageIntent *)self messageIdentifier];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBPlayAudioMessageIntent *)self messageIdentifier];
    v15 = [v4 messageIdentifier];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPlayAudioMessageIntent allocWithZone:](_INPBPlayAudioMessageIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPlayAudioMessageIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSString *)self->_messageIdentifier copyWithZone:a3];
  [(_INPBPlayAudioMessageIntent *)v5 setMessageIdentifier:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPlayAudioMessageIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPlayAudioMessageIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPlayAudioMessageIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPlayAudioMessageIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPlayAudioMessageIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBPlayAudioMessageIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPlayAudioMessageIntent *)self messageIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPlayAudioMessageIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasMessageIdentifier
{
  return self->_messageIdentifier != 0;
}

- (void)setMessageIdentifier:(id)a3
{
  self->_messageIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
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