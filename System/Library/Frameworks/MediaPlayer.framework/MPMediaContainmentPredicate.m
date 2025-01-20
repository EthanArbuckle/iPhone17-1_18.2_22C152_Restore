@interface MPMediaContainmentPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)isEqual:(id)a3;
- (MPMediaContainmentPredicate)initWithCoder:(id)a3;
- (NSSet)values;
- (NSString)property;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMediaContainmentPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

- (NSSet)values
{
  return self->_values;
}

- (NSString)property
{
  return self->_property;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)MPMediaContainmentPredicate;
  unint64_t v3 = [(MPMediaContainmentPredicate *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_property hash] ^ v3;
  return v4 ^ [(NSSet *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaContainmentPredicate;
  if ([(MPMediaContainmentPredicate *)&v9 isEqual:v4]
    && ((property = self->_property, property == (NSString *)v4[1])
     || -[NSString isEqualToString:](property, "isEqualToString:")))
  {
    values = self->_values;
    if (values == (NSSet *)v4[2]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSSet isEqual:](values, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@ %p property:'%@' values:%@>", v5, self, self->_property, self->_values];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  property = self->_property;
  id v5 = a3;
  [v5 encodeObject:property forKey:@"containmentProperty"];
  [v5 encodeObject:self->_values forKey:@"containmentValues"];
}

- (MPMediaContainmentPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaContainmentPredicate;
  id v5 = [(MPMediaContainmentPredicate *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containmentProperty"];
    property = v5->_property;
    v5->_property = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"containmentValues"];
    values = v5->_values;
    v5->_values = (NSSet *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uint64_t v10 = (void *)v8[1];
    v8[1] = v9;

    uint64_t v11 = [v7 copy];
    uint64_t v12 = (void *)v8[2];
    v8[2] = v11;
  }

  return v8;
}

- (id)ML3PredicateForContainer
{
  uint64_t v3 = objc_opt_class();

  return [(MPMediaContainmentPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)ML3PredicateForTrack
{
  uint64_t v3 = objc_opt_class();

  return [(MPMediaContainmentPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  id v5 = (void *)MEMORY[0x1E4F79AC8];
  id v6 = [(MPMediaContainmentPredicate *)self property];
  id v7 = [(objc_class *)a3 propertyForMPMediaEntityProperty:v6];
  v8 = [(MPMediaContainmentPredicate *)self values];
  uint64_t v9 = [v5 predicateWithProperty:v7 values:v8];

  return v9;
}

@end