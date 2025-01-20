@interface _INPBDeviceDetail
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCategory;
- (BOOL)hasDeviceClass;
- (BOOL)hasDeviceName;
- (BOOL)hasDeviceOwner;
- (BOOL)hasIdentifier;
- (BOOL)hasProductName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_INPBContact)deviceOwner;
- (_INPBDataString)category;
- (_INPBDataString)deviceName;
- (_INPBDataString)productName;
- (_INPBDeviceDetail)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deviceClassAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDeviceClass:(id)a3;
- (int)deviceClass;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceOwner:(id)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setProductName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeviceDetail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceOwner, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

- (_INPBDataString)productName
{
  return self->_productName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBContact)deviceOwner
{
  return self->_deviceOwner;
}

- (_INPBDataString)deviceName
{
  return self->_deviceName;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (_INPBDataString)category
{
  return self->_category;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDeviceDetail *)self category];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"category"];

  if ([(_INPBDeviceDetail *)self hasDeviceClass])
  {
    uint64_t v6 = [(_INPBDeviceDetail *)self deviceClass];
    if (v6 >= 0xA)
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    }
    else
    {
      v7 = *(&off_1E551FC78 + v6);
    }
    [v3 setObject:v7 forKeyedSubscript:@"deviceClass"];
  }
  v8 = [(_INPBDeviceDetail *)self deviceName];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"deviceName"];

  v10 = [(_INPBDeviceDetail *)self deviceOwner];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"deviceOwner"];

  if (self->_identifier)
  {
    v12 = [(_INPBDeviceDetail *)self identifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"identifier"];
  }
  v14 = [(_INPBDeviceDetail *)self productName];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"productName"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDataString *)self->_category hash];
  if ([(_INPBDeviceDetail *)self hasDeviceClass]) {
    uint64_t v4 = 2654435761 * self->_deviceClass;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBDataString *)self->_deviceName hash];
  unint64_t v7 = v5 ^ v6 ^ [(_INPBContact *)self->_deviceOwner hash];
  NSUInteger v8 = [(NSString *)self->_identifier hash];
  return v7 ^ v8 ^ [(_INPBDataString *)self->_productName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBDeviceDetail *)self category];
  unint64_t v6 = [v4 category];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBDeviceDetail *)self category];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    v9 = [(_INPBDeviceDetail *)self category];
    v10 = [v4 category];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v12 = [(_INPBDeviceDetail *)self hasDeviceClass];
  if (v12 != [v4 hasDeviceClass]) {
    goto LABEL_31;
  }
  if ([(_INPBDeviceDetail *)self hasDeviceClass])
  {
    if ([v4 hasDeviceClass])
    {
      int deviceClass = self->_deviceClass;
      if (deviceClass != [v4 deviceClass]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBDeviceDetail *)self deviceName];
  unint64_t v6 = [v4 deviceName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v14 = [(_INPBDeviceDetail *)self deviceName];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBDeviceDetail *)self deviceName];
    v17 = [v4 deviceName];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBDeviceDetail *)self deviceOwner];
  unint64_t v6 = [v4 deviceOwner];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v19 = [(_INPBDeviceDetail *)self deviceOwner];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBDeviceDetail *)self deviceOwner];
    v22 = [v4 deviceOwner];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBDeviceDetail *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v24 = [(_INPBDeviceDetail *)self identifier];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBDeviceDetail *)self identifier];
    v27 = [v4 identifier];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBDeviceDetail *)self productName];
  unint64_t v6 = [v4 productName];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBDeviceDetail *)self productName];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    v31 = [(_INPBDeviceDetail *)self productName];
    v32 = [v4 productName];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBDeviceDetail allocWithZone:](_INPBDeviceDetail, "allocWithZone:") init];
  id v6 = [(_INPBDataString *)self->_category copyWithZone:a3];
  [(_INPBDeviceDetail *)v5 setCategory:v6];

  if ([(_INPBDeviceDetail *)self hasDeviceClass]) {
    [(_INPBDeviceDetail *)v5 setDeviceClass:[(_INPBDeviceDetail *)self deviceClass]];
  }
  id v7 = [(_INPBDataString *)self->_deviceName copyWithZone:a3];
  [(_INPBDeviceDetail *)v5 setDeviceName:v7];

  id v8 = [(_INPBContact *)self->_deviceOwner copyWithZone:a3];
  [(_INPBDeviceDetail *)v5 setDeviceOwner:v8];

  v9 = (void *)[(NSString *)self->_identifier copyWithZone:a3];
  [(_INPBDeviceDetail *)v5 setIdentifier:v9];

  id v10 = [(_INPBDataString *)self->_productName copyWithZone:a3];
  [(_INPBDeviceDetail *)v5 setProductName:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeviceDetail *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeviceDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeviceDetail *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeviceDetail *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeviceDetail *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(_INPBDeviceDetail *)self category];

  if (v4)
  {
    unint64_t v5 = [(_INPBDeviceDetail *)self category];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBDeviceDetail *)self hasDeviceClass]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBDeviceDetail *)self deviceName];

  if (v6)
  {
    uint64_t v7 = [(_INPBDeviceDetail *)self deviceName];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBDeviceDetail *)self deviceOwner];

  if (v8)
  {
    v9 = [(_INPBDeviceDetail *)self deviceOwner];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBDeviceDetail *)self identifier];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBDeviceDetail *)self productName];

  int v12 = v14;
  if (v11)
  {
    v13 = [(_INPBDeviceDetail *)self productName];
    PBDataWriterWriteSubmessage();

    int v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeviceDetailReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (void)setProductName:(id)a3
{
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  MEMORY[0x1F41817F8](v4, identifier);
}

- (BOOL)hasDeviceOwner
{
  return self->_deviceOwner != 0;
}

- (void)setDeviceOwner:(id)a3
{
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setDeviceName:(id)a3
{
}

- (int)StringAsDeviceClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IPHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IPAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IPOD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TV"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"HOMEPOD"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HEADPHONE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ACCESSORIES"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)deviceClassAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E551FC78 + a3);
  }

  return v3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceClass
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeviceClass:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int deviceClass = a3;
  }
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setCategory:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end