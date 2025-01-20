@interface _INPBShareDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContact;
- (BOOL)hasDeviceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)contact;
- (_INPBShareDestination)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceType:(id)a3;
- (int)deviceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setDeviceType:(int)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBShareDestination

- (void).cxx_destruct
{
}

- (int)deviceType
{
  return self->_deviceType;
}

- (_INPBContact)contact
{
  return self->_contact;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBShareDestination *)self contact];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"contact"];

  if ([(_INPBShareDestination *)self hasDeviceType])
  {
    uint64_t v6 = [(_INPBShareDestination *)self deviceType];
    if (v6 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551AF60[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"deviceType"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBContact *)self->_contact hash];
  if ([(_INPBShareDestination *)self hasDeviceType]) {
    uint64_t v4 = 2654435761 * self->_deviceType;
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
  v5 = [(_INPBShareDestination *)self contact];
  uint64_t v6 = [v4 contact];
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(_INPBShareDestination *)self contact];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(_INPBShareDestination *)self contact];
      v11 = [v4 contact];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v13 = [(_INPBShareDestination *)self hasDeviceType];
    if (v13 == [v4 hasDeviceType])
    {
      if (![(_INPBShareDestination *)self hasDeviceType]
        || ![v4 hasDeviceType]
        || (int deviceType = self->_deviceType, deviceType == [v4 deviceType]))
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
  v5 = [+[_INPBShareDestination allocWithZone:](_INPBShareDestination, "allocWithZone:") init];
  id v6 = [(_INPBContact *)self->_contact copyWithZone:a3];
  [(_INPBShareDestination *)v5 setContact:v6];

  if ([(_INPBShareDestination *)self hasDeviceType]) {
    [(_INPBShareDestination *)v5 setDeviceType:[(_INPBShareDestination *)self deviceType]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBShareDestination *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBShareDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBShareDestination *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBShareDestination *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBShareDestination *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBShareDestination *)self contact];

  if (v4)
  {
    v5 = [(_INPBShareDestination *)self contact];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBShareDestination *)self hasDeviceType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBShareDestinationReadFrom(self, (uint64_t)a3);
}

- (int)StringAsDeviceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"APPLE_WATCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPHONE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IPAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IPOD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"IMAC"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MACBOOK"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MACBOOK_AIR"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MACBOOK_PRO"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MAC_MINI"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MAC_PRO"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)deviceTypeAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551AF60[a3];
  }

  return v3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int deviceType = a3;
  }
}

- (BOOL)hasContact
{
  return self->_contact != 0;
}

- (void)setContact:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end