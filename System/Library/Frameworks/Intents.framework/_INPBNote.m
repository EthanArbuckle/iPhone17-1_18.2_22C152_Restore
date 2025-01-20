@interface _INPBNote
+ (BOOL)supportsSecureCoding;
+ (Class)contentType;
- (BOOL)hasAccountIdentifier;
- (BOOL)hasCreatedDateTime;
- (BOOL)hasGroupName;
- (BOOL)hasIdentifier;
- (BOOL)hasModifiedDateTime;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)contents;
- (NSString)accountIdentifier;
- (NSString)identifier;
- (_INPBDataString)groupName;
- (_INPBDataString)title;
- (_INPBDateTime)createdDateTime;
- (_INPBDateTime)modifiedDateTime;
- (_INPBNote)initWithCoder:(id)a3;
- (id)contentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)contentsCount;
- (unint64_t)hash;
- (void)addContent:(id)a3;
- (void)clearContents;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setContents:(id)a3;
- (void)setCreatedDateTime:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setModifiedDateTime:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBNote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_modifiedDateTime, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_createdDateTime, 0);
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (_INPBDateTime)modifiedDateTime
{
  return self->_modifiedDateTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (_INPBDateTime)createdDateTime
{
  return self->_createdDateTime;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accountIdentifier)
  {
    v4 = [(_INPBNote *)self accountIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accountIdentifier"];
  }
  if ([(NSArray *)self->_contents count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = self->_contents;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (void)v24);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"content"];
  }
  v13 = [(_INPBNote *)self createdDateTime];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"createdDateTime"];

  v15 = [(_INPBNote *)self groupName];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"groupName"];

  if (self->_identifier)
  {
    v17 = [(_INPBNote *)self identifier];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"identifier"];
  }
  v19 = [(_INPBNote *)self modifiedDateTime];
  v20 = [v19 dictionaryRepresentation];
  [v3 setObject:v20 forKeyedSubscript:@"modifiedDateTime"];

  v21 = [(_INPBNote *)self title];
  v22 = [v21 dictionaryRepresentation];
  [v3 setObject:v22 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accountIdentifier hash];
  uint64_t v4 = [(NSArray *)self->_contents hash] ^ v3;
  unint64_t v5 = [(_INPBDateTime *)self->_createdDateTime hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBDataString *)self->_groupName hash];
  NSUInteger v7 = [(NSString *)self->_identifier hash];
  unint64_t v8 = v7 ^ [(_INPBDateTime *)self->_modifiedDateTime hash];
  return v6 ^ v8 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(_INPBNote *)self accountIdentifier];
  unint64_t v6 = [v4 accountIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_INPBNote *)self accountIdentifier];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBNote *)self accountIdentifier];
    uint64_t v10 = [v4 accountIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self contents];
  unint64_t v6 = [v4 contents];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_INPBNote *)self contents];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBNote *)self contents];
    v15 = [v4 contents];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self createdDateTime];
  unint64_t v6 = [v4 createdDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_INPBNote *)self createdDateTime];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBNote *)self createdDateTime];
    v20 = [v4 createdDateTime];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self groupName];
  unint64_t v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_INPBNote *)self groupName];
  if (v22)
  {
    v23 = (void *)v22;
    long long v24 = [(_INPBNote *)self groupName];
    long long v25 = [v4 groupName];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_INPBNote *)self identifier];
  if (v27)
  {
    v28 = (void *)v27;
    uint64_t v29 = [(_INPBNote *)self identifier];
    v30 = [v4 identifier];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self modifiedDateTime];
  unint64_t v6 = [v4 modifiedDateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_INPBNote *)self modifiedDateTime];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBNote *)self modifiedDateTime];
    v35 = [v4 modifiedDateTime];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBNote *)self title];
  unint64_t v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_INPBNote *)self title];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    v39 = [(_INPBNote *)self title];
    v40 = [v4 title];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBNote allocWithZone:](_INPBNote, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSString *)self->_accountIdentifier copyWithZone:a3];
  [(_INPBNote *)v5 setAccountIdentifier:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_contents copyWithZone:a3];
  [(_INPBNote *)v5 setContents:v7];

  id v8 = [(_INPBDateTime *)self->_createdDateTime copyWithZone:a3];
  [(_INPBNote *)v5 setCreatedDateTime:v8];

  id v9 = [(_INPBDataString *)self->_groupName copyWithZone:a3];
  [(_INPBNote *)v5 setGroupName:v9];

  uint64_t v10 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBNote *)v5 setIdentifier:v10];

  id v11 = [(_INPBDateTime *)self->_modifiedDateTime copyWithZone:a3];
  [(_INPBNote *)v5 setModifiedDateTime:v11];

  id v12 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBNote *)v5 setTitle:v12];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBNote *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBNote)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBNote *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBNote *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBNote *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBNote *)self accountIdentifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = self->_contents;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  id v11 = [(_INPBNote *)self createdDateTime];

  if (v11)
  {
    id v12 = [(_INPBNote *)self createdDateTime];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(_INPBNote *)self groupName];

  if (v13)
  {
    v14 = [(_INPBNote *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(_INPBNote *)self identifier];

  if (v15) {
    PBDataWriterWriteStringField();
  }
  int v16 = [(_INPBNote *)self modifiedDateTime];

  if (v16)
  {
    uint64_t v17 = [(_INPBNote *)self modifiedDateTime];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_INPBNote *)self title];

  if (v18)
  {
    v19 = [(_INPBNote *)self title];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBNoteReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hasModifiedDateTime
{
  return self->_modifiedDateTime != 0;
}

- (void)setModifiedDateTime:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasCreatedDateTime
{
  return self->_createdDateTime != 0;
}

- (void)setCreatedDateTime:(id)a3
{
}

- (id)contentAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contents objectAtIndexedSubscript:a3];
}

- (unint64_t)contentsCount
{
  return [(NSArray *)self->_contents count];
}

- (void)addContent:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSArray *)contents addObject:v4];
}

- (void)clearContents
{
}

- (void)setContents:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  contents = self->_contents;
  self->_contents = v4;

  MEMORY[0x1F41817F8](v4, contents);
}

- (BOOL)hasAccountIdentifier
{
  return self->_accountIdentifier != 0;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

  MEMORY[0x1F41817F8](v4, accountIdentifier);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)contentType
{
  return (Class)objc_opt_class();
}

@end