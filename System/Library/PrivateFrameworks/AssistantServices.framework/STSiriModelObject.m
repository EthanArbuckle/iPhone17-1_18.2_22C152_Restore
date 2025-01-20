@interface STSiriModelObject
+ (BOOL)supportsSecureCoding;
- (Class)_aceCollectionClass;
- (STSiriModelObject)initWithCoder:(id)a3;
- (id)_aceContextObjectValue;
- (id)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation STSiriModelObject

- (void).cxx_destruct
{
}

- (STSiriModelObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSiriModelObject;
  v5 = [(STSiriModelObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (Class)_aceCollectionClass
{
  return 0;
}

- (id)_aceContextObjectValue
{
  return 0;
}

- (void)setIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (id)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end