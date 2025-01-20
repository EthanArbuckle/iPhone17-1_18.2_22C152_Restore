@interface _INPBJSONDictionary
+ (BOOL)supportsSecureCoding;
- (BOOL)hasJsonString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)jsonString;
- (_INPBJSONDictionary)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setJsonString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBJSONDictionary

- (void).cxx_destruct
{
}

- (NSString)jsonString
{
  return self->_jsonString;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_jsonString)
  {
    v4 = [(_INPBJSONDictionary *)self jsonString];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"jsonString"];
  }

  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_jsonString hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBJSONDictionary *)self jsonString];
    v6 = [v4 jsonString];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBJSONDictionary *)self jsonString];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBJSONDictionary *)self jsonString];
      v11 = [v4 jsonString];
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
  v5 = [+[_INPBJSONDictionary allocWithZone:](_INPBJSONDictionary, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_jsonString copyWithZone:a3];
  [(_INPBJSONDictionary *)v5 setJsonString:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBJSONDictionary *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBJSONDictionary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBJSONDictionary *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBJSONDictionary *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBJSONDictionary *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_INPBJSONDictionary *)self jsonString];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBJSONDictionaryReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasJsonString
{
  return self->_jsonString != 0;
}

- (void)setJsonString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  jsonString = self->_jsonString;
  self->_jsonString = v4;

  MEMORY[0x1F41817F8](v4, jsonString);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end