@interface ICLRegistrationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICLRegistrationOptions)initWithCoder:(id)a3;
- (ICLRegistrationOptions)initWithTargetUID:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)targetUID;
- (void)encodeWithCoder:(id)a3;
- (void)setTargetUID:(unsigned int)a3;
@end

@implementation ICLRegistrationOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLRegistrationOptions)initWithTargetUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)ICLRegistrationOptions;
  v4 = [(ICLRegistrationOptions *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ICLRegistrationOptions *)v4 setTargetUID:v3];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"targetUID"];
}

- (ICLRegistrationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLRegistrationOptions *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetUID"];
    v5->_targetUID = [v6 unsignedIntValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTargetUID:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLRegistrationOptions *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = [(ICLRegistrationOptions *)v4 targetUID];
      BOOL v6 = v5 == [(ICLRegistrationOptions *)self targetUID];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ICLRegistrationOptions targetUID](self, "targetUID"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (void)setTargetUID:(unsigned int)a3
{
  self->_targetUID = a3;
}

@end