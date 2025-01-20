@interface _INPBDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDeviceCategory;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceModel;
- (NSString)deviceName;
- (_INPBDevice)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceCategoryAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceCategory:(id)a3;
- (int)deviceCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceCategory:(int)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasDeviceCategory:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceModel, 0);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (int)deviceCategory
{
  return self->_deviceCategory;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDevice *)self hasDeviceCategory])
  {
    uint64_t v4 = [(_INPBDevice *)self deviceCategory];
    if ((v4 - 1) >= 0xE)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    }
    else
    {
      v5 = *(&off_1E5520288 + (v4 - 1));
    }
    [v3 setObject:v5 forKeyedSubscript:@"deviceCategory"];
  }
  if (self->_deviceModel)
  {
    v6 = [(_INPBDevice *)self deviceModel];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"deviceModel"];
  }
  if (self->_deviceName)
  {
    v8 = [(_INPBDevice *)self deviceName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"deviceName"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDevice *)self hasDeviceCategory]) {
    uint64_t v3 = 2654435761 * self->_deviceCategory;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_deviceModel hash] ^ v3;
  return v4 ^ [(NSString *)self->_deviceName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  int v5 = [(_INPBDevice *)self hasDeviceCategory];
  if (v5 != [v4 hasDeviceCategory]) {
    goto LABEL_16;
  }
  if ([(_INPBDevice *)self hasDeviceCategory])
  {
    if ([v4 hasDeviceCategory])
    {
      int deviceCategory = self->_deviceCategory;
      if (deviceCategory != [v4 deviceCategory]) {
        goto LABEL_16;
      }
    }
  }
  v7 = [(_INPBDevice *)self deviceModel];
  v8 = [v4 deviceModel];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_15;
  }
  uint64_t v9 = [(_INPBDevice *)self deviceModel];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBDevice *)self deviceModel];
    v12 = [v4 deviceModel];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  v7 = [(_INPBDevice *)self deviceName];
  v8 = [v4 deviceName];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v14 = [(_INPBDevice *)self deviceName];
    if (!v14)
    {

LABEL_19:
      BOOL v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    v16 = [(_INPBDevice *)self deviceName];
    v17 = [v4 deviceName];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_15:
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDevice allocWithZone:](_INPBDevice, "allocWithZone:") init];
  if ([(_INPBDevice *)self hasDeviceCategory]) {
    [(_INPBDevice *)v5 setDeviceCategory:[(_INPBDevice *)self deviceCategory]];
  }
  v6 = (void *)[(NSString *)self->_deviceModel copyWithZone:a3];
  [(_INPBDevice *)v5 setDeviceModel:v6];

  v7 = (void *)[(NSString *)self->_deviceName copyWithZone:a3];
  [(_INPBDevice *)v5 setDeviceName:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDevice *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDevice *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDevice *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDevice *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBDevice *)self hasDeviceCategory]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBDevice *)self deviceModel];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  int v5 = [(_INPBDevice *)self deviceName];

  id v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    id v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeviceReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setDeviceName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  deviceName = self->_deviceName;
  self->_deviceName = v4;

  MEMORY[0x1F41817F8](v4, deviceName);
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setDeviceModel:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  deviceModel = self->_deviceModel;
  self->_deviceModel = v4;

  MEMORY[0x1F41817F8](v4, deviceModel);
}

- (int)StringAsDeviceCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HOME_POD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TV_REMOTE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SPEAKER"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HEADPHONE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BATTERY_CASE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KEYBOARD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TRACKPAD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MOUSE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PENCIL"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)deviceCategoryAsString:(int)a3
{
  if ((a3 - 1) >= 0xE)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5520288 + (a3 - 1));
  }

  return v3;
}

- (void)setHasDeviceCategory:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceCategory
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceCategory:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int deviceCategory = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end