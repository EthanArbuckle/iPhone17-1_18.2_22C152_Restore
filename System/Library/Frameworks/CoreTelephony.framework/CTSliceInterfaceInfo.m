@interface CTSliceInterfaceInfo
+ (BOOL)supportsSecureCoding;
- (CTSliceInterfaceInfo)initWithCoder:(id)a3;
- (NSArray)trafficDescriptors;
- (NSString)interface;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setInterface:(id)a3;
- (void)setTrafficDescriptors:(id)a3;
@end

@implementation CTSliceInterfaceInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSliceInterfaceInfo *)self interface];

  if (v4)
  {
    v5 = [(CTSliceInterfaceInfo *)self interface];
    [v3 appendFormat:@", interface=[%@]", v5];
  }
  v6 = [(CTSliceInterfaceInfo *)self trafficDescriptors];

  if (v6)
  {
    v7 = [(CTSliceInterfaceInfo *)self trafficDescriptors];
    [v3 appendFormat:@", trafficDescriptors=[%@]", v7];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSliceInterfaceInfo *)self interface];

  if (v5)
  {
    v6 = [(CTSliceInterfaceInfo *)self interface];
    v7 = (void *)[v6 copy];
    [v4 setInterface:v7];
  }
  v8 = [(CTSliceInterfaceInfo *)self trafficDescriptors];

  if (v8)
  {
    v9 = [(CTSliceInterfaceInfo *)self trafficDescriptors];
    v10 = (void *)[v9 copy];
    [v4 setTrafficDescriptors:v10];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(CTSliceInterfaceInfo *)self interface];

  if (v4)
  {
    v5 = [(CTSliceInterfaceInfo *)self interface];
    [v8 encodeObject:v5 forKey:@"interface"];
  }
  v6 = [(CTSliceInterfaceInfo *)self trafficDescriptors];

  if (v6)
  {
    v7 = [(CTSliceInterfaceInfo *)self trafficDescriptors];
    [v8 encodeObject:v7 forKey:@"trafficDescriptors"];
  }
}

- (CTSliceInterfaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSliceInterfaceInfo;
  v5 = [(CTSliceInterfaceInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interface"];
    interface = v5->_interface;
    v5->_interface = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"trafficDescriptors"];
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
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
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end