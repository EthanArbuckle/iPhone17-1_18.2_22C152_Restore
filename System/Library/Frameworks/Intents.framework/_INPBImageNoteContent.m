@interface _INPBImageNoteContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBImageNoteContent)initWithCoder:(id)a3;
- (_INPBImageValue)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBImageNoteContent

- (void).cxx_destruct
{
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBImageNoteContent *)self image];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"image"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBImageValue *)self->_image hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBImageNoteContent *)self image];
    v6 = [v4 image];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBImageNoteContent *)self image];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBImageNoteContent *)self image];
      v11 = [v4 image];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBImageNoteContent allocWithZone:](_INPBImageNoteContent, "allocWithZone:") init];
  id v6 = [(_INPBImageValue *)self->_image copyWithZone:a3];
  [(_INPBImageNoteContent *)v5 setImage:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBImageNoteContent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBImageNoteContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBImageNoteContent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBImageNoteContent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBImageNoteContent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBImageNoteContent *)self image];

  if (v4)
  {
    v5 = [(_INPBImageNoteContent *)self image];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBImageNoteContentReadFrom(self, (uint64_t)a3);
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