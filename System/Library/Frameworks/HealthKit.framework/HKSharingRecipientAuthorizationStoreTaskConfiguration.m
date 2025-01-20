@interface HKSharingRecipientAuthorizationStoreTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (HKSharingRecipientAuthorizationStoreTaskConfiguration)initWithCoder:(id)a3;
- (HKSharingRecipientIdentifier)recipientIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipientIdentifier:(id)a3;
@end

@implementation HKSharingRecipientAuthorizationStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HKSharingRecipientAuthorizationStoreTaskConfiguration);
  [(HKSharingRecipientAuthorizationStoreTaskConfiguration *)v4 setRecipientIdentifier:self->_recipientIdentifier];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharingRecipientAuthorizationStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSharingRecipientAuthorizationStoreTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecipientIdentifier"];
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (HKSharingRecipientIdentifier *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharingRecipientAuthorizationStoreTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_recipientIdentifier, @"RecipientIdentifier", v5.receiver, v5.super_class);
}

- (HKSharingRecipientIdentifier)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end