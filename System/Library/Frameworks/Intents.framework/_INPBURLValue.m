@interface _INPBURLValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAbsoluteString;
- (BOOL)hasScope;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)scope;
- (NSString)absoluteString;
- (_INPBURLValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteString:(id)a3;
- (void)setScope:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBURLValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_scope, 0);

  objc_storeStrong((id *)&self->_absoluteString, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (NSData)scope
{
  return self->_scope;
}

- (NSString)absoluteString
{
  return self->_absoluteString;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_absoluteString)
  {
    v4 = [(_INPBURLValue *)self absoluteString];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"absoluteString"];
  }
  if (self->_scope)
  {
    v6 = [(_INPBURLValue *)self scope];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"scope"];
  }
  v8 = [(_INPBURLValue *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_absoluteString hash];
  uint64_t v4 = [(NSData *)self->_scope hash] ^ v3;
  return v4 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBURLValue *)self absoluteString];
  v6 = [v4 absoluteString];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBURLValue *)self absoluteString];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBURLValue *)self absoluteString];
    v10 = [v4 absoluteString];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBURLValue *)self scope];
  v6 = [v4 scope];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBURLValue *)self scope];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBURLValue *)self scope];
    v15 = [v4 scope];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBURLValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBURLValue *)self valueMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBURLValue *)self valueMetadata];
    v20 = [v4 valueMetadata];
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
  v5 = [+[_INPBURLValue allocWithZone:](_INPBURLValue, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_absoluteString copyWithZone:a3];
  [(_INPBURLValue *)v5 setAbsoluteString:v6];

  uint64_t v7 = (void *)[(NSData *)self->_scope copyWithZone:a3];
  [(_INPBURLValue *)v5 setScope:v7];

  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBURLValue *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBURLValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBURLValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBURLValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBURLValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBURLValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBURLValue *)self absoluteString];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBURLValue *)self scope];

  if (v5) {
    PBDataWriterWriteDataField();
  }
  id v6 = [(_INPBURLValue *)self valueMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBURLValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBURLValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasScope
{
  return self->_scope != 0;
}

- (void)setScope:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  scope = self->_scope;
  self->_scope = v4;

  MEMORY[0x1F41817F8](v4, scope);
}

- (BOOL)hasAbsoluteString
{
  return self->_absoluteString != 0;
}

- (void)setAbsoluteString:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  absoluteString = self->_absoluteString;
  self->_absoluteString = v4;

  MEMORY[0x1F41817F8](v4, absoluteString);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end