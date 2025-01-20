@interface IPInstallableState
- (BOOL)isInstalling;
- (IPInstallableState)initWithStateSource:(id)a3 isInstalling:(BOOL)a4;
- (IPInstallableStateSource)source;
@end

@implementation IPInstallableState

- (IPInstallableState)initWithStateSource:(id)a3 isInstalling:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IPInstallableState;
  v8 = [(IPInstallableState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a3);
    v9->_isInstalling = a4;
  }

  return v9;
}

- (IPInstallableStateSource)source
{
  return (IPInstallableStateSource *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isInstalling
{
  return self->_isInstalling;
}

- (void).cxx_destruct
{
}

@end