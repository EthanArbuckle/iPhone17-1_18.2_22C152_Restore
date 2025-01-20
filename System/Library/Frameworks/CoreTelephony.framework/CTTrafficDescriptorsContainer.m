@interface CTTrafficDescriptorsContainer
+ (BOOL)supportsSecureCoding;
- (CTTrafficDescriptorsContainer)initWithCoder:(id)a3;
- (NSArray)trafficDescriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTrafficDescriptors:(id)a3;
@end

@implementation CTTrafficDescriptorsContainer

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];

  if (v4)
  {
    v5 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];
    [v3 appendFormat:@", trafficDescriptors=[%@]", v5];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];

  if (v5)
  {
    v6 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];
    v7 = (void *)[v6 copy];
    [v4 setTrafficDescriptors:v7];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];

  if (v4)
  {
    v5 = [(CTTrafficDescriptorsContainer *)self trafficDescriptors];
    [v6 encodeObject:v5 forKey:@"trafficDescriptors"];
  }
}

- (CTTrafficDescriptorsContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTTrafficDescriptorsContainer;
  v5 = [(CTTrafficDescriptorsContainer *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"trafficDescriptors"];
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (void)setTrafficDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end