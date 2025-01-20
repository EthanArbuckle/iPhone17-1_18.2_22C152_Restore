@interface INUIInterfaceSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INUIInterfaceSection)initWithCoder:(id)a3;
- (INUIInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4;
- (NSSet)parameters;
- (unint64_t)hash;
- (unint64_t)interactiveBehavior;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INUIInterfaceSection

- (void).cxx_destruct
{
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (unint64_t)interactiveBehavior
{
  return self->_interactiveBehavior;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t interactiveBehavior = self->_interactiveBehavior;
  id v5 = a3;
  [v5 encodeInteger:interactiveBehavior forKey:@"interactiveBehavior"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
}

- (INUIInterfaceSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"interactiveBehavior"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parameters"];

  v10 = [(INUIInterfaceSection *)self initWithInteractiveBehavior:v5 parameters:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    BOOL v7 = 0;
    if (self->_interactiveBehavior == v5[1])
    {
      parameters = self->_parameters;
      if (parameters == (NSSet *)v5[2] || -[NSSet isEqual:](parameters, "isEqual:")) {
        BOOL v7 = 1;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t interactiveBehavior = self->_interactiveBehavior;
  return [(NSSet *)self->_parameters hash] ^ interactiveBehavior;
}

- (INUIInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INUIInterfaceSection;
  BOOL v7 = [(INUIInterfaceSection *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_unint64_t interactiveBehavior = a3;
    uint64_t v9 = [v6 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSSet *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end