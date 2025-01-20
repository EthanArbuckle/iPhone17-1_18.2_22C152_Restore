@interface _INPBUnsendMessagesIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)messageIdentifiers;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBUnsendMessagesIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)messageIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)messageIdentifiersCount;
- (void)addMessageIdentifiers:(id)a3;
- (void)clearMessageIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMessageIdentifiers:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUnsendMessagesIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifiers, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)messageIdentifiers
{
  return self->_messageIdentifiers;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBUnsendMessagesIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if (self->_messageIdentifiers)
  {
    v6 = [(_INPBUnsendMessagesIntent *)self messageIdentifiers];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"messageIdentifiers"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return [(NSArray *)self->_messageIdentifiers hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBUnsendMessagesIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBUnsendMessagesIntent *)self intentMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBUnsendMessagesIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBUnsendMessagesIntent *)self messageIdentifiers];
  v6 = [v4 messageIdentifiers];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBUnsendMessagesIntent *)self messageIdentifiers];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBUnsendMessagesIntent *)self messageIdentifiers];
    v15 = [v4 messageIdentifiers];
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
  v5 = [+[_INPBUnsendMessagesIntent allocWithZone:](_INPBUnsendMessagesIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBUnsendMessagesIntent *)v5 setIntentMetadata:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_messageIdentifiers copyWithZone:a3];
  [(_INPBUnsendMessagesIntent *)v5 setMessageIdentifiers:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUnsendMessagesIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUnsendMessagesIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUnsendMessagesIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUnsendMessagesIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUnsendMessagesIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBUnsendMessagesIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBUnsendMessagesIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_messageIdentifiers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUnsendMessagesIntentReadFrom(self, (uint64_t)a3);
}

- (id)messageIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_messageIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)messageIdentifiersCount
{
  return [(NSArray *)self->_messageIdentifiers count];
}

- (void)addMessageIdentifiers:(id)a3
{
  id v4 = a3;
  messageIdentifiers = self->_messageIdentifiers;
  id v8 = v4;
  if (!messageIdentifiers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_messageIdentifiers;
    self->_messageIdentifiers = v6;

    id v4 = v8;
    messageIdentifiers = self->_messageIdentifiers;
  }
  [(NSArray *)messageIdentifiers addObject:v4];
}

- (void)clearMessageIdentifiers
{
}

- (void)setMessageIdentifiers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  messageIdentifiers = self->_messageIdentifiers;
  self->_messageIdentifiers = v4;

  MEMORY[0x1F41817F8](v4, messageIdentifiers);
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