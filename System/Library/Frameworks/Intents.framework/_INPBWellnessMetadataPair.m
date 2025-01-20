@interface _INPBWellnessMetadataPair
+ (BOOL)supportsSecureCoding;
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBString)key;
- (_INPBValueMetadata)valueMetadata;
- (_INPBWellnessMetadataPair)initWithCoder:(id)a3;
- (_INPBWellnessMetadataValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWellnessMetadataPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (_INPBWellnessMetadataValue)value
{
  return self->_value;
}

- (_INPBString)key
{
  return self->_key;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBWellnessMetadataPair *)self key];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"key"];

  v6 = [(_INPBWellnessMetadataPair *)self value];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"value"];

  v8 = [(_INPBWellnessMetadataPair *)self valueMetadata];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_key hash];
  unint64_t v4 = [(_INPBWellnessMetadataValue *)self->_value hash] ^ v3;
  return v4 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBWellnessMetadataPair *)self key];
  v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBWellnessMetadataPair *)self key];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBWellnessMetadataPair *)self key];
    v10 = [v4 key];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessMetadataPair *)self value];
  v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBWellnessMetadataPair *)self value];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBWellnessMetadataPair *)self value];
    v15 = [v4 value];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBWellnessMetadataPair *)self valueMetadata];
  v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBWellnessMetadataPair *)self valueMetadata];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBWellnessMetadataPair *)self valueMetadata];
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
  v5 = [+[_INPBWellnessMetadataPair allocWithZone:](_INPBWellnessMetadataPair, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_key copyWithZone:a3];
  [(_INPBWellnessMetadataPair *)v5 setKey:v6];

  id v7 = [(_INPBWellnessMetadataValue *)self->_value copyWithZone:a3];
  [(_INPBWellnessMetadataPair *)v5 setValue:v7];

  id v8 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBWellnessMetadataPair *)v5 setValueMetadata:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWellnessMetadataPair *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWellnessMetadataPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWellnessMetadataPair *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWellnessMetadataPair *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWellnessMetadataPair *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBWellnessMetadataPair *)self key];

  if (v4)
  {
    v5 = [(_INPBWellnessMetadataPair *)self key];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBWellnessMetadataPair *)self value];

  if (v6)
  {
    uint64_t v7 = [(_INPBWellnessMetadataPair *)self value];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBWellnessMetadataPair *)self valueMetadata];

  if (v8)
  {
    v9 = [(_INPBWellnessMetadataPair *)self valueMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessMetadataPairReadFrom(self, (uint64_t)a3);
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
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setKey:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end