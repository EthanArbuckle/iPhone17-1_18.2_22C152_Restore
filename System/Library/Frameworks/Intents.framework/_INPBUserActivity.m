@interface _INPBUserActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)hasData;
- (BOOL)hasTitle;
- (BOOL)hasUri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (NSString)title;
- (NSString)uri;
- (_INPBUserActivity)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUri:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBUserActivity

- (void)writeTo:(id)a3
{
  id v8 = a3;
  v4 = [(_INPBUserActivity *)self data];

  if (v4) {
    PBDataWriterWriteDataField();
  }
  v5 = [(_INPBUserActivity *)self title];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_INPBUserActivity *)self uri];

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)uri
{
  return self->_uri;
}

- (NSString)title
{
  return self->_title;
}

- (NSData)data
{
  return self->_data;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_data)
  {
    v4 = [(_INPBUserActivity *)self data];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"data"];
  }
  if (self->_title)
  {
    v6 = [(_INPBUserActivity *)self title];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"title"];
  }
  if (self->_uri)
  {
    id v8 = [(_INPBUserActivity *)self uri];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"uri"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  return v4 ^ [(NSString *)self->_uri hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBUserActivity *)self data];
  v6 = [v4 data];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBUserActivity *)self data];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [(_INPBUserActivity *)self data];
    v10 = [v4 data];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBUserActivity *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBUserActivity *)self title];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBUserActivity *)self title];
    v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBUserActivity *)self uri];
  v6 = [v4 uri];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBUserActivity *)self uri];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBUserActivity *)self uri];
    v20 = [v4 uri];
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
  v5 = [+[_INPBUserActivity allocWithZone:](_INPBUserActivity, "allocWithZone:") init];
  v6 = (void *)[(NSData *)self->_data copyWithZone:a3];
  [(_INPBUserActivity *)v5 setData:v6];

  uint64_t v7 = (void *)[(NSString *)self->_title copyWithZone:a3];
  [(_INPBUserActivity *)v5 setTitle:v7];

  id v8 = (void *)[(NSString *)self->_uri copyWithZone:a3];
  [(_INPBUserActivity *)v5 setUri:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBUserActivity *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBUserActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBUserActivity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBUserActivity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBUserActivity *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUserActivityReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUri
{
  return self->_uri != 0;
}

- (void)setUri:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  uri = self->_uri;
  self->_uri = v4;

  MEMORY[0x1F41817F8](v4, uri);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  title = self->_title;
  self->_title = v4;

  MEMORY[0x1F41817F8](v4, title);
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  data = self->_data;
  self->_data = v4;

  MEMORY[0x1F41817F8](v4, data);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end