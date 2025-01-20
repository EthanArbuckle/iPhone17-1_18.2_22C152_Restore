@interface _EAEmailAddress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)emailAddress;
- (NSString)rawAddress;
- (_EAEmailAddress)initWithCoder:(id)a3;
- (_EAEmailAddress)initWithEmailAddress:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EAEmailAddress

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v2 = [(_EAEmailAddress *)self rawAddress];
  v3 = [v2 lowercaseString];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (_EAEmailAddress)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddress;
  v5 = [(_EAEmailAddress *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_EAEmailAddress *)self rawAddress];
    uint64_t v6 = [v4 rawAddress];
    BOOL v7 = [v5 caseInsensitiveCompare:v6] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)rawAddress
{
  v2 = [(_EAEmailAddress *)self emailAddress];
  v3 = +[EAEmailAddressParser rawAddressFromFullAddress:v2];

  return (NSString *)v3;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (id)description
{
  v2 = [(_EAEmailAddress *)self emailAddress];
  v3 = [v2 description];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EAEmailAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddress;
  v5 = [(_EAEmailAddress *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(_EAEmailAddress *)self emailAddress];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_emailAddress"];
}

@end