@interface DMFScheduleOSUpdateRequest
+ (BOOL)_action:(unint64_t *)a3 fromString:(id)a4;
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)_descriptionForAction:(unint64_t)a3;
+ (id)permittedPlatforms;
- (BOOL)useDelay;
- (DMFScheduleOSUpdateRequest)init;
- (DMFScheduleOSUpdateRequest)initWithCoder:(id)a3;
- (NSString)productKey;
- (NSString)productVersion;
- (id)description;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setProductKey:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUseDelay:(BOOL)a3;
@end

@implementation DMFScheduleOSUpdateRequest

+ (BOOL)_action:(unint64_t *)a3 fromString:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    v6 = [a4 lowercaseString];
    if ([v6 isEqualToString:@"download"])
    {
      unint64_t v7 = 0;
    }
    else if ([v6 isEqualToString:@"install"])
    {
      unint64_t v7 = 1;
    }
    else
    {
      if (![v6 isEqualToString:@"default"])
      {
        BOOL v4 = 0;
        goto LABEL_10;
      }
      unint64_t v7 = 2;
    }
    *a3 = v7;
    BOOL v4 = 1;
LABEL_10:
  }
  return v4;
}

+ (id)_descriptionForAction:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid Action";
  }
  else {
    return off_1E6372DC8[a3];
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  BOOL v4 = +[DMFScheduleOSUpdateRequest _descriptionForAction:[(DMFScheduleOSUpdateRequest *)self action]];
  [v3 appendFormat:@"\tAction          : %@\n", v4];

  uint64_t v5 = [(DMFScheduleOSUpdateRequest *)self productKey];
  v6 = (void *)v5;
  if (v5) {
    unint64_t v7 = (__CFString *)v5;
  }
  else {
    unint64_t v7 = @"None";
  }
  [v3 appendFormat:@"\tProduct Key     : %@\n", v7];

  uint64_t v8 = [(DMFScheduleOSUpdateRequest *)self productVersion];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"None";
  }
  [v3 appendFormat:@"\tProduct Version : %@\n", v10];

  BOOL v11 = [(DMFScheduleOSUpdateRequest *)self useDelay];
  v12 = @"NO";
  if (v11) {
    v12 = @"YES";
  }
  [v3 appendFormat:@"\tUse Delay       : %@\n", v12];
  [v3 appendString:@"}>"];
  v13 = (void *)[v3 copy];

  return v13;
}

- (DMFScheduleOSUpdateRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFScheduleOSUpdateRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result)
  {
    result->_action = 2;
    result->_useDelay = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18ABB68;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFScheduleOSUpdateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFScheduleOSUpdateRequest;
  uint64_t v5 = [(CATTaskRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"productKey"];
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"productVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v5->_action = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useDelay"];
    v5->_useDelay = [v13 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFScheduleOSUpdateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  uint64_t v5 = [(DMFScheduleOSUpdateRequest *)self productKey];
  [v4 encodeObject:v5 forKey:@"productKey"];

  v6 = [(DMFScheduleOSUpdateRequest *)self productVersion];
  [v4 encodeObject:v6 forKey:@"productVersion"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFScheduleOSUpdateRequest action](self, "action"));
  [v4 encodeObject:v7 forKey:@"action"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFScheduleOSUpdateRequest useDelay](self, "useDelay"));
  [v4 encodeObject:v8 forKey:@"useDelay"];
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (void)setProductKey:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (BOOL)useDelay
{
  return self->_useDelay;
}

- (void)setUseDelay:(BOOL)a3
{
  self->_useDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end