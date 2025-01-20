@interface _INPBHomeAutomationFromEntity
+ (BOOL)supportsSecureCoding;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBHomeAutomationFromEntity)initWithCoder:(id)a3;
- (_INPBString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBHomeAutomationFromEntity

- (void).cxx_destruct
{
}

- (_INPBString)value
{
  return self->_value;
}

- (int)type
{
  return self->_type;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBHomeAutomationFromEntity *)self hasType])
  {
    uint64_t v4 = [(_INPBHomeAutomationFromEntity *)self type];
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5520E30[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"type"];
  }
  v6 = [(_INPBHomeAutomationFromEntity *)self value];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"value"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBHomeAutomationFromEntity *)self hasType]) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(_INPBString *)self->_value hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(_INPBHomeAutomationFromEntity *)self hasType];
    if (v5 == [v4 hasType])
    {
      if (![(_INPBHomeAutomationFromEntity *)self hasType]
        || ![v4 hasType]
        || (int type = self->_type, type == [v4 type]))
      {
        v7 = [(_INPBHomeAutomationFromEntity *)self value];
        v8 = [v4 value];
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(_INPBHomeAutomationFromEntity *)self value];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          v12 = [(_INPBHomeAutomationFromEntity *)self value];
          v13 = [v4 value];
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
  int v5 = [+[_INPBHomeAutomationFromEntity allocWithZone:](_INPBHomeAutomationFromEntity, "allocWithZone:") init];
  if ([(_INPBHomeAutomationFromEntity *)self hasType]) {
    [(_INPBHomeAutomationFromEntity *)v5 setType:[(_INPBHomeAutomationFromEntity *)self type]];
  }
  id v6 = [(_INPBString *)self->_value copyWithZone:a3];
  [(_INPBHomeAutomationFromEntity *)v5 setValue:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBHomeAutomationFromEntity *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBHomeAutomationFromEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBHomeAutomationFromEntity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBHomeAutomationFromEntity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBHomeAutomationFromEntity *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBHomeAutomationFromEntity *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBHomeAutomationFromEntity *)self value];

  int v5 = v7;
  if (v4)
  {
    id v6 = [(_INPBHomeAutomationFromEntity *)self value];
    PBDataWriterWriteSubmessage();

    int v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeAutomationFromEntityReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setValue:(id)a3
{
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_HAENTITY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCESSORY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROOM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ZONE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520E30[a3];
  }

  return v3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int type = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end