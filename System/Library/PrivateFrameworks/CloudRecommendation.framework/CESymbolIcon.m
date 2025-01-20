@interface CESymbolIcon
+ (BOOL)supportsSecureCoding;
- (CESymbolIcon)initWithCoder:(id)a3;
- (CESymbolIcon)initWithDictionary:(id)a3;
- (NSString)identifier;
- (NSString)path;
- (NSString)systemColorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPath:(id)a3;
- (void)setSystemColorName:(id)a3;
@end

@implementation CESymbolIcon

- (CESymbolIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CESymbolIcon;
  v5 = [(CEIcon *)&v16 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"id"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      identifier = v5->_identifier;
      v5->_identifier = v7;
    }
    else
    {
      identifier = _CELogSystem();
      if (os_log_type_enabled(identifier, OS_LOG_TYPE_DEBUG)) {
        -[CESymbolIcon initWithDictionary:]();
      }
    }

    v9 = [v4 objectForKeyedSubscript:@"path"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v9;
      path = v5->_path;
      v5->_path = v10;
    }
    else
    {
      path = _CELogSystem();
      if (os_log_type_enabled(path, OS_LOG_TYPE_DEBUG)) {
        -[CESymbolIcon initWithDictionary:]();
      }
    }

    v12 = [v4 objectForKeyedSubscript:@"color"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = v12;
      systemColorName = v5->_systemColorName;
      v5->_systemColorName = v13;
    }
    else
    {
      systemColorName = _CELogSystem();
      if (os_log_type_enabled(systemColorName, OS_LOG_TYPE_DEBUG)) {
        -[CESymbolIcon initWithDictionary:]();
      }
    }
  }
  return v5;
}

- (CESymbolIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CESymbolIcon;
  v5 = [(CEIcon *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemColorName"];
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CESymbolIcon;
  id v4 = [(CEIcon *)&v6 copyWithZone:a3];
  [v4 setIdentifier:self->_identifier];
  [v4 setPath:self->_path];
  [v4 setSystemColorName:self->_systemColorName];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CESymbolIcon;
  id v4 = a3;
  [(CEIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_path forKey:@"path"];
  [v4 encodeObject:self->_systemColorName forKey:@"systemColorName"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CESymbolIcon;
  v3 = [(CEIcon *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" id: %@, path: %@, systemColorName: %@", self->_identifier, self->_path, self->_systemColorName];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemColorName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse color from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse path from dictionary", v4, v5, v6, v7, v8);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse identifier from dictionary", v4, v5, v6, v7, v8);
}

@end