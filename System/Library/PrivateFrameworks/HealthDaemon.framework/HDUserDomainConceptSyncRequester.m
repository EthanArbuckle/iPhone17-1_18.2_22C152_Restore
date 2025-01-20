@interface HDUserDomainConceptSyncRequester
- (HDUserDomainConceptManager)userDomainConceptManager;
- (HDUserDomainConceptSyncRequester)initWithUserDomainConceptManager:(id)a3;
- (void)_triggerSyncsIfRequiredForReason:(void *)a3 userDomainConcepts:;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDUserDomainConceptSyncRequester

- (HDUserDomainConceptSyncRequester)initWithUserDomainConceptManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 profile];
  v9.receiver = self;
  v9.super_class = (Class)HDUserDomainConceptSyncRequester;
  v6 = [(HDSyncRequester *)&v9 initWithProfile:v5];

  if (v6)
  {
    id v7 = objc_storeWeak((id *)&v6->_userDomainConceptManager, v4);
    [v4 addUserDomainConceptObserver:v6 queue:0];
  }
  return v6;
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (void)_triggerSyncsIfRequiredForReason:(void *)a3 userDomainConcepts:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 profile];
    v8 = [v7 syncIdentityManager];
    objc_super v9 = [v8 currentSyncIdentity];
    v10 = [v9 entity];
    uint64_t v11 = [v10 persistentID];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__HDUserDomainConceptSyncRequester__triggerSyncsIfRequiredForReason_userDomainConcepts___block_invoke;
    v12[3] = &__block_descriptor_40_e29_B16__0__HKUserDomainConcept_8l;
    v12[4] = v11;
    if (objc_msgSend(v6, "hk_containsObjectPassingTest:", v12)) {
      [a1 requestSyncsWithReason:v5];
    }
  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
}

uint64_t __88__HDUserDomainConceptSyncRequester__triggerSyncsIfRequiredForReason_userDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hd_syncEntityIdentity") == *(void *)(a1 + 32)) {
    uint64_t v4 = [v3 canRequestSyncUponInsertion];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDomainConceptManager);

  return (HDUserDomainConceptManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end