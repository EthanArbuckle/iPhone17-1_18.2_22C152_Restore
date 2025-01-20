@interface _CDContextualKeyPathAndValue
+ (BOOL)supportsSecureCoding;
- (_CDContextValue)value;
- (_CDContextualKeyPath)keyPath;
- (_CDContextualKeyPathAndValue)initWithCoder:(id)a3;
- (_CDContextualKeyPathAndValue)initWithKeyPath:(id)a3 andValue:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _CDContextualKeyPathAndValue

- (void)encodeWithCoder:(id)a3
{
  keyPath = self->_keyPath;
  id v5 = a3;
  [v5 encodeObject:keyPath forKey:@"key"];
  [v5 encodeObject:self->_value forKey:@"val"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (_CDContextualKeyPathAndValue)initWithKeyPath:(id)a3 andValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CDContextualKeyPathAndValue;
  v9 = [(_CDContextualKeyPathAndValue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (_CDContextualKeyPathAndValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"val"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(_CDContextualKeyPathAndValue *)self initWithKeyPath:v5 andValue:v6];
    id v8 = self;
  }

  return v8;
}

- (_CDContextualKeyPath)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (_CDContextValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

@end