@interface _INPBNoteContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage;
- (BOOL)hasText;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBImageNoteContent)image;
- (_INPBNoteContent)initWithCoder:(id)a3;
- (_INPBTextNoteContent)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBNoteContent

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NOTE_CONTENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TEXT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMAGE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (int)type
{
  return self->_type;
}

- (_INPBTextNoteContent)text
{
  return self->_text;
}

- (_INPBImageNoteContent)image
{
  return self->_image;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [(_INPBNoteContent *)self image];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"image"];

  v6 = [(_INPBNoteContent *)self text];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"text"];

  if ([(_INPBNoteContent *)self hasType])
  {
    uint64_t v8 = [(_INPBNoteContent *)self type];
    if (v8 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E551C5F0[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBImageNoteContent *)self->_image hash];
  unint64_t v4 = [(_INPBTextNoteContent *)self->_text hash];
  if ([(_INPBNoteContent *)self hasType]) {
    uint64_t v5 = 2654435761 * self->_type;
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
  uint64_t v5 = [(_INPBNoteContent *)self image];
  v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBNoteContent *)self image];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBNoteContent *)self image];
    v10 = [v4 image];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBNoteContent *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_INPBNoteContent *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBNoteContent *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int v19 = [(_INPBNoteContent *)self hasType];
  if (v19 == [v4 hasType])
  {
    if (![(_INPBNoteContent *)self hasType]
      || ![v4 hasType]
      || (int type = self->_type, type == [v4 type]))
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
  uint64_t v5 = [+[_INPBNoteContent allocWithZone:](_INPBNoteContent, "allocWithZone:") init];
  id v6 = [(_INPBImageNoteContent *)self->_image copyWithZone:a3];
  [(_INPBNoteContent *)v5 setImage:v6];

  id v7 = [(_INPBTextNoteContent *)self->_text copyWithZone:a3];
  [(_INPBNoteContent *)v5 setText:v7];

  if ([(_INPBNoteContent *)self hasType]) {
    [(_INPBNoteContent *)v5 setType:[(_INPBNoteContent *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBNoteContent *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBNoteContent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBNoteContent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBNoteContent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBNoteContent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBNoteContent *)self image];

  if (v4)
  {
    uint64_t v5 = [(_INPBNoteContent *)self image];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBNoteContent *)self text];

  if (v6)
  {
    uint64_t v7 = [(_INPBNoteContent *)self text];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBNoteContent *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBNoteContentReadFrom(self, (uint64_t)a3);
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v3 = off_1E551C5F0[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)setText:(id)a3
{
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setImage:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end