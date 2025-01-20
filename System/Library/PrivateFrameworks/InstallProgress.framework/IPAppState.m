@interface IPAppState
- (IPAppState)initWithAppStateSource:(id)a3 applicationIdentity:(id)a4 isInstalling:(BOOL)a5;
- (LSApplicationIdentity)launchServicesIdentity;
@end

@implementation IPAppState

- (IPAppState)initWithAppStateSource:(id)a3 applicationIdentity:(id)a4 isInstalling:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IPAppState;
  v10 = [(IPInstallableState *)&v13 initWithStateSource:a3 isInstalling:v5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_launchServicesIdentity, a4);
  }

  return v11;
}

- (LSApplicationIdentity)launchServicesIdentity
{
  return (LSApplicationIdentity *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
}

@end