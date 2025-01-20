@interface CKDPCSManagerMissingIdentitiesContext
- (CKDAccount)account;
- (CKDContainer)container;
- (CKDPCSManagerMissingIdentitiesContext)initWithContainer:(id)a3;
- (NSMutableSet)missingIdentityPublicKeys;
- (NSMutableSet)servicesWithMissingIdentities;
- (id)copyOfMissingIdentityPublicKeys;
- (id)copyOfServicesWithMissingIdentities;
- (void)setAccount:(id)a3;
- (void)setContainer:(id)a3;
- (void)setMissingIdentityPublicKeys:(id)a3;
- (void)setServicesWithMissingIdentities:(id)a3;
@end

@implementation CKDPCSManagerMissingIdentitiesContext

- (CKDPCSManagerMissingIdentitiesContext)initWithContainer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKDPCSManagerMissingIdentitiesContext;
  v5 = [(CKDPCSManagerMissingIdentitiesContext *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_container, v4);
  }

  return v6;
}

- (NSMutableSet)servicesWithMissingIdentities
{
  v2 = self;
  objc_sync_enter(v2);
  servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  if (!servicesWithMissingIdentities)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_servicesWithMissingIdentities;
    v2->_servicesWithMissingIdentities = (NSMutableSet *)v4;

    servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  }
  v6 = servicesWithMissingIdentities;
  objc_sync_exit(v2);

  return v6;
}

- (NSMutableSet)missingIdentityPublicKeys
{
  v2 = self;
  objc_sync_enter(v2);
  missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  if (!missingIdentityPublicKeys)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_missingIdentityPublicKeys;
    v2->_missingIdentityPublicKeys = (NSMutableSet *)v4;

    missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  }
  v6 = missingIdentityPublicKeys;
  objc_sync_exit(v2);

  return v6;
}

- (id)copyOfServicesWithMissingIdentities
{
  v2 = self;
  objc_sync_enter(v2);
  servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  if (!servicesWithMissingIdentities)
  {
    uint64_t v6 = objc_opt_new();
    v7 = v2->_servicesWithMissingIdentities;
    v2->_servicesWithMissingIdentities = (NSMutableSet *)v6;

    servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  }
  objc_super v8 = objc_msgSend_copy(servicesWithMissingIdentities, v3, v4);
  objc_sync_exit(v2);

  return v8;
}

- (id)copyOfMissingIdentityPublicKeys
{
  v2 = self;
  objc_sync_enter(v2);
  missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  if (!missingIdentityPublicKeys)
  {
    uint64_t v6 = objc_opt_new();
    v7 = v2->_missingIdentityPublicKeys;
    v2->_missingIdentityPublicKeys = (NSMutableSet *)v6;

    missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  }
  objc_super v8 = objc_msgSend_copy(missingIdentityPublicKeys, v3, v4);
  objc_sync_exit(v2);

  return v8;
}

- (CKDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void)setServicesWithMissingIdentities:(id)a3
{
}

- (void)setMissingIdentityPublicKeys:(id)a3
{
}

- (CKDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKDContainer *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_missingIdentityPublicKeys, 0);
  objc_storeStrong((id *)&self->_servicesWithMissingIdentities, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end