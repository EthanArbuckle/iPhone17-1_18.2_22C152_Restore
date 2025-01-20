@interface AUv3HostIdentifier
+ (BOOL)supportsSecureCoding;
- (AUv3HostIdentifier)initWithCoder:(id)a3;
- (NSString)name;
- (int64_t)version;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation AUv3HostIdentifier

- (void).cxx_destruct
{
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUv3HostIdentifier;
  [(AUv3HostIdentifier *)&v2 dealloc];
}

- (AUv3HostIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUv3HostIdentifier;
  v5 = [(AUv3HostIdentifier *)&v9 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"version"];
    v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"name"];
    objc_storeStrong((id *)&v5->_name, v7);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_version forKey:@"version"];
  [v4 encodeObject:self->_name forKey:@"name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end