@interface HDCPSOperation
- (HDCPSOperation)init;
- (HDCPSOperation)initWithManager:(id)a3 profile:(id)a4;
- (HDClinicalProviderServiceManager)providerServiceManager;
- (HDProfile)profile;
@end

@implementation HDCPSOperation

- (HDCPSOperation)initWithManager:(id)a3 profile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCPSOperation;
  v8 = [(HDCPSOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v7);
    objc_storeWeak((id *)&v9->_providerServiceManager, v6);
  }

  return v9;
}

- (HDCPSOperation)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return self;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDClinicalProviderServiceManager)providerServiceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerServiceManager);

  return (HDClinicalProviderServiceManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerServiceManager);

  objc_destroyWeak((id *)&self->_profile);
}

@end