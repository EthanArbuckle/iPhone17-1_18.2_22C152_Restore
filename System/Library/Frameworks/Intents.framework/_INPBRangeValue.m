@interface _INPBRangeValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLength;
- (BOOL)hasLocation;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBRangeValue)initWithCoder:(id)a3;
- (_INPBValueMetadata)valueMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)location;
- (void)encodeWithCoder:(id)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setLength:(unint64_t)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRangeValue

- (void).cxx_destruct
{
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (unint64_t)location
{
  return self->_location;
}

- (unint64_t)length
{
  return self->_length;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBRangeValue *)self hasLength])
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBRangeValue length](self, "length"));
    [v3 setObject:v4 forKeyedSubscript:@"length"];
  }
  if ([(_INPBRangeValue *)self hasLocation])
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBRangeValue location](self, "location"));
    [v3 setObject:v5 forKeyedSubscript:@"location"];
  }
  v6 = [(_INPBRangeValue *)self valueMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBRangeValue *)self hasLength]) {
    unint64_t v3 = 2654435761u * self->_length;
  }
  else {
    unint64_t v3 = 0;
  }
  if ([(_INPBRangeValue *)self hasLocation]) {
    unint64_t v4 = 2654435761u * self->_location;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBRangeValue *)self hasLength];
    if (v5 == [v4 hasLength])
    {
      if (![(_INPBRangeValue *)self hasLength]
        || ![v4 hasLength]
        || (unint64_t length = self->_length, length == [v4 length]))
      {
        int v7 = [(_INPBRangeValue *)self hasLocation];
        if (v7 == [v4 hasLocation])
        {
          if (![(_INPBRangeValue *)self hasLocation]
            || ![v4 hasLocation]
            || (unint64_t location = self->_location, location == [v4 location]))
          {
            v9 = [(_INPBRangeValue *)self valueMetadata];
            v10 = [v4 valueMetadata];
            v11 = v10;
            if ((v9 == 0) != (v10 != 0))
            {
              uint64_t v12 = [(_INPBRangeValue *)self valueMetadata];
              if (!v12)
              {

LABEL_18:
                BOOL v17 = 1;
                goto LABEL_16;
              }
              v13 = (void *)v12;
              v14 = [(_INPBRangeValue *)self valueMetadata];
              v15 = [v4 valueMetadata];
              char v16 = [v14 isEqual:v15];

              if (v16) {
                goto LABEL_18;
              }
            }
            else
            {
            }
          }
        }
      }
    }
  }
  BOOL v17 = 0;
LABEL_16:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBRangeValue allocWithZone:](_INPBRangeValue, "allocWithZone:") init];
  if ([(_INPBRangeValue *)self hasLength]) {
    [(_INPBRangeValue *)v5 setLength:[(_INPBRangeValue *)self length]];
  }
  if ([(_INPBRangeValue *)self hasLocation]) {
    [(_INPBRangeValue *)v5 setLocation:[(_INPBRangeValue *)self location]];
  }
  id v6 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBRangeValue *)v5 setValueMetadata:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRangeValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRangeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRangeValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRangeValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRangeValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBRangeValue *)self hasLength]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_INPBRangeValue *)self hasLocation]) {
    PBDataWriterWriteUint64Field();
  }
  id v4 = [(_INPBRangeValue *)self valueMetadata];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBRangeValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRangeValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
}

- (void)setHasLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLocation:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t location = a3;
}

- (void)setHasLength:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t length = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end