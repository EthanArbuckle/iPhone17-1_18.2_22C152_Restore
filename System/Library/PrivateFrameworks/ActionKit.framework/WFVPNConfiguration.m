@interface WFVPNConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (INAppDescriptor)appDescriptor;
- (NSString)title;
- (NSUUID)identifier;
- (WFVPNConfiguration)initWithCoder:(id)a3;
- (WFVPNConfiguration)initWithIdentifier:(id)a3 title:(id)a4 appDescriptor:(id)a5;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFVPNConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (INAppDescriptor)appDescriptor
{
  return self->_appDescriptor;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFVPNConfiguration *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(WFVPNConfiguration *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  id v7 = [(WFVPNConfiguration *)self appDescriptor];
  [v4 encodeObject:v7 forKey:@"appDescriptor"];
}

- (WFVPNConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appDescriptor"];

  v8 = [(WFVPNConfiguration *)self initWithIdentifier:v5 title:v6 appDescriptor:v7];
  return v8;
}

- (id)wfSerializedRepresentation
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"identifier";
  v3 = [(WFVPNConfiguration *)self identifier];
  id v4 = [v3 UUIDString];
  v12[1] = @"title";
  v13[0] = v4;
  v5 = [(WFVPNConfiguration *)self title];
  v13[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v7 = (void *)[v6 mutableCopy];

  v8 = [(WFVPNConfiguration *)self appDescriptor];

  if (v8)
  {
    v9 = [(WFVPNConfiguration *)self appDescriptor];
    v10 = [v9 serializedRepresentation];
    [v7 setObject:v10 forKey:@"appDescriptor"];
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFVPNConfiguration *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFVPNConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [(WFVPNConfiguration *)self identifier];
      v8 = [(WFVPNConfiguration *)v6 identifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (WFVPNConfiguration)initWithIdentifier:(id)a3 title:(id)a4 appDescriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFVPNConfiguration;
  v12 = [(WFVPNConfiguration *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_appDescriptor, a5);
    v16 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 objectForKey:@"identifier"];
  v8 = (void *)[v6 initWithUUIDString:v7];

  id v9 = [v5 objectForKey:@"title"];
  id v10 = [v5 objectForKey:@"appDescriptor"];

  if (v10) {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithSerializedRepresentation:v10];
  }
  else {
    id v11 = 0;
  }
  v12 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v8 title:v9 appDescriptor:v11];

  return v12;
}

@end