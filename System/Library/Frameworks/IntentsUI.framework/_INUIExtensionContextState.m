@interface _INUIExtensionContextState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)interfaceSections;
- (NSDictionary)hostedViewMaximumAllowedSizes;
- (NSDictionary)hostedViewMinimumAllowedSizes;
- (_INUIExtensionContextState)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHostedViewMaximumAllowedSizes:(id)a3;
- (void)setHostedViewMinimumAllowedSizes:(id)a3;
- (void)setInterfaceSections:(id)a3;
@end

@implementation _INUIExtensionContextState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceSections, 0);
  objc_storeStrong((id *)&self->_hostedViewMaximumAllowedSizes, 0);

  objc_storeStrong((id *)&self->_hostedViewMinimumAllowedSizes, 0);
}

- (void)setInterfaceSections:(id)a3
{
}

- (NSArray)interfaceSections
{
  return self->_interfaceSections;
}

- (void)setHostedViewMaximumAllowedSizes:(id)a3
{
}

- (NSDictionary)hostedViewMaximumAllowedSizes
{
  return self->_hostedViewMaximumAllowedSizes;
}

- (void)setHostedViewMinimumAllowedSizes:(id)a3
{
}

- (NSDictionary)hostedViewMinimumAllowedSizes
{
  return self->_hostedViewMinimumAllowedSizes;
}

- (void)encodeWithCoder:(id)a3
{
  hostedViewMinimumAllowedSizes = self->_hostedViewMinimumAllowedSizes;
  id v5 = a3;
  [v5 encodeObject:hostedViewMinimumAllowedSizes forKey:@"hostedViewMinimumAllowedSizes"];
  [v5 encodeObject:self->_hostedViewMaximumAllowedSizes forKey:@"hostedViewMaximumAllowedSizes"];
  [v5 encodeObject:self->_interfaceSections forKey:@"interfaceSections"];
}

- (_INUIExtensionContextState)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_INUIExtensionContextState;
  id v5 = [(_INUIExtensionContextState *)&v21 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"hostedViewMinimumAllowedSizes"];
    [(_INUIExtensionContextState *)v5 setHostedViewMinimumAllowedSizes:v10];

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"hostedViewMaximumAllowedSizes"];
    [(_INUIExtensionContextState *)v5 setHostedViewMaximumAllowedSizes:v15];

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"interfaceSections"];
    [(_INUIExtensionContextState *)v5 setInterfaceSections:v19];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    hostedViewMinimumAllowedSizes = self->_hostedViewMinimumAllowedSizes;
    BOOL v9 = 0;
    if (hostedViewMinimumAllowedSizes == (NSDictionary *)v5[1]
      || -[NSDictionary isEqual:](hostedViewMinimumAllowedSizes, "isEqual:"))
    {
      hostedViewMaximumAllowedSizes = self->_hostedViewMaximumAllowedSizes;
      if (hostedViewMaximumAllowedSizes == (NSDictionary *)v5[2]
        || -[NSDictionary isEqual:](hostedViewMaximumAllowedSizes, "isEqual:"))
      {
        interfaceSections = self->_interfaceSections;
        if (interfaceSections == (NSArray *)v5[3] || -[NSArray isEqual:](interfaceSections, "isEqual:")) {
          BOOL v9 = 1;
        }
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_hostedViewMinimumAllowedSizes hash];
  uint64_t v4 = [(NSDictionary *)self->_hostedViewMaximumAllowedSizes hash] ^ v3;
  return v4 ^ [(NSArray *)self->_interfaceSections hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end