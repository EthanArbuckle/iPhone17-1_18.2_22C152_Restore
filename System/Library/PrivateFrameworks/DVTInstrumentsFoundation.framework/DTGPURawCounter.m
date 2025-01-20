@interface DTGPURawCounter
- (BOOL)isEqual:(id)a3;
- (DTGPURawCounter)initWithName:(id)a3;
- (NSString)name;
- (unint64_t)hash;
- (void)setName:(id)a3;
@end

@implementation DTGPURawCounter

- (DTGPURawCounter)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTGPURawCounter;
  v6 = [(DTGPURawCounter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return MEMORY[0x270F9A6D0](self->_name, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    name = self->_name;
    v6 = [v4 name];
    BOOL v7 = [(NSString *)name isEqualToString:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end