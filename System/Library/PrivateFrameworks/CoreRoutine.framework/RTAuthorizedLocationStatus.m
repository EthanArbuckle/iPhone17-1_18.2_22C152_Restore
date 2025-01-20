@interface RTAuthorizedLocationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTAuthorizedLocationStatus)initWithCoder:(id)a3;
- (RTAuthorizedLocationStatus)initWithStatus:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTAuthorizedLocationStatus

- (RTAuthorizedLocationStatus)initWithStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTAuthorizedLocationStatus;
  result = [(RTAuthorizedLocationStatus *)&v5 init];
  if (result) {
    result->_eStatus = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTAuthorizedLocationStatus)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"RTAuthorizedLocationStatus"];
  return [(RTAuthorizedLocationStatus *)self initWithStatus:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t eStatus = self->_eStatus;
  return (id)[v4 initWithStatus:eStatus];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    int64_t eStatus = self->_eStatus;
    BOOL v7 = eStatus == [v4 eStatus];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t eStatus = self->_eStatus;
  if (eStatus > 2) {
    v3 = @"Invalid.";
  }
  else {
    v3 = off_1E5D74640[eStatus];
  }
  return (id)[NSString stringWithFormat:@"status,%ld,statusString,%@", eStatus, v3];
}

- (int64_t)eStatus
{
  return self->_eStatus;
}

@end