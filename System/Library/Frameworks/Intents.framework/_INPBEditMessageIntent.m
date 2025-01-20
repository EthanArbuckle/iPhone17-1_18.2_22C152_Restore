@interface _INPBEditMessageIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEditedContent;
- (BOOL)hasIntentMetadata;
- (BOOL)hasMessageIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)editedContent;
- (NSString)messageIdentifier;
- (_INPBEditMessageIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEditedContent:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBEditMessageIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_editedContent, 0);
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSString)editedContent
{
  return self->_editedContent;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_editedContent)
  {
    v4 = [(_INPBEditMessageIntent *)self editedContent];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"editedContent"];
  }
  v6 = [(_INPBEditMessageIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if (self->_messageIdentifier)
  {
    v8 = [(_INPBEditMessageIntent *)self messageIdentifier];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"messageIdentifier"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_editedContent hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(NSString *)self->_messageIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBEditMessageIntent *)self editedContent];
  v6 = [v4 editedContent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBEditMessageIntent *)self editedContent];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBEditMessageIntent *)self editedContent];
    v10 = [v4 editedContent];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBEditMessageIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBEditMessageIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBEditMessageIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBEditMessageIntent *)self messageIdentifier];
  v6 = [v4 messageIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBEditMessageIntent *)self messageIdentifier];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBEditMessageIntent *)self messageIdentifier];
    v20 = [v4 messageIdentifier];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBEditMessageIntent allocWithZone:](_INPBEditMessageIntent, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_editedContent copyWithZone:a3];
  [(_INPBEditMessageIntent *)v5 setEditedContent:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBEditMessageIntent *)v5 setIntentMetadata:v7];

  v8 = (void *)[(NSString *)self->_messageIdentifier copyWithZone:a3];
  [(_INPBEditMessageIntent *)v5 setMessageIdentifier:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBEditMessageIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBEditMessageIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBEditMessageIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBEditMessageIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBEditMessageIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_INPBEditMessageIntent *)self editedContent];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBEditMessageIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBEditMessageIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBEditMessageIntent *)self messageIdentifier];

  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteStringField();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBEditMessageIntentReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasEditedContent
{
  return self->_editedContent != 0;
}

- (void)setEditedContent:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  editedContent = self->_editedContent;
  self->_editedContent = v4;

  MEMORY[0x1F41817F8](v4, editedContent);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end