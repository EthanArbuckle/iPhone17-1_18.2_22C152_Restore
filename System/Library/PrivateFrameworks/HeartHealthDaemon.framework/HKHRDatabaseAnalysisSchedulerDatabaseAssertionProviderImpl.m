@interface HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl
- (HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl)initWithProfile:(id)a3 identifier:(id)a4;
- (id)takeAssertionWithError:(id *)a3;
@end

@implementation HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl

- (HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl)initWithProfile:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl;
  v8 = [(HKHRDatabaseAnalysisSchedulerDatabaseAssertionProviderImpl *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = [v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;
  }
  return v9;
}

- (id)takeAssertionWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  id v7 = [v6 takeAccessibilityAssertionWithOwnerIdentifier:self->_identifier timeout:a3 error:300.0];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end