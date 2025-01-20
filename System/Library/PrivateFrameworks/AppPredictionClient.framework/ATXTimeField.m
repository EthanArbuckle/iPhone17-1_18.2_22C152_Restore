@interface ATXTimeField
+ (BOOL)supportsSecureCoding;
- (ATXTimeField)initWithCoder:(id)a3;
- (ATXTimeField)initWithTitle:(id)a3 value:(id)a4;
- (NSString)title;
- (NSString)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeField

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeField)initWithTitle:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeField;
  v8 = [(ATXTimeField *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (ATXTimeField)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  id v7 = [(ATXTimeField *)self initWithTitle:v5 value:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end