@interface AMSODIAdditionalAttributes
+ (BOOL)supportsSecureCoding;
- (AMSODIAdditionalAttributes)initWithAttributes:(id)a3;
- (AMSODIAdditionalAttributes)initWithCoder:(id)a3;
- (NSDictionary)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
@end

@implementation AMSODIAdditionalAttributes

- (AMSODIAdditionalAttributes)initWithAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAdditionalAttributes;
  v5 = [(AMSODIAdditionalAttributes *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AMSODIAdditionalAttributes);
  uint64_t v6 = [(NSDictionary *)self->_attributes copyWithZone:a3];
  attributes = v5->_attributes;
  v5->_attributes = (NSDictionary *)v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AMSODIAdditionalAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSODIAdditionalAttributes;
  v5 = [(AMSODIAdditionalAttributes *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end