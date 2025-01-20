@interface _EXRemoteViewService
- (BOOL)multipleInstances;
- (BOOL)overridesHostAppearance;
- (_EXExtensionProcessHandle)extensionProcess;
- (_EXRemoteViewService)initWithExtensionProcess:(id)a3 contextToken:(id)a4;
- (id)contextToken;
- (id)identifier;
- (id)multipleInstancesUUID;
- (id)viewControllerClassName;
- (id)xpcServiceNameRoot;
- (int)processIdentifier;
- (void)beginUsing:(id)a3;
- (void)endUsing:(id)a3;
@end

@implementation _EXRemoteViewService

- (_EXRemoteViewService)initWithExtensionProcess:(id)a3 contextToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_EXRemoteViewService;
  v9 = [(_UIRemoteViewService *)&v12 _init];
  v10 = (_EXRemoteViewService *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 2, a3);
    objc_storeStrong((id *)&v10->_contextToken, a4);
  }

  return v10;
}

- (BOOL)overridesHostAppearance
{
  return 0;
}

- (id)identifier
{
  v2 = [(_EXRemoteViewService *)self extensionProcess];
  v3 = [v2 extensionIdentity];
  v4 = [v3 bundleIdentifier];

  return v4;
}

- (id)xpcServiceNameRoot
{
  v2 = [(_EXRemoteViewService *)self extensionProcess];
  v3 = [v2 extensionIdentity];
  v4 = [v3 bundleIdentifier];

  return v4;
}

- (BOOL)multipleInstances
{
  return 0;
}

- (id)multipleInstancesUUID
{
  return 0;
}

- (int)processIdentifier
{
  v2 = [(_EXRemoteViewService *)self extensionProcess];
  int v3 = [v2 pid];

  return v3;
}

- (id)viewControllerClassName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)beginUsing:(id)a3
{
}

- (void)endUsing:(id)a3
{
}

- (id)contextToken
{
  return self->_contextToken;
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return (_EXExtensionProcessHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProcess, 0);

  objc_storeStrong((id *)&self->_contextToken, 0);
}

@end