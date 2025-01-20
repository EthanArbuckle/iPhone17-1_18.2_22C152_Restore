@interface CTSlicedRunningAppInfoContainer
+ (BOOL)supportsSecureCoding;
- (CTSlicedRunningAppInfoContainer)initWithCoder:(id)a3;
- (NSArray)appsInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppsInfo:(id)a3;
@end

@implementation CTSlicedRunningAppInfoContainer

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];

  if (v4)
  {
    v5 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];
    [v3 appendFormat:@", appsInfo=[%@]", v5];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];

  if (v5)
  {
    v6 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];
    v7 = (void *)[v6 copy];
    [v4 setAppsInfo:v7];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];

  if (v4)
  {
    v5 = [(CTSlicedRunningAppInfoContainer *)self appsInfo];
    [v6 encodeObject:v5 forKey:@"appsInfo"];
  }
}

- (CTSlicedRunningAppInfoContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSlicedRunningAppInfoContainer;
  v5 = [(CTSlicedRunningAppInfoContainer *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appsInfo"];
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)appsInfo
{
  return self->_appsInfo;
}

- (void)setAppsInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end