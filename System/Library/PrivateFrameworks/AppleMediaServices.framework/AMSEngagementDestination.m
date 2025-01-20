@interface AMSEngagementDestination
+ (BOOL)supportsSecureCoding;
- (AMSEngagementDestination)initWithCoder:(id)a3;
- (AMSEngagementDestination)initWithIdentifier:(id)a3;
- (BOOL)allowsResponse;
- (NSString)identifier;
- (id)description;
- (unint64_t)components;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsResponse:(BOOL)a3;
- (void)setComponents:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSEngagementDestination

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(AMSEngagementDestination *)self identifier];
  [v5 encodeObject:v4 forKey:@"kCodingKeyIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[AMSEngagementDestination allowsResponse](self, "allowsResponse"), @"kCodingKeyAllowsResponse");
  objc_msgSend(v5, "encodeInteger:forKey:", -[AMSEngagementDestination components](self, "components"), @"kCodingKeyComponents");
}

- (unint64_t)components
{
  return self->_components;
}

- (BOOL)allowsResponse
{
  return self->_allowsResponse;
}

- (id)description
{
  v2 = NSString;
  v3 = [(AMSEngagementDestination *)self identifier];
  v4 = [v2 stringWithFormat:@"<AMSEngagementDestination: %@>", v3];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (AMSEngagementDestination)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementDestination;
  v6 = [(AMSEngagementDestination *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_components = -1;
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (void)setComponents:(unint64_t)a3
{
  self->_components = a3;
}

- (void)setAllowsResponse:(BOOL)a3
{
  self->_allowsResponse = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSEngagementDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSEngagementDestination;
  id v5 = [(AMSEngagementDestination *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_allowsResponse = [v4 decodeBoolForKey:@"kCodingKeyAllowsResponse"];
    v5->_components = [v4 decodeIntegerForKey:@"kCodingKeyComponents"];
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setIdentifier:(id)a3
{
}

@end