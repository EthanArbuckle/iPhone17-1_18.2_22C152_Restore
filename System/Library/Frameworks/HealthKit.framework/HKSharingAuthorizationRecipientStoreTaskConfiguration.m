@interface HKSharingAuthorizationRecipientStoreTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (HKSharingAuthorizationRecipientStoreTaskConfiguration)initWithCoder:(id)a3;
- (NSArray)sharingAuthorizations;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSharingAuthorizations:(id)a3;
@end

@implementation HKSharingAuthorizationRecipientStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HKSharingAuthorizationRecipientStoreTaskConfiguration);
  v5 = (void *)[(NSArray *)self->_sharingAuthorizations copy];
  [(HKSharingAuthorizationRecipientStoreTaskConfiguration *)v4 setSharingAuthorizations:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSharingAuthorizationRecipientStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSharingAuthorizationRecipientStoreTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"SharingAuthorizations"];
    sharingAuthorizations = v5->_sharingAuthorizations;
    v5->_sharingAuthorizations = (NSArray *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSharingAuthorizationRecipientStoreTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharingAuthorizations, @"SharingAuthorizations", v5.receiver, v5.super_class);
}

- (NSArray)sharingAuthorizations
{
  return self->_sharingAuthorizations;
}

- (void)setSharingAuthorizations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end