@interface INUIExtensionRequestInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresUserConsent;
- (INInteraction)interaction;
- (INUIExtensionRequestInfo)initWithCoder:(id)a3;
- (INUIExtensionRequestInfo)initWithInteraction:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
@end

@implementation INUIExtensionRequestInfo

- (void).cxx_destruct
{
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(INUIExtensionRequestInfo *)self interaction];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = (void *)[v5 initWithInteraction:v7];

  objc_msgSend(v8, "setRequiresUserConsent:", -[INUIExtensionRequestInfo requiresUserConsent](self, "requiresUserConsent"));
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(INUIExtensionRequestInfo *)self interaction];
  [v5 encodeObject:v4 forKey:@"interaction"];

  objc_msgSend(v5, "encodeBool:forKey:", -[INUIExtensionRequestInfo requiresUserConsent](self, "requiresUserConsent"), @"requiresUserConsent");
}

- (INUIExtensionRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interaction"];
  v6 = [(INUIExtensionRequestInfo *)self initWithInteraction:v5];

  if (v6) {
    -[INUIExtensionRequestInfo setRequiresUserConsent:](v6, "setRequiresUserConsent:", [v4 decodeBoolForKey:@"requiresUserConsent"]);
  }

  return v6;
}

- (INUIExtensionRequestInfo)initWithInteraction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIExtensionRequestInfo;
  v6 = [(INUIExtensionRequestInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interaction, a3);
    v7->_requiresUserConsent = 1;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end