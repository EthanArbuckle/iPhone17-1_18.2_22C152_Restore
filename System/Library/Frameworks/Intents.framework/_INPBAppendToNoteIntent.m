@interface _INPBAppendToNoteIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContent;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTargetNote;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBAppendToNoteIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBNote)targetNote;
- (_INPBNoteContent)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTargetNote:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAppendToNoteIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNote, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (_INPBNote)targetNote
{
  return self->_targetNote;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBNoteContent)content
{
  return self->_content;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAppendToNoteIntent *)self content];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"content"];

  v6 = [(_INPBAppendToNoteIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBAppendToNoteIntent *)self targetNote];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"targetNote"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBNoteContent *)self->_content hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  return v4 ^ [(_INPBNote *)self->_targetNote hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBAppendToNoteIntent *)self content];
  v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBAppendToNoteIntent *)self content];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAppendToNoteIntent *)self content];
    v10 = [v4 content];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAppendToNoteIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBAppendToNoteIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAppendToNoteIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBAppendToNoteIntent *)self targetNote];
  v6 = [v4 targetNote];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBAppendToNoteIntent *)self targetNote];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBAppendToNoteIntent *)self targetNote];
    v20 = [v4 targetNote];
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
  v5 = [+[_INPBAppendToNoteIntent allocWithZone:](_INPBAppendToNoteIntent, "allocWithZone:") init];
  id v6 = [(_INPBNoteContent *)self->_content copyWithZone:a3];
  [(_INPBAppendToNoteIntent *)v5 setContent:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBAppendToNoteIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBNote *)self->_targetNote copyWithZone:a3];
  [(_INPBAppendToNoteIntent *)v5 setTargetNote:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAppendToNoteIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAppendToNoteIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAppendToNoteIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAppendToNoteIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAppendToNoteIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBAppendToNoteIntent *)self content];

  if (v4)
  {
    v5 = [(_INPBAppendToNoteIntent *)self content];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBAppendToNoteIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBAppendToNoteIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBAppendToNoteIntent *)self targetNote];

  if (v8)
  {
    v9 = [(_INPBAppendToNoteIntent *)self targetNote];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppendToNoteIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTargetNote
{
  return self->_targetNote != 0;
}

- (void)setTargetNote:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
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