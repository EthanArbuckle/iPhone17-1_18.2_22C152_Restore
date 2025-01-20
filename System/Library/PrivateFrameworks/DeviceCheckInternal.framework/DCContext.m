@interface DCContext
+ (BOOL)supportsSecureCoding;
- (DCContext)initWithCoder:(id)a3;
- (NSString)clientAppID;
- (void)encodeWithCoder:(id)a3;
- (void)setClientAppID:(id)a3;
@end

@implementation DCContext

- (DCContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientAppID"];
    clientAppID = v5->_clientAppID;
    v5->_clientAppID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientAppID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientAppID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end