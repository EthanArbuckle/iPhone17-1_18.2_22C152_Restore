@interface DAEGrantedDelegate
+ (BOOL)supportsSecureCoding;
- (DAEGrantedDelegate)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)preferredUserAddress;
- (NSString)uri;
- (int64_t)permission;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPermission:(int64_t)a3;
- (void)setPreferredUserAddress:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation DAEGrantedDelegate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEGrantedDelegate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DAEGrantedDelegate;
  v5 = [(DAEGrantedDelegate *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uri"];
    uri = v5->_uri;
    v5->_uri = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredUserAddress"];
    preferredUserAddress = v5->_preferredUserAddress;
    v5->_preferredUserAddress = (NSString *)v10;

    v5->_permission = [v4 decodeIntegerForKey:@"permission"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uri = self->_uri;
  id v5 = a3;
  [v5 encodeObject:uri forKey:@"uri"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_preferredUserAddress forKey:@"preferredUserAddress"];
  [v5 encodeInteger:self->_permission forKey:@"permission"];
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)preferredUserAddress
{
  return self->_preferredUserAddress;
}

- (void)setPreferredUserAddress:(id)a3
{
}

- (int64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(int64_t)a3
{
  self->_permission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredUserAddress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end