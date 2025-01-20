@interface CTSlicedRunningAppInfo
+ (BOOL)supportsSecureCoding;
- (CTSlicedRunningAppInfo)initWithCoder:(id)a3;
- (NSArray)interfaces;
- (NSNumber)foreground;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setForeground:(id)a3;
- (void)setInterfaces:(id)a3;
@end

@implementation CTSlicedRunningAppInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSlicedRunningAppInfo *)self bundleId];

  if (v4)
  {
    v5 = [(CTSlicedRunningAppInfo *)self bundleId];
    [v3 appendFormat:@", bundleId=[%@]", v5];
  }
  v6 = [(CTSlicedRunningAppInfo *)self foreground];

  if (v6)
  {
    v7 = [(CTSlicedRunningAppInfo *)self foreground];
    [v3 appendFormat:@", foreground=%@", v7];
  }
  v8 = [(CTSlicedRunningAppInfo *)self interfaces];

  if (v8)
  {
    v9 = [(CTSlicedRunningAppInfo *)self interfaces];
    [v3 appendFormat:@", interfaces=[%@]", v9];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSlicedRunningAppInfo *)self bundleId];

  if (v5)
  {
    v6 = [(CTSlicedRunningAppInfo *)self bundleId];
    v7 = (void *)[v6 copy];
    [v4 setBundleId:v7];
  }
  v8 = [(CTSlicedRunningAppInfo *)self foreground];

  if (v8)
  {
    v9 = [(CTSlicedRunningAppInfo *)self foreground];
    v10 = (void *)[v9 copy];
    [v4 setForeground:v10];
  }
  v11 = [(CTSlicedRunningAppInfo *)self interfaces];

  if (v11)
  {
    v12 = [(CTSlicedRunningAppInfo *)self interfaces];
    v13 = (void *)[v12 copy];
    [v4 setInterfaces:v13];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(CTSlicedRunningAppInfo *)self bundleId];

  if (v4)
  {
    v5 = [(CTSlicedRunningAppInfo *)self bundleId];
    [v10 encodeObject:v5 forKey:@"bundleId"];
  }
  v6 = [(CTSlicedRunningAppInfo *)self foreground];

  if (v6)
  {
    v7 = [(CTSlicedRunningAppInfo *)self foreground];
    [v10 encodeObject:v7 forKey:@"foreground"];
  }
  v8 = [(CTSlicedRunningAppInfo *)self interfaces];

  if (v8)
  {
    v9 = [(CTSlicedRunningAppInfo *)self interfaces];
    [v10 encodeObject:v9 forKey:@"interfaces"];
  }
}

- (CTSlicedRunningAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTSlicedRunningAppInfo;
  v5 = [(CTSlicedRunningAppInfo *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreground"];
    foreground = v5->_foreground;
    v5->_foreground = (NSNumber *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"interfaces"];
    interfaces = v5->_interfaces;
    v5->_interfaces = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSNumber)foreground
{
  return self->_foreground;
}

- (void)setForeground:(id)a3
{
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_foreground, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end