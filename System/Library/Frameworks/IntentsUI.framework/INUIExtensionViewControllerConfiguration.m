@interface INUIExtensionViewControllerConfiguration
+ (BOOL)supportsSecureCoding;
- (INUIExtensionViewControllerConfiguration)initWithCoder:(id)a3;
- (INUIExtensionViewControllerConfiguration)initWithParameters:(id)a3 interactiveBehavior:(unint64_t)a4 hostedViewContext:(unint64_t)a5;
- (NSSet)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hostedViewContext;
- (unint64_t)interactiveBehavior;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INUIExtensionViewControllerConfiguration

- (void).cxx_destruct
{
}

- (unint64_t)hostedViewContext
{
  return self->_hostedViewContext;
}

- (unint64_t)interactiveBehavior
{
  return self->_interactiveBehavior;
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(INUIExtensionViewControllerConfiguration *)self parameters];
  [v5 encodeObject:v4 forKey:@"parameters"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[INUIExtensionViewControllerConfiguration hostedViewContext](self, "hostedViewContext"), @"hostedViewContext");
  objc_msgSend(v5, "encodeInteger:forKey:", -[INUIExtensionViewControllerConfiguration interactiveBehavior](self, "interactiveBehavior"), @"interactiveBehavior");
}

- (INUIExtensionViewControllerConfiguration)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"parameters"];
  uint64_t v9 = [v5 decodeIntegerForKey:@"interactiveBehavior"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"hostedViewContext"];

  v11 = [(INUIExtensionViewControllerConfiguration *)self initWithParameters:v8 interactiveBehavior:v9 hostedViewContext:v10];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = (void *)[(NSSet *)self->_parameters copyWithZone:a3];
  v7 = objc_msgSend(v5, "initWithParameters:interactiveBehavior:hostedViewContext:", v6, -[INUIExtensionViewControllerConfiguration interactiveBehavior](self, "interactiveBehavior"), -[INUIExtensionViewControllerConfiguration hostedViewContext](self, "hostedViewContext"));

  return v7;
}

- (INUIExtensionViewControllerConfiguration)initWithParameters:(id)a3 interactiveBehavior:(unint64_t)a4 hostedViewContext:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INUIExtensionViewControllerConfiguration;
  uint64_t v9 = [(INUIExtensionViewControllerConfiguration *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    parameters = v9->_parameters;
    v9->_parameters = (NSSet *)v10;

    v9->_interactiveBehavior = a4;
    v9->_hostedViewContext = a5;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end