@interface HPSSetting
+ (BOOL)supportsSecureCoding;
+ (Class)valueClass;
+ (HPSSetting)settingWithKeyPath:(id)a3 value:(id)a4;
+ (id)valueClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSetting:(id)a3;
- (BOOL)isEquivalentToSetting:(id)a3;
- (HPSSetting)initWithCoder:(id)a3;
- (HPSSetting)initWithKeyPath:(id)a3 value:(id)a4;
- (NSDate)lastModifiedDate;
- (NSObject)value;
- (NSString)keyPath;
- (NSString)lastModifiedDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLastModifiedDate:(id)a3;
@end

@implementation HPSSetting

- (HPSSetting)initWithKeyPath:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class()) {
    objc_exception_throw( (id) *MEMORY[0x263EFF498]);
  }
  v17.receiver = self;
  v17.super_class = (Class)HPSSetting;
  v9 = [(HPSSetting *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    uint64_t v12 = [v7 copyWithZone:0];
    value = v9->_value;
    v9->_value = v12;

    uint64_t v14 = [MEMORY[0x263EFF910] distantPast];
    lastModifiedDate = v9->_lastModifiedDate;
    v9->_lastModifiedDate = (NSDate *)v14;
  }
  return v9;
}

+ (HPSSetting)settingWithKeyPath:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithKeyPath:v7 value:v6];

  return (HPSSetting *)v8;
}

- (BOOL)isEquivalentToSetting:(id)a3
{
  id v4 = a3;
  v5 = [(HPSSetting *)self value];

  id v6 = [(HPSSetting *)self keyPath];
  id v7 = [v4 keyPath];
  int v8 = [v6 isEqualToString:v7];
  if (!v5)
  {
    if (v8)
    {
      v9 = [v4 value];
      char v11 = v9 == 0;
      goto LABEL_6;
    }
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  if (!v8) {
    goto LABEL_7;
  }
  v9 = [(HPSSetting *)self value];
  uint64_t v10 = [v4 value];
  char v11 = [v9 isEqual:v10];

LABEL_6:
LABEL_8:

  return v11;
}

- (BOOL)isEqualToSetting:(id)a3
{
  id v4 = a3;
  v5 = [(HPSSetting *)self value];

  id v6 = [(HPSSetting *)self keyPath];
  id v7 = [v4 keyPath];
  int v8 = [v6 isEqualToString:v7];
  if (v5)
  {
    if (v8)
    {
      v9 = [(HPSSetting *)self value];
      uint64_t v10 = [v4 value];
      if (![v9 isEqual:v10])
      {
        char v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
      char v11 = [(HPSSetting *)self lastModifiedDate];
      uint64_t v12 = [v4 lastModifiedDate];
      char v13 = [v11 isEqual:v12];

LABEL_11:
      goto LABEL_12;
    }
  }
  else if (v8)
  {
    v9 = [v4 value];
    if (v9)
    {
      char v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v10 = [(HPSSetting *)self lastModifiedDate];
    char v11 = [v4 lastModifiedDate];
    char v13 = [v10 isEqual:v11];
    goto LABEL_11;
  }
  char v13 = 0;
LABEL_14:

  return v13;
}

+ (Class)valueClass
{
  return 0;
}

+ (id)valueClasses
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HPSSetting *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HPSSetting *)self isEqualToSetting:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(HPSSetting *)self keyPath];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(HPSSetting *)self keyPath];
  id v7 = [(HPSSetting *)self value];
  int v8 = [(HPSSetting *)self lastModifiedDescription];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ = %@%@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSString)lastModifiedDescription
{
  unint64_t v3 = [(HPSSetting *)self lastModifiedDate];
  id v4 = [MEMORY[0x263EFF910] distantPast];
  if ([v3 isEqualToDate:v4])
  {
    BOOL v5 = &stru_26F0EFD70;
  }
  else
  {
    id v6 = NSString;
    id v7 = [(HPSSetting *)self lastModifiedDate];
    BOOL v5 = [v6 stringWithFormat:@" (modified: %@)", v7];
  }
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(HPSSetting *)self keyPath];
  [v9 encodeObject:v4 forKey:@"setting.keypath"];

  BOOL v5 = [(HPSSetting *)self value];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v6 setRequiresSecureCoding:1];
    [v6 encodeObject:v5 forKey:@"setting.value"];
    id v7 = [v6 encodedData];
    [v9 encodeObject:v7 forKey:@"setting.value"];
  }
  int v8 = [(HPSSetting *)self lastModifiedDate];
  [v9 encodeObject:v8 forKey:@"setting.lastmodifieddate"];
}

- (HPSSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HPSSetting;
  BOOL v5 = [(HPSSetting *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.keypath"];
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    if (!v5->_keyPath) {
      goto LABEL_14;
    }
    if ([v4 containsValueForKey:@"setting.value"])
    {
      int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.value"];
      id v24 = 0;
      id v9 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v8 error:&v24];
      id v10 = v24;
      [v9 setRequiresSecureCoding:1];
      [v9 _enableStrictSecureDecodingMode];
      [v9 setDecodingFailurePolicy:1];
      char v11 = [(id)objc_opt_class() valueClass];
      if (v11)
      {
        uint64_t v12 = [v9 decodeObjectOfClass:v11 forKey:@"setting.value"];
        value = v5->_value;
        v5->_value = v12;

        if (!v5->_value)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v14 = [(id)objc_opt_class() valueClasses];
        if (!v14) {
          goto LABEL_13;
        }
        v15 = (void *)v14;
        uint64_t v16 = [v9 decodeObjectOfClasses:v14 forKey:@"setting.value"];
        objc_super v17 = v5->_value;
        v5->_value = v16;

        v18 = v5->_value;
        if (!v18) {
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"setting.lastmodifieddate"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v19;

    v21 = v5->_lastModifiedDate;
    if (!v21)
    {
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
  }
  v22 = v5;
LABEL_15:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)value
{
  return self->_value;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end