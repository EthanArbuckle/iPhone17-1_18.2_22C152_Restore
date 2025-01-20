@interface _INPBCreateNoteIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContent;
- (BOOL)hasGroupName;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateNoteIntent)initWithCoder:(id)a3;
- (_INPBDataString)groupName;
- (_INPBDataString)title;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBNoteContent)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateNoteIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (_INPBNoteContent)content
{
  return self->_content;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateNoteIntent *)self content];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"content"];

  v6 = [(_INPBCreateNoteIntent *)self groupName];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"groupName"];

  v8 = [(_INPBCreateNoteIntent *)self intentMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"intentMetadata"];

  v10 = [(_INPBCreateNoteIntent *)self title];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBNoteContent *)self->_content hash];
  unint64_t v4 = [(_INPBDataString *)self->_groupName hash] ^ v3;
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  return v4 ^ v5 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBCreateNoteIntent *)self content];
  v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBCreateNoteIntent *)self content];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBCreateNoteIntent *)self content];
    v10 = [v4 content];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateNoteIntent *)self groupName];
  v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBCreateNoteIntent *)self groupName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBCreateNoteIntent *)self groupName];
    v15 = [v4 groupName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateNoteIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBCreateNoteIntent *)self intentMetadata];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBCreateNoteIntent *)self intentMetadata];
    v20 = [v4 intentMetadata];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBCreateNoteIntent *)self title];
  v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBCreateNoteIntent *)self title];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBCreateNoteIntent *)self title];
    v25 = [v4 title];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBCreateNoteIntent allocWithZone:](_INPBCreateNoteIntent, "allocWithZone:") init];
  id v6 = [(_INPBNoteContent *)self->_content copyWithZone:a3];
  [(_INPBCreateNoteIntent *)v5 setContent:v6];

  id v7 = [(_INPBDataString *)self->_groupName copyWithZone:a3];
  [(_INPBCreateNoteIntent *)v5 setGroupName:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBCreateNoteIntent *)v5 setIntentMetadata:v8];

  id v9 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBCreateNoteIntent *)v5 setTitle:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateNoteIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateNoteIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateNoteIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateNoteIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateNoteIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_INPBCreateNoteIntent *)self content];

  if (v4)
  {
    unint64_t v5 = [(_INPBCreateNoteIntent *)self content];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBCreateNoteIntent *)self groupName];

  if (v6)
  {
    uint64_t v7 = [(_INPBCreateNoteIntent *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBCreateNoteIntent *)self intentMetadata];

  if (v8)
  {
    id v9 = [(_INPBCreateNoteIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBCreateNoteIntent *)self title];

  if (v10)
  {
    int v11 = [(_INPBCreateNoteIntent *)self title];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateNoteIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContent:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end