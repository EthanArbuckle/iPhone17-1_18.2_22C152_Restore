@interface _INPBLanguageTag
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)tag;
- (_INPBLanguageTag)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLanguageTag

- (void).cxx_destruct
{
}

- (NSString)tag
{
  return self->_tag;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_tag)
  {
    v4 = [(_INPBLanguageTag *)self tag];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"tag"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_tag hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBLanguageTag *)self tag];
    v6 = [v4 tag];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBLanguageTag *)self tag];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBLanguageTag *)self tag];
      v11 = [v4 tag];
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
  v5 = [+[_INPBLanguageTag allocWithZone:](_INPBLanguageTag, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_tag copyWithZone:a3];
  [(_INPBLanguageTag *)v5 setTag:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLanguageTag *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLanguageTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLanguageTag *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLanguageTag *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLanguageTag *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_INPBLanguageTag *)self tag];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLanguageTagReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTag
{
  return self->_tag != 0;
}

- (void)setTag:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  tag = self->_tag;
  self->_tag = v4;

  MEMORY[0x1F41817F8](v4, tag);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end