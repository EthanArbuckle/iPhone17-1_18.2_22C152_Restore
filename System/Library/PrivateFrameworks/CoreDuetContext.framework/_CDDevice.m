@interface _CDDevice
+ (BOOL)supportsSecureCoding;
+ (id)localDevice;
+ (unint64_t)identifierForDeviceID:(id)a3;
- (BOOL)isCompanion;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDeviceTypes:(unint64_t)a3;
- (NSString)deviceID;
- (NSString)model;
- (NSString)name;
- (_CDDevice)initWithCoder:(id)a3;
- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 deviceClass:(int64_t)a5 model:(id)a6 companion:(BOOL)a7;
- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 model:(id)a5 companion:(BOOL)a6;
- (_CDDevice)initWithName:(id)a3 identifier:(unint64_t)a4 deviceClass:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)deviceClass;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceClass:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _CDDevice

- (NSString)deviceID
{
  return self->_deviceID;
}

+ (id)localDevice
{
  if (localDevice_onceToken != -1) {
    dispatch_once(&localDevice_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)localDevice_localDevice;
  return v2;
}

+ (unint64_t)identifierForDeviceID:(id)a3
{
  if (a3)
  {
    strlen((const char *)[a3 UTF8String]);
    __memcpy_chk();
  }
  return 0;
}

- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 deviceClass:(int64_t)a5 model:(id)a6 companion:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = [(_CDDevice *)self init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_deviceID, a4);
    v17->_identifier = +[_CDDevice identifierForDeviceID:v14];
    v17->_deviceClass = a5;
    objc_storeStrong((id *)&v17->_model, a6);
    v17->_companion = a7;
  }

  return v17;
}

- (_CDDevice)initWithName:(id)a3 identifier:(unint64_t)a4 deviceClass:(int64_t)a5
{
  id v9 = a3;
  v10 = [(_CDDevice *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_identifier = a4;
    v11->_deviceClass = a5;
  }

  return v11;
}

- (_CDDevice)initWithName:(id)a3 deviceID:(id)a4 model:(id)a5 companion:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 localizedCaseInsensitiveContainsString:@"Mac"])
  {
    if ([v12 localizedCaseInsensitiveContainsString:@"book"]) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 3;
    }
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"iPhone"])
  {
    uint64_t v13 = 1;
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"iPad"])
  {
    uint64_t v13 = 0;
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"Watch"])
  {
    uint64_t v13 = 6;
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"AppleTV"])
  {
    uint64_t v13 = 5;
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"AudioAccessory"])
  {
    uint64_t v13 = 7;
  }
  else if ([v12 localizedCaseInsensitiveContainsString:@"iPod"])
  {
    uint64_t v13 = 2;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F5B418] mdcsChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_18EC9B000, v14, OS_LOG_TYPE_INFO, "Unrecognized model: %@", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v13 = -1;
  }
  id v15 = [(_CDDevice *)self initWithName:v10 deviceID:v11 deviceClass:v13 model:v12 companion:v6];

  return v15;
}

- (BOOL)matchesDeviceTypes:(unint64_t)a3
{
  int v3 = a3;
  if (a3 == 0x1000000)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Companion requested without a specific device type.", v7, 2u);
    }
    LODWORD(v5) = 1;
LABEL_15:
    if ((v3 & 0x1000000) != 0 && v5) {
      LOBYTE(v5) = self->_companion;
    }
  }
  else
  {
    switch(self->_deviceClass)
    {
      case 0:
        LODWORD(v5) = a3 & 1;
        goto LABEL_15;
      case 1:
        unint64_t v5 = (a3 >> 1) & 1;
        goto LABEL_15;
      case 2:
        unint64_t v5 = (a3 >> 2) & 1;
        goto LABEL_15;
      case 3:
        unint64_t v5 = (a3 >> 3) & 1;
        goto LABEL_15;
      case 4:
        unint64_t v5 = (a3 >> 4) & 1;
        goto LABEL_15;
      case 5:
        unint64_t v5 = (a3 >> 5) & 1;
        goto LABEL_15;
      case 6:
        unint64_t v5 = (a3 >> 6) & 1;
        goto LABEL_15;
      case 7:
        unint64_t v5 = (a3 >> 7) & 1;
        goto LABEL_15;
      default:
        LOBYTE(v5) = 0;
        break;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v6 = a3;
  [v6 encodeObject:name forKey:@"name"];
  [v6 encodeObject:self->_deviceID forKey:@"deviceID"];
  unint64_t v5 = [NSNumber numberWithInteger:self->_deviceClass];
  [v6 encodeObject:v5 forKey:@"deviceClass"];

  [v6 encodeObject:self->_model forKey:@"model"];
  [v6 encodeBool:self->_companion forKey:@"companion"];
}

- (_CDDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceClass"];
  uint64_t v8 = [v7 integerValue];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
  uint64_t v10 = [v4 decodeBoolForKey:@"companion"];

  id v11 = (_CDDevice *)[objc_alloc((Class)objc_opt_class()) initWithName:v5 deviceID:v6 deviceClass:v8 model:v9 companion:v10];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_CDDevice allocWithZone:a3];
  deviceID = self->_deviceID;
  name = self->_name;
  int64_t deviceClass = self->_deviceClass;
  model = self->_model;
  BOOL companion = self->_companion;
  return [(_CDDevice *)v4 initWithName:name deviceID:deviceID deviceClass:deviceClass model:model companion:companion];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDDevice *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      deviceID = self->_deviceID;
      id v6 = [(_CDDevice *)v4 deviceID];
      char v7 = [(NSString *)deviceID isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_deviceClass ^ [(NSString *)self->_deviceID hash];
}

- (id)description
{
  unint64_t v3 = [(_CDDevice *)self deviceClass];
  if (v3 > 7) {
    id v4 = @"??";
  }
  else {
    id v4 = off_1E5609448[v3];
  }
  if (self->_companion) {
    unint64_t v5 = @"<_CDDevice: %@: '%@' (%@), %@ (paired companion)>";
  }
  else {
    unint64_t v5 = @"<_CDDevice: %@: '%@' (%@), %@>";
  }
  id v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v4, self->_name, self->_deviceID, self->_model);
  return v6;
}

- (void)setDeviceID:(id)a3
{
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(int64_t)a3
{
  self->_int64_t deviceClass = a3;
}

- (NSString)model
{
  return self->_model;
}

- (BOOL)isCompanion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end