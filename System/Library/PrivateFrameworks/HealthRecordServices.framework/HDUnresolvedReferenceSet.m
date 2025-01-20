@interface HDUnresolvedReferenceSet
+ (BOOL)supportsSecureCoding;
- (HDFHIRResourceObject)resource;
- (HDUnresolvedReferenceSet)init;
- (HDUnresolvedReferenceSet)initWithCoder:(id)a3;
- (HDUnresolvedReferenceSet)initWithReferences:(id)a3 resource:(id)a4;
- (NSSet)references;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDUnresolvedReferenceSet

- (HDUnresolvedReferenceSet)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUnresolvedReferenceSet)initWithReferences:(id)a3 resource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDUnresolvedReferenceSet;
  v8 = [(HDUnresolvedReferenceSet *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    references = v8->_references;
    v8->_references = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_resource, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HDUnresolvedReferenceSet *)self references];
  [v4 encodeObject:v5 forKey:@"References"];

  id v6 = [(HDUnresolvedReferenceSet *)self resource];
  [v4 encodeObject:v6 forKey:@"Resource"];
}

- (HDUnresolvedReferenceSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"References"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Resource"];
  v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    objc_super v12 = 0;
  }
  else
  {
    self = [(HDUnresolvedReferenceSet *)self initWithReferences:v8 resource:v9];
    objc_super v12 = self;
  }

  return v12;
}

- (NSSet)references
{
  return self->_references;
}

- (HDFHIRResourceObject)resource
{
  return self->_resource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);

  objc_storeStrong((id *)&self->_references, 0);
}

@end