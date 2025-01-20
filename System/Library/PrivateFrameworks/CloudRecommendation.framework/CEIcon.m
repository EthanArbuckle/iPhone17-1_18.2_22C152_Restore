@interface CEIcon
+ (BOOL)supportsSecureCoding;
- (CEIcon)initWithCoder:(id)a3;
- (CEIcon)initWithDictionary:(id)a3;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CEIcon

- (CEIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEIcon;
  v5 = [(CEIcon *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      type = v5->_type;
      v5->_type = v7;
    }
    else
    {
      type = _CELogSystem();
      if (os_log_type_enabled(type, OS_LOG_TYPE_DEBUG)) {
        -[CEIcon initWithDictionary:]();
      }
    }
  }
  return v5;
}

- (CEIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEIcon;
  v5 = [(CEIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Icon with type: %@", self->_type];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CEIcon allocWithZone:a3] init];
  [(CEIcon *)v4 setType:self->_type];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse type from dictionary", v4, v5, v6, v7, v8);
}

@end