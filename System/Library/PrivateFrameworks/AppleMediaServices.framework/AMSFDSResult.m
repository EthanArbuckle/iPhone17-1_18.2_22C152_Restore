@interface AMSFDSResult
+ (BOOL)supportsSecureCoding;
- (AMSFDSResult)initWithCoder:(id)a3;
- (AMSFDSResult)initWithValue:(id)a3 action:(unint64_t)a4;
- (NSString)sessionIdentifier;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionIdentifier:(id)a3;
@end

@implementation AMSFDSResult

- (AMSFDSResult)initWithValue:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSFDSResult;
  v7 = [(AMSFDSResult *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_action = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AMSFDSResult);
  v5->_action = self->_action;
  uint64_t v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_value copyWithZone:a3];
  value = v5->_value;
  v5->_value = (NSString *)v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSFDSResult action](self, "action"), @"action");
  v5 = [(AMSFDSResult *)self sessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sessionIdentifier"];

  id v6 = [(AMSFDSResult *)self value];
  [v4 encodeObject:v6 forKey:@"value"];
}

- (AMSFDSResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSFDSResult;
  v5 = [(AMSFDSResult *)&v11 init];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end