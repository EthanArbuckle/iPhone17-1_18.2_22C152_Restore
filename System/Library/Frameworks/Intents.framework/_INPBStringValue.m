@interface _INPBStringValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValue;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)value;
- (_INPBStringValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBStringValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (NSString)value
{
  return self->_value;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_value)
  {
    v4 = [(_INPBStringValue *)self value];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"value"];
  }
  v6 = [(_INPBStringValue *)self valueMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  return [(_INPBValueMetadata *)self->_valueMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBStringValue *)self value];
  v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBStringValue *)self value];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBStringValue *)self value];
    v10 = [v4 value];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBStringValue *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBStringValue *)self valueMetadata];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBStringValue *)self valueMetadata];
    v15 = [v4 valueMetadata];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBStringValue allocWithZone:](_INPBStringValue, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_value copyWithZone:a3];
  [(_INPBStringValue *)v5 setValue:v6];

  id v7 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBStringValue *)v5 setValueMetadata:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBStringValue *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBStringValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBStringValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBStringValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBStringValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(_INPBStringValue *)self value];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBStringValue *)self valueMetadata];

  if (v5)
  {
    id v6 = [(_INPBStringValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStringValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
  self->_value = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end