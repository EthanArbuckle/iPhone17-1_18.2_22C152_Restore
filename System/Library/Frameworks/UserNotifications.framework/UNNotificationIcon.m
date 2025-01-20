@interface UNNotificationIcon
+ (BOOL)supportsSecureCoding;
+ (id)iconAtPath:(id)a3;
+ (id)iconAtPath:(id)a3 shouldSuppressMask:(BOOL)a4;
+ (id)iconForApplicationIdentifier:(id)a3;
+ (id)iconForSystemImageNamed:(id)a3;
+ (id)iconNamed:(id)a3;
+ (id)iconNamed:(id)a3 shouldSuppressMask:(BOOL)a4;
+ (id)iconWithData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSuppressMask;
- (UNNotificationIcon)init;
- (UNNotificationIcon)initWithCoder:(id)a3;
- (id)_initWithIconInfo:(id)a3 type:(int64_t)a4 shouldSuppressMask:(BOOL)a5;
- (id)applicationIdentifier;
- (id)data;
- (id)description;
- (id)name;
- (id)path;
- (id)systemImageName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationIcon

+ (id)iconNamed:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v4 type:1 shouldSuppressMask:0];

  return v5;
}

+ (id)iconAtPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v4 type:2 shouldSuppressMask:0];

  return v5;
}

+ (id)iconForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v4 type:3 shouldSuppressMask:0];

  return v5;
}

+ (id)iconForSystemImageNamed:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v4 type:4 shouldSuppressMask:0];

  return v5;
}

+ (id)iconWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v4 type:5 shouldSuppressMask:0];

  return v5;
}

+ (id)iconNamed:(id)a3 shouldSuppressMask:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v6 type:1 shouldSuppressMask:v4];

  return v7;
}

+ (id)iconAtPath:(id)a3 shouldSuppressMask:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithIconInfo:v6 type:2 shouldSuppressMask:v4];

  return v7;
}

- (id)_initWithIconInfo:(id)a3 type:(int64_t)a4 shouldSuppressMask:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNNotificationIcon;
  v9 = [(UNNotificationIcon *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id iconInfo = v9->_iconInfo;
    v9->_id iconInfo = (id)v10;

    v9->_iconInfoType = a4;
    v9->_shouldSuppressMask = a5;
  }

  return v9;
}

- (UNNotificationIcon)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UNNotificationIcon.m" lineNumber:74 description:@"use appropriate class method"];

  return 0;
}

- (id)applicationIdentifier
{
  if (self->_iconInfoType == 3)
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = UNSafeCast(v3, self->_iconInfo);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)name
{
  if (self->_iconInfoType == 1)
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = UNSafeCast(v3, self->_iconInfo);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)path
{
  if (self->_iconInfoType == 2)
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = UNSafeCast(v3, self->_iconInfo);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)systemImageName
{
  if (self->_iconInfoType == 4)
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = UNSafeCast(v3, self->_iconInfo);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)data
{
  if (self->_iconInfoType == 5)
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = UNSafeCast(v3, self->_iconInfo);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldSuppressMask
{
  return self->_shouldSuppressMask;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_iconInfo hash];
  BOOL v4 = [NSNumber numberWithInteger:self->_iconInfoType];
  unint64_t v5 = [v4 hash] ^ v3 ^ self->_shouldSuppressMask;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (void **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && UNEqualObjects(self->_iconInfo, v4[1])
    && (void *)self->_iconInfoType == v4[2]
    && self->_shouldSuppressMask == *((unsigned __int8 *)v4 + 24);

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_iconInfoType - 1;
  if (v5 > 4) {
    id v6 = @"[INVALID]";
  }
  else {
    id v6 = off_1E5F06058[v5];
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; iconInfo: %@; iconInfoType: %@; shouldSuppressMask: %d>",
               v4,
               self,
               self->_iconInfo,
               v6,
               self->_shouldSuppressMask);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:2 forKey:@"codingVersion"];
  [v4 encodeObject:self->_iconInfo forKey:@"iconInfo"];
  [v4 encodeInteger:self->_iconInfoType forKey:@"iconInfoType"];
  [v4 encodeBool:self->_shouldSuppressMask forKey:@"shouldSuppressMask"];
}

- (UNNotificationIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"codingVersion"] == 2)
  {
    uint64_t v5 = [v4 decodeIntegerForKey:@"iconInfoType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconInfo"];
    uint64_t v7 = [v4 decodeBoolForKey:@"shouldSuppressMask"];
  }
  else
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    if ([v8 length])
    {
      uint64_t v5 = 3;
      v11 = v8;
    }
    else
    {
      uint64_t v12 = [v9 length];
      if (v12) {
        v11 = v9;
      }
      else {
        v11 = v10;
      }
      if (v12) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = 2;
      }
    }
    id v6 = v11;

    uint64_t v7 = 0;
  }
  objc_super v13 = [(UNNotificationIcon *)self _initWithIconInfo:v6 type:v5 shouldSuppressMask:v7];

  return v13;
}

- (void).cxx_destruct
{
}

@end