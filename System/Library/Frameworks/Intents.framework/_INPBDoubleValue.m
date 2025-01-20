@interface _INPBDoubleValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValue;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDoubleValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDoubleValue

- (void).cxx_destruct
{
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (double)value
{
  return self->_value;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDoubleValue *)self hasValue])
  {
    v4 = NSNumber;
    [(_INPBDoubleValue *)self value];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"value"];
  }
  v6 = [(_INPBDoubleValue *)self valueMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDoubleValue *)self hasValue])
  {
    double value = self->_value;
    double v4 = -value;
    if (value >= 0.0) {
      double v4 = self->_value;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return [(_INPBValueMetadata *)self->_valueMetadata hash] ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBDoubleValue *)self hasValue];
    if (v5 == [v4 hasValue])
    {
      if (![(_INPBDoubleValue *)self hasValue]
        || ![v4 hasValue]
        || (double value = self->_value, [v4 value], value == v7))
      {
        v8 = [(_INPBDoubleValue *)self valueMetadata];
        v9 = [v4 valueMetadata];
        v10 = v9;
        if ((v8 == 0) != (v9 != 0))
        {
          uint64_t v11 = [(_INPBDoubleValue *)self valueMetadata];
          if (!v11)
          {

LABEL_14:
            BOOL v16 = 1;
            goto LABEL_12;
          }
          v12 = (void *)v11;
          v13 = [(_INPBDoubleValue *)self valueMetadata];
          v14 = [v4 valueMetadata];
          char v15 = [v13 isEqual:v14];

          if (v15) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDoubleValue allocWithZone:](_INPBDoubleValue, "allocWithZone:") init];
  if ([(_INPBDoubleValue *)self hasValue])
  {
    [(_INPBDoubleValue *)self value];
    -[_INPBDoubleValue setValue:](v5, "setValue:");
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBDoubleValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDoubleValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDoubleValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDoubleValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDoubleValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDoubleValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBDoubleValue *)self hasValue]) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = [(_INPBDoubleValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBDoubleValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDoubleValueReadFrom(self, (uint64_t)a3);
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

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double value = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end