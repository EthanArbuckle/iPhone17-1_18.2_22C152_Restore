@interface AMSODIAssessment
+ (BOOL)supportsSecureCoding;
- (AMSODIAssessment)initWithCoder:(id)a3;
- (AMSODIAssessment)initWithStringValue:(id)a3;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSODIAssessment

- (AMSODIAssessment)initWithStringValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAssessment;
  v5 = [(AMSODIAssessment *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AMSODIAssessment);
  uint64_t v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  stringValue = v5->_stringValue;
  v5->_stringValue = (NSString *)v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSODIAssessment *)self stringValue];
  [v4 encodeObject:v5 forKey:@"stringValue"];
}

- (AMSODIAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAssessment;
  id v5 = [(AMSODIAssessment *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end