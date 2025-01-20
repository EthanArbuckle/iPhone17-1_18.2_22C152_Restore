@interface _INPBLongValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValue;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBLongValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(int64_t)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLongValue

- (void).cxx_destruct
{
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int64_t)value
{
  return self->_value;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBLongValue *)self hasValue])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLongValue value](self, "value"));
    [v3 setObject:v4 forKeyedSubscript:@"value"];
  }
  v5 = [(_INPBLongValue *)self valueMetadata];
  v6 = [v5 dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBLongValue *)self hasValue]) {
    uint64_t v3 = 2654435761 * self->_value;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBValueMetadata *)self->_valueMetadata hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBLongValue *)self hasValue];
    if (v5 == [v4 hasValue])
    {
      if (![(_INPBLongValue *)self hasValue]
        || ![v4 hasValue]
        || (int64_t value = self->_value, value == [v4 value]))
      {
        v7 = [(_INPBLongValue *)self valueMetadata];
        v8 = [v4 valueMetadata];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBLongValue *)self valueMetadata];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBLongValue *)self valueMetadata];
          v13 = [v4 valueMetadata];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBLongValue allocWithZone:](_INPBLongValue, "allocWithZone:") init];
  if ([(_INPBLongValue *)self hasValue]) {
    [(_INPBLongValue *)v5 setValue:[(_INPBLongValue *)self value]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBLongValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLongValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLongValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLongValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLongValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLongValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBLongValue *)self hasValue]) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(_INPBLongValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBLongValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLongValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t value = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end