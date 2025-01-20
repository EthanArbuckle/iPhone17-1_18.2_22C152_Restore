@interface CNPRSPosterConfigurationAttributes
- (CNPRSPosterConfigurationAttributes)initWithCNConfiguration:(id)a3;
- (NSString)extensionIdentifier;
- (PRSPosterConfigurationAttributes)wrappedPosterAttributes;
@end

@implementation CNPRSPosterConfigurationAttributes

- (void).cxx_destruct
{
}

- (PRSPosterConfigurationAttributes)wrappedPosterAttributes
{
  return self->_wrappedPosterAttributes;
}

- (CNPRSPosterConfigurationAttributes)initWithCNConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPRSPosterConfigurationAttributes;
  v5 = [(CNPRSPosterConfigurationAttributes *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc(getPRSPosterConfigurationAttributesClass_64386());
    v7 = [v4 wrappedPosterConfiguration];
    uint64_t v8 = [v6 initWithConfiguration:v7];
    wrappedPosterAttributes = v5->_wrappedPosterAttributes;
    v5->_wrappedPosterAttributes = (PRSPosterConfigurationAttributes *)v8;
  }
  return v5;
}

- (NSString)extensionIdentifier
{
  return (NSString *)[(PRSPosterConfigurationAttributes *)self->_wrappedPosterAttributes extensionIdentifier];
}

@end