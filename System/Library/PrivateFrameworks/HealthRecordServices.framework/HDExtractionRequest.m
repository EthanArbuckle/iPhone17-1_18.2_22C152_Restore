@interface HDExtractionRequest
+ (BOOL)supportsSecureCoding;
- (HDExtractionRequest)initWithCoder:(id)a3;
- (HDExtractionRequest)initWithResources:(id)a3;
- (NSArray)resources;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDExtractionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HDExtractionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"Resources"];
  if (v6)
  {
    self = [(HDExtractionRequest *)self initWithResources:v6];
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (HDExtractionRequest)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDExtractionRequest;
  v5 = [(HDExtractionRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    resources = v5->_resources;
    v5->_resources = (NSArray *)v6;
  }
  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p, %ld resources>", v5, self, -[NSArray count](self->_resources, "count")];

  return v6;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
}

@end