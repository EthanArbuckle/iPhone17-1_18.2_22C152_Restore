@interface APPrivacyDisclosureAdapter
- (APPrivacyDisclosureAdapter)initWithPreflightManger:(id)a3;
- (BOOL)applicationRequiresPreflight:(id)a3;
@end

@implementation APPrivacyDisclosureAdapter

- (APPrivacyDisclosureAdapter)initWithPreflightManger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APPrivacyDisclosureAdapter;
  v6 = [(APPrivacyDisclosureAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preflightManager, a3);
  }

  return v7;
}

- (BOOL)applicationRequiresPreflight:(id)a3
{
  return [(PDCPreflightManager *)self->_preflightManager requiresPreflightForApplicationRecord:a3];
}

- (void).cxx_destruct
{
}

@end