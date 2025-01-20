@interface AXRequest
+ (BOOL)supportsSecureCoding;
- (AXRequest)initWithCoder:(id)a3;
- (AXRequest)initWithTechnology:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)technology;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTechnology:(id)a3;
@end

@implementation AXRequest

- (AXRequest)initWithTechnology:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXRequest;
  id v3 = a3;
  v4 = [(AXRequest *)&v6 init];
  -[AXRequest setTechnology:](v4, "setTechnology:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  v7.receiver = v3;
  v7.super_class = (Class)AXRequest;
  v4 = [(AXRequest *)&v7 init];
  v5 = [(AXRequest *)v3 technology];
  [(AXRequest *)v4 setTechnology:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXRequest *)self technology];
  [v4 encodeObject:v5 forKey:@"technology"];
}

- (AXRequest)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AXRequest *)self init];
  objc_super v6 = (void *)MEMORY[0x263EFFA08];
  v11[0] = objc_opt_class();
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"technology"];

  [(AXRequest *)v5 setTechnology:v9];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 technology];

    objc_super v6 = [(AXRequest *)self technology];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXRequest;
    unsigned __int8 v7 = [(AXRequest *)&v9 isEqual:v4];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)technology
{
  return self->_technology;
}

- (void)setTechnology:(id)a3
{
}

- (void).cxx_destruct
{
}

@end