@interface CLSEKSharee
- (BOOL)isCurrentUserForScheduling;
- (BOOL)isCurrentUserForSharing;
- (BOOL)isEqual:(id)a3;
- (CLSEKSharee)initWithCoder:(id)a3;
- (CLSEKSharee)initWithEKSharee:(id)a3;
- (NSString)emailAddress;
- (NSString)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSEKSharee

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (BOOL)isCurrentUserForScheduling
{
  return self->_isCurrentUserForScheduling;
}

- (BOOL)isCurrentUserForSharing
{
  return self->_isCurrentUserForSharing;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSEKSharee *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      emailAddress = self->_emailAddress;
      if (emailAddress == v5->_emailAddress || -[NSString isEqualToString:](emailAddress, "isEqualToString:"))
      {
        name = self->_name;
        if (name == v5->_name) {
          char v8 = 1;
        }
        else {
          char v8 = -[NSString isEqualToString:](name, "isEqualToString:");
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_emailAddress hash];
  return (17 * [(NSString *)self->_name hash]) ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  emailAddress = self->_emailAddress;
  id v5 = a3;
  [v5 encodeObject:emailAddress forKey:@"emailAddress"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeBool:self->_isCurrentUserForSharing forKey:@"isCurrentUserForSharing"];
  [v5 encodeBool:self->_isCurrentUserForScheduling forKey:@"isCurrentUserForScheduling"];
}

- (CLSEKSharee)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEKSharee;
  id v5 = [(CLSEKSharee *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_isCurrentUserForSharing = [v4 decodeBoolForKey:@"isCurrentUserForSharing"];
    v5->_isCurrentUserForScheduling = [v4 decodeBoolForKey:@"isCurrentUserForScheduling"];
  }

  return v5;
}

- (CLSEKSharee)initWithEKSharee:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEKSharee;
  id v5 = [(CLSEKSharee *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 emailAddress];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

    uint64_t v8 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

@end