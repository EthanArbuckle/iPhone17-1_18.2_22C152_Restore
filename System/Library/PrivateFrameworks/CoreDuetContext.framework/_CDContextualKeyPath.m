@interface _CDContextualKeyPath
+ (BOOL)supportsSecureCoding;
+ (_CDContextualKeyPath)keyPathWithKey:(id)a3;
+ (_CDContextualKeyPath)keyPathWithKey:(id)a3 isUserCentric:(BOOL)a4;
+ (id)ephemeralKeyPathWithKey:(id)a3;
+ (id)remoteKeyPathForKeyPath:(id)a3 forDeviceID:(id)a4;
+ (id)remotekeyPathForKeyPath:(id)a3 forDevice:(unint64_t)a4;
- (BOOL)isEphemeral;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiDeviceKeyPath;
- (BOOL)isUserCentric;
- (BOOL)sensitiveContents;
- (NSString)deviceID;
- (NSString)key;
- (_CDContextualKeyPath)init;
- (_CDContextualKeyPath)initWithCoder:(id)a3;
- (_CDContextualKeyPath)initWithKey:(id)a3 forDevice:(unint64_t)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6;
- (_CDContextualKeyPath)initWithKey:(id)a3 forDeviceID:(id)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)forwardingTargetForSelector:(SEL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setIsEphemeral:(BOOL)a3;
- (void)setIsUserCentric:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSensitiveContents:(BOOL)a3;
@end

@implementation _CDContextualKeyPath

- (unint64_t)hash
{
  return [(NSString *)self->_key hash] ^ -(uint64_t)self->_isUserCentric;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    v4 = self->_key;
  }
  else {
    v4 = 0;
  }
  return v4;
}

+ (id)ephemeralKeyPathWithKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = +[_CDDevice localDevice];
  v6 = [v5 deviceID];
  v7 = (void *)[v4 initWithKey:v3 forDeviceID:v6 isUserCentric:0 isEphemeral:1];

  return v7;
}

- (id)description
{
  if (self->_isUserCentric) {
    id v3 = @"/user";
  }
  else {
    id v3 = @"/device";
  }
  deviceID = self->_deviceID;
  v5 = +[_CDDevice localDevice];
  v6 = [v5 deviceID];
  LOBYTE(deviceID) = [(NSString *)deviceID isEqualToString:v6];

  if (deviceID)
  {
    [NSString stringWithFormat:@"%@%@", v3, self->_key, v10];
  }
  else
  {
    v7 = (__CFString *)self->_deviceID;
    if (!v7) {
      v7 = @"ANY";
    }
    [NSString stringWithFormat:@"%@%@ (device %@)", v3, self->_key, v7];
  v8 = };
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDContextualKeyPath *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_isUserCentric)
      {
        if ([(_CDContextualKeyPath *)v5 isUserCentric]) {
          goto LABEL_10;
        }
        if (self->_isUserCentric)
        {
LABEL_7:
          char v7 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }
      if ([(_CDContextualKeyPath *)v6 isUserCentric]) {
        goto LABEL_7;
      }
LABEL_10:
      key = self->_key;
      v9 = [(_CDContextualKeyPath *)v6 key];
      char v7 = [(NSString *)key isEqual:v9];

      goto LABEL_11;
    }
    char v7 = 0;
  }
LABEL_12:

  return v7;
}

- (BOOL)isUserCentric
{
  return self->_isUserCentric;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (_CDContextualKeyPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    if (v6
      && [v4 containsValueForKey:@"userCentric"]
      && (uint64_t v7 = [v4 decodeBoolForKey:@"userCentric"],
          [v4 containsValueForKey:@"ephemeral"]))
    {
      v8 = (_CDContextualKeyPath *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v5, v6, v7, objc_msgSend(v4, "decodeBoolForKey:", @"ephemeral"));
      -[_CDContextualKeyPath setSensitiveContents:](v8, "setSensitiveContents:", [v4 decodeBoolForKey:@"sensitiveContents"]);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithKey:forDeviceID:isUserCentric:isEphemeral:", self->_key, self->_deviceID, self->_isUserCentric, self->_isEphemeral);
  [v4 setSensitiveContents:self->_sensitiveContents];
  return v4;
}

- (_CDContextualKeyPath)initWithKey:(id)a3 forDeviceID:(id)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_CDContextualKeyPath;
  v13 = [(_CDContextualKeyPath *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v14->_deviceID, a4);
    v14->_isUserCentric = a5;
    v14->_isEphemeral = a6;
  }

  return v14;
}

- (void)setSensitiveContents:(BOOL)a3
{
  self->_sensitiveContents = a3;
}

- (void)setDeviceID:(id)a3
{
}

- (BOOL)sensitiveContents
{
  return self->_sensitiveContents;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_deviceID forKey:@"deviceID"];
  [v5 encodeBool:self->_isUserCentric forKey:@"userCentric"];
  [v5 encodeBool:self->_isEphemeral forKey:@"ephemeral"];
  [v5 encodeBool:self->_sensitiveContents forKey:@"sensitiveContents"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEphemeral
{
  return self->_isEphemeral;
}

+ (_CDContextualKeyPath)keyPathWithKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = +[_CDDevice localDevice];
  v6 = [v5 deviceID];
  uint64_t v7 = (void *)[v4 initWithKey:v3 forDeviceID:v6 isUserCentric:0 isEphemeral:0];

  return (_CDContextualKeyPath *)v7;
}

- (_CDContextualKeyPath)init
{
  return 0;
}

- (_CDContextualKeyPath)initWithKey:(id)a3 forDevice:(unint64_t)a4 isUserCentric:(BOOL)a5 isEphemeral:(BOOL)a6
{
  return 0;
}

+ (_CDContextualKeyPath)keyPathWithKey:(id)a3 isUserCentric:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = +[_CDDevice localDevice];
  v8 = [v7 deviceID];
  v9 = (void *)[v6 initWithKey:v5 forDeviceID:v8 isUserCentric:v4 isEphemeral:0];

  return (_CDContextualKeyPath *)v9;
}

+ (id)remotekeyPathForKeyPath:(id)a3 forDevice:(unint64_t)a4
{
  BOOL v4 = (void *)[a3 copy];
  return v4;
}

+ (id)remoteKeyPathForKeyPath:(id)a3 forDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isUserCentric])
  {
    uint64_t v7 = (_CDContextualKeyPath *)[v5 copy];
  }
  else
  {
    v8 = [_CDContextualKeyPath alloc];
    v9 = [v5 key];
    uint64_t v7 = -[_CDContextualKeyPath initWithKey:forDeviceID:isUserCentric:isEphemeral:](v8, "initWithKey:forDeviceID:isUserCentric:isEphemeral:", v9, v6, [v5 isUserCentric], objc_msgSend(v5, "isEphemeral"));
  }
  return v7;
}

- (BOOL)isMultiDeviceKeyPath
{
  if (isMultiDeviceKeyPath_initialized != -1) {
    dispatch_once(&isMultiDeviceKeyPath_initialized, &__block_literal_global_10);
  }
  id v3 = (void *)isMultiDeviceKeyPath_whitelist;
  return [v3 containsObject:self];
}

- (void)setKey:(id)a3
{
}

- (void)setIsUserCentric:(BOOL)a3
{
  self->_isUserCentric = a3;
}

- (void)setIsEphemeral:(BOOL)a3
{
  self->_isEphemeral = a3;
}

@end