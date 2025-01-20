@interface _INPBSupportedTrafficIncidentType
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocalizedDisplayString;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBString)localizedDisplayString;
- (_INPBSupportedTrafficIncidentType)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLocalizedDisplayString:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSupportedTrafficIncidentType

- (void).cxx_destruct
{
}

- (int)type
{
  return self->_type;
}

- (_INPBString)localizedDisplayString
{
  return self->_localizedDisplayString;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"localizedDisplayString"];

  if ([(_INPBSupportedTrafficIncidentType *)self hasType])
  {
    uint64_t v6 = [(_INPBSupportedTrafficIncidentType *)self type];
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5520DC8[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"type"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_localizedDisplayString hash];
  if ([(_INPBSupportedTrafficIncidentType *)self hasType]) {
    uint64_t v4 = 2654435761 * self->_type;
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
  v5 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];
  uint64_t v6 = [v4 localizedDisplayString];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];
      v11 = [v4 localizedDisplayString];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBSupportedTrafficIncidentType *)self hasType];
    if (v13 == [v4 hasType])
    {
      if (![(_INPBSupportedTrafficIncidentType *)self hasType]
        || ![v4 hasType]
        || (int type = self->_type, type == [v4 type]))
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
  v5 = [+[_INPBSupportedTrafficIncidentType allocWithZone:](_INPBSupportedTrafficIncidentType, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_localizedDisplayString copyWithZone:a3];
  [(_INPBSupportedTrafficIncidentType *)v5 setLocalizedDisplayString:v6];

  if ([(_INPBSupportedTrafficIncidentType *)self hasType]) {
    [(_INPBSupportedTrafficIncidentType *)v5 setType:[(_INPBSupportedTrafficIncidentType *)self type]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSupportedTrafficIncidentType *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSupportedTrafficIncidentType)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSupportedTrafficIncidentType *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSupportedTrafficIncidentType *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSupportedTrafficIncidentType *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];

  if (v4)
  {
    v5 = [(_INPBSupportedTrafficIncidentType *)self localizedDisplayString];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSupportedTrafficIncidentType *)self hasType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSupportedTrafficIncidentTypeReadFrom(self, (uint64_t)a3);
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ACCIDENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HAZARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPEEDTRAP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONSTRUCTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ROADWORK"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5520DC8[a3];
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

- (BOOL)hasLocalizedDisplayString
{
  return self->_localizedDisplayString != 0;
}

- (void)setLocalizedDisplayString:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end