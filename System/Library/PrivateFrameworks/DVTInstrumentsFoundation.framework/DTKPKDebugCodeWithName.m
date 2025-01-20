@interface DTKPKDebugCodeWithName
+ (BOOL)supportsSecureCoding;
- ($8A52862366AC65815A37073D555FDE9A)kdebugCode;
- (BOOL)isEqual:(id)a3;
- (DTKPKDebugCodeWithName)initWithCoder:(id)a3;
- (DTKPKDebugCodeWithName)initWithValue:(unsigned int)a3 name:(id)a4;
- (NSString)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DTKPKDebugCodeWithName

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTKPKDebugCodeWithName)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTKPKDebugCodeWithName;
  v5 = [(DTKPKDebugCodeWithName *)&v9 init];
  if (v5)
  {
    v5->_kdebugCode.value = [v4 decodeInt32ForKey:@"_kdebugCode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t value = self->_kdebugCode.value;
  id v5 = a3;
  [v5 encodeInt32:value forKey:@"_kdebugCode"];
  [v5 encodeObject:self->_name forKey:@"_name"];
}

- (DTKPKDebugCodeWithName)initWithValue:(unsigned int)a3 name:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DTKPKDebugCodeWithName;
  v8 = [(DTKPKDebugCodeWithName *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_kdebugCode.uint64_t value = a3;
    objc_storeStrong((id *)&v8->_name, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_kdebugCode.value;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(DTKPKDebugCodeWithName *)self name];
    id v7 = [v5 name];
    if ([v6 isEqualToString:v7])
    {
      v8.var0 = [(DTKPKDebugCodeWithName *)self kdebugCode];
      BOOL v9 = v8.var0 == [v5 kdebugCode];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- ($8A52862366AC65815A37073D555FDE9A)kdebugCode
{
  return ($8A52862366AC65815A37073D555FDE9A)self->_kdebugCode.value;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end