@interface IPAppStateSource
- (IPAppStateSource)initWithApplicationIdentity:(id)a3;
- (IPAppStateSource)initWithApplicationIdentity:(id)a3 forStateSourceRegistry:(id)a4;
- (id)collationKey;
- (id)currentProgressForSource:(id)a3 error:(id *)a4;
- (id)currentStateWithError:(id *)a3;
- (id)description;
- (id)launchServicesIdentity;
- (id)progressSourceWithError:(id *)a3;
- (unint64_t)installableType;
- (void)noteInstallStarted;
- (void)noteRemoved;
- (void)notifyOfUpdate:(id)a3;
@end

@implementation IPAppStateSource

- (IPAppStateSource)initWithApplicationIdentity:(id)a3
{
  return [(IPAppStateSource *)self initWithApplicationIdentity:a3 forStateSourceRegistry:0];
}

- (IPAppStateSource)initWithApplicationIdentity:(id)a3 forStateSourceRegistry:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPAppStateSource;
  v8 = [(IPInstallableStateSource *)&v11 initWithRegistry:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_appIdentity, a3);
  }

  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { identity: %@ }>", objc_opt_class(), self, self->_appIdentity];
}

- (id)collationKey
{
  return self->_appIdentity;
}

- (unint64_t)installableType
{
  return 1;
}

- (id)currentStateWithError:(id *)a3
{
  uint64_t v5 = [(LSApplicationIdentity *)self->_appIdentity findApplicationRecordFetchingPlaceholder:3 error:0];
  appIdentity = self->_appIdentity;
  id v11 = 0;
  uint64_t v7 = [(LSApplicationIdentity *)appIdentity findApplicationRecordFetchingPlaceholder:0 error:&v11];
  id v8 = v11;
  v9 = 0;
  if (v5 | v7) {
    v9 = [[IPAppState alloc] initWithAppStateSource:self applicationIdentity:self->_appIdentity isInstalling:v5 != 0];
  }
  if (a3 && !v9) {
    *a3 = v8;
  }

  return v9;
}

- (id)progressSourceWithError:(id *)a3
{
  v3 = [[IPInstallableProgressSource alloc] initWithStateSource:self];

  return v3;
}

- (id)launchServicesIdentity
{
  return self->_appIdentity;
}

- (id)currentProgressForSource:(id)a3 error:(id *)a4
{
  v6 = [(IPInstallableStateSource *)self associatedRegistry];
  uint64_t v7 = [v6 currentProgressForIdentity:self->_appIdentity error:a4];

  return v7;
}

- (void)noteInstallStarted
{
  v3 = [[IPAppState alloc] initWithAppStateSource:self applicationIdentity:self->_appIdentity isInstalling:1];
  [(IPAppStateSource *)self notifyOfUpdate:v3];
}

- (void)notifyOfUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(IPInstallableStateSource *)self observer];
  [v5 observationOfSource:self didChangeToState:v4];
}

- (void)noteRemoved
{
  id v3 = [(IPInstallableStateSource *)self observer];
  [v3 observationOfSource:self didEndForReason:2];
}

- (void).cxx_destruct
{
}

@end