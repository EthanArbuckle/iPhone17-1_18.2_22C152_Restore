@interface _INPBGetVisualCodeIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIntentMetadata;
- (BOOL)hasVisualCodeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBGetVisualCodeIntent)initWithCoder:(id)a3;
- (_INPBIntentMetadata)intentMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)visualCodeTypeAsString:(int)a3;
- (int)StringAsVisualCodeType:(id)a3;
- (int)visualCodeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasVisualCodeType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setVisualCodeType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBGetVisualCodeIntent

- (void).cxx_destruct
{
}

- (int)visualCodeType
{
  return self->_visualCodeType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBGetVisualCodeIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBGetVisualCodeIntent *)self hasVisualCodeType])
  {
    uint64_t v6 = [(_INPBGetVisualCodeIntent *)self visualCodeType];
    if (v6 >= 7)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E5516DC8 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"visualCodeType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBGetVisualCodeIntent *)self hasVisualCodeType]) {
    uint64_t v4 = 2654435761 * self->_visualCodeType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  v5 = [(_INPBGetVisualCodeIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBGetVisualCodeIntent *)self intentMetadata];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBGetVisualCodeIntent *)self intentMetadata];
      v11 = [v4 intentMetadata];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBGetVisualCodeIntent *)self hasVisualCodeType];
    if (v13 == [v4 hasVisualCodeType])
    {
      if (![(_INPBGetVisualCodeIntent *)self hasVisualCodeType]
        || ![v4 hasVisualCodeType]
        || (int visualCodeType = self->_visualCodeType, visualCodeType == [v4 visualCodeType]))
      {
        BOOL v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBGetVisualCodeIntent allocWithZone:](_INPBGetVisualCodeIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBGetVisualCodeIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBGetVisualCodeIntent *)self hasVisualCodeType]) {
    [(_INPBGetVisualCodeIntent *)v5 setVisualCodeType:[(_INPBGetVisualCodeIntent *)self visualCodeType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBGetVisualCodeIntent *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBGetVisualCodeIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBGetVisualCodeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBGetVisualCodeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBGetVisualCodeIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBGetVisualCodeIntent *)self intentMetadata];

  if (v4)
  {
    v5 = [(_INPBGetVisualCodeIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBGetVisualCodeIntent *)self hasVisualCodeType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetVisualCodeIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsVisualCodeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REQUEST_PAYMENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SEND_PAYMENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BUS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SUBWAY"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)visualCodeTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516DC8 + a3);
  }

  return v3;
}

- (void)setHasVisualCodeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVisualCodeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVisualCodeType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int visualCodeType = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end