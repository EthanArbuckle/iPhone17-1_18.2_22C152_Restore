@interface CTIPFilterContainer
+ (BOOL)supportsSecureCoding;
- (CTIPFilterContainer)initWithCoder:(id)a3;
- (NSArray)filters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFilters:(id)a3;
@end

@implementation CTIPFilterContainer

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTIPFilterContainer *)self filters];

  if (v4)
  {
    v5 = [(CTIPFilterContainer *)self filters];
    [v3 appendFormat:@", filters=%@", v5];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTIPFilterContainer *)self filters];
  v6 = (void *)[v5 copy];
  [v4 setFilters:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTIPFilterContainer *)self filters];
  [v4 encodeObject:v5 forKey:@"filters"];
}

- (CTIPFilterContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTIPFilterContainer;
  id v5 = [(CTIPFilterContainer *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"filters"];
    filters = v5->_filters;
    v5->_filters = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end