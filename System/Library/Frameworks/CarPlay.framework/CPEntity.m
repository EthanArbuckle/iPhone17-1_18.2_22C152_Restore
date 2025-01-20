@interface CPEntity
+ (BOOL)supportsSecureCoding;
- (CPEntity)initWithCoder:(id)a3;
- (NSUUID)identifier;
- (id)_init;
- (id)description;
- (id)objectForIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPEntity

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)CPEntity;
  v2 = [(CPEntity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPEntity *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPEntityIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CPEntity *)self identifier];
  [v4 encodeObject:v5 forKey:@"CPEntityIdentifier"];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPEntity;
  id v4 = [(CPEntity *)&v8 description];
  id v5 = [(CPEntity *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@ {UUID: %@}", v4, v5];

  return v6;
}

- (id)objectForIdentifier:(id)a3
{
  return 0;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end